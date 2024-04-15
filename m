Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6271360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713148937; cv=none; b=VGfCf781MlvTqzmgDM2op5f6Pl8ib5FZ696ZLL5NlPh4ftfmrdJAHrRz/82lwPtv8w4f0J6umB9xIJxF1O3Dsnx7BQu7SQCws22cPs1/0THwQxc1FyxNLxLY9Mk8+4K3LugD+hi5jgToAuUHwfkW+FVSemYQcRkVGXRAOw107xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713148937; c=relaxed/simple;
	bh=8ezXpFlRY25JislLWpaSJYyxZR/CNWnZgmq8cOFYE6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dSWM+/ZskHaYexDbt4/NzywcAykyk/JvfuGiXi4T1I8dshXIQmN+wmZ81Uw/3JOLpwYcuAb87DsAu+Xo77a9wNB3/91+vUkBUMRzy6rRxY12peoHcXSqnzFU5kjBHKoibg8v2pvvduAZ4QIINfRosYm8tnw1zcV6H78jvRYBPxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6PklzxV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6PklzxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713148936; x=1744684936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ezXpFlRY25JislLWpaSJYyxZR/CNWnZgmq8cOFYE6k=;
  b=L6PklzxVs8U9cIhaWJ0lka7sSvuXU0+5SOOYw8OhsxFDzWlan3Sl1SBH
   PMrJhPUSCUiU98vg02SsG6GtmYEmddhbY2KQxmeHQ5W9UH0xLZFXtv31q
   oLyc9q+8eXA8PhXcZi2q42E3KR78KTEJ+k/rZeyRXmfIR+hlXGprPHmov
   GF3RyoltR5/jfPEA7hx7xRTC489TsxI8etZ3ePI6q1JTKZk/Qus6Nl58V
   VdHutpDMMnSeCBrhBFNQUImJiiZ3HqwGQCYSqAVvgNQwpN6Cqaqjdk+7D
   9gJy6yBNfsLttAGZLC+Q8h6N2pRDqD2oD1qm4fFJ5gi6smqwHRVd4RxRQ
   g==;
X-CSE-ConnectionGUID: VHkiHOCkRvuY0vfcu7Gnxw==
X-CSE-MsgGUID: F3giZE0XSTaWNWC2DebJXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8377062"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8377062"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 19:42:05 -0700
X-CSE-ConnectionGUID: B4TkrFqQS4SqEdGJZ1hb4Q==
X-CSE-MsgGUID: CtaTe4ytTEKZQFhWEZJBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21763960"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2024 19:42:03 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwCID-0003vi-0X;
	Mon, 15 Apr 2024 02:42:01 +0000
Date: Mon, 15 Apr 2024 10:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-r4_mt76_self 28/29]
 drivers/net/wireless/mediatek/mt76/mt7996/init.c:886:5: warning: no previous
 prototype for function 'mt7996_get_chip_sku'
Message-ID: <202404151009.TOKWBTQF-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240415/202404151009.TOKWBTQF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404151009.TOKWBTQF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404151009.TOKWBTQF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt7996/init.c:6:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/init.c:11:
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:268:10: warning: arithmetic between different enumeration types ('enum mt76_rxq_id' and 'enum mt76_mcuq_id') [-Wenum-enum-conversion]
     268 |         u8 q_id[MT7996_MAX_QUEUE];
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:57:41: note: expanded from macro 'MT7996_MAX_QUEUE'
      57 | #define MT7996_MAX_QUEUE                (__MT_RXQ_MAX + __MT_MCUQ_MAX + 3)
         |                                          ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:269:17: warning: arithmetic between different enumeration types ('enum mt76_rxq_id' and 'enum mt76_mcuq_id') [-Wenum-enum-conversion]
     269 |         u32 q_int_mask[MT7996_MAX_QUEUE];
         |                        ^~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:57:41: note: expanded from macro 'MT7996_MAX_QUEUE'
      57 | #define MT7996_MAX_QUEUE                (__MT_RXQ_MAX + __MT_MCUQ_MAX + 3)
         |                                          ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:611:9: warning: arithmetic between different enumeration types ('enum mt76_band_id' and 'enum mt76_mcuq_id') [-Wenum-enum-conversion]
     611 |                                     MT_TXQ_ID(band),
         |                                     ^~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:473:33: note: expanded from macro 'MT_TXQ_ID'
     473 | #define MT_TXQ_ID(q)                            MT_Q_ID(__TXQ(q))
         |                                                 ~~~~~~~~^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:466:22: note: expanded from macro '__TXQ'
     466 | #define __TXQ(q)                                (__RXQ(q) + __MT_RXQ_MAX)
         |                                                  ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:465:26: note: expanded from macro '__RXQ'
     465 | #define __RXQ(q)                                ((q) + __MT_MCUQ_MAX)
         |                                                      ^ ~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:468:35: note: expanded from macro 'MT_Q_ID'
     468 | #define MT_Q_ID(q)                              (dev->q_id[(q)])
         |                                                             ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:613:9: warning: arithmetic between different enumeration types ('enum mt76_band_id' and 'enum mt76_mcuq_id') [-Wenum-enum-conversion]
     613 |                                     MT_TXQ_RING_BASE(band) + hif1_ofs,
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:477:42: note: expanded from macro 'MT_TXQ_RING_BASE'
     477 | #define MT_TXQ_RING_BASE(q)                     (MT_Q_BASE(__TXQ(q)) + 0x300)
         |                                                  ~~~~~~~~~~^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:466:22: note: expanded from macro '__TXQ'
     466 | #define __TXQ(q)                                (__RXQ(q) + __MT_RXQ_MAX)
         |                                                  ^~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:465:26: note: expanded from macro '__RXQ'
     465 | #define __RXQ(q)                                ((q) + __MT_MCUQ_MAX)
         |                                                      ^ ~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/mt7996/regs.h:469:49: note: expanded from macro 'MT_Q_BASE'
     469 | #define MT_Q_BASE(q)                            ((dev->q_wfdma_mask >> (q)) & 0x1 ?     \
         |                                                                         ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:934:52: error: too many arguments to function call, expected 2, have 3
     934 |                 mt7996_mcu_get_eeprom(dev, MT7976C_EFUSE_OFFSET, buf);
         |                 ~~~~~~~~~~~~~~~~~~~~~                            ^~~
   drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:500:5: note: 'mt7996_mcu_get_eeprom' declared here
     500 | int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset);
         |     ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7996/init.c:886:5: warning: no previous prototype for function 'mt7996_get_chip_sku' [-Wmissing-prototypes]
     886 | int mt7996_get_chip_sku(struct mt7996_dev *dev)
         |     ^
   drivers/net/wireless/mediatek/mt76/mt7996/init.c:886:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     886 | int mt7996_get_chip_sku(struct mt7996_dev *dev)
         | ^
         | static 
   10 warnings and 1 error generated.


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
