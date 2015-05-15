#!/usr/bin/env ruby
# Encoding: utf-8
#
# Author:: api.jimper@gmail.com (Jonathon Imperiosi)
#
# Copyright:: Copyright 2013, Google Inc. All Rights Reserved.
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
# This example illustrates how to delete a report.
#
# Tags: reports.delete

require_relative 'dfareporting_utils'

def delete_report(dfareporting, args)
  # Delete the report
  dfareporting.reports.delete(
    :profileId => args[:profile_id],
    :reportId => args[:report_id]
  ).execute()

  puts 'Successfully deleted report with ID %d.' % [args[:report_id]]
end

if __FILE__ == $0
  # Retrieve command line arguments
  args = DfaReportingUtils.get_arguments(ARGV, :profile_id, :report_id)

  # Authenticate and initialize API service
  dfareporting = DfaReportingUtils.setup()

  delete_report(dfareporting, args)
end
