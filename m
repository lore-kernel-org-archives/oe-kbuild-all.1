Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E593EBF3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 23:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211417; cv=none; b=rrNWGM+yOSkDTx6yA8F4pniMvn7+7pL1ZurIMDqJU5ZLsFu9lSAoUGHnXVbKrYxm0PgfKdcykztMo2ghwIYC1z6QWiCW8dqlpKEjT6h7nnYiG9zXwPHxPdMf3Qp28zw3KO/d0y1BE/rlo4KCa6lhg0sgxP8Vjt0tGz3dGCh2jQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211417; c=relaxed/simple;
	bh=YdlRJi8bM2Sts8I1V6afluNlBI2nfVTkWhJs8hccC7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MKUXBGJdrc/nydXAbhTjiFgP5bW2qZ+GYmNjHG0AJuu7cklQbztK7VQF6V8CVLBGnvn5MavZqeYNcE3qEHxXiSLPs6TQG/b/+ue5a1AgpmUbKDQn6YSWfAmtIc2LEz44FSY0MckF9UFWUTJvJ57JqC8S9ql9yz7P7h856AOH8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OV6TLDat; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV6TLDat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769211416; x=1800747416;
  h=date:from:to:cc:subject:message-id;
  bh=YdlRJi8bM2Sts8I1V6afluNlBI2nfVTkWhJs8hccC7c=;
  b=OV6TLDat3OsSb/aCoN5cq+FQhFBjA+FtVrqs1JFnYMgho9GSxtt3xdee
   p6bp3BB0SR1p7MyJjnI8Q92GKTBD1Yo9BYFm8RmHFy/rASmZ4mik7lhlY
   8jcgjX42ChuW4IiNFzPMKHXk9IAytLsoFEuIgbaXVgZn7GjlJwVVvahK7
   I8OQkh/GOb1IHavXkD7M2S7PgQah03Ieid2DhLDizrQtiW86t/0lwzsEx
   WPuVhzQ1EJzK5pytFyVQ4uNGF9AlKalQg0fEZI/zjEFTOUsanlCxyN2tM
   G0JznPOCdNj12vaZ5YVL9kllOZDrfG46CHls7D0crP338RPw7G0VcrFBW
   w==;
X-CSE-ConnectionGUID: jkvjb2JKRfG8P+as9xvjlw==
X-CSE-MsgGUID: aZJzLokcQwKiGZIDVJKYmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81581253"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="81581253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 15:36:56 -0800
X-CSE-ConnectionGUID: hzUmWIsQTfqwFiT1L85pjQ==
X-CSE-MsgGUID: 9iuUAwLlSCafoxBTqmYGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207572688"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jan 2026 15:36:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjQhr-000000000pn-1DU5;
	Fri, 23 Jan 2026 23:36:47 +0000
Date: Sat, 24 Jan 2026 00:36:20 +0100
From: kernel test robot <lkp@intel.com>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 7152/9290]
 arch/arm/boot/dts/st/stih418-b2264.dtb: spifsm@9022000 (st,spi-fsm): 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202601240039.lkXgOrKH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
commit: 90541270967837c996631faa94e43d465e2a20c7 [7152/9290] dt-bindings: mtd: st,spi-fsm: convert to DT schema
config: arm-randconfig-2053-20260122 (https://download.01.org/0day-ci/archive/20260124/202601240039.lkXgOrKH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240039.lkXgOrKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240039.lkXgOrKH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pin-controller-rear@922f080: failed to match any schema with compatible: ['st,stih407-rear-pinctrl']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pin-controller-flash@923f080: failed to match any schema with compatible: ['st,stih407-flash-pinctrl']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sti-vtg-main@8d02800: failed to match any schema with compatible: ['st,vtg']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sti-vtg-aux@8d00200: failed to match any schema with compatible: ['st,vtg']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9060000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9060000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9080000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/sdhci@9080000: failed to match any schema with compatible: ['st,sdhci-stih407', 'st,sdhci']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/lpc@8787000: failed to match any schema with compatible: ['st,stih407-lpc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/lpc@8788000: failed to match any schema with compatible: ['st,stih407-lpc']
>> arch/arm/boot/dts/st/stih418-b2264.dtb: spifsm@9022000 (st,spi-fsm): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml
>> arch/arm/boot/dts/st/stih418-b2264.dtb: spifsm@9022000 (st,spi-fsm): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/st,spi-fsm.yaml
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dwc3@8f94000: failed to match any schema with compatible: ['st,stih407-dwc3']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pwm@9810000: failed to match any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/pwm@9510000: failed to match any schema with compatible: ['st,sti-pwm']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dwmac@9630000: failed to match any schema with compatible: ['st,stih407-dwmac', 'snps,dwmac', 'snps,dwmac-3.710']
   arch/arm/boot/dts/st/stih418-b2264.dtb: dwmac@9630000 (st,stih407-dwmac): $nodename:0: 'dwmac@9630000' does not match '^ethernet(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e20000: failed to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,slim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e20000: failed to match any schema with compatible: ['st,stih407-fdma-mpe31-11', 'st,slim-rproc']
   arch/arm/boot/dts/st/stih418-b2264.dtb: /soc/dma-controller@8e40000: failed to match any schema with compatible: ['st,stih407-fdma-mpe31-12', 'st,slim-rproc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
