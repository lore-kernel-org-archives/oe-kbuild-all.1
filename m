Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6AB3FB1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 01:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736214878; cv=none; b=SUjxQcmqArodAOqQ3ixpc4aFC0n5koT0yzK1XjrlWBw9O8KQJmoJ/ZpJF83clppnui2Sf7ZoSEmjNCxAgzO+PLaIWxxXBulW29SkPcYuJiYal1He2PU0kHgDoOS4fVE2lgWPfKhStFZmqzq6qxAPgmwqYaEykKbSVPGXgSbDxoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736214878; c=relaxed/simple;
	bh=SowWQMycjj4QOJjAX1XdCz5idesJoWu062/P5ucmK8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HI3JVO6o8NZH9U3Wu1nA34WaSUqZx0ZQOPBELqprv931WVYvQY2NjZOynsaaseYDcGKBMAesrRUkyTnvtQAYsTHqA909r5dsEZZe5MKiui7iK7rUD108ymYXB4OVoU3lyU0IUIUocbkYh6s6HV4kJFp6n9X/spI9QRR87yUx+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBhy4Yk2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBhy4Yk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736214875; x=1767750875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SowWQMycjj4QOJjAX1XdCz5idesJoWu062/P5ucmK8g=;
  b=YBhy4Yk2WqSTBY2Fuicn1F6g7qAV5iS5vNNOhbdma0i6PcgYYwaghjqH
   mqvrRXLHE3jJp+AkJMtXmUSrQFQPO/Fpf/DV1qFMKwxYOpjGT9x7Hb2r4
   mwxDkQwsUZN+WUG4tc2JCJwyeEr2ZFCohMXl8J4U9nOnTDx5vD4sJdFzO
   yaQXls21HZFaMSul54huOtSLUZQl1WLmAnqB4NGXadV8jxuyQwI2C2hmw
   HPpYFZqZzIpqYl5I6MdYoEkxGTVnHFva0rQdW1a/ifJDteEWvKGlAO/iT
   0aEntWObN7rWJ6/q3SgKl9GPudJCBD32S0z/tuhRJPENWwpU6P4iU7snD
   g==;
X-CSE-ConnectionGUID: xOmQ8LbKR5aZVzpihojUFA==
X-CSE-MsgGUID: QU+LNZqXRjSuaE4RxiRfcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36258961"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36258961"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:54:35 -0800
X-CSE-ConnectionGUID: 8jB28bkBR5iku3Oc7UwN8Q==
X-CSE-MsgGUID: /ql3I9ldQ2yBBSOxWpzKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133520287"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2025 17:54:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUyne-000E6r-2z;
	Tue, 07 Jan 2025 01:54:30 +0000
Date: Tue, 7 Jan 2025 09:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/pci_of_scan.c:61: warning: Function parameter or
 struct member 'ss' not described in 'OF_PCI_ADDR0_SPACE'
Message-ID: <202501070906.rgqBHsjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: bc605cd79edb68131d3be5b00b949aa312277d39 powerpc/of/pci: Rewrite pci_parse_of_flags
date:   5 years ago
config: powerpc-randconfig-c023-20211019 (https://download.01.org/0day-ci/archive/20250107/202501070906.rgqBHsjt-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070906.rgqBHsjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070906.rgqBHsjt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/pci_of_scan.c:23: warning: Function parameter or struct member 'np' not described in 'get_int_prop'
   arch/powerpc/kernel/pci_of_scan.c:23: warning: Function parameter or struct member 'name' not described in 'get_int_prop'
   arch/powerpc/kernel/pci_of_scan.c:23: warning: Function parameter or struct member 'def' not described in 'get_int_prop'
>> arch/powerpc/kernel/pci_of_scan.c:61: warning: Function parameter or struct member 'ss' not described in 'OF_PCI_ADDR0_SPACE'
>> arch/powerpc/kernel/pci_of_scan.c:61: warning: expecting prototype for pci_parse_of_flags(). Prototype was for OF_PCI_ADDR0_SPACE() instead


vim +61 arch/powerpc/kernel/pci_of_scan.c

    18	
    19	/**
    20	 * get_int_prop - Decode a u32 from a device tree property
    21	 */
    22	static u32 get_int_prop(struct device_node *np, const char *name, u32 def)
  > 23	{
    24		const __be32 *prop;
    25		int len;
    26	
    27		prop = of_get_property(np, name, &len);
    28		if (prop && len >= 4)
    29			return of_read_number(prop, 1);
    30		return def;
    31	}
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
