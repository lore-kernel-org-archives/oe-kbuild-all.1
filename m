Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E802389DF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 01:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178266; cv=none; b=SiQGajUImXQngzv13iBDvO6XTjy377za+9DyKGBZhmeBBRefnNNV7VzzT1hPtWGoeK4zYKhto2zAS0vCcXgMsQSt9KQlF72IC5DkpdRqTGQPZsTLp57IGmfluNdcNWCzd46PKinKq568Fqp8Xf/GR5/BiqqggKdKztgpgW0taxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178266; c=relaxed/simple;
	bh=8cDeFRtA+q9lW5flCj8DC4vggbe7Bvrs5Xa5Dir6SBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bxQ6O45jynY5HpPDkB9CGTj+cYM7C64Mt+NX0W67Xrru3zrez+JwhJ9elDdtmJT7HB4PfWk/93yN7bjVdml1rAiZbzMZSEdrgyRH36uYsap11RsVKWLihR5Lm6/dCBwOykioo5cTft5+GkgceL2Adjwx/l0B16KIzNg8e4AGkUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYhzUEqM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYhzUEqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782178263; x=1813714263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cDeFRtA+q9lW5flCj8DC4vggbe7Bvrs5Xa5Dir6SBE=;
  b=SYhzUEqMYOdpHSALE3mgn97vkv48IBHfuCqiv/w7FxDcSAwP1jcY8zBd
   3YBS17k294RCBCXkmJX9hnVUJFJaGH/y9OUkh54boKUFlW/auZJaQFQDy
   namNHzsT9xfACAeuJ545U9YeNXySXfn6kAcmgRtIkgGrOZk5OW+sn4wes
   3BzM//A1cJiyyfMi368tOPO/AJpcl/K97RwP5cT9vPYgwqnCoGBrMs/wL
   BckomE6JKEz/cf7b4/Rw9C1ocyQgwQSspxQLk3yC9mSa5OoNErmPg+ves
   aysUnj4Sv8OqCWSl1p9oM6rTTCMZtMlZjexANX73nAccFvBTeWzr5xypi
   A==;
X-CSE-ConnectionGUID: En/OgEAiTwabIDEAB6f0cg==
X-CSE-MsgGUID: ZbEWmJeeTP28M8yt201b3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93505451"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93505451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 18:31:02 -0700
X-CSE-ConnectionGUID: +J+AThfZQ82YNs+X0YfcSg==
X-CSE-MsgGUID: +hPlUv31RbCBstNebsYKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="245242064"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 18:31:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbpyc-0000000028n-1Au2;
	Tue, 23 Jun 2026 01:30:58 +0000
Date: Tue, 23 Jun 2026 09:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 14/124]
 arch/arm/kernel/head.S:129: Error: invalid constant (131) after fixup
Message-ID: <202606230929.vTvqpE4W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 00e20399194f15a96475064e0b59d8a76d7f920c [14/124] ARM: zte: HACK: Set up GICv3.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606230929.vTvqpE4W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230929.vTvqpE4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230929.vTvqpE4W-lkp@intel.com/

Note: the stefandoesinger-zx297520/mfd HEAD c94d760b3ed42a18ecbae9e63d7010c770a8c042 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   /tmp/ccQl9rEV.s: Assembler messages:
>> arch/arm/kernel/head.S:129: Error: invalid constant (131) after fixup


vim +129 arch/arm/kernel/head.S

   105	
   106		@ FIXME: This needs to go into the bootloader, it has no business being here.
   107		@ zx297520v3 has essentially an ARMv8 CPU with a GICv3 and secure mode support, but there's
   108		@ no ARM TrustZone firmware. So we have to set up the CPU and GIC according to arm64 boot
   109		@ requirements specified in Documentation/arch/arm64/booting.rst.
   110		@ Leave r0, r1 and r2 alone to preserve the DTB pointer.
   111	
   112		@ This allows EL1 to handle ints hat are normally handled by EL2/3.
   113		@ Detect sane bootloaders and skip the hack
   114		ldr	r3, =0xf2000000
   115		ldr	r3, [r3]
   116		ldr	r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
   117		cmp	r3, r4
   118		beq	skip_zx_hack
   119		ldr	r3, =0xf2000000
   120		str	r4, [r3]
   121	
   122		cps	#MON_MODE
   123	
   124		@ Work in non-secure physical addres space: SCR_EL3.NS = 1. At least the UART seems to
   125		@ respond only to non-secure addresses. I have taken insipiration from Raspberry pi's
   126		@ armstub7.S here.
   127		@
   128		@ ARM docs say modify this bit in monitor mode only...
 > 129		mov	r3, #0x131			@ non-secure
   130		mcr	p15, 0, r3, c1, c1, 0
   131	
   132		@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
   133		ldr	r3, =0xF22020a8
   134		ldr	r4, =0x50
   135		str	r4, [r3]
   136		ldr	r3, =0xF22020ac
   137		ldr	r4, =0x14
   138		str	r4, [r3]
   139	
   140		@ Enable EL access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg access to
   141		@ GICv3 registers (bit 0, ICC_SRE_EL3.SRE).
   142		mrc	p15, 6, r3, c12, c12, 5		@ ICC_SRE_EL3
   143		orr	r3, #0x9			@ FIXME: No defines for SRE_EL3 values?
   144		mcr	p15, 6, r3, c12, c12, 5
   145		mrc	p15, 0, r3, c12, c12, 5		@ ICC_SRE_EL1
   146		orr	r3, #(ICC_SRE_EL1_SRE)
   147		mcr	p15, 0, r3, c12, c12, 5
   148	
   149		@ Like ICC_SRE_EL3, enable non-secure access and allow register based access.
   150		mrc	p15, 4, r3, c12, c9, 5		@ ICC_SRE_EL2 aka ICC_HSRE
   151		orr	r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
   152		mcr	p15, 4, r3, c12, c9, 5
   153		isb
   154	
   155		@ Back to SVC mode. TODO: Doesn't safe_svcmode_maskall do this for us anyway?
   156		cps	#SVC_MODE
   157	skip_zx_hack:
   158	
   159		@ ensure svc mode and all interrupts masked
   160		safe_svcmode_maskall r9
   161	
   162		mrc	p15, 0, r9, c0, c0		@ get processor id
   163		bl	__lookup_processor_type		@ r5=procinfo r9=cpuid
   164		movs	r10, r5				@ invalid processor (r5=0)?
   165	 THUMB( it	eq )		@ force fixup-able long branch encoding
   166		beq	__error_p			@ yes, error 'p'
   167	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
