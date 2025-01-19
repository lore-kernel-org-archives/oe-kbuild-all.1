Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AEA2F29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737281306; cv=none; b=Kc5wFPGW97fatmGG9uVF4zSsAHuWiPyMJrGaa6nUMFkw4DrtN5g3laync2jszgdNnFqvtSHX5Se71TXNu6u8UchxAVu0lZzM5hHaOH1NGYHtBjgZBeyknXwK0o1o6CpzIo8oTDQ1ri0rJ0exqVhCZroxzCHX1DjLxx38sLlIwRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737281306; c=relaxed/simple;
	bh=VKLzXZUi9ps934R/Xdp7fQbO3IvpeBk+elUIif6SabQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kpmko5n2zdpHAIA3TQd9nQNpUzd+hcjhN+OowydI/X7S15sLj3WfgnHsBfm72hR0YbLGP/BONLZ2HkiLbL6BRa+tzn9tTOyXTBRT0PbEtPuG0EzTExl0NlICgPnpOJB5LLF3pLT/gyuQYPTRFXHFmHirLURgsYyCrCu5OaeYkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CInMxR+3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CInMxR+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737281304; x=1768817304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKLzXZUi9ps934R/Xdp7fQbO3IvpeBk+elUIif6SabQ=;
  b=CInMxR+3eqimouvV7YrTT4Sj4FzAdW5Y45ojhme4AD3dJxdPqnTIGNAE
   jAwdgd8joUMb5q/J+wi97y0xsaEnxQeJUmFYkWxatG1pEZ/d3Fw5XrEob
   mXD6aB8YmfmrahjFj3p2n6SV65AnzI099iIOiW5+UEx8ubWVMNEDGt8ft
   pWf5d2/DJDUImmo2nh7sL7hK9bzv0XWf4u8K7Jk/+r2yHb+/q4zFNrOZu
   C8c/cgNKxgPmZmpEcnkcu88mJN273rL7V5c6eFOCXogjIPifTAqv4/3xc
   3/zkqufpSGqE0Saqg3rjbSq1WTeTH/oZP+jwHk4NraE2UPjkQk6zmkfP+
   g==;
X-CSE-ConnectionGUID: jYY6Ps5QTXiiqRin/K68nQ==
X-CSE-MsgGUID: jREpW+2yTyadUgLeuFsuKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="36880495"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="36880495"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 02:08:23 -0800
X-CSE-ConnectionGUID: 8GSKjykHTUafGdc2QdTSWw==
X-CSE-MsgGUID: GPZ+GestTsq72KFEEKAd9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110830365"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2025 02:08:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZSE8-000VLj-0x;
	Sun, 19 Jan 2025 10:08:20 +0000
Date: Sun, 19 Jan 2025 18:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rsslro2 89/94]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202501191732.i8EOO2OB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rsslro2
head:   774bf478915ffc0a7b676c83c3103cc18b02dbd4
commit: bdfa0652bff28abeb8d62c1e7100159747cc7234 [89/94] try to add debugfs...but there are some build-errors that need to be solved
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501191732.i8EOO2OB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191732.i8EOO2OB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191732.i8EOO2OB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:355:5: warning: no previous prototype for 'mt798x_iomap' [-Wmissing-prototypes]
     355 | int mt798x_iomap(void)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:375:5: warning: no previous prototype for 'mt798x_iounmap' [-Wmissing-prototypes]
     375 | int mt798x_iounmap(void)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:384:6: warning: no previous prototype for 'mt7530_mdio_w32' [-Wmissing-prototypes]
     384 | void mt7530_mdio_w32(struct mtk_eth *eth, u16 reg, u32 val)
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:399:5: warning: no previous prototype for 'mt7530_mdio_r32' [-Wmissing-prototypes]
     399 | u32 mt7530_mdio_r32(struct mtk_eth *eth, u32 reg)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:420:6: warning: no previous prototype for 'mtk_switch_w32' [-Wmissing-prototypes]
     420 | void mtk_switch_w32(struct mtk_eth *eth, u32 val, unsigned int reg)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:426:5: warning: no previous prototype for 'mtk_switch_r32' [-Wmissing-prototypes]
     426 | u32 mtk_switch_r32(struct mtk_eth *eth, unsigned int reg)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debug_show':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac' set but not used [-Wunused-but-set-variable]
     435 |         struct mtk_mac *mac = 0;
         |                         ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debugfs_reset':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:680:39: error: 'struct <anonymous>' has no member named 'force'
     680 |                 atomic_set(&eth->reset.force, 0);
         |                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:683:44: error: 'struct <anonymous>' has no member named 'force'
     683 |                 if (atomic_read(&eth->reset.force))
         |                                            ^
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:689:39: error: 'struct <anonymous>' has no member named 'force'
     689 |                 atomic_set(&eth->reset.force, 1);
         |                                       ^
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:782:6: warning: no previous prototype for 'mii_mgr_read_combine' [-Wmissing-prototypes]
     782 | void mii_mgr_read_combine(struct mtk_eth *eth, u32 phy_addr, u32 phy_register,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:792:6: warning: no previous prototype for 'mii_mgr_write_combine' [-Wmissing-prototypes]
     792 | void mii_mgr_write_combine(struct mtk_eth *eth, u16 phy_addr, u16 phy_register,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:991:6: warning: no previous prototype for 'dump_each_port' [-Wmissing-prototypes]
     991 | void dump_each_port(struct seq_file *seq, struct mtk_eth *eth, u32 base)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'dump_each_port':
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1003:33: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1003 |                                 ;
         |                                 ^
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1011:5: warning: no previous prototype for 'esw_cnt_read' [-Wmissing-prototypes]
    1011 | int esw_cnt_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1085:6: warning: no previous prototype for 'xfi_mib_dump' [-Wmissing-prototypes]
    1085 | void xfi_mib_dump(struct seq_file *seq, u32 gdm_id)
         |      ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1111:5: warning: no previous prototype for 'xfi_cnt_read' [-Wmissing-prototypes]
    1111 | int xfi_cnt_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1144:5: warning: no previous prototype for 'tx_ring_read' [-Wmissing-prototypes]
    1144 | int tx_ring_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1190:5: warning: no previous prototype for 'hwtx_ring_read' [-Wmissing-prototypes]
    1190 | int hwtx_ring_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1230:5: warning: no previous prototype for 'rx_ring_read' [-Wmissing-prototypes]
    1230 | int rx_ring_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1282:5: warning: no previous prototype for 'dbg_regs_read' [-Wmissing-prototypes]
    1282 | int dbg_regs_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1482:9: warning: no previous prototype for 'hw_lro_stats_write' [-Wmissing-prototypes]
    1482 | ssize_t hw_lro_stats_write(struct file *file, const char __user *buffer,
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1501:5: warning: no previous prototype for 'hw_lro_stats_read_v1' [-Wmissing-prototypes]
    1501 | int hw_lro_stats_read_v1(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1598:5: warning: no previous prototype for 'hw_lro_stats_read_v2' [-Wmissing-prototypes]
    1598 | int hw_lro_stats_read_v2(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1705:5: warning: no previous prototype for 'hw_lro_stats_read_wrapper' [-Wmissing-prototypes]
    1705 | int hw_lro_stats_read_wrapper(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1730:5: warning: no previous prototype for 'hwlro_agg_cnt_ctrl' [-Wmissing-prototypes]
    1730 | int hwlro_agg_cnt_ctrl(int cnt)
         |     ^~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mediatek/mtk_eth_dbg.c:29:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_agg_cnt_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:263:42: error: 'reg_map' undeclared (first use in this function); did you mean 'regmap'?
     263 | #define MTK_LRO_CTRL_DW2_CFG(x)         (reg_map->pdma.lro_ring_ctrl_dw1 + 0x4 + (x * 0x40))
         |                                          ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:118:37: note: in expansion of macro 'MTK_LRO_CTRL_DW2_CFG'
     118 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1736:17: note: in expansion of macro 'SET_PDMA_RXRING_MAX_AGG_CNT'
    1736 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:263:42: note: each undeclared identifier is reported only once for each function it appears in
     263 | #define MTK_LRO_CTRL_DW2_CFG(x)         (reg_map->pdma.lro_ring_ctrl_dw1 + 0x4 + (x * 0x40))
         |                                          ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:118:37: note: in expansion of macro 'MTK_LRO_CTRL_DW2_CFG'
     118 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1736:17: note: in expansion of macro 'SET_PDMA_RXRING_MAX_AGG_CNT'
    1736 |                 SET_PDMA_RXRING_MAX_AGG_CNT(eth, i, cnt);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1741:5: warning: no previous prototype for 'hwlro_agg_time_ctrl' [-Wmissing-prototypes]
    1741 | int hwlro_agg_time_ctrl(int time)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_agg_time_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:263:42: error: 'reg_map' undeclared (first use in this function); did you mean 'regmap'?
     263 | #define MTK_LRO_CTRL_DW2_CFG(x)         (reg_map->pdma.lro_ring_ctrl_dw1 + 0x4 + (x * 0x40))
         |                                          ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:131:36: note: in expansion of macro 'MTK_LRO_CTRL_DW2_CFG'
     131 |         u32 reg_val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));            \
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1747:17: note: in expansion of macro 'SET_PDMA_RXRING_AGG_TIME'
    1747 |                 SET_PDMA_RXRING_AGG_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1752:5: warning: no previous prototype for 'hwlro_age_time_ctrl' [-Wmissing-prototypes]
    1752 | int hwlro_age_time_ctrl(int time)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_age_time_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:262:42: error: 'reg_map' undeclared (first use in this function); did you mean 'regmap'?
     262 | #define MTK_LRO_CTRL_DW1_CFG(x)         (reg_map->pdma.lro_ring_ctrl_dw1 + (x * 0x40))
         |                                          ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:139:37: note: in expansion of macro 'MTK_LRO_CTRL_DW1_CFG'
     139 |         u32 reg_val1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(x));           \
         |                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1758:17: note: in expansion of macro 'SET_PDMA_RXRING_AGE_TIME'
    1758 |                 SET_PDMA_RXRING_AGE_TIME(eth, i, time);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1762:5: warning: no previous prototype for 'hwlro_threshold_ctrl' [-Wmissing-prototypes]
    1762 | int hwlro_threshold_ctrl(int bandwidth)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1771:5: warning: no previous prototype for 'hwlro_ring_enable_ctrl' [-Wmissing-prototypes]
    1771 | int hwlro_ring_enable_ctrl(int enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hwlro_ring_enable_ctrl':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:263:42: error: 'reg_map' undeclared (first use in this function); did you mean 'regmap'?
     263 | #define MTK_LRO_CTRL_DW2_CFG(x)         (reg_map->pdma.lro_ring_ctrl_dw1 + 0x4 + (x * 0x40))
         |                                          ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.h:159:36: note: in expansion of macro 'MTK_LRO_CTRL_DW2_CFG'
     159 |         u32 reg_val = mtk_r32(eth, MTK_LRO_CTRL_DW2_CFG(x));            \
         |                                    ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1779:17: note: in expansion of macro 'SET_PDMA_RXRING_VALID'
    1779 |                 SET_PDMA_RXRING_VALID(eth, i, enable);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1784:5: warning: no previous prototype for 'hwlro_stats_enable_ctrl' [-Wmissing-prototypes]
    1784 | int hwlro_stats_enable_ctrl(int enable)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1801:9: warning: no previous prototype for 'hw_lro_auto_tlb_write' [-Wmissing-prototypes]
    1801 | ssize_t hw_lro_auto_tlb_write(struct file *file, const char __user *buffer,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1810:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1810 |         int ret;
         |             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1839:6: warning: no previous prototype for 'hw_lro_auto_tlb_dump_v1' [-Wmissing-prototypes]
    1839 | void hw_lro_auto_tlb_dump_v1(struct seq_file *seq, u32 index)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1898:6: warning: no previous prototype for 'hw_lro_auto_tlb_dump_v2' [-Wmissing-prototypes]
    1898 | void hw_lro_auto_tlb_dump_v2(struct seq_file *seq, u32 index)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v2':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1902:13: warning: variable 'score' set but not used [-Wunused-but-set-variable]
    1902 |         u32 score = 0, ipv4 = 0;
         |             ^~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: At top level:
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1969:5: warning: no previous prototype for 'hw_lro_auto_tlb_read' [-Wmissing-prototypes]
    1969 | int hw_lro_auto_tlb_read(struct seq_file *seq, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_read':
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:262:42: error: 'reg_map' undeclared (first use in this function); did you mean 'regmap'?
     262 | #define MTK_LRO_CTRL_DW1_CFG(x)         (reg_map->pdma.lro_ring_ctrl_dw1 + (x * 0x40))
         |                                          ^~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c:2009:40: note: in expansion of macro 'MTK_LRO_CTRL_DW1_CFG'
    2009 |                 reg_op1 = mtk_r32(eth, MTK_LRO_CTRL_DW1_CFG(i));
         |                                        ^~~~~~~~~~~~~~~~~~~~


vim +/mac +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

   431	
   432	static int mtketh_debug_show(struct seq_file *m, void *private)
   433	{
   434		struct mtk_eth *eth = m->private;
 > 435		struct mtk_mac *mac = 0;
   436		int  i = 0;
   437	
   438		for (i = 0 ; i < MTK_MAX_DEVS ; i++) {
   439			if (!eth->mac[i] ||
   440			    of_phy_is_fixed_link(eth->mac[i]->of_node))
   441				continue;
   442			mac = eth->mac[i];
   443	/* FIXME */
   444	/*
   445			while (j < 30) {
   446				d =  _mtk_mdio_read_c22(eth, mac->phy_dev->addr, j);
   447	
   448				seq_printf(m, "phy=%d, reg=0x%08x, data=0x%08x\n",
   449					   mac->phy_dev->addr, j, d);
   450				j++;
   451			}
   452	*/
   453		}
   454		return 0;
   455	}
   456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
