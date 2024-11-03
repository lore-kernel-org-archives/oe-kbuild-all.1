Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B633F9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 03:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730603474; cv=none; b=XCAPKOWYtZq7Xlu5m9OfYY9dsV8opkKKdfzRO8DNOZYuWxrzMNmBEDGk0qCOm+uGB1YS7vznMYCL5DYGEcY+ZY6Q9Lky01q8Fmgg4+R94BvWvcXpM79z9Jf8Mq51m6agpqA8l6/5r2qE3j1ZFmLuL6FumNAbO+NbfPuuZI5icnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730603474; c=relaxed/simple;
	bh=535/n7FxcDmp0cj6oc5+b4zIRgOtFwo0el9hFXQXLFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHA+sA/HAg1bO78Kln0uZalltLtkY2HiWPd7xHD9/U1MzLkEiZ/CvsVnZjF2enaok7csOq89kB3c/k4lCJGaLXLd4InWxf9l/G5c4rcPOblbkBancH24qVngv7e5xEzpKNIM49/VJA/qVi4SoBvuRjQWXrACx65PdeVxtmWFgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeGRNIhd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeGRNIhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730603472; x=1762139472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=535/n7FxcDmp0cj6oc5+b4zIRgOtFwo0el9hFXQXLFc=;
  b=QeGRNIhdoIIy21Ei1gJc53KChULno6z8XE6PfTP5aTq64HDUekC87oWZ
   Szc7xCEE5JO9M4uxOhkoQLFQiC5EGSYm0RoxBOK0SbdJ5e6Xh0A+d+sQW
   U9kf1NSW6y6e1wUMXPwI7ot0I4ijye5m4OdgyHYSapkqquPaBlrYaJY2Z
   6nyrP0kq77tNlmlxNHRQpmI8QHp04LYV97htRqDaGymV5U6UzfrxcjfpU
   evujzONBnKaDnlVUl/TCfXOpXKI5ux0H7ULoG01ynCxik00NjKLLYGT8W
   F88/C9R+Nt6dz61QY23LUqRRqQFtXmmX4Reepn2iD6Q7Ix4sevREH9g+q
   w==;
X-CSE-ConnectionGUID: v7vAarpgTg+FoK6hnhRGfQ==
X-CSE-MsgGUID: vaFnT7HQQD2zdRwUj9qmqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="40902704"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="40902704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 20:11:11 -0700
X-CSE-ConnectionGUID: uZgFBCdqSD2bPlsjlPcBAw==
X-CSE-MsgGUID: jMGSQvKyRO6zNYK1nrsx+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="120766347"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 20:11:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7R19-000jcz-0j;
	Sun, 03 Nov 2024 03:11:07 +0000
Date: Sun, 3 Nov 2024 11:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 43/189]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: max98390@38:
 '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202411031147.cThiEvFy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   bd57356c030389bab042dec37d331a593de8cc7b
commit: 294de26cda439a5820150dd67d514027743c4339 [43/189] CHROMIUM: arm64: dts: mediatek: mt8188: Remove maxim,dsm_param_name property
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241103/202411031147.cThiEvFy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031147.cThiEvFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031147.cThiEvFy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: max98390@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: max98390@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rt5682s@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: rt5682s@1a: 'DBVDD-supply' is a required property
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: max98390@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: max98390@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pcie@0,0: 'device_type' is a required property
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: max98390@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: max98390@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: es8326@19: 'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8326.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@112f0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@112f0000: Unevaluated properties are not allowed ('dsc-reset-gpios', 'pcie1v8-supply', 'pcie3v3-supply', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pcie@0,0: 'device_type' is a required property
--
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'vsn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'vsp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'ddreset-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: hid-hx-common-spi@0: 'himax,pid', 'himax_gpio_irq', 'irq_flag' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/himax,hx83102j.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/thermal-sensor@11278000: failed to match any schema with compatible: ['mediatek,mt8188-lvts-mcu']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: max98390@38: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: max98390@39: '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/maxim,max98390.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rt5682s@1a: #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rt5682s@1a: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rt5682s@1a: 'MICVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: rt5682s@1a: 'DBVDD-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
