Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875C412C1D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405271; cv=none; b=eewTQ2GSn3ovagYmDTbw5tKoIPJ8ebawlj5hyBoAeKyBrd4p/GbigdXIaz078QpSVuQu5kODJSPhPfHQwshtkoqdYyW4OwYcKdSDEKm1XL4hckrLCEgc7KRCKfZ3lMkyu8vGN1PmqsQ3bz5kCyylv0sDmSFJg8PBvV7+ISghIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405271; c=relaxed/simple;
	bh=RjNhyj+EDFt5PCH1yaO2dt0+X3SJtP9HGYhnXl0yaOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DowfN9r0jXuS1d37gXf1XS9A9Xe/UHp35W7wBo4W4hWWxt/6Ly5SqjrWHoD2wJ0cLumoerTHODXMVsf5Epwnr+BpYkTPXp0pNTKr3c6OrCO7YpdlF0jKBhONR07RwuHk2CdlRDe6oR6TTDrDJOEdq1ArutKutsfJJ4oFdQr6nPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyA+nXgH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyA+nXgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785405268; x=1816941268;
  h=date:from:to:cc:subject:message-id;
  bh=RjNhyj+EDFt5PCH1yaO2dt0+X3SJtP9HGYhnXl0yaOg=;
  b=OyA+nXgHBZ8ocMrtkW3HwBwHjksN+G+Ua7tQcg3rPXZvxRbiDZJTdauc
   UZgtE5hvO/csSWb6bFOpPMY1naUsL4r26ZvtoDOetzn1D3ilSp4MhDs00
   MpUoEY4yIoisWR2jBNt7yosaKmostYrw1LFuYEZ9D/1wnwgDGLw16G5R5
   j9mbI73D2E96j29QK+JiHcBmd/wTveHYZkDWgB4lgUrlFVxkHcG011cCX
   1JXBq0MkPS33Zw+K2/4OuZi24plzecdB+3b+ZmMbS5VnBZg3V0zvB6owu
   J2Q7lumHM7LybRSIef6IBLdvh26ywozX3GuDSZel6owL3bSzxHBpD0EJh
   w==;
X-CSE-ConnectionGUID: 1fwZVx38SBOoLwPHAL3C9w==
X-CSE-MsgGUID: Yw72WhK5S8OmtJT/7U44nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86211167"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86211167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:54:28 -0700
X-CSE-ConnectionGUID: +74UMICLRSiDeCeGvjsQww==
X-CSE-MsgGUID: bClgflqYSVW0eOUbTi104A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="257575549"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2026 02:54:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpNT2-00000000gNt-46xG;
	Thu, 30 Jul 2026 09:54:21 +0000
Date: Thu, 30 Jul 2026 17:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 12/23]
 sound/soc/sof/intel/hda-pcm.c:173:66: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202607301714.SqfXqVtn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   15c9b701ada608fc3310f4bc2b3e48cbfec206d3
commit: 589b466c7e51c6929ec3196b362f1feccf32b411 [12/23] ASoC: SOF: ops: Add new platform-specific ops for compress
config: parisc-randconfig-r133-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301714.SqfXqVtn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301714.SqfXqVtn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301714.SqfXqVtn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sof/intel/hda-pcm.c:173:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [usertype] format @@
   sound/soc/sof/intel/hda-pcm.c:173:66: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/sof/intel/hda-pcm.c:173:66: sparse:     got unsigned int [usertype] format

vim +173 sound/soc/sof/intel/hda-pcm.c

   153	
   154	int hda_dsp_compr_hw_params(struct snd_sof_dev *sdev,
   155				    struct snd_compr_stream *cstream,
   156				    struct snd_compr_params *params,
   157				    struct snd_sof_platform_stream_params *platform_params)
   158	{
   159		struct hdac_stream *hstream = cstream->runtime->private_data;
   160		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
   161		struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
   162		struct snd_dma_buffer *dmab;
   163		u32 bits, rate;
   164		int bps;
   165		int ret;
   166	
   167		hstream->cstream = cstream;
   168		dmab = cstream->runtime->dma_buffer_p;
   169	
   170		/* Use correct format based on the used codec */
   171		switch (params->codec.id) {
   172		case SND_AUDIOCODEC_PCM:
 > 173			bps = snd_pcm_format_physical_width(params->codec.format);
   174			break;
   175		case SND_AUDIOCODEC_VORBIS:
   176			bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S16_LE);
   177			break;
   178		case SND_AUDIOCODEC_FLAC:
   179		{
   180			struct snd_dec_flac *dec_flac = &params->codec.options.flac_d;
   181	
   182			if (dec_flac->sample_size == 16)
   183				bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S16_LE);
   184			else
   185				bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32_LE);
   186			break;
   187		}
   188		default:
   189			bps = snd_pcm_format_physical_width(SNDRV_PCM_FORMAT_S32_LE);
   190		}
   191	
   192		if (bps < 0)
   193			return bps;
   194		bits = hda_dsp_get_bits(sdev, bps);
   195		rate = hda_dsp_get_mult_div(sdev, params->codec.sample_rate);
   196	
   197		hstream->format_val = rate | bits | (params->codec.ch_out - 1);
   198		hstream->bufsize = cstream->runtime->buffer_size;
   199		hstream->period_bytes = cstream->runtime->fragment_size;
   200		hstream->no_period_wakeup  = false;
   201	
   202		/* params is not used so pass NULL */
   203		dmab = cstream->runtime->dma_buffer_p;
   204		ret = hda_dsp_stream_hw_params(sdev, hext_stream, dmab, NULL);
   205		if (ret < 0) {
   206			dev_err(sdev->dev, "%s: hdac prepare failed: %d\n", __func__, ret);
   207			return ret;
   208		}
   209	
   210		if (hda)
   211			platform_params->no_ipc_position = hda->no_ipc_position;
   212	
   213		platform_params->stream_tag = hstream->stream_tag;
   214	
   215		return 0;
   216	}
   217	EXPORT_SYMBOL_NS(hda_dsp_compr_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
   218	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
