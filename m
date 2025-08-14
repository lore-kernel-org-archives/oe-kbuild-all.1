Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F35C31986E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755201809; cv=none; b=IOTt/EGLPmfIKK3W+E9FwRQLCSGdTVdnArWS3cYUMXUVenpqt6rWoagSQV8kJMMC3S8A4Vaotk7LJiZZAHIAM8EzZUsd5gcvT+BNB3+DMced3Nk8d3PVJEqVVqHG4ekTfUrDkqzOP0x8Rf/Cjos9vQv7cwdjm03RZrMDZo1maKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755201809; c=relaxed/simple;
	bh=3vDDYGLF3eaK3C2kypfHvFqA/kvACD6C3V8+/P6NHCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NP+jYcQIFDFqOMsRWh6kTPpJCbpFbq5PfNtOpLNrbNIBBJnnzi/rZJPPPOzHuGNHVKq6bbQ13QAZxfdox7u1uV0AM9crIFWamT/QLWpt2FIw6ojKrO1ryldGwFz8CF42NcXDVhJTybTePoEiObxcWPV2zTTwHDxD2YecJb32wjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYokDvYy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYokDvYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755201807; x=1786737807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vDDYGLF3eaK3C2kypfHvFqA/kvACD6C3V8+/P6NHCQ=;
  b=LYokDvYy35sGRKFJm7z2UlD/xmCZG70vKECiOOgqYsibJXn0Y0PJsbLm
   /k3Q7cZxqRJQJb13013en8J5m6A12uqN8c874OojBYWnnqtsGNuRvyQAR
   SJd00NmVx6AyJIdEi+4spNtlB2kYtDGAQHgNoScBhur9NQPaVLQkQFX9N
   ygSpxSL2ZMP+mpJNuzykVvmpH5P69obPEteTv2Ey+U2zDKIXjMgo+i0Yw
   LvIwsCIpthpkKCwPpMDaLZehy4Peu+pA83EgJUZqbHSycGiltb9keMqNJ
   3Hq1OKoIZYbgLuqdtoh9gsdDNRAIA0QKylr0iozu4g37lfi6+aVYBcPTM
   w==;
X-CSE-ConnectionGUID: NnxUIV3ORB2CEeQzMy1vkg==
X-CSE-MsgGUID: 6pxnH4I/S9qh8FCqcpAs+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68134897"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68134897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 13:03:27 -0700
X-CSE-ConnectionGUID: k/l1znt+SiKSBll58bI0Kg==
X-CSE-MsgGUID: L+GJoIyZRCWzwZOZEG3cHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171305829"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2025 13:03:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umeAU-000BI4-31;
	Thu, 14 Aug 2025 20:03:22 +0000
Date: Fri, 15 Aug 2025 04:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:75:18:
 warning: no previous prototype for function 'bpf_si_memswinfo'
Message-ID: <202508150337.G6kzMMhf-lkp@intel.com>
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
commit: b3aa368c1f9f8f3acee4703cfebb30e7a909df9f [2679/2679] bpf-rvi: Add bpf_si_memswinfo() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150337.G6kzMMhf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150337.G6kzMMhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150337.G6kzMMhf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:18:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      18 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:18:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      18 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:27:35: warning: no previous prototype for function 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      27 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^
   kernel/bpf-rvi/common_kfuncs.c:27:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      27 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:32:17: warning: no previous prototype for function 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      32 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:32:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:46:17: warning: no previous prototype for function 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      46 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:46:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:75:18: warning: no previous prototype for function 'bpf_si_memswinfo' [-Wmissing-prototypes]
      75 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:75:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      75 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |             ^
         |             static 
   5 warnings generated.


vim +/bpf_si_memswinfo +75 kernel/bpf-rvi/common_kfuncs.c

    74	
  > 75	__bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
    76	{
    77		struct sysinfo *si = (struct sysinfo *)bsi;
    78	
    79		if (si) {
    80			si_meminfo(si);
    81			si_swapinfo(si);
    82		}
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
