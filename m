Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D54C2F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682653339; x=1714189339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pC1eU1m8kcin0r4BwtPfCWyoVRH3KcIqQDNjFLZCdHU=;
  b=g19rNFHXHLBtJhiRuDsyQ+Zsd8Y//DH7NF34zabWoqZUzmlZswOWpEQW
   dhg/BkGRnf3tfYKb4h+3KCfGofvg6TeJgCX1b3stMrY2gxh1dEdVCUyut
   pUJOUZOM0PmZKqKtcqMD8XWibsG9vh4mUPI1qEwMPD2gatg6IvSfCdBFD
   wYVJVtCnheHG1UMTn+83MFTxbdqBgDkEFUkT8jJi4iplBN54K7Vi8kwWc
   //FgCVJV79G1iRScofMqAEvf+UVmOwuj8r8jyLsQOIl9nOrk8uBkkw9S6
   9wYcUkkNJFEVLGW6OCMFBAEuvjjGl3B5uIbRgdOH7nePWbWnMhuN91wCy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336679714"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="336679714"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759481469"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="759481469"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2023 20:42:17 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEzw-00004z-2t;
	Fri, 28 Apr 2023 03:42:16 +0000
Date: Fri, 28 Apr 2023 11:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 53/57] drivers/rtc/rtc-isl12022.c:104:17:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <202304281108.92gEfH3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   2c1afd03f007ce89de38d7ca355f05330c6038f0
commit: a176de9fffcb97ee885b2ade3dbb23dc9be33b29 [53/57] rtc: isl12022: constify pointers to hwmon_channel_info
config: sparc-randconfig-r034-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281108.92gEfH3k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?id=a176de9fffcb97ee885b2ade3dbb23dc9be33b29
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch --no-tags abelloni rtc-next
        git checkout a176de9fffcb97ee885b2ade3dbb23dc9be33b29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/rtc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281108.92gEfH3k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-isl12022.c:104:17: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     104 |         .info = isl12022_hwmon_info,
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/const +104 drivers/rtc/rtc-isl12022.c

8d816c1eaa7525 Rasmus Villemoes 2022-11-04  101  
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  102  static const struct hwmon_chip_info isl12022_hwmon_chip_info = {
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  103  	.ops = &isl12022_hwmon_ops,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04 @104  	.info = isl12022_hwmon_info,
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  105  };
8d816c1eaa7525 Rasmus Villemoes 2022-11-04  106  

:::::: The code at line 104 was first introduced by commit
:::::: 8d816c1eaa752546fa3221f5027af0a667ff0c8f rtc: isl12022: add support for temperature sensor

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
