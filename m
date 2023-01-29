Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2480017C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 03:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674961875; x=1706497875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hh7Xfhf29vc2NIYpP5xq3xSq8ZRiK1/UlF0Odnm0fQg=;
  b=PXXW8hh4fKBWKveYXxICNjcI/i8GOsPUzv9nESr/cTxvjin7c7fzg02K
   ro14QiOAdmmqNBLfFCfxEOxvvZzauwpS3R6ezWvQRx7OioBM/z0M16Jic
   mDOhv9tm+v6GD2s6alYblWMy7TQitbDfiBqFgi4QOSqO6rUTLOq/1x0wt
   5F+gbr7byCCygwI1ULB/M7XuoAnE3yEUnO/PC2xWj45OvGPB+XNTBnxmX
   hC4G8aSer15/YBI7U3fXNGeuNswPvTM6m6Aaj/ovhK/999MRKF5vvAILu
   OVPLRir9rUfCdlQYyf9SviK7kn1/jDH5/K6CFjIX7hZTBFUZlDL85gIWK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413578579"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413578579"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 19:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992486084"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992486084"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 19:11:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLy5y-0001OO-0G;
	Sun, 29 Jan 2023 03:11:06 +0000
Date: Sun, 29 Jan 2023 11:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:ivsense 37/37] sound/soc/codecs/tas2764-quirks.h:145:23:
 warning: this statement may fall through
Message-ID: <202301291155.Rl2sGn3f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux ivsense
head:   46630652178d7edeb72add30f186f264f4982c8a
commit: 46630652178d7edeb72add30f186f264f4982c8a [37/37] ASoC: tas2764: Add optional 'Apple quirks'
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291155.Rl2sGn3f-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/46630652178d7edeb72add30f186f264f4982c8a
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik ivsense
        git checkout 46630652178d7edeb72add30f186f264f4982c8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
