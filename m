Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39E91F7070
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 06:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094498; cv=none; b=SSHcUpQJ2Uifv0thLJOqiRcVf+7/aiRIeQy2acqWnATeZ8iFfEG14Eo9c41Fhz0fX9e8EdSz3M43UIhG8LEcZqL6/EOulTwDCnK+nNWU2E0l1/3uB5WLqp8fWsUN5A4pUlpYtWxVQbUa4lJIGDp3kl3GQ8VIvb0vLu2NsDYfMok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094498; c=relaxed/simple;
	bh=/zsEwyoTWo757QheNB6u18ivoXkq5UItnPXuSVvLPoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSRvxhuXAJWVc/pgfsaZwhkTmdtFtjkRvX5QoRqOZv0y9bVaOpcqMZlKoRLxPV/0a1oJrvrLRHNRQ8IZoPkyyCVQJQCRH5o3BOLBVZbFrbY8203VaU1rwlpOpYiQTg3spesnuIMmsrvjNAwVsFWWtQvPXQPj7VhJNftIBm/00tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWYRbm7j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWYRbm7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737094498; x=1768630498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zsEwyoTWo757QheNB6u18ivoXkq5UItnPXuSVvLPoA=;
  b=GWYRbm7jc6Exdjll5pIFn6Onoc/7KKM6rUxjGUiIFcDUqEXb+jLjKieu
   sgHFk4H8anfps/x+I7sLlyMWWAgen4TchMWi9RHOXqXLVeaN31XUuEuoS
   rxSa/AIK4ocdGCNzmcEvYlmKnyHr9zx62FQiUYTe7Sh6uP8Q8llIvbuzl
   2DCuDYBvzghi33uTnscepXzDUrqUmtuyurK+aPnenDnZSfziD2Iz8/QzW
   pDIvetntkICUU343yzyUzdRp3MOHNzi0VuIC0emQKD70GKVQEYmRipJQv
   h3H+UKLeleKIVd54JGPzY/j+RgB2i6dKuAPKpeDIgIF75Q6J0J6bCEljb
   g==;
X-CSE-ConnectionGUID: PwOjBykIQG2WxiAtdGgytw==
X-CSE-MsgGUID: teBzOrrXTaicwq0hlPGWKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37541851"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37541851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 22:14:57 -0800
X-CSE-ConnectionGUID: EKfUKRGKTX+cagAhTPpX7w==
X-CSE-MsgGUID: 6OUJgZ0zTo2H0fVr8+xFPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105506451"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2025 22:14:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfd7-000Sq3-1Y;
	Fri, 17 Jan 2025 06:14:53 +0000
Date: Fri, 17 Jan 2025 14:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 32/36] kernel/events/core.c:5323:36: error: passing
 argument 1 of 'unwind_deferred_cancel' from incompatible pointer type
Message-ID: <202501171445.KEZKoUMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   dc92bc7c1009e5d80cd83d21ead7228bc6887c23
commit: 82462df3cdc83217ffda76a7c0a81b38636321d0 [32/36] perf: Add deferred user callchains
config: i386-buildonly-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171445.KEZKoUMS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171445.KEZKoUMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171445.KEZKoUMS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:65,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:94,
                    from kernel/events/core.c:34:
   include/linux/unwind_deferred.h:49:6: warning: no previous prototype for 'unwind_deferred_cancel' [-Wmissing-prototypes]
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c: In function 'perf_pending_unwind_sync':
>> kernel/events/core.c:5323:36: error: passing argument 1 of 'unwind_deferred_cancel' from incompatible pointer type [-Werror=incompatible-pointer-types]
    5323 |         if (unwind_deferred_cancel(&event->pending_unwind_work)) {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |
         |                                    struct unwind_work *
   include/linux/unwind_deferred.h:49:49: note: expected 'struct task_struct *' but argument is of type 'struct unwind_work *'
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         |                             ~~~~~~~~~~~~~~~~~~~~^~~~
>> kernel/events/core.c:5323:13: error: too few arguments to function 'unwind_deferred_cancel'
    5323 |         if (unwind_deferred_cancel(&event->pending_unwind_work)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/unwind_deferred.h:49:6: note: declared here
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c: In function 'perf_callchain':
>> kernel/events/core.c:7895:46: error: passing argument 1 of 'unwind_deferred_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    7895 |                 if (!unwind_deferred_request(&event->pending_unwind_work, &cookie)) {
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                              |
         |                                              struct unwind_work *
   include/linux/unwind_deferred.h:48:63: note: expected 'struct task_struct *' but argument is of type 'struct unwind_work *'
      48 | static inline int unwind_deferred_request(struct task_struct *task, struct unwind_work *work, u64 *cookie) { return -ENOSYS; }
         |                                           ~~~~~~~~~~~~~~~~~~~~^~~~
   kernel/events/core.c:7895:75: error: passing argument 2 of 'unwind_deferred_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
    7895 |                 if (!unwind_deferred_request(&event->pending_unwind_work, &cookie)) {
         |                                                                           ^~~~~~~
         |                                                                           |
         |                                                                           u64 * {aka long long unsigned int *}
   include/linux/unwind_deferred.h:48:89: note: expected 'struct unwind_work *' but argument is of type 'u64 *' {aka 'long long unsigned int *'}
      48 | static inline int unwind_deferred_request(struct task_struct *task, struct unwind_work *work, u64 *cookie) { return -ENOSYS; }
         |                                                                     ~~~~~~~~~~~~~~~~~~~~^~~~
>> kernel/events/core.c:7895:22: error: too few arguments to function 'unwind_deferred_request'
    7895 |                 if (!unwind_deferred_request(&event->pending_unwind_work, &cookie)) {
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/unwind_deferred.h:48:19: note: declared here
      48 | static inline int unwind_deferred_request(struct task_struct *task, struct unwind_work *work, u64 *cookie) { return -ENOSYS; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/unwind_deferred_cancel +5323 kernel/events/core.c

  5315	
  5316	static void perf_pending_unwind_sync(struct perf_event *event)
  5317	{
  5318		might_sleep();
  5319	
  5320		if (!event->pending_unwind_callback)
  5321			return;
  5322	
> 5323		if (unwind_deferred_cancel(&event->pending_unwind_work)) {
  5324			event->pending_unwind_callback = 0;
  5325			local_dec(&event->ctx->nr_no_switch_fast);
  5326			return;
  5327		}
  5328	
  5329		/*
  5330		 * All accesses related to the event are within the same RCU section in
  5331		 * perf_event_callchain_deferred(). The RCU grace period before the
  5332		 * event is freed will make sure all those accesses are complete by then.
  5333		 */
  5334		printk("wait event=%lx task=%d(%s) current=%d(%s)\n",
  5335		       (unsigned long)event,
  5336		       event->ctx->task ? event->ctx->task->pid : 0,
  5337		       event->ctx->task ? event->ctx->task->comm : "",
  5338		       current->pid, current->comm);
  5339		rcuwait_wait_event(&event->pending_unwind_wait, !event->pending_unwind_callback, TASK_UNINTERRUPTIBLE);
  5340		printk("wait end\n");
  5341	}
  5342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
