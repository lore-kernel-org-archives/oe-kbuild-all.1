Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83D286291
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739966047; cv=none; b=AoC/lyfI0OlZh66mhXZDkGesvotKKP9jzxR0w0KKtyQbWCaoF2lptUPT5Q329tzeTKEhe6BN1oL2/2/AW6yCNJrH+J54KracurzXINDKuR0A/TL0SQhURQ9sthl0soi/mewA6Li2POMnR8DZM/u3MDhZZM4+80EboNnsdkK+qMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739966047; c=relaxed/simple;
	bh=+d6h7xZbiNLFW6KDQcsuFmROnDo2RBjxJomsOJ3Fg2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hu3shPGB1SwMDyHsulQlNL6RFQYiIRYkJheZwesk8ngvdGFv2qzcjbe/QzpjyiQfqqbfYWvFVCCpC5Z8H31Q5clsDUfvFPI1WogLpjjYTwn3jtzy2UvlgKjNerKO3C+1YBOeNXYX7SH1r9EWn4N4TKn+kdJJP8yqQMZxFYjob98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtzQfFaB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtzQfFaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739966045; x=1771502045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+d6h7xZbiNLFW6KDQcsuFmROnDo2RBjxJomsOJ3Fg2w=;
  b=CtzQfFaBz0mTnsR2UwGlgErWBMMBeyplDiKUhV/mcZTDgYBTgc172TY6
   eUKrsNuz0E6NeKfdwUJty9vOFM30VM3Bua1F7NPSv441EGOKZ4VuBS3qC
   7RaW8fCWDuFyG0uGUpHWmFWnV8wyjP8TCCvHmAX/XHPTpebscrMceJmk4
   mw76U5mAsmFDvhinFPBrNva72XZuUo1hvTsPWcdXqu0Syyr8sHsdvv2H4
   sT8PDbgst/jsVBKFAmya4DvUmG+hcGS928UlW0Hv6qPjWyd0fWTJKcroW
   f2+E2jX5MbICIvGpifo05wOlEZEZWlbpgjzOMdFemCt0a6r4Leir5lHi4
   w==;
X-CSE-ConnectionGUID: AA5GVB/eQ86CLa1Njuxk6Q==
X-CSE-MsgGUID: KpVLmDAtTp+CsUG4I46AeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52102495"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="52102495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 03:54:04 -0800
X-CSE-ConnectionGUID: ndmA2yp7TACe5nB5fcQB0Q==
X-CSE-MsgGUID: 93+Kw6OWQSKBLeyL+vE2HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114429438"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Feb 2025 03:54:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkieO-0002st-2A;
	Wed, 19 Feb 2025 11:54:00 +0000
Date: Wed, 19 Feb 2025 19:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Keyon Jie <yang.jie@linux.intel.com>
Subject: [intel-lts:pr/59 1/1] sound/soc/sof/topology.c:244:28: warning:
 variable 'cdata' set but not used
Message-ID: <202502191948.vOILgbZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liam,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 027aacc3174e407c766ae7d63bfc6f471302a833 [1/1] ASoC: SOF: Add Build support for SOF core and Intel drivers
config: sparc-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191948.vOILgbZx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191948.vOILgbZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191948.vOILgbZx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sof/topology.c: In function 'sof_control_load_volume':
>> sound/soc/sof/topology.c:244:28: warning: variable 'cdata' set but not used [-Wunused-but-set-variable]
     struct sof_ipc_ctrl_data *cdata;
                               ^~~~~
   sound/soc/sof/topology.c: In function 'snd_sof_load_topology':
>> sound/soc/sof/topology.c:1786:27: warning: variable 'hdr' set but not used [-Wunused-but-set-variable]
     struct snd_soc_tplg_hdr *hdr;
                              ^~~


vim +/cdata +244 sound/soc/sof/topology.c

4c9acaba9dad7a Liam Girdwood 2018-01-08  231  
4c9acaba9dad7a Liam Girdwood 2018-01-08  232  /*
4c9acaba9dad7a Liam Girdwood 2018-01-08  233   * Standard Kcontrols.
4c9acaba9dad7a Liam Girdwood 2018-01-08  234   */
4c9acaba9dad7a Liam Girdwood 2018-01-08  235  
4c9acaba9dad7a Liam Girdwood 2018-01-08  236  static int sof_control_load_volume(struct snd_soc_component *scomp,
4c9acaba9dad7a Liam Girdwood 2018-01-08  237  				   struct snd_sof_control *scontrol,
4c9acaba9dad7a Liam Girdwood 2018-01-08  238  				   struct snd_kcontrol_new *kc,
4c9acaba9dad7a Liam Girdwood 2018-01-08  239  				   struct snd_soc_tplg_ctl_hdr *hdr)
4c9acaba9dad7a Liam Girdwood 2018-01-08  240  {
4c9acaba9dad7a Liam Girdwood 2018-01-08  241  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
4c9acaba9dad7a Liam Girdwood 2018-01-08  242  	struct snd_soc_tplg_mixer_control *mc =
4c9acaba9dad7a Liam Girdwood 2018-01-08  243  		(struct snd_soc_tplg_mixer_control *)hdr;
4c9acaba9dad7a Liam Girdwood 2018-01-08 @244  	struct sof_ipc_ctrl_data *cdata;
4c9acaba9dad7a Liam Girdwood 2018-01-08  245  
4c9acaba9dad7a Liam Girdwood 2018-01-08  246  	/* validate topology data */
4c9acaba9dad7a Liam Girdwood 2018-01-08  247  	if (mc->num_channels >= SND_SOC_TPLG_MAX_CHAN)
4c9acaba9dad7a Liam Girdwood 2018-01-08  248  		return -EINVAL;
4c9acaba9dad7a Liam Girdwood 2018-01-08  249  
4c9acaba9dad7a Liam Girdwood 2018-01-08  250  	/* init the volume get/put data */
4c9acaba9dad7a Liam Girdwood 2018-01-08  251  	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
4c9acaba9dad7a Liam Girdwood 2018-01-08  252  		sizeof(struct sof_ipc_ctrl_value_chan) * mc->num_channels;
4c9acaba9dad7a Liam Girdwood 2018-01-08  253  	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
4c9acaba9dad7a Liam Girdwood 2018-01-08  254  	cdata = scontrol->control_data;
4c9acaba9dad7a Liam Girdwood 2018-01-08  255  	if (!scontrol->control_data)
4c9acaba9dad7a Liam Girdwood 2018-01-08  256  		return -ENOMEM;
4c9acaba9dad7a Liam Girdwood 2018-01-08  257  
4c9acaba9dad7a Liam Girdwood 2018-01-08  258  	scontrol->comp_id = sdev->next_comp_id;
4c9acaba9dad7a Liam Girdwood 2018-01-08  259  	scontrol->num_channels = mc->num_channels;
4c9acaba9dad7a Liam Girdwood 2018-01-08  260  
4c9acaba9dad7a Liam Girdwood 2018-01-08  261  	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
4c9acaba9dad7a Liam Girdwood 2018-01-08  262  		scontrol->comp_id, scontrol->num_channels);
4c9acaba9dad7a Liam Girdwood 2018-01-08  263  
4c9acaba9dad7a Liam Girdwood 2018-01-08  264  	return 0;
4c9acaba9dad7a Liam Girdwood 2018-01-08  265  	/* configure channel IDs */
4c9acaba9dad7a Liam Girdwood 2018-01-08  266  	//for (i = 0; i < mc->num_channels; i++) {
4c9acaba9dad7a Liam Girdwood 2018-01-08  267  	//	v.pcm.chmap[i] = mc->channel[i].id;
4c9acaba9dad7a Liam Girdwood 2018-01-08  268  	//}
4c9acaba9dad7a Liam Girdwood 2018-01-08  269  }
4c9acaba9dad7a Liam Girdwood 2018-01-08  270  

:::::: The code at line 244 was first introduced by commit
:::::: 4c9acaba9dad7affd51af5c6efecf38e6283b411 ASoC: SOF: Add support for loading topologies

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Keyon Jie <yang.jie@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
