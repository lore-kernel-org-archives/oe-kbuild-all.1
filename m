Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078E1EEA55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197417; cv=none; b=u98PrK/OPmiTHHGy4AKTJpthfcGSjijuPRIVrMe5nxwe0sNtUjoi0qwUXr0RASgt019j1qnWKdIOC2Q4kbghT0XQWyEGlZFIX7gx/7gXO+POTvl6kCWQZUhF1OJ1BPOZLn8uKJtXoA6kCQeq8qUgJ7F8TeTMHno6kfznxtO16M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197417; c=relaxed/simple;
	bh=pOMFQitSEGf+fgwVa18wEeXHCeOhAsoN0Xcf/CqaXxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWvJy1PqES0KHnGbE9yQHGv7J2jbeGuH5MLf43Y7tJASGQbLbvsqpAgLQ/M+yEPTgAEO0zUp65bDXvbIi0znYSn/b4/KzE8qfTihqOQfUNb2qRm7QvT4GVqtvinKybCvvTSfRyQ/P0FhOhKSxTjtGOWnVR8i9/npgwngy6zUw+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3JVKi7s; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3JVKi7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755197416; x=1786733416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOMFQitSEGf+fgwVa18wEeXHCeOhAsoN0Xcf/CqaXxI=;
  b=a3JVKi7scit0sardqFbPmnlVpg2wArjVDTWq9jfTTiO6BKzQsRNYKeon
   FLpDrvaMbyMZO5yeOz6vU8kaeb36EwlWpDa8NLdSI63uIEVBrSjS0w4th
   mOsHOzKLq7yDUvyeR1ewnSPI2eNi5Zeq3P/Ksu6sc/1qnyrLpyA9hnEkQ
   HFFpV+QkxU7Vk2c+jJFOjbVzdr0Ud84HghQp60FcHiMffwT1GTcl9HI1G
   AWM8a2looIsEaYezS5x11/nM5A9pPr2VzYhJDyZcu0zl0LUxntFBl2wHy
   JmEZ0rVkYppyksHMkPCjt0xjnBKaJo3RwnEiTa0yxm5SpFm1Cwqg5OOhd
   g==;
X-CSE-ConnectionGUID: sEbWmy+hQ0+7vrXiJWmRfg==
X-CSE-MsgGUID: bQutgc6uTbqf/UzzLDCzHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57388059"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57388059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:50:16 -0700
X-CSE-ConnectionGUID: NDvdW4meQJ23uxjm27m8Cw==
X-CSE-MsgGUID: AonkmeHsQ4G1j92yI9AOEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172060704"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2025 11:50:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umd1g-000BFo-0M;
	Thu, 14 Aug 2025 18:50:12 +0000
Date: Fri, 15 Aug 2025 02:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/sched/cpuacct.c:417:17:
 warning: no previous prototype for function 'bpf_task_ca_cpuusage'
Message-ID: <202508150236.ujeyp9cP-lkp@intel.com>
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
commit: 00c32c5569d488b6c90f1695175577e35c17c21c [2679/2679] bpf-rvi: cpuacct: Add bpf_task_ca_cpuusage() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150236.ujeyp9cP-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150236.ujeyp9cP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150236.ujeyp9cP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:61:
>> kernel/sched/cpuacct.c:417:17: warning: no previous prototype for function 'bpf_task_ca_cpuusage' [-Wmissing-prototypes]
     417 | __bpf_kfunc u64 bpf_task_ca_cpuusage(struct task_struct *p)
         |                 ^
   kernel/sched/cpuacct.c:417:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     417 | __bpf_kfunc u64 bpf_task_ca_cpuusage(struct task_struct *p)
         |             ^
         |             static 
   kernel/sched/cpuacct.c:424:18: warning: no previous prototype for function 'bpf_cpuacct_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     424 | __bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
         |                  ^
   kernel/sched/cpuacct.c:424:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     424 | __bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
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
   7 warnings generated.


vim +/bpf_task_ca_cpuusage +417 kernel/sched/cpuacct.c

   416	
 > 417	__bpf_kfunc u64 bpf_task_ca_cpuusage(struct task_struct *p)
   418	{
   419		if (!p)
   420			return 0;
   421		return cpuusage_read(task_css(p, cpuacct_cgrp_id), NULL);
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
