Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C3F3939BF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954225; cv=none; b=jbpsvZv0L0GBEOYq56U0S1UKBxe9aCQL7Rdfnj6Aza0Pol3aj1yaIDBEDW7ne5ed8zdncpru5x+uD/RgWL62sv3vh4zeZy7BA0W6YLZ8EkfvNTN7JJ7yaTRBpUpAYOpxe3y41VIUlDRU+dV5QpOAdpC6sowMYo9GqdHqhM75ic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954225; c=relaxed/simple;
	bh=skw6RLVwmlVTHEnX+grLcUvpKQOcOXEOcv3qVDdLhvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tECm9/17lWtvAAgOzOH8WFeC1JqIVcaCxTM+aDyZDzy4s2pea4YLg1G5vnlbIDtaDBlvaFak91qV7RO8Bes8pBJaougxXtS0SZFWC8NqY+YwAzYw5PxIbXZWMZA8ouMVpNVDsMOi9hxx5rSkQTybsLZDxblCsP/+VeAb4C8jbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzanMxce; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzanMxce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788954222; x=1820490222;
  h=date:from:to:cc:subject:message-id;
  bh=skw6RLVwmlVTHEnX+grLcUvpKQOcOXEOcv3qVDdLhvo=;
  b=OzanMxceMPf+K3TBv9uFPqV/NgjKQ4wx7n9QryKVsSFgyUFXftbY4HCP
   8corx+29TCKwIFfz4MbweRNFH+xs3wU0gxqGV07nkZCddMxwlL5NIgj72
   qoaF8eKsEqbMmHpk26eVBMuL5tROTTITwecTQTPldZZ7XxLLguL9jSM98
   aZTtrn6cNuuPYeW8YXZzB1Klz+W8+qfmcsIHZRxA+pFc0ils0qss786lG
   aEWO9BpZgVtVzbHh1uiotAEFjxGos5/Yc1NnxNIpxOkcKIFywyckxBeLD
   K/XTvTpDmidku6RZNV1ZfIriH7mR36m+ex+wrFUmla/RqnRHi1GgYnv/X
   Q==;
X-CSE-ConnectionGUID: KSDIMGPOSDmUIb+H3p5IYw==
X-CSE-MsgGUID: S/QV1MqwTjukzeJlhg34GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89245751"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89245751"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 04:43:41 -0700
X-CSE-ConnectionGUID: P9sThkUdT6umkCqd7NLZpA==
X-CSE-MsgGUID: 0V8mr0yDR3G4ZVIPKxwxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="301176349"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Sep 2026 04:43:39 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4GiH-000000006bW-23gu;
	Wed, 09 Sep 2026 11:43:37 +0000
Date: Wed, 09 Sep 2026 13:43:24 +0200
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/scsi/virtio-scsi-pci-epf.c:2642:19: warning:
 implicit conversion from 'int' to 'u8' (aka 'unsigned char') changes value
 from 256 to 0
Message-ID: <202609091342.xK4Hb71Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/alistair23-gmail-com/virtio_pci-Add-a-quirk-to-force-DMA-Map-API-for-certain-legacy-devices/20260901-114649
head:   3c8cbce2a30d266ce3f5ba5e91de82a74a2ca005
commit: 3c8cbce2a30d266ce3f5ba5e91de82a74a2ca005 scsi: Initial commit of VirtIO PCIe Endpoint Driver
date:   8 days ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260909/202609091342.xK4Hb71Q-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091342.xK4Hb71Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609091342.xK4Hb71Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/virtio-scsi-pci-epf.c:2642:19: warning: implicit conversion from 'int' to 'u8' (aka 'unsigned char') changes value from 256 to 0 [-Wconstant-conversion]
    2637 | static struct pci_epf_header scsit_pci_epf_pci_header = {
         |                                                         ~
    2638 |         .vendorid       = PCI_VENDOR_ID_REDHAT_QUMRANET,
    2639 |         .deviceid       = VIRTIO_TRANS_ID_SCSI,
    2640 |         .revid          = VIRTIO_PCI_ABI_VERSION,
    2641 |         .baseclass_code = PCI_BASE_CLASS_STORAGE,
    2642 |         .subclass_code  = PCI_CLASS_STORAGE_SCSI,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci_ids.h:19:33: note: expanded from macro 'PCI_CLASS_STORAGE_SCSI'
      19 | #define PCI_CLASS_STORAGE_SCSI          0x0100
         |                                         ^~~~~~
   1 warning generated.


vim +2642 drivers/scsi/virtio-scsi-pci-epf.c

  2636	
  2637	static struct pci_epf_header scsit_pci_epf_pci_header = {
  2638		.vendorid	= PCI_VENDOR_ID_REDHAT_QUMRANET,
  2639		.deviceid	= VIRTIO_TRANS_ID_SCSI,
  2640		.revid		= VIRTIO_PCI_ABI_VERSION,
  2641		.baseclass_code = PCI_BASE_CLASS_STORAGE,
> 2642		.subclass_code	= PCI_CLASS_STORAGE_SCSI,
  2643		/* This is an invaild vendor ID, but we set it here
  2644		 * to activate the `force_use_map_api` quirk in the
  2645		 * hosts virtio_pci_legacy_probe() function.
  2646		 * This is because we can't set the VIRTIO_F_ACCESS_PLATFORM feature
  2647		 * with a legacy virtio device.
  2648		 */
  2649		.subsys_vendor_id = 0xFFFF,
  2650		.subsys_id	= VIRTIO_ID_SCSI,
  2651		.interrupt_pin	= PCI_INTERRUPT_INTA,
  2652	};
  2653	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
