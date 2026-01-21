Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1FF238C1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 00:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768955475; cv=none; b=Uj2/TCxfslFbagzuzJT8qOY7xjyejUIYf3GRZ9EcsEZS03p0MqdW9YUjsVfPClJAbyEy2Wd2GnFTi2IOlB5+5WanYaxoSZnivSJpYp4T49FxhIFIwokT8gKFCGHCMppjq81LM0bXXTyIugVHP0hn0Unwk5qvyeamCtk4q6d9tH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768955475; c=relaxed/simple;
	bh=2O+USvvqiKU6K0PDQIxuz1UpYEDL/FcrzX60/qxuBnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tl5/nSrxwn4ehzufHaumUtxMAgu5RkNkdjHVV6fANZnGaKo+c9cPZqCo/BT5D3QumR7J2sN85iGn8puxdDJdEAAEfU7RuWMZZspuO2G5F8RnzEXT/tGfIWC9n7OcIZOho4akyhcWYzj+Ky2hvwx9wIn4ooz3fT71fteVxaeuMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHrK53Cj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHrK53Cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768955474; x=1800491474;
  h=date:from:to:cc:subject:message-id;
  bh=2O+USvvqiKU6K0PDQIxuz1UpYEDL/FcrzX60/qxuBnQ=;
  b=MHrK53Cj3DURmEW+Ywl6WeB0tPAu10TmkXuM768gAXNU2Hj5t7eCB7Jt
   0X4dbB9VYtXEs0J/FE1Kh3s+YjKgQWIsCZ7foCbOi8C/hHGonmGLfNsRe
   +eWggzrbQPAlEQkoQ7V6Am4WAMX9Llpw8Db4UEHz5ICNdZlfQFYlHKjDy
   68Y+PGZ3vjkZqsas+lm+P/PTGRe3mK6eHzZNFVbeV/ML1Jf5QWSxPmcpN
   AJ+LaZdkGoOB2FTuCvwW+U8IcHq/1Xd2K7VNhVGB8DBz5r7Kw85CaC3Xa
   Lqf3p18SL9mtUNw7pLskQsmL3xj173sawQWnONqU+UzPcMXXbFGimGiGB
   w==;
X-CSE-ConnectionGUID: wWawJ7DiTa6zn1lAXkXg6w==
X-CSE-MsgGUID: WxBiubARSeGXoiaLsxQUXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92844551"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="92844551"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 16:31:14 -0800
X-CSE-ConnectionGUID: eQ/6cqEESIGdSl+HvAEROg==
X-CSE-MsgGUID: FRqJ+NnIQBy9Lhl3gKHidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210772068"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2026 16:31:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viM7p-00000000PkB-1rYz;
	Wed, 21 Jan 2026 00:31:09 +0000
Date: Wed, 21 Jan 2026 08:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 sound/usb/qcom/qc_audio_offload.c:950:27: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202601210855.1XJ0XJFl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   406593924bc6e46a9b9f27a31a90d141f9d71f21
commit: 5ca8b64d16a77fedf6e4659f9affe8d1178933ff [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: mips-randconfig-r132-20260121 (https://download.01.org/0day-ci/archive/20260121/202601210855.1XJ0XJFl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210855.1XJ0XJFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210855.1XJ0XJFl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/qcom/qc_audio_offload.c:950:27: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [usertype] pcm_format @@
   sound/usb/qcom/qc_audio_offload.c:950:27: sparse:     expected unsigned int val
   sound/usb/qcom/qc_audio_offload.c:950:27: sparse:     got restricted snd_pcm_format_t [usertype] pcm_format

vim +950 sound/usb/qcom/qc_audio_offload.c

326bbc348298ab Wesley Cheng 2025-04-09   919  
326bbc348298ab Wesley Cheng 2025-04-09   920  /**
326bbc348298ab Wesley Cheng 2025-04-09   921   * enable_audio_stream() - enable usb snd endpoints
326bbc348298ab Wesley Cheng 2025-04-09   922   * @subs: usb substream
326bbc348298ab Wesley Cheng 2025-04-09   923   * @pcm_format: pcm format requested
326bbc348298ab Wesley Cheng 2025-04-09   924   * @channels: number of channels
326bbc348298ab Wesley Cheng 2025-04-09   925   * @cur_rate: sample rate
326bbc348298ab Wesley Cheng 2025-04-09   926   * @datainterval: interval
326bbc348298ab Wesley Cheng 2025-04-09   927   *
326bbc348298ab Wesley Cheng 2025-04-09   928   * Opens all USB SND endpoints used for the data interface.  This will increment
326bbc348298ab Wesley Cheng 2025-04-09   929   * the USB SND endpoint's opened count.  Requests to keep the interface resumed
326bbc348298ab Wesley Cheng 2025-04-09   930   * until the audio stream is stopped.  Will issue the USB set interface control
326bbc348298ab Wesley Cheng 2025-04-09   931   * message to enable the data interface.
326bbc348298ab Wesley Cheng 2025-04-09   932   *
326bbc348298ab Wesley Cheng 2025-04-09   933   */
326bbc348298ab Wesley Cheng 2025-04-09   934  static int enable_audio_stream(struct snd_usb_substream *subs,
326bbc348298ab Wesley Cheng 2025-04-09   935  			       snd_pcm_format_t pcm_format,
326bbc348298ab Wesley Cheng 2025-04-09   936  			       unsigned int channels, unsigned int cur_rate,
326bbc348298ab Wesley Cheng 2025-04-09   937  			       int datainterval)
326bbc348298ab Wesley Cheng 2025-04-09   938  {
326bbc348298ab Wesley Cheng 2025-04-09   939  	struct snd_pcm_hw_params params;
326bbc348298ab Wesley Cheng 2025-04-09   940  	struct snd_usb_audio *chip;
326bbc348298ab Wesley Cheng 2025-04-09   941  	struct snd_interval *i;
326bbc348298ab Wesley Cheng 2025-04-09   942  	struct snd_mask *m;
326bbc348298ab Wesley Cheng 2025-04-09   943  	int ret;
326bbc348298ab Wesley Cheng 2025-04-09   944  
326bbc348298ab Wesley Cheng 2025-04-09   945  	chip = subs->stream->chip;
326bbc348298ab Wesley Cheng 2025-04-09   946  
326bbc348298ab Wesley Cheng 2025-04-09   947  	_snd_pcm_hw_params_any(&params);
326bbc348298ab Wesley Cheng 2025-04-09   948  
326bbc348298ab Wesley Cheng 2025-04-09   949  	m = hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT);
326bbc348298ab Wesley Cheng 2025-04-09  @950  	snd_mask_leave(m, pcm_format);
326bbc348298ab Wesley Cheng 2025-04-09   951  
326bbc348298ab Wesley Cheng 2025-04-09   952  	i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_CHANNELS);
326bbc348298ab Wesley Cheng 2025-04-09   953  	snd_interval_setinteger(i);
326bbc348298ab Wesley Cheng 2025-04-09   954  	i->min = channels;
326bbc348298ab Wesley Cheng 2025-04-09   955  	i->max = channels;
326bbc348298ab Wesley Cheng 2025-04-09   956  
326bbc348298ab Wesley Cheng 2025-04-09   957  	i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE);
326bbc348298ab Wesley Cheng 2025-04-09   958  	snd_interval_setinteger(i);
326bbc348298ab Wesley Cheng 2025-04-09   959  	i->min = cur_rate;
326bbc348298ab Wesley Cheng 2025-04-09   960  	i->max = cur_rate;
326bbc348298ab Wesley Cheng 2025-04-09   961  
326bbc348298ab Wesley Cheng 2025-04-09   962  	pm_runtime_barrier(&chip->intf[0]->dev);
326bbc348298ab Wesley Cheng 2025-04-09   963  	snd_usb_autoresume(chip);
326bbc348298ab Wesley Cheng 2025-04-09   964  
326bbc348298ab Wesley Cheng 2025-04-09   965  	ret = snd_usb_hw_params(subs, &params);
326bbc348298ab Wesley Cheng 2025-04-09   966  	if (ret < 0)
326bbc348298ab Wesley Cheng 2025-04-09   967  		goto put_suspend;
326bbc348298ab Wesley Cheng 2025-04-09   968  
326bbc348298ab Wesley Cheng 2025-04-09   969  	if (!atomic_read(&chip->shutdown)) {
aff8436ed97b99 Takashi Iwai 2025-08-11   970  		CLASS(snd_usb_lock, pm)(chip);
aff8436ed97b99 Takashi Iwai 2025-08-11   971  		if (pm.err < 0) {
aff8436ed97b99 Takashi Iwai 2025-08-11   972  			ret = pm.err;
326bbc348298ab Wesley Cheng 2025-04-09   973  			goto detach_ep;
aff8436ed97b99 Takashi Iwai 2025-08-11   974  		}
326bbc348298ab Wesley Cheng 2025-04-09   975  
326bbc348298ab Wesley Cheng 2025-04-09   976  		if (subs->sync_endpoint) {
326bbc348298ab Wesley Cheng 2025-04-09   977  			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
326bbc348298ab Wesley Cheng 2025-04-09   978  			if (ret < 0)
aff8436ed97b99 Takashi Iwai 2025-08-11   979  				goto detach_ep;
326bbc348298ab Wesley Cheng 2025-04-09   980  		}
326bbc348298ab Wesley Cheng 2025-04-09   981  
326bbc348298ab Wesley Cheng 2025-04-09   982  		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
326bbc348298ab Wesley Cheng 2025-04-09   983  		if (ret < 0)
aff8436ed97b99 Takashi Iwai 2025-08-11   984  			goto detach_ep;
326bbc348298ab Wesley Cheng 2025-04-09   985  
326bbc348298ab Wesley Cheng 2025-04-09   986  		dev_dbg(uaudio_qdev->data->dev,
326bbc348298ab Wesley Cheng 2025-04-09   987  			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
326bbc348298ab Wesley Cheng 2025-04-09   988  			subs->direction ? "capture" : "playback",
326bbc348298ab Wesley Cheng 2025-04-09   989  			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
326bbc348298ab Wesley Cheng 2025-04-09   990  			(1 << subs->cur_audiofmt->datainterval) *
326bbc348298ab Wesley Cheng 2025-04-09   991  			(subs->dev->speed >= USB_SPEED_HIGH ?
326bbc348298ab Wesley Cheng 2025-04-09   992  			BUS_INTERVAL_HIGHSPEED_AND_ABOVE :
326bbc348298ab Wesley Cheng 2025-04-09   993  			BUS_INTERVAL_FULL_SPEED));
326bbc348298ab Wesley Cheng 2025-04-09   994  	}
326bbc348298ab Wesley Cheng 2025-04-09   995  
326bbc348298ab Wesley Cheng 2025-04-09   996  	return 0;
326bbc348298ab Wesley Cheng 2025-04-09   997  
326bbc348298ab Wesley Cheng 2025-04-09   998  detach_ep:
326bbc348298ab Wesley Cheng 2025-04-09   999  	snd_usb_hw_free(subs);
326bbc348298ab Wesley Cheng 2025-04-09  1000  
326bbc348298ab Wesley Cheng 2025-04-09  1001  put_suspend:
326bbc348298ab Wesley Cheng 2025-04-09  1002  	snd_usb_autosuspend(chip);
326bbc348298ab Wesley Cheng 2025-04-09  1003  
326bbc348298ab Wesley Cheng 2025-04-09  1004  	return ret;
326bbc348298ab Wesley Cheng 2025-04-09  1005  }
326bbc348298ab Wesley Cheng 2025-04-09  1006  

:::::: The code at line 950 was first introduced by commit
:::::: 326bbc348298ab0946c5560defe024a5f6ef28bb ALSA: usb-audio: qcom: Introduce QC USB SND offloading support

:::::: TO: Wesley Cheng <quic_wcheng@quicinc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
