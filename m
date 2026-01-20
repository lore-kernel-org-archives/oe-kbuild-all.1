Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4223A99E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768879055; cv=none; b=PixT2lEQQz+sULTYMv0FD33CiQw6Wq/iF8iMG7aEqvpR+r/h3a1OHHN2+QW+CJxIIi+/ghpP7eXpTHtG05odKsStmXhNpLA4zKsJ7X6WLRi2Hm9o5A3FkX26x0EB9AvsD3F60Zeu1/o25QUNOwtISDhpW/6sjy3KfOFwdj4Iw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768879055; c=relaxed/simple;
	bh=6gE3BlXiMQRBNWdd03oljUFroWcIGyoXYhxb1daXCc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nWnlTXZ67KuC6U6H9H1uGZQSIlWFgu8/rrDNKtE1IF4d6pOvr9Czw3K9k32dtvg+96VpOkI8+zZRFgQBxKok3/PoM4AB0pAR/NBG7fnBlwnB9OmUm8CL9PgdwsXfBfnNWsWFfh0h4+fgCgiqR3JmDMeYVrMGPvgPfzaLSWOvlvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCM0pA6E; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCM0pA6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768879054; x=1800415054;
  h=date:from:to:cc:subject:message-id;
  bh=6gE3BlXiMQRBNWdd03oljUFroWcIGyoXYhxb1daXCc8=;
  b=KCM0pA6EatUbVhOCPKRrH1GBwSIcpff+yTTQFm2kN+gcHYuQ0cnO/Ygd
   j1gLsqLffcHndpMci650OuAsUczlUjm0umG/KbIj20Ot3QjFKygIKj5Dn
   b5qyvh44SqdBwx08HjfqEXLB7NvkW0ryMAYS3dHUBiE+EOD9upJcI+Y0Z
   iHKSmCwIlM653IjD2h9Lccd28DcLOy6sLXrg85epDRT+QJ1SRKUkcCsXc
   whSG/Fl5YefEKhre7rM7ZqTJAnJq/tv1OIebI5ndyi/eSK+5ClKOMi1d5
   2C1TQoV2KnXP65H8v7rOm2cPHd3cQD4S62DvfEuJcK5kvgzFxC3Xd+es6
   Q==;
X-CSE-ConnectionGUID: dBJgkpG9Rna7pW9iS8y/Lg==
X-CSE-MsgGUID: DU9sMGSURsmntpFPNcu8ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70170359"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="70170359"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 19:17:33 -0800
X-CSE-ConnectionGUID: FzoRwyXmTBiXS5GC8dOoYw==
X-CSE-MsgGUID: F8qGuwUhRtyEgzBXf4yddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="228929964"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 19:17:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi2FF-00000000OW9-1mhr;
	Tue, 20 Jan 2026 03:17:29 +0000
Date: Tue, 20 Jan 2026 11:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: sound/soc/intel/avs/probes.c:147:58: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202601201132.fPZ7fz6Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 64007ad3e2a0e0a0ded8b2c6a72c0bb7883d3a33 ASoC: Intel: avs: Use snd_codec format when initializing probe
date:   3 months ago
config: i386-randconfig-r132-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201132.fPZ7fz6Z-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201132.fPZ7fz6Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201132.fPZ7fz6Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/intel/avs/probes.c:147:58: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [usertype] format @@
   sound/soc/intel/avs/probes.c:147:58: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/intel/avs/probes.c:147:58: sparse:     got unsigned int [usertype] format

vim +147 sound/soc/intel/avs/probes.c

   128	
   129	static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
   130					      struct snd_compr_params *params, struct snd_soc_dai *dai)
   131	{
   132		struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
   133		struct snd_compr_runtime *rtd = cstream->runtime;
   134		struct avs_dev *adev = to_avs_dev(dai->dev);
   135		unsigned int format_val;
   136		int bps, ret;
   137	
   138		hdac_stream(host_stream)->bufsize = 0;
   139		hdac_stream(host_stream)->period_bytes = 0;
   140		hdac_stream(host_stream)->format_val = 0;
   141		cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
   142		cstream->dma_buffer.dev.dev = adev->dev;
   143	
   144		ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
   145		if (ret < 0)
   146			return ret;
 > 147		bps = snd_pcm_format_physical_width(params->codec.format);
   148		if (bps < 0)
   149			return bps;
   150		format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
   151		ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
   152		if (ret < 0)
   153			return ret;
   154		ret = snd_hdac_stream_setup(hdac_stream(host_stream), false);
   155		if (ret < 0)
   156			return ret;
   157	
   158		hdac_stream(host_stream)->prepared = 1;
   159	
   160		if (!adev->num_probe_streams) {
   161			union avs_connector_node_id node_id;
   162	
   163			/* D0ix not allowed during probing. */
   164			ret = avs_dsp_disable_d0ix(adev);
   165			if (ret)
   166				return ret;
   167	
   168			node_id.vindex = hdac_stream(host_stream)->stream_tag - 1;
   169			node_id.dma_type = AVS_DMA_HDA_HOST_INPUT;
   170	
   171			ret = avs_dsp_init_probe(adev, params, bps, node_id, rtd->dma_bytes);
   172			if (ret < 0) {
   173				dev_err(dai->dev, "probe init failed: %d\n", ret);
   174				avs_dsp_enable_d0ix(adev);
   175				return ret;
   176			}
   177		}
   178	
   179		adev->num_probe_streams++;
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
