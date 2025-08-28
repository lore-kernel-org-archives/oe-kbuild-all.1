Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC582E06EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 07:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756364945; cv=none; b=t3ES2lAXiRYAke57tFe41xJefPUkwnEcAJW6dQkhohj9xv+ZLojmalxpuo/6jU5DFCz6voS+qCQNRHs1mcZg62iz0deKQnHchGRcsZypbYhxasVUV8lzoprf2ftSVpr0TPZD2ymi5lpAxYNRPhPGik/W6ox/CpUHI2q5Uz9fwmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756364945; c=relaxed/simple;
	bh=64ey5JxpfT5hBo8S7jbx4Xq1Ma99N4/UayyXcIMsBrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mh9kuMKn31o1EfHs8Glnw1bq71K3eN8U6XTxQrBku5/B4xny/nswd+fIM19k0+Cr3QfQDeR0Hme5iCeUxRbi1/oEmUxlOaOyv2+AVXG6DA7Q2asD3XJbj8cU6ClpTSMqCERJ/he1P+OR6cTyFDYgf6NUFonJyzJsVVkmtwfTGrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrvI2p6v; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrvI2p6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756364943; x=1787900943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64ey5JxpfT5hBo8S7jbx4Xq1Ma99N4/UayyXcIMsBrM=;
  b=mrvI2p6vfnZJxlA8VOS0bGBLR4SO6buX0dL51w+bAuIt3+fA+12l3oqA
   mnsWXfyoZOxUG1opBlPZEnVpxM5VWew1QbzmOPE3pVczqNl1k5M9dU8jp
   5Kpve2JvDkvm8eZgakh4cWbOYFXtia9YwULZE6lshS9sWfyq/t1l5f3iw
   mYTxk7eEu9x6mhgCtNUkSZuU8wGGh//lky+YKuDXf9fwdCh+UkHPS+f9V
   5EmSDV2iognqARZtV8Tqxb6EerHra2l5g08ZvB5iaSxiaunXy1GmxeDwn
   M0k6lVW1O40moCK+SEyXg+AFazkhzufUsjnLb/Ypapv8IeDANer/wShqR
   Q==;
X-CSE-ConnectionGUID: NaqcEBC/Qwme3CVAGva8vw==
X-CSE-MsgGUID: CP3ocwxVR0+hVyGJ8XIlFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81217419"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81217419"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 00:09:02 -0700
X-CSE-ConnectionGUID: BNC0BAlbQK+2pC3BbSyVGA==
X-CSE-MsgGUID: h7O86meOTDWhSET4kKjY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174419322"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Aug 2025 00:09:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urWjq-000TT1-2K;
	Thu, 28 Aug 2025 07:08:32 +0000
Date: Thu, 28 Aug 2025 15:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/1]
 drivers/block/virtio_blk_ext.c:111:5: warning: no previous prototype for
 'virtblk_get_ext_feature_bar'
Message-ID: <202508281557.TIcMDgyO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3fe510ec8500eb78ffe2c1a747db0c27d2257130
commit: 1e1321cf169c740a331a59b112643f207c2bf8b2 [0/1] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250828/202508281557.TIcMDgyO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508281557.TIcMDgyO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508281557.TIcMDgyO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/virtio_blk.c:25:
>> drivers/block/virtio_blk_ext.c:111:5: warning: no previous prototype for 'virtblk_get_ext_feature_bar' [-Wmissing-prototypes]
     111 | int virtblk_get_ext_feature_bar(struct virtio_device *vdev, u32 *bar_offset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk_ext.c:155:5: warning: no previous prototype for 'virtblk_get_ext_feature' [-Wmissing-prototypes]
     155 | int virtblk_get_ext_feature(void __iomem *ioaddr, u32 *host_features)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk_ext.c:170:6: warning: no previous prototype for 'virtblk_set_ext_feature' [-Wmissing-prototypes]
     170 | void virtblk_set_ext_feature(void __iomem *ioaddr, u32 guest_ext_features)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c:1807:5: warning: no previous prototype for 'check_ext_feature' [-Wmissing-prototypes]
    1807 | int check_ext_feature(struct virtio_blk *vblk, void __iomem *ioaddr,
         |     ^~~~~~~~~~~~~~~~~


vim +/virtblk_get_ext_feature_bar +111 drivers/block/virtio_blk_ext.c

   110	
 > 111	int virtblk_get_ext_feature_bar(struct virtio_device *vdev, u32 *bar_offset)
   112	{
   113		struct pci_dev *dev = to_vp_device(vdev)->pci_dev;
   114		int cap_len, vsec = 0;
   115		u16 val;
   116		u8 type, len = 0;
   117		bool found = false;
   118	
   119		/* try to find vsc */
   120		for (vsec = pci_find_capability(dev, PCI_CAP_ID_VNDR);
   121			 vsec > 0;
   122			 vsec = pci_find_next_capability(dev, vsec, PCI_CAP_ID_VNDR)) {
   123			pci_read_config_byte(dev, vsec + offsetof(struct virtio_pci_cap, cfg_type), &type);
   124			if (type == PCI_XDRAGON_VSC_CFGTYPE) {
   125				pci_read_config_byte(dev,
   126						vsec + offsetof(struct virtio_pci_cap, cap_len), &len);
   127				cap_len = len;
   128				found = true;
   129				break;
   130			}
   131		}
   132	
   133		/* try to find vsec */
   134		if (!found) {
   135			vsec = 0;
   136			while ((vsec = pci_find_next_ext_capability(dev, vsec,
   137							PCI_EXT_CAP_ID_VNDR))) {
   138				pci_read_config_word(dev, vsec + 0x4, &val);
   139				/* vsec found */
   140				if (val == PCI_EXP_XDRAGON_VSEC_CFGTYPE) {
   141					/* get vsec cap len */
   142					pci_read_config_word(dev, vsec + 0x6, &val);
   143					if ((val & 0xF) != XDRAGON_VSEC_VERSION)
   144						continue;
   145					cap_len = (val >> 4) & (0xFFF);
   146					found = true;
   147					break;
   148				}
   149			}
   150		}
   151	
   152		return found ? xdragon_vcs_find_vsf_bar0_offset(dev, cap_len, vsec, bar_offset) : -1;
   153	}
   154	
 > 155	int virtblk_get_ext_feature(void __iomem *ioaddr, u32 *host_features)
   156	{
   157		int ret;
   158	
   159		/* read ext bar magci number */
   160		ret = ioread32(ioaddr);
   161		if (ret != VIRTIO_PCI_VSF_MAGIC_NUM_VAL)
   162			return -EOPNOTSUPP;
   163	
   164		iowrite32(0, ioaddr + VIRTIO_PCI_HOST_VNDR_SPEC_FEATURE_SELECT);
   165		*host_features = ioread32(ioaddr + VIRTIO_PCI_HOST_VNDR_SPEC_FEATURES);
   166	
   167		return 0;
   168	}
   169	
 > 170	void virtblk_set_ext_feature(void __iomem *ioaddr, u32 guest_ext_features)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
