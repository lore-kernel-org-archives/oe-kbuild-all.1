Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21C915BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 04:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687321257; x=1718857257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5hgpPMHVlE7nFNrb13F+dQLiVxLx00hbxBW+ees7WeA=;
  b=JWXuxeecasv7wSSXXbuKMxnJhFrOOFej61XFG08M/Bc4Ad4LvDWS5h4R
   /Lke4tOuPVtVx8a3kQgQpEbsFETQTlSgNyBQZ1Vp7iaI9GpA22jo6+j+P
   BZJbXsUSwHg7hRkRMfJN3Zk5ZHLiy6XY1DbkvTIZqSWQiAypH6zyDrgvJ
   aWmGKiFUYQIIxZE0tSG3i0OKG8rNy7kvX/8WW++0kDYPELc/uc0wvoAAl
   KhnTFruzadH/hKpP3CAGBn9f4xeB/HajNpNXxeo3dP8bDGlJqGOS2poHo
   kJL+ZfNZMFB7kcra63Cbx7hGWL+da8TPKtsoo/hrE0z5PXQZwj4bR2aXy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349794326"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="349794326"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 21:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691698535"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="691698535"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jun 2023 21:20:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBpKx-0006YB-2W;
	Wed, 21 Jun 2023 04:20:55 +0000
Date: Wed, 21 Jun 2023 12:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2i 12/18] ld.lld: error: undefined symbol:
 map_disjoint_bits
Message-ID: <202306211235.L0eSyYET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2i
head:   706822e871c197cefca034dce9582e0fc916732b
commit: c3109b624b9d040f1002ae267886572688fd2d93 [12/18] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
config: x86_64-buildonly-randconfig-r003-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211235.L0eSyYET-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211235.L0eSyYET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211235.L0eSyYET-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: map_disjoint_bits
   >>> referenced by test_dynamic_debug_submod.c
   >>>               lib/test_dynamic_debug_submod.o:(__UNIQUE_ID_ddebug_class_user191) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: map_level_num
   >>> referenced by test_dynamic_debug_submod.c
   >>>               lib/test_dynamic_debug_submod.o:(__UNIQUE_ID_ddebug_class_user192) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: map_disjoint_names
   >>> referenced by test_dynamic_debug_submod.c
   >>>               lib/test_dynamic_debug_submod.o:(__UNIQUE_ID_ddebug_class_user193) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: map_level_names
   >>> referenced by test_dynamic_debug_submod.c
   >>>               lib/test_dynamic_debug_submod.o:(__UNIQUE_ID_ddebug_class_user194) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
