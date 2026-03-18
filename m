Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601519C546
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860717; cv=none; b=QjOuaISM6vj3v5X0mKLKxhmi1XjlTQtG8GpUWz7uFDx1ubfOopVMpMZoEdWYOUYPaf3EvQkUvqf0Y05a4w7TfjiHEfqKdOzYUeMzA4Ozy2P5ZupmjdZyWtlRIwAxDYFZcJNAITEWePf0iOQKoAmSPG6179/CcaGrUqEGmAXtvKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860717; c=relaxed/simple;
	bh=pkhTL5jeGmDGEazBAK4LOflvDiRvySmo/5cu5heAArU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FPPS+kbxfNpL2cyeZoWFc1hZsCni6URI9ZHmyVpSFMwEuTsIkh0Hjdhem7vTetgbVJpUbNZji0eY4egKIcvu/I5wIbE1b30bGMGg2h8UFElGri33aeywvWwlQUcMvyxaigI+hPhT8BR1gjOi4DXyy7LUeNfDx4F6LIq0S/CmiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzENfVKx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzENfVKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773860715; x=1805396715;
  h=date:from:to:cc:subject:message-id;
  bh=pkhTL5jeGmDGEazBAK4LOflvDiRvySmo/5cu5heAArU=;
  b=WzENfVKxHekaR6wRNDsgIOgJ5hYm9cdwFiH373QpByipb0aXIM7nvn0s
   OdslgmAXA6JSXUV4ga6ovT43iboIauAfNRr30meiZqK1akROFBEIvS0Fo
   TUn7L1SFCGqKM2ggU4qrnvHYZsKlvByj/LMfUcB75HhkFsuKrMGAS5smv
   qMaCfsbK13UH3TluNt9p3bYTPkfF+PQumLcynmVyohFICZpCg9EAMaCyd
   4bWi53+581qky0EI23KCs6MHBo8JfiNVhVzLE4rX7aUdaBQwT0VXWEdd7
   3iL2mQ5XBUpLJWkXNcMUVVgI+xevco+rfjINR7Vz20c+2eBkBqrCZ/3fT
   Q==;
X-CSE-ConnectionGUID: 5pio6Jx6QWuBx2a7golszQ==
X-CSE-MsgGUID: CubDnHqlSRmNIvFhVUiQSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92499846"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92499846"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:05:14 -0700
X-CSE-ConnectionGUID: mHSitIVoQY6Cs75w3qy1Fg==
X-CSE-MsgGUID: CSRyY3oYR0aO+4WxyDI9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227676618"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 18 Mar 2026 12:05:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2wCc-000000004iP-2W8r;
	Wed, 18 Mar 2026 19:05:10 +0000
Date: Wed, 18 Mar 2026 20:04:17 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 6172/7246]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: rpi-firmware
 (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges'
 do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603181906.XORpVBJc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: e3b22edda733d7d3578bbb250d8605b1089d3d6e [6172/7246] arm64: dts: broadcom: bcm2712-rpi: Move the firmware node down 1 level
config: arm64-randconfig-2054-20260317 (https://download.01.org/0day-ci/archive/20260318/202603181906.XORpVBJc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181906.XORpVBJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181906.XORpVBJc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi:200.4-15: Warning (dma_ranges_format): /soc@107c000000/firmware/rpi-firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from /soc@107c000000/firmware (2)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:495.11-670.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi:193.11-218.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:512.12-514.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000 (simple-bus): firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: rpi-firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi:200.4-15: Warning (dma_ranges_format): /soc@107c000000/firmware/rpi-firmware:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from /soc@107c000000/firmware (2)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:495.11-670.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:53.7-63.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/pci@0,0/dev@0,0/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi:193.11-218.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:512.12-514.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000 (simple-bus): firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: rpi-firmware (raspberrypi,bcm2835-firmware): '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi (simple-bus): gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
