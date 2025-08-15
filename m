Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CBA2FB99A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755252559; cv=none; b=E6KbCqvIz+qF5jFGwLpxmimaClV5iSDFjQt6adf8rmxPoehTgmvVkuWFSTfmRJTyb3ejr5XDG4ZCfsi/wwhqdQcX0wJpSNGQdDDKAjCHVgm725gWmh9r99q/PYBXhdBsBZNUIfEqy0YGGU11YcuBzidR5lQQVZjHgHbygj0fHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755252559; c=relaxed/simple;
	bh=Oup7ggxekhR6nBmUYow3Gw2sFU0JzXsewDPfLHGTagc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hli/nH7QCp6RyugHRYZOtfOiZgPvu2I0xEfEXTREpZUU2pqEvVbHYtj6aAXy4+mGwokR9RsDfWbyhSjBar1lYUKWJlKwrSJzRm9EHrlqYBYAOxOIsPiiqAgLiLosbwVFKj26XOqIeJbr1lWDHtSN6boqatL4gbGcioyqZQ3ha5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejAt6H1R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejAt6H1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755252557; x=1786788557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oup7ggxekhR6nBmUYow3Gw2sFU0JzXsewDPfLHGTagc=;
  b=ejAt6H1RcZPG0iyhHg7m/awc8pwIdD92ZG2wqDxNbeqwBTsqjlPFEqRB
   fbZSd2RRWSR5q1jNvk2bceq+btqWLxs3thgTWUly4EAoXAYXFWwHzVHSN
   AydEorXHoOzjlXBOLEwmTltvFb+NsOQoLMRyv5oWnRHK8l1+6nCbd60NB
   pz75px3ZAgEr2xQgdqw1skiUm+kCyABdoUfAUzKG7N+qt6qv421ekIKbS
   xJoEPdgUO8gjJWz1i36xU10pA0UjEokydZItzGuUl8Zw9K204/pLrNwuq
   Ysu+FX9MDeN5cCPlif9Xfu94yO6QeMAT4HCOqlGSioDZaDMw1Z4ao9Ry7
   A==;
X-CSE-ConnectionGUID: Yj8RgEhfQU+T3nacgkAUDw==
X-CSE-MsgGUID: wESX3hAJT7C3B1opdC1KwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61208896"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61208896"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 03:09:15 -0700
X-CSE-ConnectionGUID: 3FVBwvwDRXy+oR+s5ENb9w==
X-CSE-MsgGUID: +2VAN3Z1TbiwMSvR78S2Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171115256"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2025 03:09:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umrN1-000BqU-2g;
	Fri, 15 Aug 2025 10:09:11 +0000
Date: Fri, 15 Aug 2025 18:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:179:27:
 warning: no previous prototype for function 'bpf_mem_totalcma'
Message-ID: <202508151842.k7QexzPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2a82ebf963a58eaae57bc365d5d523592f13db7b
commit: 9c449e4d9af5b69a1b9fdae9e3f18dc1515635b8 [2679/2679] bpf-rvi: Add bpf_mem_{total,free}cma kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508151842.k7QexzPZ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151842.k7QexzPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151842.k7QexzPZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:83:18: warning: no previous prototype for function 'bpf_si_memswinfo' [-Wmissing-prototypes]
      83 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:83:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:93:27: warning: no previous prototype for function 'bpf_page_counter_read' [-Wmissing-prototypes]
      93 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:93:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      93 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:103:18: warning: no previous prototype for function 'bpf_seq_file_append' [-Wmissing-prototypes]
     103 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:103:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:117:18: warning: no previous prototype for function 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     117 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:117:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:123:27: warning: no previous prototype for function 'bpf_get_total_forks' [-Wmissing-prototypes]
     123 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:123:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     123 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:128:26: warning: no previous prototype for function 'bpf_nr_running' [-Wmissing-prototypes]
     128 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:128:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:133:32: warning: no previous prototype for function 'bpf_nr_context_switches' [-Wmissing-prototypes]
     133 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:133:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     133 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:138:26: warning: no previous prototype for function 'bpf_nr_iowait' [-Wmissing-prototypes]
     138 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:138:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:144:26: warning: no previous prototype for function 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     144 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:144:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     144 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:149:27: warning: no previous prototype for function 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     149 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:149:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     149 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:154:18: warning: no previous prototype for function 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     154 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:154:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     154 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:163:27: warning: no previous prototype for function 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     163 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:163:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     163 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:168:27: warning: no previous prototype for function 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     168 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:168:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     168 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:173:27: warning: no previous prototype for function 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     173 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:173:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     173 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:179:27: warning: no previous prototype for function 'bpf_mem_totalcma' [-Wmissing-prototypes]
     179 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:179:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     179 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:184:27: warning: no previous prototype for function 'bpf_mem_freecma' [-Wmissing-prototypes]
     184 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:184:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     184 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |             ^
         |             static 
   20 warnings generated.


vim +/bpf_mem_totalcma +179 kernel/bpf-rvi/common_kfuncs.c

   178	
 > 179	__bpf_kfunc unsigned long bpf_mem_totalcma(void)
   180	{
   181		return totalcma_pages;
   182	}
   183	
 > 184	__bpf_kfunc unsigned long bpf_mem_freecma(void)
   185	{
   186		return global_zone_page_state(NR_FREE_CMA_PAGES);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
