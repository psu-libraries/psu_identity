# frozen_string_literal: true

require 'spec_helper'
require 'support/vcr'

RSpec.describe PsuIdentity::DirectoryService::Client do
  let(:client) { described_class.new }

  describe '#userid', vcr: { allow_playback_repeats: true } do
    context 'when the person exists at Penn State' do
      let(:results) { client.userid('djb44') }

      it 'returns items' do
        expect(results.psuid).to eq('99999999')
        expect(results.orc_id).to eq('https://orcid.org/0000-0003-2691-3206')
        expect(results.ps_hours).to be_nil
      end
    end

    context 'when the person does NOT exist at Penn State' do
      it 'raises an error' do
        expect { client.userid('cam156') }.to raise_error(PsuIdentity::DirectoryService::NotFound)
      end
    end

    context 'when the userid argument is nil or an empty string' do
      it 'raises an error' do
        expect { client.userid(nil) }.to raise_error(PsuIdentity::DirectoryService::NotFound)
        expect { client.userid('') }.to raise_error(PsuIdentity::DirectoryService::NotFound)
        expect { client.userid(' ') }.to raise_error(PsuIdentity::DirectoryService::NotFound)
      end
    end
  end
end
