Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578E381729
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713549100; cv=none; b=dvxJ7DcDSHAOp2ZV0rYM/fW8mdW/Us03dt45+Po96o90fV4aDIKV2JbNLqqWWy+//s8O4DAcHKQrZw+Q2oxCG0WNCpoNWNh8OsPR4zpZwXMIDziHcAaKO3pmblBjKzpGBCWbUilshX7YC55lYXlJ5qhZk+i/pzwDh02l+Ujuz/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713549100; c=relaxed/simple;
	bh=U/S2Xzg+H9Okd2geKACxw4PZYF2AzPBleFBs8AiqAH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKFzyGVgItGA/ty1qkXNkOSmuDQkiGaHXn7Bh7rH4WN/jkJzKyIic9dvEz3BcXvXmQ1qjj7W2W8EbfHH5gbkZULUjRAFz2I6VlUS9N15fuLXhqxhe0B5HtSWpx2AojWepjLfWGHc3FkYL6qKip5WOqen6GQ1Ti7m9j/qC5YCk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h3lj90ia; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h3lj90ia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713549098; x=1745085098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/S2Xzg+H9Okd2geKACxw4PZYF2AzPBleFBs8AiqAH4=;
  b=h3lj90ia3uGdoBterGl1ifBOmT0Ssy0en1eJZn7u1jBQdEpG/tf+2ky3
   9YCk9g5fxz0rWgSK2Q89rBajnaRRZbXr0mMIqoSeYSLLiJtudvfzKLZ+6
   l4SDJoIP5amWz8oU2WePJjgjPxuAMjOw2dG397liaG2l6nJvBnMWT4ggT
   0PHQFMT2pDLRY1ltS1/vMOQcuKUqkMu040ugxOsO9bjReEw216iSdtu8B
   pupyYcjIt/Y2fymI17Nsj3O9j/8XS+u1UEcaxI9TrZ4Zz9OmZBaxqJnCu
   7G46vY6d3G/uKJXjXrKCjxLAkWf4uLDui6IosFSEL3cg02Ihe/hkSEHPC
   A==;
X-CSE-ConnectionGUID: sG2XZpzWQJuRzsFc6XZlSw==
X-CSE-MsgGUID: V3JWHhn7TSGTEa4D4r4gIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12946037"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="12946037"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 10:51:37 -0700
X-CSE-ConnectionGUID: 1YWDMCZUTw2zDL5AIFUgmw==
X-CSE-MsgGUID: nQKiozbGQMWWN598f+e/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="23904581"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2024 10:51:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxsOb-000AMu-1i;
	Fri, 19 Apr 2024 17:51:33 +0000
Date: Sat, 20 Apr 2024 01:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 16176/18115]
 drivers/net/pcs/mtip_backplane.c:1036:4: warning: shift count is negative
Message-ID: <202404200156.mkfotZUS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 3a83aad72810769a933486226bea6f5fe6c2f631 [16176/18115] net: pcs: mtip_backplane: add driver for MoreThanIP backplane AN/LT core
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240420/202404200156.mkfotZUS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200156.mkfotZUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200156.mkfotZUS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/pcs/mtip_backplane.c:9:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:1775:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/pcs/mtip_backplane.c:9:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/pcs/mtip_backplane.c:9:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/pcs/mtip_backplane.c:9:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/pcs/mtip_backplane.c:1036:4: warning: shift count is negative [-Wshift-count-negative]
    1036 |                  C73_NEXT_PAGE_U_X(xnp),
         |                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:150:67: note: expanded from macro 'dev_info'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/linux/mii.h:53:40: note: expanded from macro 'C73_NEXT_PAGE_U_X'
      53 | #define C73_NEXT_PAGE_U_X(x)                    (((x) & C73_NEXT_PAGE_U_MSK) >> 16)
         |                                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/mii.h:52:31: note: expanded from macro 'C73_NEXT_PAGE_U_MSK'
      52 | #define C73_NEXT_PAGE_U_MSK                     GENMASK(47, 16)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +1036 drivers/net/pcs/mtip_backplane.c

  1024	
  1025	static void mtip_c73_decode_next_page(struct mtip_backplane *priv)
  1026	{
  1027		u64 xnp;
  1028	
  1029		if (mtip_read_lpa_xnp(priv, &xnp))
  1030			return;
  1031	
  1032		dev_info(&priv->mdiodev->dev,
  1033			 "Next page: message code 0x%llx, toggle %d, U 0x%llx, %s%s%s%s\n",
  1034			 C73_NEXT_PAGE_MESSAGE_CODE(xnp),
  1035			 !!(xnp & C73_NEXT_PAGE_TOGGLE),
> 1036			 C73_NEXT_PAGE_U_X(xnp),
  1037			 !!(xnp & C73_NEXT_PAGE_ACK2) ? "ack2 " : "",
  1038			 !!(xnp & C73_NEXT_PAGE_MP) ? "mp " : "",
  1039			 !!(xnp & C73_NEXT_PAGE_ACK) ? "ack " : "",
  1040			 !!(xnp & C73_NEXT_PAGE_NP) ? "np " : "");
  1041	}
  1042	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
