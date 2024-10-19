Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025D320E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 19:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729365175; cv=none; b=m6LsIX5HYGZcaxoPAlZNNvC7ZuY7a2LjqTFQvQ4rNryShRRVc1PWPU9IzjUuviBUMiaawCsHoL9McVwtwC8fDoNobDFDt92LF2TILPnAlzzN0DmM5aXmXI2NF0XZSyTKN5Li322H9mBMXiow+J6KSLolou5PgJ9CcDpPz3BTqSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729365175; c=relaxed/simple;
	bh=YSVuwi7C6S7Ejv3VfoRSMePcrkqKl6IrRkh6iJFPXac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRECz9+MdwXd2JjcMyzDO1zAlVEOHhoribJ/mQxMh7P+rmbFHCUeMrVAiT3Fv2iFh1xFUSCbMrKfumb6NUcIJvwnnNf6MhUCKqpO9UYYxAA0Cd7WYK3+iF0+ZOFcNqukMBLtYr1LnLPk0k6Ja2xWUB5mn3622kFacJ5Bi/gj+8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVQcE/oL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVQcE/oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729365174; x=1760901174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSVuwi7C6S7Ejv3VfoRSMePcrkqKl6IrRkh6iJFPXac=;
  b=JVQcE/oL2K1Ayp7iZ1QDOm1a7dsdgp9YOkSXOQAPxUxYR5gpNjSnj3J0
   rT1Jq+UzNrPbRaaGSlRGHqB/IlybI3ycyXc2DjBkGKgK8PSVAnICc3E4t
   jYCEIDpQAb43RAFKquMJ2Fh4SnbzNThaQwN47G8ssgQtlpt7Yos2Ex3QC
   bEkeDi/f+GYm7zv22qKAkfUPTAuEYkbUnopbzohqClR/vLKAYPy3IydfY
   +TBNx2fZQkgBGHuZIpv6fUmeaVwW7KtfLAkvdMMotneBjbq334JB57BYa
   BMNE92r3iFcdt/nvsgyKfFMEoR6zyEMR3oFGryYj2XDT8/y4/TgNimWV2
   w==;
X-CSE-ConnectionGUID: Ii1vIGyOSKianKfa0m56OQ==
X-CSE-MsgGUID: lpYP+SGuQlKXFr4VnLyLSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="40275702"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="40275702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 12:12:53 -0700
X-CSE-ConnectionGUID: rwXy1TMHSnC1Pir/RG3G9w==
X-CSE-MsgGUID: lwv4j2pYTka30R0BzCUcYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="83975081"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Oct 2024 12:12:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Esb-000PRF-31;
	Sat, 19 Oct 2024 19:12:49 +0000
Date: Sun, 20 Oct 2024 03:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14224/14651]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h:
 linux/pci.h is included more than once.
Message-ID: <202410200327.900tBDUF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   980f4346f1fdbd303ad74af8b2a62fbbbb6cf6c1
commit: bad535d287c9c1056d99de3666be7da84de4a8fc [14224/14651] Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200327.900tBDUF-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h: linux/pci.h is included more than once.

vim +12 drivers/net/ethernet/nebula-matrix/nbl/nbl_include/nbl_include.h

     9	
    10	#include <linux/mod_devicetable.h>
    11	#include <linux/device.h>
  > 12	#include <linux/pci.h>
    13	#include <linux/etherdevice.h>
    14	#include <linux/if_ether.h>
    15	#include <linux/if_vlan.h>
    16	#include <linux/ip.h>
    17	#include <linux/ipv6.h>
    18	#include <linux/sctp.h>
    19	#include <linux/ethtool.h>
    20	#include <linux/debugfs.h>
    21	#include <linux/firmware.h>
    22	#include <linux/list.h>
    23	#include <linux/pldmfw.h>
    24	#include <linux/types.h>
    25	#include <linux/errno.h>
    26	#include <linux/cdev.h>
    27	#include <linux/kfifo.h>
    28	#include <linux/termios.h>
    29	#include <net/inet6_hashtables.h>
    30	#include <linux/compiler.h>
    31	#include <linux/netdevice.h>
    32	#include <net/devlink.h>
    33	#include <net/ipv6.h>
    34	#include <net/pkt_cls.h>
    35	#include <net/bonding.h>
    36	#include <linux/if_bridge.h>
    37	#include <linux/rtnetlink.h>
  > 38	#include <linux/pci.h>
    39	#include <linux/delay.h>
    40	#include <linux/dma-map-ops.h>
    41	#include <linux/dma-mapping.h>
    42	#include <linux/iommu.h>
    43	#include <linux/mdev.h>
    44	#include <linux/vfio.h>
    45	#include <uapi/linux/elf.h>
    46	#include <linux/crc32.h>
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
