Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC43B2C1597
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766934503; cv=none; b=qB/vaBVgXwhBnwlZuJ5Cd+UNtkGUuc4i9PZvALryMkG7u2Z/Api2x2552mHwEf2n7WXhZypEkYtRTIVP9QtDxZ7YWC3bN3/h+ZoaGB8t0qqRACp095w+YEevSpD3ymU8T3G5XdeMgI8Uv0lFCi+TL4sZBUfu1Bymoi5JgRtEFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766934503; c=relaxed/simple;
	bh=l+LrQsxrr2BRyVtEuRpSqKGvmXOiA/tcOtW5TeSnOIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ivu4l/7fNshBKxPQ1qFdLA6FuHk+23/EC1umJIoDbrYCswUBYOHsh83QIIEKzmvRVw6P+aMKDbErQWlTS0zcov+riEvF42r1QUXbJXg+O3QQAJ6r7iwp3xD9lnb2y0VOaH33QnH6X662a3eKmaz6z1LkHAhyB/fGl3GP/hBvZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISJ3Irn3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISJ3Irn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766934502; x=1798470502;
  h=date:from:to:cc:subject:message-id;
  bh=l+LrQsxrr2BRyVtEuRpSqKGvmXOiA/tcOtW5TeSnOIA=;
  b=ISJ3Irn3OVGXjC0glWRCYQh8dqr/6dYJy/535raVW/D2PJCyrnKnB45F
   tZ1VqG5F+/7BLmW0dYL5vBCveR6ADbQN+/ueST4fzkCXEZdk5XH/vqoOk
   ns23wjIejT+tEGEeo1E846k8v6xmXxi8wXLI0zhj5QL/+w3ck5CRcrp1V
   ZxjTPyCl9/vUtI/lisLO6zFCvX1/Go08ymJU9RsILCIHhcENF2+F9fY2E
   uBF9TyceJA7Fb+jTprB49tHHm9c1EF82iP/EASLB50hW/2HQoO6xjbZiU
   9Nwmakr6jgmV75rETWBNHbmyO58gB7twCulJ4tig1XywYnYnu7vxzW/It
   Q==;
X-CSE-ConnectionGUID: WrH6grVjTdKF8Sdv7Ddq+A==
X-CSE-MsgGUID: uo+sovMnTJ6PBSmU17WcCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79943306"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79943306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 07:08:20 -0800
X-CSE-ConnectionGUID: JySO0nMzRKCwYf7+BuMkMQ==
X-CSE-MsgGUID: 9FE169z4QAmaHDUBoA2SrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="205774345"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Dec 2025 07:08:18 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZsNR-000000006X5-3SKv;
	Sun, 28 Dec 2025 15:08:14 +0000
Date: Sun, 28 Dec 2025 23:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/urma/uburma/uburma_cmd.c:293:6: warning: no previous prototype for
 'uburma_jetty_grp_event_cb'
Message-ID: <202512282228.fRYsF4D1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: 0f1d535c6189b83237973170b71128b049fba6e5 [13/13] uburma: implement jetty resource control and command structures
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251228/202512282228.fRYsF4D1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512282228.fRYsF4D1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512282228.fRYsF4D1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/uburma/uburma_cmd.c:232:6: warning: no previous prototype for 'uburma_jfc_event_cb' [-Wmissing-prototypes]
     232 | void uburma_jfc_event_cb(struct ubcore_event *event,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:247:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     247 | void uburma_jfs_event_cb(struct ubcore_event *event,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:262:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     262 | void uburma_jfr_event_cb(struct ubcore_event *event,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:277:6: warning: no previous prototype for 'uburma_jetty_event_cb' [-Wmissing-prototypes]
     277 | void uburma_jetty_event_cb(struct ubcore_event *event,
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:293:6: warning: no previous prototype for 'uburma_jetty_grp_event_cb' [-Wmissing-prototypes]
     293 | void uburma_jetty_grp_event_cb(struct ubcore_event *event,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/uburma/uburma_dev_ops.c:68:6: warning: no previous prototype for 'uburma_unregister_mmu' [-Wmissing-prototypes]
      68 | void uburma_unregister_mmu(struct uburma_file *file)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:80:5: warning: no previous prototype for 'uburma_register_mmu' [-Wmissing-prototypes]
      80 | int uburma_register_mmu(struct uburma_file *file)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_dev_ops.c:96:5: warning: no previous prototype for 'uburma_mmap' [-Wmissing-prototypes]
      96 | int uburma_mmap(struct file *filp, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:138:6: warning: no previous prototype for 'uburma_release_file' [-Wmissing-prototypes]
     138 | void uburma_release_file(struct kref *ref)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:164:5: warning: no previous prototype for 'uburma_open' [-Wmissing-prototypes]
     164 | int uburma_open(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:232:5: warning: no previous prototype for 'uburma_close' [-Wmissing-prototypes]
     232 | int uburma_close(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/uburma_jetty_grp_event_cb +293 drivers/ub/urma/uburma/uburma_cmd.c

   246	
 > 247	void uburma_jfs_event_cb(struct ubcore_event *event,
   248				 struct ubcore_ucontext *ctx)
   249	{
   250		struct uburma_jfs_uobj *jfs_uobj;
   251	
   252		if (!event->element.jfs)
   253			return;
   254	
   255		jfs_uobj = (struct uburma_jfs_uobj *)
   256				   event->element.jfs->jfs_cfg.jfs_context;
   257		uburma_write_async_event(ctx, event->element.jfs->urma_jfs,
   258					 event->event_type, &jfs_uobj->async_event_list,
   259					 &jfs_uobj->async_events_reported);
   260	}
   261	
   262	void uburma_jfr_event_cb(struct ubcore_event *event,
   263				 struct ubcore_ucontext *ctx)
   264	{
   265		struct uburma_jfr_uobj *jfr_uobj;
   266	
   267		if (!event->element.jfr)
   268			return;
   269	
   270		jfr_uobj = (struct uburma_jfr_uobj *)
   271				   event->element.jfr->jfr_cfg.jfr_context;
   272		uburma_write_async_event(ctx, event->element.jfr->urma_jfr,
   273					 event->event_type, &jfr_uobj->async_event_list,
   274					 &jfr_uobj->async_events_reported);
   275	}
   276	
   277	void uburma_jetty_event_cb(struct ubcore_event *event,
   278				   struct ubcore_ucontext *ctx)
   279	{
   280		struct uburma_jetty_uobj *jetty_uobj;
   281	
   282		if (!event->element.jetty)
   283			return;
   284	
   285		jetty_uobj = (struct uburma_jetty_uobj *)
   286				     event->element.jetty->jetty_cfg.jetty_context;
   287		uburma_write_async_event(ctx, event->element.jetty->urma_jetty,
   288					 event->event_type,
   289					 &jetty_uobj->async_event_list,
   290					 &jetty_uobj->async_events_reported);
   291	}
   292	
 > 293	void uburma_jetty_grp_event_cb(struct ubcore_event *event,
   294				       struct ubcore_ucontext *ctx)
   295	{
   296		struct uburma_jetty_grp_uobj *jetty_grp_uobj;
   297	
   298		if (!event->element.jetty_grp)
   299			return;
   300	
   301		jetty_grp_uobj =
   302			(struct uburma_jetty_grp_uobj *)
   303				event->element.jetty_grp->jetty_grp_cfg.user_ctx;
   304		uburma_write_async_event(ctx, event->element.jetty_grp->urma_jetty_grp,
   305					 event->event_type,
   306					 &jetty_grp_uobj->async_event_list,
   307					 &jetty_grp_uobj->async_events_reported);
   308	}
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
