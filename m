Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A72ECEA5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046333; cv=none; b=fDxIlFAvwUKZnKQh2ySwaVK8BFH5rUP8pSYShmwNqlWy8Esk+xJYDaeH+Ta1FcN+Yr16h+Q5+SyER8BPryaOjc8+SrH8sXvWQkyFeW2I8rYuHq7TRo3+tTq8rM4j+2AUj2IwwF0axWNO6eJXrxZDLK1nSxZW2Qy1Py56Kd0ZhOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046333; c=relaxed/simple;
	bh=x6BSiLMSOWE205oOK5lzCtkszZwKctq6LhN5caPtujI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cw2caEBa3xXw83Y5KseqjJ8md1YtksSaqAj/+8uC4NUysaCvTMOs9utdnA+xDs95T2vLEiOoHSPjcruLlqIfhoFPilt34/oYmnjecLPy3JKLB114d090EN4noUay1TUpB1BqUdHzQyzRp0xArnLd0fFYtZEMgx+aOzgaJS6knXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caQQtNfE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caQQtNfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778046333; x=1809582333;
  h=date:from:to:cc:subject:message-id;
  bh=x6BSiLMSOWE205oOK5lzCtkszZwKctq6LhN5caPtujI=;
  b=caQQtNfEkM16ZpFHLVrzkxng7msA9WsZWQ8lQIIcBc7oO/N2RU+U+zQx
   FCayZrbKgUDyLpiJksUtSkUHpchVZuDQzlxi5CwJMZt4gyErOJ0L+V7Uj
   SSGo1Y/0YvFftdF1kaKW57OUkknegGo7YpPjgaHeJkUlcg6ciOrPwr6RC
   kLHJPvA1C8TkhIFRtYgaDDNXH+PjfQzcWZO8GyA6een04aXXdbAILUT2R
   Onxl9m287BbjR2lVEebjNNLdUAfBCYmx8utEgd/TVoAdISGxK2Esr+KHM
   1uFRVe8ow2yrhWihlF7ScDfo0NtLVIancFIdqpOEvA80EkV9sZ2gFHZIo
   A==;
X-CSE-ConnectionGUID: gRhk4IdyRG+ajlHY7rJfmg==
X-CSE-MsgGUID: u1Sh9jLOSPG0xwZ+9CeX9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96363056"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="96363056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:45:31 -0700
X-CSE-ConnectionGUID: X+Ijo2GxTUqytrNRKAQvmQ==
X-CSE-MsgGUID: YCYLD5ZhTMm8ULRhu8Ra9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="231445366"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2026 22:45:29 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKV4Y-000000000jz-36o0;
	Wed, 06 May 2026 05:45:26 +0000
Date: Wed, 06 May 2026 13:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bibo Mao <maobibo@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/paravirt.c:15:1: sparse: sparse:
 symbol '__pcpu_scope_steal_time' was not declared. Should it be static?
Message-ID: <202605061313.O8Hswm2b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
commit: c43dce6f13fb12144571c168c7a593e5e546f3b5 LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than function
date:   4 weeks ago
config: loongarch-randconfig-r134-20260505 (https://download.01.org/0day-ci/archive/20260506/202605061313.O8Hswm2b-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061313.O8Hswm2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c43dce6f13fb ("LoongArch: KVM: Make vcpu_is_preempted() as a macro rather than function")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061313.O8Hswm2b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/paravirt.c:15:1: sparse: sparse: symbol '__pcpu_scope_steal_time' was not declared. Should it be static?
   arch/loongarch/kernel/paravirt.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/cpu-features.h, ...):
   /opt/cross/clang-5bac06718f/lib/clang/23/include/larchintrin.h:202:24: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   /opt/cross/clang-5bac06718f/lib/clang/23/include/larchintrin.h:202:11: sparse: sparse: cast from unknown type
   /opt/cross/clang-5bac06718f/lib/clang/23/include/larchintrin.h:202:11: sparse: sparse: cast from unknown type

vim +/__pcpu_scope_steal_time +15 arch/loongarch/kernel/paravirt.c

    11	
    12	static int has_steal_clock;
    13	DEFINE_STATIC_KEY_FALSE(virt_preempt_key);
    14	DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
  > 15	DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
