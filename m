Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADF14A4DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753430639; cv=none; b=ijJFXT9YaWeMmI1Z9d8NgLvppn/hvdQU+M/VT7GeqGli7RSWQmWDgZZ8k/7Gy2G+i9UeQNw3MQccrU3nnpUliaVYaE/pL2tnLCXvdeP2Yn0NWc52edLlgWidwDIStJ7B1HqNbA8iTxXKOLNiSgs3z0ZfYDVeCNYD4HDktVlOjY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753430639; c=relaxed/simple;
	bh=JqU4dUyojEBHT6pEkV1CLj2oLIkDNtw9OZIYlXPn/1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DPc2kD0F+a6aAd7LMhV2X5y8KFVkr+u7u5Id6zzymThVM5tFxdRVIK8eTAzHAqxFXOvY6Gt7N7huf5Jo0YJImzmex0xLld9D/g0Tpw6B1wHcgm2qPiZ9FxvCdSStgXo2M907Uz1JKW8bQQC/fk9OlRMWm1nWlhRFn2w3wKyGFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXKN3VOM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXKN3VOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753430638; x=1784966638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqU4dUyojEBHT6pEkV1CLj2oLIkDNtw9OZIYlXPn/1U=;
  b=LXKN3VOMEjNBiDm86DVlhPxKyZ+x780x2WZUqJifmKHVnC3j4YqdXfY7
   U6XKOXKsfmLrMFIrtCE3rrTL/RwXY/4L5wiizU479nCBZGbs+Yj68Nlte
   LDDfcwmZGklb1ybDi/5xwjc1r8v2cfb4DePQffbRJRSQ+L6YeUoIdt1PL
   irRrhU/RgkWWacBIKfhV6+Qjz4fddnfmwx83Di+9culdMz64apxN+BIg9
   Vq85oOTRh9rvHAZN8vWBu0wYAbYpJ8lHtqOdarTHo5sgNp39i+Cz73C8A
   Xpq2qaj/1dsgkdg0SS08EAXsS2xmYAWZF8sHsM1O+b1hFTVAnnbqhz4JC
   w==;
X-CSE-ConnectionGUID: XCc1yEPrQyypvSFRGizSXg==
X-CSE-MsgGUID: V1mFV3XBTPe9KC+FS+pZ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66329581"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="66329581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 01:03:57 -0700
X-CSE-ConnectionGUID: NqyJosLoS4ihIjE1I9CSfg==
X-CSE-MsgGUID: Y5nztuy9S+eCyB5t1H20rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="164951563"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 25 Jul 2025 01:03:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufDPE-00007z-2x;
	Fri, 25 Jul 2025 08:03:52 +0000
Date: Fri, 25 Jul 2025 10:03:38 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 9883/12319]
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c
 (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller',
 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of
 the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '...
Message-ID: <202507251020.7FikUmx6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: f03a7f20b23c1abb1066f791806bbca406362324 [9883/12319] dt-bindings: gpio: Create a trivial GPIO schema
config: arm64-randconfig-2051-20250720 (https://download.01.org/0day-ci/archive/20250725/202507251020.7FikUmx6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507251020.7FikUmx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507251020.7FikUmx6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   	'nvidia,p3701-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   	'google,nyan-big-rev8' was expected
   	'google,nyan-big-rev5' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54100000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /host1x@50000000/tsec@54500000: failed to match any schema with compatible: ['nvidia,tegra210-tsec']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /gpu@57000000: failed to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /dma@60020000: failed to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,tegra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
