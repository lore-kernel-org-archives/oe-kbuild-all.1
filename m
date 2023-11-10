Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFAD38DC2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 17:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmkBCOUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699638944; x=1731174944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZF63sDUiX4AR9mM26k2dZiMwcqoex5DR9VpSPPJi2CU=;
  b=kmkBCOUAehRWvc/OpUm91d4pMPc8sRAIKywdGyrwUNeRTBvIZB/HfJsG
   spjiaL5XRu0YGpcgjoEr0ZStN/8Ug+w3Rpr0hBdMlpu4B34HkPsgjcyDc
   pVaS78hZd2aPOz+ZhVEqXvLHoIut1BKSSiA0y9CizH26cAwaj1+nXCJ+J
   dxD0ujx6gdyWP6tLTG7QVJ6STQAlWconsWAMRhMVIcNnzXMa3eat5W0Ma
   zQX6JRT1F7wOKbkbk0lY6IvDMU7bc44/HaG8jnbPbVikTuSC5qydQCwZi
   D5AaVMo4djLSc3DjGLcFHX2gxa431WA09SZrh2eQXbAyHcN3Ml+o+0Low
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369547603"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369547603"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 09:55:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763800178"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763800178"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 09:55:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1VjG-0009nO-23;
	Fri, 10 Nov 2023 17:55:38 +0000
Date: Sat, 11 Nov 2023 01:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [drm-intel:drm-intel-gt-next 1/6]
 drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: no return statement in
 function returning non-void
Message-ID: <202311110104.8TlHVxUI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   968853033d8aa4dbb80fbafa6f5d9b6a0ea21272
commit: e4ae85e364fc652ea15d85b0f3a6da304c9b5ce7 [1/6] drm/i915: Add ability for tracking buffer objects per client
config: x86_64-buildonly-randconfig-001-20231110 (https://download.01.org/0day-ci/archive/20231111/202311110104.8TlHVxUI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110104.8TlHVxUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110104.8TlHVxUI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_drv.h:54,
                    from drivers/gpu/drm/i915/gt/intel_context.h:14,
                    from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:8:
   drivers/gpu/drm/i915/i915_drm_client.h: In function 'i915_drm_client_remove_object':
>> drivers/gpu/drm/i915/i915_drm_client.h:81:1: warning: no return statement in function returning non-void [-Wreturn-type]
      81 | }
         | ^
--
   In file included from drivers/gpu/drm/i915/selftests/../i915_drv.h:54,
                    from drivers/gpu/drm/i915/selftests/igt_reset.c:12:
   drivers/gpu/drm/i915/selftests/../i915_drm_client.h: In function 'i915_drm_client_remove_object':
>> drivers/gpu/drm/i915/selftests/../i915_drm_client.h:81:1: warning: no return statement in function returning non-void [-Wreturn-type]
      81 | }
         | ^


vim +81 drivers/gpu/drm/i915/i915_drm_client.h

    78	
    79	static inline bool i915_drm_client_remove_object(struct drm_i915_gem_object *obj)
    80	{
  > 81	}
    82	#endif
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
