Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC51917FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766674124; cv=none; b=CWFV9aWXI2ZZXrWsRcfJhCScSG8R1bOLHtOjl5E6Lb7Sw5JTjL9zFZaweiJHw7mv3mluvxdKRpxwf1eBKBLW2js7o41Ctdo9F6YMar6KI6HRZvv5Bkb6OcjbGoYT8ZhWyg6Cp51ggpbeqZ7jK2Z1yqS03FTC/EwUpS40E6qz+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766674124; c=relaxed/simple;
	bh=UVwQtYwLxC/5BcKVy3DNuk9BN+Wp7j7g5+B8rWyHNoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cZAgmfT252f6Yl2l4AsfHJ+vIz2ariqHeuPIE7ceLiUGCc6nbQ4BJ3J5TQ3CGkTtjon6xOt5kuypbafWVi45mlbd/5qsfH4OH2oUMm9o1aMJpHHDxLm2p81GFj5dflqnGG1IrH2KswNTdiX1yLkPEjis8F3wXxlBU837db/Dmz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5+CeRmI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5+CeRmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766674123; x=1798210123;
  h=date:from:to:cc:subject:message-id;
  bh=UVwQtYwLxC/5BcKVy3DNuk9BN+Wp7j7g5+B8rWyHNoQ=;
  b=c5+CeRmIBnbfLYxoE4WHLAH5WVBMpWAmPaQK9mCWAOM8UyeIwlw1X37g
   Yd+rd+323KFbus/L7T3GOq9j/SwC1FQmo21zkvz0dFgfgxcMVw7jBy+Hn
   tmpRqWf8rDVznNG2vDqW1UXJd2oujSdorEpqCPkKYrd7Kex+eUlLUoJyR
   nHHWixyCPInr1b3RFHLrmevsRFYqpKWNeea5Bqhfx1vI0gLmboYTKpo81
   iFZilT4IxalU7Kl34+4gDDFbiCZMuhy+9RYzLbN8yiMHNRB5AtWMiX/1A
   R+95j17gkCp65KvIdRy1fT/JzonAChKutXn8OBzaED2O4IgCyfRyv1oG7
   w==;
X-CSE-ConnectionGUID: 3Xo9F+meSUyjPkM4WKeIoA==
X-CSE-MsgGUID: gWN0lSQgSxqwsj+ybI/vHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85889372"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="85889372"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 06:48:41 -0800
X-CSE-ConnectionGUID: 3k3ITcBxSy6KSdl8i++k/Q==
X-CSE-MsgGUID: DIS7vYoZQcuhMZ55ralOuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="204758727"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2025 06:48:39 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYmdo-000000004Ar-2VsE;
	Thu, 25 Dec 2025 14:48:36 +0000
Date: Thu, 25 Dec 2025 22:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10/10]
 drivers/infiniband/core/ib_core_cq_poll.c:92:6: warning: no previous
 prototype for function 'cq_polling'
Message-ID: <202512252218.txZwa0HZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi hjx_gitff,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 11fa263277520b886a650fadf4f719a2878229d0 [10/10] Add poll method for nfs for virtCCA CVM.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251225/202512252218.txZwa0HZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252218.txZwa0HZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252218.txZwa0HZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/ib_core_cq_poll.c:92:6: warning: no previous prototype for function 'cq_polling' [-Wmissing-prototypes]
      92 | void cq_polling(void *data)
         |      ^
   drivers/infiniband/core/ib_core_cq_poll.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | void cq_polling(void *data)
         | ^
         | static 
>> drivers/infiniband/core/ib_core_cq_poll.c:123:6: warning: no previous prototype for function 'wakeup_and_poll' [-Wmissing-prototypes]
     123 | void wakeup_and_poll(struct task_struct *awakened_thread)
         |      ^
   drivers/infiniband/core/ib_core_cq_poll.c:123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     123 | void wakeup_and_poll(struct task_struct *awakened_thread)
         | ^
         | static 
>> drivers/infiniband/core/ib_core_cq_poll.c:130:5: warning: no previous prototype for function 'polling_thread' [-Wmissing-prototypes]
     130 | int polling_thread(void *data)
         |     ^
   drivers/infiniband/core/ib_core_cq_poll.c:130:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | int polling_thread(void *data)
         | ^
         | static 
>> drivers/infiniband/core/ib_core_cq_poll.c:147:5: warning: no previous prototype for function 'polling_awaken_thread' [-Wmissing-prototypes]
     147 | int polling_awaken_thread(void *data)
         |     ^
   drivers/infiniband/core/ib_core_cq_poll.c:147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | int polling_awaken_thread(void *data)
         | ^
         | static 
   4 warnings generated.


vim +/cq_polling +92 drivers/infiniband/core/ib_core_cq_poll.c

    91	
  > 92	void cq_polling(void *data)
    93	{
    94		void *cq;
    95		int completed = 0;
    96		unsigned long flags;
    97		u64 time_interval;
    98		ktime_t start_time_stamp, end_time_stamp;
    99		struct cq_poll_node *poll_node_entry, *poll_node_next;
   100	
   101		spin_lock_irqsave(&cq_list_lock, flags);
   102		list_for_each_entry_safe(poll_node_entry, poll_node_next,
   103						&ib_cq_poll_list, list) {
   104			cq = poll_node_entry->cq;
   105			if (!cq) {
   106				WARN_ONCE(1, "got NULL CQ 0x%p in poll list\n", cq);
   107				continue;
   108			}
   109			start_time_stamp = ktime_get();
   110			completed = ib_poll_cq_thread(cq);
   111			end_time_stamp = ktime_get();
   112			if (ib_cq_polling_kthread.debug_cq_poll_stat && completed) {
   113				time_interval = ktime_to_ns(ktime_sub(end_time_stamp, start_time_stamp));
   114				poll_node_entry->time_used_ns += time_interval;
   115				poll_node_entry->poll_cq_cnt++;
   116				if (poll_node_entry->max_time_ns < time_interval)
   117					poll_node_entry->max_time_ns = time_interval;
   118			}
   119		}
   120		spin_unlock_irqrestore(&cq_list_lock, flags);
   121	}
   122	
 > 123	void wakeup_and_poll(struct task_struct *awakened_thread)
   124	{
   125		wake_up_process(awakened_thread);
   126	
   127		cq_polling(NULL);
   128	}
   129	
 > 130	int polling_thread(void *data)
   131	{
   132		while (true) {
   133			if (ib_cq_polling_kthread.use_polling_kthread)
   134				wakeup_and_poll(waker_polling_thread);
   135	
   136			set_current_state(TASK_INTERRUPTIBLE);
   137			if (unlikely(kthread_should_stop())) {
   138				set_current_state(TASK_RUNNING);
   139				break;
   140			}
   141			schedule();
   142		}
   143	
   144		return 0;
   145	}
   146	
 > 147	int polling_awaken_thread(void *data)
   148	{
   149		while (true) {
   150			if (ib_cq_polling_kthread.use_polling_kthread)
   151				wakeup_and_poll(poll_cq_thread);
   152	
   153			set_current_state(TASK_INTERRUPTIBLE);
   154			if (unlikely(kthread_should_stop())) {
   155				set_current_state(TASK_RUNNING);
   156				break;
   157			}
   158			schedule();
   159		}
   160	
   161		return 0;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
