Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C53193420
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223316; cv=none; b=DWtv9QXHMkzm7L9KCHBOKXM01uPw6drjWT7jGei8s+25T8qaYa3fcID5VUu/+/8sZz/SzwqbF7e2vuwbXlgLFAPx3qYfqRJEXQIYzAKe3IUfv8SgDmU8kNsObJqLToso+0s+jszfPipQZ9oJ6UtNIfOwm41LuACnMM6D4Mz2sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223316; c=relaxed/simple;
	bh=suKQ1NUlJfDSGqq+pUBbjjSqLn0JoDRwn239T3HeKE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ldfkxgw10ZctRiFLBubzZ5f9DXZjh+wtv8oz5c5k/GCKXlkCE0D95UhI8v5RzVi8way0UDeIeB8pGmRvUH61dvnY3GqvwQDrkQlpjDi5SmvUpyQiDJakvtRLh3en2ueXM5uJTrVIzVqDWss3BQH3YThpeUf34PY3nSaASuYW2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTozSe4N; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTozSe4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724223315; x=1755759315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=suKQ1NUlJfDSGqq+pUBbjjSqLn0JoDRwn239T3HeKE8=;
  b=QTozSe4NGwUw+kH6rDbGVTdlGoLpiboqryvci8PbTfRRzUecZ+C1RIvp
   AbP9ubzA0sRP8u/yvVcbrXmzJk7mebfqKaTJpjazwRvC4xdCVrV3ywoo0
   O3KDdYBeraii+ZUbvxb0JqqZp2gPhV0k2ujEazNngjQ6SZX29jIuKs7ZS
   VAu8s+eByZWuyS2wW41q3Ijxzt7+mZ1+binKDMa6g2L2b/JJcy7rPhy32
   9/O90zDidsfrNRgkD2+0e2JPapE6On2cCG48CgBQarCvCS93ZO3JVL2pK
   /rF3pa0bUOcMC68Z3Gx8oN7NY0CQLLw6NvS2xxyYW5+qkMF81yynAZQuA
   w==;
X-CSE-ConnectionGUID: OxdGEzKPR1eT4gkDSrgARA==
X-CSE-MsgGUID: lGtCHBbqQ9Ozb5oS/LaByQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22704789"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22704789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 23:55:12 -0700
X-CSE-ConnectionGUID: KH8yivLHQVSXtiABUHR6tA==
X-CSE-MsgGUID: t4roklbHQHC8JP/P7Fkbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65870835"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Aug 2024 23:55:12 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgfFN-000B03-0J;
	Wed, 21 Aug 2024 06:55:09 +0000
Date: Wed, 21 Aug 2024 14:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk:for-next 1/2] arch/arm/kernel/entry-armv.S:1074: Error: junk at
 end of line, first unrecognized character is `('
Message-ID: <202408211456.Lf3uJouJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git for-next
head:   2ba94d53af55eff22021d9d6c9db02bc7fba5029
commit: 471fc0d32ab5095d941634de2bb1a7672048557f [1/2] ARM: 9413/1: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION
config: arm-randconfig-002-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211456.Lf3uJouJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211456.Lf3uJouJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211456.Lf3uJouJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/entry-armv.S: Assembler messages:
>> arch/arm/kernel/entry-armv.S:1074: Error: junk at end of line, first unrecognized character is `('


vim +1074 arch/arm/kernel/entry-armv.S

   934	
   935	vector_rst:
   936	 ARM(	swi	SYS_ERROR0	)
   937	 THUMB(	svc	#0		)
   938	 THUMB(	nop			)
   939		b	vector_und
   940	
   941	/*
   942	 * Interrupt dispatcher
   943	 */
   944		vector_stub	irq, IRQ_MODE, 4
   945	
   946		.long	__irq_usr			@  0  (USR_26 / USR_32)
   947		.long	__irq_invalid			@  1  (FIQ_26 / FIQ_32)
   948		.long	__irq_invalid			@  2  (IRQ_26 / IRQ_32)
   949		.long	__irq_svc			@  3  (SVC_26 / SVC_32)
   950		.long	__irq_invalid			@  4
   951		.long	__irq_invalid			@  5
   952		.long	__irq_invalid			@  6
   953		.long	__irq_invalid			@  7
   954		.long	__irq_invalid			@  8
   955		.long	__irq_invalid			@  9
   956		.long	__irq_invalid			@  a
   957		.long	__irq_invalid			@  b
   958		.long	__irq_invalid			@  c
   959		.long	__irq_invalid			@  d
   960		.long	__irq_invalid			@  e
   961		.long	__irq_invalid			@  f
   962	
   963	/*
   964	 * Data abort dispatcher
   965	 * Enter in ABT mode, spsr = USR CPSR, lr = USR PC
   966	 */
   967		vector_stub	dabt, ABT_MODE, 8
   968	
   969		.long	__dabt_usr			@  0  (USR_26 / USR_32)
   970		.long	__dabt_invalid			@  1  (FIQ_26 / FIQ_32)
   971		.long	__dabt_invalid			@  2  (IRQ_26 / IRQ_32)
   972		.long	__dabt_svc			@  3  (SVC_26 / SVC_32)
   973		.long	__dabt_invalid			@  4
   974		.long	__dabt_invalid			@  5
   975		.long	__dabt_invalid			@  6
   976		.long	__dabt_invalid			@  7
   977		.long	__dabt_invalid			@  8
   978		.long	__dabt_invalid			@  9
   979		.long	__dabt_invalid			@  a
   980		.long	__dabt_invalid			@  b
   981		.long	__dabt_invalid			@  c
   982		.long	__dabt_invalid			@  d
   983		.long	__dabt_invalid			@  e
   984		.long	__dabt_invalid			@  f
   985	
   986	/*
   987	 * Prefetch abort dispatcher
   988	 * Enter in ABT mode, spsr = USR CPSR, lr = USR PC
   989	 */
   990		vector_stub	pabt, ABT_MODE, 4
   991	
   992		.long	__pabt_usr			@  0 (USR_26 / USR_32)
   993		.long	__pabt_invalid			@  1 (FIQ_26 / FIQ_32)
   994		.long	__pabt_invalid			@  2 (IRQ_26 / IRQ_32)
   995		.long	__pabt_svc			@  3 (SVC_26 / SVC_32)
   996		.long	__pabt_invalid			@  4
   997		.long	__pabt_invalid			@  5
   998		.long	__pabt_invalid			@  6
   999		.long	__pabt_invalid			@  7
  1000		.long	__pabt_invalid			@  8
  1001		.long	__pabt_invalid			@  9
  1002		.long	__pabt_invalid			@  a
  1003		.long	__pabt_invalid			@  b
  1004		.long	__pabt_invalid			@  c
  1005		.long	__pabt_invalid			@  d
  1006		.long	__pabt_invalid			@  e
  1007		.long	__pabt_invalid			@  f
  1008	
  1009	/*
  1010	 * Undef instr entry dispatcher
  1011	 * Enter in UND mode, spsr = SVC/USR CPSR, lr = SVC/USR PC
  1012	 */
  1013		vector_stub	und, UND_MODE
  1014	
  1015		.long	__und_usr			@  0 (USR_26 / USR_32)
  1016		.long	__und_invalid			@  1 (FIQ_26 / FIQ_32)
  1017		.long	__und_invalid			@  2 (IRQ_26 / IRQ_32)
  1018		.long	__und_svc			@  3 (SVC_26 / SVC_32)
  1019		.long	__und_invalid			@  4
  1020		.long	__und_invalid			@  5
  1021		.long	__und_invalid			@  6
  1022		.long	__und_invalid			@  7
  1023		.long	__und_invalid			@  8
  1024		.long	__und_invalid			@  9
  1025		.long	__und_invalid			@  a
  1026		.long	__und_invalid			@  b
  1027		.long	__und_invalid			@  c
  1028		.long	__und_invalid			@  d
  1029		.long	__und_invalid			@  e
  1030		.long	__und_invalid			@  f
  1031	
  1032		.align	5
  1033	
  1034	/*=============================================================================
  1035	 * Address exception handler
  1036	 *-----------------------------------------------------------------------------
  1037	 * These aren't too critical.
  1038	 * (they're not supposed to happen, and won't happen in 32-bit data mode).
  1039	 */
  1040	
  1041	vector_addrexcptn:
  1042		b	vector_addrexcptn
  1043	
  1044	/*=============================================================================
  1045	 * FIQ "NMI" handler
  1046	 *-----------------------------------------------------------------------------
  1047	 * Handle a FIQ using the SVC stack allowing FIQ act like NMI on x86
  1048	 * systems. This must be the last vector stub, so lets place it in its own
  1049	 * subsection.
  1050	 */
  1051		.subsection 2
  1052		vector_stub	fiq, FIQ_MODE, 4
  1053	
  1054		.long	__fiq_usr			@  0  (USR_26 / USR_32)
  1055		.long	__fiq_svc			@  1  (FIQ_26 / FIQ_32)
  1056		.long	__fiq_svc			@  2  (IRQ_26 / IRQ_32)
  1057		.long	__fiq_svc			@  3  (SVC_26 / SVC_32)
  1058		.long	__fiq_svc			@  4
  1059		.long	__fiq_svc			@  5
  1060		.long	__fiq_svc			@  6
  1061		.long	__fiq_abt			@  7
  1062		.long	__fiq_svc			@  8
  1063		.long	__fiq_svc			@  9
  1064		.long	__fiq_svc			@  a
  1065		.long	__fiq_svc			@  b
  1066		.long	__fiq_svc			@  c
  1067		.long	__fiq_svc			@  d
  1068		.long	__fiq_svc			@  e
  1069		.long	__fiq_svc			@  f
  1070	
  1071		.globl	vector_fiq
  1072	
  1073		.section .vectors, "ax", %progbits
> 1074		RELOC_TEXT_NONE
  1075		W(b)	vector_rst
  1076		W(b)	vector_und
  1077	ARM(	.reloc	., R_ARM_LDR_PC_G0, .L__vector_swi		)
  1078	THUMB(	.reloc	., R_ARM_THM_PC12, .L__vector_swi		)
  1079		W(ldr)	pc, .
  1080		W(b)	vector_pabt
  1081		W(b)	vector_dabt
  1082		W(b)	vector_addrexcptn
  1083		W(b)	vector_irq
  1084		W(b)	vector_fiq
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
