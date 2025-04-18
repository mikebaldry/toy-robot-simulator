FROM ruby:3.4.2

WORKDIR /app
COPY Gemfile Gemfile.lock ./

RUN bundle install
COPY . .

CMD ["ruby", "main.rb"]