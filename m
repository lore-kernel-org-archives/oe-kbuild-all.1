Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1362C21D7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241154; cv=none; b=t9iWL+NR7Pd9YwowPKdQ1pwFWVI3hUOYGwEdfXH6EVk9F0ZvHmbqNtPKrKtFTrSm9Fik4uiMEPeGErFSLXBQWoRb8y+y7LpInUs51CSuCimnoyL/3uxRBFLcZt2xfM0NfKs3TS4jc19KCtW0uy92Wb+qO+ZeVf75KacwxsqgTn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241154; c=relaxed/simple;
	bh=rrGNwNspFeEpg4jh7D3PijO+ryGyo5oZ8LvvpkfxoPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mupFv8LjQfr9mbhmS3wkJLIqP9SBI15qWm8XNGeXuCVlU+aCbDMhTRVJQUJtPMp+3Vo34y2sCzEIKNsvRCD8HADyoX7zHUER3qetk1Os27cigLehnasf/41+n+33PZpPjJanYuZOqu7rRjljcVzFQ7Njy08bNIUzvYOVF7fYpCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/xENwKJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/xENwKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755241152; x=1786777152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rrGNwNspFeEpg4jh7D3PijO+ryGyo5oZ8LvvpkfxoPI=;
  b=S/xENwKJ/wnUhGZ374NccIx+QxGfQyIObE7bikvcBKtr+9+lHp+aM8ZB
   w4SYZ2ga5RABFiEQ1bKiHeiKOcB6Z2FSyu7Bk4ZByDzM5+myeRsHZnnd+
   wN5Wm5eR7aFpFMqdApg02JuELrmAR2XimQ8pvTBzkVVwYA6AiHPV66uvV
   m+9b1oM5KuJT09r6+Z8CaUSz5hQ34RMzwQV9wsgctwL7v+Fd8hvWoJrdC
   +x97TLfqjoWACEQb1LG9DT+oRmiNzp5pZ2JC4iSnTOzH9NrPPlfmK8+p1
   aGrNSHdsCfmjE95BrA6aHUS8Bhi0q7+Qx1KQUM3sryIH2WMf7W/yoFVgz
   w==;
X-CSE-ConnectionGUID: pEs5EsXFQK2E99WX7fdX2g==
X-CSE-MsgGUID: uujPptznTDOrCwb+hYOZTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68939671"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68939671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:59:10 -0700
X-CSE-ConnectionGUID: FQG01kZVTMq2hUe22VnNcA==
X-CSE-MsgGUID: lDEFAwdzQrCb4KxomqQg2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172287397"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2025 23:59:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umoP4-000BfY-1d;
	Fri, 15 Aug 2025 06:59:06 +0000
Date: Fri, 15 Aug 2025 14:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:162:27:
 warning: no previous prototype for function 'bpf_mem_file_hugepage'
Message-ID: <202508151431.mBUI7ayW-lkp@intel.com>
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
commit: d97bc9c8827bb5cd9f66dab10e0b505a879256e2 [2679/2679] bpf-rvi: Add bpf_mem_{file_{hugepage,pmdmapped},kreclaimable} kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508151431.mBUI7ayW-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151431.mBUI7ayW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151431.mBUI7ayW-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   kernel/bpf-rvi/common_kfuncs.c:143:26: warning: no previous prototype for function 'bpf_kstat_softirqs_cpu' [-Wmissing-prototypes]
     143 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:143:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | __bpf_kfunc unsigned int bpf_kstat_softirqs_cpu(unsigned int irq, int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:148:27: warning: no previous prototype for function 'bpf_kstat_cpu_irqs_sum' [-Wmissing-prototypes]
     148 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:148:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | __bpf_kfunc unsigned long bpf_kstat_cpu_irqs_sum(unsigned int cpu)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:153:18: warning: no previous prototype for function 'bpf_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     153 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:153:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     153 | __bpf_kfunc void bpf_kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:162:27: warning: no previous prototype for function 'bpf_mem_file_hugepage' [-Wmissing-prototypes]
     162 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:162:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     162 | __bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:167:27: warning: no previous prototype for function 'bpf_mem_file_pmdmapped' [-Wmissing-prototypes]
     167 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:167:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     167 | __bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:172:27: warning: no previous prototype for function 'bpf_mem_kreclaimable' [-Wmissing-prototypes]
     172 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:172:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     172 | __bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
         |             ^
         |             static 
   18 warnings generated.


vim +/bpf_mem_file_hugepage +162 kernel/bpf-rvi/common_kfuncs.c

   157	
   158	/*
   159	 * Meminfo related kfuncs
   160	 */
   161	
 > 162	__bpf_kfunc unsigned long bpf_mem_file_hugepage(void)
   163	{
   164		return global_node_page_state(NR_FILE_THPS);
   165	}
   166	
 > 167	__bpf_kfunc unsigned long bpf_mem_file_pmdmapped(void)
   168	{
   169		return global_node_page_state(NR_FILE_PMDMAPPED);
   170	}
   171	
 > 172	__bpf_kfunc unsigned long bpf_mem_kreclaimable(void)
   173	{
   174		return global_node_page_state_pages(NR_SLAB_RECLAIMABLE_B) +
   175			global_node_page_state(NR_KERNEL_MISC_RECLAIMABLE);
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
