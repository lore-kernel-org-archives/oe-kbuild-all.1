Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED25C4C9F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739090062; cv=none; b=jVPQEOEgUsOihATgd1pQjgFq96gTwEow6weCOTQX7iEGayasdmF7mriaKlfZE+heitvf28xttEBV0AUpMJ2omd8bzQuZwr4zQd8V3LK1nWnwMd28e78lIZKm43LA5lqBuDHw+awmcRP13odctvYc3rJQlGogAIkMRuA3sY1/aKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739090062; c=relaxed/simple;
	bh=ibaHzK2tbx2iJGOyQV2XNEGc6tn7nTXinzE1MQQjlWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pH9CgggxHndnDZhgRXFAETcQB+BoM1P19bC0zUbiV9WQLDe0ykDA03cZiahdmBRNjGBwsBWPuiGheZJzE2wDxCgnbfu3P+mmaSfVEbpMoE0gRTqShce5sI3MpKZUJmZuRELXz28DjzSwMGk+ZySy5Q+gPTNUylHYS5UqFM7I0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRBj7qcR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRBj7qcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739090060; x=1770626060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ibaHzK2tbx2iJGOyQV2XNEGc6tn7nTXinzE1MQQjlWM=;
  b=BRBj7qcR40UZ9CmzQHpU0X6Z/9Bj86ExpjLX7l5If08EQD70Yi2K45Hv
   BOOfMEEZ/7JhCilyoOsi2tvOGathZYoulOGsQIDxo5axHbxmzFRe079Vx
   MDzHXpAxg8+y22Q9RH4/MkmVfiY8XtcAXwPpw9PA4hu+emgpWTNXoRe+B
   tGZ//7x4ojfuX/fxCrkRnVJWbmjkSjpijzOPfqfAJNrLDD14/6l4vbk/k
   HK7PbP0hP6xxb0vmHGIc9fio0nqCd5H+1Ve8dk9t8PhAkuxz/ka0ya4w3
   EUo0vOaf0WyZ4mIUxMVsXhGXLbZsG79eUC6YNomFUNCBSQEHPtRBGjDzg
   g==;
X-CSE-ConnectionGUID: 0TG10h2eSH+z+gwKq4c+Mw==
X-CSE-MsgGUID: 8LwV1hY/TkKQ2HzQ+jW/Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43450306"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="43450306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 00:34:19 -0800
X-CSE-ConnectionGUID: 2Ca1a8J3TkGVnc+8jWzsWw==
X-CSE-MsgGUID: D+PZY/pKSm6Phyvis8/vmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116509792"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2025 00:34:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th2lc-0011GX-0d;
	Sun, 09 Feb 2025 08:34:16 +0000
Date: Sun, 9 Feb 2025 16:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 75/77]
 arch/riscv/kernel/unaligned_access_speed.c:198:39: error:
 'fast_misaligned_access' undeclared; did you mean
 'vector_misaligned_access'?
Message-ID: <202502091615.oPZdysXq-lkp@intel.com>
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
config: riscv-randconfig-002-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091615.oPZdysXq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091615.oPZdysXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091615.oPZdysXq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/unaligned_access_speed.c: In function 'set_unaligned_access_static_branches_except_cpu':
>> arch/riscv/kernel/unaligned_access_speed.c:198:39: error: 'fast_misaligned_access' undeclared (first use in this function); did you mean 'vector_misaligned_access'?
     198 |         cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       vector_misaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:198:39: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/kernel/unaligned_access_speed.c: In function 'set_unaligned_access_static_branches':
   arch/riscv/kernel/unaligned_access_speed.c:217:40: error: 'fast_misaligned_access' undeclared (first use in this function); did you mean 'vector_misaligned_access'?
     217 |         cpumask_and(&fast_and_online, &fast_misaligned_access, cpu_online_mask);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                        vector_misaligned_access


vim +198 arch/riscv/kernel/unaligned_access_speed.c

f413aae96cda059 Charlie Jenkins 2024-03-08  186  
f413aae96cda059 Charlie Jenkins 2024-03-08  187  static void set_unaligned_access_static_branches_except_cpu(int cpu)
f413aae96cda059 Charlie Jenkins 2024-03-08  188  {
f413aae96cda059 Charlie Jenkins 2024-03-08  189  	/*
f413aae96cda059 Charlie Jenkins 2024-03-08  190  	 * Same as set_unaligned_access_static_branches, except excludes the
f413aae96cda059 Charlie Jenkins 2024-03-08  191  	 * given CPU from the result. When a CPU is hotplugged into an offline
f413aae96cda059 Charlie Jenkins 2024-03-08  192  	 * state, this function is called before the CPU is set to offline in
f413aae96cda059 Charlie Jenkins 2024-03-08  193  	 * the cpumask, and thus the CPU needs to be explicitly excluded.
f413aae96cda059 Charlie Jenkins 2024-03-08  194  	 */
f413aae96cda059 Charlie Jenkins 2024-03-08  195  
f413aae96cda059 Charlie Jenkins 2024-03-08  196  	cpumask_t fast_except_me;
f413aae96cda059 Charlie Jenkins 2024-03-08  197  
f413aae96cda059 Charlie Jenkins 2024-03-08 @198  	cpumask_and(&fast_except_me, &fast_misaligned_access, cpu_online_mask);
f413aae96cda059 Charlie Jenkins 2024-03-08  199  	cpumask_clear_cpu(cpu, &fast_except_me);
f413aae96cda059 Charlie Jenkins 2024-03-08  200  
f413aae96cda059 Charlie Jenkins 2024-03-08  201  	modify_unaligned_access_branches(&fast_except_me, num_online_cpus() - 1);
f413aae96cda059 Charlie Jenkins 2024-03-08  202  }
f413aae96cda059 Charlie Jenkins 2024-03-08  203  

:::::: The code at line 198 was first introduced by commit
:::::: f413aae96cda059635910c462ede0a8f0385897c riscv: Set unaligned access speed at compile time

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
