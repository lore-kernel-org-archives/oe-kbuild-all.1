Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1ED365
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jan 2023 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674369078; x=1705905078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7efphb1WlCmSoItwni5IMb7Aac8KxoosHekbQC2HWTM=;
  b=gMRmCfgclhcRHSKLZ44uyhjW4Q053aB3U91zdUlkYNkh/XURwsL6ydT4
   oLCJ20cmLI5FYZUw7DvJcGDtg2xjnQ5I2WrLs0c+O851mohwzSIOiJAsC
   m0p0MQTtekyBRhmZrY5URTwLxdFCsNKDGdvBc0miq45ASZsgD0Bosn65L
   VWHD/G9Yj6tL9BZBrs5BSlEeE3Zy2bU6BNb3PtrovICDZSL4X9Grex7Pv
   2OfB6N+qJsuzVvEilLCR3oo0HS6/l2xTKmYdXWGOxoIc4jnpa5IPMk8k8
   qtcpzQYOhgY3IW+XrsyiAYL4Asx0OP3fx/fWzE9UTHDcI/CDKNxpDB64+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="324556513"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="324556513"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 22:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729589325"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729589325"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 22:31:16 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJTsq-0004p2-08;
	Sun, 22 Jan 2023 06:31:16 +0000
Date: Sun, 22 Jan 2023 14:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:hf-5k-rc4 18/19] lib/test_dynamic_debug.c:13: warning:
 "pr_fmt" redefined
Message-ID: <202301221458.zMtMUq9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git hf-5k-rc4
head:   0b3fc8ac339994de91403db75a445b884c8e63dd
commit: 12389eb0d15904d817da779d102c72f2c3944579 [18/19] test-dyndbg: tune sub-module behavior
config: sparc64-randconfig-r025-20230122 (https://download.01.org/0day-ci/archive/20230122/202301221458.zMtMUq9C-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/12389eb0d15904d817da779d102c72f2c3944579
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc hf-5k-rc4
        git checkout 12389eb0d15904d817da779d102c72f2c3944579
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/test_dynamic_debug.c:13: warning: "pr_fmt" redefined
      13 |   #define pr_fmt(fmt) "test_dd: " fmt
         | 
   In file included from include/linux/kernel.h:29,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from lib/test_dynamic_debug.c:9:
   include/linux/printk.h:347: note: this is the location of the previous definition
     347 | #define pr_fmt(fmt) fmt
         | 


vim +/pr_fmt +13 lib/test_dynamic_debug.c

    10	
    11	/* NB: pr_fmt is often redundant with dyndbg's f-flag. this is shorter */
    12	#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
  > 13	  #define pr_fmt(fmt) "test_dd: " fmt
    14	  #define DEBUG	/* enable all prdbgs (plain & class'd) at compiletime */
    15	#else
    16	  #define pr_fmt(fmt) "test_dd_submod: " fmt
    17	#endif
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
