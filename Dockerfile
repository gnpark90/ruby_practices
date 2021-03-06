FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /Users/park/Documents/project/ruby_practices
COPY Gemfile /Users/park/Documents/project/ruby_practices/Gemfile
COPY Gemfile.lock /Users/park/Documents/project/ruby_practices/Gemfile.lock
RUN bundle install
COPY . /Users/park/Documents/project/ruby_practices

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
