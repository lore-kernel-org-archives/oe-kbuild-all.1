Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872306;
	b=XEaD4m6qsAyxLCeoWZarea3KY60vkDqiPe3KSU4yWocauM8gzkYoM1hPI0UxzjRqPSRv
	 GP7lJx4Sl4WBbnlUWe+ea/R2WOIF5ZVJ20BMQKvX0azYyXlrArJxiu2/gyyJ2wtiy9Zpu
	 MrJVzezlEBbw9zQovoyZ6YNfyRotR9piklp9MyVaLFDgvTHufpzi8ecWAgNR5t0q102Xg
	 c11sK1RcNbz/DQdAGlJ0XR3O5ej3yjL7eGbc2fpMoOINs8fuShZxG031LYSkT8AG1GbxK
	 7lAL3tAD2FSj1hQjcbEi40OC0g3wUeC9vRF+273ngt4ONwX4OBDY3d+b+WmzqnGTavQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872306;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=W1FQtgmymLvxVE7FZ+HdgA7AGGyc4eiuF4A0N6g8+Cg=;
	b=emmCSExRR1r9eMWLfm0gyPU72O58g8I1mDuuuliKT27b7clbPFiZZm7jh5FquCpYIENQ
	 2RHIiw0B2Iy0AV2hj7YwDVYwCvI7DGRU4VNyo1ced2NjGaU5rQUNieFj2VwBUdSg+1W4J
	 TdbteT4MdHcQ3F/3AqmHKKH/KiY7PwGzybKp088FkMXkDzzgN0JrnQHHgBHrB/u5N9IIE
	 bPN4sl7FVoNX7TWdku5sfgurCi/lvzJgEiloUOhrnecDQ7Wzzz+rAMCO7bkYe/BJrQG1m
	 +MGcnHtB9Kx2joWuOazK7UR/gXrYTGyh3T4IW9I7LAPBPNfc2xIW1DcCQrS6knHP23w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgMWsDqQ;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EED606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 23:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgMWsDqQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794872305; x=1826408305;
  h=date:from:to:cc:subject:message-id;
  bh=g95tvOLb6490pWMX4vXhEiwNZ7saT5CG/DRk+mO7ZPI=;
  b=MgMWsDqQbeKsOVO4CX0iaHkgmdhCpNrmWLZHooQJtGNBtT0o1iJbFSuh
   yma5tfJzcwv+dOWhB4fZ+g5lDdheJi+jufLrHH4pma0teqRijvMDvjqX4
   OUg7VDNtAS2blwoXUht/CYvl+I+ICCiXaER1e9nhIIMnMtZHjMkAnsl/g
   3+WsiQoIcF3xl1WaMfGivkbu3MTpCWkAwdX/uh7c1uZCCRRhNK6/DBpcb
   c72URB56FK0K34yAIIocvkrPr1Ipb9eZvQ1Vcr8m9/zM+0SEMf8M3r/5d
   9njdpCDHPnQocEam7Rsaa2oejPlAvpOc4LP1Y2VqoZ2KeIORm1aWHEtZK
   A==;
X-CSE-ConnectionGUID: MLVQqOdzSuqXh6bvLlOZ1Q==
X-CSE-MsgGUID: TTfrbgLOR/Ghji2R6zQRZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3660116"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3660116"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:38:21 -0800
X-CSE-ConnectionGUID: 7rrW+iOhR+2tHLpfb4aI0A==
X-CSE-MsgGUID: OFD3Z9jXTXSr5P/suwkebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9523187"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2026 15:38:13 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT6H5-000000019ci-0YsX;
	Mon, 16 Nov 2026 23:38:11 +0000
Date: Tue, 17 Nov 2026 07:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations-backup/scratch/guards-tested 3/51]
 arch/x86/include/asm/nospec-branch.h:656:31: error: '__KERNEL_DS' undeclared
Message-ID: <202611170726.Sw6EPtoN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations-backup/scratch/guards-tested
head:   67019855e76166974da23fb9e8c833b967bcc76a
commit: d6c820ed0315c90ec643c56fbf84d76d28ca9776 [3/51] bpf: Let a callback unwind into the pad of its helper
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20261117/202611170726.Sw6EPtoN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170726.Sw6EPtoN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170726.Sw6EPtoN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpf_unwind.h:55,
                    from kernel/bpf/verifier.c:13:
   arch/x86/include/asm/nospec-branch.h: In function 'x86_clear_cpu_buffers':
>> arch/x86/include/asm/nospec-branch.h:656:31: error: '__KERNEL_DS' undeclared (first use in this function)
     656 |         static const u16 ds = __KERNEL_DS;
         |                               ^~~~~~~~~~~
   arch/x86/include/asm/nospec-branch.h:656:31: note: each undeclared identifier is reported only once for each function it appears in


vim +/__KERNEL_DS +656 arch/x86/include/asm/nospec-branch.h

6a9e5292725177 Thomas Gleixner       2019-02-18  646  
6a9e5292725177 Thomas Gleixner       2019-02-18  647  /**
f9af88a3d384c8 Borislav Petkov (AMD  2024-09-11  648)  * x86_clear_cpu_buffers - Buffer clearing support for different x86 CPU vulns
6a9e5292725177 Thomas Gleixner       2019-02-18  649   *
6a9e5292725177 Thomas Gleixner       2019-02-18  650   * This uses the otherwise unused and obsolete VERW instruction in
6a9e5292725177 Thomas Gleixner       2019-02-18  651   * combination with microcode which triggers a CPU buffer flush when the
6a9e5292725177 Thomas Gleixner       2019-02-18  652   * instruction is executed.
6a9e5292725177 Thomas Gleixner       2019-02-18  653   */
f9af88a3d384c8 Borislav Petkov (AMD  2024-09-11  654) static __always_inline void x86_clear_cpu_buffers(void)
6a9e5292725177 Thomas Gleixner       2019-02-18  655  {
6a9e5292725177 Thomas Gleixner       2019-02-18 @656  	static const u16 ds = __KERNEL_DS;
6a9e5292725177 Thomas Gleixner       2019-02-18  657  
6a9e5292725177 Thomas Gleixner       2019-02-18  658  	/*
6a9e5292725177 Thomas Gleixner       2019-02-18  659  	 * Has to be the memory-operand variant because only that
6a9e5292725177 Thomas Gleixner       2019-02-18  660  	 * guarantees the CPU buffer flush functionality according to
6a9e5292725177 Thomas Gleixner       2019-02-18  661  	 * documentation. The register-operand variant does not.
6a9e5292725177 Thomas Gleixner       2019-02-18  662  	 * Works with any segment selector, but a valid writable
6a9e5292725177 Thomas Gleixner       2019-02-18  663  	 * data segment is the fastest variant.
6a9e5292725177 Thomas Gleixner       2019-02-18  664  	 *
6a9e5292725177 Thomas Gleixner       2019-02-18  665  	 * "cc" clobber is required because VERW modifies ZF.
6a9e5292725177 Thomas Gleixner       2019-02-18  666  	 */
6a9e5292725177 Thomas Gleixner       2019-02-18  667  	asm volatile("verw %[ds]" : : [ds] "m" (ds) : "cc");
6a9e5292725177 Thomas Gleixner       2019-02-18  668  }
6a9e5292725177 Thomas Gleixner       2019-02-18  669  

:::::: The code at line 656 was first introduced by commit
:::::: 6a9e529272517755904b7afa639f6db59ddb793e x86/speculation/mds: Add mds_clear_cpu_buffers()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
