Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0B510FF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691531357; x=1723067357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I7vEmMqo6JO8taKMXsYw3QLFkpZhjOLXBgA3be6BhAQ=;
  b=Zrp0xnW8H8aHsIyfloqRzFyZGWr09OxHIqoFfpIBN9xSmBIDU48T2rIp
   73uWWQjaAJ0Ftx3bbBy4E3FXEpTN75J+guv+bwTxaNVRLPKhX8MqCaY7v
   q413m06lMtx96mjvJ1qZHKhuml7hCU3cK3fM5rxEkD2Lejms/gWaAGZc4
   SCCoZULDwi0YIBuvx9TF3+zqo1vGa7fx6FC88Eqrq9kZDFYiGpayUOj6h
   uAr9gIxUSwh5HiUHTXgVcMeWD11aCxyzsQO+Pi71U6OCnuubXME0s2gyz
   6a1InpO1z1FsxBB4H0QAOttb4BC7C2QUg9iTLvSeq4EK8u0AtUfA6XQJ5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434841586"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="434841586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 14:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681416944"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="681416944"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 14:49:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTUZn-0005dk-08;
	Tue, 08 Aug 2023 21:49:15 +0000
Date: Wed, 9 Aug 2023 05:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 85/92]
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:176:13: error: use of undeclared
 identifier 'drm_plane_helper_destroy'; did you mean
 'drm_primary_helper_destroy'?
Message-ID: <202308090557.EoDHybf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   9524fb3148a6e7903caa30b55827de7d6c34cbec
commit: 9d63f3b1b7d0b978455f44d2038f462733607027 [85/92] drm/fsl-dcu: Use drm_plane_helper_destroy()
config: arm-randconfig-r046-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090557.EoDHybf5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090557.EoDHybf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090557.EoDHybf5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c:176:13: error: use of undeclared identifier 'drm_plane_helper_destroy'; did you mean 'drm_primary_helper_destroy'?
           .destroy = drm_plane_helper_destroy,
                      ^~~~~~~~~~~~~~~~~~~~~~~~
                      drm_primary_helper_destroy
   include/drm/drm_plane_helper.h:41:6: note: 'drm_primary_helper_destroy' declared here
   void drm_primary_helper_destroy(struct drm_plane *plane);
        ^
   1 error generated.


vim +176 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c

   172	
   173	static const struct drm_plane_funcs fsl_dcu_drm_plane_funcs = {
   174		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
   175		.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 > 176		.destroy = drm_plane_helper_destroy,
   177		.disable_plane = drm_atomic_helper_disable_plane,
   178		.reset = drm_atomic_helper_plane_reset,
   179		.update_plane = drm_atomic_helper_update_plane,
   180	};
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
