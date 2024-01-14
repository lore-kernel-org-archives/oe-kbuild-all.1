Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5EFC03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQQ8ryAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705258801; x=1736794801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jSHaXmsXgiqg46z00L7CIWOhVeD+KmylynqYCQYRn0A=;
  b=cQQ8ryAiyXvPd29bJ78ameIcjiZ2TmLkcv9HqbPQ256sOJ7ex/FMBGOf
   CL5C2vpv5wr6flHv277WwvFxjzNCDF9/Sfy69YCla789eVALA/6f822v3
   ToD96v3HAhCbdYeqIG09TJHXMAw40v5Rxepnsv+VH1zY5OTWQk7gP7dJ4
   GfqUKyZlmv7dIF4Ru2GV1/U+/6sfYCP5DXSN7H6V0JZAWFNuAKNmty2G9
   +74r13FHEt9qYLVuHeBRz0UqgxT13N95doHicmy5duL/1kFdOZyAqP0AU
   EI6acz+PBisA5ENGKKh0gYeBId1P5mtXS/onbU4/iFDcTKlJXS/W4iRI8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="20960404"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="20960404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 11:00:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="759656877"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="759656877"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Jan 2024 10:59:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP5i8-000BlE-2F;
	Sun, 14 Jan 2024 18:59:56 +0000
Date: Mon, 15 Jan 2024 02:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20527/30000] kernel/workqueue.c:4821:5: error:
 implicit declaration of function 'printk_safe_enter'
Message-ID: <202401150207.SywMoDXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d9d4951bf741189c66627715d5ae8a8cf1df85f
commit: 3d01105a68b1318bdc3cef3bbcfcb544e2da856e [20527/30000] workqueue: fix state-dump console deadlock
config: x86_64-buildonly-randconfig-001-20240114 (https://download.01.org/0day-ci/archive/20240115/202401150207.SywMoDXp-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150207.SywMoDXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150207.SywMoDXp-lkp@intel.com/

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
