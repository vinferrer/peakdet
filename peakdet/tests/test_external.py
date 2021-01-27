# -*- coding: utf-8 -*-

import pytest
from peakdet import external
from peakdet.tests import utils as testutils

DATA = testutils.get_test_data_path('rtpeaks.csv')

@pytest.mark.xfail
def test_load_rtpeaks():
    for channel in [1, 2, 9]:
        with pytest.warns(UserWarning):
            hist = dict(fname=DATA, channel=channel, fs=1000.)
            phys = external.load_rtpeaks(DATA, channel=channel, fs=1000.)
            assert phys.history == [('load_rtpeaks', hist)]
            assert phys.fs == 1000.
            with pytest.raises(ValueError):
                external.load_rtpeaks(testutils.get_test_data_path('ECG.csv'),
                                      channel=channel, fs=1000.)
