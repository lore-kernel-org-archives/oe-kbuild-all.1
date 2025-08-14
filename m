Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86AF4FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 23:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755214365; cv=none; b=tyROK+sbgkr/grkQCjaxWdTYL/bhGaQ6LaMnUqEy9CfRqRpM1VvGnwTOp9N8t+7L4o2msVrAQZT8c37a+s6cy85hpP5Ft2YvawJBYHMICT+S3epCl2hjU51Y+r34B17Xt4mS/vcEdYBbandWir6lWzUpo5oNBoBd8iEDhljtqBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755214365; c=relaxed/simple;
	bh=FH67/qUUqTYNTLZvcooVyYTz2bQjmCKBZliGOmY6lbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzVDO7ogRuA+s4+QrgjF7ymodyA9aYgzuYM9U5bHxABxqp1lRZBtPPjMUf6queopgzi+uC/bAWQOW5JEtofjn/9k+Hq3YibTAAIacEfoswR+ndmQHlHSaNg3rjKuLE/JL76Qpm9LpwLWBIG9OPW6mGX5LA2OvriBmF/xB6oLbxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtlOAnS7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtlOAnS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755214363; x=1786750363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FH67/qUUqTYNTLZvcooVyYTz2bQjmCKBZliGOmY6lbA=;
  b=WtlOAnS7KfkKhInA/WtKfUT2bAkRB1Mz3tgvcrhNbp8MWzM3+1JJOxR7
   YmAc1Eut7irqB59Ip/cch4UrYdpPcD/4K9e5ESpmamxKpSaTbP5H6KwZJ
   5jwp60uLyGen1owA36BiN7Twt83IiE0GCIjGqbe6Pt5PFL03AaEvzyaZP
   xHxi3NneT4J2usv6wf3CXQx72j7/hecA1acKt8FHHAPRSXP/oXHCKI3Rt
   HWTQZvdpacRIoymfoj7lpuQfiA+lT81X6xo7vZGIwRL6X3PijgNd4qufe
   TrHoDA6enlPJyb85oJZFv0vlVsGiBNMPLgPNibZ6rOKTKCa7m6JgmNEn1
   w==;
X-CSE-ConnectionGUID: 4wp66yLqTCWodU8TheA7EA==
X-CSE-MsgGUID: 4WBPXymzTw6owe+k5Gv4lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="74993707"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="74993707"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 16:32:42 -0700
X-CSE-ConnectionGUID: h74xcjlxRjGnchpebGO5uA==
X-CSE-MsgGUID: fNF9epJWR4OezYKKR/mQcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172108953"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2025 16:32:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umhQs-000BNc-0k;
	Thu, 14 Aug 2025 23:32:34 +0000
Date: Fri, 15 Aug 2025 07:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:97:18:
 warning: no previous prototype for function 'bpf_seq_file_append'
Message-ID: <202508150748.bPjkF4cw-lkp@intel.com>
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
commit: 1afa15e45da121993a15941b08fef5e3d58f40e5 [2679/2679] bpf-rvi: Add bpf_seq_file_append() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150748.bPjkF4cw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150748.bPjkF4cw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150748.bPjkF4cw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:20:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      20 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:20:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:29:35: warning: no previous prototype for function 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      29 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^
   kernel/bpf-rvi/common_kfuncs.c:29:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:34:17: warning: no previous prototype for function 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      34 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:34:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      34 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:48:17: warning: no previous prototype for function 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      48 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:48:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      48 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:77:18: warning: no previous prototype for function 'bpf_si_memswinfo' [-Wmissing-prototypes]
      77 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:77:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      77 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:87:27: warning: no previous prototype for function 'bpf_page_counter_read' [-Wmissing-prototypes]
      87 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:87:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      87 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:97:18: warning: no previous prototype for function 'bpf_seq_file_append' [-Wmissing-prototypes]
      97 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:97:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | __bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
         |             ^
         |             static 
   7 warnings generated.


vim +/bpf_seq_file_append +97 kernel/bpf-rvi/common_kfuncs.c

    91	
    92	/*
    93	 * Stat related kfuncs
    94	 */
    95	
    96	/* Moving src's content to the end of dst. Reference: seq_vprintf. */
  > 97	__bpf_kfunc void bpf_seq_file_append(struct seq_file *dst, struct seq_file *src)
    98	{
    99		/*
   100		 * ->count: length of content
   101		 * ->size: available buffer space
   102		 * i.e. seq_printf(dst, "%s", src->buf)
   103		 */
   104		if (dst->count < dst->size)
   105			if (src->count < dst->size - dst->count) {
   106				memmove(dst->buf + dst->count, src->buf, src->count);
   107				dst->count += src->count;
   108			}
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
