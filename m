Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E54A35
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 02:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766110849; cv=none; b=PDW5/3VXj+0msOgZ5kHyIK2+Yl3HiuiDP65gYpRrPxADld1u604U867JYHUk8Xw1YFj3EdWGvJpR0ILdNVfRJES2WYOJ4ivjIHmVuCAuhffeS8vT+7TV+qPUCe73dPf8bhLHqM38CMLyrq+pKGWyCj+AJ7bFfYDmnCj44w6y+KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766110849; c=relaxed/simple;
	bh=ch2iD/MZoqYJk30w4KzSQwbrkPl4zYRqD+g4RsqMFb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n95qlGyXwUb0hiOycCUK/8qcf0d/fJASU1Ix3nuaD12s0r3pAHfWoUQawbBqa9oXlxYi+Nq4ZNPHS4i2aIoUsiH+VqCszA4etZselOscFvl0F14ttd0STRFT48wR8Fl2MpiqHT6qvphc+Xx7JcAglNulI60DwJc2l8IdDQeabwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKd8kcV3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKd8kcV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766110846; x=1797646846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ch2iD/MZoqYJk30w4KzSQwbrkPl4zYRqD+g4RsqMFb8=;
  b=GKd8kcV37zxAHqwrpl7bo3oR35kR1tW381KGDr2hnwPUTw1I2qL46IsZ
   74ZSvH+Rnsit0/2qoSmhsGQV6ER26RlTIkcdZLesQ5uXlBBkuCZHPyFjf
   2d/bMK6CK6i+rsRYU4ugn2GNPEFT0fHLMpnY0EFjM216gffH/Xe7S4wya
   TXDM8AcTCLSupF1scDunpp6vFmrSXodRlRaRs6LFbyOnVKc2Ch92f7BFs
   LeTtgRMm8xtpUlqtsTj9leM0CsCdPnFV7IoY+VLstG15i3+KpD0VZvEDq
   qExu6uz4Hga7+gy90hA4vf901OJnR4/Qwk+gbxGIwJp3lf70uJ1eZd76p
   w==;
X-CSE-ConnectionGUID: bpTpOM6uT9q5XIea9WWlHw==
X-CSE-MsgGUID: HaZ6+178QwmyBXqQN6/N5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90730413"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="90730413"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:20:43 -0800
X-CSE-ConnectionGUID: oBcLMbquTZ6tG9KrS2IBrQ==
X-CSE-MsgGUID: p2BeY44jSW69VevA1F65gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="236164057"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2025 18:20:43 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWQ6i-000000002td-04KP;
	Fri, 19 Dec 2025 02:20:40 +0000
Date: Fri, 19 Dec 2025 10:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/block/virtio_blk_ext.c:111:5: warning: no previous prototype for
 'virtblk_get_ext_feature_bar'
Message-ID: <202512191046.QiiimbH9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 7a001416425efc00ef3093e3bec76674cc7aa44b [11/11] anolis: virtio-blk: add ext_feature negotiation method and ring-pair feature bit
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512191046.QiiimbH9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191046.QiiimbH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191046.QiiimbH9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/virtio_blk.c:25:
>> drivers/block/virtio_blk_ext.c:111:5: warning: no previous prototype for 'virtblk_get_ext_feature_bar' [-Wmissing-prototypes]
     111 | int virtblk_get_ext_feature_bar(struct virtio_device *vdev, u32 *bar_offset)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk_ext.c:155:5: warning: no previous prototype for 'virtblk_get_ext_feature' [-Wmissing-prototypes]
     155 | int virtblk_get_ext_feature(void __iomem *ioaddr, u32 *host_features)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk_ext.c:170:6: warning: no previous prototype for 'virtblk_set_ext_feature' [-Wmissing-prototypes]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
