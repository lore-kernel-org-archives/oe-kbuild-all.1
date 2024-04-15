Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822BD639
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713142897; cv=none; b=BmWTwbrzXqrohCYrmiyLD4MmdYZc19kWDPquYXydjU2TCO3E4yT5g8TkHAaCRkpDmiK3glfF44tr4P6bMZbMhkxt/I3NttOVhYQIz7R242Oun4Ax8wK33wRV+uPjlto50t/s+h1FkR4wVkP55BgAXn7cEZ0IHIFRd29vHT+6KnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713142897; c=relaxed/simple;
	bh=/BGZe4syBNE4+E3IkYQWJye4l4AmdyOnruS8yiIPatQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agByB9MmqyDEhbXNI4yofVxKEYJj1sIjMFekJWioMG+cU94crser9ZtkbyA6le+0hLgRBY4jIC11Y3aj/CBXwWFNIjvaiq03eVjHPRVIO7QMNZ9Gok7i9TwxQOzUR/NRBzpa48p1VxsM053pSPE/SnY8i90dPQmT5nbIyU8YeHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHAVcu2t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHAVcu2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713142896; x=1744678896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BGZe4syBNE4+E3IkYQWJye4l4AmdyOnruS8yiIPatQ=;
  b=IHAVcu2tZU6vYB1TgQ6gwLM9I6yhIiya7dJhb8SvWjb2H7iGKEy9xoxG
   cwW/nbxLjdtQHqE+BO3rU6oSd6lJJeBzz9K1LLe4hr2VsBG7+ca0zmQ7m
   pevf4zpYi1F8N2Qv8+t5YtVX7ott9w5hwM5nh2vtGkXP9eL/LminFKWJW
   MCtq2hgK3QsRTAniTV8bMJXBGtMx26W7SCyuSDB4ZHnJO0Zz6W9J8J/E/
   /1+0GcTBiu5+lCy/SqygBMSF1Q30cJWa9Uw1TSEKBbeDSoId3UNefXDdJ
   AyZh0bAHk9CjKjfwEaAdJBHKVbIaK//A5zVPw7iMYBqeXLgNi1SqZEEmf
   w==;
X-CSE-ConnectionGUID: abJwuGLvSi21PrUuJ73Ahg==
X-CSE-MsgGUID: hKIpNaYFSGuntMXoHUsVBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8625785"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8625785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 18:01:35 -0700
X-CSE-ConnectionGUID: MATkxTJMQ9u3Wq5HlwdHeA==
X-CSE-MsgGUID: g4Btm49nRpabqthbuygCeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21795150"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2024 18:01:33 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwAio-0003tA-1k;
	Mon, 15 Apr 2024 01:01:22 +0000
Date: Mon, 15 Apr 2024 09:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-r4_mt76_self 28/29]
 drivers/net/wireless/mediatek/mt76/mt7996/init.c:886:5: warning: no previous
 prototype for 'mt7996_get_chip_sku'
Message-ID: <202404150849.4uLPfyYj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-r4_mt76_self
head:   f8d0547c22785a7073256ecd281b7c7c5bd6ad36
commit: 5f76f61ef303d7df2b80016e63ec1bdd7efc2b11 [28/29] mt76: try to add the hw detection function from downstream
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240415/202404150849.4uLPfyYj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404150849.4uLPfyYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404150849.4uLPfyYj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:886:5: warning: no previous prototype for 'mt7996_get_chip_sku' [-Wmissing-prototypes]
     886 | int mt7996_get_chip_sku(struct mt7996_dev *dev)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/init.c: In function 'mt7996_get_chip_sku':
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:934:17: error: too many arguments to function 'mt7996_mcu_get_eeprom'
     934 |                 mt7996_mcu_get_eeprom(dev, MT7976C_EFUSE_OFFSET, buf);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/init.c:11:
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:500:5: note: declared here
     500 | int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset);
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/mt7996_get_chip_sku +886 drivers/net/wireless/mediatek/mt76/mt7996/init.c

   885	
 > 886	int mt7996_get_chip_sku(struct mt7996_dev *dev)
   887	{
   888	#define MT7976C_CHIP_VER	0x8a10
   889	#define MT7976C_HL_CHIP_VER	0x8b00
   890	#define MT7976C_PS_CHIP_VER	0x8c10
   891	#define MT7976C_EFUSE_OFFSET	0x470
   892	#define MT7976C_EFUSE_VALUE	0xc
   893		u32 regval, val = mt76_rr(dev, MT_PAD_GPIO);
   894		u16 adie_chip_id, adie_chip_ver;
   895		u8 adie_comb, adie_num, adie_idx = 0;
   896	
   897		switch (mt76_chip(&dev->mt76)) {
   898		case 0x7990:
   899			if (FIELD_GET(MT_PAD_GPIO_2ADIE_TBTC, val)) {
   900				dev->chip_sku = MT7996_SKU_233;
   901				dev->fem_type = MT7996_FEM_INT;
   902				return 0;
   903			}
   904	
   905			adie_comb = FIELD_GET(MT_PAD_GPIO_ADIE_COMB, val);
   906			if (adie_comb <= 1)
   907				dev->chip_sku = MT7996_SKU_444;
   908			else
   909				dev->chip_sku = MT7996_SKU_404;
   910			break;
   911		case 0x7992:
   912			adie_comb = FIELD_GET(MT_PAD_GPIO_ADIE_COMB_7992, val);
   913			adie_num = FIELD_GET(MT_PAD_GPIO_ADIE_NUM_7992, val);
   914			adie_idx = !adie_num;
   915			if (adie_num)
   916				dev->chip_sku = MT7992_SKU_23;
   917			else if (adie_comb)
   918				dev->chip_sku = MT7992_SKU_44;
   919			else
   920				dev->chip_sku = MT7992_SKU_24;
   921			break;
   922		default:
   923			return -EINVAL;
   924		}
   925	
   926		if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state)) {
   927			u8 buf[MT7996_EEPROM_BLOCK_SIZE];
   928			u8 idx = MT7976C_EFUSE_OFFSET % MT7996_EEPROM_BLOCK_SIZE;
   929			bool is_7976c;
   930	
   931			mt7996_mcu_rf_regval(dev, MT_ADIE_CHIP_ID(adie_idx), &regval, false);
   932			adie_chip_id = FIELD_GET(MT_ADIE_CHIP_ID_MASK, regval);
   933			adie_chip_ver = FIELD_GET(MT_ADIE_VERSION_MASK, regval);
   934			mt7996_mcu_get_eeprom(dev, MT7976C_EFUSE_OFFSET, buf);
   935			is_7976c = (adie_chip_ver == MT7976C_CHIP_VER) ||
   936				   (adie_chip_ver == MT7976C_HL_CHIP_VER) ||
   937				   (adie_chip_ver == MT7976C_PS_CHIP_VER) ||
   938				   (buf[idx] == MT7976C_EFUSE_VALUE);
   939			if (adie_chip_id == 0x7975 || (adie_chip_id == 0x7976 && is_7976c) ||
   940			    adie_chip_id == 0x7979)
   941				dev->fem_type = MT7996_FEM_INT;
   942			else if (adie_chip_id == 0x7977 && adie_comb == 1)
   943				dev->fem_type = MT7996_FEM_MIX;
   944			else
   945				dev->fem_type = MT7996_FEM_EXT;
   946		}
   947	
   948		return 0;
   949	}
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
