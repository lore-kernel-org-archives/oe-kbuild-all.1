Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2185A6116
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683641256; x=1715177256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5oySstHQVlL6fSWwoO2QX6bbguMOBaqUWB4UEENDbos=;
  b=Sjqj/jXCh7u26dcMxjMpQ1agYhS0DX47wJv6JxXDKbliuVSzYg6FiO7c
   66USGv/jYIAyyn9jhFwC7AryC5dPTuo/lXrC4zAKWb3wuXadplv+0qzVW
   eE3ZfWvNpOKTLcUTWJsE0lLak/vJWu3Rr7Xa9XFCTR/jFKQRXOsC5YjLC
   EJp4Osm22BoJm0edCGkyDuoN8XqPvrFwj1LVoLkgTRly0ME44VPAwt5su
   zE0JL7IkN9Hfr7FxZSJ3y9lg6JBbk9FGt9lNMviRh1rAdZMODW0u9Ujf4
   dG/ioRifCILGbpfWwgpSefbwRYLpr7ARVRIx0N193mH4IW2IhEoH9ccFH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348767769"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="348767769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 07:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="729525905"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="729525905"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 May 2023 07:06:49 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwNzM-0002Bz-1J;
	Tue, 09 May 2023 14:06:48 +0000
Date: Tue, 9 May 2023 22:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sound/ivsense-improvements 52/57]
 sound/soc/codecs/tas2764-quirks.h:145:23: warning: this statement may fall
 through
Message-ID: <202305092109.JQiPPHq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/ivsense-improvements
head:   8db1ec849194a2607c8546306d0b9e0e1ed2a1da
commit: 413eac87acb924659be4d8ef4a09469cdfb3ddd8 [52/57] ASoC: tas2764: Add optional 'Apple quirks'
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230509/202305092109.JQiPPHq9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/413eac87acb924659be4d8ef4a09469cdfb3ddd8
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux sound/ivsense-improvements
        git checkout 413eac87acb924659be4d8ef4a09469cdfb3ddd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305092109.JQiPPHq9-lkp@intel.com/

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
https://github.com/intel/lkp-tests
