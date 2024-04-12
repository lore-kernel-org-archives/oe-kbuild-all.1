Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8733997
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712964829; cv=none; b=bpTzKm4oFJXjbT7Z0j+hiljsLJYQg0wxTCUMIR8zG63R3nQhnekOZzJCvEfLv8MIzVMpkmZEuHooawDvABbBy8Vxf5kSO/d2rq4RHB+3Lh7FfjDBJIuKHhbapOV8N/IUdBGLpQwl+puDoFcAswr5ftoVZDXD1wHVJaTLS9gLW/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712964829; c=relaxed/simple;
	bh=Q98oyO3Ztj3IU4XDBanSRE0iOJOvdQMx0gZBclHjRUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FG1ieH+40ETB4bJ79AJiBrz6hCf2P0mNqRwwDCkPGBFSiktU+UnpSar8BtwQtEvKKpTmKysaTJY5uMTMSboz9VsT/jIAJdh4M/vhsrfzfDaLIUhKKTeNoAMKuZi6lBml3x4nqbH1UidFk/mDDBHpUiPtvMEIZCSnA1JlOW1ULVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvVDoWLn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvVDoWLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712964826; x=1744500826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q98oyO3Ztj3IU4XDBanSRE0iOJOvdQMx0gZBclHjRUo=;
  b=WvVDoWLnRxLfXUMTVEKqvMWeqU4+v3ZcQw3nhEj0bVjlhualSneEAZp/
   taCLxaOeWTHMVeUn7ijSscK+wqaSLv7UaIrwZKYUQbxOPE3zrS40LCi2W
   +OkaOsARUV4NtQjKuzh7tyTp9wdyXkzxeI61iebH3Wik/MkQFlmmwjke2
   Ota3YPv78IDxqVr/AFxe6U52PX8/pNFcepeNXKTP6lcrE/6o4wneH3pHK
   5cMnKUjQtfPBhnvQTfJYX4cqpxTcbXU0LA4tqGq7cemqERurMzLaT5fgT
   KpBnuoahgBKo6m/fHoFgAfOJ4LCYcTt+wbor90xKUQgYDAf7/pDcmsV/I
   w==;
X-CSE-ConnectionGUID: v1Apy8qCRBWcoI8a0x/8Rg==
X-CSE-MsgGUID: XvoykIl7TAuwIJqBMpdbvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="12285959"
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="12285959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 16:33:45 -0700
X-CSE-ConnectionGUID: 3h7D2KB8QS6rpaAE3lwXeQ==
X-CSE-MsgGUID: xB4kKV/JTWWsa768nOoPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,197,1708416000"; 
   d="scan'208";a="52544399"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2024 16:33:43 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvQOq-0000zs-38;
	Fri, 12 Apr 2024 23:33:40 +0000
Date: Sat, 13 Apr 2024 07:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6370/30000]
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:259:14: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202404130728.5ZCtL66s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   30b94f5b7f90893f07314da68de8bdafb68bc2b8
commit: 915ded04f7e236f1dc52aad0430c8814bd32c793 [6370/30000] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-randconfig-122-20240413 (https://download.01.org/0day-ci/archive/20240413/202404130728.5ZCtL66s-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404130728.5ZCtL66s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404130728.5ZCtL66s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:450:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:460:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:461:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:67:5: sparse: sparse: symbol 'edma_param_get_statics' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:103:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:114:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:125:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:185:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:192:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:201:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:214:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:251:17: sparse: sparse: Using plain integer as NULL pointer
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:259:14: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:258:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *edma_swap_addr @@     got unsigned char * @@
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:258:37: sparse:     expected void [noderef] __iomem *edma_swap_addr
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:258:37: sparse:     got unsigned char *
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:262:14: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:261:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *veth_swap_addr @@     got unsigned char * @@
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:261:37: sparse:     expected void [noderef] __iomem *veth_swap_addr
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:261:37: sparse:     got unsigned char *
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:282:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:292:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:303:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:316:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:328:5: sparse: sparse: symbol 'pme_pci_enable_msi' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:361:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:375:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:354:5: sparse: sparse: symbol 'pci_device_init' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:399:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:405:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:412:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:383:5: sparse: sparse: symbol 'pci_device_config' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:509:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:513:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:505:12: sparse: sparse: symbol 'bma_pci_init' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:520:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:518:13: sparse: sparse: symbol 'bma_pci_cleanup' was not declared. Should it be static?
--
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:108:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:110:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:131:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:136:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:147:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:254:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:413:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:581:6: sparse: sparse: symbol 'host_dma_transfer_without_list' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:629:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:608:6: sparse: sparse: symbol 'host_dma_transfer_withlist' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:653:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:668:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:708:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:716:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:748:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:754:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:759:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:765:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:777:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:791:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:810:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:852:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:859:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:869:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:876:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:960:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:966:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:996:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1046:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1050:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1061:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1087:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1102:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1126:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1138:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1160:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1162:44: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1165:22: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1166:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1166:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1166:33: sparse:     got unsigned char *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1167:22: sparse:     got unsigned char *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1169:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1175:28: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1181:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1186:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1196:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1200:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1201:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1203:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1217:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1218:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1219:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1227:36: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1272:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1282:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1287:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1299:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1356:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1372:23: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1371:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *edma_send_addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1371:35: sparse:     expected void [noderef] __iomem *edma_send_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1371:35: sparse:     got void *
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *s @@     got void [noderef] __iomem *edma_send_addr @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     expected void *s
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1374:9: sparse:     got void [noderef] __iomem *edma_send_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1377:23: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *edma_recv_addr @@     got void * @@
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse:     expected void [noderef] __iomem *edma_recv_addr
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1376:35: sparse:     got void *
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1380:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1406:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1413:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/huawei/bma/edma_drv/edma_host.c:1442:16: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +259 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c

    99	
   100	void __iomem *kbox_get_base_addr(void)
   101	{
   102		if (!g_bma_pci_dev || (!(g_bma_pci_dev->kbox_base_addr))) {
 > 103			BMA_LOG(DLOG_ERROR, "kbox_base_addr NULL point\n");
   104			return NULL;
   105		}
   106	
   107		return g_bma_pci_dev->kbox_base_addr;
   108	}
   109	EXPORT_SYMBOL_GPL(kbox_get_base_addr);
   110	
   111	unsigned long kbox_get_io_len(void)
   112	{
   113		if (!g_bma_pci_dev) {
 > 114			BMA_LOG(DLOG_ERROR, "kbox_io_len is error,can not get it\n");
   115			return 0;
   116		}
   117	
   118		return g_bma_pci_dev->kbox_base_len;
   119	}
   120	EXPORT_SYMBOL_GPL(kbox_get_io_len);
   121	
   122	unsigned long kbox_get_base_phy_addr(void)
   123	{
   124		if (!g_bma_pci_dev || !g_bma_pci_dev->kbox_base_phy_addr) {
   125			BMA_LOG(DLOG_ERROR, "kbox_base_phy_addr NULL point\n");
   126			return 0;
   127		}
   128	
   129		return g_bma_pci_dev->kbox_base_phy_addr;
   130	}
   131	EXPORT_SYMBOL_GPL(kbox_get_base_phy_addr);
   132	
   133	static struct pci_driver bma_driver = {
   134		.name = PCI_KBOX_MODULE_NAME,
   135		.id_table = bma_pci_tbl,
   136		.probe = bma_pci_probe,
   137		.remove = bma_pci_remove,
   138		.suspend = bma_pci_suspend,
   139		.resume = bma_pci_resume,
   140	};
   141	
   142	s32 __atu_config_H(struct pci_dev *pdev, unsigned int region,
   143			   unsigned int hostaddr_h, unsigned int hostaddr_l,
   144			   unsigned int bmcaddr_h, unsigned int bmcaddr_l,
   145			   unsigned int len)
   146	{
   147		/*  atu index reg,inbound and region*/
   148		(void)pci_write_config_dword(pdev, ATU_VIEWPORT,
   149			REGION_DIR_INPUT + (region & REGION_INDEX_MASK));
   150		(void)pci_write_config_dword(pdev, ATU_BASE_LOW, hostaddr_l);
   151		(void)pci_write_config_dword(pdev, ATU_BASE_HIGH, hostaddr_h);
   152		(void)pci_write_config_dword(pdev, ATU_LIMIT, hostaddr_l + len - 1);
   153		(void)pci_write_config_dword(pdev, ATU_TARGET_LOW, bmcaddr_l);
   154		(void)pci_write_config_dword(pdev, ATU_TARGET_HIGH, bmcaddr_h);
   155		/*  atu ctrl1 reg   */
   156		(void)pci_write_config_dword(pdev, ATU_REGION_CTRL1, ATU_CTRL1_DEFAULT);
   157		/*  atu ctrl2 reg   */
   158		(void)pci_write_config_dword(pdev, ATU_REGION_CTRL2, REGION_ENABLE);
   159	
   160		return 0;
   161	}
   162	
   163	static void iounmap_bar_mem(struct bma_pci_dev_s *bma_pci_dev)
   164	{
   165		if (bma_pci_dev->kbox_base_addr) {
   166			iounmap(bma_pci_dev->kbox_base_addr);
   167			bma_pci_dev->kbox_base_addr = NULL;
   168		}
   169	
   170		if (bma_pci_dev->bma_base_addr) {
   171			iounmap(bma_pci_dev->bma_base_addr);
   172			bma_pci_dev->bma_base_addr = NULL;
   173			bma_pci_dev->edma_swap_addr = NULL;
   174			bma_pci_dev->hostrtc_viraddr = NULL;
   175		}
   176	}
   177	
   178	static int ioremap_pme_bar1_mem(struct pci_dev *pdev,
   179					struct bma_pci_dev_s *bma_pci_dev)
   180	{
   181		unsigned long bar1_resource_flag = 0;
   182		u32 data = 0;
   183	
   184		bma_pci_dev->kbox_base_len = PCI_PME_USEABLE_SPACE;
   185		BMA_LOG(DLOG_DEBUG, "1710\n");
   186	
   187		bma_pci_dev->bma_base_phy_addr =
   188		    pci_resource_start(pdev, PCI_BAR1);
   189		bar1_resource_flag = pci_resource_flags(pdev, PCI_BAR1);
   190	
   191		if (!(bar1_resource_flag & IORESOURCE_MEM)) {
 > 192			BMA_LOG(DLOG_ERROR,
   193				"Cannot find proper PCI device base address, aborting\n");
   194			return -ENODEV;
   195		}
   196	
   197		bma_pci_dev->bma_base_len = pci_resource_len(pdev, PCI_BAR1);
   198		bma_pci_dev->edma_swap_len = EDMA_SWAP_DATA_SIZE;
   199		bma_pci_dev->veth_swap_len = VETH_SWAP_DATA_SIZE;
   200	
   201		BMA_LOG(DLOG_DEBUG,
   202			"bar1: bma_base_len = 0x%lx, edma_swap_len = %ld, veth_swap_len = %ld(0x%lx)\n",
   203			bma_pci_dev->bma_base_len, bma_pci_dev->edma_swap_len,
   204			bma_pci_dev->veth_swap_len, bma_pci_dev->veth_swap_len);
   205	
   206		bma_pci_dev->hostrtc_phyaddr = bma_pci_dev->bma_base_phy_addr;
   207		/* edma */
   208		bma_pci_dev->edma_swap_phy_addr =
   209			bma_pci_dev->bma_base_phy_addr + EDMA_SWAP_BASE_OFFSET;
   210		/* veth */
   211		bma_pci_dev->veth_swap_phy_addr =
   212			bma_pci_dev->edma_swap_phy_addr + EDMA_SWAP_DATA_SIZE;
   213	
   214		BMA_LOG(DLOG_DEBUG,
   215			"bar1: hostrtc_phyaddr = 0x%lx, edma_swap_phy_addr = 0x%lx, veth_swap_phy_addr = 0x%lx\n",
   216			bma_pci_dev->hostrtc_phyaddr,
   217			bma_pci_dev->edma_swap_phy_addr,
   218			bma_pci_dev->veth_swap_phy_addr);
   219	
   220		__atu_config_H(pdev, 0,
   221			       GET_HIGH_ADDR(bma_pci_dev->kbox_base_phy_addr),
   222				(bma_pci_dev->kbox_base_phy_addr & 0xffffffff),
   223			0, PCI_BAR0_PME_1710, PCI_PME_USEABLE_SPACE);
   224	
   225		__atu_config_H(pdev, 1,
   226			       GET_HIGH_ADDR(bma_pci_dev->hostrtc_phyaddr),
   227				(bma_pci_dev->hostrtc_phyaddr & 0xffffffff),
   228				0, HOSTRTC_REG_BASE, HOSTRTC_REG_SIZE);
   229	
   230		__atu_config_H(pdev, 2,
   231			       GET_HIGH_ADDR(bma_pci_dev->edma_swap_phy_addr),
   232				(bma_pci_dev->edma_swap_phy_addr & 0xffffffff),
   233				0, EDMA_SWAP_DATA_BASE, EDMA_SWAP_DATA_SIZE);
   234	
   235		__atu_config_H(pdev, 3,
   236			       GET_HIGH_ADDR(bma_pci_dev->veth_swap_phy_addr),
   237				(bma_pci_dev->veth_swap_phy_addr & 0xffffffff),
   238				0, VETH_SWAP_DATA_BASE, VETH_SWAP_DATA_SIZE);
   239	
   240		if (bar1_resource_flag & IORESOURCE_CACHEABLE) {
   241			bma_pci_dev->bma_base_addr =
   242			    ioremap(bma_pci_dev->bma_base_phy_addr,
   243				    bma_pci_dev->bma_base_len);
   244		} else {
   245			bma_pci_dev->bma_base_addr =
   246			    IOREMAP(bma_pci_dev->bma_base_phy_addr,
   247				    bma_pci_dev->bma_base_len);
   248		}
   249	
   250		if (!bma_pci_dev->bma_base_addr) {
   251			BMA_LOG(DLOG_ERROR,
   252				"Cannot map device registers, aborting\n");
   253	
   254			return -ENODEV;
   255		}
   256	
   257		bma_pci_dev->hostrtc_viraddr = bma_pci_dev->bma_base_addr;
 > 258		bma_pci_dev->edma_swap_addr =
 > 259		    (unsigned char *)bma_pci_dev->bma_base_addr +
   260		    EDMA_SWAP_BASE_OFFSET;
 > 261		bma_pci_dev->veth_swap_addr =
   262		    (unsigned char *)bma_pci_dev->edma_swap_addr +
   263		    EDMA_SWAP_DATA_SIZE;
   264	
   265		(void)pci_read_config_dword(pdev, 0x78, &data);
   266		data = data & 0xfffffff0;
   267		(void)pci_write_config_dword(pdev, 0x78, data);
   268		(void)pci_read_config_dword(pdev, 0x78, &data);
   269	
   270		return 0;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
