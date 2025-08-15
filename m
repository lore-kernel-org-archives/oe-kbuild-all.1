Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC1213FEE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 05:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755234827; cv=none; b=n4CGUsv4DZZ0Xr6izzptvh6v2OQVqb59Anz+ADsD6hvN+EaYzWZWw9yNpascObtj7js/mPDB3fBcmrvxPaRZCHHZKh3Wl534BQ2E+Iz8wZxL8JF9EmBPBMHsfmWb9YSLNqjmVZyt/ytQxlKVgsGZj4/YNuHgmomdCrNLWLxqxTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755234827; c=relaxed/simple;
	bh=2h7gNsO3vjx4BaTu9RzXbxc9Q62qpRFwaEjVrtHyzc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHECttimNwYosqV/uVjmDo5Qm4U3eycqLTBYeqTbPv3XSRu/X4s4Nh5HGMR4oH9epxnD7I0NM5nLYS6qKlHSzLYSLlrK68WaCLogz4fksaYBO0nPKfOiQrQlLOm0bCvGi8uqjUUjDSqI9PIda5BXF+0oSr1p37/TORsUK7cXQKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEOh7RLX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEOh7RLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755234826; x=1786770826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2h7gNsO3vjx4BaTu9RzXbxc9Q62qpRFwaEjVrtHyzc0=;
  b=NEOh7RLX9PI4hjstv9rYWABzYqtBNeBhOLPlVQrlaLQMUQVlIU+bAMeU
   xkF6CqunDVve/rEq0XP+J/Q3+mCuVTfP5MBGOafuFUKB8fuJGZGysHHIU
   uyyoD8NkeLoboR0GBhCvu0Ve4ALkHecI21TrHF57V+4b2KsKGuGP75oqM
   p0uJQh7buG2NNGqYlyutVY7UipOnIVdn0yPxskK2uBnhTc4xDHKNEJvNG
   qW2548CvL0qfTDt5XrTEedPy5KipDqxD9xTQij9Oshh4TlYkjJ1u9H/7f
   X+Mtt9our4/rzb+KgPajTjlLco6j1dtmUDXJMEIIxFHHt0C8a+97M+uRs
   g==;
X-CSE-ConnectionGUID: 8RCOYa4ORAy2cWL/j8OzOA==
X-CSE-MsgGUID: N9tDWnnkSFunDKIfmtQP/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68646515"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68646515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:13:45 -0700
X-CSE-ConnectionGUID: YvJ29OT9RM2xGox/AtOjdQ==
X-CSE-MsgGUID: 2VQzgpj5Tsi0Ng1x0lhKBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171180764"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2025 22:13:42 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ummkT-000BaM-2Z;
	Fri, 15 Aug 2025 05:13:16 +0000
Date: Fri, 15 Aug 2025 13:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:143:26:
 warning: no previous prototype for function 'bpf_kstat_softirqs_cpu'
Message-ID: <202508151345.8J2PvFWg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: e553ff4b5e1eed196ab68b4efd4a189c45396667 [2679/2679] bpf-rvi: Add kstat_ & kcpustat_ kfuncs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508151345.8J2PvFWg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151345.8J2PvFWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151345.8J2PvFWg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:25:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      25 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:25:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      25 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:34:35: warning: no previous prototype for function 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      34 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^
   kernel/bpf-rvi/common_kfuncs.c:34:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:39:17: warning: no previous prototype for function 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      39 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:39:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      39 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:53:17: warning: no previous prototype for function 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      53 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:53:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:82:18: warning: no previous prototype for function 'bpf_si_memswinfo' [-Wmissing-prototypes]
      82 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:82:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      82 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:92:27: warning: no previous prototype for function 'bpf_page_counter_read' [-Wmissing-prototypes]
      92 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:92:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:102:18: warning: no previous prototype for function 'bpf_seq_file_append' [-Wmissing-prototypes]
     102 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:102:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:116:18: warning: no previous prototype for function 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     116 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:116:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     116 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:122:27: warning: no previous prototype for function 'bpf_get_total_forks' [-Wmissing-prototypes]
     122 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:122:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:127:26: warning: no previous prototype for function 'bpf_nr_running' [-Wmissing-prototypes]
     127 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:127:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:132:32: warning: no previous prototype for function 'bpf_nr_context_switches' [-Wmissing-prototypes]
     132 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:132:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     132 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:137:26: warning: no previous prototype for function 'bpf_nr_iowait' [-Wmissing-prototypes]
     137 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:137:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:143:26: warning: no previous prototype for function 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     143 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:143:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:148:27: warning: no previous prototype for function 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     148 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:148:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:153:18: warning: no previous prototype for function 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     153 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:153:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |             ^
         |             static 
   15 warnings generated.


vim +/bpf_kstat_softirqs_cpu +143 kernel/bpf-rvi/common_kfuncs.c

   141	
   142	/* Kernel statistics for CPU accounting */
 > 143	__bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
   144	{
   145		return kstat_softirqs_cpu(irq, cpu);
   146	}
   147	
 > 148	__bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
   149	{
   150		return kstat_cpu_irqs_sum(cpu);
   151	}
   152	
 > 153	__bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   154	{
   155		kcpustat_cpu_fetch(dst, cpu);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
