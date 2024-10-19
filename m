Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E16160884
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729297636; cv=none; b=UkEF/b7BMMasJkxsVfZu99SZX8IrI2O+C6w1Mpelt0WNCMIUYU3kdaa4UgrnE7ja2wKdg7RNYzg2qKa1UuQsWo6ngPD+dvotPjkHhATFqj7EqhYC6G9fCJpYmsmrhayyNaYAE7nTS8mnhPObn3d6qTPk25tJDvTXpwFLNtBhA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729297636; c=relaxed/simple;
	bh=uHJIrqclz364HAEejXsfcFe5heajTEB0Kf+lAK5k+mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu6oWWV1vPrTE9k9JFZgp1hBFmVI2GIg2tgJPQ59pxXYfELUri4BU6QgvYriNmOelis0T+aqdUTU2ginvyrv96JC1jfOFExth3OYxRIqQzPQyV1ogSNca7c5hcxdqbjoH+jqkVaB3kI5Gl5oo/q2LlTLSSWIhIW91hAfFm3u9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFVU63ZF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFVU63ZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729297634; x=1760833634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uHJIrqclz364HAEejXsfcFe5heajTEB0Kf+lAK5k+mE=;
  b=XFVU63ZFMbH/85Ym5WrCOxKgb1jVdbRwscyb5Kuf8qON14FcMbfm9YxQ
   j1DeAJldOXRmAI4EtMTOCu126qRH3W7Oiw13pkLJRZgOPDx0ZDQKlPV+2
   nFs1u8zn9/Y1fR3R8JTOWE4RMBpWkKr1lgIg772doiGWaZvbSGTxxFDr3
   Kuv2NkAtgf9MbbPbyxf8iHTL/Qst8N1DpAp8pu1l5WpZ2+UPji4fMYAPm
   6LCPVg1v2Pl5rmRaM5qy74uBPS0OvlMlP2NLNSzHN6TOKabOV5YMunb2W
   SBtQey6Ne41LPvsa/efcwKQY44bVS2oiZwLORcYDp39CkhkHP/3+7XsaL
   A==;
X-CSE-ConnectionGUID: TjnHv/P1RJ+y46x6zMgWmA==
X-CSE-MsgGUID: J2cf7tDYTk6K3K2YW6MBAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28977079"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="28977079"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 17:27:13 -0700
X-CSE-ConnectionGUID: ycuW0bgmTF6CJY4vnlC/ag==
X-CSE-MsgGUID: eWY187xxRpu+BTv2dzUrdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="116470076"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 17:27:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1xJG-000OT0-1w;
	Sat, 19 Oct 2024 00:27:10 +0000
Date: Sat, 19 Oct 2024 08:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 05/13] ASoC: samsung: remove dpcm_xxx flags
Message-ID: <202410190858.yQhTK2hp-lkp@intel.com>
References: <87h69eqj4e.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h69eqj4e.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20241018]
[cannot apply to shawnguo/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-amd-remove-dpcm_xxx-flags/20241015-090321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/87h69eqj4e.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v4 05/13] ASoC: samsung: remove dpcm_xxx flags
config: sparc-randconfig-r113-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190858.yQhTK2hp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241019/202410190858.yQhTK2hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190858.yQhTK2hp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/samsung/odroid.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
>> sound/soc/samsung/odroid.c:187:18: sparse: sparse: Initializer entry defined twice
   sound/soc/samsung/odroid.c:192:18: sparse:   also defined here

vim +187 sound/soc/samsung/odroid.c

f89aea0f132142 Sylwester Nawrocki 2019-02-15  152  
3cddda10c25f46 Kuninori Morimoto  2019-06-06  153  SND_SOC_DAILINK_DEFS(primary,
3cddda10c25f46 Kuninori Morimoto  2019-06-06  154  	DAILINK_COMP_ARRAY(COMP_EMPTY()),
3cddda10c25f46 Kuninori Morimoto  2019-06-06  155  	DAILINK_COMP_ARRAY(COMP_DUMMY()),
3cddda10c25f46 Kuninori Morimoto  2019-06-06  156  	DAILINK_COMP_ARRAY(COMP_PLATFORM("3830000.i2s")));
3cddda10c25f46 Kuninori Morimoto  2019-06-06  157  
3cddda10c25f46 Kuninori Morimoto  2019-06-06  158  SND_SOC_DAILINK_DEFS(mixer,
3cddda10c25f46 Kuninori Morimoto  2019-06-06  159  	DAILINK_COMP_ARRAY(COMP_DUMMY()),
56558d6ab8c09c Kuninori Morimoto  2023-12-19  160  	DAILINK_COMP_ARRAY(COMP_EMPTY()));
3cddda10c25f46 Kuninori Morimoto  2019-06-06  161  
3cddda10c25f46 Kuninori Morimoto  2019-06-06  162  SND_SOC_DAILINK_DEFS(secondary,
3cddda10c25f46 Kuninori Morimoto  2019-06-06  163  	DAILINK_COMP_ARRAY(COMP_EMPTY()),
3cddda10c25f46 Kuninori Morimoto  2019-06-06  164  	DAILINK_COMP_ARRAY(COMP_DUMMY()),
3cddda10c25f46 Kuninori Morimoto  2019-06-06  165  	DAILINK_COMP_ARRAY(COMP_PLATFORM("3830000.i2s-sec")));
3cddda10c25f46 Kuninori Morimoto  2019-06-06  166  
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  167  static struct snd_soc_dai_link odroid_card_dais[] = {
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  168  	{
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  169  		/* Primary FE <-> BE link */
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  170  		.ops = &odroid_card_fe_ops,
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  171  		.name = "Primary",
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  172  		.stream_name = "Primary",
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  173  		.dynamic = 1,
8e3e1d509bfbe6 Kuninori Morimoto  2024-10-15  174  		.playback_only = 1,
3cddda10c25f46 Kuninori Morimoto  2019-06-06  175  		SND_SOC_DAILINK_REG(primary),
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  176  	}, {
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  177  		/* BE <-> CODECs link */
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  178  		.name = "I2S Mixer",
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  179  		.ops = &odroid_card_be_ops,
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  180  		.no_pcm = 1,
8e3e1d509bfbe6 Kuninori Morimoto  2024-10-15  181  		.playback_only = 1,
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  182  		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  183  				SND_SOC_DAIFMT_CBS_CFS,
3cddda10c25f46 Kuninori Morimoto  2019-06-06  184  		SND_SOC_DAILINK_REG(mixer),
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  185  	}, {
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  186  		/* Secondary FE <-> BE link */
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14 @187  		.playback_only = 1,
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  188  		.ops = &odroid_card_fe_ops,
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  189  		.name = "Secondary",
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  190  		.stream_name = "Secondary",
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  191  		.dynamic = 1,
8e3e1d509bfbe6 Kuninori Morimoto  2024-10-15  192  		.playback_only = 1,
3cddda10c25f46 Kuninori Morimoto  2019-06-06  193  		SND_SOC_DAILINK_REG(secondary),
bc3cf17b575a7a Sylwester Nawrocki 2019-02-14  194  	}
aba611fc4c6989 Sylwester Nawrocki 2017-04-21  195  };
aba611fc4c6989 Sylwester Nawrocki 2017-04-21  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
