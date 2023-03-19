Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E86EA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679206444; x=1710742444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/ob7e5Nnb4BdYgpSI5rjX7uveYGfLHi6tkRh/tN1Q0=;
  b=WHApsNrpS/pgPp9HV4771RniMGXM/Fy4TNaLXMQxBWaCVVTuTGDankm9
   4SQKoYjnIf8TCp1FyzmkQ9kaSm+bLb7QLjGOAgSUJwj6j1qABqgnwef6T
   PfKNWQ+Pu6U+36Rfv8nNJgsrEVxT+fSyEOe2xjGo/Z/9cIRGDzDs03FSZ
   7jhE0MmtYMTHV26sf13dOLZTw0MdYiKN9p9PDEkAKPDrww/lVjTGtHLNz
   X7dEulhympCWMVVAhWzHAtVwu0/8tT8qCI1kqTCgOUNgisBjaUtpZGydT
   NIdeN/2j5lmmP/hYq2BzmgY2I2mgqCgGNGiI8qNQkY8uvEbvBEdchU4j1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="366193755"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="366193755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 23:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="769828056"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="769828056"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 23:14:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdmIr-000AQY-3C;
	Sun, 19 Mar 2023 06:14:01 +0000
Date: Sun, 19 Mar 2023 14:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 15/19] lib/test_map_h.c:21:1: error: call to
 undeclared function 'iMAP_LIST'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202303191432.Gi05B8tt-lkp@intel.com>
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
config: hexagon-buildonly-randconfig-r001-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191432.Gi05B8tt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/cda0e3ffa090194c6cae2071c4c2044477aad9a3
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout cda0e3ffa090194c6cae2071c4c2044477aad9a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191432.Gi05B8tt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:21:1: error: call to undeclared function 'iMAP_LIST'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   DEFINE_SLIST_FROM_ENUM_VALS( debug_cats, DRMx_CORE, DRMx_DRIVER, DRMx_KMS );
   ^
   lib/test_map_h.c:19:3: note: expanded from macro 'DEFINE_SLIST_FROM_ENUM_VALS'
                   iMAP_LIST(__stringify, __VA_ARGS__) };
                   ^
>> lib/test_map_h.c:21:1: error: use of undeclared identifier '__stringify'
   lib/test_map_h.c:19:13: note: expanded from macro 'DEFINE_SLIST_FROM_ENUM_VALS'
                   iMAP_LIST(__stringify, __VA_ARGS__) };
                             ^
   2 errors generated.


vim +/iMAP_LIST +21 lib/test_map_h.c

    15	
    16	/* test iMAP_LIST, with __stringify. others equivalent */
    17	#define DEFINE_SLIST_FROM_ENUM_VALS(_var, ...)				\
    18		const char *_var##_slist[] = {					\
    19			iMAP_LIST(__stringify, __VA_ARGS__) };
    20	
  > 21	DEFINE_SLIST_FROM_ENUM_VALS( debug_cats, DRMx_CORE, DRMx_DRIVER, DRMx_KMS );
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
