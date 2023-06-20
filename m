Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD717AB5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 19:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687288956; x=1718824956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLzteslhLT3ZqeU0FdlOqAisiNJuBIJXPbLarm/HTMM=;
  b=W77s/XEvVz1Xo/789ysizwGW6T8K2MEHym31+W9+nFBuKBXmiazItIf5
   mgOksaAVE6PbcAqf52WeS6vYG8K4wvzAfnbk+a7lMObjdKTJKzSzqwbqu
   ztpMCv9dwEm06e1mJqM/vyZEXTAao5XLASoKYZDwAfAPDmUvwCG2/IYHe
   v8Y8nMvdLmTh9jxC0hSrKlfgIzSO4Ue54nqdByYGJv434GRi0ateVIUuU
   8vOC7NjrpVTNgVbNJgCGwDI5fbDSy7R7aAbqedUkbGVTMONNnQe8G3Swh
   Yw+tpwKwo6W60vWVYO4GiEwiD9QXWV93luX24q+QWNJ0AcJp7QRPSGP06
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349693033"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="349693033"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 12:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717338479"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="717338479"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 12:22:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBgvy-0006BI-0b;
	Tue, 20 Jun 2023 19:22:34 +0000
Date: Wed, 21 Jun 2023 03:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 7/10] ERROR: modpost: "pci_cma_claim_ownership"
 [drivers/vfio/pci/vfio-pci-core.ko] undefined!
Message-ID: <202306210315.9EEK1UfA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   b925f4f202e380732b9dabe062d203b5d5a8296a
commit: 163a42154fb7e38913ab7b80067cd4208fa8be86 [7/10] PCI/CMA: Grant guests exclusive control of authentication
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306210315.9EEK1UfA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210315.9EEK1UfA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210315.9EEK1UfA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pci_cma_claim_ownership" [drivers/vfio/pci/vfio-pci-core.ko] undefined!
>> ERROR: modpost: "pci_cma_return_ownership" [drivers/vfio/pci/vfio-pci-core.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
