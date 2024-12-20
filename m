Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E135218AC0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708762; cv=none; b=jdGW1Ark+2GizqXJHYRKviL6a4nzRQq8MIrnIOD7fZHJG4M/W1CndkjyMZx7Z9YoMz3B9gpC6OPrWd2kThbgGHfPsKRFa+Kp6h+e8NhTkjr5lg3rfWNU5IFgo7Cy6KYhcKwID85Jh3Zf1HNU1kMI6nhsS4fcYsJnn7vCcy6zN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708762; c=relaxed/simple;
	bh=/zUhRQqJ5Wm77FHM8dvYziV91GZtGz1M2zrOxkxlPRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsoFw4FTQbhT2Rj/k0Zri4J6Q/VjP/UlwSSE0jws3gywtSWlqEUIosQK75MOVlfNeWXkYfsJYI4eDSlVGyW1rj1MbazAfgM39boEpegSy5uV9wT+oRLG7BGwpa3/C10VFzrBAEFXpZUgbOtWxjQpwdiJU8N/HlUOixNkTx+uvDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frrDhOLs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frrDhOLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734708761; x=1766244761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zUhRQqJ5Wm77FHM8dvYziV91GZtGz1M2zrOxkxlPRI=;
  b=frrDhOLsdShsbVNp/rwj3pIuIJ/IP+ELVHkVgYzn+eT1REcrjg3trpIq
   2P/NhrSyjdM86ddUA9jvqXIUNZtj16wnz/l+Xy1ma5Q2tvzMGyNNPMYZs
   V+KlnyPx+CpJLpOyBF7eF+Icpn40SU0W7FRBGm6Q0Oef94fSvnuT0I5yr
   /j7XAQgLLPSzA0peUWgB/3t+io9eayQOa106n2TPVUf2xiemP4qLbKzMV
   pH5ezlbOt6kL+78me5V0cjycmRmUGrhUSpLRk2JSWFopIik6djxDAoqhM
   nPaPfiMyUayYbrJ1jxLLXgdz5C7ynHUc4OGqQ7VUXLSj172+Dtr3UcGt6
   g==;
X-CSE-ConnectionGUID: AXldTLG9TO6Et/b2z7w46g==
X-CSE-MsgGUID: VkRJO2XMSvO6XYIh4QnNhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="52783333"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="52783333"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 07:32:40 -0800
X-CSE-ConnectionGUID: iMRdA8iEQU2oAG+3mFpDYA==
X-CSE-MsgGUID: Xx1Vt0x6S2m36noce9ptVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121822559"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2024 07:32:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOezU-0001L5-38;
	Fri, 20 Dec 2024 15:32:36 +0000
Date: Fri, 20 Dec 2024 23:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 437/540]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: i2c@11009000:
 Unevaluated properties are not allowed ('mediatek,default-timing-adjust' was
 unexpected)
Message-ID: <202412202310.50hA1bfC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   76e007709ba23b69273c6c8ed1a893c1ec7b7df7
commit: a3e7c6a8ccc078fdf3ce4f6d4901016fa85972d7 [437/540] CHROMIUM: arm64: dts: mt8183: kenzo: Enable G2 touchscreen support
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241220/202412202310.50hA1bfC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202310.50hA1bfC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202310.50hA1bfC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: trackpad-pins: 'trackpad-int' does not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: volume-button-pins: 'voldn-btn-odl', 'volup-btn-odl' do not match any of the regexes: '^pins', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: i2c@11009000: Unevaluated properties are not allowed ('mediatek,default-timing-adjust' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
