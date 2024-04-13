Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8318B14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712996235; cv=none; b=LtAshiMNkVfiitVr4PGV+b2V9wBOfeiXz9X/karfbkz/O6yRk/QrKtsoKnLhTDLNTRCeoYdGXoSF8XWulGAFaCBjPOIDsQjU1iM8g9YDonJrjoARKvFbpsicvtCZR7bcblVR9tUtYiJpyU0ZUzO531X6WOue1jlhbYocqVlKcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712996235; c=relaxed/simple;
	bh=A5wy1dZtQUSTb9r6sV4p+iQd95WyN5ta1oiRfVgdM2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dVSJALbagy8KQ6T9tbeilNoI5zTVsbFS7GpxKdcxplTGPW7eNWiRDWGLJgypL9fr21h3Hc9q8+XfQG429huKySKzIPHmkW5dKweI6ruF4UpA+J69/XX4BxHiH3brFVBe2ZoFRsni8//MdhMaj6Sufd2+AJIZcIo7l3Azep+C4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtI4Lmr8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtI4Lmr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712996233; x=1744532233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5wy1dZtQUSTb9r6sV4p+iQd95WyN5ta1oiRfVgdM2w=;
  b=QtI4Lmr8GEmpmzlELYlqVmhbqjTHQRK/h34ivMPHaXqkHBogWksyDm0e
   hAijWpt3Zaf9ZuFJUrAx3y2KTitpLlMk4PVeQ3bPjx/2rWsCimff7/CfL
   L0m3JEFy4/REcFnLSm0mSo1twrE2DjIDFIaMou7lCwKTZCynw6uOEWV9f
   h+m6NKUmvvPdbOnGTWgVxkDewjP8S+5vHY/DNH9HCwjLjOd3Ozi+IDe/j
   Q8mT4vfW006RzlokrHeC0I86fa4ExATQtn4/gYYNuDOIuFBQ8v8HJnWKg
   TPsuYol0HDRcZvCbR4oB/7HbOy2Flds/LVREPuWFrYqZZwF7HMIF8h3fI
   w==;
X-CSE-ConnectionGUID: JRZxOdjcSI2S94bK0w6TvA==
X-CSE-MsgGUID: oCS1q2IEQ4+wIr7SIX0qPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8322435"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8322435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 01:17:12 -0700
X-CSE-ConnectionGUID: FUD1cVUDQwqhiAt4irl5kw==
X-CSE-MsgGUID: I9wonlvqR9KKlqPcSpFPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="26000581"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2024 01:17:10 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvYZP-00025s-32;
	Sat, 13 Apr 2024 08:17:07 +0000
Date: Sat, 13 Apr 2024 16:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 6350/30000]
 drivers/net/ethernet/huawei/bma/edma_drv/bma_pci.c:259:14: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202404131639.HIQDnB2q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   535e6a2cffc7554a053cb090ae614da2579bccb4
commit: 915ded04f7e236f1dc52aad0430c8814bd32c793 [6350/30000] Huawei BMA: Adding Huawei BMA driver: host_edma_drv
config: x86_64-randconfig-122-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131639.HIQDnB2q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131639.HIQDnB2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131639.HIQDnB2q-lkp@intel.com/

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
   192			BMA_LOG(DLOG_ERROR,
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
