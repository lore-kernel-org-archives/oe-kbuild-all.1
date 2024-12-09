Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23919343B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 19:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733773683; cv=none; b=SvHLJSqujRrucKws86j0JFpd0UjvCsBRLvvv9GFs/ryPrjIkVzq7YTq+XibjjTDF8N8RbkKbF4KhibKhPYMmfkBzHg95Ye5lqqyZtfj0Eph/H+el+WNFWdpD9sJgWceKbP3YAXBnKEaK0zN5jvyOQt1LH0lefZjdK5IZhW3ygUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733773683; c=relaxed/simple;
	bh=uLuI66IBNWMqiE3+bwhC8EcNRWDvzt0e0W1T2vkeF4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWGa/mKkNkoItPXzWxSXiX/+giZEr+PI3pgYeoBtCX8uN227w5H0zgH+taxbRUMPkJ6V1RX/f1Q/gNoGAeacUTH5yJEZhNypzpB6rp7DUwG9eLy9VlpzVSeyZ6LSS0i/riAv5NEbal7vOBE3o0tMVhyl1GQoTofq5zKYojfme8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6le5WlX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6le5WlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733773682; x=1765309682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLuI66IBNWMqiE3+bwhC8EcNRWDvzt0e0W1T2vkeF4Q=;
  b=J6le5WlXPqsCDta3bE7+np9itffQ/t03PrZ2+Xtg5ShBwQU28UKbze2z
   koeuVdZ+76xPxFbkkbXKqFmaJ/su/AR78Jm06vvUVXz3L7kX3BW8KU9t3
   XfkjsZEakDAXJ8dcJBvyaWCHiL4cUow5eF8UkqTI8dLbFRif8/fzLN+2g
   ouIfduCk1H3Rb1RRlis0OKePiLr3gawtYgbim5gFyNuxIulrm3K+7GnTc
   d3NL4T+eFbsD5lpZtpWtGE+5KUhBCElEdNhYiWmMAE4hL1AwZkCXL9rxQ
   gH6/S+l1eA6rekcKr2w5/P40JFw1d/j10zLnLUQAHFyT2baPcCsoa3p/S
   Q==;
X-CSE-ConnectionGUID: OtdNR8bUTsmJPgVV5h5xVw==
X-CSE-MsgGUID: 96bH+Cm1SdmvM5h1v1nGOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34224745"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34224745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 11:48:01 -0800
X-CSE-ConnectionGUID: ckEBN77jQqaVjKK2OAxKKQ==
X-CSE-MsgGUID: hKsE0lYGRlG9KoFfy5G7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="94981801"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2024 11:48:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKjjZ-0004ll-0A;
	Mon, 09 Dec 2024 19:47:57 +0000
Date: Tue, 10 Dec 2024 03:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2570/2570] kernel/workqueue.c:4821:5: error:
 implicit declaration of function 'printk_safe_enter'
Message-ID: <202412100301.fVrumCik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fbaada49082c23aa4e4ed43386a1ad4a457a0354
commit: 3d01105a68b1318bdc3cef3bbcfcb544e2da856e [2570/2570] workqueue: fix state-dump console deadlock
config: x86_64-buildonly-randconfig-003-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100301.fVrumCik-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100301.fVrumCik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100301.fVrumCik-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/workqueue.c:40:
   In file included from include/linux/mempolicy.h:11:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:1571:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   1 warning and 4 errors generated.


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
