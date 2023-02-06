Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765807F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 00:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675644523; x=1707180523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kt6B6NdWRINl3+V3veCaqK3d+boTrHVwRgVY6fAs+bQ=;
  b=P0f5LUrpk5fBEFmOfcUwEtfxz0X2ULaRkeXRZ9qQ4TKrbZVelLY+Y68S
   sGIrzKa0WEjEGdwYMPiosdxKbGN6UWx2cqJen/aA5C8Kcq+tXrLCA0EHY
   IcvC6bZ/h1V7c8uY/h2ynSdYMYKyAzqbXONTetetTYuEwu2LO3fQ5Go0U
   V4YXmXC+w9mglXWGbjXVyPi4TFES6mNvIdMBj+nQoAIdx8zuYHIr71iP1
   itJO2zSoG6fapvN+YYyIiJN95mF5sHlp7ZI8uLbcE3KzGccdmncnyMdcK
   9S6lua2tsUcrGyZ57Ivy9t0u/1CiMerKjiYQuExIZo9KevsKKDSRFo8ak
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415326752"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="415326752"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 16:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="734948970"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="734948970"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Feb 2023 16:48:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOpgX-0002Iy-0M;
	Mon, 06 Feb 2023 00:48:41 +0000
Date: Mon, 6 Feb 2023 08:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:ivsense 37/39] sound/soc/codecs/tas2764-quirks.h:148:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202302060811.oZke6HHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux ivsense
head:   34f7168e4161164e8b3879d8ad099346a63f764f
commit: 46630652178d7edeb72add30f186f264f4982c8a [37/39] ASoC: tas2764: Add optional 'Apple quirks'
config: riscv-randconfig-r042-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060811.oZke6HHH-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/povik/linux/commit/46630652178d7edeb72add30f186f264f4982c8a
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik ivsense
        git checkout 46630652178d7edeb72add30f186f264f4982c8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/tas2764.c:56:
>> sound/soc/codecs/tas2764-quirks.h:148:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   sound/soc/codecs/tas2764-quirks.h:148:2: note: insert '__attribute__((fallthrough));' to silence this warning
           default:
           ^
           __attribute__((fallthrough)); 
   sound/soc/codecs/tas2764-quirks.h:148:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   sound/soc/codecs/tas2764.c:876:20: warning: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Wvoid-pointer-to-enum-cast]
                   tas2764->devid = (enum tas2764_devid) of_id->data;
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +148 sound/soc/codecs/tas2764-quirks.h

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
   145			ret = regmap_multi_reg_write(tas2764->regmap, tas2764_post_shutdown_seq,
   146						     ARRAY_SIZE(tas2764_post_shutdown_seq));
   147	
 > 148		default:
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
