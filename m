Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB119AA53
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729598258; cv=none; b=dHJsK5Gk8P5v5x6tmuaZY49YZ2V4+i6N6keKakzviUdnqa1/+SEXEHIkMEEccbJqPAkFMhETS3kK2Om4txZ860dz9H0DCXjeB9uj6seyNWVb0KZ0bHLSYBvchQe+QZ1ZC+xdfTRL4rjoOXrX0TUMsIU+QOQeyzQ/1tTMPo+4HYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729598258; c=relaxed/simple;
	bh=4a7KX8LIx8lZD9cXl0zlDNWPIiw1P3X0KO6bTg3rH84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+GIuy+3wvZlT1VlH1frjxoXi2AtYrxGIhZiwYt/UBpYIF/UjyPrmrcLpp79TjJKPKchF4puj+JM2awlWjytBbbK5hMAVYSL5c5pRMeoCkqgscUEDTDFS8ZbBTZ49vrOKOidFXD3Qo0aTXjnagncZRtYSyULqiMufeuQNdyAMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MamNPEdV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MamNPEdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729598256; x=1761134256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4a7KX8LIx8lZD9cXl0zlDNWPIiw1P3X0KO6bTg3rH84=;
  b=MamNPEdVWIQ1Vlzt+XJwf4vO7GF/Z9BfSmLOY3sXfmGjcmiqkQicjN9j
   AoCuS1I1jWi5jPYS53pMohIO1+3j8gBr4ZiTkY8QA8kYixJRkzvq11dv/
   qWU+Yi/j0pdlKc9rxM/Itba0cqa3CXr69yxLM5ezCFaK/H1//p9gkSIVf
   GlnLDWYFqe5OuktnmvM+Nw9XcMvJVuYGnX3wlGRMSLH2KulYofKxIaX/X
   sSB/uGn+1Xuz2nSP7C4kctPziog/gj0x/fUqH0zYzy6ENf8SGRq5n9I8w
   UeGswIhZL5B4W2Fq3faRj+Mcl69NIzieSfD8GsdakS2/iGdXki3E4id/g
   g==;
X-CSE-ConnectionGUID: I7X17CbOTSW2CRs2dyl6YQ==
X-CSE-MsgGUID: pL+ppehPR5SmCSQfNk8Zdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="40513944"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="40513944"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:57:36 -0700
X-CSE-ConnectionGUID: /DIaUfYIQEaaXr8JyMhFcA==
X-CSE-MsgGUID: iAk2dxmcQaavKrQQ3js5gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="83831413"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Oct 2024 04:57:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3DW0-000TWq-2Y;
	Tue, 22 Oct 2024 11:57:32 +0000
Date: Tue, 22 Oct 2024 19:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [linux-next:master 4727/6080]
 drivers/gpu/drm/xe/display/xe_display.c:382:27: error: passing argument 1 of
 'intel_dmc_suspend' from incompatible pointer type
Message-ID: <202410221913.RYoLStTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7436324ebd147598f940dde1335b7979dbccc339
commit: c141cf76918e25ec7bd433b47590e8c3f3d02542 [4727/6080] Merge drm/drm-next into drm-intel-next
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241022/202410221913.RYoLStTv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221913.RYoLStTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221913.RYoLStTv-lkp@intel.com/

Note: the linux-next/master HEAD 7436324ebd147598f940dde1335b7979dbccc339 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/display/xe_display.c: In function 'xe_display_pm_shutdown':
>> drivers/gpu/drm/xe/display/xe_display.c:382:27: error: passing argument 1 of 'intel_dmc_suspend' from incompatible pointer type [-Werror=incompatible-pointer-types]
     382 |         intel_dmc_suspend(xe);
         |                           ^~
         |                           |
         |                           struct xe_device *
   In file included from drivers/gpu/drm/xe/display/xe_display.c:24:
   drivers/gpu/drm/i915/display/intel_dmc.h:22:46: note: expected 'struct intel_display *' but argument is of type 'struct xe_device *'
      22 | void intel_dmc_suspend(struct intel_display *display);
         |                        ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/intel_dmc_suspend +382 drivers/gpu/drm/xe/display/xe_display.c

f90491d4b64e30 Maarten Lankhorst 2024-09-05  354  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  355  void xe_display_pm_shutdown(struct xe_device *xe)
501d799a47e2b8 Maarten Lankhorst 2024-09-05  356  {
501d799a47e2b8 Maarten Lankhorst 2024-09-05  357  	struct intel_display *display = &xe->display;
501d799a47e2b8 Maarten Lankhorst 2024-09-05  358  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  359  	if (!xe->info.probe_display)
501d799a47e2b8 Maarten Lankhorst 2024-09-05  360  		return;
501d799a47e2b8 Maarten Lankhorst 2024-09-05  361  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  362  	intel_power_domains_disable(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  363  	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  364  	if (has_display(xe)) {
501d799a47e2b8 Maarten Lankhorst 2024-09-05  365  		drm_kms_helper_poll_disable(&xe->drm);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  366  		intel_display_driver_disable_user_access(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  367  		intel_display_driver_suspend(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  368  	}
501d799a47e2b8 Maarten Lankhorst 2024-09-05  369  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  370  	xe_display_flush_cleanup_work(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  371  	intel_dp_mst_suspend(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  372  	intel_hpd_cancel_work(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  373  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  374  	if (has_display(xe))
501d799a47e2b8 Maarten Lankhorst 2024-09-05  375  		intel_display_driver_suspend_access(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  376  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  377  	intel_encoder_suspend_all(display);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  378  	intel_encoder_shutdown_all(display);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  379  
501d799a47e2b8 Maarten Lankhorst 2024-09-05  380  	intel_opregion_suspend(display, PCI_D3cold);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  381  
501d799a47e2b8 Maarten Lankhorst 2024-09-05 @382  	intel_dmc_suspend(xe);
501d799a47e2b8 Maarten Lankhorst 2024-09-05  383  }
501d799a47e2b8 Maarten Lankhorst 2024-09-05  384  

:::::: The code at line 382 was first introduced by commit
:::::: 501d799a47e2b83b4e41d5306c2266ea5c100a08 drm/xe: Wire up device shutdown handler

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
