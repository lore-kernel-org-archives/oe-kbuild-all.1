Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5BD331A63
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435043; cv=none; b=PxrkysIwuw7F1I1GfNsKuOYFZm1EhsNtJ6n39x2Xs5EMrljpVdNh9n3G/60PaHb/4ol71EweqskWjSgVAr5Hmph1U8ERPGlH96d8Vtol+qDTZlXz4gvaSWjhocWm21SLuP6GT8gw2OxrbRaHC3+FsJTSx6DYSjy7CO0xw/+7Nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435043; c=relaxed/simple;
	bh=gQL0F2ILeCKBwLWc7IIZe9fI+fS2X6mGk50ug6F8W0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JGLM/ealV8mmrBH3Tbnjwy8Q775tkmsyZu83kA9o+qLljxeHrSnRtvKfJIR2uhlHjo4gGO/9zdxCO/7M47XzH1tFSCxIlEKtVvpTJgIXh8aaGoMjVWm3xQ5WbLF4jpZTfZ6+coshILWGGO1IAEE9IRlZe8t3+k/gPafNzW/F83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUBF4HpF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUBF4HpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789435041; x=1820971041;
  h=date:from:to:cc:subject:message-id;
  bh=gQL0F2ILeCKBwLWc7IIZe9fI+fS2X6mGk50ug6F8W0I=;
  b=XUBF4HpF9DFYV02sqjcAHrVw+ucZhkckBI9u3t6NOX4puPs6beY7a7yN
   3wkBhw79H+y3w8PDFde0Ksyi+2MXdaBy38c5zMfDEHZoYtXS6VJ1tk6GR
   ejyIJsd3S6cH3+L847OuCVSdYmSfO8vDHQO02yq2qeKK4GIYhOMOXHAvl
   jxEc0kx1eD13Dg0hyY6x6TqypWu7Au2++VFTwxroEViqlzDLaUhyUr17G
   ziEOE3Tr4f9lGgTHPyf6eFw6HmtieToN+T6wbX/63R9xrUA9Kyo6wc1Lp
   mjjZsOgxVqinvSn7S9PFq9owXdzB1RDjCxK8k3V5g74Jr8mNFNoM5WPMa
   g==;
X-CSE-ConnectionGUID: TtXLiFZGSqGl1hWvVDwFNA==
X-CSE-MsgGUID: xtvt3MojSgq/cNSnD3Umow==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101308428"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101308428"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 18:17:21 -0700
X-CSE-ConnectionGUID: sUJAZIpRRyGc2rSFLV89vg==
X-CSE-MsgGUID: g70qftHEQKG0twKDSsVPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272299197"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2026 18:17:19 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6HnQ-000000003o7-2OUs;
	Tue, 15 Sep 2026 01:17:16 +0000
Date: Tue, 15 Sep 2026 09:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 22/22] arch/m68k/coldfire/intc.c:184:18:
 error: implicit declaration of function 'irq_domain_add_linear'; did you mean
 'irq_domain_create_linear'?
Message-ID: <202609150913.ChdI2e4L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   b5ed8ca50661263352c1e60587539803de9bde6a
commit: b5ed8ca50661263352c1e60587539803de9bde6a [22/22] m68k: coldfire: enable devicetree use
config: m68k-m5249evb_defconfig (https://download.01.org/0day-ci/archive/20260915/202609150913.ChdI2e4L-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150913.ChdI2e4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150913.ChdI2e4L-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:184:18: error: implicit declaration of function 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'? [-Wimplicit-function-declaration]
     184 |         domain = irq_domain_add_linear(np, MCFINT_VECNUM, &intc_irqdomain_ops, NULL);
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  irq_domain_create_linear
>> arch/m68k/coldfire/intc.c:184:16: error: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     184 |         domain = irq_domain_add_linear(np, MCFINT_VECNUM, &intc_irqdomain_ops, NULL);
         |                ^


vim +184 arch/m68k/coldfire/intc.c

72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  177  
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  178  static int __init intc_of_init(struct device_node *np,
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  179  			       struct device_node *parent)
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  180  {
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  181  	struct irq_domain *domain;
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  182  	int irq;
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  183  
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26 @184  	domain = irq_domain_add_linear(np, MCFINT_VECNUM, &intc_irqdomain_ops, NULL);
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  185  
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  186  	for (irq = MCFINT_VECBASE; irq < MCFINT_VECNUM; irq++)
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  187  		irq_create_mapping(domain, irq);
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  188  
72d5ab320f508b arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  189  	return 0;
33a21263bf7417 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  190  }
33a21263bf7417 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  191  

:::::: The code at line 184 was first introduced by commit
:::::: 72d5ab320f508b94736a7ec536774898147a4cb9 m68k: coldfire: support devicetree binding for intc controller

:::::: TO: Greg Ungerer <gerg@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
