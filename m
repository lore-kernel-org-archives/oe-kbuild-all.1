Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380F218592
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761429818; cv=none; b=ozw6U8gXmD2wpoVLZ7qJtJCyklnaWq57zo7No9+bQ8XChLmpw042iPcG2b1U835OI2Y8Ba6GltegoXrxZSVnfgbxiekAgS609FqncKqU27Siw4SXb9VLjKGn1rHD2UXO8NQ29uLggPdeG1lFeMCkAmkzen4d7DlcAGJa18ia0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761429818; c=relaxed/simple;
	bh=mjtF5x8TcECNYP1H6taC/WwezHxqn0tSWONSfJWz20s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nHzNWG+WXfYEkVvFcP9kWI9IoUcd1MW9Qxh2c1uGcW8Qs/dF0u7B0c3wuR0itycZ8YZJRFYAtgca3XBa0kIASxIoMhH3O3xHYVyoky0XealbCgpIQnSdIkKMsr/wfbnlaXikWir0A4vsDO6ieuSdXHtHPg9n/bjyFxig0/4hyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WbDvOd6o; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WbDvOd6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761429815; x=1792965815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mjtF5x8TcECNYP1H6taC/WwezHxqn0tSWONSfJWz20s=;
  b=WbDvOd6oqu8TkA2mkFG/bkM9iiXdPQ2tuOsS2TnVys9enH8htayQaVac
   EDkssPnwxaKMEFsWseQNF2Fo/WHHJPeYtjJDbU/KyLLgsSIJLqV5P1i0l
   pMrJghUtPpddchu49hfQ/SnwANbt7b96WNbo9cDLMh+k5wf+ZASNZ3N3D
   oZ174meAnJXupsQvIZu+Et6Cl6a3yZJtrpqwrzJGpC+5tM9AL7jYafsy3
   1JfUPGldfNmwVyRumiyNEdeCtQy8hmpSvTxb5i3cXxHX6kiK1/W/NNyH8
   uG4tXwd0i7Eqh20DSgDX75lbcdw0SpAuz+y+27a45CbgHOQg2aZlvhG2v
   A==;
X-CSE-ConnectionGUID: EoLn2NJaSqKnNj3B6/ikLQ==
X-CSE-MsgGUID: CCRhN63SROeO4wi4R70VdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74241931"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="74241931"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 15:03:35 -0700
X-CSE-ConnectionGUID: feIDqceBQcCie2MnzfJrSQ==
X-CSE-MsgGUID: LVo6NLg3SnCl+O5nLnbB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="215616773"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2025 15:03:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCmLm-000FdF-2G;
	Sat, 25 Oct 2025 22:03:10 +0000
Date: Sun, 26 Oct 2025 06:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1668/1668] kernel/sched/core.c:5976:22:
 error: use of undeclared identifier 'root_task_group'; did you mean
 'task_group'?
Message-ID: <202510260511.Ac2yFRes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hui,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ee55f6a88c1f70120d9cec8244c5cd10f0c4dce9
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [1668/1668] sched: Introduce smart grid scheduling strategy for cfs
config: x86_64-buildonly-randconfig-006-20250620 (https://download.01.org/0day-ci/archive/20251026/202510260511.Ac2yFRes-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260511.Ac2yFRes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260511.Ac2yFRes-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:1587:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^
   kernel/sched/core.c:1587:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1587 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         | ^
         | static 
   kernel/sched/core.c:3771:35: warning: no previous prototype for function 'preempt_schedule_irq' [-Wmissing-prototypes]
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^
   kernel/sched/core.c:3771:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3771 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                      ^
         |                      static 
   kernel/sched/core.c:5845:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5845 |         tg_update_affinity_domains(cpu, 1);
         |         ^
   kernel/sched/core.c:5904:2: error: implicit declaration of function 'tg_update_affinity_domains' [-Werror,-Wimplicit-function-declaration]
    5904 |         tg_update_affinity_domains(cpu, 0);
         |         ^
   kernel/sched/core.c:5976:2: error: implicit declaration of function 'init_auto_affinity' [-Werror,-Wimplicit-function-declaration]
    5976 |         init_auto_affinity(&root_task_group);
         |         ^
   kernel/sched/core.c:5976:2: note: did you mean 'irq_set_affinity'?
   include/linux/interrupt.h:292:1: note: 'irq_set_affinity' declared here
     292 | irq_set_affinity(unsigned int irq, const struct cpumask *cpumask)
         | ^
>> kernel/sched/core.c:5976:22: error: use of undeclared identifier 'root_task_group'; did you mean 'task_group'?
    5976 |         init_auto_affinity(&root_task_group);
         |                             ^~~~~~~~~~~~~~~
         |                             task_group
   kernel/sched/sched.h:1444:34: note: 'task_group' declared here
    1444 | static inline struct task_group *task_group(struct task_struct *p)
         |                                  ^
   kernel/sched/core.c:6029:32: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    6029 |         unsigned long alloc_size = 0, ptr;
         |                                       ^
   3 warnings and 4 errors generated.


vim +5976 kernel/sched/core.c

  5949	
  5950	void __init sched_init_smp(void)
  5951	{
  5952		sched_init_numa();
  5953	
  5954		/*
  5955		 * There's no userspace yet to cause hotplug operations; hence all the
  5956		 * CPU masks are stable and all blatant races in the below code cannot
  5957		 * happen. The hotplug lock is nevertheless taken to satisfy lockdep,
  5958		 * but there won't be any contention on it.
  5959		 */
  5960		cpus_read_lock();
  5961		mutex_lock(&sched_domains_mutex);
  5962		sched_init_domains(cpu_active_mask);
  5963		mutex_unlock(&sched_domains_mutex);
  5964		cpus_read_unlock();
  5965	
  5966		/* Move init over to a non-isolated CPU */
  5967		if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_FLAG_DOMAIN)) < 0)
  5968			BUG();
  5969		sched_init_granularity();
  5970	
  5971		init_sched_rt_class();
  5972		init_sched_dl_class();
  5973	
  5974		sched_smp_initialized = true;
  5975	
> 5976		init_auto_affinity(&root_task_group);
  5977	}
  5978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
