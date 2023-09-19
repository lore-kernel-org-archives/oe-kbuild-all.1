Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C7358B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695138689; x=1726674689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0K9EHyvRjvCf+K2LA48v9sIcYCTbDCh/cmOauiIFX8w=;
  b=mCqgAI527b/2q7p+9oEEJnfkRTqTY4PQgZ84t86dcaR7AIxM21e1pthT
   n7a0q8lPLno4fCeqgkga6ykPqs8eX4Vu1/wM1fwIu6sRFaJSvPHC7JGOg
   hoPcH4niA4JaU7fYUua6RVwXmdLYLbmng2sEVrPXxJLyr9LVlhpA+JoX6
   lVslrEtmefDHkx4g6CLkzyBGKCtFAEbUkcsZBQMWWzK+V/WkzXbVjBtd/
   PlRoVDg1rRuOlWLpQuBXk3FiFIMuPJZAQGa4S3bokNheji+Aq0bo9Tmh8
   J4AYOuS56BDrwGFZ8ga7ZEr65suJgNozTKpeXvusuBE5u2OpZ0fx8cQsr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377291641"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="377291641"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836481884"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="836481884"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2023 08:51:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qid0W-0007a6-2z;
	Tue, 19 Sep 2023 15:51:24 +0000
Date: Tue, 19 Sep 2023 23:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: include/drm/drm_print.h:524:49: warning: '%4.4s' directive argument
 is null
Message-ID: <202309192301.fMQKWYsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: 48b3207e4ed9e5140c69e229b697373f233419c8 drm/msm/dpu: simplify CDP programming
date:   4 months ago
config: sparc-randconfig-r014-20230610 (https://download.01.org/0day-ci/archive/20230919/202309192301.fMQKWYsm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192301.fMQKWYsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192301.fMQKWYsm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/drm/drm_mm.h:51,
                    from include/drm/drm_vma_manager.h:26,
                    from include/drm/drm_gem.h:40,
                    from drivers/gpu/drm/msm/msm_drv.h:34,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:20:
   In function '_dpu_plane_set_qos_lut',
       inlined from 'dpu_plane_sspp_update_pipe' at drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1126:2:
>> include/drm/drm_print.h:524:49: warning: '%4.4s' directive argument is null [-Wformat-overflow=]
     524 | #define __drm_dbg(cat, fmt, ...)                ___drm_dbg(NULL, cat, fmt, ##__VA_ARGS__)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_print.h:582:9: note: in expansion of macro '__drm_dbg'
     582 |         __drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:29:39: note: in expansion of macro 'DRM_DEBUG_ATOMIC'
      29 | #define DPU_DEBUG_PLANE(pl, fmt, ...) DRM_DEBUG_ATOMIC("plane%d " fmt,\
         |                                       ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:291:9: note: in expansion of macro 'DPU_DEBUG_PLANE'
     291 |         DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
         |         ^~~~~~~~~~~~~~~


vim +524 include/drm/drm_print.h

3bf149bd3fe12a Jani Nikula 2019-10-28  522  
84ec67288c10fb Jim Cromie  2022-09-11  523  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
d987150b539271 Wayne Lin   2022-12-23 @524  #define __drm_dbg(cat, fmt, ...)		___drm_dbg(NULL, cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie  2022-09-11  525  #else
84ec67288c10fb Jim Cromie  2022-09-11  526  #define __drm_dbg(cat, fmt, ...)					\
16deeb8e18cafd Jim Cromie  2022-09-11  527  	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
84ec67288c10fb Jim Cromie  2022-09-11  528  			       cat, fmt, ##__VA_ARGS__)
84ec67288c10fb Jim Cromie  2022-09-11  529  #endif
e820f52577b14c Jim Cromie  2022-09-11  530  

:::::: The code at line 524 was first introduced by commit
:::::: d987150b539271b0394f24c1c648d2846662adb4 drm/drm_print: correct format problem

:::::: TO: Wayne Lin <Wayne.Lin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
