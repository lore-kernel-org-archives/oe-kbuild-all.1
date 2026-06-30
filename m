Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D791F43D4FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831247; cv=none; b=rq+jduEm9vmhYAPdcTe/o1HxiIeOfx2e+LDeXi3QUclL73dqYAFXRXNP53phIQjPRkHofJMd+0lTpfI49yE/FAI24h+dpjPxQ8gwtk6xjqxk83zahsP/Un3qHM2/hisFUqqRMFv/5iAB9bmD0fkvINy0JaPVCRyGOG29c8DZM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831247; c=relaxed/simple;
	bh=qw4ePhfZqOnnbwEqeFWaKYowxNHkiMZQUMaCnO4jq+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TAd2YFVG+gV6KZXVndgwPrsonvemWyGrnaWU2Shg3ioRkmrYFRtR4+vju8Q853EJeVSGfgFUC/1M/4HZ9eDlimMZ2jp98So7mcNd0uT/loo587AfeuIc4icdjn0kJE9eBHNjG6EKcx2NvtOVTjbTogleLU2P+s4LqnKrdy56uH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/GD9VBJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/GD9VBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782831246; x=1814367246;
  h=date:from:to:cc:subject:message-id;
  bh=qw4ePhfZqOnnbwEqeFWaKYowxNHkiMZQUMaCnO4jq+A=;
  b=I/GD9VBJsSaxSyEX4q4Hpef5HKcG0ED2DesihhQGE8LNITetzTU5Sda0
   AmtcKPC0x6hcQZG90k0FolcgCscN3uUKGsepW6Sm7GIg4aJ3fGRrUxGoL
   RKwisZzvLPhL9OqkwXQuDgvMMx3zB4j+0x1tmEjavxjKqPkDTfckjqneg
   jmeOMT5zMZrPRrJd9TiqCz/lamCkIklEVUrI6buD+qMEtkKS/DBYK3xUx
   rU+f2MbVG+CWXGGfjogkI+IkacZNWJv5FsOoKpZbIcr0hpYzyMmU9latV
   w5GgAUiIA+hsHTfwZEIockXc46f93mZzwr1I1aCdb1j/g8CYE27A9E/DP
   A==;
X-CSE-ConnectionGUID: GfLJ2M3QSxqqiTViH/56Pw==
X-CSE-MsgGUID: SGViOpv0TZCAVAIx7eMuyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83323830"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83323830"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 07:53:51 -0700
X-CSE-ConnectionGUID: 1JLbhS+JR9SHOElBVyn5sA==
X-CSE-MsgGUID: X30ZXrwFRVGZtmIb4QSq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="282352570"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2026 07:53:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weZqM-000000008Qk-1M5H;
	Tue, 30 Jun 2026 14:53:46 +0000
Date: Tue, 30 Jun 2026 22:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 1/3] drivers/gpu/drm/xe/xe_pt.c:1418:13:
 warning: 'xe_pt_svm_userptr_notifier_lock' defined but not used
Message-ID: <202606302210.QqcLbOEN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   e459a3bdeb117be496d7f229e2ea1f6c9fe4080b
commit: 80ccbd97ffee8ad2e73167d826fe7be548364365 [1/3] drm/xe/userptr: Hold notifier_lock for write on inject test path
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260630/202606302210.QqcLbOEN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606302210.QqcLbOEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606302210.QqcLbOEN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_pt.c:1418:13: warning: 'xe_pt_svm_userptr_notifier_lock' defined but not used [-Wunused-function]
    1418 | static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xe_pt_svm_userptr_notifier_lock +1418 drivers/gpu/drm/xe/xe_pt.c

  1408	
  1409	/*
  1410	 * Acquire/release the svm notifier_lock around xe_pt_svm_userptr_pre_commit()
  1411	 * and the matching late release in xe_pt_update_ops_run(). Read mode by
  1412	 * default; write mode when CONFIG_DRM_XE_USERPTR_INVAL_INJECT is on,
  1413	 * because a userptr op in this critical section may invoke the injected
  1414	 * xe_vma_userptr_force_invalidate() path that calls
  1415	 * drm_gpusvm_unmap_pages() with ctx->in_notifier=true, which requires the
  1416	 * lock held for write.
  1417	 */
> 1418	static void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm)
  1419	{
  1420	#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
  1421		down_write(&vm->svm.gpusvm.notifier_lock);
  1422	#else
  1423		xe_svm_notifier_lock(vm);
  1424	#endif
  1425	}
  1426	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
