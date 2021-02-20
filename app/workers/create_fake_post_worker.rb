class CreateFakePostWorker
  include Sidekiq::Worker

  def perform
    uri = URI('http://web:3000/posts')
    content = Faker::TvShows::SiliconValley.quote
    title = content[0..50]
    body = {
      username: Faker::TvShows::SiliconValley.character,
      title: title,
      content: content,
    }.to_json
    header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }
    Net::HTTP.post(uri, body, header)
  end
end
