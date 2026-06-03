Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827A436367
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 22:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525794; cv=none; b=c8kpP02OwamUte9JyRhRv2qIl47lIwkW2k+o/CF2yYawxOKTwx50UKwrj6KaB9lfKbCWVY790zsryyNZM1DvfaybzKKsMiaKZnOiRcM0BvY2bqropXHojop+TCH/Wm4vWlaNR/OkBiOndBJdh2B9i9XK9Pv9+95U09UpUHw8ztU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525794; c=relaxed/simple;
	bh=FxXPGO4Ppas/iK35qej/JK/PqxJtT05cTz/DPg8EtgY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HCudT65mETIyg8cEM5qUfM8KrnrOI/rBDoRJa1BKB0U5IH/CYhY7vQAhprJw8pDfJBSMI6WhW55h99UC7Garj2hi0DV1YaPv2FsW0HCEHmqHm1VMWfMsplDto4gslZiNXMhhz7EU7qRfjIvKvRKad97dR6hQ8v6LWBu4moujpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6Jtj60/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6Jtj60/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780525792; x=1812061792;
  h=date:from:to:cc:subject:message-id;
  bh=FxXPGO4Ppas/iK35qej/JK/PqxJtT05cTz/DPg8EtgY=;
  b=a6Jtj60/S/BeOsK72eRjXZ4+05GO2NFpmYa6xl9EkQtpczQgY+FRym2K
   REiwOeUEIvrpZz/0mBDNrAYvuUYoaoT+ulIwJe3xr0m8+PMZ+oYPV8Qfp
   PCuhMUKuAxpl7WdM7t9N5951JFueB/KGtuNmSnN83nhs2EdjVaEEpfJIF
   rOYzRrC28Zh9NQRnSc5oTRyGkxOAe0T/MunpjH+QKLvAZhlM8FgW7Zx/x
   gCIwYFb34CLJ4X0v3Ti5h4TmRyTYUA6X5tOi4MEn4mgz0lFaY5miCKoz6
   LyzPq3rdISpwOmU4evYHAD1uJx12xEKkiJZz+yUHKxEiivAL9lTFwqxC1
   Q==;
X-CSE-ConnectionGUID: BC+ckMgMT+O5kqBGTuPTgg==
X-CSE-MsgGUID: fF542H1NQFOv3JwGtjsUew==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91922704"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="91922704"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:29:51 -0700
X-CSE-ConnectionGUID: fAlgCntgQQy/BEyQcVCW3g==
X-CSE-MsgGUID: KE7b/P1dRYqbF5qA2KNvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268030433"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 15:29:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUu5r-000000002BH-34ui;
	Wed, 03 Jun 2026 22:29:47 +0000
Date: Thu, 04 Jun 2026 00:29:01 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 8560/10263]
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: front-camera@48 (onnn,mt9m114):
 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202606040017.Rx776aVO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
commit: 8399055d9f98e94c33608fe9d61afc09a43cc4df [8560/10263] ARM: tegra: lg-x3: Complete video device graph
config: arm-randconfig-2051-20260531 (https://download.01.org/0day-ci/archive/20260604/202606040017.Rx776aVO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040017.Rx776aVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040017.Rx776aVO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi:55.22-61.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma@80000000: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nvidia/tegra30.dtsi:1138.15-1151.4: Warning (unique_unit_address_if_enabled): /usb@7d000000: duplicate unit-address (also used in node /usb-phy@7d000000)
   arch/arm/boot/dts/nvidia/tegra30.dtsi:36.3-42: Warning (interrupt_map): /pcie@3000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /i2c@7000c500/camera-pmic@7d: failed to match any schema with compatible: ['ti,lp8720']
>> arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: front-camera@48 (onnn,mt9m114): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: max77663@1c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: dsi@2 (solomon,ssd2825): '#address-cells', '#size-cells', 'panel@1' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/solomon,ssd2825.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: panel@1 (koe,tx13d100vm0eaa): 'backlight' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/renesas,r61307.yaml
   arch/arm/boot/dts/nvidia/tegra30-lg-p895.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
