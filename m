Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845215531B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706544772; cv=none; b=XWNVZZthhk4J2FQRoDlfj1c/jhzPVMDtylrN0MDdmeB/Vj7I+LBRDNjjF88EL5ozDfNfsTm7cyBQheqXDyu6W+CLK6lVS/tERPij5mG1OZ7kz1bKdpqMhcT9426poLFUZWesiXYhpgQl2oeO3qlnQxQ1DXcF9+YZrI9VOb6mibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706544772; c=relaxed/simple;
	bh=B9xD+1uEbxjimCIW8KptBAQXyRAxKjxAMnwtrPWRgT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYzoNCPTmFIvZaoYpApztjzEVJJGPGr2zjKSD6DYYP24RJvPlRr9mrpoc6CQxHO/g4jJtmqHKDUAoZRnQhur35fZch3odwL3cWEMb2GSiq+z0nMIhjO5/DHv6ASl8Llx+fVb7ZmnRZpg6yF3emn1yX/fGRWduojYK9WyT79UIow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L988f5R7; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L988f5R7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706544770; x=1738080770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B9xD+1uEbxjimCIW8KptBAQXyRAxKjxAMnwtrPWRgT8=;
  b=L988f5R7XtQ6hxrC3gQ144EygU0dwCuQdVCGmvK7zjMVOiNJtWrolmBd
   siYVR6ECIji3MYVg069GmVCGxUDbKcfRxtWFmudmN+9iorMmLpWrLfToo
   i9aqDNdgDGTLMAEbRSwqEpdk72yeBsxgVK9UCn/xmj5Zzdhw5UlywNbMk
   5egdanFkvwVtKjZdqa7cZ885ON+0XxyWj28NSB1Jf4H1EXcMmNqlM+2bf
   qoDpmBtdLVPcJDrugrL4KsgkliTmxqIu/hDfXY5EdSHkZKwk1o6TcQ2uI
   IfBE783gCVMDjOnPXfaFN5cywO2qZJ0xcoDje2CyAR7IrZIMKva1moKa1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434167984"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="434167984"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="960935056"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="960935056"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2024 08:12:47 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUUFZ-0004Q4-2D;
	Mon, 29 Jan 2024 16:12:45 +0000
Date: Tue, 30 Jan 2024 00:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1537/26476]
 drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c:1166:12: warning:
 variable 'val' set but not used
Message-ID: <202401300043.Nsn7iPi8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: bdfab89b8dada94f63f56210817f1376c7fd5dca [1537/26476] mt76: update driver from openwrt to include mt7622 wifi
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240130/202401300043.Nsn7iPi8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300043.Nsn7iPi8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300043.Nsn7iPi8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:31,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c:18:
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsb':
   arch/m68k/include/asm/raw_io.h:83:14: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      83 |         ({u8 __w, __v = (b);  u32 _addr = ((u32) (addr)); \
         |              ^~~
   arch/m68k/include/asm/raw_io.h:430:17: note: in expansion of macro 'rom_out_8'
     430 |                 rom_out_8(port, *buf++);
         |                 ^~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw':
   arch/m68k/include/asm/raw_io.h:86:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      86 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:448:17: note: in expansion of macro 'rom_out_be16'
     448 |                 rom_out_be16(port, *buf++);
         |                 ^~~~~~~~~~~~
   arch/m68k/include/asm/raw_io.h: In function 'raw_rom_outsw_swapw':
   arch/m68k/include/asm/raw_io.h:90:15: warning: variable '__w' set but not used [-Wunused-but-set-variable]
      90 |         ({u16 __w, __v = (w); u32 _addr = ((u32) (addr)); \
         |               ^~~
   arch/m68k/include/asm/raw_io.h:466:17: note: in expansion of macro 'rom_out_le16'
     466 |                 rom_out_le16(port, *buf++);
         |                 ^~~~~~~~~~~~
   In file included from include/linux/kernel.h:11,
                    from drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c:17:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:143:9: note: in expansion of macro 'BUG_ON'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   include/linux/scatterlist.h:143:17: note: in expansion of macro 'virt_addr_valid'
     143 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/skbuff.h:15:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/m68k/include/asm/page_mm.h:169:50: warning: ordered comparison of pointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
         |                                                  ^~
   include/asm-generic/bug.h:139:34: note: in definition of macro 'WARN_ON_ONCE'
     139 |         int __ret_warn_once = !!(condition);                    \
         |                                  ^~~~~~~~~
   arch/m68k/include/asm/page_mm.h:170:33: note: in expansion of macro 'virt_addr_valid'
     170 | #define pfn_valid(pfn)          virt_addr_valid(pfn_to_virt(pfn))
         |                                 ^~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:355:26: note: in expansion of macro 'pfn_valid'
     355 |         if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
         |                          ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c: In function 'mt76x0_phy_rf_init':
>> drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c:1166:12: warning: variable 'val' set but not used [-Wunused-but-set-variable]
    1166 |         u8 val;
         |            ^~~
   In file included from drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c:24:
   drivers/net/wireless/mediatek/mt76_new/mt76x0/initvals.h: At top level:
>> drivers/net/wireless/mediatek/mt76_new/mt76x0/initvals.h:226:35: warning: 'mt76x0_dcoc_tab' defined but not used [-Wunused-const-variable=]
     226 | static const struct mt76_reg_pair mt76x0_dcoc_tab[] = {
         |                                   ^~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76_new/mt76x0/initvals.h:94:35: warning: 'mt76x0_bbp_init_tab' defined but not used [-Wunused-const-variable=]
      94 | static const struct mt76_reg_pair mt76x0_bbp_init_tab[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76_new/mt76x0/initvals.h:56:35: warning: 'mt76x0_mac_reg_table' defined but not used [-Wunused-const-variable=]
      56 | static const struct mt76_reg_pair mt76x0_mac_reg_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76_new/mt76x0/initvals.h:22:35: warning: 'common_mac_reg_table' defined but not used [-Wunused-const-variable=]
      22 | static const struct mt76_reg_pair common_mac_reg_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/val +1166 drivers/net/wireless/mediatek/mt76_new/mt76x0/phy.c

  1162	
  1163	static void mt76x0_phy_rf_init(struct mt76x02_dev *dev)
  1164	{
  1165		int i;
> 1166		u8 val;
  1167	
  1168		mt76x0_rf_patch_reg_array(dev, mt76x0_rf_central_tab,
  1169					  ARRAY_SIZE(mt76x0_rf_central_tab));
  1170		mt76x0_rf_patch_reg_array(dev, mt76x0_rf_2g_channel_0_tab,
  1171					  ARRAY_SIZE(mt76x0_rf_2g_channel_0_tab));
  1172		RF_RANDOM_WRITE(dev, mt76x0_rf_5g_channel_0_tab);
  1173		RF_RANDOM_WRITE(dev, mt76x0_rf_vga_channel_0_tab);
  1174	
  1175		for (i = 0; i < ARRAY_SIZE(mt76x0_rf_bw_switch_tab); i++) {
  1176			const struct mt76x0_rf_switch_item *item = &mt76x0_rf_bw_switch_tab[i];
  1177	
  1178			if (item->bw_band == RF_BW_20)
  1179				mt76x0_rf_wr(dev, item->rf_bank_reg, item->value);
  1180			else if (((RF_G_BAND | RF_BW_20) & item->bw_band) ==
  1181				  (RF_G_BAND | RF_BW_20))
  1182				mt76x0_rf_wr(dev, item->rf_bank_reg, item->value);
  1183		}
  1184	
  1185		for (i = 0; i < ARRAY_SIZE(mt76x0_rf_band_switch_tab); i++) {
  1186			if (mt76x0_rf_band_switch_tab[i].bw_band & RF_G_BAND) {
  1187				mt76x0_rf_wr(dev,
  1188					     mt76x0_rf_band_switch_tab[i].rf_bank_reg,
  1189					     mt76x0_rf_band_switch_tab[i].value);
  1190			}
  1191		}
  1192	
  1193		/* Frequency calibration
  1194		 * E1: B0.R22<6:0>: xo_cxo<6:0>
  1195		 * E2: B0.R21<0>: xo_cxo<0>, B0.R22<7:0>: xo_cxo<8:1>
  1196		 */
  1197		mt76x0_rf_wr(dev, MT_RF(0, 22),
  1198			     min_t(u8, dev->cal.rx.freq_offset, 0xbf));
  1199		val = mt76x0_rf_rr(dev, MT_RF(0, 22));
  1200	
  1201		/* Reset procedure DAC during power-up:
  1202		 * - set B0.R73<7>
  1203		 * - clear B0.R73<7>
  1204		 * - set B0.R73<7>
  1205		 */
  1206		mt76x0_rf_set(dev, MT_RF(0, 73), BIT(7));
  1207		mt76x0_rf_clear(dev, MT_RF(0, 73), BIT(7));
  1208		mt76x0_rf_set(dev, MT_RF(0, 73), BIT(7));
  1209	
  1210		/* vcocal_en: initiate VCO calibration (reset after completion)) */
  1211		mt76x0_rf_set(dev, MT_RF(0, 4), 0x80);
  1212	}
  1213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
