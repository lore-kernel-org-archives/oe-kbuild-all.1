Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F901BDCF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732763695; cv=none; b=NpHHbUMmUBxPxAMud+QY0xTXSg6UaYaTs+15/VM3QD6K9AUbusO3VAR8aBTLu2xJL6iHHtDWtjNmRqsXAY6d275BoIydeEjdpoFgKNNydKiGzuWmfRvkXPv/GwIso3KAkA/zx4OCvD8bUyekDehGS/TP6e3fza4NeoTnqIBAVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732763695; c=relaxed/simple;
	bh=6W2ANXm6tuZOBts+Ed27h3+ILnE4HknBuEb9qXS7te8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t/1ojQXwrOHelayGIB6GBb/mC+avWlgr+9/t0Qj5ZxaD38XkoUPvG93TcwbBfd0eC2h+e3rBDoOKHATe4AT8VuLKkh/lhrIXx8XL1Kodz/HrgKSFWV51bo5tR6HFGVQxVMjb5vIy/JqFOyj9NH17SmEPk8Jpm2G9MGqP2XrNUNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMuB8bKJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMuB8bKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732763693; x=1764299693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6W2ANXm6tuZOBts+Ed27h3+ILnE4HknBuEb9qXS7te8=;
  b=UMuB8bKJrvPQj+JKn7KpCTU4oqjl0hSMwUUau618VSDyr7KRX0HbiC2I
   O2wOc1p9BmpVXkiAjrZT9pjYO6qw/Ih75tzqwEcWXUXBcpIZ88o8m0Fhv
   Xx71DwjjPExpkq5spvX9GCY4OJ6bRDY6gC9SARt4+qZbq7VXlOMXKO3rN
   THzSbQSk8F7AZ7Sq5T5s3cdOB3SG1+epmKoBIqZysD08xqeKMCX5oThQr
   HZIYSNXpVF2xjIqC1k5uqrABQ+gXn1fvA6NlH1iZV11a7vOQfpxD27nG2
   pgNx7AeebIlWmZDtl4NzZqPbdNBJLiXJYuJCQrO2NIXmgAyH87PRIrrYO
   g==;
X-CSE-ConnectionGUID: d3b5o5nVT/O4PN81o+ilKg==
X-CSE-MsgGUID: lnrKCf2jTsmAYctnPWrzmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32919600"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="32919600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 19:14:52 -0800
X-CSE-ConnectionGUID: 064eqC2zRXGJ+cZuWvfOng==
X-CSE-MsgGUID: DaLnOcIrQ3axxugny2SmyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="92507413"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 19:14:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGUzR-0008p9-0e;
	Thu, 28 Nov 2024 03:14:49 +0000
Date: Thu, 28 Nov 2024 11:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] vpu_drv.c:(.bss+0x10): multiple
 definition of `debug';
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:bma_pci.c:(.bss+0x8):
 first defined here
Message-ID: <202411281141.UreVXsMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huajingjing,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: f0db1bf5852542c46c16d0b305193069e265f769 [1540/1540] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241128/202411281141.UreVXsMU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281141.UreVXsMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281141.UreVXsMU-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnp/rnp_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_main.o: in function `.LANCHOR3':
   rnpm_main.c:(.bss+0x110): multiple definition of `mpe_pkt_version'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.bss+0x60): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_main.o: in function `.LANCHOR3':
   rnpm_main.c:(.bss+0x114): multiple definition of `mpe_src_port'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.bss+0x64): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_pcs.o:(.data.rel.local+0x0): multiple definition of `pcs_ops_generic'; drivers/net/ethernet/mucse/rnp/rnp_pcs.o:(.data.rel.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpm/rnpm_ptp.o: in function `.LANCHOR1':
   rnpm_ptp.c:(.data.rel.ro.local+0x0): multiple definition of `mac_ptp'; drivers/net/ethernet/mucse/rnp/rnp_ptp.o:rnp_ptp.c:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.o: in function `.LANCHOR7':
   rnpgbe_main.c:(.data.rel.ro+0x0): multiple definition of `rnp10_netdev_ops'; drivers/net/ethernet/mucse/rnp/rnp_main.o:rnp_main.c:(.data.rel.ro+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.o:(.data.rel.local+0x0): multiple definition of `mbx_ops_generic'; drivers/net/ethernet/intel/ixgbe/ixgbe_mbx.o:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.o: in function `mbx_cookie_zalloc':
   rnpgbe_mbx_fw.c:(.text+0x128): multiple definition of `mbx_cookie_zalloc'; drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.o:rnpm_mbx_fw.c:(.text+0x6a4): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.o: in function `check_ari_mode':
   rnpgbe_sriov.c:(.text+0x2acc): multiple definition of `check_ari_mode'; drivers/net/ethernet/mucse/rnp/rnp_sriov.o:rnp_sriov.c:(.text+0x2af8): first defined here
   loongarch64-linux-ld: drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ptp.o: in function `.LANCHOR1':
   rnpgbe_ptp.c:(.data.rel.ro.local+0x0): multiple definition of `mac_ptp'; drivers/net/ethernet/mucse/rnp/rnp_ptp.o:rnp_ptp.c:(.data.rel.ro.local+0x0): first defined here
   loongarch64-linux-ld: drivers/media/platform/amphion/vpu_drv.o: in function `.LANCHOR2':
>> vpu_drv.c:(.bss+0x10): multiple definition of `debug'; drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.o:bma_pci.c:(.bss+0x8): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
