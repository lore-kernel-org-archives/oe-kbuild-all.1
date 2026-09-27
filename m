Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D053BC68D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 19:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536244; cv=none; b=Ulmqeajrb3ZLBhUzcpMqGPHp/P+RA6UJcOsxwCw+u0a7rjOydno6YjPnD5FF7sxu9F5vpetGdstQxzCXqp4iUC+RBYDZe4B9MIkLM0XcN8aD47isPLseRYkGjflvoeJFge0S4dAjFFmVrukgfiia7ATzZtdpkumNLz8cM1p3ZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536244; c=relaxed/simple;
	bh=amQmBqcJAFgaxLxGp1lC1cUfUiezIC5/RD8SqPiAdxw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N+u3U7k6MafRPBRn2Z9EWi9ufC2n8lpJOffMylfW8wWDGGepVPC5QuoBaEgFoN8rthUyap2Y2rkj35x6q8gJI6GAgd8QTfRQFa/w22OaKlJHhtxTTjpQUoDIUXbAT1NVsA1MNRVyfl3a2FKiXzOQJj/kQKD7txQYmcm5s1tlxRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFjCOUx1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFjCOUx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790536242; x=1822072242;
  h=date:from:to:cc:subject:message-id;
  bh=amQmBqcJAFgaxLxGp1lC1cUfUiezIC5/RD8SqPiAdxw=;
  b=XFjCOUx1ukdjmkYdqlEM9T2WEt4bRJ82KG2MyY5w8V1zfQQ67UUQXt5t
   zFSiGvw6aPIh0CGqRjHUe7DF7zfxDVuT0mTnTC3cLRUaG1P+RkUWjuayf
   4WVjs+fIsY7XbdvfMajx+o2ohYgB1/yWjYwQvX8TTitPlBiyWg8ust8LP
   Lo5Gd9WyGAE+kq2FhnbEz2ydl8AXRzXeb/ZVTLpSQUYevgGkvFghBvdbw
   7Vm+fTheq5W/u77iFpZb64Cmmq9lDgUqv3ntWEMyGu2mHN0zGAJ5kx16c
   K88D7h7uyMi6nY+p1HdOTOYNlp1KbWsRtITJg/S9INLVFh/AjHPr28ocz
   Q==;
X-CSE-ConnectionGUID: c1a1n6nkSg+vXCmgxw4CVw==
X-CSE-MsgGUID: 3LXy13jHR/6VDW6svnFGDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="113027769"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="113027769"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 12:10:40 -0700
X-CSE-ConnectionGUID: 28rv7GBpQvKemaqJWhsiYA==
X-CSE-MsgGUID: mV6x/FlcQvesRBPYanu5Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="274081186"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Sep 2026 12:10:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAuGh-00000000N6A-3OPO;
	Sun, 27 Sep 2026 19:10:35 +0000
Date: Mon, 28 Sep 2026 03:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] fs/fuse/dev.c:458:55:
 warning: suggest parentheses around arithmetic in operand of '|'
Message-ID: <202609280355.4uhUUzpD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   5169763275538844ab830145369bb81f14d261d3
commit: aff1917ea969915365f9595cdffba56f1c7ee9c3 [1/1] ANDROID: fuse: Use freezable wait in request_wait_answer to avoid suspend deadlock
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260928/202609280355.4uhUUzpD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609280355.4uhUUzpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280355.4uhUUzpD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swait.h:8,
                    from include/linux/completion.h:12,
                    from include/linux/mm_types.h:14,
                    from include/linux/bpf.h:16,
                    from include/linux/filter.h:9,
                    from fs/fuse/fuse_i.h:17,
                    from fs/fuse/dev.c:9:
   fs/fuse/dev.c: In function 'request_wait_answer':
>> fs/fuse/dev.c:458:55: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     458 |                                         TASK_KILLABLE | TASK_FREEZABLE);
         |                                                       ^
   include/linux/wait.h:284:11: note: in definition of macro '___wait_is_interruptible'
     284 |          (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
         |           ^~~~~
   include/linux/wait.h:936:9: note: in expansion of macro '___wait_event'
     936 |         ___wait_event(wq, condition, state, 0, 0, schedule())
         |         ^~~~~~~~~~~~~
   include/linux/wait.h:959:25: note: in expansion of macro '__wait_event_state'
     959 |                 __ret = __wait_event_state(wq_head, condition, state);          \
         |                         ^~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:456:23: note: in expansion of macro 'wait_event_state'
     456 |                 err = wait_event_state(req->waitq,
         |                       ^~~~~~~~~~~~~~~~
   fs/fuse/dev.c:482:47: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
     482 |                          TASK_UNINTERRUPTIBLE | TASK_FREEZABLE);
         |                                               ^
   include/linux/wait.h:284:11: note: in definition of macro '___wait_is_interruptible'
     284 |          (state & (TASK_INTERRUPTIBLE | TASK_WAKEKILL)))
         |           ^~~~~
   include/linux/wait.h:936:9: note: in expansion of macro '___wait_event'
     936 |         ___wait_event(wq, condition, state, 0, 0, schedule())
         |         ^~~~~~~~~~~~~
   include/linux/wait.h:959:25: note: in expansion of macro '__wait_event_state'
     959 |                 __ret = __wait_event_state(wq_head, condition, state);          \
         |                         ^~~~~~~~~~~~~~~~~~
   fs/fuse/dev.c:480:9: note: in expansion of macro 'wait_event_state'
     480 |         wait_event_state(req->waitq,
         |         ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +458 fs/fuse/dev.c

   433	
   434	static void request_wait_answer(struct fuse_req *req)
   435	{
   436		struct fuse_conn *fc = req->fm->fc;
   437		struct fuse_iqueue *fiq = &fc->iq;
   438		int err;
   439	
   440		if (!fc->no_interrupt) {
   441			/* Any signal may interrupt this */
   442			err = wait_event_freezable(req->waitq,
   443						test_bit(FR_FINISHED, &req->flags));
   444			if (!err)
   445				return;
   446	
   447			set_bit(FR_INTERRUPTED, &req->flags);
   448			/* matches barrier in fuse_dev_do_read() */
   449			smp_mb__after_atomic();
   450			if (test_bit(FR_SENT, &req->flags))
   451				queue_interrupt(req);
   452		}
   453	
   454		if (!test_bit(FR_FORCE, &req->flags)) {
   455			/* Only fatal signals may interrupt this */
   456			err = wait_event_state(req->waitq,
   457						test_bit(FR_FINISHED, &req->flags),
 > 458						TASK_KILLABLE | TASK_FREEZABLE);
   459			if (!err)
   460				return;
   461	
   462			spin_lock(&fiq->lock);
   463			/* Request is not yet in userspace, bail out */
   464			if (test_bit(FR_PENDING, &req->flags)) {
   465				list_del(&req->list);
   466				spin_unlock(&fiq->lock);
   467				__fuse_put_request(req);
   468				req->out.h.error = -EINTR;
   469				return;
   470			}
   471			spin_unlock(&fiq->lock);
   472		}
   473	
   474		/*
   475		 * Either request is already in userspace, or it was forced.
   476		 * Wait it out using an uninterruptible freezable sleep so system suspend
   477		 * does not deadlock if FuseDaemon is already frozen, while ignoring
   478		 * non-fatal signals.
   479		 */
   480		wait_event_state(req->waitq,
   481				 test_bit(FR_FINISHED, &req->flags),
   482				 TASK_UNINTERRUPTIBLE | TASK_FREEZABLE);
   483	}
   484	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
