Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1C378815
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 04:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534563; cv=none; b=WGOZiq3n9zmIztj10TLzU+bP7bv3vSwKd03nFh9cbvsN58u+HWX7LgyovuesaHis2YSF/NUk1ScoaORMxfqZIU+adAyb6qogDsBVhSNgWfBMvf+YPFelCWVK/orolNpCBl6Z8yXQjcaQytZRfZanuh+6heYUYGZEYfRs3Z6RoDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534563; c=relaxed/simple;
	bh=8/X2ZqnXRbaL6KQXGBTI7aEUWXop8VK2JF5z4omVvBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y6bfoZsxS4HoftB82ZeNpl4rZ7HDqt3jl4l53HxmHgFm1p9hBl1jMz9zSxqKCxXlGo0SMS9wseM5fLBMTiJ1qFzp5cXepqrq5s1vhzgglpWWmdiids+nX0Paoe0heK7xpqFVGaqC7TbV6ElgB1HJoM1+/3fCgl/Iw/tFhvpx7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fv/YAwz8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fv/YAwz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534562; x=1807070562;
  h=date:from:to:cc:subject:message-id;
  bh=8/X2ZqnXRbaL6KQXGBTI7aEUWXop8VK2JF5z4omVvBo=;
  b=fv/YAwz82lS+BUWYnkzimZOaTT96KKWzbAN85ibd73v+GTI61PX1iQwA
   LcspUO5jmX0iFky/j/twtsLalNUPh2+Jo+oCPiKwWHYVARU2PDWv/yCtS
   eafx6xPQlnUDp9T8k3n0+aMkqaNfNBLGQlL3fsyxh4kNBvJ9DhfgxyKe/
   xYIvnIDazATWYb4s4lvTSg7IlKo6m9j8v/twLJmZlOztayZaLYRgBGc2b
   +QmCnpfYiejwuyBkI/apSULCvYxIiKUDcgX669hhheP2hhfQ1Eb/88i8j
   915Iicp0qlQKgAT4iiCCDalar2OjQXiJR+v4IgQBlh/sQ4wkF5qCIf1fx
   g==;
X-CSE-ConnectionGUID: z+WHEcNtTKCthiUE3SPiKA==
X-CSE-MsgGUID: izb+kWr/SzKIafMqd1fWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386036"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:38 -0700
X-CSE-ConnectionGUID: zskxbM/fRWaksuRzbI2wzA==
X-CSE-MsgGUID: qlNikEWDSWy1091dnhOOXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957167"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-0000000008L-46yF;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 07 Apr 2026 12:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/usb/qcom/qc_audio_offload.c:943:27: sparse: sparse:
 incorrect type in argument 2 (different base types)
Message-ID: <202604062109.Oxi8JjWW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   591cd656a1bf5ea94a222af5ef2ee76df029c1d2
commit: 326bbc348298ab0946c5560defe024a5f6ef28bb ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
date:   12 months ago
config: hexagon-randconfig-r134-20260406 (https://download.01.org/0day-ci/archive/20260406/202604062109.Oxi8JjWW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604062109.Oxi8JjWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604062109.Oxi8JjWW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/qcom/qc_audio_offload.c:943:27: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [usertype] pcm_format @@
   sound/usb/qcom/qc_audio_offload.c:943:27: sparse:     expected unsigned int val
   sound/usb/qcom/qc_audio_offload.c:943:27: sparse:     got restricted snd_pcm_format_t [usertype] pcm_format

vim +943 sound/usb/qcom/qc_audio_offload.c

   912	
   913	/**
   914	 * enable_audio_stream() - enable usb snd endpoints
   915	 * @subs: usb substream
   916	 * @pcm_format: pcm format requested
   917	 * @channels: number of channels
   918	 * @cur_rate: sample rate
   919	 * @datainterval: interval
   920	 *
   921	 * Opens all USB SND endpoints used for the data interface.  This will increment
   922	 * the USB SND endpoint's opened count.  Requests to keep the interface resumed
   923	 * until the audio stream is stopped.  Will issue the USB set interface control
   924	 * message to enable the data interface.
   925	 *
   926	 */
   927	static int enable_audio_stream(struct snd_usb_substream *subs,
   928				       snd_pcm_format_t pcm_format,
   929				       unsigned int channels, unsigned int cur_rate,
   930				       int datainterval)
   931	{
   932		struct snd_pcm_hw_params params;
   933		struct snd_usb_audio *chip;
   934		struct snd_interval *i;
   935		struct snd_mask *m;
   936		int ret;
   937	
   938		chip = subs->stream->chip;
   939	
   940		_snd_pcm_hw_params_any(&params);
   941	
   942		m = hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT);
 > 943		snd_mask_leave(m, pcm_format);
   944	
   945		i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_CHANNELS);
   946		snd_interval_setinteger(i);
   947		i->min = channels;
   948		i->max = channels;
   949	
   950		i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE);
   951		snd_interval_setinteger(i);
   952		i->min = cur_rate;
   953		i->max = cur_rate;
   954	
   955		pm_runtime_barrier(&chip->intf[0]->dev);
   956		snd_usb_autoresume(chip);
   957	
   958		ret = snd_usb_hw_params(subs, &params);
   959		if (ret < 0)
   960			goto put_suspend;
   961	
   962		if (!atomic_read(&chip->shutdown)) {
   963			ret = snd_usb_lock_shutdown(chip);
   964			if (ret < 0)
   965				goto detach_ep;
   966	
   967			if (subs->sync_endpoint) {
   968				ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
   969				if (ret < 0)
   970					goto unlock;
   971			}
   972	
   973			ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
   974			if (ret < 0)
   975				goto unlock;
   976	
   977			snd_usb_unlock_shutdown(chip);
   978	
   979			dev_dbg(uaudio_qdev->data->dev,
   980				"selected %s iface:%d altsetting:%d datainterval:%dus\n",
   981				subs->direction ? "capture" : "playback",
   982				subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
   983				(1 << subs->cur_audiofmt->datainterval) *
   984				(subs->dev->speed >= USB_SPEED_HIGH ?
   985				BUS_INTERVAL_HIGHSPEED_AND_ABOVE :
   986				BUS_INTERVAL_FULL_SPEED));
   987		}
   988	
   989		return 0;
   990	
   991	unlock:
   992		snd_usb_unlock_shutdown(chip);
   993	
   994	detach_ep:
   995		snd_usb_hw_free(subs);
   996	
   997	put_suspend:
   998		snd_usb_autosuspend(chip);
   999	
  1000		return ret;
  1001	}
  1002	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
