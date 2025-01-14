Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82362135AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 03:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736824273; cv=none; b=pt3l3Uue/nR9DYIRoaU6MaQk6gT5CQ0EVjeYqi5zCFdpdnHY83RjqFxpPCDtzWtidvWaS7biFwald+bvb8/FppK9FCjfKmffWAdVAHO9S1Pn7qV0zIQKYxF+IU4/joKc7p7jneYoeICJP5TSByzPjUT6oiAlWpwlbBnPbHU0oSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736824273; c=relaxed/simple;
	bh=T33IMd+BxC5ohodZ1iz81b41wfnYDlWwL3qmxAn0TsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYsZXygkq6rFahFZyuNniYle47Im4+CIbKlJbf3KudDoJ8S+ZGfk0Br4P2TrM7+Bq0MDO4O2jSi8H39FCVO8Nxv9UXnObQ2Rzs+Llgm1anZXDoXLfSMRjmiaWHGEjcZ6i9iDLnTlbAjh1MGXziyvCcAjlFm03c9BhLevyBQ3Vkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fa2Q4hca; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fa2Q4hca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736824271; x=1768360271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T33IMd+BxC5ohodZ1iz81b41wfnYDlWwL3qmxAn0TsA=;
  b=fa2Q4hcaFTGbJi4KPsB7bypTWGSe+qcCBaiU2XIcO2bRtbTiz7Ha/Rpo
   PozQGBNK/SqIYXzKrreQPaODmhzy8Z50bABKAA8Y9Ag8OsOsL3NdgtBgN
   caqOdODJ1llstAj7AdEqtv1dR3K1CtmPL3NQl0feNtLmnrwbFyaUSA+NT
   AR8tg1zVMrYzw4IiLex94KJoh1EDO8udSXGoPCv63a0r4+vUQR0jMwajt
   PH42ngc734H4howsKuK7+fx0wfZbzaML+XF0QbUua/j5UBnB7CJzgsjKK
   //YlN7d8Cdcucok6c4+LXHTIif7b6ZSiDyF57grcX+KC/mjqG8hnQXt5e
   w==;
X-CSE-ConnectionGUID: O3wVYOLkRbuQRiwSA8FK2Q==
X-CSE-MsgGUID: B1lru1MfR9KNmxyuMnFRgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="62481341"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="62481341"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 19:11:10 -0800
X-CSE-ConnectionGUID: CL16lWlzSRynBj3L2FwuAA==
X-CSE-MsgGUID: H9Yj1vT7Qa2VU/rSvgkfYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109306814"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2025 19:06:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXXFy-000O37-05;
	Tue, 14 Jan 2025 03:06:18 +0000
Date: Tue, 14 Jan 2025 11:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shay Drory <shayd@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:48:34: warning:
 '%s' directive argument is null
Message-ID: <202501141055.SwfIphN0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c45323b7560ec87c37c729b703c86ee65f136d75
commit: 71e084e26414b0f27d8befa1c30b74d39d9cb2a1 net/mlx5: Allocating a pool of MSI-X vectors for SFs
date:   3 years, 7 months ago
config: mips-randconfig-r015-20230807 (https://download.01.org/0day-ci/archive/20250114/202501141055.SwfIphN0-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141055.SwfIphN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141055.SwfIphN0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:4:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1320:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1320 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1306:27: note: 'mem_section' declared here
    1306 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:17,
                    from include/linux/interrupt.h:6:
   In function 'irq_pool_alloc',
       inlined from 'irq_pools_init' at drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:332:19,
       inlined from 'mlx5_irq_table_create' at drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:437:8:
>> drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:48:34: warning: '%s' directive argument is null [-Wformat-overflow=]
      48 |         dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,             \
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:9: note: in expansion of macro 'dynamic_dev_dbg'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:30: note: in expansion of macro 'dev_fmt'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h:48:9: note: in expansion of macro 'dev_dbg'
      48 |         dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,             \
         |         ^~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:307:9: note: in expansion of macro 'mlx5_core_dbg'
     307 |         mlx5_core_dbg(dev, "pool->name = %s, pool->size = %d, pool->start = %d",
         |         ^~~~~~~~~~~~~


vim +48 drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.h

e126ba97dba9ed Eli Cohen    2013-07-07  46  
5a7883989b1c57 Eli Cohen    2015-10-08  47  #define mlx5_core_dbg(__dev, format, ...)				\
27b942fbbd3107 Parav Pandit 2019-04-29 @48  	dev_dbg((__dev)->device, "%s:%d:(pid %d): " format,		\
9e5b2fc1d39b31 Kamal Heib   2016-12-06  49  		 __func__, __LINE__, current->pid,			\
1a91de28831a1b Joe Perches  2014-05-07  50  		 ##__VA_ARGS__)
e126ba97dba9ed Eli Cohen    2013-07-07  51  

:::::: The code at line 48 was first introduced by commit
:::::: 27b942fbbd3107d4e969ece133925cd646239ef4 net/mlx5: Get rid of storing copy of device name

:::::: TO: Parav Pandit <parav@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
