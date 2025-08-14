Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502B3002C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176923; cv=none; b=p9rbiNbHImpYdYo2xxwZynFRv5Nh/61NnWgSi27EaEiE+pZmhDfK2H0FLm+vbYNzGyN7vLNY6nNsoObyBEmE8ymDde5mVsZusHDxwbeQ2ASub1zkQOWycYfqz5FIuNk3w64LZZ8UvYg96nLAn0r/hWpU9NA5pOrxcH+n8efALa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176923; c=relaxed/simple;
	bh=4uPCNWSiTBZ1PS5aFIKGfaSKYh9II/lqlJ8kMPz10Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxrALM7Qm6BvW06xwNeZX+thql9tUIRAv7C76ipxaCo8trBjtRh9tIF3sCegjpqSXKU0qAhyqtr5efW9o8WYnQHs9641WSbPYUzhJHMR9FbOZnUT5KBTkdxOgSeqha/Lpabb7Q75JCtLcVVnfB6i9P+5kdnsR1H6fXxxqcoa8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaFjSGk4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaFjSGk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755176920; x=1786712920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4uPCNWSiTBZ1PS5aFIKGfaSKYh9II/lqlJ8kMPz10Oc=;
  b=kaFjSGk4Qq2oGeuWJYVCP1r1QZuW74V6AAqCYPTR6UqUBUvQflCLItbS
   uvyBxKqoDuTKKAymmMC0Q+kvMEsmUzST6X1n0wFlL0F7JbWcY+gLXgcBI
   kFoLkwpA/o8YdjDbfJbAcewEmtNQMRAHC8T/clGkI0SSbpgMQIh8LW4jV
   y+jP9fMsp0nkSrWqOwAME8ZMl9rp4neCpBoHTnHVyecETcpEnZycAZfMn
   J+KTfIp9FthrdFdBLPn6wKKv9UZyaIcoDCvhsFP3eybs6pfcVwfkuIXfl
   oYwuv2AB5WyTHLvePZAyIwwC/O6p5nEKNfVKl6e41eUpvS3/MwEIHEztc
   A==;
X-CSE-ConnectionGUID: 0/9M2+xXRDqgT8CQefMAPQ==
X-CSE-MsgGUID: QBtEM7/VRa+0KCaL1SFf+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61117518"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="61117518"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:08:39 -0700
X-CSE-ConnectionGUID: ud6SN2wOQKCZDIB8IioLyw==
X-CSE-MsgGUID: Dh6zsf2fQl6iiNwTP3Mcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="171214547"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2025 06:08:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umXh5-000Aya-0X;
	Thu, 14 Aug 2025 13:08:35 +0000
Date: Thu, 14 Aug 2025 21:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/sched/cpuacct.c:412:18:
 warning: no previous prototype for function 'bpf_cpuacct_kcpustat_cpu_fetch'
Message-ID: <202508142117.RpbHh5Ge-lkp@intel.com>
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
commit: 6ed308fc1d6f486c9e3c171b6b80c1c5f0f57df6 [2679/2679] bpf-rvi: cpuacct: Add bpf_cpuacct_kcpustat_cpu_fetch kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250814/202508142117.RpbHh5Ge-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508142117.RpbHh5Ge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508142117.RpbHh5Ge-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:61:
>> kernel/sched/cpuacct.c:412:18: warning: no previous prototype for function 'bpf_cpuacct_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     412 | __bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
         |                  ^
   kernel/sched/cpuacct.c:412:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     412 | __bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
         |             ^
         |             static 
   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c:102:12: warning: no previous prototype for function 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^
   kernel/sched/debug.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | int __weak is_prefer_numa(void)
         | ^
         | static 
   In file included from kernel/sched/build_utility.c:113:
   kernel/sched/bpf_sched.c:186:17: warning: no previous prototype for function 'bpf_sched_entity_is_task' [-Wmissing-prototypes]
     186 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |                 ^
   kernel/sched/bpf_sched.c:186:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |             ^
         |             static 
   kernel/sched/bpf_sched.c:194:33: warning: no previous prototype for function 'bpf_sched_entity_to_task' [-Wmissing-prototypes]
     194 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |                                 ^
   kernel/sched/bpf_sched.c:194:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     194 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |             ^
         |             static 
   kernel/sched/bpf_sched.c:202:18: warning: no previous prototype for function 'bpf_sched_tag_of_entity' [-Wmissing-prototypes]
     202 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |                  ^
   kernel/sched/bpf_sched.c:202:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     202 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |             ^
         |             static 
   kernel/sched/bpf_sched.c:213:17: warning: no previous prototype for function 'bpf_sched_set_task_prefer_nid' [-Wmissing-prototypes]
     213 | __bpf_kfunc int bpf_sched_set_task_prefer_nid(struct task_struct *task, int nid)
         |                 ^
   kernel/sched/bpf_sched.c:213:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     213 | __bpf_kfunc int bpf_sched_set_task_prefer_nid(struct task_struct *task, int nid)
         |             ^
         |             static 
   6 warnings generated.


vim +/bpf_cpuacct_kcpustat_cpu_fetch +412 kernel/sched/cpuacct.c

   410	
   411	#ifdef CONFIG_BPF_RVI
 > 412	__bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
   413							struct cpuacct *ca, int cpu)
   414	{
   415		memcpy(dst, per_cpu_ptr(ca->cpustat, cpu), sizeof(struct kernel_cpustat));
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
