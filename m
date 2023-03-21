Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71711FB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679384844; x=1710920844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=opzXauKoBrdCFqIUfL1rImb0vYSpWoCpCQyiB7ES2d8=;
  b=PJc1d/EJM/brTW2YEFqOcI42SWc6lJt5a+AdKkkXK6huflTppymKi3Ik
   hyV2matMlCqKTkCKSJ71N7UmAZSaP6OMplk0koO0aKeVapJPNc4uXI2cM
   3Ixz1NUc+CdsN+24oZcZv75vijd2puMFVe7PDhBa9/CAwZ+9qI04whoxw
   Ji01/WLUrgmgGfBV2UuZZEKf/NRax05OI2iVhUoPH3KZ/ESi2scyH1BVU
   +bbt54iDS7ADcxxXhTLDA9K+sxK5m1d7HFOE9jSk09zZRynbPecXpYkYb
   N8QMK3V6gx4pZHiLg54WaWB+3IWqi1bk0V+rNK5C5/VfgS6B1tBci9PLJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322716192"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="322716192"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="711703250"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="711703250"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 00:47:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peWiE-000BjW-27;
	Tue, 21 Mar 2023 07:47:18 +0000
Date: Tue, 21 Mar 2023 15:46:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 1/1] lib/test_map_h.c:37:2: error: implicit declaration
 of function 'BUILD_BUG_STREQ' is invalid in C99
Message-ID: <202303211502.NVdgctdi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
commit: d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593 [1/1] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230321/202303211502.NVdgctdi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211502.NVdgctdi-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_map_h.c:25:39: error: expected comma in macro parameter list
     #define BUILD_BUG_STREQ(BUILD_BUG_ON(0))
                                         ^
>> lib/test_map_h.c:37:2: error: implicit declaration of function 'BUILD_BUG_STREQ' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
           ^
   lib/test_map_h.c:37:18: error: use of undeclared identifier 'debug_cats'; did you mean 'debug_locks'?
           BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
                           ^~~~~~~~~~
                           debug_locks
   include/linux/debug_locks.h:10:12: note: 'debug_locks' declared here
   extern int debug_locks __read_mostly;
              ^
   lib/test_map_h.c:38:18: error: use of undeclared identifier 'debug_cats'; did you mean 'debug_locks'?
           BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
                           ^~~~~~~~~~
                           debug_locks
   include/linux/debug_locks.h:10:12: note: 'debug_locks' declared here
   extern int debug_locks __read_mostly;
              ^
   lib/test_map_h.c:39:18: error: use of undeclared identifier 'debug_cats'; did you mean 'debug_locks'?
           BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
                           ^~~~~~~~~~
                           debug_locks
   include/linux/debug_locks.h:10:12: note: 'debug_locks' declared here
   extern int debug_locks __read_mostly;
              ^
   5 errors generated.


vim +/BUILD_BUG_STREQ +37 lib/test_map_h.c

    33	
    34	/* force compile, though its not called */
    35	static void __used MAPH_BUILD_BUG(void)
    36	{
  > 37		BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
    38		BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
    39		BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
    40	#ifdef FORCE_FAIL
    41		/* properly breaks compile */
    42		BUILD_BUG_STREQ(debug_cats, 1, "'not-in-map'");
    43	#endif
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
