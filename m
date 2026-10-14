Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BC214A9B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 22:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018086; cv=none; b=B1X3TDWqNJ7UORLlULnYLLK/p5BSmBJXFBcdCjK4pKa1s7DL5NC0crqTrMMtLnwOll01C1UpFKoS62OtKPU8EVLhAcxmuo61lSHAgQVMHRYMmXoRBj1ZesLiBh4z+Jy/Wvy6jT2zbZZXTNdP8DwWuhrl/VQr39cRs3fE0njKkqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018086; c=relaxed/simple;
	bh=AhpxJk0yGRRwU2BmWDf/JbiFX5SaWcYeoCEKynmfGSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O1ga9m78K2TXOvhdFSrFy/3rhwdGRGL32JDCF8r2bxaLQ8TjjtuR1pyfTTDponHHCTxqay3u3f+TCZcTHnhOStPRXAfLvRjfWjtF4mRB0PW6Z5F9zPdjqSmXXXujgQ1K7Pkz50joOF+tc3zblu+8o+TbyMPrdgIwyzw1kXcnj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyO8MYpB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyO8MYpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792018086; x=1823554086;
  h=date:from:to:cc:subject:message-id;
  bh=AhpxJk0yGRRwU2BmWDf/JbiFX5SaWcYeoCEKynmfGSM=;
  b=fyO8MYpBcxM9cHFYFSrmCYcSbW6b/UcEAAsg3b8SMWeFB5uDSQrrdwzO
   jx2mqDMA5VcjVUqnUeZ8SrX9qwuoe09lVJb5uiQ7LRyyiL78wJyvuYQcy
   YlLCquEpoOL81XxaPTPUcMnQw8d8jfkP+9qX29i6XkHKS6UEq4wRz7N/T
   xMoPsLrAlHOTSQ0VIPkiO313AVUxLjfOw0QCKyJghM2i92TLRWZW7JTo9
   eJ/+Mdt4a+J9C4tyiLa5WBUOnmJ87tIU32Cpvg5BVgP6gXM91j4SrC4dp
   Og6Z3bYXwbEEgHPhV3LXRp/CbeOHRht9dROayFhi+bIrWqnY8blwvV5Mt
   Q==;
X-CSE-ConnectionGUID: 5dkdLmoqTdWWTn2X09CoIg==
X-CSE-MsgGUID: 9jJrjbNxRsWCMJEjCfUuXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="655633"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="655633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 15:48:05 -0700
X-CSE-ConnectionGUID: hM5lr8ujQ62E6m9VSbVSPw==
X-CSE-MsgGUID: PwXbTOoJQO6szDVYtlVdkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1507369"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2026 15:48:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH7lR-00000000FIx-2fB5;
	Wed, 14 Oct 2026 22:48:01 +0000
Date: Thu, 15 Oct 2026 06:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:spinwait-will2fix 5/10]
 arch/arm64/kernel/kexec-spinwait-blob.S:81: Error: unknown or missing system
 register name at operand 2 -- `mrs x12,id_aa64mmfr3_el1'
Message-ID: <202610150646.cOcWGIET-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux spinwait-will2fix
head:   6168c3fb6d138a1d9c76f689120ece00dad14ad7
commit: e67cecaa9d0018427841299ef21aeabfb6be17d3 [5/10] arm64: kexec: support spinwait parking and adoption
config: arm64-randconfig-1002-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150646.cOcWGIET-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150646.cOcWGIET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150646.cOcWGIET-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/kexec-spinwait-blob.S: Assembler messages:
>> arch/arm64/kernel/kexec-spinwait-blob.S:81: Error: unknown or missing system register name at operand 2 -- `mrs x12,id_aa64mmfr3_el1'


vim +81 arch/arm64/kernel/kexec-spinwait-blob.S

    47	
    48		.section .rodata
    49		.balign	PAGE_SIZE
    50		.globl	arch_kexec_spinwait_blob_start
    51	arch_kexec_spinwait_blob_start:
    52		mov	x19, x0				/* slot PA */
    53		mov	x20, x1				/* hdr PA */
    54		mov	x21, xzr			/* MMU state */
    55	
    56		adr	x9, 77f				/* crash vectors */
    57		msr	vbar_el1, x9
    58		isb
    59	
    60		/*
    61		 * If the header carries an identity map, park with the MMU and
    62		 * caches on: parked CPUs then wait as ordinary cacheable,
    63		 * coherent, promptly-DVM-responding citizens.  (MMU-off waiters
    64		 * cost the incoming kernel ~200ms of paging_init() on some
    65		 * implementations, where broadcast TLBI + DSB ISH completion
    66		 * slows against PEs sitting in WFE with the MMU off.)
    67		 */
    68		ldr	x9, [x20, #HDR_TTBR]
    69		cbz	x9, 5f
    70		ldr	x10, [x20, #HDR_TCR]
    71		ldr	x11, [x20, #HDR_MAIR]
    72		msr	mair_el1, x11
    73		msr	tcr_el1, x10
    74		msr	ttbr0_el1, x9
    75		/*
    76		 * The kernel may have been running with FEAT_S1PIE/POE enabled
    77		 * in TCR2_EL1, which would reinterpret this regime's direct AP
    78		 * bits as permission-indirection indices: reset TCR2 when it is
    79		 * implemented (ID_AA64MMFR3_EL1.TCRX).
    80		 */
  > 81		mrs	x12, id_aa64mmfr3_el1
    82		tst	x12, #0xf
    83		b.eq	4f
    84		msr	REG_TCR2_EL1, xzr
    85	4:	isb
    86		tlbi	vmalle1
    87		dsb	nsh
    88		ic	iallu
    89		dsb	nsh
    90		isb
    91		mrs	x9, sctlr_el1
    92		orr	x9, x9, #SCTLR_ELx_M
    93		orr	x9, x9, #SCTLR_ELx_C
    94		orr	x9, x9, #SCTLR_ELx_I
    95		msr	sctlr_el1, x9
    96		isb
    97		mov	x21, #1
    98	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
