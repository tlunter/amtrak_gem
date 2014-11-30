require 'spec_helper'

describe Amtrak do
  context '.get' do
    let(:from) { 'pvd' }
    let(:to) { 'bby' }
    let(:date) { Date.parse('Fri, Nov 28, 2014') }
    let(:output) { described_class.get(from, to, date: date) }
    let(:expected) {
      [
        {
          :number=>66,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"6:56 am",
            :estimated_time=>"6:57 am"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"7:53 am",
            :estimated_time=>"8:25 am"
          }
        },
        {
          :number=>2190,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"9:18 am",
            :estimated_time=>"9:28 am"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"9:59 am",
            :estimated_time=>"10:00 am"
          }
        },
        {
          :number=>190,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"10:17 am",
            :estimated_time=>"10:25 am"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"10:59 am",
            :estimated_time=>"11:07 am"
          }
        },
        {
          :number=>2192,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"",
            :scheduled_time=>"10:56 am",
            :estimated_time=>""
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"",
            :scheduled_time=>"11:34 am",
            :estimated_time=>""
          }
        },
        {
          :number=>170,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"11:58 am",
            :estimated_time=>"12:44 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"12:39 pm",
            :estimated_time=>"1:14 pm"
          }
        },
        {
          :number=>2154,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"12:55 pm",
            :estimated_time=>"1:03 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"1:34 pm",
            :estimated_time=>"1:34 pm"
          }
        },
        {
          :number=>172,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"2:23 pm",
            :estimated_time=>"2:36 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"3:09 pm",
            :estimated_time=>"3:12 pm"
          }
        },
        {
          :number=>2158,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"2:54 pm",
            :estimated_time=>"3:03 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"3:36 pm",
            :estimated_time=>"3:32 pm"
          }
        },
        {
          :number=>86,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"3:47 pm",
            :estimated_time=>"3:47 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"4:28 pm",
            :estimated_time=>"4:20 pm"
          }
        },
        {
          :number=>174,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"5:30 pm",
            :estimated_time=>"5:35 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"6:25 pm",
            :estimated_time=>"6:26 pm"
          }
        },
        {
          :number=>2164,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"5:50 pm",
            :estimated_time=>"6:01 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"6:34 pm",
            :estimated_time=>"6:34 pm"
          }
        },
        {
          :number=>176,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"7:19 pm",
            :estimated_time=>"7:20 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"8:06 pm",
            :estimated_time=>"7:52 pm"
          }
        },
        {
          :number=>2168,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"7:56 pm",
            :estimated_time=>"8:00 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"8:38 pm",
            :estimated_time=>"8:44 pm"
          }
        },
        {
          :number=>94,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"9:16 pm",
            :estimated_time=>"9:47 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"10:02 pm",
            :estimated_time=>"10:19 pm"
          }
        },
        {
          :number=>2172,
          :departure=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"9:54 pm",
            :estimated_time=>"9:59 pm"
          },
          :arrival=>{
            :scheduled_date=>"Fri Nov 28, 2014",
            :estimated_date=>"Fri Nov 28, 2014",
            :scheduled_time=>"10:35 pm",
            :estimated_time=>"10:39 pm"
          }
        }
      ]
    }

    it 'returns a list of train times', :vcr do
      expect(output).to eq(expected)
    end
  end
end
