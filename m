Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ACB218AAF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 05:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763874657; cv=none; b=Aou96fLJh9P7G6jf3HL6pJ5EJgtcDcOn+9/AFFbFES8k1JCnJbbKxWFnGpDi95cTbu+OdhREU+aaEDErXNfSIoF8ROLwNVumUJh9q0yGhPwJ2F6bwoolrYf/nHId/oK5HAPB+xdlP2JVC+yUXXMbMhiTL0YUsksyyqvFrS8Esok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763874657; c=relaxed/simple;
	bh=7ANUfaBfl6xgtnlU/D8eh0m/KFC0VXFspV4i4ca3/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frw+txgq4f8LCcXFVy5CVQfoKeQhr4/a1Rktc+uOkGLZULfXPkrxanpEJEM100z6czby8eK7GYUbnv8kkWwfGCMEXruxhRORGYQyx6uz7DW1dAUaZBs/RuHbeP3Jr+tcc5YLME+x+koddkfzlCow0QHiUEcZaoxnx2PW+/Aevsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixA/0c7A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixA/0c7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763874656; x=1795410656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ANUfaBfl6xgtnlU/D8eh0m/KFC0VXFspV4i4ca3/JI=;
  b=ixA/0c7A3m4+gC89pwCcJ8iH+WsdDhfbHUR1aKQnjExFwKJfUe2VbUlV
   BjOPaieLzmYpybzagTc5GcZd0HjbxldzKGSudbB0T84cG0Df2fQ+KXdjX
   5Y11sLGCxi7awomYHcfz+//+Y4r10Q0dfBjHEjuq2HeaqgJxQ3c1MoiU8
   YU0F5xAo1Ym0eqzZtaNIyql9tHDhGTBQUn5TtfDIQjQqgQeB0SCegZsxV
   Gy3OeKW5eW4BofsaNZ0IcMfriWbCNIveHThiutCIYOhMnw4sxKmS9TV1t
   hgDjj2dzO3Njh9IzcQBVzbOKhfdadbMz/LiGrHiy+AbFwtZuOK9Fg7OU8
   w==;
X-CSE-ConnectionGUID: blItkN82Rc6yry5IIo4uag==
X-CSE-MsgGUID: dsLbL+4kSGW1IR7CH5W6Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="88567363"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="88567363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 21:10:55 -0800
X-CSE-ConnectionGUID: G6WDz8/7QZ6XW6xpJ0KynQ==
X-CSE-MsgGUID: AKxPUCaeTBWKnbNf7BKqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="222671765"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 21:10:53 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN2N8-00083j-33;
	Sun, 23 Nov 2025 05:10:50 +0000
Date: Sun, 23 Nov 2025 13:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 14/14] arch/m68k/coldfire/intc.c:173:34: error:
 'MCFINT_VECBASE' undeclared
Message-ID: <202511231301.LeskMaF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   ff8a015c8f4aa08dfa1f340b404fed5057169958
commit: ff8a015c8f4aa08dfa1f340b404fed5057169958 [14/14] m68k: coldfire: enable devicetree use
config: m68k-m5307c3_defconfig (https://download.01.org/0day-ci/archive/20251123/202511231301.LeskMaF8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231301.LeskMaF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231301.LeskMaF8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function)
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/MCFINT_VECBASE +173 arch/m68k/coldfire/intc.c

ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  169  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  170  static int __init intc_of_init(struct device_node *np,
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  171  			       struct device_node *parent)
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  172  {
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26 @173  	const unsigned int num = MCFINT_VECBASE + 64;
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  174  	struct irq_domain *domain;
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  175  	int irq;
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  176  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  177  	domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  178  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  179  	for (irq = MCFINT_VECBASE; irq < num; irq++)
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  180  		irq_create_mapping(domain, irq);
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  181  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  182  	return 0;
33a21263bf7417 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  183  }
33a21263bf7417 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  184  

:::::: The code at line 173 was first introduced by commit
:::::: ca7473b8ecb6a49496ed97c97363737c6ec4bf89 m68k: coldfire: support devicetree binding for intc controller

:::::: TO: Greg Ungerer <gerg@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
