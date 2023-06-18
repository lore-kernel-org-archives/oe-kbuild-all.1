Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34957EA1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 03:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687058583; x=1718594583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smxXsz1eQ1ID2FImTR5Xm+Zv+vjb6K+Hxj46b00jQ2A=;
  b=gx9JaBUZulGByvLd8KkfY1hpa26FbA7pjE0/C2QXUB5hlxN2SkRLQSI3
   7hqYSQfJekIaz6YUd4tS+AR41Nl14BQNn1vBaz0dMnQIVmU7LOCpIrzUE
   RSlXLcb+VPUmQ9DGhE5i9tWu4evtC83nREjflXtwmJ6UABdBdm/n9xy3e
   mjfWgoDuoIWPDHBsx7X17chgW7jSQiuyJmnRCIyiG6PF2YLOTyD5kfYfM
   yNTy6NWwlIrJHrSc1rD9cqnOPnpebCnP534gRIVXgxlneOWru6j/w9cUZ
   qQlSl30PL5W4g5/9bw1FnLRD84FWhXAs0KeOi2s3VhVYeFdgPFzLEDzvF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="361981486"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="361981486"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 20:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="960059261"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="960059261"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2023 20:23:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAj0G-0003LK-1a;
	Sun, 18 Jun 2023 03:23:00 +0000
Date: Sun, 18 Jun 2023 11:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyn-drm-trc-10 19/27] drivers/gpu/drm/drm_print.c:72:31:
 warning: '__drm_debug' initialized and declared 'extern'
Message-ID: <202306181139.WV7jWTUZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dyn-drm-trc-10
head:   8c83f8b98f98e68f9748e826b4f733d222954dc9
commit: d892a7cd0527fff6a2516100e77dd0e17034c75a [19/27] try-ref-init
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230618/202306181139.WV7jWTUZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181139.WV7jWTUZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181139.WV7jWTUZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:11,
                    from drivers/gpu/drm/drm_print.c:28:
>> drivers/gpu/drm/drm_print.c:72:31: warning: '__drm_debug' initialized and declared 'extern'
      72 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         |                               ^~~~~~~~~~~
   include/linux/dynamic_debug.h:191:30: note: in definition of macro 'DYNDBG_CLASSMAP_PARAM_REF'
     191 |         extern unsigned long _bits = DYNDBG_CLASSMAP_PARAM_DEFAULT;     \
         |                              ^~~~~
   drivers/gpu/drm/drm_print.c:72:1: note: in expansion of macro 'DRM_CLASSMAP_PARAM_REF'
      72 | DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +72 drivers/gpu/drm/drm_print.c

f158936b60a787 Jim Cromie 2022-09-11  54  
f158936b60a787 Jim Cromie 2022-09-11  55  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
f158936b60a787 Jim Cromie 2022-09-11  56  module_param_named(debug, __drm_debug, ulong, 0600);
f158936b60a787 Jim Cromie 2022-09-11  57  #else
a2981f1d7dc433 Jim Cromie 2022-11-02  58  /* classnames must match value-symbols of enum drm_debug_category */
a2981f1d7dc433 Jim Cromie 2022-11-02  59  DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
a2981f1d7dc433 Jim Cromie 2022-11-02  60  		    DRM_UT_CORE,
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
43ed982e66f0db Jim Cromie 2023-06-09 @72  DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
43ed982e66f0db Jim Cromie 2023-06-09  73  

:::::: The code at line 72 was first introduced by commit
:::::: 43ed982e66f0db6ae717f06de75f3dab345d136b dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
