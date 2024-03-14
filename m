Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB91C15B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 04:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710391222; cv=none; b=PtNjm1mpHsT1hdJxtmMJVgSp5gzHxVyDvK5PJC2316kUypY6atxbNmTIcWIKH4NBUtRETUH23jEL0cfbWStqTjOdxqyeM6O1XDzTK4ChzinypLCAQMqPdG8QDiDz2qisEO6jYj/Hg2YFJ9Vm16Nrb3OJCAau2QDLFYeYJ42JXBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710391222; c=relaxed/simple;
	bh=Z7WMtEYuFo6NcCt9Pqq/kx5ObruI7T+S0ZvXNQ6CTlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMcYdR8hgevJZN22oUHU2ho0FFNhsq0Ek8Two+/lI3UedMkbwekY4+b79b/PeE7crfaaxDcDAnK5Ts1n9t155JIpXSae+BMreHtQiC326XDIH4YVP8UDhOVJlYiD3rpzDcise3ho3+zFC1I6S52e0UDb0g3BYmZ4DEoOCIwK9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVxSNxHQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVxSNxHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710391219; x=1741927219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z7WMtEYuFo6NcCt9Pqq/kx5ObruI7T+S0ZvXNQ6CTlU=;
  b=lVxSNxHQwP/1vlODz3shPnj1RsSJz5X2Ro0UqEhL7SqI29KtpHS3XN+8
   TpBb+i212TOl4R5P73XcEbkg0kWNjCSvNLzOJc974za/i99mMZ5mib2aR
   V9nvvaVd56Yri4AlZjH7iz17HUskxjI/X8A54LyDo9pk5DX+4osihYI2w
   /flxlvpL5gVlMhLLQUkNrgv1xPTUleIzs1kOLr+3vTIMofyu3e4F9lQ5O
   2ZvL9sitdYmUXrr6OuKNaEUKUwllW0Xs9V0o9Ee5ac4+Nd/8ac8Ao7P+2
   jWo8IUwOnOtxtmVs9sjj0cVZd7ZP+yWLqct7Io3Ww1zljwM5jODs631PX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15833548"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="15833548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 21:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="43087379"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Mar 2024 21:40:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkct4-000D5f-0M;
	Thu, 14 Mar 2024 04:40:14 +0000
Date: Thu, 14 Mar 2024 12:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7071/7097]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:10: fatal error:
 'linux/pcs/pcs-mtk-usxgmii.h' file not found
Message-ID: <202403141210.KjyzJ17t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   23ffed66602e691233d3c6ac7ff80fcde17bec2c
commit: 6d9ec7f1da7baf38efd16bf5a8ef25eb01bd04f0 [7071/7097] net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240314/202403141210.KjyzJ17t-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141210.KjyzJ17t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141210.KjyzJ17t-lkp@intel.com/

Note: the frank-w-bpi-r2-4.14/6.6-dango HEAD 23ffed66602e691233d3c6ac7ff80fcde17bec2c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/net/pcs/pcs-mtk-usxgmii.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/pcs/pcs-mtk-usxgmii.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/pcs/pcs-mtk-usxgmii.c:9:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/net/pcs/pcs-mtk-usxgmii.c:11:
   In file included from include/linux/mdio.h:9:
   In file included from include/uapi/linux/mdio.h:15:
   In file included from include/linux/mii.h:13:
   In file included from include/linux/linkmode.h:5:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2166:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/net/pcs/pcs-mtk-usxgmii.c:17:10: fatal error: 'linux/pcs/pcs-mtk-usxgmii.h' file not found
      17 | #include <linux/pcs/pcs-mtk-usxgmii.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.
--
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2166:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:10:
   In file included from include/linux/of_mdio.h:12:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:10: fatal error: 'linux/pcs/pcs-mtk-usxgmii.h' file not found
      25 | #include <linux/pcs/pcs-mtk-usxgmii.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +25 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  > 25	#include <linux/pcs/pcs-mtk-usxgmii.h>
    26	#include <linux/jhash.h>
    27	#include <linux/bitfield.h>
    28	#include <net/dsa.h>
    29	#include <net/dst_metadata.h>
    30	#include <net/page_pool/helpers.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
