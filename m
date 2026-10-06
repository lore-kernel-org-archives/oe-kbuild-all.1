Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7021F192E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305058; cv=none; b=Ny5NMDqEvNPasZ6N6athW906f/DxIX+S+/GM+xE9Ks8giZ1Y7Qk+X1LODEteP39Yu/MdLMEhbzqzUa4bP1dsflwHW8UODC8IbCYZzog32/1q3unSf7mMpJ6ESQF+Y1xgp9Lw7ogNdZOgIaVLYziDWaKWAeCLBNnBjqzoAmm7/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305058; c=relaxed/simple;
	bh=aIoNh6HjJ9XrO3+ASsXbF0Hg3BM5Y7Kg5jW2N18Yt+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=twlFrrAQEre6SaWH/Jg+eZISAT2INwWi0vizY2WAAGIJOabOi9KZSdIQpTDl/ZqaKjv2ORdS2OkWhFZADWMSs4MscyrHI5ZWWwMEd4pbGGrcMUEaAZQthsskZvE2bmjd30YZ4T0Km64zADLi375yfucq+imTsJEXsB9L0Ud14j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5CJsb+U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5CJsb+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791305056; x=1822841056;
  h=date:from:to:cc:subject:message-id;
  bh=aIoNh6HjJ9XrO3+ASsXbF0Hg3BM5Y7Kg5jW2N18Yt+Q=;
  b=g5CJsb+UFqKQXLSXgtIPzec11XplxiHESEpHLCb9aGwkukrXj8UJdGqC
   d01JP2MmMxK4oH24fk+AGxNXcdWpBLP1NCpTI7DXadvbemPKQSFBA2hXI
   rVOvrRmKKEUhgsqs2eSHdZ+FZr1YmQQf8XJ8s6qldw5op3TWcZ/7aNS93
   YbWPl6SSzmgLk/GxVINSOS1vmXZcw1fkIgU5m7RENiWFHnuP5DaKqnZBN
   ObDhBkNi98+TXMnNqAnwyb4k0DNs+B92p0fWACdlgTYyBwZZYyJ/D898J
   2OxJWetVXKn8cHzf2ccz61OMkCWdKaEbfLjdbtxA7thdV9kRoluU+lmMP
   w==;
X-CSE-ConnectionGUID: F1kht1heQpCcJd8zvPpA9w==
X-CSE-MsgGUID: phdrViXnR8yuKf/v+yGhHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="52973"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="52973"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 09:44:15 -0700
X-CSE-ConnectionGUID: kxrXB0JUQj2lYQQgEW4KQg==
X-CSE-MsgGUID: 4fgFu3pKRzu6Twnc8s+i1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276726677"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 09:44:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE8Gw-000000001Vo-3rnu;
	Tue, 06 Oct 2026 16:44:10 +0000
Date: Tue, 06 Oct 2026 18:43:25 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 70/90] WARNING: modpost: vmlinux: section
 mismatch in reference: max44009_probe+0x84 (section: .text) ->
 input_events_init (section: .init.text)
Message-ID: <202610061805.ypRUMrJA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   b77c66b62352df9532f4dea5dd225cb31c0efd91
commit: b61dc60a7d4e574c9ddbcc6dff24e3322c4ed216 [70/90] net: Let a BPF poller take over NAPI scheduling
config: mips-randconfig-r2100-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061805.ypRUMrJA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061805.ypRUMrJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061805.ypRUMrJA-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: max44009_probe+0x84 (section: .text) -> input_events_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max44009_probe+0x88 (section: .text) -> input_events_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x80 (section: .text) -> omapdss_omapify_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x84 (section: .text) -> omapdss_omapify_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0xb0 (section: .text) -> omapdss_add_to_list (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0xb4 (section: .text) -> omapdss_add_to_list (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x244 (section: .text) -> prefix (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x248 (section: .text) -> prefix (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x264 (section: .text) -> omapdss_count_strings (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x268 (section: .text) -> omapdss_count_strings (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: hte_ts_get+0x3f8 (section: .text) -> scpi_clocks_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hte_ts_get+0x400 (section: .text) -> scpi_clocks_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_hw_params+0x1200 (section: .text) -> r9a07g044_crit_mod_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_hw_params+0x1204 (section: .text) -> r9a07g044_crit_mod_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_i2c_probe+0x4c (section: .text) -> cpg_quirks (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_i2c_probe+0x58 (section: .text) -> cpg_quirks (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rt1305_i2c_probe+0x9c (section: .text) -> mux_pll_src_3plls_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt1305_i2c_probe+0xa0 (section: .text) -> mux_pll_src_3plls_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt1305_hw_params+0xc0 (section: .text) -> mux_pll_src_2plls_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt1305_hw_params+0xc8 (section: .text) -> mux_pll_src_2plls_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x70 (section: .text) -> exynos5800_div_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x74 (section: .text) -> exynos5800_div_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x1e8 (section: .text) -> exynos5x_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x1ec (section: .text) -> exynos5x_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x208 (section: .text) -> exynos5800_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x20c (section: .text) -> exynos5800_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_i2c_probe+0x268 (section: .text) -> imem_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_i2c_probe+0x26c (section: .text) -> imem_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: xt_check_entry_offsets+0x15c (section: .text) -> ceva_ahci_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xt_check_entry_offsets+0x160 (section: .text) -> ceva_ahci_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: textify_hooks+0x9c (section: .text) -> ceva_ahci_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: textify_hooks+0xa0 (section: .text) -> ceva_ahci_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tvp5150_log_status+0xac0 (section: .text.unlikely.) -> zswap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tvp5150_log_status+0xacc (section: .text.unlikely.) -> zswap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lm3533_als_driver+0x14 (section: .data) -> gpio_led_trigger_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x8 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x18 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x1c (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x44 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x48 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x54 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x5c (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0xa4 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x8 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x18 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x1c (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x44 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x48 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x54 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x58 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x11c (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: triggers_table+0x38 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: triggers_table+0xc4 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_video_p0+0x0 (section: .data) -> of_fixed_factor_clk_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ak4535_dai+0x70 (section: .data) -> clk_mt8195_mfg_drv_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_dai+0x70 (section: .data) -> mout_sw_pclk200_fsys_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0x40 (section: .data) -> core_cmu_info (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0xe8 (section: .data) -> core_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0x118 (section: .data) -> fsys_cmu_info (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0x190 (section: .data) -> core_div_clks (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0x1c0 (section: .data) -> core_mux_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x40 (section: .data) -> mout_clkcmu_cmu_boost_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x70 (section: .data) -> mout_clkcmu_acc_noc_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x190 (section: .data) -> mout_clkcmu_cmu_cmuref_p (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x268 (section: .data) -> mout_clkcmu_acc_orb_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: aif_text+0x0 (section: .data) -> genpd_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sidetone_text+0x4 (section: .data) -> genpd_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adda_codecs+0x14 (section: .data) -> a10sr_reset_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: q6dsp_audio_fe_dais+0x4b78 (section: .data) -> mtk8250_platform_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: q6dsp_audio_fe_dais+0x4c60 (section: .data) -> mtk8250_platform_driver_exit (section: .exit.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
