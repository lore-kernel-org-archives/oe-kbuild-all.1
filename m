Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD58F70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 02:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726452441; cv=none; b=Y6XqkCRqKkNuREPlXKi02sJRO1f0knkSElVwpQ1tefmiro4ZL3hA+WT7Y22pFo2vyVGlGtolvnW1YalGezppTpzUhIdFPuemzm9ALr86eRLIqRJYH6qxBOXYVgjEShRwP9Db5XjkTWZ5yKd8dUHXSlBHo9EtLZkTjaxLOCoTIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726452441; c=relaxed/simple;
	bh=S+05vEZTB8cnctfJszxcNkWsFBSlwUdpxJRBBxkpUAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7hNOIeQqour06fCdr8/Yz2yojvQccv8n32snU4hNJRCDb0/yAvW2f400iPDaUZXRHGvmOUtbOzfdP2J4e8R88/MGSTFQltm98BWnHRMuvRcW/zk/5Q6W+zL0CPUQn9M2VrNUxoinFdbWJT0HR1AtOA3NNjSn8I6OE7sUKvEzc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4LVR4Mp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4LVR4Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726452439; x=1757988439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S+05vEZTB8cnctfJszxcNkWsFBSlwUdpxJRBBxkpUAo=;
  b=M4LVR4MpqLL0BCpN3+frjp3O4gpI5KtAVPuZV+1FaJnkuyLow1BPBwB4
   H6MeYXmMgY7l90oLP79kmXXcBx+TaDomNit8oePRmuWiDTZs0BNOaaFsO
   OzzrxDGXm4ipoeh/d188EdXv50IYRdJ2DsLqXTDTZ2t9Ia8Pi4LDmJzMa
   pIpTYdChEwK6IytsDMyk5bQxX4fI9TQAxqA5zub6hpabOaZ8hwSI5fAGY
   1/33rP5sfMcYfvRQlxlRUNYMcQ2VOBw7lZ/riH7O3Hogz3fekXtLH0m9s
   CMt1/1pyS8uLO46Ne76caXHnUgQxyDleFnQpiE2JANDSSO0PuGp+kTCoI
   A==;
X-CSE-ConnectionGUID: 5U+dClIzS+205sWlJXql1Q==
X-CSE-MsgGUID: 2f0FlyMVTPmLgI3LZb0YMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42791947"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="42791947"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 19:07:19 -0700
X-CSE-ConnectionGUID: qFYMlhAfSratJ5rpZ3QklQ==
X-CSE-MsgGUID: MZZoLS4+RHiiwNcNH8zpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68982968"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Sep 2024 19:07:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq191-0009Ea-0j;
	Mon, 16 Sep 2024 02:07:15 +0000
Date: Mon, 16 Sep 2024 10:07:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3778/13950] kernel/sched/core.c:11392:5: sparse:
 sparse: symbol 'tg_set_dynamic_affinity_mode' was not declared. Should it be
 static?
Message-ID: <202409161053.1Z3YaAWy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xianglai,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: 351aa968603500987e891b20cc97a677602ae7c2 [3778/13950] loongarch/kernel: Fix loongarch compilation error
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240916/202409161053.1Z3YaAWy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240916/202409161053.1Z3YaAWy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161053.1Z3YaAWy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:266:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:266:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:266:56: sparse:    struct task_struct *
   kernel/sched/core.c:1046:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1046:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1046:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2235:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2235:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2235:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2235:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2235:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2235:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3752:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3752:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3752:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3960:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3960:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3960:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:9529:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:9529:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:9529:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5700:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5700:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5700:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6334:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6334:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6334:32: sparse:    struct task_struct *
   kernel/sched/core.c:6365:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6365:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6365:23: sparse:    struct task_struct *
   kernel/sched/core.c:6373:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6373:46: sparse:    struct task_struct *
   kernel/sched/core.c:6373:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6432:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6432:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6432:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:6645:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6645:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6645:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7170:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7170:17: sparse:    struct task_struct *
   kernel/sched/core.c:7170:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7386:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7386:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7386:22: sparse:    struct task_struct *
   kernel/sched/core.c:7433:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7433:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7433:48: sparse:    struct task_struct *
>> kernel/sched/core.c:11392:5: sparse: sparse: symbol 'tg_set_dynamic_affinity_mode' was not declared. Should it be static?
>> kernel/sched/core.c:11433:5: sparse: sparse: symbol 'tg_set_affinity_period' was not declared. Should it be static?
>> kernel/sched/core.c:11447:5: sparse: sparse: symbol 'tg_get_affinity_period' was not declared. Should it be static?
   kernel/sched/core.c:12140:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:12140:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:12140:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:340:9: sparse: sparse: context imbalance in 'sched_core_lock' - different lock contexts for basic block
   kernel/sched/core.c:350:17: sparse: sparse: context imbalance in 'sched_core_unlock' - unexpected unlock
   kernel/sched/core.c:553:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:578:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1364:30: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:640:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:681:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:97:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:97:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:97:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2226:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2227:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2228:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2288:15: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/core.c:2201:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2201:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2201:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through include/linux/mmu_context.h, include/linux/cpuset.h):
   arch/loongarch/include/asm/mmu_context.h:86:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/mmu_context.h:89:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   arch/loongarch/include/asm/mmu_context.h:91:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_d'
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:76:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/fpu.h:85:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:1252:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:1252:1: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   kernel/sched/core.c: note: in included file (through arch/loongarch/include/asm/switch_to.h):
   arch/loongarch/include/asm/fpu.h:225:17: sparse: sparse: undefined identifier '__builtin_loongarch_csrxchg_w'
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:9: sparse:    struct task_struct *

vim +/tg_set_dynamic_affinity_mode +11392 kernel/sched/core.c

304000390f88d0 Josh Don   2021-07-29  11390  
6eb07f9925a906 Hui Tang   2024-01-17  11391  #ifdef CONFIG_QOS_SCHED_SMART_GRID
6eb07f9925a906 Hui Tang   2024-01-17 @11392  int tg_set_dynamic_affinity_mode(struct task_group *tg, u64 mode)
6eb07f9925a906 Hui Tang   2024-01-17  11393  {
6eb07f9925a906 Hui Tang   2024-01-17  11394  	struct auto_affinity *auto_affi = tg->auto_affinity;
6eb07f9925a906 Hui Tang   2024-01-17  11395  
6eb07f9925a906 Hui Tang   2024-01-17  11396  	if (unlikely(!auto_affi))
6eb07f9925a906 Hui Tang   2024-01-17  11397  		return -EPERM;
6eb07f9925a906 Hui Tang   2024-01-17  11398  
6eb07f9925a906 Hui Tang   2024-01-17  11399  	/* auto mode */
6eb07f9925a906 Hui Tang   2024-01-17  11400  	if (mode == 1)
6eb07f9925a906 Hui Tang   2024-01-17  11401  		start_auto_affinity(auto_affi);
6eb07f9925a906 Hui Tang   2024-01-17  11402  	else if (mode == 0)
6eb07f9925a906 Hui Tang   2024-01-17  11403  		stop_auto_affinity(auto_affi);
6eb07f9925a906 Hui Tang   2024-01-17  11404  	else
6eb07f9925a906 Hui Tang   2024-01-17  11405  		return -EINVAL;
6eb07f9925a906 Hui Tang   2024-01-17  11406  
6eb07f9925a906 Hui Tang   2024-01-17  11407  	return 0;
6eb07f9925a906 Hui Tang   2024-01-17  11408  }
6eb07f9925a906 Hui Tang   2024-01-17  11409  
6eb07f9925a906 Hui Tang   2024-01-17  11410  static u64 cpu_affinity_mode_read_u64(struct cgroup_subsys_state *css,
6eb07f9925a906 Hui Tang   2024-01-17  11411  					      struct cftype *cft)
6eb07f9925a906 Hui Tang   2024-01-17  11412  {
6eb07f9925a906 Hui Tang   2024-01-17  11413  	struct task_group *tg = css_tg(css);
6eb07f9925a906 Hui Tang   2024-01-17  11414  
e76dedf2e4cc38 Yipeng Zou 2024-01-17  11415  	if (!smart_grid_enabled())
6eb07f9925a906 Hui Tang   2024-01-17  11416  		return -EPERM;
6eb07f9925a906 Hui Tang   2024-01-17  11417  
6eb07f9925a906 Hui Tang   2024-01-17  11418  	if (unlikely(!tg->auto_affinity))
6eb07f9925a906 Hui Tang   2024-01-17  11419  		return -EPERM;
6eb07f9925a906 Hui Tang   2024-01-17  11420  
6eb07f9925a906 Hui Tang   2024-01-17  11421  	return tg->auto_affinity->mode;
6eb07f9925a906 Hui Tang   2024-01-17  11422  }
6eb07f9925a906 Hui Tang   2024-01-17  11423  
6eb07f9925a906 Hui Tang   2024-01-17  11424  static int cpu_affinity_mode_write_u64(struct cgroup_subsys_state *css,
6eb07f9925a906 Hui Tang   2024-01-17  11425  				   struct cftype *cftype, u64 mode)
6eb07f9925a906 Hui Tang   2024-01-17  11426  {
e76dedf2e4cc38 Yipeng Zou 2024-01-17  11427  	if (!smart_grid_enabled())
6eb07f9925a906 Hui Tang   2024-01-17  11428  		return -EPERM;
6eb07f9925a906 Hui Tang   2024-01-17  11429  
6eb07f9925a906 Hui Tang   2024-01-17  11430  	return tg_set_dynamic_affinity_mode(css_tg(css), mode);
6eb07f9925a906 Hui Tang   2024-01-17  11431  }
6eb07f9925a906 Hui Tang   2024-01-17  11432  
6eb07f9925a906 Hui Tang   2024-01-17 @11433  int tg_set_affinity_period(struct task_group *tg, u64 period_ms)
6eb07f9925a906 Hui Tang   2024-01-17  11434  {
6eb07f9925a906 Hui Tang   2024-01-17  11435  	if (unlikely(!tg->auto_affinity))
6eb07f9925a906 Hui Tang   2024-01-17  11436  		return -EPERM;
6eb07f9925a906 Hui Tang   2024-01-17  11437  
6eb07f9925a906 Hui Tang   2024-01-17  11438  	if (!period_ms || period_ms > U64_MAX / NSEC_PER_MSEC)
6eb07f9925a906 Hui Tang   2024-01-17  11439  		return -EINVAL;
6eb07f9925a906 Hui Tang   2024-01-17  11440  
6eb07f9925a906 Hui Tang   2024-01-17  11441  	raw_spin_lock_irq(&tg->auto_affinity->lock);
6eb07f9925a906 Hui Tang   2024-01-17  11442  	tg->auto_affinity->period = ms_to_ktime(period_ms);
6eb07f9925a906 Hui Tang   2024-01-17  11443  	raw_spin_unlock_irq(&tg->auto_affinity->lock);
6eb07f9925a906 Hui Tang   2024-01-17  11444  	return 0;
6eb07f9925a906 Hui Tang   2024-01-17  11445  }
6eb07f9925a906 Hui Tang   2024-01-17  11446  
6eb07f9925a906 Hui Tang   2024-01-17 @11447  u64 tg_get_affinity_period(struct task_group *tg)
6eb07f9925a906 Hui Tang   2024-01-17  11448  {
6eb07f9925a906 Hui Tang   2024-01-17  11449  	if (unlikely(!tg->auto_affinity))
6eb07f9925a906 Hui Tang   2024-01-17  11450  		return -EPERM;
6eb07f9925a906 Hui Tang   2024-01-17  11451  
6eb07f9925a906 Hui Tang   2024-01-17  11452  	return ktime_to_ms(tg->auto_affinity->period);
6eb07f9925a906 Hui Tang   2024-01-17  11453  }
6eb07f9925a906 Hui Tang   2024-01-17  11454  

:::::: The code at line 11392 was first introduced by commit
:::::: 6eb07f9925a906d81f328c808ba25f7800888dce sched: Introduce smart grid scheduling strategy for cfs

:::::: TO: Hui Tang <tanghui20@huawei.com>
:::::: CC: yanhaitao <yanhaitao2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
