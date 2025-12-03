Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98480277017
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764737597; cv=none; b=bVJrlxGkvFYPGfNhFdX1xLSb2hlPIh66RoDThGGG/ry8WRStIGlviXyKhRh6GSMEU+3obOVNHozIDte89NO5zYd5zyAQsnvjGaOWAcZD3KtEyPZN3/YiWxCs1upsnbHCoawo0L2clZHqd97J7Jh4ohfG1+JF1fUfWyO/0kfo8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764737597; c=relaxed/simple;
	bh=cvvkHTgu1iwd/TOYBWzQKnNoQretetx50/FUECui9VI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8fOLCMh94B0n6djKUmFLyDaUCK7c3ymN4m3vy6+d2zs9I6BybFKvT+8v5jkiJXGIKbR9XcwMjzxkXpXKgsHbQ0nGDrfVY0apWG3qbcfpD3mrOQUsDxoRH36O9Kq+4wqIhirV+AyUmJPOBtonM5uGu7Pm0i3EmjtZwZtHxUXR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9xD6evA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9xD6evA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764737596; x=1796273596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvvkHTgu1iwd/TOYBWzQKnNoQretetx50/FUECui9VI=;
  b=L9xD6evASXUsKgFMSSCUWbRuB5LgRAZkaw7KnAxFbCrJJqw1knmKAbzQ
   CqoI3pTRgpqreteNQ0cdPVMpjjxNSWl59O8YxznIGvNjghHY5hSL1iPPn
   3n4Q0AzewAG5Y3+2bvpRRJ7672DHBIlEAXa7kBWElq87V/lXL+oDKIZ1G
   xw1lF9cD80EyBOnfxyW/SACHoHAdvXGiTJcZXBE2P8wDdyVMl4Pqiy74O
   mJCY/2iIJNqQKLNoqcvIYmsmqBblekZX/HXujuUuHao9VYLoKZSVdw9+9
   Npgr9JJkWGb5xJah7Jhvsa+0kOyM7QfuBfDAjOJykNt0ad5M2Y7CZuGVm
   A==;
X-CSE-ConnectionGUID: JZPlcmf+T3uNHCY7P03koA==
X-CSE-MsgGUID: v0XZlnIaSCmFaz8amv7PoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78067451"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="78067451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:53:15 -0800
X-CSE-ConnectionGUID: NDVG6z8mQmyFPllhyJXtUA==
X-CSE-MsgGUID: F3qVYAQtQqmgHufqnyRhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="193658654"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Dec 2025 20:53:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQerX-00000000AaL-1NSp;
	Wed, 03 Dec 2025 04:53:11 +0000
Date: Wed, 3 Dec 2025 12:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 drivers/gpu/drm/xe/xe_work_period.c:454: warning: Function parameter or
 struct member 'xe' not described in 'xe_work_period_suspend'
Message-ID: <202512031226.Kyipeejr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   db0c22e7c787ae43e1961147bbefee206bb885ee
commit: c1b1ceb28458b92550c1e06b11f7d5b05bb36be8 [2/2] ANDROID: drm/xe: Add gpu_work_period tracepoint
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251203/202512031226.Kyipeejr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031226.Kyipeejr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031226.Kyipeejr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_work_period.c:454: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_suspend'
>> drivers/gpu/drm/xe/xe_work_period.c:474: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_resume'
>> drivers/gpu/drm/xe/xe_work_period.c:500: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_init'
>> drivers/gpu/drm/xe/xe_work_period.c:515: warning: Function parameter or struct member 'xe' not described in 'xe_work_period_fini'


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
