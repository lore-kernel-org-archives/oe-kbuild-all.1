Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751477;
	b=xDnkhC9fbWy4aHw+HKJ+lGA4BKj1ISDeMSieCAEleGmHIsj+zHFVQRg34VTNiSZ4a6nP
	 RGgI/UQeFpdnOCZ2oK9PRZHr3H5ztbJ5SBrZGzOTlO1Wb9Zr1AsbUOs/jZAy8lS7Fjnol
	 ps4PB0TH+Li5okgI3f0aHIaq46vNcVpwvH3nPoXGLVZt8UzMFmi/F3M38qYgfyNciGfpA
	 ouzjycSlMCTJrOt6+qP914INwcN1b4ix05wxy2OsSWlw2jvsCxDxCoQlhuGaf2EpdBOvJ
	 MLEZBrdinv1vKB1aXFbPX7cJev3/iopkq94NWmQYH/T3R5uKCDLQMTPgWKhQJHt4qRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751477;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k6dpWs1PtQKTed7IpDPFiTXderCVMCwma65JNEfLhfc=;
	b=DmHp2/eY1t1A2bg/uobRgmGdskZ7b+pyO1kLoZCq6aS7MT6kLRw3DNYxE7+SHgBEa0lA
	 pe2KyMz2x8Quu2u1R9xZ6cEYXaBBMhMgK5Wf1FSk6BoGIzGplvaLGBvZ0+u6Smz1yYt5p
	 6DsOJMtx/wJ56p9dHV6/W2zioTrM9PBvS1LMkdfxuoBznYX98oyPuIx6jz84z/Du2Bytc
	 IlD4x45ExrVSi0A4TVF4c9wn8eacHwNkggZTZIypXVGr0HZJWu2vUKchdKWtQHC8a+itC
	 btW799a2hoqFa9P2GoHdXMG41aIdqsjV9uypzN18tad08eP5w3NIcTa3g2z4Riy8HSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qhc574s7;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808FE606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 00:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qhc574s7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793751475; x=1825287475;
  h=date:from:to:cc:subject:message-id;
  bh=HOjevSb1xATqZNvUheUBy0C0zPAEiIX+IxeRumgzfo8=;
  b=Qhc574s74UkvNHjofjSxD87781saCXcmZgvQvmQcqjAqbtoDL2eWIZI5
   G7E1GBV5ziQbh+vEZM3uXKwP2b5hjf8kztwMhGarpyMTVnaMOiNSLZJyC
   +KS8Bo6r4MS2NaLWnQ+ZIHK1vcPT9auuy6ub9cQvpnU/tgiSZetv29npH
   W3QUsopv9nsWdGC2GCrx+nx6E1dP/oKiCey4YMWIpxBrRXl5sW+nXAHRI
   I70OOfrUmcRmprFtjbqGXfhG4pf/MBOzU+YVPxQwL6AXH4T4eOcjTCYvL
   BZXFEsJn5Wi0Y4E7rtbXedsjrHaSl6NpqdUJR4lDUkBzcm2nlJ7iFu29y
   Q==;
X-CSE-ConnectionGUID: 0SBk0ycrQtKMSaScCypSBQ==
X-CSE-MsgGUID: viyqN9LCT1OVtcFZmWiKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2376340"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2376340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 16:17:55 -0800
X-CSE-ConnectionGUID: RlsQSWJ9S+yX6kME1LSDqw==
X-CSE-MsgGUID: wQcXixYQSCuJ+mlwwflPUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7116558"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 16:17:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOOhL-00000000jWT-0ovB;
	Wed, 04 Nov 2026 00:17:51 +0000
Date: Wed, 04 Nov 2026 08:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:unwind-cb 4/12]
 arch/x86/include/asm/nospec-branch.h:656:24: error: use of undeclared
 identifier '__KERNEL_DS'
Message-ID: <202611040715.b9kqYmIn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux unwind-cb
head:   af3bc9f217a6b30a55a3f3de352eaac424b2f087
commit: 8e4203c7e99a0ccfdd78656e69fdf08c7828f735 [4/12] bpf: Let a callback unwind into the pad of its helper
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261104/202611040715.b9kqYmIn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040715.b9kqYmIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040715.b9kqYmIn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:34:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/bpf/verifier.c:13:
   In file included from include/linux/bpf_unwind.h:55:
>> arch/x86/include/asm/nospec-branch.h:656:24: error: use of undeclared identifier '__KERNEL_DS'
     656 |         static const u16 ds = __KERNEL_DS;
         |                               ^
   1 warning and 1 error generated.


vim +/__KERNEL_DS +656 arch/x86/include/asm/nospec-branch.h

6a9e52927251775 Thomas Gleixner       2019-02-18  646  
6a9e52927251775 Thomas Gleixner       2019-02-18  647  /**
f9af88a3d384c8b Borislav Petkov (AMD  2024-09-11  648)  * x86_clear_cpu_buffers - Buffer clearing support for different x86 CPU vulns
6a9e52927251775 Thomas Gleixner       2019-02-18  649   *
6a9e52927251775 Thomas Gleixner       2019-02-18  650   * This uses the otherwise unused and obsolete VERW instruction in
6a9e52927251775 Thomas Gleixner       2019-02-18  651   * combination with microcode which triggers a CPU buffer flush when the
6a9e52927251775 Thomas Gleixner       2019-02-18  652   * instruction is executed.
6a9e52927251775 Thomas Gleixner       2019-02-18  653   */
f9af88a3d384c8b Borislav Petkov (AMD  2024-09-11  654) static __always_inline void x86_clear_cpu_buffers(void)
6a9e52927251775 Thomas Gleixner       2019-02-18  655  {
6a9e52927251775 Thomas Gleixner       2019-02-18 @656  	static const u16 ds = __KERNEL_DS;
6a9e52927251775 Thomas Gleixner       2019-02-18  657  
6a9e52927251775 Thomas Gleixner       2019-02-18  658  	/*
6a9e52927251775 Thomas Gleixner       2019-02-18  659  	 * Has to be the memory-operand variant because only that
6a9e52927251775 Thomas Gleixner       2019-02-18  660  	 * guarantees the CPU buffer flush functionality according to
6a9e52927251775 Thomas Gleixner       2019-02-18  661  	 * documentation. The register-operand variant does not.
6a9e52927251775 Thomas Gleixner       2019-02-18  662  	 * Works with any segment selector, but a valid writable
6a9e52927251775 Thomas Gleixner       2019-02-18  663  	 * data segment is the fastest variant.
6a9e52927251775 Thomas Gleixner       2019-02-18  664  	 *
6a9e52927251775 Thomas Gleixner       2019-02-18  665  	 * "cc" clobber is required because VERW modifies ZF.
6a9e52927251775 Thomas Gleixner       2019-02-18  666  	 */
6a9e52927251775 Thomas Gleixner       2019-02-18  667  	asm volatile("verw %[ds]" : : [ds] "m" (ds) : "cc");
6a9e52927251775 Thomas Gleixner       2019-02-18  668  }
6a9e52927251775 Thomas Gleixner       2019-02-18  669  

:::::: The code at line 656 was first introduced by commit
:::::: 6a9e529272517755904b7afa639f6db59ddb793e x86/speculation/mds: Add mds_clear_cpu_buffers()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
