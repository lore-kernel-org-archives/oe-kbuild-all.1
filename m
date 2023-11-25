Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363131595
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMNdlxHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700951209; x=1732487209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mm63yYSsUI0P0zYeCJKVwpY8ENNavUo76yFvJoD24RQ=;
  b=OMNdlxHA7dPmOs18iswCAPyo50oJF9geUS17BwXJyEhs9tYArr8ZMet6
   kf/oHAuAf8+feKDLFNewLRjn5HqlLbJzO8JeQeD7/vH8YrcoJZZPz8SoS
   mdNAx5q7OJT9D0eqBhEizn9JnnSWBHY73YCN5nxaUh2w1psmGb+m5yZnX
   fz02JXukEdBgIO43eNsDP5utTM2J03Im/J4uwxowaepSg47ZfDSNFWs19
   QjSJm8MBLAC5qsSc6AX1g1Ho2ms+k0zFKyj1M4ovAoAagTX3m4NR3FZvX
   1TVowtfQ9op6Vs36fW1FH+t9d9iy1jMbOa/85mSvWmZNIBuPybmhcsFb9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389691508"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="389691508"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 14:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="767781164"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="767781164"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Nov 2023 14:26:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r716o-0004Tc-10;
	Sat, 25 Nov 2023 22:26:42 +0000
Date: Sun, 26 Nov 2023 06:26:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jerry Snitselaar <jsnitsel@redhat.com>
Subject: [jgunthorpe:iommu_fwspec 8/41] drivers/acpi/scan.c:1617:9: error:
 incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'int'
Message-ID: <202311260551.tfpGGw9g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   49c7574491cc9c8e8f21a8e8acb635b0e0bdfd61
commit: ddb95b3414746d562f50d36491cbda2826757c4c [8/41] acpi: Do not return struct iommu_ops from acpi_iommu_configure_id()
config: i386-randconfig-141-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260551.tfpGGw9g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260551.tfpGGw9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260551.tfpGGw9g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/scan.c:1617:9: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
           return NULL;
                  ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   1 error generated.


vim +1617 drivers/acpi/scan.c

11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1614  
ddb95b3414746d Jason Gunthorpe       2023-11-03  1615  static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1616  {
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18 @1617  	return NULL;
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1618  }
11a8c5e3a94b12 Jean-Philippe Brucker 2021-06-18  1619  

:::::: The code at line 1617 was first introduced by commit
:::::: 11a8c5e3a94b12848f24d9c63b5c175ce0b80729 ACPI: Move IOMMU setup code out of IORT

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
