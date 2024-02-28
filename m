Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072E321379
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709129794; cv=none; b=lGYce4TA+Ze7VShF3OQuRmtM43xvkcbrBmEOTihEpQDMySgRbI1jmM0Dv5ClICIFKxbHKlwVW3N3I729+ycWcycqCH6/wtrkdBAIxIC0731UrHaWQhCsJI3UnxWZghePYUMCmhQ6AJ61gn68DSL4Xr0xODt2KOYOPzwGJ3wVlKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709129794; c=relaxed/simple;
	bh=DA3WVI+nj3EEWJxMcrepGaeGlefc8yQubixeNYSuaL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmVbjnwgkJ6LJXR70jvLd3iKAsml6UOOsiw1A3yfKz56fxC9FSv7gYm1lzqtiTdIpVgNYUfx+FCrmKwcpW93AoDjxvbkuWgUFargt+kBPxKeUrlFEvFrfe1N2vKWt8BlyZ065ra9/XZA9FHW8He5q78qQmH8r3BTD6PWTWdzl70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPP50Nm5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPP50Nm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709129793; x=1740665793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DA3WVI+nj3EEWJxMcrepGaeGlefc8yQubixeNYSuaL8=;
  b=XPP50Nm5cb7zcbbKRDLfR4c68OKcOQR8eZ+4I0PTNBS1YaXNFNdEFPLj
   xyoqdEopWjRZ2eFPSUuMjQWE0qwkQb3XtJPAK3ORgh75F6LgAW5kfGWiI
   WkTcMnapeVlX5oqzcgRw623QHcyjUocDfdeVxZKe5W64zc61n5LR0b4Ej
   12JOF59Qtn9M3PIwmNZKzT3xCmhxPFeoykCt9zw6FljTEbbRr8xCTvfjz
   GsDP1uLz76gtv6NHiUkDlCpw+VbGvDYIIzwf8SWwkMO5TxCbnQRFHewb7
   ceaeLBhGqY4PlAsnxH2pM6PrB0sGJ5j5mYx0a12fzth9S/ixlnTxa3s9Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25994255"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="25994255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 06:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="38274603"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Feb 2024 06:16:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfKjT-000C7b-3B;
	Wed, 28 Feb 2024 14:16:27 +0000
Date: Wed, 28 Feb 2024 22:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2545/3426] kernel/sched/core.c:9719:2: error:
 implicit declaration of function 'tg_update_affinity_domains' is invalid in
 C99
Message-ID: <202402282256.hBTLFUwO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54465add6cb7660c781c0ae7b4d3e3d56185624e
commit: 6eb07f9925a906d81f328c808ba25f7800888dce [2545/3426] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-001-20240227 (https://download.01.org/0day-ci/archive/20240228/202402282256.hBTLFUwO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282256.hBTLFUwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282256.hBTLFUwO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:9719:2: error: implicit declaration of function 'tg_update_affinity_domains' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           tg_update_affinity_domains(cpu, 1);
           ^
   kernel/sched/core.c:9719:2: note: did you mean 'irq_update_affinity_hint'?
   include/linux/interrupt.h:325:1: note: 'irq_update_affinity_hint' declared here
   irq_update_affinity_hint(unsigned int irq, const struct cpumask *m)
   ^
   kernel/sched/core.c:9809:2: error: implicit declaration of function 'tg_update_affinity_domains' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           tg_update_affinity_domains(cpu, 0);
           ^
>> kernel/sched/core.c:9931:2: error: implicit declaration of function 'init_auto_affinity' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           init_auto_affinity(&root_task_group);
           ^
   kernel/sched/core.c:9931:2: note: did you mean 'irq_set_affinity'?
   include/linux/interrupt.h:308:12: note: 'irq_set_affinity' declared here
   extern int irq_set_affinity(unsigned int irq, const struct cpumask *cpumask);
              ^
   kernel/sched/core.c:9931:22: error: use of undeclared identifier 'root_task_group'
           init_auto_affinity(&root_task_group);
                               ^
   4 errors generated.


vim +/tg_update_affinity_domains +9719 kernel/sched/core.c

  9699	
  9700	int sched_cpu_activate(unsigned int cpu)
  9701	{
  9702		struct rq *rq = cpu_rq(cpu);
  9703		struct rq_flags rf;
  9704	
  9705		/*
  9706		 * Clear the balance_push callback and prepare to schedule
  9707		 * regular tasks.
  9708		 */
  9709		balance_push_set(cpu, false);
  9710	
  9711	#ifdef CONFIG_SCHED_SMT
  9712		/*
  9713		 * When going up, increment the number of cores with SMT present.
  9714		 */
  9715		if (cpumask_weight(cpu_smt_mask(cpu)) == 2)
  9716			static_branch_inc_cpuslocked(&sched_smt_present);
  9717	#endif
  9718		set_cpu_active(cpu, true);
> 9719		tg_update_affinity_domains(cpu, 1);
  9720	
  9721		if (sched_smp_initialized) {
  9722			sched_update_numa(cpu, true);
  9723			sched_domains_numa_masks_set(cpu);
  9724			cpuset_cpu_active();
  9725		}
  9726	
  9727		/*
  9728		 * Put the rq online, if not already. This happens:
  9729		 *
  9730		 * 1) In the early boot process, because we build the real domains
  9731		 *    after all CPUs have been brought up.
  9732		 *
  9733		 * 2) At runtime, if cpuset_cpu_active() fails to rebuild the
  9734		 *    domains.
  9735		 */
  9736		rq_lock_irqsave(rq, &rf);
  9737		if (rq->rd) {
  9738			BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
  9739			set_rq_online(rq);
  9740		}
  9741		rq_unlock_irqrestore(rq, &rf);
  9742	
  9743		return 0;
  9744	}
  9745	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
