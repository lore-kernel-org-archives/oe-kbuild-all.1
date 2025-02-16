Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B582942A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739694343; cv=none; b=rMpGbQlMRfoUWFqY+KIRQwiVBanEYKBdf1H8ViMEPPugbIFjekYIX7AlUbkzWoCqnOXIYbMM//tTMeYRZqjZIaiKCypw+8NpksIn62LRDclM68TeoGNWymIOO9vzaqFmXnt2oh/E+XRNY5WgMCVxb8z7y5tHjT9yfg/WhZYr3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739694343; c=relaxed/simple;
	bh=yXBm/g7/eGXsHJYlmWb2+E1DF3zcnslhwGjXznesC24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zl6ndSkrXEX/WTTPGo3a9s9ykOVqmBF7Cmjc7vRIGpfov8TUmT47zMgDAEEHKxHtEmvQg007T8ogXuzlZI9MaY25haV9ctM0Q1ElEVc0JTldDqy3oGOur6ETk+SIOWAzA1olDPG4RC22gXA94LJLzNhnzdzBPj6lFl6Idjw36vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXnzEfAK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXnzEfAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739694341; x=1771230341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yXBm/g7/eGXsHJYlmWb2+E1DF3zcnslhwGjXznesC24=;
  b=lXnzEfAKLMs6fJIU+iEHviMh20WEKRbXfqn3GlQaFnaEhIukF6jNQ9wA
   YGqBVYSj7Ryq34yZGRr+dG0TxySOfpU6M8l8N5JlZykXvmIxFHo/Q1/UM
   NqIJ/Sp2fofxhj/QFNDsGFQeS/2kT3kowXDB0Z6t4+u0clzSA2dIVRlxX
   zPXS2IpOwEcSntNgNmP7Xm2nbecNc9u+4fKd4YEkQjApRibuBWuzSxFfD
   5CYZizb8KTNiXoiXSBxxcthHDvMWhBgqda5+kS+DZgxfxKIwEiGM+No2b
   9m8V1hFPC/aW9Wx1zdhiZk2KQvjT4/GieREPDh4q/7UQ+cEJKbHtqmPIr
   w==;
X-CSE-ConnectionGUID: 4C/evQLUSo2DVih09M+T0A==
X-CSE-MsgGUID: b3AmF6jaSt6rJmETNBwWsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="40534760"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="40534760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 00:25:40 -0800
X-CSE-ConnectionGUID: 4EC2qPIdQwm9TjRs/54xFg==
X-CSE-MsgGUID: GAGK7TWRTSyvwPMuouE0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="114474652"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Feb 2025 00:25:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjZy5-001Bhz-0z;
	Sun, 16 Feb 2025 08:25:37 +0000
Date: Sun, 16 Feb 2025 16:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 5/5]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: Unevaluated
 properties are not allowed ('boost-crypt-vcore-min', 'clock-names',
 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts',
 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via...
Message-ID: <202502161617.VMGY1xGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0d96e807079196f870dcef51ecf4bd53fb5472c1
commit: 8f38c8537cd3b449dba0e544b8c01d91be36c5ed [5/5] CHROMIUM: arm64: dts: mt8196: update ufs setting
config: arm64-randconfig-051-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161617.VMGY1xGd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502161617.VMGY1xGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161617.VMGY1xGd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: clocks: [[62, 42], [62, 97], [62, 115], [62, 41], [62, 118], [62, 96], [77, 1], [77, 3], [77, 5], [77, 7], [77, 9], [77, 11], [77, 13], [77, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: clocks: [[79, 42], [79, 97], [79, 115], [79, 41], [79, 118], [79, 96], [101, 1], [101, 3], [101, 5], [101, 7], [101, 9], [101, 11], [101, 13], [101, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: ufshci@16810000: clocks: [[87, 42], [87, 97], [87, 115], [87, 41], [87, 118], [87, 96], [110, 1], [110, 3], [110, 5], [110, 7], [110, 9], [110, 11], [110, 13], [110, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: ufshci@16810000: clocks: [[87, 42], [87, 97], [87, 115], [87, 41], [87, 118], [87, 96], [110, 1], [110, 3], [110, 5], [110, 7], [110, 9], [110, 11], [110, 13], [110, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: ufshci@16810000: clocks: [[87, 42], [87, 97], [87, 115], [87, 41], [87, 118], [87, 96], [110, 1], [110, 3], [110, 5], [110, 7], [110, 9], [110, 11], [110, 13], [110, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: ufshci@16810000: clocks: [[85, 42], [85, 97], [85, 115], [85, 41], [85, 118], [85, 96], [108, 1], [108, 3], [108, 5], [108, 7], [108, 9], [108, 11], [108, 13], [108, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: ufshci@16810000: clocks: [[85, 42], [85, 97], [85, 115], [85, 41], [85, 118], [85, 96], [108, 1], [108, 3], [108, 5], [108, 7], [108, 9], [108, 11], [108, 13], [108, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: ufshci@16810000: interrupts: [[0, 320, 4, 0], [0, 329, 4, 0], [0, 330, 4, 0], [0, 331, 4, 0], [0, 332, 4, 0], [0, 333, 4, 0], [0, 334, 4, 0], [0, 335, 4, 0], [0, 336, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: ufshci@16810000: clocks: [[85, 42], [85, 97], [85, 115], [85, 41], [85, 118], [85, 96], [108, 1], [108, 3], [108, 5], [108, 7], [108, 9], [108, 11], [108, 13], [108, 15]] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: ufshci@16810000: clock-names:0: 'ufs' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: ufshci@16810000: clock-names: ['ufs_sel', 'ufs_sel_min_src', 'ufs_sel_max_src', 'crypt_mux', 'crypt_lp', 'crypt_perf', 'unipro_tx_sym', 'unipro_rx_sym0', 'unipro_rx_sym1', 'unipro_sys', 'unipro_sap', 'ufs_phy_sap', 'ufshci_ufs', 'ufshci_aes'] is too long
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: ufshci@16810000: 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: ufshci@16810000: Unevaluated properties are not allowed ('boost-crypt-vcore-min', 'clock-names', 'clocks', 'dvfsrc-vcore-supply', 'freq-table-hz', 'interrupts', 'mediatek,ufs-boost-crypt', 'mediatek,ufs-pmc-via-fastauto', 'mediatek,ufs-rtff-mtcmos', 'reset-names', 'resets', 'vccq-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/mediatek,ufs.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@168a0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
