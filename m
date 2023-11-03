Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5D210E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwZtKY+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699035527; x=1730571527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UK+M73SRiO8vZZusLXpdgJKNnVFeIWNiTw+x0yKxP4o=;
  b=BwZtKY+CcUHLoAhE4CBgsBTO/vOJCKvt7/TqZywupDNv/O1jbZWX8IIN
   lq50SV6SQgBsezpjfTw2j/hxU+/Q68KPWDln5D8uFRkb0kr/EK5yfoqSo
   Ha4rdmwO2buzHLdlzrkRVIi4XDd0d2ZLPbWp7274Igc18hRqWFPkI/ODV
   DfqJ3F/Q7RRISpAC1/aTw16RF6BJoLH5LME8gn8fnot0FJt3RJvpGVqZz
   +rVFjicQz1r0Tm1YI6gm3fmgbPmLcdE5XDtVssrNnlPPD8jRSvRIRRy0b
   Doo5MxHmsMboIxWoAFFlhndNQEuAkEvxPWSmZDtp+aPIPz20iWY1i2FnL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420114672"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="420114672"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 11:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885278403"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="885278403"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Nov 2023 11:18:45 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyykk-0002oZ-23;
	Fri, 03 Nov 2023 18:18:42 +0000
Date: Sat, 4 Nov 2023 02:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 65/99]
 sound/soc/codecs/tas2764-quirks.h:145:23: warning: this statement may fall
 through
Message-ID: <202311040204.TdiqzKme-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   2939678d42065d8acc5d41bad705222dc76589cb
commit: db9ce2c65ee2b183a859a3b89c76796b7226f49c [65/99] ASoC: tas2764: Add optional 'Apple quirks'
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311040204.TdiqzKme-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040204.TdiqzKme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040204.TdiqzKme-lkp@intel.com/

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
