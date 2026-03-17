Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873C3A3E97
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748196; cv=none; b=RaXPMlvsFfQzDrVgXUEwO8vOwHcOBHTgxnJ4S9JMMH3d0evKAqLMmLXnP5CyGXAN9QkySnC+TMHQiV6tUpWAy4ztGgLSz7SZxfoVR61F/PKQveIqw24ZsAzJyx3IcxwbMfPl1PZslgWsG/POPmKB3OCWT0nrSSB7iLtdF3vGZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748196; c=relaxed/simple;
	bh=55qwkZ6Jo02yaLIwXpZ7ZknTllBxBnChU8qaF8LiruU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O6vCoP6bSa2glmfQZ5+h2ryRTN6RRQ4F92V0q2MSIxhhgUMvRNv01nKCZOxPC88p7CzGgrHVsP4hah4D86dvQoHK3KH6XtL8y1pJ0pwW0JOs74nQzhh4S2GeUC1lvEvNpCKLQT1e29s/J6DURVDrE7A7/v7+RNZ+W0zDkPXzdh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kks53on5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kks53on5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773748195; x=1805284195;
  h=date:from:to:cc:subject:message-id;
  bh=55qwkZ6Jo02yaLIwXpZ7ZknTllBxBnChU8qaF8LiruU=;
  b=kks53on5CZwrb86nXWc1UsahJaAgtJLc84jYFA2+qUu6jhdTVjrfV0RL
   4dH9q+VC5NRb9KcyrglNfpTYLepXR9o0SsEu5ebMZgTxy2BizwFNL2n5S
   cs9u84ufIyn28hZ2W4WK4OcaC5/R7ffrE6BEcSIP0Ltk9t/h0ZLzlg3M7
   r2sbZkbSY/l1v52/pC/KNtxRXx7muzaqZHckUlHfUt9Qa6b9MKmxtz52t
   vb/5LMRCrS8LIVwbm7TwDChlmCUk8lIahdMRftKzBOaMHgF2XbtRFBnEb
   N0tWfNic3sGjvqygkstYP1TWB8harxuY6bE1o1D2si0v9ccuC8s9Tccxe
   Q==;
X-CSE-ConnectionGUID: 3C3i9Rh1Tm6wgl3e8UqffQ==
X-CSE-MsgGUID: 4YZ3W8GrRYS6mpYDan633w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77386708"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77386708"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:49:54 -0700
X-CSE-ConnectionGUID: AWdB8q8uRpOWPSV+LtfKEQ==
X-CSE-MsgGUID: 27QU6lntQ6yH+FZGMqybig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226712871"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 04:49:52 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Svk-000000000Kj-0xtO;
	Tue, 17 Mar 2026 11:49:48 +0000
Date: Tue, 17 Mar 2026 19:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/gpu/drm/xe/xe_work_period.c:454: warning: Function parameter or
 struct member 'xe' not described in 'xe_work_period_suspend'
Message-ID: <202603171959.E19GiShC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   84a08aae07bb37efecc7e53784d0f13af15a374f
commit: c1b1ceb28458b92550c1e06b11f7d5b05bb36be8 [1/1] ANDROID: drm/xe: Add gpu_work_period tracepoint
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260317/202603171959.E19GiShC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171959.E19GiShC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171959.E19GiShC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_work_period.c:454: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_suspend'
>> drivers/gpu/drm/xe/xe_work_period.c:474: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_resume'
>> drivers/gpu/drm/xe/xe_work_period.c:500: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_init'
>> drivers/gpu/drm/xe/xe_work_period.c:515: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_fini'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +454 drivers/gpu/drm/xe/xe_work_period.c

   442	
   443	/**
   444	 * xe_work_period_suspend() - cancel all pending @xe_user workers
   445	 * @xe - the xe device
   446	 *
   447	 * Normally called during system suspend handlers or during @xe_device cleanup.
   448	 *
   449	 * Context: Process context. May take xe->work_period.lock if worker holds the
   450	 *	    last ref for its @xe_user.
   451	 * Return: void
   452	 */
   453	void xe_work_period_suspend(struct xe_device *xe)
 > 454	{
   455		struct xe_user *user = NULL;
   456		unsigned long i = 0;
   457	
   458		xa_for_each(&xe->work_period.users, i, user) {
   459			if (cancel_delayed_work_sync(&user->delay_work))
   460				xe_user_put(user);
   461		}
   462	}
   463	
   464	/**
   465	 * xe_work_period_resume() - schedule all previously suspended @xe_user workers
   466	 * @xe - the xe device
   467	 *
   468	 * Normally called during system resume handlers.
   469	 *
   470	 * Context: Process context.
   471	 * Return: void
   472	 */
   473	void xe_work_period_resume(struct xe_device *xe)
 > 474	{
   475		struct xe_user *user = NULL;
   476		unsigned long i = 0;
   477	
   478		/* no need to lock because schedule_next_work() atomically checks the
   479		 * validity of each user and acquires its own ref. If a user is dropped
   480		 * between reaching it in this iterator and attempting to get a ref, it
   481		 * can be safely excluded from rescheduling since there are no other
   482		 * remaining reference holders.
   483		 */
   484		xa_for_each(&xe->work_period.users, i, user) {
   485			user->last_timestamp_ns = ktime_get_raw_ns();
   486			schedule_next_work(user);
   487		}
   488	}
   489	
   490	/**
   491	 * xe_work_period_init() - setup work period reporting
   492	 * @xe - the xe device
   493	 *
   494	 * Normally called during @xe_device setup.
   495	 *
   496	 * Context: Any context.
   497	 * Return: void
   498	 */
   499	void xe_work_period_init(struct xe_device *xe)
 > 500	{
   501		mutex_init(&xe->work_period.lock);
   502		xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
   503	}
   504	
   505	/**
   506	 * xe_work_period_fini() - cleanup work period reporting
   507	 * @xe - the xe device
   508	 *
   509	 * Normally called during @xe_device cleanup.
   510	 *
   511	 * Context: Process context.
   512	 * Return: void
   513	 */
   514	void xe_work_period_fini(struct xe_device *xe)
 > 515	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
