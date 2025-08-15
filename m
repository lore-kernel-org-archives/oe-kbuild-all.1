Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2422946A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755279311; cv=none; b=FxI3AXqOR//eOu6nduDjik8aJQFzsqFZ+AooJQa6ZgfMBzYYPWiwhA2JMdQ9pfkvLo71XtXUE2QmPf1y3l3dGwLZV5ybdKGEIQFRYaXyPfW2bkirX8+xV1YUwYguuAGCKf8pm9dXG0iALREghpKwOnNM9IgH4M/4Nh2/7aAq3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755279311; c=relaxed/simple;
	bh=Iw9NEsHIxxd/BLSao6StMS7JGMlVrFSLm/XBrOXXF3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IOvCsEdFaDYKdGtWSkiwmO9lHgjOLkQ0YyvZO+fA+pmlHoS+Hd95ORkIqOKTyvNmpht+P1r4FkoMm9JO1B3jMDbx2qfjzfiJs5qr68o0q0reRjp9ZQk1u+ig3kNRgoVzQL3BpQQKPvZRYTkbeH2uH7Nh7fRBFy9gcPHU3Fmm/4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9tSbRee; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9tSbRee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755279308; x=1786815308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iw9NEsHIxxd/BLSao6StMS7JGMlVrFSLm/XBrOXXF3o=;
  b=e9tSbReerpQq8qcKhoZe+j8WIjiS/GoGbvceR4h/d3Lc4iDFviowJD/p
   FUv4lIb3hCwEryKuvhKaxadxa+6Ct0mrtGLf6eA+3XwA6awZGeMXvxO48
   cf6Rgvn2l9Uv+zYaOwh7/u9G3wwKsxzgBVItlvrGYSi38Megge+kFEypU
   zFVDTpvOOhXA/zT4VoWKM69Y1NiXzqMQfX+h5o3coKqrD+OjaeSYyqTUO
   JiUgi7j+BKU0yMzdVBlXz/1E7Zm7Ut3mQHzOIMrE0yoQ4CU2hhOnUpz32
   0Igm+Yp6GB3I49ykJUHbIXr6huuMNvAD3wNPZxyrRdwvT9OknHUBUJXur
   g==;
X-CSE-ConnectionGUID: eBiFy6leSlaWIxQmUiIQJg==
X-CSE-MsgGUID: S2GDPk+1RNqDywO4dRcg6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68691253"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68691253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 10:35:06 -0700
X-CSE-ConnectionGUID: YBQzx3B0QVCcuVJcivqKfQ==
X-CSE-MsgGUID: mTjKPe9UT0u0aBPlOzyPiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="190776287"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Aug 2025 10:35:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umyJk-000CBE-00;
	Fri, 15 Aug 2025 17:34:31 +0000
Date: Sat, 16 Aug 2025 01:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:250:27:
 warning: no previous prototype for function 'bpf_mem_commit_limit'
Message-ID: <202508160141.44QSK5Us-lkp@intel.com>
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
commit: 7aa850a9126f0acd994e09afe54bb0200214e068 [2679/2679] bpf-rvi: Add bpf_mem_commit_limit & bpf_mem_committed kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250816/202508160141.44QSK5Us-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160141.44QSK5Us-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160141.44QSK5Us-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:130:26: warning: no previous prototype for function 'bpf_nr_running' [-Wmissing-prototypes]
     130 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:130:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     130 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:135:32: warning: no previous prototype for function 'bpf_nr_context_switches' [-Wmissing-prototypes]
     135 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:135:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     135 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:140:26: warning: no previous prototype for function 'bpf_nr_iowait' [-Wmissing-prototypes]
     140 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:140:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     140 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:146:26: warning: no previous prototype for function 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     146 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:146:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     146 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:151:27: warning: no previous prototype for function 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     151 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:151:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     151 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:156:18: warning: no previous prototype for function 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     156 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:156:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:165:27: warning: no previous prototype for function 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     165 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:165:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     165 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:170:27: warning: no previous prototype for function 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     170 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:170:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:175:27: warning: no previous prototype for function 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     175 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:175:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     175 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:181:27: warning: no previous prototype for function 'bpf_mem_totalcma' [-Wmissing-prototypes]
     181 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:181:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     181 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:186:27: warning: no previous prototype for function 'bpf_mem_freecma' [-Wmissing-prototypes]
     186 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:186:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:201:17: warning: no previous prototype for function 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     201 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:201:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     201 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:239:27: warning: no previous prototype for function 'bpf_mem_failure' [-Wmissing-prototypes]
     239 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:239:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     239 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:245:27: warning: no previous prototype for function 'bpf_mem_percpu' [-Wmissing-prototypes]
     245 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:245:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:250:27: warning: no previous prototype for function 'bpf_mem_commit_limit' [-Wmissing-prototypes]
     250 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:250:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     250 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:254:27: warning: no previous prototype for function 'bpf_mem_committed' [-Wmissing-prototypes]
     254 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:254:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |             ^
         |             static 
   25 warnings generated.


vim +/bpf_mem_commit_limit +250 kernel/bpf-rvi/common_kfuncs.c

   249	
 > 250	__bpf_kfunc unsigned long bpf_mem_commit_limit(void)
   251	{
   252		return vm_commit_limit();
   253	}
 > 254	__bpf_kfunc unsigned long bpf_mem_committed(void)
   255	{
   256		return vm_memory_committed();
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
