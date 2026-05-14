Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6FF3DD878
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749020; cv=none; b=ry0fcpsnA1sQPpRMbT7hGtimRyO/+E3jd3H+gEBMksv4818afUL7NCNy8G83f4keFpLSNuVnfSM0ADlkaJS0L0JEbTyEsI4qpUMqtWJ9/aXcNG5NcOegFcFIrFWuVRGP91NfHEmJPrMdtB3gEAyH73lk17785Y8fJ0mHqzObh5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749020; c=relaxed/simple;
	bh=YgRL1GywJcCBZNxLUUxmDQa4lLwd7oLpk46l3XB2q1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fyj8aTovnjN+SsFZwdzAdK1DqEa2Ssi+K8CR13IFC7342xhtqoFBCYvjOB1p8/anXDnNESPKK2cHNTYnS5YzCjpYErqSaUuFRLVJAg4z7/wy0xtl7Lga23U3wuiksaVvkdhcNt+KPWPBydV2RgJGJjRDOjaexKEE91JakbIUv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ0IG394; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ0IG394"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778749018; x=1810285018;
  h=date:from:to:cc:subject:message-id;
  bh=YgRL1GywJcCBZNxLUUxmDQa4lLwd7oLpk46l3XB2q1g=;
  b=KZ0IG394IHOr7ejqVglveN/CLbrYGMjPLLROv3FyUiLgizf3TPGizI4x
   a1W3UXSsYo0JhR2vNiOTbl5Mj4HnDE/32KmMcjk05tjb72ZppeSxxh+G6
   dM4DWpYCEQXCZjB7pAi/fv47SzL602ybAr4S+EavxCaWFd3sd8qxf/3BY
   NkUtm/lhjUoB8np4/zCR9iOAa82yOtBp8gxLmTB0Xkcm46iyaV8rbTG9a
   +zT+FijaAURja6lhR1uZKWyQjd2arixMwh9kz+RUJuCaN1H+dxw6eALmA
   eKMmIgb8S2fFCeJaeaZuN6sPWl18rVGNxhNZInxRFR3J/d/AI08UfsePa
   Q==;
X-CSE-ConnectionGUID: 9hpurCfNTZCfUL2ZE9zLKg==
X-CSE-MsgGUID: HVSr/kc2S7SwtpR0ajsO2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78711277"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="78711277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 01:56:58 -0700
X-CSE-ConnectionGUID: 0sjy7VVISE2wNP2+5Sb2wQ==
X-CSE-MsgGUID: kmpbQBIpSfe3pDFmw2SgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238444267"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2026 01:56:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNRsD-000000008mf-1U2c;
	Thu, 14 May 2026 08:56:53 +0000
Date: Thu, 14 May 2026 10:56:07 +0200
From: kernel test robot <lkp@intel.com>
To: Kendall Willis <k-willis@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "Markus Schneider-Pargmann" <msp@baylibre.com>,
 Dhruva Gole <d-gole@ti.com>, Kevin Hilman <khilman@baylibre.com>
Subject: arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000
 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202605141038.l4RqroLG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 6b0b73c9fecf343ad95f761b3f781c6064eb31fb arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup
date:   7 weeks ago
config: arm64-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260514/202605141038.l4RqroLG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141038.l4RqroLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 6b0b73c9fecf ("arm64: dts: ti: k3-am62x-sk-common: Enable Main UART wakeup")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141038.l4RqroLG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[21, 22, 23]] is not of type 'boolean'
   	[21, 22, 23] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e08000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[9, 10, 11, 12]] is not of type 'boolean'
   	[9, 10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: can@4e18000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[9, 10, 11, 12]] is not of type 'boolean'
   	[9, 10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[10, 11, 12]] is not of type 'boolean'
   	[10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
>> arch/arm64/boot/dts/ti/k3-am6254atl-sk.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[21, 22, 23]] is not of type 'boolean'
   	[21, 22, 23] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-imx219.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[21, 22, 23]] is not of type 'boolean'
   	[21, 22, 23] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-ov5640.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[21, 22, 23]] is not of type 'boolean'
   	[21, 22, 23] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-csi2-tevi-ov5640.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[21, 22, 23]] is not of type 'boolean'
   	[21, 22, 23] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
>> arch/arm64/boot/dts/ti/k3-am625-sk-hdmi-audio.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[21, 22, 23]] is not of type 'boolean'
   	[21, 22, 23] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: can@4e08000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[9, 10, 11, 12]] is not of type 'boolean'
   	[9, 10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: can@4e18000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[9, 10, 11, 12]] is not of type 'boolean'
   	[9, 10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-hdmi-audio.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[10, 11, 12]] is not of type 'boolean'
   	[10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
--
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtb: can@4e08000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[9, 10, 11, 12]] is not of type 'boolean'
   	[9, 10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
   arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtb: can@4e18000 (bosch,m_can): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[9, 10, 11, 12]] is not of type 'boolean'
   	[9, 10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtb: serial@2800000 (ti,am64-uart): wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	[[10, 11, 12]] is not of type 'boolean'
   	[10, 11, 12] is too long
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
