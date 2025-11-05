Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290726E17A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 05:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762321509; cv=none; b=PGpdgdxG7YmgR/+zT0q7o0SfCGc5ESGYTuvIKDjVaLI5aXpqqsX4ONKqpuy62kMHk/a6RrmtcPFVqnDOx82pxGpoeHCN8rPZ73S1fVlr9SgrJZAqHueFuICuIaBBPVI55gkSzYG4h0UZyLfJqCmtXgzaHxOFSEiBbc01vzqDG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762321509; c=relaxed/simple;
	bh=enQeA90k9VoswMKFKjCe/qV3hahRoiNqyHcamTkguBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgaKcE2rI9DZT8fC60A+v8BxiPN9zWZOM+zm69umgNJpSr3wH2QQoa8YxaKUAxPOk7su7sIT+C5PXKSlTx8N249XZjivniYmQbdYeV0hDoPcBCjQLopVXuEP7lz6MybttiaBLDBoEVFbHi1zu+MaMzcgWdu0i09LMvsdMSUJdQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIMk05vX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIMk05vX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762321507; x=1793857507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enQeA90k9VoswMKFKjCe/qV3hahRoiNqyHcamTkguBY=;
  b=AIMk05vXpCvuVHB2b3CD+/tNccOdFPtIxuS25/tXa5gVaPBCaG0OfEFa
   QeFr1hODzAg2Sh1INosnYZd8tcUvTLaTFa5DuU+rYldx9yG6plKuRk951
   gdHDNuQzR+tzyYSez6V9GF+amVO8R0O0xtfPocQx0voT3HadFc3dR2jIs
   gydJszkn23b4ZAKPnvEhFcJRF/u64V2T9EhtBXaKSM7hqWqvfZZ4FQOBI
   Tdr3HJ1zFidabjmX76zi9pNGA/i1/vUc+TP69z6Is6y1LZzjHs3u2ujSr
   iocWcGMxBDVp/nMO9XQRSH26zOIz0VSmW0yxOR15mCM6LQnLl7HL4Vf2+
   A==;
X-CSE-ConnectionGUID: zZFoo5cUSZqk/dQn7Si9oQ==
X-CSE-MsgGUID: fuSUig4FRlKkMYI2BhzB4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75536410"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="75536410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 21:45:05 -0800
X-CSE-ConnectionGUID: /HLRqiFTSD6454E42b+s/A==
X-CSE-MsgGUID: aN0kFwweSPu8+vSG7dfENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="224606405"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2025 21:45:03 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGWKL-000SCK-1n;
	Wed, 05 Nov 2025 05:45:01 +0000
Date: Wed, 5 Nov 2025 13:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:179:27:
 warning: no previous prototype for 'bpf_mem_totalcma'
Message-ID: <202511051322.XbdPyERX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fe656d8bc10b5c4ced04a8821909e64adc18a7ef
commit: 9c449e4d9af5b69a1b9fdae9e3f18dc1515635b8 [3098/3098] bpf-rvi: Add bpf_mem_{total,free}cma kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511051322.XbdPyERX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051322.XbdPyERX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051322.XbdPyERX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:26:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      26 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:35:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      35 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:40:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      40 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:54:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      54 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:83:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      83 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:93:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      93 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:103:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     103 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:117:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     117 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:123:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     123 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:128:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     128 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:133:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     133 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:138:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     138 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:144:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     144 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:149:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     149 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:154:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     154 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:163:27: warning: no previous prototype for 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     163 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:168:27: warning: no previous prototype for 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     168 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:173:27: warning: no previous prototype for 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     173 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:179:27: warning: no previous prototype for 'bpf_mem_totalcma' [-Wmissing-prototypes]
     179 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:184:27: warning: no previous prototype for 'bpf_mem_freecma' [-Wmissing-prototypes]
     184 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^~~~~~~~~~~~~~~


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
