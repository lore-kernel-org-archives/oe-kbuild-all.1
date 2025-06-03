Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7716BA34
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 18:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748975506; cv=none; b=UTAPAtkMvt804THFUyP6Q0C3aR9d98VnXONfSg0DF40uo6ZIDje4YO2Tky0q0Hu3F4RW6qcndIwy/lZno0jNFC12xX8qu6I6CcPCRYNR3RPRo2f6qnazueAeSSjSJqIwMbh62+y/fCV23J3a5nSkAVQ+GKQrCBMY5SXPoyKjK78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748975506; c=relaxed/simple;
	bh=DRQkd1jcbN2lDPM10CrWphBkbCUHJ1Bx0LtTpf+Fudk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ql7yVQnYZ/s7LWCG6xv40unrX9MvSgbAM8y+Hve96VC8GA5LRc1cRnl3GJr/phwURdUbm1fMz8RlaG8TqWBGRU0htSQ8zmZSjvxjOsuS+LYDiBcxsGdhptO7JGr4o1yP51QHLb709mcA3jb+PHzioMZI+R9LwhjGBpWb0lCQ8Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3+eEwwv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3+eEwwv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748975505; x=1780511505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRQkd1jcbN2lDPM10CrWphBkbCUHJ1Bx0LtTpf+Fudk=;
  b=B3+eEwwv9jn2QHGIBQ4t/Ma7Di9f3s0c4XoC2wtmegZoAuOwHh2Ywa6p
   dp0X88Jb17DqYdv04d76mwSc/sSm3+fDPJv3octKlb5nCNXj9SzkQch8C
   BmwHWWZV7yxDRMr1H1NYabhbNPX8OzBsLB5CcaYn1QNARe+cyieZJcIlW
   Ib2vOQiKQJuNxU2AG2XjP/ATwBgWEJEa/H3tgwO016SkRDGkw/hqdTbUA
   Gx6zeD+8EZo+Y9iEUVM0wpbvR/YQTeRTMITzpc2Du4kVqX6iCD+aOPYuk
   vXeo3SwkzJItkvKfgmXNVhFdQYeW62ZSquqHec9ef56ssuJn5AsCt+Czo
   A==;
X-CSE-ConnectionGUID: 4Blm29ZJTaOQsjJQdZGX3w==
X-CSE-MsgGUID: Apw91mPtQfy/V5zO0jZYAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62088363"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="62088363"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 11:31:44 -0700
X-CSE-ConnectionGUID: bRcMKK8uRXKcCfznnUW5Lw==
X-CSE-MsgGUID: jkUHdukSTdu0MYIwfyN7rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="144914283"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2025 11:31:41 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMWQC-0001YU-2R;
	Tue, 03 Jun 2025 18:31:36 +0000
Date: Wed, 4 Jun 2025 02:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] kernel/workqueue.c:4821:5: error:
 implicit declaration of function 'printk_safe_enter'
Message-ID: <202506040213.o6kXHX9l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 3d01105a68b1318bdc3cef3bbcfcb544e2da856e [2882/2882] workqueue: fix state-dump console deadlock
config: x86_64-buildonly-randconfig-2004-20250502 (https://download.01.org/0day-ci/archive/20250604/202506040213.o6kXHX9l-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506040213.o6kXHX9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506040213.o6kXHX9l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/workqueue.c:4821:5: error: implicit declaration of function 'printk_safe_enter' [-Werror,-Wimplicit-function-declaration]
    4821 |                                 printk_safe_enter();
         |                                 ^
   kernel/workqueue.c:4821:5: note: did you mean 'printk_nmi_enter'?
   include/linux/printk.h:158:20: note: 'printk_nmi_enter' declared here
     158 | static inline void printk_nmi_enter(void) { }
         |                    ^
>> kernel/workqueue.c:4823:5: error: implicit declaration of function 'printk_safe_exit' [-Werror,-Wimplicit-function-declaration]
    4823 |                                 printk_safe_exit();
         |                                 ^
   kernel/workqueue.c:4847:3: error: implicit declaration of function 'printk_safe_enter' [-Werror,-Wimplicit-function-declaration]
    4847 |                 printk_safe_enter();
         |                 ^
   kernel/workqueue.c:4862:3: error: implicit declaration of function 'printk_safe_exit' [-Werror,-Wimplicit-function-declaration]
    4862 |                 printk_safe_exit();
         |                 ^
   4 errors generated.


vim +/printk_safe_enter +4821 kernel/workqueue.c

  4780	
  4781	/**
  4782	 * show_workqueue_state - dump workqueue state
  4783	 *
  4784	 * Called from a sysrq handler or try_to_freeze_tasks() and prints out
  4785	 * all busy workqueues and pools.
  4786	 */
  4787	void show_workqueue_state(void)
  4788	{
  4789		struct workqueue_struct *wq;
  4790		struct worker_pool *pool;
  4791		unsigned long flags;
  4792		int pi;
  4793	
  4794		rcu_read_lock();
  4795	
  4796		pr_info("Showing busy workqueues and worker pools:\n");
  4797	
  4798		list_for_each_entry_rcu(wq, &workqueues, list) {
  4799			struct pool_workqueue *pwq;
  4800			bool idle = true;
  4801	
  4802			for_each_pwq(pwq, wq) {
  4803				if (pwq->nr_active || !list_empty(&pwq->delayed_works)) {
  4804					idle = false;
  4805					break;
  4806				}
  4807			}
  4808			if (idle)
  4809				continue;
  4810	
  4811			pr_info("workqueue %s: flags=0x%x\n", wq->name, wq->flags);
  4812	
  4813			for_each_pwq(pwq, wq) {
  4814				raw_spin_lock_irqsave(&pwq->pool->lock, flags);
  4815				if (pwq->nr_active || !list_empty(&pwq->delayed_works)) {
  4816					/*
  4817					 * Defer printing to avoid deadlocks in console
  4818					 * drivers that queue work while holding locks
  4819					 * also taken in their write paths.
  4820					 */
> 4821					printk_safe_enter();
  4822					show_pwq(pwq);
> 4823					printk_safe_exit();
  4824				}
  4825				raw_spin_unlock_irqrestore(&pwq->pool->lock, flags);
  4826				/*
  4827				 * We could be printing a lot from atomic context, e.g.
  4828				 * sysrq-t -> show_workqueue_state(). Avoid triggering
  4829				 * hard lockup.
  4830				 */
  4831				touch_nmi_watchdog();
  4832			}
  4833		}
  4834	
  4835		for_each_pool(pool, pi) {
  4836			struct worker *worker;
  4837			bool first = true;
  4838	
  4839			raw_spin_lock_irqsave(&pool->lock, flags);
  4840			if (pool->nr_workers == pool->nr_idle)
  4841				goto next_pool;
  4842			/*
  4843			 * Defer printing to avoid deadlocks in console drivers that
  4844			 * queue work while holding locks also taken in their write
  4845			 * paths.
  4846			 */
  4847			printk_safe_enter();
  4848			pr_info("pool %d:", pool->id);
  4849			pr_cont_pool_info(pool);
  4850			pr_cont(" hung=%us workers=%d",
  4851				jiffies_to_msecs(jiffies - pool->watchdog_ts) / 1000,
  4852				pool->nr_workers);
  4853			if (pool->manager)
  4854				pr_cont(" manager: %d",
  4855					task_pid_nr(pool->manager->task));
  4856			list_for_each_entry(worker, &pool->idle_list, entry) {
  4857				pr_cont(" %s%d", first ? "idle: " : "",
  4858					task_pid_nr(worker->task));
  4859				first = false;
  4860			}
  4861			pr_cont("\n");
  4862			printk_safe_exit();
  4863		next_pool:
  4864			raw_spin_unlock_irqrestore(&pool->lock, flags);
  4865			/*
  4866			 * We could be printing a lot from atomic context, e.g.
  4867			 * sysrq-t -> show_workqueue_state(). Avoid triggering
  4868			 * hard lockup.
  4869			 */
  4870			touch_nmi_watchdog();
  4871		}
  4872	
  4873		rcu_read_unlock();
  4874	}
  4875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
