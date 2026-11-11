Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383659;
	b=TaYdHHCEzE8rrCMH94Cb6WfImGNfhNiCjxMIrBHK2LE474TmKtEvr6WTqkyaHqgrrSJM
	 Rz5v2/LEPrxHXr6QS/enZzqLrhzmsRg/gS9t6ckNb4mrLkXN1EmZ9FskPQdNT+s89PgKp
	 A3Xa9gMKFNRS2BaII2EWoqU3hhIMaj6P9SC6R2AcGrEyc5Sxry9KnUk5SOMK1QTgT+A+X
	 IlQtRZ+A0xcQnhYZ0emoqK1MyU2skvl5IagKqeBrI4p6Hku1SKa9Gb49Q2uFFCQvDrHo2
	 otbWxnNOii1vvTYKd4Maesgg8tseHnEGTdqFge1GzaDH/rddrGFoHA3ZL5SLrFm9Nbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383659;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HncIg01mr318xmpCtEx3AJ24a4eymqrvq4CUphLSmHk=;
	b=xxsgngW7vPYrk493izEgcDNA/5HuiA35yKfD5HRd35Cs8CysIaYkKU1TLyybH0Rkwtjw
	 c60QcNNHpAfU+gPx2Hgu2auo/TULi0cmv1gvR/zIwS8+BGt+oYXzDzG8YISGT6fmDBBQq
	 RaQkCaENvjzaSzc7Z6BQkrUf1mtE/oixmxjla9N5KcWTXkEYB70XS3Y9anOkn7/xYMfuL
	 xXAwpmWGxsqRy+geXXMVvW9+TwHHAFwcAY8sueVh2K1cK7w9xWftWlKvjsRnBzKhbTTDY
	 fCQoCmfdXyFZsaGSP+Z3nG1Ukcgaqsd+cwaFYUpLxCuCfmDhtRoLPk68dLrxK/vpOAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PeutG58o;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 07:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B9A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PeutG58o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794383658; x=1825919658;
  h=date:from:to:cc:subject:message-id;
  bh=uPlOr2SEJwh3y0JAhClSySFnxvQfvY7oMErj6VOfrUM=;
  b=PeutG58oQHnTeKOyoDFWWB/u6bhCZRsg48sReBNtJTCYkyPyWMBZfU6D
   HyJfj+oTdCERhuivQovv5zVkr7YzI/fmvAf13Lh29InqE4bFds7uogI+R
   +eY2Cm9yX6wC2/LyHAhh8ztxur7gucYzy8tZKlfVjVZsfLI7mD/Y7AMqE
   kzFzwmksGKe2noH3LIumL6z7vB6z1DybLsa7970yb++BHm7GhDPcWH92p
   GPCI/rLEpaqc/sFN9VCrwOzNN4ccx/geJIMMM8y23p0SbDJ+LsYpU0xER
   31dYf9rPWQfRGA4M6Y0v0MkU83Y6TLIa9Pfhw0CznLG3Va+QwH6TmLGhD
   w==;
X-CSE-ConnectionGUID: 85+gTYDST0mTh7FXm79vOg==
X-CSE-MsgGUID: MkGm27fXTduzbzKgL33X6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3236806"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3236806"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 23:54:17 -0800
X-CSE-ConnectionGUID: zGOj4KndSiafHNmwcTHNqA==
X-CSE-MsgGUID: UgrRYgFDSJ2GBi1c7Bp45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8673401"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2026 23:54:14 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR39o-000000000XT-1vTJ;
	Wed, 11 Nov 2026 07:54:12 +0000
Date: Wed, 11 Nov 2026 08:53:32 +0100
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 5703/6082]
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2d000000
 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
Message-ID: <202611110848.XSxrGclM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
commit: cebd1c0961d802092bdb68c591d4007b1b662296 [5703/6082] dt-bindings: gpio: vf610: fix clock requirements per SoC
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611110848.XSxrGclM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110848.XSxrGclM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110848.XSxrGclM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2d000000 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2d000000 (fsl,imx8ulp-gpio): clocks: [[19, 21], [19, 9]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2d010000 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2d010000 (fsl,imx8ulp-gpio): clocks: [[19, 22], [19, 10]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2e200000 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: gpio@2e200000 (fsl,imx8ulp-gpio): clocks: [[41, 18], [41, 18]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
--
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: gpio@2d000000 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: gpio@2d000000 (fsl,imx8ulp-gpio): clocks: [[19, 21], [19, 9]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: gpio@2d010000 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: gpio@2d010000 (fsl,imx8ulp-gpio): clocks: [[19, 22], [19, 10]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: gpio@2e200000 (fsl,imx8ulp-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: gpio@2e200000 (fsl,imx8ulp-gpio): clocks: [[41, 18], [41, 18]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
--
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts:202.10-242.4: Warning (avoid_unnecessary_addr_size): /soc@0/bus@42000000/spi@425e0000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dahlia.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-lino-verdin-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-toradex-osm-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dahlia.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-lino-verdin-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-toradex-osm-dev.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-evk.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43810000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43810000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43820000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43820000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43840000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43840000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk.dtb: gpio@43850000 (fsl,imx94-gpio): 'clocks' is a required property
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:55.18-58.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-clover.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-navq.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-ivy.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-mallow.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dev.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-ivy.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-mallow.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-mqs.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[25, 119], [25, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx952.dtsi:348.6-1539.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
   arch/arm64/boot/dts/freescale/imx952.dtsi:348.6-1539.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-tianma-tm050rdh03.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-11x11-evk-mqs.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[3, 117], [3, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[3, 118], [3, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[3, 119], [3, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca-rgb-cdtech-dc44.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-evk-mqs.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-14x14-evk-mqs.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-02.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43810000 (fsl,imx93-gpio): clocks: [[6, 117], [6, 117]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43820000 (fsl,imx93-gpio): clocks: [[6, 118], [6, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@43830000 (fsl,imx93-gpio): clocks: [[6, 119], [6, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-lvds-tm070jvhg33.dtb: gpio@47400000 (fsl,imx93-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie0-ep.dtb: gpio@43850000 (fsl,imx94-gpio): 'clocks' is a required property
--
>> arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43810000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43810000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43820000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43820000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43840000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43840000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-pcie1-ep.dtb: gpio@43850000 (fsl,imx94-gpio): 'clocks' is a required property
--
>> arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43810000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43810000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43820000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43820000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43840000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43840000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtb: gpio@43850000 (fsl,imx94-gpio): 'clocks' is a required property
--
>> arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43810000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43810000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43820000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43820000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43840000 (fsl,imx94-gpio): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43840000 (fsl,imx94-gpio): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx943-evk-mqs.dtb: gpio@43850000 (fsl,imx94-gpio): 'clocks' is a required property
--
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[24, 119], [24, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
--
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
>> arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43810000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43820000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43840000 (fsl,imx95-gpio): clocks: [[2, 119], [2, 119]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-vf610.yaml
   arch/arm64/boot/dts/freescale/imx952-evk-mqs.dtb: gpio@43850000 (fsl,imx95-gpio): clock-names: ['gpio', 'port'] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
