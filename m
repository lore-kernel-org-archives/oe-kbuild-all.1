Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A61EEA3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258474; cv=none; b=fZKg5fK7gxcTd32a6+wEM6+agqAHfTtgWFq7VGPSaCaJY7zOSVG5b/iqTJZEr11OEmCyu6FugKiBhUgAa+Ndi2045SZHpi/EvMsr79hutKjP2wnYLXeI7GUveYo7QuIY2+w++eZaiLmS0nMcTUla+yFzkrZagxkHmZwJrx9uk+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258474; c=relaxed/simple;
	bh=9cljiz+hF/J3yRpMsxyASsQfff/o/uCBSbtAbrVUmNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3q7bDMBm8lKcyl8iaYN/mV4aUdb39uH6b0kLlap5TF8sf+i5GI+ml+wf//M2CPgBrmkToW6asP0y1TImjECJgSQp02lYEqNEJfwOJ9Z+1xnXg8f0Emv3GaaNrRmG+pMRYLSiH1sjOsnCJLxqmmzSLEO3ura66eqQqhShFbk8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NL/BLkjF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NL/BLkjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738258472; x=1769794472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9cljiz+hF/J3yRpMsxyASsQfff/o/uCBSbtAbrVUmNY=;
  b=NL/BLkjFdUaYbgmPz8iic2jg7Ttz3bVqzmVKgDzogQ6EkxuOjlPpLBvw
   3jb3L+IDPv14ifsI6Q8P0mTAPyNDbxElgT7cVQRAxAAYTOb+1fVBqG2um
   Q12NDLVG8G5FqaFn5evhuo2DB3roXfhioqjph33ZF7i3cgth6DKmuNS5a
   GsCmZErmMg4Qv2uNTiA355gxruP/6mkL0z2K4ZgXQP/q2iXdFZ1s+UTRU
   xvKX4TSQecEviwoywDjSCdQdyUVJAHs0+LuK+OLY0MkSgaXrUNLXIe01h
   CoKx9zqiIQ2d5l2LaDcw5LkpuSwtHGmYF9Pl1sdntsOOoi5edn+P6Pqgf
   w==;
X-CSE-ConnectionGUID: tlvRi6lSToe7rCN8bEQfYQ==
X-CSE-MsgGUID: J+LjD2j5R0+EWU9eS+2C2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49408209"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="49408209"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 09:34:31 -0800
X-CSE-ConnectionGUID: NDkoOywkSBKa+xCv4Qi/Eg==
X-CSE-MsgGUID: qeX7dYZ2Sn21ww3ogzqwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132662714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jan 2025 09:34:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdYQu-000klR-1h;
	Thu, 30 Jan 2025 17:34:28 +0000
Date: Fri, 31 Jan 2025 01:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/um-io 3/3] drivers/pci/quirks.c:3724:22:
 error: implicit declaration of function 'ioread32be'
Message-ID: <202501310118.ohSkxgLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/um-io
head:   1e7aceb3e7b5d015e6778e77383db706a4ae066b
commit: 1e7aceb3e7b5d015e6778e77383db706a4ae066b [3/3] iomap: Fix -Wmissing-prototypes on UM
config: m68k-m5475evb_defconfig (https://download.01.org/0day-ci/archive/20250131/202501310118.ohSkxgLk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310118.ohSkxgLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310118.ohSkxgLk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/quirks.c: In function 'mellanox_check_broken_intx_masking':
>> drivers/pci/quirks.c:3724:22: error: implicit declaration of function 'ioread32be' [-Wimplicit-function-declaration]
    3724 |         fw_maj_min = ioread32be(fw_ver);
         |                      ^~~~~~~~~~
   drivers/pci/quirks.c: In function 'reset_ivb_igd':
>> drivers/pci/quirks.c:3954:9: error: implicit declaration of function 'iowrite32'; did you mean 'gf_iowrite32'? [-Wimplicit-function-declaration]
    3954 |         iowrite32(0x00000002, mmio_base + MSG_CTL);
         |         ^~~~~~~~~
         |         gf_iowrite32
>> drivers/pci/quirks.c:3964:15: error: implicit declaration of function 'ioread32'; did you mean 'gf_ioread32'? [-Wimplicit-function-declaration]
    3964 |         val = ioread32(mmio_base + PCH_PP_CONTROL) & 0xfffffffe;
         |               ^~~~~~~~
         |               gf_ioread32
   drivers/pci/quirks.c: In function 'reset_hinic_vf_dev':
>> drivers/pci/quirks.c:4180:9: error: implicit declaration of function 'iowrite32be' [-Wimplicit-function-declaration]
    4180 |         iowrite32be(val, bar + HINIC_VF_OP);
         |         ^~~~~~~~~~~
   drivers/pci/quirks.c: In function 'quirk_switchtec_ntb_dma_alias':
>> drivers/pci/quirks.c:5843:21: error: implicit declaration of function 'ioread8'; did you mean 'readb'? [-Wimplicit-function-declaration]
    5843 |         partition = ioread8(&mmio_ntb->partition_id);
         |                     ^~~~~~~
         |                     readb
>> drivers/pci/quirks.c:5861:28: error: implicit declaration of function 'ioread16' [-Wimplicit-function-declaration]
    5861 |                 table_sz = ioread16(&mmio_peer_ctrl->req_id_table_size);
         |                            ^~~~~~~~


vim +/ioread32be +3724 drivers/pci/quirks.c

1600f62534b7b3 Noa Osherovich   2016-11-15  3676  
1600f62534b7b3 Noa Osherovich   2016-11-15  3677  /*
1600f62534b7b3 Noa Osherovich   2016-11-15  3678   * Check ConnectX-4/LX FW version to see if it supports legacy interrupts.
1600f62534b7b3 Noa Osherovich   2016-11-15  3679   * If so, don't mark it as broken.
1600f62534b7b3 Noa Osherovich   2016-11-15  3680   * FW minor > 99 means older FW version format and no INTx masking support.
1600f62534b7b3 Noa Osherovich   2016-11-15  3681   * FW minor < 14 means new FW version format and no INTx masking support.
1600f62534b7b3 Noa Osherovich   2016-11-15  3682   */
d76d2fe05fd936 Noa Osherovich   2016-11-15  3683  static void mellanox_check_broken_intx_masking(struct pci_dev *pdev)
d76d2fe05fd936 Noa Osherovich   2016-11-15  3684  {
1600f62534b7b3 Noa Osherovich   2016-11-15  3685  	__be32 __iomem *fw_ver;
1600f62534b7b3 Noa Osherovich   2016-11-15  3686  	u16 fw_major;
1600f62534b7b3 Noa Osherovich   2016-11-15  3687  	u16 fw_minor;
1600f62534b7b3 Noa Osherovich   2016-11-15  3688  	u16 fw_subminor;
1600f62534b7b3 Noa Osherovich   2016-11-15  3689  	u32 fw_maj_min;
1600f62534b7b3 Noa Osherovich   2016-11-15  3690  	u32 fw_sub_min;
d76d2fe05fd936 Noa Osherovich   2016-11-15  3691  	int i;
d76d2fe05fd936 Noa Osherovich   2016-11-15  3692  
d76d2fe05fd936 Noa Osherovich   2016-11-15  3693  	for (i = 0; i < ARRAY_SIZE(mellanox_broken_intx_devs); i++) {
d76d2fe05fd936 Noa Osherovich   2016-11-15  3694  		if (pdev->device == mellanox_broken_intx_devs[i]) {
d76d2fe05fd936 Noa Osherovich   2016-11-15  3695  			pdev->broken_intx_masking = 1;
d76d2fe05fd936 Noa Osherovich   2016-11-15  3696  			return;
d76d2fe05fd936 Noa Osherovich   2016-11-15  3697  		}
d76d2fe05fd936 Noa Osherovich   2016-11-15  3698  	}
1600f62534b7b3 Noa Osherovich   2016-11-15  3699  
82e1719c4cd65b Bjorn Helgaas    2018-05-02  3700  	/*
82e1719c4cd65b Bjorn Helgaas    2018-05-02  3701  	 * Getting here means Connect-IB cards and up. Connect-IB has no INTx
1600f62534b7b3 Noa Osherovich   2016-11-15  3702  	 * support so shouldn't be checked further
1600f62534b7b3 Noa Osherovich   2016-11-15  3703  	 */
1600f62534b7b3 Noa Osherovich   2016-11-15  3704  	if (pdev->device == PCI_DEVICE_ID_MELLANOX_CONNECTIB)
1600f62534b7b3 Noa Osherovich   2016-11-15  3705  		return;
1600f62534b7b3 Noa Osherovich   2016-11-15  3706  
1600f62534b7b3 Noa Osherovich   2016-11-15  3707  	if (pdev->device != PCI_DEVICE_ID_MELLANOX_CONNECTX4 &&
1600f62534b7b3 Noa Osherovich   2016-11-15  3708  	    pdev->device != PCI_DEVICE_ID_MELLANOX_CONNECTX4_LX)
1600f62534b7b3 Noa Osherovich   2016-11-15  3709  		return;
1600f62534b7b3 Noa Osherovich   2016-11-15  3710  
1600f62534b7b3 Noa Osherovich   2016-11-15  3711  	/* For ConnectX-4 and ConnectX-4LX, need to check FW support */
1600f62534b7b3 Noa Osherovich   2016-11-15  3712  	if (pci_enable_device_mem(pdev)) {
7506dc79899332 Frederick Lawler 2018-01-18  3713  		pci_warn(pdev, "Can't enable device memory\n");
1600f62534b7b3 Noa Osherovich   2016-11-15  3714  		return;
1600f62534b7b3 Noa Osherovich   2016-11-15  3715  	}
1600f62534b7b3 Noa Osherovich   2016-11-15  3716  
1600f62534b7b3 Noa Osherovich   2016-11-15  3717  	fw_ver = ioremap(pci_resource_start(pdev, 0), 4);
1600f62534b7b3 Noa Osherovich   2016-11-15  3718  	if (!fw_ver) {
7506dc79899332 Frederick Lawler 2018-01-18  3719  		pci_warn(pdev, "Can't map ConnectX-4 initialization segment\n");
1600f62534b7b3 Noa Osherovich   2016-11-15  3720  		goto out;
1600f62534b7b3 Noa Osherovich   2016-11-15  3721  	}
1600f62534b7b3 Noa Osherovich   2016-11-15  3722  
1600f62534b7b3 Noa Osherovich   2016-11-15  3723  	/* Reading from resource space should be 32b aligned */
1600f62534b7b3 Noa Osherovich   2016-11-15 @3724  	fw_maj_min = ioread32be(fw_ver);
1600f62534b7b3 Noa Osherovich   2016-11-15  3725  	fw_sub_min = ioread32be(fw_ver + 1);
1600f62534b7b3 Noa Osherovich   2016-11-15  3726  	fw_major = fw_maj_min & 0xffff;
1600f62534b7b3 Noa Osherovich   2016-11-15  3727  	fw_minor = fw_maj_min >> 16;
1600f62534b7b3 Noa Osherovich   2016-11-15  3728  	fw_subminor = fw_sub_min & 0xffff;
1600f62534b7b3 Noa Osherovich   2016-11-15  3729  	if (fw_minor > CONNECTX_4_CURR_MAX_MINOR ||
1600f62534b7b3 Noa Osherovich   2016-11-15  3730  	    fw_minor < CONNECTX_4_INTX_SUPPORT_MINOR) {
7506dc79899332 Frederick Lawler 2018-01-18  3731  		pci_warn(pdev, "ConnectX-4: FW %u.%u.%u doesn't support INTx masking, disabling. Please upgrade FW to %d.14.1100 and up for INTx support\n",
1600f62534b7b3 Noa Osherovich   2016-11-15  3732  			 fw_major, fw_minor, fw_subminor, pdev->device ==
1600f62534b7b3 Noa Osherovich   2016-11-15  3733  			 PCI_DEVICE_ID_MELLANOX_CONNECTX4 ? 12 : 14);
1600f62534b7b3 Noa Osherovich   2016-11-15  3734  		pdev->broken_intx_masking = 1;
1600f62534b7b3 Noa Osherovich   2016-11-15  3735  	}
1600f62534b7b3 Noa Osherovich   2016-11-15  3736  
1600f62534b7b3 Noa Osherovich   2016-11-15  3737  	iounmap(fw_ver);
1600f62534b7b3 Noa Osherovich   2016-11-15  3738  
1600f62534b7b3 Noa Osherovich   2016-11-15  3739  out:
1600f62534b7b3 Noa Osherovich   2016-11-15  3740  	pci_disable_device(pdev);
d76d2fe05fd936 Noa Osherovich   2016-11-15  3741  }
d76d2fe05fd936 Noa Osherovich   2016-11-15  3742  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_MELLANOX, PCI_ANY_ID,
d76d2fe05fd936 Noa Osherovich   2016-11-15  3743  			mellanox_check_broken_intx_masking);
d76d2fe05fd936 Noa Osherovich   2016-11-15  3744  

:::::: The code at line 3724 was first introduced by commit
:::::: 1600f62534b7b3da7978b43b52231a54c24df287 PCI: Support INTx masking on ConnectX-4 with firmware x.14.1100+

:::::: TO: Noa Osherovich <noaos@mellanox.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
