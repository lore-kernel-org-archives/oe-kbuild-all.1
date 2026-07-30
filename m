Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B64426EAD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420628; cv=none; b=ur1/5jMvJPu+NxAQISeqzvnAjo2dVo55pZ3XA/M8/Zwt5aebQhx4cty06o7X0yN27ZWNOeWW01uF2yyumGentYmzkOjzuM5vmX94Ek5z4Th9FDSxPZUmI2Bu1s7UogNvYGkO/T3MfkWOve1Ix+YnKwQyieIYweszd8Z66ZRxWwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420628; c=relaxed/simple;
	bh=wPn7897NwDZWeLmH+OsufUIJNRMqOKCHoIwzaCFkiR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B3RadePfe6h852IEG6TbV1OHh7CzkrAapt+dWVnkUPAt/jzKQ3NgTVjLAI07L0k7HF5P3mF96Q47UQ8u9VrH91421EmHzTW4AN2vAoDy4pzMkLwje9Xgk7EvEJ+n7kdGwvPL/+ycZN1Bvssyjzg0N8A173mdDMXcqhsOWFoSOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhxdspU/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhxdspU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785420623; x=1816956623;
  h=date:from:to:cc:subject:message-id;
  bh=wPn7897NwDZWeLmH+OsufUIJNRMqOKCHoIwzaCFkiR8=;
  b=DhxdspU/FvlPhfjPazQmlbXtExeYjFaAs3X5lzAlBApywVlUic5OFqMr
   jMrfFaJ13fZHMWUlk2E7w2yQVSQJRv6l6/jp0w5rWf+w6Dmw+aM4SeWSu
   Hnc2RXTz0/IbKAZwj3cVu0OxlOjn7TKgof3x/8A3T15ofrvbAh5/YZJY6
   LxigWRIVtWX4jR9XuTVN4TS8p7BrsQNCN5EnEggr4Hxnj3IdUSH6gwIOS
   u32HZ9bZVml5GB6GeAjImraTiSEUPwCGHfTevWZPELx6++D+OQhG5jzuO
   W46LsugJKM8YuXuwSWJOJbmsdehe1PyFMMmqDnwSRHhZiAk5/unLhenf5
   g==;
X-CSE-ConnectionGUID: 73a9EjZjRRCisqfLYs/1ew==
X-CSE-MsgGUID: gCMifGaeR/aXuYEDUXC2wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85803882"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="85803882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:10:21 -0700
X-CSE-ConnectionGUID: y3UT7lUNSteHzV89hzEY5A==
X-CSE-MsgGUID: KS7bbCcSS4KC6JY3Xqxg+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="259072279"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jul 2026 07:10:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpRS4-00000000ggD-3Qul;
	Thu, 30 Jul 2026 14:09:41 +0000
Date: Thu, 30 Jul 2026 22:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>
Subject: [thesofproject:topic/sof-dev 22/23]
 sound/soc/sof/ipc4-compress.c:380:55: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202607302150.tdsEB4S8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   15c9b701ada608fc3310f4bc2b3e48cbfec206d3
commit: 6f2516aa0fe9cff2365ee9bc6050e5a857545244 [22/23] ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
config: parisc-randconfig-r133-20260730 (https://download.01.org/0day-ci/archive/20260730/202607302150.tdsEB4S8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607302150.tdsEB4S8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607302150.tdsEB4S8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sof/ipc4-compress.c:380:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got unsigned int [usertype] format @@
   sound/soc/sof/ipc4-compress.c:380:55: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/soc/sof/ipc4-compress.c:380:55: sparse:     got unsigned int [usertype] format

vim +380 sound/soc/sof/ipc4-compress.c

dedb072dd0f8291 Peter Ujfalusi 2025-12-08  314  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  315  static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  316  				     struct snd_compr_stream *cstream,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  317  				     struct snd_compr_params *params)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  318  {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  319  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  320  	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  321  	struct sof_ipc4_compr_init_data *compr_data __free(kfree) = NULL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  322  	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  323  	struct snd_sof_platform_stream_params *platform_params;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  324  	struct sof_ipc4_timestamp_info *time_info;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  325  	struct snd_compr_params *compr_params;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  326  	struct snd_soc_dapm_widget_list *list;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  327  	struct snd_sof_widget *host_swidget;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  328  	struct sof_ipc4_process *process;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  329  	struct snd_pcm_hw_params p = {0};
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  330  	struct snd_interval *interval;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  331  	struct snd_sof_pcm *spcm;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  332  	struct snd_mask *fmt;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  333  	int dir = cstream->direction;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  334  	int ret;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  335  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  336  	spcm = snd_sof_find_spcm_dai(component, rtd);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  337  	if (!spcm)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  338  		return -EINVAL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  339  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  340  	host_swidget = snd_sof_find_swidget_by_comp_id(sdev, spcm->stream[dir].comp_id);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  341  	if (!host_swidget) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  342  		spcm_err(spcm, dir, "failed to find host widget with comp_id %d\n",
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  343  			 spcm->stream[dir].comp_id);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  344  		return -ENODEV;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  345  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  346  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  347  	if (!sof_ipc4_compr_codec_supported(sdev, params->codec.id, dir)) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  348  		spcm_err(spcm, dir, "Unsupported codec id: %u\n", params->codec.id);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  349  		return -EINVAL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  350  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  351  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  352  	spcm_dbg(spcm, dir,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  353  		 "codec_id: %u, rate: %u, ch in/out: %u/%u, format: %u/%u\n",
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  354  		 params->codec.id, params->codec.sample_rate, params->codec.ch_in,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  355  		 params->codec.ch_out, params->codec.format, params->codec.pcm_format);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  356  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  357  	if (spcm->prepared[dir]) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  358  		/*
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  359  		 * This can only happen if user space re-configures the device
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  360  		 * without closing it, for example after DRAIN completion
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  361  		 */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  362  		ret = sof_ipc4_compr_stream_free(sdev, spcm, cstream);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  363  		if (ret)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  364  			return ret;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  365  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  366  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  367  	/* save the compress params */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  368  	compr_params = &spcm->cparams[dir];
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  369  	memcpy(compr_params, params, sizeof(*params));
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  370  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  371  	/*
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  372  	 * Force format, rate and channels and use PCM hw_params structure to
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  373  	 * set up the pipelines.
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  374  	 */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  375  	fmt = hw_param_mask(&p, SNDRV_PCM_HW_PARAM_FORMAT);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  376  	snd_mask_none(fmt);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  377  	/* Use correct format based on the used codec */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  378  	switch (params->codec.id) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  379  	case SND_AUDIOCODEC_PCM:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08 @380  		snd_mask_set_format(fmt, params->codec.format);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  381  		break;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  382  	case SND_AUDIOCODEC_VORBIS:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  383  		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  384  		break;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  385  	case SND_AUDIOCODEC_FLAC:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  386  	{
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  387  		struct snd_dec_flac *dec_flac = &params->codec.options.flac_d;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  388  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  389  		if (dec_flac->sample_size == 16)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  390  			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  391  		else
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  392  			snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  393  		break;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  394  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  395  	default:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  396  		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  397  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  398  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  399  	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_CHANNELS);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  400  	interval->min = compr_params->codec.ch_out;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  401  	interval->max = compr_params->codec.ch_out;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  402  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  403  	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_RATE);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  404  	interval->min = compr_params->codec.sample_rate;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  405  	interval->max = compr_params->codec.sample_rate;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  406  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  407  	ret = sof_ipc4_compr_alloc_pages(sdev->dev, &spcm->stream[dir],
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  408  					 component, cstream);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  409  	if (ret < 0)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  410  		return ret;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  411  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  412  	spcm_dbg(spcm, dir,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  413  		 "buffer_size: %llu, fragment_size: %u (fragments: %u)\n",
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  414  		 cstream->runtime->buffer_size, cstream->runtime->fragment_size,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  415  		 (u32)cstream->runtime->buffer_size / cstream->runtime->fragment_size);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  416  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  417  	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_PERIOD_BYTES);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  418  	interval->min = cstream->runtime->fragment_size;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  419  	interval->max = cstream->runtime->fragment_size;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  420  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  421  	interval = hw_param_interval(&p, SNDRV_PCM_HW_PARAM_BUFFER_BYTES);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  422  	interval->min = cstream->runtime->buffer_size;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  423  	interval->max = cstream->runtime->buffer_size;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  424  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  425  	platform_params = &spcm->platform_params[dir];
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  426  	ret = snd_sof_compr_platform_hw_params(sdev, cstream, compr_params,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  427  					       platform_params);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  428  	if (ret < 0) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  429  		spcm_err(spcm, dir, "platform compress hw params failed\n");
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  430  		goto free_pages;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  431  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  432  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  433  	/* set up the list of DAPM widgets if not already done */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  434  	if (!spcm->stream[dir].list) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  435  		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, &p,
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  436  						      platform_params, dir);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  437  		if (ret < 0)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  438  			goto free_pages;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  439  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  440  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  441  	process = sof_ipc4_compr_get_module(spcm, dir);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  442  	if (!process) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  443  		ret = -EINVAL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  444  		goto free_list;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  445  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  446  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  447  	compr_data = kzalloc(sizeof(*compr_data), GFP_KERNEL);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  448  	if (!compr_data) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  449  		ret = -ENOMEM;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  450  		goto free_list;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  451  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  452  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  453  	memcpy(&compr_data->codec, &compr_params->codec, sizeof(compr_data->codec));
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  454  	compr_data->dir = dir;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  455  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  456  	process->init_ext_module_data = compr_data;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  457  	process->init_ext_module_size = sizeof(*compr_data);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  458  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  459  	/*
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  460  	 * Make sure that the DSP is booted up, which might not be the
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  461  	 * case if the on-demand DSP boot is used
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  462  	 */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  463  	ret = snd_sof_boot_dsp_firmware(sdev);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  464  	if (ret)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  465  		goto clear_init_ext;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  466  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  467  	/* set the host DMA ID */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  468  	if (tplg_ops && tplg_ops->host_config)
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  469  		tplg_ops->host_config(sdev, host_swidget, platform_params);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  470  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  471  	/* set up the widgets and pipelines in the DSP */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  472  	ret = sof_widget_list_setup(sdev, spcm, &p, platform_params, dir);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  473  	if (ret < 0) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  474  		spcm_err(spcm, dir, "widget list set up failed\n");
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  475  		goto clear_init_ext;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  476  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  477  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  478  	memcpy(&spcm->params[dir], &p, sizeof(p));
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  479  	spcm->prepared[dir] = true;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  480  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  481  	time_info = sof_ipc4_sps_to_time_info(&spcm->stream[dir]);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  482  	if (time_info) {
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  483  		/* delay calculation supported */
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  484  		time_info->stream_start_offset = SOF_IPC4_INVALID_STREAM_POSITION;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  485  		time_info->llp_offset = 0;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  486  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  487  		sof_ipc4_build_time_info(sdev, &spcm->stream[dir]);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  488  	}
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  489  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  490  	process->init_ext_module_data = NULL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  491  	process->init_ext_module_size = 0;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  492  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  493  	return 0;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  494  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  495  clear_init_ext:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  496  	process->init_ext_module_data = NULL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  497  	process->init_ext_module_size = 0;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  498  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  499  free_list:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  500  	list = spcm->stream[dir].list;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  501  	spcm->stream[dir].list = NULL;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  502  	snd_soc_dapm_dai_free_widgets(&list);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  503  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  504  free_pages:
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  505  	snd_compr_free_pages(cstream);
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  506  
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  507  	return ret;
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  508  }
dedb072dd0f8291 Peter Ujfalusi 2025-12-08  509  

:::::: The code at line 380 was first introduced by commit
:::::: dedb072dd0f8291e605332cf5e01fd0204615a5b ASoC: SOF: Add support for IPC4 compressed

:::::: TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
:::::: CC: Liam Girdwood <lgirdwood@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
