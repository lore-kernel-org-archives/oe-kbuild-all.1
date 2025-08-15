Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076E19F12D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272748; cv=none; b=R6GmhnpmjrZBobzbh9bnejOeSp+tfGQu1F7t9LCHCJiicQgbxf30HHJ1q5Y2NAndMbeOe/DlrTvS1fD9XwkyupicZUOMOB3J+cwi750lldxz1jHw/H5l4Z9zSsPZvZL4m5v3APb7cKRTpN9QWPVzFfY4YmGKj/1wAcw8DtF1Q2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272748; c=relaxed/simple;
	bh=IHDIW69JAOrBeWN/KEZuyryhCJODD8BjbKUc6hX5qtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQZqhLsTR6hjIGClSSPLchzvugs+LnxV8f/b1JQzgV1G9HsYqsTIDQwmTa3E1AdNBixwQLqjMnOPt5VBYxTFP4JXttCQk0mD33W/5YYalhzdkKvV/MKYVYzsW8D1+IyujFCyI4e8KplZq9krjBr2dU4LhRL//rMmzyQ3rJsHUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVZbUNoS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVZbUNoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755272746; x=1786808746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHDIW69JAOrBeWN/KEZuyryhCJODD8BjbKUc6hX5qtI=;
  b=RVZbUNoS467vxalTZhCod/hBjsJcA9oue1Fr/G51J+QeWKJ70qcIoITo
   pehUN+ZSHaBjk9nEW8bICqWodiTK6Gq/nyJmyWnPrBZE4HGqNtiuWF1+H
   HpDoquh/6Me5sz52s1BZ/Mf3qmgkqe0995W6maLcxSSpNT9ehKcpTyXaC
   loOcSULlV5VT4PHz3SVJrPrw49sGUpB0l/VEVHDoLdCARuSpTVynwXlKN
   5ykskkcvafqe2VyHNmiw7z1g+ZnBubo+cpf5YQscpdlL3J+84Vtfdo62U
   N4dnuovj2BNR/8yIOacrC4pMPJAr4pzMSHtY94dFqWam6+00Uyz5aLbWx
   g==;
X-CSE-ConnectionGUID: 1d078oTtQ4OhWdtTylEAdw==
X-CSE-MsgGUID: oX8MU/ZPRUiBQAsAvf5RWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="60222176"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="60222176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 08:45:46 -0700
X-CSE-ConnectionGUID: I3WflnPUTeKKX/HBiZulKQ==
X-CSE-MsgGUID: +ndsH0/mSBuI4lxBqwE+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="204216897"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 08:45:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umwce-000C4U-31;
	Fri, 15 Aug 2025 15:45:41 +0000
Date: Fri, 15 Aug 2025 23:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:244:27:
 warning: no previous prototype for function 'bpf_mem_percpu'
Message-ID: <202508152311.kWn09op7-lkp@intel.com>
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
commit: af34a7a840fd24a050a5fee8ea4dcfad963f3abc [2679/2679] bpf-rvi: Add bpf_mem_percpu kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508152311.kWn09op7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152311.kWn09op7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152311.kWn09op7-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   kernel/bpf-rvi/common_kfuncs.c:238:27: warning: no previous prototype for function 'bpf_mem_failure' [-Wmissing-prototypes]
     238 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:238:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     238 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:244:27: warning: no previous prototype for function 'bpf_mem_percpu' [-Wmissing-prototypes]
     244 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:244:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     244 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |             ^
         |             static 
   23 warnings generated.


vim +/bpf_mem_percpu +244 kernel/bpf-rvi/common_kfuncs.c

   243	
 > 244	__bpf_kfunc unsigned long bpf_mem_percpu(void)
   245	{
   246		return pcpu_nr_pages();
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
