Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25AB1F2380
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755261386; cv=none; b=Fj1mIVUBQosSOJyowsZLyt4RO0JfbyzSx52UAyywKhu1lTAcFu/E6QC3nkab/jM+95zBF1/xXVPDqVc6gCgK+NXWA2gCtopxJkAod2Ro/OuQOrSY2ZJKZgRYHoxgcYZoN1FSpelyKPCNHRcR9ESaJNsySr5Otka0cxseT0YU3rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755261386; c=relaxed/simple;
	bh=laRn6IhJkd2RfK+Qk1xvSGfuFYyUU2RS4+hIaBIllR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGU+npEo2N7wcBuE8OKf9C1Hyr7khVZOO25R/pHFx8tBCquQdkgkv/ps439uehyVSLSrQ1qoeIeyL+G/QvRplce0rdNddTlxmIwlAiGY+Q45P3kKrWg9J2qpA3O8h2FCaeNZTpG0SmgbJJXoeY066kN8tQypvPsPIISC9RLTrFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvTpgcud; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvTpgcud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755261385; x=1786797385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laRn6IhJkd2RfK+Qk1xvSGfuFYyUU2RS4+hIaBIllR4=;
  b=SvTpgcudW3dYHbKn7vS0jcm97gKxx0YkTNjnV/lvegoB0+OqtMPTlBqh
   jUqceLALX+XHEP3j1lvbwpWbPyL7akKXYjvadbfhEYzp876HSpX5GFai0
   tboxGnD3k3c2ycq0GcpiP+McQHEUpkPdfjODggkEoHUNnoPIZlr8BOlwF
   IpLtKo9vmHxUW8hpwah+9vm35sJjkcZy90d3qSOfXS2nU/NIZihf0Wva4
   I2Nd69CX/MiKSSqnCsCmyunJbwR+zdZeezFkCx5T2vEDzN6dXNFpRvnTK
   m5nEd1UtxHsUl2488vp6mgXcyO+Rl+s4RGC6vk+NR0K6kzRoEVPtNWUV2
   Q==;
X-CSE-ConnectionGUID: KH2nfVxpSL2ykT5+CIlDbA==
X-CSE-MsgGUID: O8Sufc3aQnG2zxTKgIQYNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80160681"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="80160681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 05:36:25 -0700
X-CSE-ConnectionGUID: lJZ5rGUDSbqLTfeI9BiCdg==
X-CSE-MsgGUID: STqrzM1YSrCkS45tP4Gs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171250570"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 05:36:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umtfJ-000BxY-1v;
	Fri, 15 Aug 2025 12:36:18 +0000
Date: Fri, 15 Aug 2025 20:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:200:17:
 warning: no previous prototype for function 'bpf_hugetlb_report_meminfo'
Message-ID: <202508152019.hrE0RxXn-lkp@intel.com>
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
commit: edd6acd9af851644d1673be6bebb16269c67e018 [2679/2679] bpf-rvi: Add bpf_hugetlb_report_meminfo kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508152019.hrE0RxXn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152019.hrE0RxXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152019.hrE0RxXn-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:104:18: warning: no previous prototype for function 'bpf_seq_file_append' [-Wmissing-prototypes]
     104 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:104:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
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
>> kernel/bpf-rvi/common_kfuncs.c:200:17: warning: no previous prototype for function 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     200 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:200:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     200 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |             ^
         |             static 
   21 warnings generated.


vim +/bpf_hugetlb_report_meminfo +200 kernel/bpf-rvi/common_kfuncs.c

   198	
   199	#ifdef CONFIG_HUGETLB_PAGE
 > 200	__bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
   201	{
   202		struct hstate *h;
   203		unsigned long total = 0;
   204	
   205		if (!hugepages_supported())
   206			return -1;
   207	
   208		for_each_hstate(h) {
   209			unsigned long count = h->nr_huge_pages;
   210	
   211			total += huge_page_size(h) * count;
   212	
   213			if (h == &default_hstate) {
   214				hugepage_info->total = count;
   215				hugepage_info->free = h->free_huge_pages;
   216				hugepage_info->rsvd = h->resv_huge_pages;
   217				hugepage_info->surp = h->surplus_huge_pages;
   218				hugepage_info->size = huge_page_size(h) / SZ_1K;
   219			}
   220		}
   221	
   222		hugepage_info->hugetlb = total / SZ_1K;
   223		return 0;
   224	}
   225	#else
   226	__bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
   227	{
   228		return -1;
   229	}
   230	#endif
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
