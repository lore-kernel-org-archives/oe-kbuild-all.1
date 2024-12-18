Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D074C1A9B4A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 22:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734559836; cv=none; b=jqW4ldY2tiLf2/YA+L1DTu0DSqzTeYUiq4yXVx4TjlayDMbP8tQF+zHLUJ2m47m+Y8USLGE9FDYL8/4SYi7wIIXy6s7rG5FjaKASmV8NUR/UgCrlgqj8n1V36soQHpa7evDq5q9K1rRN1dv89sQH4GHj6K2EpRDe5GZZ7VpFyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734559836; c=relaxed/simple;
	bh=+ZcAphwxYTyxEdwZCQB3WwNUvcFYnirPrIVOLsoMqM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pyf2/tr/4DO777Yz+AoBOlxp3YuWhrwUUcUaH+qhIjzLTJKFct3TTfV3zJ6AXvA3ePkzGwav+cLUWpyHPyiP8nRbmrA85BCs1GXbe1b3PC/prfHbzXayAtZ4SazFWLwsTD7eFwLxe+VQBz3h9Ut1vU4hXfGXDCJkKsRiB2Rtw00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Apy/jkEl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Apy/jkEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734559835; x=1766095835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZcAphwxYTyxEdwZCQB3WwNUvcFYnirPrIVOLsoMqM0=;
  b=Apy/jkElRTTqqAvw534slulZdGNxv+PE+BAgHjX2ajT7m23JSo1kVEp0
   B/YVBbucDrZG6BrgBqvWoV/r1TAHcKy4FSlnWgxQcD6Al9yz2UxgkQ5fX
   oC6ZismCGoIHt0yy+GgfZBmKNHmIx/76G86Uf1cCGZMHLX+BAhBRsXmjC
   yt8CG8PeTHMeL9WtRPp7j9Qos4Row6xF30ozIwRaDDifbTSYvHOSIW1j0
   CGeTUEzy9SUkXFzHhpV3g3YnDDZqr0K3qr5/t2ouDYqvjuwtWKi1TYZd2
   Zfa+lVM7j/v0n5bJZiVwamVGhY1lh9K6xDx34P9uvUe5StiDVvx9b/Kzs
   w==;
X-CSE-ConnectionGUID: u+G6ev8pQVKhCPDkcR7v+Q==
X-CSE-MsgGUID: qbFFUrHMRp6756DERi1bbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35182998"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="35182998"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 14:10:33 -0800
X-CSE-ConnectionGUID: eekGJfOqShKp0SV523KavA==
X-CSE-MsgGUID: jJSu0ZSVSwuFhItVRxvC8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102135790"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 14:10:31 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tO2FQ-000Gfc-2t;
	Wed, 18 Dec 2024 22:10:28 +0000
Date: Thu, 19 Dec 2024 06:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4387/4476]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupts:
 [[1], [2], [3], [7], [8]] is too short
Message-ID: <202412190650.9Cw7Afwh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa366f1b6e376c38966faa42da7f0f2e013fdab
commit: 8c4a77dfb1a3bd11ad83c202c3b898026b2afcf2 [4387/4476] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: arm64-randconfig-051-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190650.9Cw7Afwh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241219/202412190650.9Cw7Afwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412190650.9Cw7Afwh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:409.11-429.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:426.12-428.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400: interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400: interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400: interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000: interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hvs@107c580000: clocks: [[18, 4], [18, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:409.11-429.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:426.12-428.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000: firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: gpio@7d517c00: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/brcm,brcmstb-gpio.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400: interrupts: [[11], [12], [13], [14], [15]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400: interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400: interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400: interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: firmware: '#address-cells', '#size-cells', 'dma-ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/power: failed to match any schema with compatible: ['raspberrypi,bcm2835-power']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: axi: gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000: interrupts: [[2], [9], [16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hvs@107c580000: clocks: [[18, 4], [18, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2835-hvs.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
