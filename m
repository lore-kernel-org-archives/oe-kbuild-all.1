Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216B1C84B8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755267024; cv=none; b=ZYGN0u/zGpj7NgdobqxMWBThBskSw39Yun2L4japcDLBoZy5N+dvJGC4e5zTe64AScU3Q/HEu7SiMSk0zmcbZU3B7F9Ucytpfc8S6/fGN9FfZq74Mv1RH5uM7dtTJW2RcXLiEd41bblJGfoS5R4OL1BZiRmQHOmby3Av9/JzZXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755267024; c=relaxed/simple;
	bh=STwpNHjm+/x0ZS8T2XSvpFTfii7h+QtTpMKjVdCxPYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiezkLVmxOA/31M3eTPUAXpLhEdJii/tYi/NCYQUCbnlehV6XHreLqt1z4AYaxYqZ8YrWiUK8F3/Rfe7NBP4qZ0152KI9TP1pUMXXkkFJNcpdpGUasQ2A+aZ03nOKpb06L/57Or7A+4noH0IUuXB439ITTObIS1g593JZBOdopg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6e2VYly; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6e2VYly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755267022; x=1786803022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STwpNHjm+/x0ZS8T2XSvpFTfii7h+QtTpMKjVdCxPYE=;
  b=L6e2VYly3i4/Y+p+I2Bsy2gJHTZYEXJiq8NmQsPt4Apeqwxr/XI+uq4c
   N7ZN4jwjCbUNRHa2NEHnFHY/nhboHQbpWiQu3TcyrgZzUvRnj1utYD1XA
   TgMCxkpEVLqMOMlMUBpoAZaiA6QqS+9NqJtQ5p2LWwFjr3DJtzyFLhumW
   t0SDURRTAm/9FSbE0c0wf2d3IwtpJsabHkqj5AG6m/Dfx3xbQvbkioZu7
   MbfY4iT+Qr0Fa/r1ikV/ngz0lZeJCZLOK1IQC1b8URLSMKuahor2Jg4Bn
   HD7MZfo3E9xEUv2ImnIf0cYM7VBLaDeKfEHNNVKFUiuuXbfLZXaoMMFdx
   A==;
X-CSE-ConnectionGUID: g/TS7KrhQR2JOoDKXGqhhg==
X-CSE-MsgGUID: yHUdGS6GTGSjAuSzlJh9Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68672476"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68672476"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 07:10:22 -0700
X-CSE-ConnectionGUID: s27BuYGnR621NOvTU/E1hg==
X-CSE-MsgGUID: 5w2BNodyQd+myU1FMsJL8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204201125"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 07:10:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umv8M-000C0o-0p;
	Fri, 15 Aug 2025 14:10:18 +0000
Date: Fri, 15 Aug 2025 22:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:238:27:
 warning: no previous prototype for function 'bpf_mem_failure'
Message-ID: <202508152209.qAp1xBAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54d96ebb93c9ff0573fe16586a47778ebe26de32
commit: 09893ff02def3af3147aff056dca7bee71c432f0 [2679/2679] bpf-rvi: Add bpf_mem_failure kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508152209.qAp1xBAt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152209.qAp1xBAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152209.qAp1xBAt-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:118:18: warning: no previous prototype for function 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     118 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:118:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     118 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:124:27: warning: no previous prototype for function 'bpf_get_total_forks' [-Wmissing-prototypes]
     124 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:124:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:129:26: warning: no previous prototype for function 'bpf_nr_running' [-Wmissing-prototypes]
     129 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:129:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     129 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:134:32: warning: no previous prototype for function 'bpf_nr_context_switches' [-Wmissing-prototypes]
     134 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:134:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     134 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:139:26: warning: no previous prototype for function 'bpf_nr_iowait' [-Wmissing-prototypes]
     139 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:139:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:145:26: warning: no previous prototype for function 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     145 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:145:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:150:27: warning: no previous prototype for function 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     150 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:150:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     150 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:155:18: warning: no previous prototype for function 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     155 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:155:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     155 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:164:27: warning: no previous prototype for function 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     164 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:164:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:169:27: warning: no previous prototype for function 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     169 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:169:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:174:27: warning: no previous prototype for function 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     174 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:174:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     174 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:180:27: warning: no previous prototype for function 'bpf_mem_totalcma' [-Wmissing-prototypes]
     180 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:180:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     180 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:185:27: warning: no previous prototype for function 'bpf_mem_freecma' [-Wmissing-prototypes]
     185 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:185:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     185 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:200:17: warning: no previous prototype for function 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     200 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:200:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:238:27: warning: no previous prototype for function 'bpf_mem_failure' [-Wmissing-prototypes]
     238 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:238:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     238 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |             ^
         |             static 
   22 warnings generated.


vim +/bpf_mem_failure +238 kernel/bpf-rvi/common_kfuncs.c

   231	
   232	#ifdef CONFIG_MEMORY_FAILURE
   233	__bpf_kfunc unsigned long bpf_mem_failure(void)
   234	{
   235		return atomic_long_read(&num_poisoned_pages) << (PAGE_SHIFT - 10);
   236	}
   237	#else
 > 238	__bpf_kfunc unsigned long bpf_mem_failure(void)
   239	{
   240		return 0;
   241	}
   242	#endif
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
