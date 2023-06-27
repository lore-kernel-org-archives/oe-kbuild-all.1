Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99CC2F24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687906346; x=1719442346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q3W9DiPjTa2K/vLgPFgwMA7RuGQxCnhKFkvWTlYcVck=;
  b=U75WOBvHbkrpRmEt+/UAJcyXDtgzQd45jCLYcKm6AkpOsq8x4yiw0dRm
   6P34dNv4oKX16M51YJjGhm6Se09RdH8+sqmsMr46HugP2TG+g6rBVI0Bl
   wLCofCzwufVVbGzzRcY7jK6F6rOjIt0pKm2I+12CmDEkhaK3cgji/zsgh
   L0lLgR4VDgFie2vNWI/hKSM50Dv8ozqH6ko07HjyJ+EwWwn5rL8nvjJgs
   YC+p3ol/bDeGyhxaEEv5yGMNio6Pzs28VTqoAjVtWTufv8QckGUZhBn8/
   EJp6BeGb9Heu0pgoq/tIBjLzjK1gxtLrfQ6qWplt8nh36JNbqp61E+6Uy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425372026"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="425372026"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 15:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="694067779"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="694067779"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 15:52:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEHXs-000CKv-1P;
	Tue, 27 Jun 2023 22:52:24 +0000
Date: Wed, 28 Jun 2023 06:51:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 21/30] drivers/gpu/drm/drm_print.c:72:24:
 warning: 'debug' defined but not used
Message-ID: <202306280607.1S6IakYU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   e7afba1683e5b4e8c906a446dffacf4b972b93e7
commit: dcf72b82bb982ce856036f33169304fe79ff8118 [21/30] hack
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230628/202306280607.1S6IakYU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230628/202306280607.1S6IakYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306280607.1S6IakYU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from drivers/gpu/drm/drm_print.c:28:
>> drivers/gpu/drm/drm_print.c:72:24: warning: 'debug' defined but not used [-Wunused-variable]
      72 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         |                        ^~~~~
   include/linux/dynamic_debug.h:181:30: note: in definition of macro 'DYNDBG_CLASSMAP_PARAM_REF'
     181 |         static unsigned long _name = (unsigned long)&_bits;             \
         |                              ^~~~~
   drivers/gpu/drm/drm_print.c:72:1: note: in expansion of macro 'DRM_CLASSMAP_PARAM_REF'
      72 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/debug +72 drivers/gpu/drm/drm_print.c

f158936b60a787 Jim Cromie 2022-09-11  54  
f158936b60a787 Jim Cromie 2022-09-11  55  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a787 Jim Cromie 2022-09-11  56  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a787 Jim Cromie 2022-09-11  57  #else
1a5e3ce6839aba Jim Cromie 2022-12-21  58  /* classnames must match value-symbols of enum drm_debug_category */
1a5e3ce6839aba Jim Cromie 2022-12-21  59  DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
1a5e3ce6839aba Jim Cromie 2022-12-21  60  		    DRM_UT_CORE,
f158936b60a787 Jim Cromie 2022-09-11  61  		    "DRM_UT_CORE",
f158936b60a787 Jim Cromie 2022-09-11  62  		    "DRM_UT_DRIVER",
f158936b60a787 Jim Cromie 2022-09-11  63  		    "DRM_UT_KMS",
f158936b60a787 Jim Cromie 2022-09-11  64  		    "DRM_UT_PRIME",
f158936b60a787 Jim Cromie 2022-09-11  65  		    "DRM_UT_ATOMIC",
f158936b60a787 Jim Cromie 2022-09-11  66  		    "DRM_UT_VBL",
f158936b60a787 Jim Cromie 2022-09-11  67  		    "DRM_UT_STATE",
f158936b60a787 Jim Cromie 2022-09-11  68  		    "DRM_UT_LEASE",
f158936b60a787 Jim Cromie 2022-09-11  69  		    "DRM_UT_DP",
f158936b60a787 Jim Cromie 2022-09-11  70  		    "DRM_UT_DRMRES");
f158936b60a787 Jim Cromie 2022-09-11  71  
97cc7fe2e0bfbd Jim Cromie 2023-06-09 @72  DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
97cc7fe2e0bfbd Jim Cromie 2023-06-09  73  

:::::: The code at line 72 was first introduced by commit
:::::: 97cc7fe2e0bfbd79019847692f9f089cc7699597 dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
