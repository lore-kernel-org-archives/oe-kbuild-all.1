Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E2375F96
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533767; cv=none; b=DCr3E2rxNvr0tFevKtShat3Vm+7QGa/p2yolEMRUzO50B4d2cmF0L3ENkYz4YEHQyZ8R/U7g7Tn8XeNj9tXLwPLO2YkN+gp13iOfZCvOqKtujz7DAOFRSNT//FN4YDW58gpe8+Ov/WMTy5gElasHr6+fEmGt3oBnBr/dmA4OXQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533767; c=relaxed/simple;
	bh=+5HZ7TMl4EDAq605473bjPsWC0R84LH6CxKoqbebHUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtC65rFEaW15Pd0LgnTUu7vFJW1NJ2RwSywW7IfiKQdnNncT9RYKbvnhhzeVdu9nEkRK/CQuERcH98ZVeFMDAddn+yAuv1LI/KmZoShqdFaflII4w7RIOjcLCDJaUD8R4vxRx3Y19DAQg1zD97in92NtXRLSs7eCEfw8zeO46+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PM3LFGu5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PM3LFGu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533766; x=1807069766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+5HZ7TMl4EDAq605473bjPsWC0R84LH6CxKoqbebHUY=;
  b=PM3LFGu5kCf9vEsAvgRwunedRSHlGMrrntLmzM7EEAU9eGuU+pB4NSdw
   HKgxTp+MpQ2lWJe6QN+L02U/RzrBzxDUIB7J2NbYMeR10C/Jtix2EbPB1
   6Q02YMfqqcoVM7iE7kUULHxjmDrSkanAk+2ZO6y+ihWu/GeHQnvHaUjQk
   MIoh6NnWWpIRW4DQHACfN73fWwIecGWve1RVNOu23bhbbcy4w26Wd/5hD
   UWRHXgyoAYfWKk9SQTVAq8iS1yO0dAJLk6Wpz1/LUJXkAW1MToc7B8Uq/
   4yLzOqCwQ/dbS43FhQ5j8DcdukXvquM5QmhlQ8jL8OsE/9a6l2/aHIYIX
   Q==;
X-CSE-ConnectionGUID: vx+E0018QsKSmIa4d3GZTA==
X-CSE-MsgGUID: L2+5ijJxSauuMS1nXJ6dyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385880"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385880"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:23 -0700
X-CSE-ConnectionGUID: 4YU8LARNSZWr6aZDrz6klA==
X-CSE-MsgGUID: KgbdcOD2TJa96Sgiur4ZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191872"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001D-0Rux;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 7 Apr 2026 11:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
	shumingf@realtek.com, derek.fang@realtek.com,
	Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt1320-sdw: kcontrol for brown-out feature switch
Message-ID: <202604032240.PeKldNcG-lkp@intel.com>
References: <20260401093107.632673-1-jack.yu@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401093107.632673-1-jack.yu@realtek.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.0-rc6 next-20260402]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jack-yu-realtek-com/ASoC-rt1320-sdw-kcontrol-for-brown-out-feature-switch/20260403-160437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260401093107.632673-1-jack.yu%40realtek.com
patch subject: [PATCH] ASoC: rt1320-sdw: kcontrol for brown-out feature switch
config: arc-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604032240.PeKldNcG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604032240.PeKldNcG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032240.PeKldNcG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_brown_out_put':
>> sound/soc/codecs/rt1320-sdw.c:2504:11: warning: unused variable 'tmp' [-Wunused-variable]
     int ret, tmp;
              ^~~
>> sound/soc/codecs/rt1320-sdw.c:2503:17: warning: unused variable 'dev' [-Wunused-variable]
     struct device *dev = &rt1320->sdw_slave->dev;
                    ^~~


vim +/tmp +2504 sound/soc/codecs/rt1320-sdw.c

  2497	
  2498	static int rt1320_brown_out_put(struct snd_kcontrol *kcontrol,
  2499					 struct snd_ctl_elem_value *ucontrol)
  2500	{
  2501		struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
  2502		struct rt1320_sdw_priv *rt1320 = snd_soc_component_get_drvdata(component);
> 2503		struct device *dev = &rt1320->sdw_slave->dev;
> 2504		int ret, tmp;
  2505	
  2506		ret = pm_runtime_resume(component->dev);
  2507		if (ret < 0 && ret != -EACCES)
  2508			return ret;
  2509	
  2510		rt1320->brown_out = ucontrol->value.integer.value[0];
  2511		regcache_cache_bypass(rt1320->regmap, true);
  2512	
  2513		if (rt1320->brown_out == 1)
  2514			regmap_write(rt1320->regmap, 0xdb03, 0x00);
  2515		else
  2516			regmap_write(rt1320->regmap, 0xdb03, 0xf0);
  2517	
  2518		regcache_cache_bypass(rt1320->regmap, false);
  2519	
  2520		return 0;
  2521	}
  2522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
