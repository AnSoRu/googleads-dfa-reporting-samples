#!/usr/bin/env ruby
# Encoding: utf-8
#
# Author:: api.jimper@gmail.com (Jonathon Imperiosi)
#
# Copyright:: Copyright 2015, Google Inc. All Rights Reserved.
#
# License:: Licensed under the Apache License, Version 2.0 (the "License");
#           you may not use this file except in compliance with the License.
#           You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#           Unless required by applicable law or agreed to in writing, software
#           distributed under the License is distributed on an "AS IS" BASIS,
#           WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
#           implied.
#           See the License for the specific language governing permissions and
#           limitations under the License.
#
# This example creates a placement strategy with the given name.
#
# Tags: placementStrategies.insert

require_relative 'dfareporting_utils'

def create_placement_strategy(dfareporting, args)
  # Create a new placement strategy resource to insert
  strategy = {
    :name => 'Example Placement Strategy',
  }

  # Insert the placement strategy
  result = dfareporting.placement_strategies.insert(
    :profileId => args[:profile_id]
  ).body(strategy).execute()

  # Display results
  puts 'Created placement strategy with ID %d and name "%s".' %
      [result.data.id, result.data.name]
end

if __FILE__ == $0
  # Retrieve command line arguments
  args = DfaReportingUtils.get_arguments(ARGV, :profile_id)

  # Authenticate and initialize API service
  dfareporting = DfaReportingUtils.setup()

  create_placement_strategy(dfareporting, args)
end
