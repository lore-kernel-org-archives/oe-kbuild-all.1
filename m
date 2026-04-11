Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA65230BD9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775942606; cv=none; b=o9f1RvH/YGSTOt7OoUxdWsqRu0GOnhF7pw4/Mp+fVOXe6TsQJI7m7BvXp0wB9/jnWgQhcuCpN6hZjIiets5FnuqpCOzu4w/oNwArUTbGDx49lmWOa8rBwE0ZD5XQtycVi1KlK01txP+IZgyN+vIZDJ9vUh8k2gA/8J1Zho9kb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775942606; c=relaxed/simple;
	bh=jGGPIsdFW9gtt1JczdsrZmz0LoAYIF2ljqVrExxpy18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BcD040mqbQWr9jJf4AKba3Gco/iZoJN0WFyCen6gpROOgLKCduAqfCSC/ckOJpM7ml2PHuNxMqK19GejtBWM2BcloaXyeg3C6zbbIAsN4Av6ifu0S0+z37HctdNWFot3UFnLkTiJwlTFsnBLS36GR9aR8GhIFP0lB+f++6IWgII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiBrfVs2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiBrfVs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775942606; x=1807478606;
  h=date:from:to:cc:subject:message-id;
  bh=jGGPIsdFW9gtt1JczdsrZmz0LoAYIF2ljqVrExxpy18=;
  b=KiBrfVs2SHb6Pl3AOPRPxh4JdzhZuMpD0K2f9AEqNsoJ27jI0rxE7xrP
   B+t+tHOg2lUjrgJkGdeRWIx6BhsjyPXgsVtwtdvs8TqZLkP/tGpk4sG3Z
   xMM9p+xNmOLqQyuKjG57yuYBS6Gkqq41z+Cbqlolw0wA9kisEtqwKCS2H
   KemG2p02O5n4ZbBv77py1doXuPvRXEm7Di9iI4iU/W1Q8fhof0ZeaoueS
   IQWlKY4SMzg5Uf5fNf+P6+NF+oA+hAkHLX3uWXUnPWBSaVpVDQekXzNkv
   K7ZJLJjc3BPCqHGDFrV4t849HOlbnDwlh0VSAPws5Hv6+S3lzJ6jmqRBr
   A==;
X-CSE-ConnectionGUID: pBy7SDvnQDCraQqotLf3dQ==
X-CSE-MsgGUID: VqzsliClQEOD92d/H+uw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76802418"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="76802418"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 14:23:25 -0700
X-CSE-ConnectionGUID: UXBO4y6XSJ69ifIfAGiXPw==
X-CSE-MsgGUID: A2Si6w6eSbKZ+PrhVH+cOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="224679978"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2026 14:23:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBfnU-00000000B8j-2xOF;
	Sat, 11 Apr 2026 21:23:20 +0000
Date: Sat, 11 Apr 2026 23:23:19 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 4930/13385]
 arch/arm/boot/dts/ti/omap/omap3-n9.dtb: isp@480bc000 (ti,omap3-isp):
 ports:port@2:endpoint: Unevaluated properties are not allowed ('crc' was
 unexpected)
Message-ID: <202604112321.bxNlW5Ji-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66672af7a095d89f082c5327f3b15bc2f93d558e
commit: c16b58a4557370efdcf99ab6f978cb676b391579 [4930/13385] media: dt-bindings: ti,omap3isp: Convert to DT schema
config: arm-randconfig-2052-20260409 (https://download.01.org/0day-ci/archive/20260411/202604112321.bxNlW5Ji-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112321.bxNlW5Ji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604112321.bxNlW5Ji-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n9-modem']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-n9.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint: Unevaluated properties are not allowed ('crc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
   arch/arm/boot/dts/ti/omap/omap3-n9.dtb: leds (gpio-leds): 'heartbeat' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000: failed to match any schema with compatible: ['ti,omap3-dss']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/dispc@48050400: failed to match any schema with compatible: ['ti,omap3-dispc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000/hsi-client: failed to match any schema with compatible: ['nokia,n950-modem']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/regulator-abb-mpu: failed to match any schema with compatible: ['ti,abb-v1']
>> arch/arm/boot/dts/ti/omap/omap3-n950.dtb: isp@480bc000 (ti,omap3-isp): ports:port@2:endpoint: Unevaluated properties are not allowed ('crc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/ti,omap3isp.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/target-module@480cb000/smartreflex@0: failed to match any schema with compatible: ['ti,omap3-smartreflex-core']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: /ocp@68000000/target-module@480c9000/smartreflex@480c9000: failed to match any schema with compatible: ['ti,omap3-smartreflex-mpu-iva']
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: leds (gpio-leds): 'heartbeat' does not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
   arch/arm/boot/dts/ti/omap/omap3-n950.dtb: keys (gpio-keys): 'keypad_slide' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
