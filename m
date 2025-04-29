Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F4B25EF84
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958408; cv=none; b=cRYBxYrxmmXojmq+9RCKJpnThVOcwLJkhJ+W2AJuS+xciG0pgMvSFRWOUw41tuqD5w3bHYJxMJw2VYw+wiCRfccFeXmMYcI9ASoaM4W1ilLL7vZutt5LYBNZCyUbmj5YJ7j11oWZA9PiWIa/GV0yf70QT8PnFnIObHwmOZGQTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958408; c=relaxed/simple;
	bh=O9SN6KXyLttQ9J/2YmYAJmKCLphDwPcZ4jsTd8VgA80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOpwcBnfimH1hJ+JgRZNTrQl8Q+mYy3DwHoym0HHwr61ieMDTb0jRhHS1mGhqAP6wmj3GrAyh4/D3H+0HjtBIm42g1U8Jdwn+OB+9ThXJdecwhe+XsJA2JOV729/NGMq7XmKK7r8dQQEPrqqPJC7p1ttilgswFR1P2zxAP4KeCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fr/NaEIX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fr/NaEIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745958406; x=1777494406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O9SN6KXyLttQ9J/2YmYAJmKCLphDwPcZ4jsTd8VgA80=;
  b=fr/NaEIXc7viFoP+1NqcVU2hVO5AVNuQ6DjFezWikI7WzihtNoIsw7C+
   bFanqvofmNCp1Gfa0F9YT1q6U80BsX/WAwDtuZ8n+k8xbqjeBUVHjzReJ
   wU8IaAFZB+/1ibSNGYFHMiqib7M3Z67P3pF2A3/lPYrODASjHFPTiYhJM
   Gx77J3hWLq0vSkq2F6q16LlC4x/PdEnsjOQ37sn/FjopF9k9HNl98Ckip
   Yu0BGNPKarpU2eWAQiUTJ+1Dvth+bjhsyhMvIycTi+MyEmtOQfNq3CV+H
   6jpjZATuerQmUZZ40Mthq1HbOd+O8cV23ukTXtD2FArlAsfja1fbYsHFm
   w==;
X-CSE-ConnectionGUID: rPokSuyNQp2IBztlgEEJGA==
X-CSE-MsgGUID: xQryxdvZQeShtZPUrP8taw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51264942"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51264942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:26:41 -0700
X-CSE-ConnectionGUID: QGxSJYrZRFCBbMU2+BO8Dw==
X-CSE-MsgGUID: m5cwJWAwRRWXwJUb4rVZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133641186"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 13:26:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9rXJ-0002un-1J;
	Tue, 29 Apr 2025 20:26:37 +0000
Date: Wed, 30 Apr 2025 04:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [linux-next:master 5714/7105]
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: cec@3960000
 (nvidia,tegra186-cec): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202504300428.XjDiAPOA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 5bc68bd3826e573f9a83c82c5107536cf616fea8 [5714/7105] media: dt-bindings: Document Tegra186 and Tegra194 cec
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300428.XjDiAPOA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300428.XjDiAPOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300428.XjDiAPOA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: cec@3960000 (nvidia,tegra186-cec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra186-cec'] is too short
   	'nvidia,tegra186-cec' is not one of ['nvidia,tegra114-cec', 'nvidia,tegra124-cec', 'nvidia,tegra210-cec']
   	from schema $id: http://devicetree.org/schemas/media/cec/nvidia,tegra114-cec.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
--
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
>> arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: cec@3960000 (nvidia,tegra186-cec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra186-cec'] is too short
   	'nvidia,tegra186-cec' is not one of ['nvidia,tegra114-cec', 'nvidia,tegra124-cec', 'nvidia,tegra210-cec']
   	from schema $id: http://devicetree.org/schemas/media/cec/nvidia,tegra114-cec.yaml#
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /pcie@10003000: failed to match any schema with compatible: ['nvidia,tegra186-pcie']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /gpu@17000000: failed to match any schema with compatible: ['nvidia,gp10b']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['maxim,max77620']
   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: hda@3510000 (nvidia,tegra194-hda): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra194-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvidia,tegra194-xusb-padctl): ports:usb2-0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: padctl@3520000 (nvidia,tegra194-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra194-xusb-padctl.yaml#
>> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: cec@3960000 (nvidia,tegra194-cec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra194-cec'] is too short
   	'nvidia,tegra194-cec' is not one of ['nvidia,tegra114-cec', 'nvidia,tegra124-cec', 'nvidia,tegra210-cec']
   	from schema $id: http://devicetree.org/schemas/media/cec/nvidia,tegra114-cec.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: gpio@c2f0000 (nvidia,tegra194-gpio-aon): 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bus@0/gpu@17000000: failed to match any schema with compatible: ['nvidia,gv11b']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['maxim,max20024']
   arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/ethernet@2490000: failed to match any schema with compatible: ['nvidia,tegra194-eqos', 'nvidia,tegra186-eqos', 'snps,dwc-qos-ethernet-4.10']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: ahub@2900800 (nvidia,tegra194-ahub): admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: admaif@290f000 (nvidia,tegra194-admaif): 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: hda@3510000 (nvidia,tegra194-hda): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra194-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
>> arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: cec@3960000 (nvidia,tegra194-cec): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra194-cec'] is too short
   	'nvidia,tegra194-cec' is not one of ['nvidia,tegra114-cec', 'nvidia,tegra124-cec', 'nvidia,tegra210-cec']
   	from schema $id: http://devicetree.org/schemas/media/cec/nvidia,tegra114-cec.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: gpio@c2f0000 (nvidia,tegra194-gpio-aon): 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bus@0/gpu@17000000: failed to match any schema with compatible: ['nvidia,gv11b']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: /bpmp/i2c/pmic@3c: failed to match any schema with compatible: ['maxim,max20024']
   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active', 'cpu-critical', 'cpu-hot', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
