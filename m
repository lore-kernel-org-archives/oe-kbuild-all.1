Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B79832D0E6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762353066; cv=none; b=fi2mu83XvZJ9JE2GL9BqrC6F9ptE88PYRjnY9VZeJwdRqN4H7s2Qp8g7Gaj1wtgvKm21LrlwGd8to+Fj7LrYKqkbrtbvTh2L+NMepKHT8eeBwa7zsLuB/Xu66VvLgRWti192epZZ5QyKw6seu1yx9llC8mbQkdQr1EJ7KF5rnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762353066; c=relaxed/simple;
	bh=3jeXkhRI+Og7xUqvhMXNRqAi6LdFlYugIK4U6jHSqHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gzqytJqz6o1hgLzzSnzv5Y1NWBiWwJGjKJNHDt5OuqCMh3dUJP52JZx8G8ux7i9ZVd5e98ThTOhnjY45rAsCaRI+Pc/s0VWgFBdLYI3q706yV76xCMTbijLKSvvHoVau+R1V6wXTbROEcoddnG4AXXab3Ypk4IbcBvorqdNLlS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtUFmu0a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtUFmu0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762353064; x=1793889064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3jeXkhRI+Og7xUqvhMXNRqAi6LdFlYugIK4U6jHSqHc=;
  b=PtUFmu0aIgIzPHaWA86eBq53Kr0hb/ZRuPLvIuMFwOS4Px0JT7dR8leQ
   gbDReXghdFhrxGTRpKI9WCfirW1xD7GAcZbalRes0RuF6MLewWdvDXNvF
   0sjEyIhs0vLEPiQG8HpcJiZFOqtTP/STzidJ4/4pTmxnLiWMxm1nih9CX
   hQkU2Lg1s4bXgWbzrBuhGAIekWS4BllNU5Q9oIq5AKmeJ9QnZdd3qgAuQ
   V0L2m/59PhVY+/gfioIBnEtPDrMxCM9OuY/UOjhDvuvumrq1Y9E35ZCIg
   SADPAImPxQxR+eyGm5+xG6HkAMUub1o0OVGZzsW1evZH/DnWTzw2kCyDl
   w==;
X-CSE-ConnectionGUID: 5WYBOPUkSSqm1zxy+C2B+g==
X-CSE-MsgGUID: F0z1l8FXQfKRmdCyBkfCjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64566975"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64566975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 06:31:03 -0800
X-CSE-ConnectionGUID: mgn1nTlrTKOzX4XMfLcTEg==
X-CSE-MsgGUID: zz/StFJHRmSGKfBu9xPzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="191755856"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Nov 2025 06:31:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGeXM-000Sgb-0D;
	Wed, 05 Nov 2025 14:31:00 +0000
Date: Wed, 5 Nov 2025 22:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/bpf-rvi/common_kfuncs.c:260:27:
 warning: no previous prototype for 'bpf_mem_vmalloc_used'
Message-ID: <202511052209.ExfiyFp7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b2b8512ca97108929f3aca5405875d91577b8c80
commit: c4e5391b74ba345c143a4af707330ac9b33aac71 [3098/3098] bpf-rvi: Add bpf_mem_vmalloc_{used,total} kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251105/202511052209.ExfiyFp7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052209.ExfiyFp7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052209.ExfiyFp7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:29:32: warning: no previous prototype for 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      29 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:38:35: warning: no previous prototype for 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      38 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:43:17: warning: no previous prototype for 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      43 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:57:17: warning: no previous prototype for 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      57 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:86:18: warning: no previous prototype for 'bpf_si_memswinfo' [-Wmissing-prototypes]
      86 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:96:27: warning: no previous prototype for 'bpf_page_counter_read' [-Wmissing-prototypes]
      96 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:106:18: warning: no previous prototype for 'bpf_seq_file_append' [-Wmissing-prototypes]
     106 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:120:18: warning: no previous prototype for 'bpf_get_boottime_timens' [-Wmissing-prototypes]
     120 | __bpf_kfunc void bpf_get_boottime_timens(struct task_struct *tsk, struct timespec64 *boottime)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:126:27: warning: no previous prototype for 'bpf_get_total_forks' [-Wmissing-prototypes]
     126 | __bpf_kfunc unsigned long bpf_get_total_forks(void)
         |                           ^~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:131:26: warning: no previous prototype for 'bpf_nr_running' [-Wmissing-prototypes]
     131 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:136:32: warning: no previous prototype for 'bpf_nr_context_switches' [-Wmissing-prototypes]
     136 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:141:26: warning: no previous prototype for 'bpf_nr_iowait' [-Wmissing-prototypes]
     141 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:147:26: warning: no previous prototype for 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     147 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:152:27: warning: no previous prototype for 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     152 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:157:18: warning: no previous prototype for 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     157 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:166:27: warning: no previous prototype for 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     166 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:171:27: warning: no previous prototype for 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     171 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:176:27: warning: no previous prototype for 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     176 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:182:27: warning: no previous prototype for 'bpf_mem_totalcma' [-Wmissing-prototypes]
     182 | __bpf_kfunc unsigned long bpf_mem_totalcma(void)
         |                           ^~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:187:27: warning: no previous prototype for 'bpf_mem_freecma' [-Wmissing-prototypes]
     187 | __bpf_kfunc unsigned long bpf_mem_freecma(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:202:17: warning: no previous prototype for 'bpf_hugetlb_report_meminfo' [-Wmissing-prototypes]
     202 | __bpf_kfunc int bpf_hugetlb_report_meminfo(struct bpf_mem_hugepage *hugepage_info)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:235:27: warning: no previous prototype for 'bpf_mem_failure' [-Wmissing-prototypes]
     235 | __bpf_kfunc unsigned long bpf_mem_failure(void)
         |                           ^~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:246:27: warning: no previous prototype for 'bpf_mem_percpu' [-Wmissing-prototypes]
     246 | __bpf_kfunc unsigned long bpf_mem_percpu(void)
         |                           ^~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:251:27: warning: no previous prototype for 'bpf_mem_commit_limit' [-Wmissing-prototypes]
     251 | __bpf_kfunc unsigned long bpf_mem_commit_limit(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf-rvi/common_kfuncs.c:255:27: warning: no previous prototype for 'bpf_mem_committed' [-Wmissing-prototypes]
     255 | __bpf_kfunc unsigned long bpf_mem_committed(void)
         |                           ^~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:260:27: warning: no previous prototype for 'bpf_mem_vmalloc_used' [-Wmissing-prototypes]
     260 | __bpf_kfunc unsigned long bpf_mem_vmalloc_used(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf-rvi/common_kfuncs.c:265:27: warning: no previous prototype for 'bpf_mem_vmalloc_total' [-Wmissing-prototypes]
     265 | __bpf_kfunc unsigned long bpf_mem_vmalloc_total(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~


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
