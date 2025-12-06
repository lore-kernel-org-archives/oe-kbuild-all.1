Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08B4195FE8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765052282; cv=none; b=SCDDiZXNjTdh2STw7mtChBkkEVLYSHPSGtR4xV7BJmSzGNrXo93WhR2I2AiLpuEMjdbKnsXmXUnV99CeAcQN9bu267PmzH2UVn7S8RVuJjmPva0bzw2ohiXkkRJ63eNUKbKQVh3hZJaaujDcgMq3SKoPw2GlD01JVAzUmbq0eJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765052282; c=relaxed/simple;
	bh=uiazsSI1fClrTeqFjfFNs3Qs0H50/57+MkcD0gOuJV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wp5/xU+tOt3BOGmn1ehGUXOuIfOovDifOi6zzsKRb6CLLFFm92ju3A0ZhwZLW79/lylQbLSGI2uZyltyifqtseJtU/xX5GfvmfegYMQtsFWq3/nNPqNJYULBuB+jYpuvZrld9w0X0AoIbcidcl2cFpwsuB7bWWHvddP8LG+v4pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9G++y8z; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9G++y8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765052281; x=1796588281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uiazsSI1fClrTeqFjfFNs3Qs0H50/57+MkcD0gOuJV4=;
  b=F9G++y8zawMt6ub6yIqXDOvJu1yYoGpR3WLzqc6gO3yfiRU9dnmLjFVT
   4wFLtW92HTU3yFc9JFPx+MYCxd+KWt+8YHswqp8JzMD5VzcPkb2z72ihL
   pX3sAaTTnswrzlWIEPtxlcXXpVSKFtyUnAyV24ydBO6pDpRLKB0RufE1R
   vdRfbzljctpZ6/86+ugVQWLcr826DTlxxENGRnjKg4CEh7Xri78VDWVV9
   01Xi4EzJ8GWAN36oJwG6fQ4Ka/z76YGfnFE1mq2KQBRzZFqXtzAeggz2C
   wnnda1OrZAz1s03xqcvXU1EBT6LgZPIB1gNf0d1oNAP1hI5iIxIPLWjR9
   Q==;
X-CSE-ConnectionGUID: xmJSV5WdTIiHGsNGTVLnwQ==
X-CSE-MsgGUID: KEstyFawR1qaq1i5bnKNqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67017252"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67017252"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 12:18:00 -0800
X-CSE-ConnectionGUID: Gh5/lQISR2iZXwrDum8H9g==
X-CSE-MsgGUID: m+AMLHJXT2G36sQRHMSzwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="195595998"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Dec 2025 12:17:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRyj5-00000000IiX-3ejd;
	Sat, 06 Dec 2025 20:17:55 +0000
Date: Sun, 7 Dec 2025 04:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, y00878127 <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482]
 drivers/infiniband/core/ib_core_cq_poll.c:92:6: sparse: sparse: symbol
 'cq_polling' was not declared. Should it be static?
Message-ID: <202512070445.EtOKa4Nl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 11fa263277520b886a650fadf4f719a2878229d0 [3482/3482] Add poll method for nfs for virtCCA CVM.
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251207/202512070445.EtOKa4Nl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070445.EtOKa4Nl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070445.EtOKa4Nl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/ib_core_cq_poll.c:92:6: sparse: sparse: symbol 'cq_polling' was not declared. Should it be static?
>> drivers/infiniband/core/ib_core_cq_poll.c:123:6: sparse: sparse: symbol 'wakeup_and_poll' was not declared. Should it be static?
>> drivers/infiniband/core/ib_core_cq_poll.c:147:5: sparse: sparse: symbol 'polling_awaken_thread' was not declared. Should it be static?

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
   130	int polling_thread(void *data)
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
