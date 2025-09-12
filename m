Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE571A08A3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 22:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716317; cv=none; b=ExTzxFruy7kxr11am1BBighgSk2XYEBZbO5KnwtEzvzyXz88CmWPjTG3sMam1xhXBO3ZBnHx3gVqsOYbCVgoZMWmBw729/li8UiiIoy4DqPwtEkGCSeyjjys3IsmbqUGx+uZNgDft1n76yvGV4fZlOIg6vYBObajqKXpoBp3uCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716317; c=relaxed/simple;
	bh=3dR76S7VEEekPjEg+Pp6tjEM7M4b+D5O1k5F/L+tPgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJMUwTIswH0UTrvi8u1Ewf6koUwtNu87cYC8erpEZ1RO8hyjB/OIjW2kLqPIdXa9zrwESFnXqmPDxYk8geOlpX0dVjclzX5WH8O8Vf98+SpsSt3EJWgdJMV+SEoR6fLCdlwXQTveWnQqxhaUamAB4njRmt40Ixyy8HXxfMR6FL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEg+xS0Z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEg+xS0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757716315; x=1789252315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dR76S7VEEekPjEg+Pp6tjEM7M4b+D5O1k5F/L+tPgI=;
  b=KEg+xS0Ze9M/hz4f7Bzx/ScPm5uZ3j3JSc+HujgtWw54QPLXY5gPdmQC
   58ejmlxNjmhQcqthsDPXjsVTwYEJOSIznwu6MehZ9Q+DsGMRq4ZMw7uRp
   PJ4nyii8XH91gCINAq2FCbJvhj0Z5VS9kZo6LVBstDz7t02ODZUhwUMMf
   dqjtMkhT693nBXE29EJBi/yLhMLKKnFiqWSRHHR/5Tau5/b1wFeifWLET
   kJeSl6mRVLlolSsBk+ejLVwZBUZoYOF8nvrRF6bew6pCYOdXfr5nrvTUI
   Sd83C4ZBOlQpVnwR+kG8Senz7S3GJB6BrOcK7QqSCVVG1/nvGDGuaWrBB
   Q==;
X-CSE-ConnectionGUID: cjJOS2oYSxOKNI+w39qCBw==
X-CSE-MsgGUID: 1rZMIM7PTRuybVyozmyB1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70749264"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="70749264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 15:31:54 -0700
X-CSE-ConnectionGUID: Cng8T9+fRFSdgTEnYZhrwg==
X-CSE-MsgGUID: w01T+NbgTbi5xt7+fnh9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; 
   d="scan'208";a="178122662"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Sep 2025 15:31:53 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxCIw-0001Ee-0n;
	Fri, 12 Sep 2025 22:31:48 +0000
Date: Sat, 13 Sep 2025 06:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2886/2886]
 drivers/infiniband/core/ib_core_cq_poll.c:92:6: warning: no previous
 prototype for function 'cq_polling'
Message-ID: <202509130621.eY2Y6kXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea2f61405cf31bc46bf79f5297ca294ea5a7a9c7
commit: 11fa263277520b886a650fadf4f719a2878229d0 [2886/2886] Add poll method for nfs for virtCCA CVM.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250913/202509130621.eY2Y6kXo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509130621.eY2Y6kXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509130621.eY2Y6kXo-lkp@intel.com/

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
