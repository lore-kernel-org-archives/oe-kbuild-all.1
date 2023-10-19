Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9894168DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmrOo8bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697709846; x=1729245846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DiJ9aEbuO+BiTGnKCMTcov+ou8yOqZWmMYvZGWVaTkY=;
  b=OmrOo8biPC0+mG+Cuga7xkR3VU3mMfdgtF6g/CoognlRUP4eN+RNFiO1
   dl7sQgI7eyy1Bm0yDXQtKk0AfknWVMYkfxh50muVfBoO/L+Y/iUd0CpCD
   BqBgha1x0wwgqZcIYcj/hl2ONrv/JMleRTQ89mbOt58UYBPJew01JAcbo
   iSDJN+TOwpZr0jPPLAAi1V/KrUkIB0hRtpJb56rG1Df6QZnAnGWsgynIR
   a1+qqSUccmt09zmZIU9sjXsgJzcyigEkF6h22HBXp7TRUe8OgYJTvvwag
   fs9t2q0e5WHX8XmNaQevtKaimzVz4nygF5JXhnH1Xt3L1OMG/Se4F4wsV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365567379"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="365567379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900686216"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="900686216"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 03:01:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtPso-0001x0-06;
	Thu, 19 Oct 2023 10:04:02 +0000
Date: Thu, 19 Oct 2023 18:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/pci_of_scan.c:61: warning: Function parameter or
 member 'ss' not described in 'OF_PCI_ADDR0_SPACE'
Message-ID: <202310191708.97T9IVGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd72f9c7e512da377074d47d990564959b772643
commit: bc605cd79edb68131d3be5b00b949aa312277d39 powerpc/of/pci: Rewrite pci_parse_of_flags
date:   4 years, 2 months ago
config: powerpc-tqm8555_defconfig (https://download.01.org/0day-ci/archive/20231019/202310191708.97T9IVGD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191708.97T9IVGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191708.97T9IVGD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/pci_of_scan.c:23: warning: Function parameter or member 'np' not described in 'get_int_prop'
   arch/powerpc/kernel/pci_of_scan.c:23: warning: Function parameter or member 'name' not described in 'get_int_prop'
   arch/powerpc/kernel/pci_of_scan.c:23: warning: Function parameter or member 'def' not described in 'get_int_prop'
>> arch/powerpc/kernel/pci_of_scan.c:61: warning: Function parameter or member 'ss' not described in 'OF_PCI_ADDR0_SPACE'
   arch/powerpc/kernel/pci_of_scan.c:61: warning: Excess function parameter 'addr0' description in 'OF_PCI_ADDR0_SPACE'
   arch/powerpc/kernel/pci_of_scan.c:61: warning: Excess function parameter 'bridge' description in 'OF_PCI_ADDR0_SPACE'


vim +61 arch/powerpc/kernel/pci_of_scan.c

    32	
    33	/**
    34	 * pci_parse_of_flags - Parse the flags cell of a device tree PCI address
    35	 * @addr0: value of 1st cell of a device tree PCI address.
    36	 * @bridge: Set this flag if the address is from a bridge 'ranges' property
    37	 *
    38	 * PCI Bus Binding to IEEE Std 1275-1994
    39	 *
    40	 * Bit#            33222222 22221111 11111100 00000000
    41	 *                 10987654 32109876 54321098 76543210
    42	 * phys.hi cell:   npt000ss bbbbbbbb dddddfff rrrrrrrr
    43	 * phys.mid cell:  hhhhhhhh hhhhhhhh hhhhhhhh hhhhhhhh
    44	 * phys.lo cell:   llllllll llllllll llllllll llllllll
    45	 *
    46	 * where:
    47	 * n        is 0 if the address is relocatable, 1 otherwise
    48	 * p        is 1 if the addressable region is "prefetchable", 0 otherwise
    49	 * t        is 1 if the address is aliased (for non-relocatable I/O),
    50	 *          below 1 MB (for Memory),or below 64 KB (for relocatable I/O).
    51	 * ss       is the space code, denoting the address space:
    52	 *              00 denotes Configuration Space
    53	 *              01 denotes I/O Space
    54	 *              10 denotes 32-bit-address Memory Space
    55	 *              11 denotes 64-bit-address Memory Space
    56	 * bbbbbbbb is the 8-bit Bus Number
    57	 * ddddd    is the 5-bit Device Number
    58	 * fff      is the 3-bit Function Number
    59	 * rrrrrrrr is the 8-bit Register Number
    60	 */
  > 61	#define OF_PCI_ADDR0_SPACE(ss)		(((ss)&3)<<24)
    62	#define OF_PCI_ADDR0_SPACE_CFG		OF_PCI_ADDR0_SPACE(0)
    63	#define OF_PCI_ADDR0_SPACE_IO		OF_PCI_ADDR0_SPACE(1)
    64	#define OF_PCI_ADDR0_SPACE_MMIO32	OF_PCI_ADDR0_SPACE(2)
    65	#define OF_PCI_ADDR0_SPACE_MMIO64	OF_PCI_ADDR0_SPACE(3)
    66	#define OF_PCI_ADDR0_SPACE_MASK		OF_PCI_ADDR0_SPACE(3)
    67	#define OF_PCI_ADDR0_RELOC		(1UL<<31)
    68	#define OF_PCI_ADDR0_PREFETCH		(1UL<<30)
    69	#define OF_PCI_ADDR0_ALIAS		(1UL<<29)
    70	#define OF_PCI_ADDR0_BUS		0x00FF0000UL
    71	#define OF_PCI_ADDR0_DEV		0x0000F800UL
    72	#define OF_PCI_ADDR0_FN			0x00000700UL
    73	#define OF_PCI_ADDR0_BARREG		0x000000FFUL
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
