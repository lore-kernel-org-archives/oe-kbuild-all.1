Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B62A46
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 06:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679205844; x=1710741844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWASTe3EhyDGb5y/zHKXmJNVIaWRAsj4zvP+cOojXCQ=;
  b=QQ/yIkll/wxXwrixfdIxOvBAjlusRz+kYwSCL+ChzBcDmtJlx7Lnf51z
   nHsmoU7R7qjFjnZAj+bL8qNHKXpGap6Ru6KTaJiyNlfb5hIBGpOtKO7UQ
   qNRzInmKpJRfBgdtYvjfF6rU6jLsxQ42MntfupDvGqVat6Py574MKXTS1
   x0uz+R0aY/CRK2hVof0Q2H/TE9VV2YRjDRb3/WI7yA25b0f/4W82UC/JI
   R4Q81hLgl/Bwy9qMrKRxdrZMDd7FgxQ9ro1NB4AMme2B50XleKE+Ruwz2
   od4iy9hf3F2cPmpwwzxpZAsaRfJn7QjiuHAqub7X74UYOiaKLlrd3qn+T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="337195612"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="337195612"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 23:04:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="744983050"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="744983050"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2023 23:04:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdm9B-000AQQ-2q;
	Sun, 19 Mar 2023 06:04:01 +0000
Date: Sun, 19 Mar 2023 14:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 15/19] lib/test_map_h.c:19:17: error: implicit
 declaration of function 'iMAP_LIST'; did you mean 'MAP_LIST'?
Message-ID: <202303191340.r0RhHAsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   e54619e733db4822727bc8cdec83db05a7249d5d
commit: cda0e3ffa090194c6cae2071c4c2044477aad9a3 [15/19] dyndbg: add map.h, test_map_h.c (RFC)
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230319/202303191340.r0RhHAsu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/cda0e3ffa090194c6cae2071c4c2044477aad9a3
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout cda0e3ffa090194c6cae2071c4c2044477aad9a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191340.r0RhHAsu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:19:17: error: implicit declaration of function 'iMAP_LIST'; did you mean 'MAP_LIST'? [-Werror=implicit-function-declaration]
      19 |                 iMAP_LIST(__stringify, __VA_ARGS__) };
         |                 ^~~~~~~~~
   lib/test_map_h.c:21:1: note: in expansion of macro 'DEFINE_SLIST_FROM_ENUM_VALS'
      21 | DEFINE_SLIST_FROM_ENUM_VALS( debug_cats, DRMx_CORE, DRMx_DRIVER, DRMx_KMS );
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/test_map_h.c:19:27: error: '__stringify' undeclared here (not in a function)
      19 |                 iMAP_LIST(__stringify, __VA_ARGS__) };
         |                           ^~~~~~~~~~~
   lib/test_map_h.c:21:1: note: in expansion of macro 'DEFINE_SLIST_FROM_ENUM_VALS'
      21 | DEFINE_SLIST_FROM_ENUM_VALS( debug_cats, DRMx_CORE, DRMx_DRIVER, DRMx_KMS );
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +19 lib/test_map_h.c

    15	
    16	/* test iMAP_LIST, with __stringify. others equivalent */
    17	#define DEFINE_SLIST_FROM_ENUM_VALS(_var, ...)				\
    18		const char *_var##_slist[] = {					\
  > 19			iMAP_LIST(__stringify, __VA_ARGS__) };
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
