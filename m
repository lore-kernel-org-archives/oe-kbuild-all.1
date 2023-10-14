Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F591106
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 00:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2KUtlq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697244635; x=1728780635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6c17mYeOYUsUj5oyLD4zgDBA6zDOrGM/nLzsHzwFMec=;
  b=O2KUtlq3qQukNa4gWQ/u7WMNGxXI1pWPOev9phhKAdGxjb1Q46jQ1ayk
   SiliRqIT8+chk+ggzeKNCqBcO4Ox6HJnwbJ9cRkhO8DNGAY7BNWhUtUl3
   SKEcfk1CNlmh+IKIumVHCVHD6fAq6cILugspK23sgGr5seKCdxB/ykQhq
   PbjpZbszf9sZMdZCewk/6ND2QsXMniuThsanlUkf0kBq6Fmg24RSHVK51
   9YU52ZIJTqNShTtcm9zBWdpzMr0bYypX37M7ZVC8yacHzLpGhauEcydRJ
   LXFSew2t8XxocK3xnHiUDUF7spVEdO8p9i1OOOQW0usNOltI/kVDZcKC8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365556217"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="365556217"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754904999"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="754904999"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 17:50:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrSrA-0005Yx-2A;
	Sat, 14 Oct 2023 00:50:25 +0000
Date: Sat, 14 Oct 2023 08:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sound/speaker-safety 168/199]
 sound/soc/codecs/tas2764-quirks.h:145:23: warning: this statement may fall
 through
Message-ID: <202310140809.UA9f5CeH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   0c49093e19a678be51c7207bbf9da61b29173375
commit: 5b02a0cbab831c264982353463e6a3a8bf19dd1b [168/199] ASoC: tas2764: Add optional 'Apple quirks'
config: csky-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310140809.UA9f5CeH-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140809.UA9f5CeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140809.UA9f5CeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:56:
   sound/soc/codecs/tas2764-quirks.h: In function 'tas2764_do_quirky_pwr_ctrl_change':
>> sound/soc/codecs/tas2764-quirks.h:145:23: warning: this statement may fall through [-Wimplicit-fallthrough=]
     145 |                 ret = regmap_multi_reg_write(tas2764->regmap, tas2764_post_shutdown_seq,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     146 |                                              ARRAY_SIZE(tas2764_post_shutdown_seq));
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/tas2764-quirks.h:148:9: note: here
     148 |         default:
         |         ^~~~~~~


vim +145 sound/soc/codecs/tas2764-quirks.h

   115	
   116	static int tas2764_do_quirky_pwr_ctrl_change(struct tas2764_priv *tas2764,
   117						     unsigned int target)
   118	{
   119		unsigned int curr;
   120		int ret;
   121	
   122		curr = snd_soc_component_read_field(tas2764->component,
   123						       TAS2764_PWR_CTRL,
   124						       TAS2764_PWR_CTRL_MASK);
   125	
   126		if (target == curr)
   127			return 0;
   128	
   129	#define TRANSITION(new, old) ((new) << 8 | (old))
   130		switch (TRANSITION(target, curr)) {
   131		case TRANSITION(TAS2764_PWR_CTRL_SHUTDOWN, TAS2764_PWR_CTRL_MUTE):
   132		case TRANSITION(TAS2764_PWR_CTRL_SHUTDOWN, TAS2764_PWR_CTRL_ACTIVE):
   133			ret = regmap_multi_reg_write(tas2764->regmap, tas2764_pre_shutdown_seq,
   134						     ARRAY_SIZE(tas2764_pre_shutdown_seq));
   135			if (ret < 0)
   136				break;
   137	
   138			ret = snd_soc_component_update_bits(tas2764->component,
   139							    TAS2764_PWR_CTRL,
   140						    	    TAS2764_PWR_CTRL_MASK,
   141						    	    TAS2764_PWR_CTRL_SHUTDOWN);
   142			if (ret > 0)
   143				break;
   144	
 > 145			ret = regmap_multi_reg_write(tas2764->regmap, tas2764_post_shutdown_seq,
   146						     ARRAY_SIZE(tas2764_post_shutdown_seq));
   147	
   148		default:
   149			ret = snd_soc_component_update_bits(tas2764->component, TAS2764_PWR_CTRL,
   150						    	    TAS2764_PWR_CTRL_MASK, target);
   151		}
   152	#undef TRANSITION
   153	
   154		if (ret < 0)
   155			return ret;
   156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
