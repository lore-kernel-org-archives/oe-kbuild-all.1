Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75813E02D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 01:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755423; cv=none; b=kb+qQoEU6T7csWhqd61Pw6zfZhN6G7e1mO1diOqZWoxA5ni/ipNredMKXYayjFvVIRjvUVfHwqVo8p2vYH2AXiKh5l3OF3XiLsi0+SGqJ014YRWP/+YzjZBZ3hQ7afXVsdb+2PhQUdXnsm3j4lwzYh1pjqAff/SZXjDjeGXKiOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755423; c=relaxed/simple;
	bh=615gxOK4eZvUcM/aHjzAV0en7fgjvYMofnOXXp3IpdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ptKhwamwswzRRhrA05wjCsGdSV2cZEbuGBsn9YT92vU/OQyrI3CIy3Nrt21FIvIsn51tqQZ32UfitxRAhWL/Qj0H6IAgnFNBeR6QuD+WlMbb2NfzOKfzoGlOHslIk2TXMjQtOJy1RQGLlQuUT3hey+0bNPT1qE/WuvTFo8nZ8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYxkb6wf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYxkb6wf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746755422; x=1778291422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=615gxOK4eZvUcM/aHjzAV0en7fgjvYMofnOXXp3IpdM=;
  b=VYxkb6wfMVfNrgWkKrOS46Junay0R3Fr6WvXBGmTR3mSBVyfMn5jQftj
   DNAkyYBpFZchOArgdVyxTIDPFvXJacf2uibxL4kVh67C3QuefwmSehNAD
   nxJT3LPy71ccPYag4EckFJYp2z1yTlKgKM6rY2TzNc3K1ZLokXZIR46Hi
   dmNIbT6m2TyC6HTCMxi3CzrjTOa0xogFcsFbq4f7ZkxiVfVPRehHgo13T
   UKmisfe7CxEdAudt0dCh4DON/HxYg5ZWpg7LDVmfhDCSONcACh0W8qANX
   CNAwfRZOSFUqDIbyGCHalyLQdFYRsx65mlE/tcahUC5qUST//hilCsyG/
   w==;
X-CSE-ConnectionGUID: C720bf33SGaW63NXsfLzEw==
X-CSE-MsgGUID: Z6DSaGGvRfiXRWuw2w9YsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48724144"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48724144"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:50:08 -0700
X-CSE-ConnectionGUID: JS9SN/JHRA2cDS8FJjlq0Q==
X-CSE-MsgGUID: Wz/eYkYBTnSsu2ELpwz8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136406355"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 18:49:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDCrL-000BXv-0O;
	Fri, 09 May 2025 01:49:07 +0000
Date: Fri, 9 May 2025 09:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] kernel/sched/fair.c:1432:14: warning:
 no previous prototype for function 'bpf_should_numa_migrate'
Message-ID: <202505090957.gayLkt3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 8ab508cd4a0d43a39fb35ed59cc74b23bc2ec452 [0/1] bytedance: mm: numa-balance: Introduce new numa balance bpf hook
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505090957.gayLkt3v-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090957.gayLkt3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090957.gayLkt3v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:1432:14: warning: no previous prototype for function 'bpf_should_numa_migrate' [-Wmissing-prototypes]
    1432 | noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
         |              ^
   kernel/sched/fair.c:1432:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1432 | noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
         |          ^
         |          static 
>> kernel/sched/fair.c:2138:14: warning: no previous prototype for function 'bpf_disable_migrate_preferred' [-Wmissing-prototypes]
    2138 | noinline int bpf_disable_migrate_preferred(struct task_struct *p)
         |              ^
   kernel/sched/fair.c:2138:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2138 | noinline int bpf_disable_migrate_preferred(struct task_struct *p)
         |          ^
         |          static 
   kernel/sched/fair.c:11451:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
    11451 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          |      ^
   kernel/sched/fair.c:11451:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11451 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          | ^
          | static 
   3 warnings generated.


vim +/bpf_should_numa_migrate +1432 kernel/sched/fair.c

  1431	
> 1432	noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
  1433	{
  1434		return BPF_MIGRATE_DEFAULT;
  1435	}
  1436	ALLOW_ERROR_INJECTION(bpf_should_numa_migrate, ERRNO);
  1437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
