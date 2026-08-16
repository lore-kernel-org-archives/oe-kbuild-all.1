Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6E0282F17
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857261; cv=none; b=Cikpc8pkU84w9wTb7ILx47UFzHXyBVRJ8VYpNicXf5ouuEGxFP12/jxgQSpHwcDXaZmWdSK0bZu8uz16p6dzkD2XqeU0nlO4tZHX8v1GWRzphRfLFYqluuFqQgqQZh7sVzNt5s3lJAyi4qm0fO3gWq2OXCZnwKjk45/t4xU78jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857261; c=relaxed/simple;
	bh=inbctEE0XMBWG3f8oPtrwPXoYHg69K3P0uxeGVhQA74=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TQFeQMVypvfOFLceSiiBADjdCfY3irEXyOWBahWRlm8JCGl+70GsYuYAdFllPGrdBa8Bsguz6O6EgzHsbNfxRlEsXamqt3HkgluyHPrv4TDxy8OXUjwj35NC406B5UBRMgUhWrHknapQqFpa91bsz+YzRqbqGz5DYA2lGGWT3Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHiSCuID; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHiSCuID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786857259; x=1818393259;
  h=date:from:to:cc:subject:message-id;
  bh=inbctEE0XMBWG3f8oPtrwPXoYHg69K3P0uxeGVhQA74=;
  b=RHiSCuIDBT8uvpwZuaUdYlbwieA84uR8rGywg6md9wl53OWaLdPx/YxD
   zdpKzqzbvjbi/ip57Tz4sSyH9Hg2cB4/QU6TqA2G6L48Da7XYDttMA5wK
   iKYKNkjjAs6mgSsKHc0RkehZsjhGB45VFXwxuyK5RDa1DkY7HRvGHPVMY
   A6Q6t09g+RTDLdHqe2Gfk+tF2qA9SnybEthsB1fQZm2r/MRLCGiM04tHm
   9jK+32lCqE7SYp6Fb0909JFNZTcu2gqD6fAhTTpiOyk+4MHKH9aTvYeIQ
   5JXJ7xJSSm52L1R6/8ma5SjvSB6qDMXxN5Vl7HREAGrI+C/MUj09ZWnkM
   g==;
X-CSE-ConnectionGUID: Bn23LQycRJm8jw/hCAaUtQ==
X-CSE-MsgGUID: 6DoWaLnwQnCXn9kdG4Yoaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87582418"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87582418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:14:18 -0700
X-CSE-ConnectionGUID: f7TzvS00TSGqSEJL49PqHg==
X-CSE-MsgGUID: WIA6ymUWR8WKcvjCzZoiEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268449292"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2026 22:14:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvTCI-00000000ckI-0YjN;
	Sun, 16 Aug 2026 05:14:14 +0000
Date: Sun, 16 Aug 2026 13:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 138/217]
 sound/soc/ti/omap-twl4030.c:138:38: warning: unused variable 'dapm'
Message-ID: <202608161230.gHZiOn8j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: f6d934b99b4df95800d72522490f3d30d4c16ef1 [138/217] ASoC: omap-twl4030: remove platform_data based probe
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608161230.gHZiOn8j-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161230.gHZiOn8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161230.gHZiOn8j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/ti/omap-twl4030.c: In function 'omap_twl4030_init':
>> sound/soc/ti/omap-twl4030.c:138:38: warning: unused variable 'dapm' [-Wunused-variable]
     138 |         struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
         |                                      ^~~~


vim +/dapm +138 sound/soc/ti/omap-twl4030.c

bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  134  
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  135  static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  136  {
0596f70069bb5a sound/soc/omap/omap-twl4030.c Lars-Peter Clausen 2014-05-19  137  	struct snd_soc_card *card = rtd->card;
42e142c842cb9c sound/soc/ti/omap-twl4030.c   Kuninori Morimoto  2025-11-11 @138  	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  139  	struct omap_twl4030 *priv = snd_soc_card_get_drvdata(card);
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  140  	int ret = 0;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  141  
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  142  	/*
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  143  	 * This is a bit of a hack, but the GPIO is optional so we
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  144  	 * only want to add the jack detection if the GPIO is there.
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  145  	 */
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  146  	if (of_property_present(card->dev->of_node, "ti,jack-det-gpio")) {
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  147  		hs_jack_gpios[0].gpiod_dev = card->dev;
1b8a62937e0b23 sound/soc/ti/omap-twl4030.c   Linus Walleij      2023-09-26  148  		hs_jack_gpios[0].idx = 0;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  149  
19aed2d6cdb72a sound/soc/ti/omap-twl4030.c   Akihiko Odaki      2022-04-08  150  		ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
19aed2d6cdb72a sound/soc/ti/omap-twl4030.c   Akihiko Odaki      2022-04-08  151  						 SND_JACK_HEADSET,
19aed2d6cdb72a sound/soc/ti/omap-twl4030.c   Akihiko Odaki      2022-04-08  152  						 &priv->hs_jack, hs_jack_pins,
da21cf6d652836 sound/soc/omap/omap-twl4030.c Lars-Peter Clausen 2015-03-04  153  						 ARRAY_SIZE(hs_jack_pins));
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  154  		if (ret)
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  155  			return ret;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  156  
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  157  		ret = snd_soc_jack_add_gpios(&priv->hs_jack,
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  158  					     ARRAY_SIZE(hs_jack_gpios),
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  159  					     hs_jack_gpios);
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  160  		if (ret)
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  161  			return ret;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  162  	}
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  163  
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  164  	return ret;
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  165  }
bd0b286e838ef1 sound/soc/omap/omap-twl4030.c Peter Ujfalusi     2012-12-31  166  

:::::: The code at line 138 was first introduced by commit
:::::: 42e142c842cb9c7dbde569ff137974e76d1a0e67 ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
