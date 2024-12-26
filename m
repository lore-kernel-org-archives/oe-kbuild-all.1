Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136FB8F40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735186749; cv=none; b=JNsQ6V2JQmmOjx1dr+hdn2sHWbZhshjmQkthmhYNDfQYASAyV8znJZf/SoZfNdNIPHCYB99FXxe27RqUh6NJiLVhlti/tdbPy21KyHOEEo/ykKvQEpo7hHAY/Rh3ljNTL5gYqFhhnrtXKPBVRCfH47o/OjSOKtTg+J90dvF4Cr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735186749; c=relaxed/simple;
	bh=2CWI6vGuGZH7C/EwbHQA+iO3YT2c3ehcVGfuVLhqR08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSaF44jFUhq3yJwh5PNo4rzKQGYMR1lfrY+fTIi6ht7fm9XP6A1nX5/wfFS19DCbllkKyjSGIP8eqIyQPK1/5kp6huDpmEjs940JstLC2m6G2/E1Qvg0EJguprmwO5Muy3YomeK9JUlDsPLKm6bCBDUYwk4zPaz6s3Og3BDCv8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iz5jF6Zj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iz5jF6Zj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735186747; x=1766722747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2CWI6vGuGZH7C/EwbHQA+iO3YT2c3ehcVGfuVLhqR08=;
  b=Iz5jF6ZjB99H19nTFB6qHfO+/9fs3NmBhPWrooer1BQgvAxooYgpMiwr
   2e2mvQYAf9PlMraUj1hgPEJEBv5ufaCS2pHmYkBaXXYKsoAWnwNpbjXWr
   OwQLemYJZD3QGoeAKUNQnchDTnKyciExs+DrU+CEBc5nfSMTYnTQJiJLT
   vA/crtVG8FohZSwvWm5CrwoAU2g6iSueUXTd88RqXE9jEj8uPmJofSwuw
   YfSbAFsSngLMP3gLjjmDgDZ8Zgaiqn1pvUlNU9VT/MprOkJ0PmBcdU3d3
   4SeNy4Ccp9Nai1PO4ESxv7kfOQd4Ut4bARxuEv7J4amxKU8xi1GGdscpU
   A==;
X-CSE-ConnectionGUID: JOuEmw1zQsKL7XZvk00NJQ==
X-CSE-MsgGUID: Er8J7LJkTAG67Vec6nH7Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="53138584"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="53138584"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 20:19:05 -0800
X-CSE-ConnectionGUID: M00EoJchS9eVmuCnWKKIpg==
X-CSE-MsgGUID: MvjmHbpiQB+vmez5A0/Bzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104476076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2024 20:19:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQfKw-0002Kc-1w;
	Thu, 26 Dec 2024 04:19:02 +0000
Date: Thu, 26 Dec 2024 12:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 4/4]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: i2c@11009000:
 Unevaluated properties are not allowed ('mediatek,default-timing-adjust' was
 unexpected)
Message-ID: <202412261248.NJbUzfcX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   811e48e07be5a00b2472cecba280dd56c8c200ef
commit: a3e7c6a8ccc078fdf3ce4f6d4901016fa85972d7 [4/4] CHROMIUM: arm64: dts: mt8183: kenzo: Enable G2 touchscreen support
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241226/202412261248.NJbUzfcX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261248.NJbUzfcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261248.NJbUzfcX-lkp@intel.com/

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
