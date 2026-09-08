Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A844F530DE7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874501; cv=none; b=dDQWbE7EBlk4PWY/8jL1hVI+anI0NJ0kXpTLN2jACcwSc3p7QwDhOVgYt1DsJ1zT4AwkAjXHTf3nTQ3aLa1ADv3qNHzKERowt7iiAkO7IizKdwXHf+TqZjdV4t13hZnjES+gZdMjIG1ziiucWu00ijVLa6DCV3/bRegzlBRhLfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874501; c=relaxed/simple;
	bh=ouv2lxRurkgC+BwWaDOVL+8z+fJdLPCWC5OyoOEIPoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tykSE6Min8iUjPtMBw3073+7yH6ZWEnqScF2nZ9VhApFPc7yTNJACJKhUqmwwHJ2c7297ajNOZQlXQUXM8+CqPlLvcsMM/fXZk3wE0a7FoQLat1GaKqHH7DpvJ6UV4Ue7mPC5Y5ogboVzFTnIhJw9AT/TEZdUn+quY93mOMRVqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MirerRBt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MirerRBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788874485; x=1820410485;
  h=date:from:to:cc:subject:message-id;
  bh=ouv2lxRurkgC+BwWaDOVL+8z+fJdLPCWC5OyoOEIPoY=;
  b=MirerRBtFDfxDf0f2mFcxa/N0qYtr2/2lrYY+j/GnTmdIfHznx7K98tn
   DfTIJj5lbFNscCgXnVI1xkxdlG7IndXhyf1OduEQcAGlL6Et+hsAOjQSd
   Sbqa6YOrdS1AmoLcAmU6Ov1VPliYRpkd6eacE3q4tTnWqxadgbDpzjQlP
   xX1fC/1n13/K5gs7bF4XFVf7qt+LUAzKtEsBk8n22nN1wpMsnKtJOyMLE
   OxwcI8UFg+GN+2ARj2AfQMAnW0wCyV3nOdwRhyfeswCStNithIB0mn/8e
   Ano7HtRDiom3NQEoEixyiuRTTBa0kmuqf073LTemZ7jPgq9B9wrdRrFlb
   Q==;
X-CSE-ConnectionGUID: j8lDCuG/Qj6V3S1jN4f18g==
X-CSE-MsgGUID: FwIFO4kvRgOlmGgYo1QDaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="112054580"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="112054580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:34:39 -0700
X-CSE-ConnectionGUID: CtMlmoojQvCvHEgmTeFd9Q==
X-CSE-MsgGUID: vgaSqD96SUy5Z8uEvPcmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="300884555"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 08 Sep 2026 06:34:38 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3vy7-000000000iM-2iUf;
	Tue, 08 Sep 2026 13:34:35 +0000
Date: Tue, 08 Sep 2026 15:33:42 +0200
From: kernel test robot <lkp@intel.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/scsi/virtio-scsi-pci-epf.c:1058:34: error: implicit
 declaration of function 'readq'; did you mean 'readl'?
Message-ID: <202609081542.LblEiwhe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/alistair23-gmail-com/virtio_pci-Add-a-quirk-to-force-DMA-Map-API-for-certain-legacy-devices/20260901-114649
head:   3c8cbce2a30d266ce3f5ba5e91de82a74a2ca005
commit: 3c8cbce2a30d266ce3f5ba5e91de82a74a2ca005 scsi: Initial commit of VirtIO PCIe Endpoint Driver
date:   7 days ago
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609081542.LblEiwhe-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081542.LblEiwhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081542.LblEiwhe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/xtensa/include/uapi/asm/byteorder.h:8,
                    from arch/xtensa/include/asm/bitops.h:21,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/configfs.h:22,
                    from drivers/scsi/virtio-scsi-pci-epf.c:15:
   drivers/scsi/virtio-scsi-pci-epf.c: In function 'scsit_pci_epf_read_desc':
>> drivers/scsi/virtio-scsi-pci-epf.c:1058:34: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
    1058 |         desc->addr = cpu_to_le64(readq(p + offsetof(struct vring_desc, addr)));
         |                                  ^~~~~
   include/uapi/linux/swab.h:131:38: note: in definition of macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   include/linux/byteorder/generic.h:86:21: note: in expansion of macro '__cpu_to_le64'
      86 | #define cpu_to_le64 __cpu_to_le64
         |                     ^~~~~~~~~~~~~
   drivers/scsi/virtio-scsi-pci-epf.c:1058:22: note: in expansion of macro 'cpu_to_le64'
    1058 |         desc->addr = cpu_to_le64(readq(p + offsetof(struct vring_desc, addr)));
         |                      ^~~~~~~~~~~
   In file included from drivers/scsi/virtio-scsi-pci-epf.c:23:
   drivers/scsi/virtio-scsi-pci-epf.c: At top level:
   include/linux/pci_ids.h:19:41: warning: unsigned conversion from 'int' to 'unsigned char' changes value from '256' to '0' [-Woverflow]
      19 | #define PCI_CLASS_STORAGE_SCSI          0x0100
         |                                         ^~~~~~
   drivers/scsi/virtio-scsi-pci-epf.c:2642:27: note: in expansion of macro 'PCI_CLASS_STORAGE_SCSI'
    2642 |         .subclass_code  = PCI_CLASS_STORAGE_SCSI,
         |                           ^~~~~~~~~~~~~~~~~~~~~~


vim +1058 drivers/scsi/virtio-scsi-pci-epf.c

  1048	
  1049	static int scsit_pci_epf_read_desc(struct scsit_pci_epf_vq *vq,
  1050					   u16 idx, struct vring_desc *desc)
  1051	{
  1052		void __iomem *p;
  1053	
  1054		if (idx >= vq->depth)
  1055			return -EINVAL;
  1056	
  1057		p = vq->desc_map.virt_addr + (size_t)idx * sizeof(struct vring_desc);
> 1058		desc->addr = cpu_to_le64(readq(p + offsetof(struct vring_desc, addr)));
  1059		desc->len = cpu_to_le32(readl(p + offsetof(struct vring_desc, len)));
  1060		desc->flags = cpu_to_le16(readw(p + offsetof(struct vring_desc, flags)));
  1061		desc->next = cpu_to_le16(readw(p + offsetof(struct vring_desc, next)));
  1062	
  1063		return 0;
  1064	}
  1065	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
