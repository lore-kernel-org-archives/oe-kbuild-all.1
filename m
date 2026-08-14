Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C55319E839
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667369; cv=none; b=ivq8TzxZGQff2RHSOKaE+hII3iDZQoULv5loYvsCo/YYA5sQN8D7GPmE5lgd9Cw+9njv/5/t+oGLi+tE0xxmsrDFFyVY/05Jhl3+3WV5na7sksF9Y7OVgT2U/wr3KqWbrVF7JnyON6oYGDyAjcaWdi6IFo69E+YN9pJNVSaSHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667369; c=relaxed/simple;
	bh=AWH59JCBODQsUR4fbhlYTzDungusyk9fG+LEGWAtONc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KDoHrCGRRhbAORnnc1lrrg9mQgkbMxuOBwIy01rCTP+pL++l/UpV+jAFF+C1vcy8nrU5q1JxL1nPJ7W4aQWfsb/tQ/8oFzYqZGND+dctzTfbqxY6TpSlUolywq9H+4gKxH4qPLwbmsimo1K6OTM7O8aKOO4e9ugspF4zvg6YjCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fu/+H5pD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fu/+H5pD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786667367; x=1818203367;
  h=date:from:to:cc:subject:message-id;
  bh=AWH59JCBODQsUR4fbhlYTzDungusyk9fG+LEGWAtONc=;
  b=Fu/+H5pDus1TCs8MadbQbvSC4hmmi297aV/XCtBzyGcBcbUawrixZO3O
   f7t5TawXN3CXvnlXKDXPwisbjvNqkfcccQCJkfn1TgXfvFLJpRbaBL/zW
   +mQJpelCLfihVI0YE3iIdkoCr8SzmLu9peHGzuz1UkQiiZiRtv2LHQUwK
   9WEf7GlSy75CFF9xXzCh7PA1eb/7yXjNqn6qN/YiJhQUB/juDYrkZ4Dzl
   j7DSUZTwuq4UFRAMULcOVN0e59Tl6Hefv4JR20fA+YRtaj/TTkTr0I5cQ
   Asz9Sj4YSkox09KOFKdkXzTDt9rBYA1ebHboph9w7I/Gsxp/oSbSx0/lq
   Q==;
X-CSE-ConnectionGUID: pWr2+2DvTcyS4meAgU7gZw==
X-CSE-MsgGUID: empO5aXUR029l5bQDG86gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86370315"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="86370315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 17:29:26 -0700
X-CSE-ConnectionGUID: /Ja6E8AnQXSpSAsg+F6GwA==
X-CSE-MsgGUID: 2zRcWGAaToidUUHMuj02IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="269273005"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Aug 2026 17:29:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wufnW-00000000X5C-0sla;
	Fri, 14 Aug 2026 00:29:22 +0000
Date: Fri, 14 Aug 2026 08:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/gpu/drm/xe/xe_work_period.c:454: warning: Function parameter or
 struct member 'xe' not described in 'xe_work_period_suspend'
Message-ID: <202608140741.c354HCLB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: c1b1ceb28458b92550c1e06b11f7d5b05bb36be8 [1/1] ANDROID: drm/xe: Add gpu_work_period tracepoint
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608140741.c354HCLB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140741.c354HCLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140741.c354HCLB-lkp@intel.com/

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
