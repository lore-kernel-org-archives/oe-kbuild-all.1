Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9881E32D7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 03:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755229107; cv=none; b=KPaq0eSvfidWY7frwn/4eadoS/6uyk1wPtfvDqkwSdIENokNalcw9gEB9H2UipJ3wycLTONMORwL6SHAAoEX/BIVhA1EtkIknVa7qYPknZOoX2p69MiFvcvYIemxwiVv0cVbAtHhbmQisuPHmN7comjEifP9Kwrh/J+CSx6W1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755229107; c=relaxed/simple;
	bh=hLWnPZWmm5r/ENdadxrenkXbKBngj1xX/tAS9Zjd9zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8I18/+Oo/pLClb9ulT56pkl8+J98tHBrdw1rgcJzAtBlwMlN5NUjoGFiTtnXoLECE6n1W+9J2nHJGW6IFQmMKnKiffBL3pYlrJB+AER5qDjBS1Y9rIbPxI1QmBN9m5B2r0lDEYiGmyy7+KEYvy8diIiXSSzqSr0qXV9Sg3hwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgX+gy6k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgX+gy6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755229105; x=1786765105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLWnPZWmm5r/ENdadxrenkXbKBngj1xX/tAS9Zjd9zo=;
  b=JgX+gy6kf83tsWbCMoX1I+BZSvdnt1ojGNedtJN6rKH/i7/mWLpKI4Bg
   5IUl5nL4lzwFSoAOGmmflZ5HP8BIsIvCiNBncAVEKGRZ3rXl7PAEuGRAD
   mgfhGEjrpiAbaNNN1WiQQeWxXore3x1EyqmyspirtY5lttAOh8MQNLJxk
   wsUsg+6ODqNVnDKBE/FK6gvWC9Bav6f9YqSytHI19q1I8+rmKjxkSpS5d
   zmvnBA1QgRwRxYTQn+sm+ITjejXlMospdd99cT+0vweBbJP8E1Czi6A8A
   iEwOI6eKXhQ40EB5CxS/4E2tmhkMDyoufA3eakN5aGAiQT+rCFBdihESg
   g==;
X-CSE-ConnectionGUID: 4nIHeoZETRiLtNKv8nwbVA==
X-CSE-MsgGUID: AUI3qJo5R4W+KNN/n5SvWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68641389"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68641389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:38:22 -0700
X-CSE-ConnectionGUID: 7rF3pjGxR4+3T4fuAUi/EA==
X-CSE-MsgGUID: Q7IoaM/kSSWnrrEwG+lqug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167181737"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 20:38:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umlGO-000BW6-2c;
	Fri, 15 Aug 2025 03:38:10 +0000
Date: Fri, 15 Aug 2025 11:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:127:26:
 warning: no previous prototype for function 'bpf_nr_running'
Message-ID: <202508151109.6yJtnNTX-lkp@intel.com>
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
commit: 34f90dce941b028e02a0336711907b220e3c5765 [2679/2679] bpf-rvi: Add cpu runqueue related kfuncs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508151109.6yJtnNTX-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151109.6yJtnNTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151109.6yJtnNTX-lkp@intel.com/

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
>> kernel/bpf-rvi/common_kfuncs.c:127:26: warning: no previous prototype for function 'bpf_nr_running' [-Wmissing-prototypes]
     127 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:127:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | __bpf_kfunc unsigned int bpf_nr_running(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:132:32: warning: no previous prototype for function 'bpf_nr_context_switches' [-Wmissing-prototypes]
     132 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:132:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     132 | __bpf_kfunc unsigned long long bpf_nr_context_switches(void)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:137:26: warning: no previous prototype for function 'bpf_nr_iowait' [-Wmissing-prototypes]
     137 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |                          ^
   kernel/bpf-rvi/common_kfuncs.c:137:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | __bpf_kfunc unsigned int bpf_nr_iowait(void)
         |             ^
         |             static 
   12 warnings generated.


vim +/bpf_nr_running +127 kernel/bpf-rvi/common_kfuncs.c

   126	
 > 127	__bpf_kfunc unsigned int bpf_nr_running(void)
   128	{
   129		return nr_running();
   130	}
   131	
 > 132	__bpf_kfunc unsigned long long bpf_nr_context_switches(void)
   133	{
   134		return nr_context_switches();
   135	}
   136	
 > 137	__bpf_kfunc unsigned int bpf_nr_iowait(void)
   138	{
   139		return nr_iowait();
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
