Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69BA1E86E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Aug 2025 04:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755403707; cv=none; b=rX5AOdJfoyAMQPvUcs3C8YAtM4UJ9Wh1o3zdSgovfr5JVA48WIxK5vkYXy1/VwG6JF1IHmtzKDggoEClMkOB3htPLtC/yj1cu3ROB8F2gTBwHSy7BN3rNwdU80Cil5HWmpn9prbbsD2tlHwrjV6ac+H2zADjgwhCeueH1olOHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755403707; c=relaxed/simple;
	bh=XUWRgaWsnU0ULp/H6Ils0om53pYdZi+8vWJWREzneLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPWuV1QGBhyn2H5B1/XrAglfE7iAPDJwyYy6wav+GvPEliIzO2Kt3T6+nNgxurf1/2uEiZGu16UUsVMy+qg6rkvgcB8/hDlSviEofw67Lo2OWg9uzCi3KW8GD/lKdNta1H/Ma+QnouvnSZaIHeiYmnB4aVt2sTNnQzIGgGxaz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgaRKraA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgaRKraA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755403705; x=1786939705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XUWRgaWsnU0ULp/H6Ils0om53pYdZi+8vWJWREzneLE=;
  b=SgaRKraA3R39K/ZPc9jzFSSWVqLJ3tunogVQIVAhtrSruVGUaImoC29Z
   RKXGS0f7iTw8ARb9YyVclZ/FORLO/QhMLLkt9u+RUzEWmchZ7bhmNmClP
   AOxDTBbjkwX9eyXuwcb9n25ljvs+prx23W0dZQUQpBkvMtB0hnr61zTne
   GZcH0doXhZ/4mKT/zSn7Ejy8rQaPHTWw1MGAWSWn5ly96gowwQbYEGmPB
   xQaAsPKBzsH50G2C8dQCCai6VNsZgxPdAfnLQLc4MzUaZZHQ+K6bPGgse
   WN92vQAG1eldSFUp/cu6RSOlOyg4mzd9zdLbs+skzCubcNuw1l7S8Ck4o
   A==;
X-CSE-ConnectionGUID: 1Cx9o8dSTIirW8TsQFAqoA==
X-CSE-MsgGUID: KgNJdL+vT2CBdf47mOuOlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68268831"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68268831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 21:08:24 -0700
X-CSE-ConnectionGUID: 4+JB19fpTLqhjf7AVCuVpA==
X-CSE-MsgGUID: jiRPVjTNSfmdUgNyfAEU4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="168121231"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Aug 2025 21:08:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unUgu-000DLX-2o;
	Sun, 17 Aug 2025 04:08:20 +0000
Date: Sun, 17 Aug 2025 12:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/3] sched_ext: Provide
 scx_bpf_task_acquire_remote_curr()
Message-ID: <202508171134.vxF7uU1z-lkp@intel.com>
References: <20250811212150.85759-3-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811212150.85759-3-christian.loehle@arm.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Loehle/sched_ext-Introduce-scx_bpf_cpu_rq_locked/20250812-052423
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250811212150.85759-3-christian.loehle%40arm.com
patch subject: [PATCH v4 2/3] sched_ext: Provide scx_bpf_task_acquire_remote_curr()
config: sparc64-randconfig-r121-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171134.vxF7uU1z-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250817/202508171134.vxF7uU1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508171134.vxF7uU1z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:3718:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3718:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3718:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3797:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3797:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3797:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3850:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3850:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3850:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3878:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3878:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3878:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3891:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3891:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3891:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4021:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4021:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4021:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4037:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4037:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4037:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4102:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4102:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4102:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4131:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4131:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4131:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4148:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4148:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4148:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4201:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4201:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4201:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4225:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4225:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4225:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4245:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:4245:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4245:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:5157:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5157:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5157:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5199:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5199:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5199:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5310:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5310:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5310:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6050:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6050:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:6050:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6159:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6159:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6159:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6431:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6431:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6431:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6564:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6564:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6564:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7411:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7411:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7411:33: sparse:    struct task_struct const *
>> kernel/sched/ext.c:7472:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:863:5: sparse: sparse: symbol 'select_cpu_from_kfunc' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2251:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2251:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2447:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2447:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2447:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1289:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression

vim +7472 kernel/sched/ext.c

  7455	
  7456	/**
  7457	 * scx_bpf_task_acquire_remote_curr - Fetch the curr task of a rq without
  7458	 * acquiring its rq lock
  7459	 * @cpu: CPU of the rq
  7460	 *
  7461	 * Increments the refcount of the task_struct which needs to be released using
  7462	 * bpf_task_release().
  7463	 */
  7464	__bpf_kfunc struct task_struct *scx_bpf_task_acquire_remote_curr(s32 cpu)
  7465	{
  7466		struct task_struct *p;
  7467	
  7468		if (!kf_cpu_valid(cpu, NULL))
  7469			return NULL;
  7470	
  7471		rcu_read_lock();
> 7472		p = cpu_rq(cpu)->curr;
  7473		if (p)
  7474			p = refcount_inc_not_zero(&p->rcu_users) ? p : NULL;
  7475		rcu_read_unlock();
  7476		return p;
  7477	}
  7478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
