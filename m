Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52ED1F9F7A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767908786; cv=none; b=eQZzvkWP3Gn5srBErXJjJ0KYre6Up8gV2UifH8Dm8mtEdHYXGSlLOn8uNdWo7uiFV3EoJuO1/g3DGyfZ0ITVV3NXMlti23b2OF9l4mekK1GRP5xX2CdluvxcJ6MFsJLPDEJTsscPNaydrAAaX1IagxrH1zMXnCSaTTsiSWOF874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767908786; c=relaxed/simple;
	bh=+OHsaOWHZmOvSyxq5yQafWjGTHMYMSbuZ4szaGE+G7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HpXyqvvdjpGE5i0dZZNv+s8sOQYDCF8ycdLv9I3ubyuUueWvyXZdWDG2fF9IHMJhvMpS7uF2y6TtLYtiV5sU6XYQcZ/zFoEZDbuqF+RNDcwmMTaTGgelRmBshGs/qR12LXBfE0cVwNL7CRn6n4DPDwvPEy7qnvfnF6RAn7iBdHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3Fv9D9c; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3Fv9D9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767908784; x=1799444784;
  h=date:from:to:cc:subject:message-id;
  bh=+OHsaOWHZmOvSyxq5yQafWjGTHMYMSbuZ4szaGE+G7w=;
  b=K3Fv9D9cWDz/+/UqbcvJhAMh7tmOFqnxIsAA2pJWMlIlg5W5qRLRweQ0
   DxgdGegzY8Tpr4eV2+/txPd/R9zyuoXnCSmNJgz1pd5U0udn3vEgX2wTZ
   8ePlGN+DQeKTBgKQ97GgfqOS2WjtoIPwCUrrKqMhZC7P895bFEHaJQfrz
   v7jf6Y6UH3JrkaN+oE70z2t0PNra3vwF9pWZS3rNl6aHYKyAfMXuH1K8d
   /YJvjjhBgPXSOc1UOy0O8HMtEmFbGJT27SUG9zMIRa4PqlWMZGE1VMO7B
   DGtuRzPT37s9HZYm7ZyQe5YZIo8d5mhdacnps4ki76NfwaZYmwy/8qfge
   w==;
X-CSE-ConnectionGUID: SJZN9p0XTAGih5in71VUgQ==
X-CSE-MsgGUID: GialZ00ATDKSN+PsKhPP0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69368901"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69368901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 13:46:23 -0800
X-CSE-ConnectionGUID: OhtdrCsyQmaBoEPEZSYbzw==
X-CSE-MsgGUID: Oe443LE6SAi5F5JG2OKWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="208359899"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 13:46:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdxpj-000000005BE-1cMD;
	Thu, 08 Jan 2026 21:46:19 +0000
Date: Fri, 09 Jan 2026 05:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Subject: drivers/net/wireless/mediatek/mt76/npu.c:318:23: error:
 implicit declaration of function 'airoha_ppe_dev_setup_tc_block_cb'; did you
 mean 'airoha_ppe_setup_tc_block_cb'?
Message-ID: <202601090517.Fj6v501r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5572ad8fddecd4a0db19801262072ff5916b7589
commit: 377aa17d2aedc98d1c3bbe7e49b22a0c76308b0e wifi: mt76: mt7996: Add NPU offload support to MT7996 driver
date:   6 weeks ago
config: parisc-randconfig-r071-20260109 (https://download.01.org/0day-ci/archive/20260109/202601090517.Fj6v501r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090517.Fj6v501r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090517.Fj6v501r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/npu.c: In function 'mt76_npu_setup_tc_block_cb':
>> drivers/net/wireless/mediatek/mt76/npu.c:318:23: error: implicit declaration of function 'airoha_ppe_dev_setup_tc_block_cb'; did you mean 'airoha_ppe_setup_tc_block_cb'? [-Wimplicit-function-declaration]
     318 |                 err = airoha_ppe_dev_setup_tc_block_cb(ppe_dev, type_data);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       airoha_ppe_setup_tc_block_cb

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +318 drivers/net/wireless/mediatek/mt76/npu.c

7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  302  
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  303  static int mt76_npu_setup_tc_block_cb(enum tc_setup_type type,
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  304  				      void *type_data, void *cb_priv)
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  305  {
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  306  	struct mt76_phy *phy = cb_priv;
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  307  	struct mt76_dev *dev = phy->dev;
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  308  	struct airoha_ppe_dev *ppe_dev;
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  309  	int err = -EOPNOTSUPP;
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  310  
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  311  	if (type != TC_SETUP_CLSFLOWER)
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  312  		return -EOPNOTSUPP;
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  313  
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  314  	mutex_lock(&dev->mutex);
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  315  
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  316  	ppe_dev = rcu_dereference_protected(dev->mmio.ppe_dev, &dev->mutex);
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  317  	if (ppe_dev)
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17 @318  		err = airoha_ppe_dev_setup_tc_block_cb(ppe_dev, type_data);
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  319  
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  320  	mutex_unlock(&dev->mutex);
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  321  
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  322  	return err;
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  323  }
7fb554b1b623c7 Lorenzo Bianconi 2025-10-17  324  

:::::: The code at line 318 was first introduced by commit
:::::: 7fb554b1b623c7da845521604bd05fa9570d07bc wifi: mt76: Introduce the NPU generic layer

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
