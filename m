Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8921ADA3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755285077; cv=none; b=pd5msfRdXh97ssAYBuTFLxs3r1N6KFiT8AjlQZyh+PpZMD8xmAeAHWVupWTB8XSKYMHlIslzsD8VSLAsTb58b/R6jq4Eqor9mW4Y6g0/3XEwSxSwGI3xIkKzko31FqvkJqpWL2DkZ45DHLG88966YBLV1ke/1NnVB8taAn0wvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755285077; c=relaxed/simple;
	bh=npxkxqNr6oxKB4ky8DqEhDvq9Ly/OJJMBdnUEfKGzBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VKpOxl1FePhbmAB/YpmM0qehYogiXvaAWSXMGvJffHTA/YpclnLglDk9dDiVCnuW1dsNEnxiYB2gxxacV+cXVTpq3Snw/9qNB/ns/VUtLxDCmHMnHLf/TY3srJkHLJcowkT6R/yrSCS8XL2Zz1xx0tBSqokeCz/uLS5/a+OBTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBKLeaFo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBKLeaFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755285075; x=1786821075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=npxkxqNr6oxKB4ky8DqEhDvq9Ly/OJJMBdnUEfKGzBs=;
  b=bBKLeaFoayOeR7MZab1x3Cp2esF9dhk3MLfIkGwiX4cKhdZBOSRea6dD
   l8TifRAHVsa3xofGqa9HnwpwNkyS7PSQkCdxk99jgK+Olwp0chV61/Ts1
   wT0OHzc5GoQ7HC1j+BaO1PBc02sOUCdG1DceQL7t445Ugnt+fZjdOgTy+
   bV9PflEGaqsdAQMqR8DZt/1y8DLg80T6LNsTeI56/RPpqxfeaeEcbodT0
   3nYrxaM6NqZhv2Qzs1gl5xFbfJocZdGB5kK0VxVWuLE6eQNtZfVBoRY8e
   GWFDRarpEllXAiLGC++//cNEnTCVDR1ZNAthuQK04IDUR18uoxMRN4Vpv
   Q==;
X-CSE-ConnectionGUID: oyImn5n7Q/Wo+E7yIEkvXQ==
X-CSE-MsgGUID: 4DR35WXfT2WLWX2e+thIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61421529"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61421529"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 12:11:14 -0700
X-CSE-ConnectionGUID: C6ERix12T0GnU9jUtBPqCw==
X-CSE-MsgGUID: 6an01dIWQ/GZ4t2q0yw9Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171524201"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Aug 2025 12:11:12 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umzpV-000CGS-2q;
	Fri, 15 Aug 2025 19:11:09 +0000
Date: Sat, 16 Aug 2025 03:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:260:27:
 warning: no previous prototype for function 'bpf_mem_vmalloc_used'
Message-ID: <202508160334.oBJoPyq0-lkp@intel.com>
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
commit: c4e5391b74ba345c143a4af707330ac9b33aac71 [2679/2679] bpf-rvi: Add bpf_mem_vmalloc_{used,total} kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250816/202508160334.oBJoPyq0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160334.oBJoPyq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160334.oBJoPyq0-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:141:26: warning: no previous prototype for function 'bpf_nr_iowait' [-Wmissing-prototypes]
     141 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:141:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     141 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:147:26: warning: no previous prototype for function 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     147 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:147:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     147 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:152:27: warning: no previous prototype for function 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     152 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:152:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     152 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:157:18: warning: no previous prototype for function 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     157 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:157:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     157 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:166:27: warning: no previous prototype for function 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     166 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:166:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:171:27: warning: no previous prototype for function 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     171 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:171:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     171 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:176:27: warning: no previous prototype for function 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     176 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:176:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     176 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:182:27: warning: no previous prototype for function 'bpf_mem_totalcma' [-Wmissing-prototypes]
     182 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:182:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     182 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:187:27: warning: no previous prototype for function 'bpf_mem_freecma' [-Wmissing-prototypes]
     187 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:187:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     187 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:202:17: warning: no previous prototype for function 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     202 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:202:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     202 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:240:27: warning: no previous prototype for function 'bpf_mem_failure' [-Wmissing-prototypes]
     240 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:240:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     240 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:246:27: warning: no previous prototype for function 'bpf_mem_percpu' [-Wmissing-prototypes]
     246 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:246:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     246 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:251:27: warning: no previous prototype for function 'bpf_mem_commit_limit' [-Wmissing-prototypes]
     251 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:251:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:255:27: warning: no previous prototype for function 'bpf_mem_committed' [-Wmissing-prototypes]
     255 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:255:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:260:27: warning: no previous prototype for function 'bpf_mem_vmalloc_used' [-Wmissing-prototypes]
     260 | __bpf_kfunc unsigned long bpf_mem_vmalloc_used(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:260:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     260 | __bpf_kfunc unsigned long bpf_mem_vmalloc_used(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:265:27: warning: no previous prototype for function 'bpf_mem_vmalloc_total' [-Wmissing-prototypes]
     265 | __bpf_kfunc unsigned long bpf_mem_vmalloc_total(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:265:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     265 | __bpf_kfunc unsigned long bpf_mem_vmalloc_total(void)
         |             ^
         |             static 
   27 warnings generated.


vim +/bpf_mem_vmalloc_used +260 kernel/bpf-rvi/common_kfuncs.c

   259	
 > 260	__bpf_kfunc unsigned long bpf_mem_vmalloc_used(void)
   261	{
   262		return vmalloc_nr_pages();
   263	}
   264	
 > 265	__bpf_kfunc unsigned long bpf_mem_vmalloc_total(void)
   266	{
   267		return (unsigned long)VMALLOC_TOTAL >> 10;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
