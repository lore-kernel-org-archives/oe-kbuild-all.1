Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD53F137775
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739132498; cv=none; b=AB4X931pmv86suhMo2Y5u/OXh2pvRMuhYDYsOC5bBhH5UGlYlqxaiVZeQYWQZ/xWZpaQM3qgn1ONkhAM8Y4rD8T0seY9AYunMrNdqrrSHaVqQybxDq7+g9kMs8qVZGszCki0/EU0f95G462UqAjjw0yZ9GVKZuSb3A6h/uLyW0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739132498; c=relaxed/simple;
	bh=DUngWuj4cK4EvMOEWRBw1J6QYkHYsx+whAHN01Gmb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSrMMY4J57HbTyUyaSB4eRfhrrsJ1FNhNuh0SiaEnGOtXnleiulmNMZbiuv45rASbxC2NnCOixZVvUngjIP66aaUCAYKtygOAEsLB8+9VuWpYrIRU0ggxq1YwGSKhAYJq6Ot1WXb43KUErAMdDBag9lfMnes9HQQBsXK8r/KwBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EG7+8nus; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EG7+8nus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739132497; x=1770668497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUngWuj4cK4EvMOEWRBw1J6QYkHYsx+whAHN01Gmb9c=;
  b=EG7+8nustNxDwTBahdP6Kbv7WJOOBM9uCY7eaeTW/amobKcS8+GalpCl
   368cV3N6Rl1p/YD5yZffGOYkM3nXZSgORBAUrJDHyt4PMXQ9JXm6/otp2
   mDlyzMDNfkh67KgWKij9eFq18TT0Rq8V2j6Lkt3QBTW0BQA7MVd/gy3ku
   AZDPiCrM9985aBFQBrix1CCYaxFv95neRN8YwvUFdg9TGtFQcH2wuJLir
   iDWGmytSTWT5OVCYQd7h4YzB83Z0Zt/NrdAwcYWsN2qSgx339kNGWgFCO
   +OpFqzMhDwVxp7ArKBKKTvL/OVmNK3QYJZvX0tJbsYVkIT17QJZ6ILICz
   Q==;
X-CSE-ConnectionGUID: rfAwHLWwQ4yhx152ZQw2hA==
X-CSE-MsgGUID: jl44HPRARAagXmUtnVERAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="38910587"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="38910587"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 12:21:36 -0800
X-CSE-ConnectionGUID: FlgVD354QxO/prDjAhCbBQ==
X-CSE-MsgGUID: MCTGwRNyT4KA57UzN5dckA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="111936483"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2025 12:21:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thDo5-0011s7-0I;
	Sun, 09 Feb 2025 20:21:33 +0000
Date: Mon, 10 Feb 2025 04:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 75/77]
 arch/riscv/kernel/unaligned_access_speed.c:198:32: error: use of undeclared
 identifier 'fast_misaligned_access'; did you mean
 'vector_misaligned_access'?
Message-ID: <202502100452.Dzilsy6z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   aa50b53026d20b9d37c6d17a3cf2f42e65a2a636
commit: 48a98b4fd16db3e47ba4de51cdc1ccf7965ee074 [75/77] riscv: Prepare for unaligned access type table lookups
config: riscv-randconfig-r064-20250209 (https://download.01.org/0day-ci/archive/20250210/202502100452.Dzilsy6z-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100452.Dzilsy6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100452.Dzilsy6z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/unaligned_access_speed.c:198:32: error: use of undeclared identifier 'fast_misaligned_access'; did you mean 'vector_misaligned_access'?
     198 |         cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       vector_misaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:25:22: note: 'vector_misaligned_access' declared here
      25 | DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
         |                      ^
   arch/riscv/kernel/unaligned_access_speed.c:217:33: error: use of undeclared identifier 'fast_misaligned_access'; did you mean 'vector_misaligned_access'?
     217 |         cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                        vector_misaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:25:22: note: 'vector_misaligned_access' declared here
      25 | DEFINE_PER_CPU(long, vector_misaligned_access) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
         |                      ^
   2 errors generated.


vim +198 arch/riscv/kernel/unaligned_access_speed.c

f413aae96cda05 Charlie Jenkins 2024-03-08  186  
f413aae96cda05 Charlie Jenkins 2024-03-08  187  static void set_unaligned_access_static_branches_except_cpu(int cpu)
f413aae96cda05 Charlie Jenkins 2024-03-08  188  {
f413aae96cda05 Charlie Jenkins 2024-03-08  189  	/*
f413aae96cda05 Charlie Jenkins 2024-03-08  190  	 * Same as set_unaligned_access_static_branches, except excludes the
f413aae96cda05 Charlie Jenkins 2024-03-08  191  	 * given CPU from the result. When a CPU is hotplugged into an offline
f413aae96cda05 Charlie Jenkins 2024-03-08  192  	 * state, this function is called before the CPU is set to offline in
f413aae96cda05 Charlie Jenkins 2024-03-08  193  	 * the cpumask, and thus the CPU needs to be explicitly excluded.
f413aae96cda05 Charlie Jenkins 2024-03-08  194  	 */
f413aae96cda05 Charlie Jenkins 2024-03-08  195  
f413aae96cda05 Charlie Jenkins 2024-03-08  196  	cpumask_t fast_except_me;
f413aae96cda05 Charlie Jenkins 2024-03-08  197  
f413aae96cda05 Charlie Jenkins 2024-03-08 @198  	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
f413aae96cda05 Charlie Jenkins 2024-03-08  199  	cpumask_clear_cpu(cpu, &fast_except_me);
f413aae96cda05 Charlie Jenkins 2024-03-08  200  
f413aae96cda05 Charlie Jenkins 2024-03-08  201  	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
f413aae96cda05 Charlie Jenkins 2024-03-08  202  }
f413aae96cda05 Charlie Jenkins 2024-03-08  203  

:::::: The code at line 198 was first introduced by commit
:::::: f413aae96cda059635910c462ede0a8f0385897c riscv: Set unaligned access speed at compile time

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
