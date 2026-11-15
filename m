Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775788;
	b=kssEGskPDw1biJOVMcD9GCaZVbZ7g1yKKtXNfO54Gm2cGDfoliHyMiRl98Sd/z6OUpdD
	 Dl+ewyvDuFTqs3CVb0Slc19nALkBPDKeE0rngNppPpepzmAp9KAMWwzvLDwGMlugh3+fO
	 zChDclvbOtJsQLOSAoO+2BXNNRe7mhPkLqe49yEBZWD3/8mKETTe/yd/ims/nznfiiziF
	 +gf5qnh3aavRZNmXBAIBLfprv7caZpRrZN29SDU8fR+t6ON+x9TG9YCvramhDdqaq/GTj
	 jJcnnuyUa1Ne/TdfnfoPooi3j6Yy+t57Ds7YbodSZYtLjHOOLoNHoxucbUr8bOha9/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775788;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o/QnelTjcnJ5BmaNGZWETgk6zMxQfzirusqHGTZYuhE=;
	b=DuC3zJ91Yql4gItnU805xuylq1B4iHhPWPBfpjQYltnFjqH4gjSRt65Q1aLsehSN+zUB
	 dA9L6NE3RxKBLDDC7WkdZTlKgiqiCAmLNZZE0k3kmQk/J8lF3Bod80zW59oa6GlQ1xbHD
	 rMCBzMovURC5egmD0YwFb3PayJoXZ5vd3EfQq+xrjIhyBcOYF936EkSeZc4YYDgPEmNCD
	 DTMWErGHsQjUreDiubD+zH3XLPUS8kawUGvcy7XKc8QtV2b77MD4nC/FWFzfoZbMm3qEH
	 9BTc4HXg5K/tWeTlR77yJCwN0V0jA9OJDiESCzPa/DUiL3D5oYdvYVlUh3YnQVcyxng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SJg+JO5v;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357CE606A32F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 20:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357CE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SJg+JO5v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794775788; x=1826311788;
  h=date:from:to:cc:subject:message-id;
  bh=fS8K8cgmND7or2Vh9+fP+RDG3non54WkNCAsAY9fTU4=;
  b=SJg+JO5v0ae9XxsaaP3a+M5EjJqELdB+5Gh6SP5ygtTKXl27+qoVn+tc
   FtQiQGWRgNlFA/VPN/CY4TTpLFVUTcD9W7HNMUHxcuGPFE2pDtZ/lfEN7
   tGEdM245bHJ6DNeftQy0T97p5Bfg/f5JJm0D9u08+UEThXqHWB8amtUFL
   LgEO5hiQDbXAZ9KP6aU8M9iVQ2TfTYh9ySYEkilrDn/8YC75CG84/Vlxr
   vCTHBk3YMURP182hGJV7qWopCqK8gMCRi/EQRr8p0WQolnIsrwJcqrwov
   UAO439TlLAF8rd/Gk0d/B4ZBcwRvPfex5Chtgg+FXsB9Kg3xrghWz3l8f
   g==;
X-CSE-ConnectionGUID: kGHEm4e4Rp2x2h1AMNuUPw==
X-CSE-MsgGUID: jAMQ1NLIThezc61FhpBgxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3378648"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3378648"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 12:49:47 -0800
X-CSE-ConnectionGUID: XEEC6lVqS1umR5PG3wCUBQ==
X-CSE-MsgGUID: fycj/xp+S3ODLOA8xzXxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9187038"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Nov 2026 12:49:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xShAV-000000002Nl-2KbB;
	Sun, 15 Nov 2026 20:49:43 +0000
Date: Sun, 15 Nov 2026 21:48:53 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations-backup/20261106-fold 3/43]
 arch/x86/include/asm/nospec-branch.h:656:24: error: use of undeclared
 identifier '__KERNEL_DS'
Message-ID: <202611152131.FSoFPGIW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations-backup/20261106-fold
head:   f7a6ac447d4ea6d82d72db9b0502902d00e5be03
commit: 47f78e8bb6f2ae787e80bf2b64b3e17bd0e370ae [3/43] bpf: Let a callback unwind into the pad of its helper
config: um-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261115/202611152131.FSoFPGIW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project cbfac21cd384f6c7c480c2d0026ecedfe2d619e7)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152131.FSoFPGIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611152131.FSoFPGIW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:13:
   In file included from include/linux/bpf_unwind.h:55:
>> arch/x86/include/asm/nospec-branch.h:656:24: error: use of undeclared identifier '__KERNEL_DS'
     656 |         static const u16 ds = __KERNEL_DS;
         |                               ^~~~~~~~~~~
   1 error generated.


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
