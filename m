Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A7430CDD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292744; cv=none; b=UAHnHsXNlzUne6rqLsSP8S/YBa8coXO4Xbu+srKaYdVomLl6oKbQC/ky4uPfXGjxX4ZO1PkR2PprGdz66QGrjk9lvaxDLSPOzRAj97kmAH4rzODiGfN52KIdoyjlGoouKNvNFk7Y8I43uWfc0tMJBMPGThYOLHH6qtWzjob8dyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292744; c=relaxed/simple;
	bh=xJarao3xn/m/49AAgSOyK8WknePQnzJrPUE2mNS1iGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YGs04GsN4C1/6sFw3ceT3AxVyQDEi90Ul7eDKb6rDEWXuFlFDTAv+eoxucX75bE8qpCy5msKU2vR9iQbc1MuhPOlQAJwD2cZC6FnxE7F7dQbFKDK4hU5OJ1FMIAzB0A4TQ3In2wwd8s7X9ccT8e1aR+9A2+/Ftap4R4zniy/odE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S69Ktcsl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S69Ktcsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791292742; x=1822828742;
  h=date:from:to:cc:subject:message-id;
  bh=xJarao3xn/m/49AAgSOyK8WknePQnzJrPUE2mNS1iGI=;
  b=S69KtcslOJ7GQZeG1YmL72VpiF2Z29S8IVBQ84chIt8uBZ7CsgBNomxS
   Ikndw0hHyJtgW9Ulr4Ru0nbysbskjyHAT8VMSmX49xHsmkKJCvuv107Wp
   UPOP7yh6m5TYdtwTSrW7nXNwjsj2/gnZBXsR583KU7m5Pm8Ywebz/cx2X
   zKueERXyPVa0NSBg2TC8W9JXqOGpQq+A4V2CpwNz6ViS/m/lRrbW0y5hW
   AxneOHFvMcLE70nCVeBbiJ3Zx3lmDacPS0FxvhxVt2BWJr+nmlC0U8UpC
   pa0YNDQzvbM55ELb/FeQQtPmxdP8EPPnb7eu0rKJst41OCwIZrYfqyF57
   A==;
X-CSE-ConnectionGUID: 1N4XLtMTRmexFkJnyvOMgg==
X-CSE-MsgGUID: rWmvT9NCSDi121ViFdAinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102558920"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102558920"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 06:19:01 -0700
X-CSE-ConnectionGUID: vRVfZAwuSJ2dfcYjy4JPUQ==
X-CSE-MsgGUID: MgB7EFT4S3WHwZSvy99uCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273517981"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2026 06:19:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE54M-000000001IJ-2Bm5;
	Tue, 06 Oct 2026 13:18:58 +0000
Date: Tue, 06 Oct 2026 15:18:50 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 70/90] WARNING: modpost: vmlinux: section
 mismatch in reference: pcm512x_hw_params+0x1248 (section: .text) ->
 r9a07g044_crit_mod_clks (section: .init.rodata)
Message-ID: <202610061526.5fGBQ3Bf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   b77c66b62352df9532f4dea5dd225cb31c0efd91
commit: b61dc60a7d4e574c9ddbcc6dff24e3322c4ed216 [70/90] net: Let a BPF poller take over NAPI scheduling
config: mips-randconfig-r2100-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061526.5fGBQ3Bf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061526.5fGBQ3Bf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061526.5fGBQ3Bf-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: aw86927_irq+0xc8 (section: .text) -> set_raw_show_trace (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: aw86927_irq+0xcc (section: .text) -> set_raw_show_trace (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x54 (section: .text) -> dss_conv_list (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x58 (section: .text) -> dss_conv_list (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x80 (section: .text) -> omapdss_of_match (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x84 (section: .text) -> omapdss_of_match (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0xb0 (section: .text) -> omapdss_walk_device (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0xb4 (section: .text) -> omapdss_walk_device (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x22c (section: .text) -> omapdss_omapify_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x230 (section: .text) -> omapdss_omapify_node (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x244 (section: .text) -> omapdss_add_to_list (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lpc18xx_eeprom_probe+0x248 (section: .text) -> omapdss_add_to_list (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hte_request_ts_ns+0x18c (section: .text) -> scpi_clocks_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: hte_request_ts_ns+0x190 (section: .text) -> scpi_clocks_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_hw_params+0x1248 (section: .text) -> r9a07g044_crit_mod_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_hw_params+0x124c (section: .text) -> r9a07g044_crit_mod_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_i2c_probe+0x4c (section: .text) -> cpg_pll_config (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: pcm512x_i2c_probe+0x58 (section: .text) -> cpg_pll_config (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x70 (section: .text) -> exynos5800_fixed_factor_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x74 (section: .text) -> exynos5800_fixed_factor_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x1e8 (section: .text) -> exynos5800_cpu_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x1ec (section: .text) -> exynos5800_cpu_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x220 (section: .text) -> exynos5x_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_i2c_probe+0x224 (section: .text) -> exynos5x_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_probe+0x30 (section: .text) -> exynos5420_gate_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_probe+0x38 (section: .text) -> exynos5420_gate_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_enable_micbias1_for_ovcd+0x50 (section: .text) -> mout_sclk_jpeg_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_enable_micbias1_for_ovcd+0x54 (section: .text) -> mout_sclk_jpeg_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_disable_micbias1_for_ovcd+0x7c (section: .text) -> mout_sclk_jpeg_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_disable_micbias1_for_ovcd+0x80 (section: .text) -> mout_sclk_jpeg_p (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5640_i2c_probe+0x33c (section: .text) -> imem_gate_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5640_i2c_probe+0x340 (section: .text) -> imem_gate_clks (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: mt8186_fe_startup+0x178 (section: .text) -> tps68470_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt8186_fe_startup+0x17c (section: .text) -> tps68470_regulator_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: unregister_netdevice_many_notify+0x460 (section: .text) -> da9150_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: unregister_netdevice_many_notify+0x464 (section: .text) -> da9150_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: tvp5150_log_status+0xb98 (section: .text.unlikely.) -> zswap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tvp5150_log_status+0xb9c (section: .text.unlikely.) -> zswap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x18 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x48 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0x5c (section: .data) -> led_bl_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: valids_table+0xe4 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x18 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x48 (section: .data) -> led_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0x54 (section: .data) -> led_bl_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: stm32h7_valids_table+0xe4 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: triggers_table+0xc4 (section: .data) -> led_bl_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: triggers_table+0x150 (section: .data) -> led_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_video_p1+0x0 (section: .data) -> __fixed_factor_clk_of_clk_init_declare (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_vfe+0x0 (section: .data) -> of_fixed_factor_clk_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cs48l32_dai+0x388 (section: .data) -> gcc_msm8953_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: max98926_i2c_driver+0x18 (section: .data) -> cam_cc_milos_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max98520_i2c_driver+0x18 (section: .data) -> dispcc_sm7150_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_dai+0x0 (section: .data) -> mout_hdmi_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5616_dai+0x70 (section: .data) -> mout_sw_aclk100_noc_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0xe8 (section: .data) -> core_cmu_info (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0x190 (section: .data) -> core_clk_regs (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5659_dai+0x1c0 (section: .data) -> fsys_cmu_info (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x40 (section: .data) -> mout_mmc_pll_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x190 (section: .data) -> mout_clkcmu_cmu_boost_p (section: .init.rodata)
>> WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x268 (section: .data) -> mout_clkcmu_acc_noc_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: rt5665_dai+0x2e0 (section: .data) -> mout_clkcmu_cmu_cmuref_p (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: aif_text+0x4 (section: .data) -> genpd_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sidetone_text+0x8 (section: .data) -> genpd_bus_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: q6dsp_audio_fe_dais+0x4c20 (section: .data) -> mtk8250_platform_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: q6dsp_audio_fe_dais+0x4d08 (section: .data) -> mtk8250_platform_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __TRACE_SYSTEM_SK_RST_REASON_TCP_KEEPALIVE_TIMEOUT+0x4 (section: .init.data) -> m10bmc_pmci_driver_exit (section: .exit.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
