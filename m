Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463291F0E57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003623; cv=none; b=ryIDClR8Rx1qn7RlgE++BHYGMj1z/ZlnJOERpv5cheilrMCEyECyR2VWSUSNMgk9A+lxUi8Larbts077ZP23lwrqqFCchlizxT4f5tM+iQq7Hiz7biQb53APC5BhFmncxo8gQQH+/pPnxw26Q/ZUCtM1G+veJk/WVN8HhX/jyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003623; c=relaxed/simple;
	bh=XjqHQs+p1Dkl0oH6oP8bEtZ61qp6kN7gcB/dy5n8kRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lkciQE5JkUdNHR0WLdiXwkW8swyDfVYxVlwJJIT18hHknYUYSp1/WO/+uh0f3vRH9HXvs5MkH8ypCJHLrxVU1+dNmHu/QT99wJLQK4DwsvP9+Cgt9em0qWNLs09kDmYEDeBAOJ9PEmH0NNtH3MY7X+LLUyvh2a/VB5/G4LPiJ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGSqEEV3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGSqEEV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734003622; x=1765539622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjqHQs+p1Dkl0oH6oP8bEtZ61qp6kN7gcB/dy5n8kRg=;
  b=bGSqEEV3YIGcO38BY12s6KdUpSy0pezRK8opOVqVTFFbRTs1c7sAOIYz
   5CpgjMwyZQc0DcIIAUPryFZnoMFyGtl32N1+sO7guffxkm2h2x42+/l2Q
   zFlVZVe91Fdh77x86L477G1uriZ35kBSBdoXSPpqQOFGWQSBOwsM2gpKH
   41Gi/4IO1HwOu/0HfQ09ay0DGey2bJwzqJ1u0OMmZRbJuHsCaQCfYV8tx
   MdP5mdtXLI8/665iQx1JWTZVnSGe2XjL+KY/J0p5simlIoxcvi+euAfHm
   UsIZHhNuTlrH0LIYm3FpzSAKY8uidUj8G0rUqRWNOWxER8aDD9Lb3hHMo
   Q==;
X-CSE-ConnectionGUID: DN/rXIDSSvm6SFUled76Uw==
X-CSE-MsgGUID: VAGCcbZYQjKDyNeqcXwFTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45800511"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45800511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 03:40:21 -0800
X-CSE-ConnectionGUID: mS2/xoOlSJ+TQEFWva6Mqg==
X-CSE-MsgGUID: KAyqp5xNSkiqTuR60wCOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96046192"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2024 03:40:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLhYH-0007ml-1G;
	Thu, 12 Dec 2024 11:40:17 +0000
Date: Thu, 12 Dec 2024 19:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11009/30000]
 kernel/sched/stubs.c:8:5: warning: no previous prototype for function
 'sched_isolate_cpu'
Message-ID: <202412121906.nSQrei7t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: eead51495c8760858c32d9ad0332ffc94397aa82 [11009/30000] ANDROID: GKI: sched: stub sched_isolate symbols
config: x86_64-buildonly-randconfig-004-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121906.nSQrei7t-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121906.nSQrei7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121906.nSQrei7t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/stubs.c:8:5: warning: no previous prototype for function 'sched_isolate_cpu' [-Wmissing-prototypes]
       8 | int sched_isolate_cpu(int cpu)
         |     ^
   kernel/sched/stubs.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       8 | int sched_isolate_cpu(int cpu)
         | ^
         | static 
>> kernel/sched/stubs.c:14:5: warning: no previous prototype for function 'sched_unisolate_cpu_unlocked' [-Wmissing-prototypes]
      14 | int sched_unisolate_cpu_unlocked(int cpu)
         |     ^
   kernel/sched/stubs.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | int sched_unisolate_cpu_unlocked(int cpu)
         | ^
         | static 
>> kernel/sched/stubs.c:20:5: warning: no previous prototype for function 'sched_unisolate_cpu' [-Wmissing-prototypes]
      20 | int sched_unisolate_cpu(int cpu)
         |     ^
   kernel/sched/stubs.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      20 | int sched_unisolate_cpu(int cpu)
         | ^
         | static 
>> kernel/sched/stubs.c:26:5: warning: no previous prototype for function 'set_task_boost' [-Wmissing-prototypes]
      26 | int set_task_boost(int boost, u64 period)
         |     ^
   kernel/sched/stubs.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      26 | int set_task_boost(int boost, u64 period)
         | ^
         | static 
   4 warnings generated.


vim +/sched_isolate_cpu +8 kernel/sched/stubs.c

     7	
   > 8	int sched_isolate_cpu(int cpu)
     9	{
    10		return -EINVAL;
    11	}
    12	EXPORT_SYMBOL_GPL(sched_isolate_cpu);
    13	
  > 14	int sched_unisolate_cpu_unlocked(int cpu)
    15	{
    16		return -EINVAL;
    17	}
    18	EXPORT_SYMBOL_GPL(sched_unisolate_cpu_unlocked);
    19	
  > 20	int sched_unisolate_cpu(int cpu)
    21	{
    22		return -EINVAL;
    23	}
    24	EXPORT_SYMBOL_GPL(sched_unisolate_cpu);
    25	
  > 26	int set_task_boost(int boost, u64 period)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
