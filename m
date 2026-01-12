Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694E3101C0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 19:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768247461; cv=none; b=sJdrgHMb/t1Dez8eZacXCyRdyXFZggea1H49VPadMfXc0FVb+1RXLSamEDCIos8TcOb4lVG8ZXpGxF26917XmnAZHfgsqYPzsRDblgJgAQL9MYz/WXFy3vzy0z76+H8uNV+LF5Sxjr8U/PTH9rDzYi/bELtL/4wDO5i/XNdDM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768247461; c=relaxed/simple;
	bh=Bk9z928wlJHqz5Mf0JqJZ9xc4NQp8PM0G2wMgSHHmgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZJNdBPZ9f3MdD/djZ96EWqyUDnSoUhn2YollmusFxCwjmvY6bYQ/ren66AoagSMw1fe6mJVMTPwYAUnTz1sRcFoMyXajg/uRm+fL2y/UdoBv5I8eSTkYb1d5LJNMDkH5juWC8FZmnGFy2ECsNZJh5D0LNNi/ACQzrua0YvsVSNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5R2yazI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5R2yazI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768247454; x=1799783454;
  h=date:from:to:cc:subject:message-id;
  bh=Bk9z928wlJHqz5Mf0JqJZ9xc4NQp8PM0G2wMgSHHmgc=;
  b=B5R2yazI4oMg13r2u3T0xlyrW/hNK7wE5gOkMVPG2W7E/8JUittDqj8F
   aSiOh8JLVcdPY0tawN1D/2K2FwPDv/i5Ltmi+iNo/u0LXv6boUIybTZWC
   JcSic+YvNvkIofqUWP3/3AO8edh4fqSmWbjSSSDftAXFGelEYHv+r3GxB
   oqsDwQ+JnEDaodkacSzYpoV7ac5L7rXJrepnT7iH0+oP7Tj7nNN9cFhsO
   mMTXq8COHyLeE4IYpZUL3xwt4rnlCW9b8GQlIzGvzbQEBfWwFQ6uvsEGk
   XHpF9LRz7UPAFWL+tA19sEsxZPP/5pFDcGo6X1VG6AerEw1nE+JdNcbbn
   Q==;
X-CSE-ConnectionGUID: haxUOckSRkq3pqfT697V9Q==
X-CSE-MsgGUID: 7q7Mh0GdQOC0AgAnUTm4uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73161123"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="73161123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:50:53 -0800
X-CSE-ConnectionGUID: rswqonozTN2SIFoeownqsQ==
X-CSE-MsgGUID: XWK6M4ngQHa45jI9JbYc1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209252196"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jan 2026 11:50:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfNw8-00000000DoO-1cue;
	Mon, 12 Jan 2026 19:50:48 +0000
Date: Tue, 13 Jan 2026 03:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 23/23]
 drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202601130336.AOM8gWRF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   f252e92f05cfac0417c6766c7b387e0798643c1d
commit: f252e92f05cfac0417c6766c7b387e0798643c1d [23/23] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: mips-randconfig-r133-20260112 (https://download.01.org/0day-ci/archive/20260113/202601130336.AOM8gWRF-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130336.AOM8gWRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130336.AOM8gWRF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/ehci-pci.c: note: in included file:
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
--
   drivers/usb/host/ehci-platform.c: note: in included file:
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
--
   drivers/usb/host/ehci-hcd.c: note: in included file:
   drivers/usb/host/ehci-q.c:1386:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __hc32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-q.c:1386:27: sparse:     expected restricted __hc32 [usertype] old_current
   drivers/usb/host/ehci-q.c:1386:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c: note: in included file:
   drivers/usb/host/ehci-mem.c:187:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __hc32 [usertype] *periodic @@     got restricted __le32 [usertype] * @@
   drivers/usb/host/ehci-mem.c:187:24: sparse:     expected restricted __hc32 [usertype] *periodic
   drivers/usb/host/ehci-mem.c:187:24: sparse:     got restricted __le32 [usertype] *
   drivers/usb/host/ehci-hcd.c:567:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __hc32 [usertype] old_current @@     got int @@
   drivers/usb/host/ehci-hcd.c:567:27: sparse:     expected restricted __hc32 [usertype] old_current
   drivers/usb/host/ehci-hcd.c:567:27: sparse:     got int
   drivers/usb/host/ehci-hcd.c: note: in included file:
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
--
   drivers/usb/host/ohci-hcd.c: note: in included file:
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
   drivers/usb/host/ohci-hcd.c: note: in included file:
   drivers/usb/host/ohci-hub.c:269:9: sparse: sparse: context imbalance in 'ohci_rh_resume' - different lock contexts for basic block
   drivers/usb/host/ohci-hcd.c: note: in included file:
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/host/ohci.h:578:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/host/ohci.h:578:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:578:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:578:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/host/ohci.h:566:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/host/ohci.h:566:17: sparse:     got unsigned int *
>> drivers/usb/host/ohci.h:566:17: sparse: sparse: cast to restricted __be32
--
   drivers/usb/chipidea/ci_hdrc_tegra.c: note: in included file:
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:762:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:762:17: sparse: sparse: cast to restricted __be32
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected unsigned int [usertype] val
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got restricted __be32 [usertype]
>> drivers/usb/chipidea/../host/ehci.h:786:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/usb/chipidea/../host/ehci.h:786:17: sparse:     got unsigned int *
   drivers/usb/chipidea/ci_hdrc_tegra.c: note: in included file (through include/linux/rwsem.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/spinlock.h:406:9: sparse: sparse: context imbalance in 'tegra_usb_internal_port_reset' - unexpected unlock

vim +786 drivers/usb/host/ehci.h

91bc4d31e81b15 Vladimir Barinov       2007-12-30  756  
083522d76662cd Benjamin Herrenschmidt 2006-12-15  757  static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
083522d76662cd Benjamin Herrenschmidt 2006-12-15  758  		__u32 __iomem *regs)
083522d76662cd Benjamin Herrenschmidt 2006-12-15  759  {
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  760  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
083522d76662cd Benjamin Herrenschmidt 2006-12-15  761  	return ehci_big_endian_mmio(ehci) ?
68f50e52554a0a Al Viro                2007-02-09 @762  		readl_be(regs) :
68f50e52554a0a Al Viro                2007-02-09  763  		readl(regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  764  #else
68f50e52554a0a Al Viro                2007-02-09  765  	return readl(regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  766  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  767  }
083522d76662cd Benjamin Herrenschmidt 2006-12-15  768  
feffe09f510c47 Peter Chen             2014-01-10  769  #ifdef CONFIG_SOC_IMX28
feffe09f510c47 Peter Chen             2014-01-10  770  static inline void imx28_ehci_writel(const unsigned int val,
feffe09f510c47 Peter Chen             2014-01-10  771  		volatile __u32 __iomem *addr)
feffe09f510c47 Peter Chen             2014-01-10  772  {
feffe09f510c47 Peter Chen             2014-01-10  773  	__asm__ ("swp %0, %0, [%1]" : : "r"(val), "r"(addr));
feffe09f510c47 Peter Chen             2014-01-10  774  }
feffe09f510c47 Peter Chen             2014-01-10  775  #else
feffe09f510c47 Peter Chen             2014-01-10  776  static inline void imx28_ehci_writel(const unsigned int val,
feffe09f510c47 Peter Chen             2014-01-10  777  		volatile __u32 __iomem *addr)
feffe09f510c47 Peter Chen             2014-01-10  778  {
feffe09f510c47 Peter Chen             2014-01-10  779  }
feffe09f510c47 Peter Chen             2014-01-10  780  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  781  static inline void ehci_writel(const struct ehci_hcd *ehci,
083522d76662cd Benjamin Herrenschmidt 2006-12-15  782  		const unsigned int val, __u32 __iomem *regs)
083522d76662cd Benjamin Herrenschmidt 2006-12-15  783  {
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  784  #ifdef CONFIG_USB_EHCI_BIG_ENDIAN_MMIO
083522d76662cd Benjamin Herrenschmidt 2006-12-15  785  	ehci_big_endian_mmio(ehci) ?
68f50e52554a0a Al Viro                2007-02-09 @786  		writel_be(val, regs) :
68f50e52554a0a Al Viro                2007-02-09  787  		writel(val, regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  788  #else
feffe09f510c47 Peter Chen             2014-01-10  789  	if (ehci->imx28_write_fix)
feffe09f510c47 Peter Chen             2014-01-10  790  		imx28_ehci_writel(val, regs);
feffe09f510c47 Peter Chen             2014-01-10  791  	else
68f50e52554a0a Al Viro                2007-02-09  792  		writel(val, regs);
d728e327d4f86d Benjamin Herrenschmidt 2006-12-28  793  #endif
083522d76662cd Benjamin Herrenschmidt 2006-12-15  794  }
8cd42e97bf451b Kumar Gala             2006-01-20  795  

:::::: The code at line 786 was first introduced by commit
:::::: 68f50e52554a0a55dfe2e3fdf659ee0569d73c3f [PATCH] hci_{read,write}l() does force casts to wrong type for no reason

:::::: TO: Al Viro <viro@ftp.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
