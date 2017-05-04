class PostResultsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def add
    body = JSON.parse(request.body.read)

    group = Group.where(name: body['group']).take

    if (group.nil?)
      render json: {
        status: 500,
        message: 'Group not found'
      }.to_json
      return
    end

    competitor = getCompetitor(body['competitor'], group)

    if (competitor.nil?)
      render json: {
        status: 500,
        message: 'Server error while finding competitor'
      }.to_json
      return
    end

    body['laps'].each.with_index(1) do |laptime, lapnumber|
      lap = Laptime.where(lap_number: lapnumber, competitor: competitor).take

      if (lap)
        next
      else
        lap = Laptime.create(lap_number: lapnumber, competitor: competitor, laptime: laptime[1])

        if (lap)
          next
        else
          render json: {
            status: 500,
            message: 'Server error, not able to create lap'
          }.to_json
          return
        end
      end
    end

    render json: {
      status: 200,
      message: 'Laps updated'
    }.to_json
    return
  end

  def deleteAll
    #muna að breyta í 2007
    Competitor.all.each do |competitor|
      competitor.laptimes.delete_all
      competitor.delete
    end
    ##
    render json: {
      status: 200,
      message: 'All deleted'
    }.to_json
    return
  end

  def deleteOne
    body = JSON.parse(request.body.read)

    if (body['competitor'].present? && body['lapnumber'].present?)
      competitor = Competitor.where(name: body['competitor']).take
      if (competitor.nil?)
        render json: {
          status: 500,
          message: 'Server error while finding competitor'
        }.to_json
        return
      end

      lap = Laptime.where(lap_number: body["lapnumber"], competitor: competitor).take

      if (lap.nil?)
        render json: {
          status: 500,
          message: 'Server error while finding lap'
        }.to_json
        return
      end

      lap.delete


      render json: {
        status: 200,
        message: 'Lap deleted'
      }.to_json
      return

    else
      render json: {
        status: 500,
        message: 'Competitor not found'
      }.to_json
      return
    end
  end

  private

  def getCompetitor(team, group)
    competitor = Competitor.where(name: team['name'], year: team['year']).take

    if (competitor.nil?)
      competitor = Competitor.create(
        name: team['name'],
        group: group,
        place_in_group: team['place_in_group'],
        laps: team['laps'],
        finish_time: team['finish_time'],
        total_time: team['total_time'],
        year: team['year']
      );
    else
      competitor.update(
        place_in_group: team['place_in_group'],
        laps: team['laps'],
        finish_time: team['finish_time'],
        total_time: team['total_time'],
      );
    end

    return competitor
  end
end
