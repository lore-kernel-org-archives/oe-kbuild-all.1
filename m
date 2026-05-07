Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165C37757C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174083; cv=none; b=QzsecEf3i4ZljbplRE0pI5I/efCn4nI2j6m5D2GgvV4Zg/gVHOFqwksFQ91B46t0Z4YeVxtiTlDuslW1MJWW+2pGx367autWJWd34PURyy46r9fJiF8H8qXCiIQSa1eemm2SJEq3ygGlpJpILl93NY4X3U4htUo6ioNOOc/D88s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174083; c=relaxed/simple;
	bh=Ic0/RM1GDRcsBytvclWG9tGOQ5C7OgOUgpPLprNlCM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtqQoPYrt0bRhJuiKE3u0G445cvC7J/0+LluSJZlRvXWUwI8zCDlGVO9tnYNm3UPkn10V5CVi9vX5Ro/MTfuUCLjdamCMkYdfFYbRr5Cnih1WSKnXA3j+8VgOSKlwYs5wkWVfdXYZBrPvDxeswtIsElgPgOaKduWctWO8OOKM3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aksysmbs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aksysmbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778174082; x=1809710082;
  h=date:from:to:cc:subject:message-id;
  bh=Ic0/RM1GDRcsBytvclWG9tGOQ5C7OgOUgpPLprNlCM4=;
  b=aksysmbsgiwwN04w8FedgGP7EaAQgLAIgPjkyacLZdz+DXTQ7WIkYEAf
   7dNZY7XsUcRFbxECq+ENoYoo1gjTshMiLOEd1yoPZc90XUSWeXGa34AVF
   d1+MjTuIfPjHahWRv1WU4BIeYjO4+VdT9anJH4YcT5K+caTiVAxTLbcUF
   XwBT2wxG/8yLStct3kHuWDn+QvzqKC2hqNZY1mRfA6FUnaewhK/59PYVR
   WNXUB3w887OG1MoSUMk35Q7HoLCuopc/SoLFLSdhFAteW4z3tMbLJK59Q
   VgTjiRY/DHXDbNGZHZNQ0qUcfagrazHlklK/Mq6tpNah2yh685FmQumUY
   Q==;
X-CSE-ConnectionGUID: rMdfuqqbSW26vPcavTU++g==
X-CSE-MsgGUID: zYFcglP+SVu9DSX1+8pm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79178867"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79178867"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 10:14:41 -0700
X-CSE-ConnectionGUID: 9nNi2UYTQc+yDxgKNX9qqQ==
X-CSE-MsgGUID: TNKt3WNWRMCaJS5qsoRePg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241519878"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2026 10:14:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL2J3-000000006uD-2Xq0;
	Thu, 07 May 2026 17:14:37 +0000
Date: Thu, 07 May 2026 19:14:02 +0200
From: kernel test robot <lkp@intel.com>
To: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 2804/3796]
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: lvds-encoder
 (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202605071909.lXKPelNA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   735d2f48cadaa9a87e7c7601667878de70c771c5
commit: fe886aec2ef0b05a2e31b3f184fbe85b6aa9743c [2804/3796] ARM: dts: imx6ul-var-som: add support for LVDS display panel
config: arm-randconfig-2051-20260505 (https://download.01.org/0day-ci/archive/20260507/202605071909.lXKPelNA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071909.lXKPelNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071909.lXKPelNA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,sn75lvds93', 'lvds-encoder'] is too long
   	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
   	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
   	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
   	'lvds-decoder' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']
--
   arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
   arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,sn75lvds93', 'lvds-encoder'] is too long
   	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
   	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
   	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
   	'lvds-decoder' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']
--
   arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
   arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,sn75lvds93', 'lvds-encoder'] is too long
   	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
   	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
   	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
   	'lvds-decoder' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']
--
   arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
   arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: ethernet-phy@3 (ethernet-phy-ieee802.3-c22): micrel,rmii-reference-clock-select-25-mhz: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: lvds-encoder (ti,sn75lvds93): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,sn75lvds93', 'lvds-encoder'] is too long
   	'ti,sn75lvds93' is not one of ['onnn,fin3385', 'ti,ds90c185', 'ti,ds90c187', 'ti,sn75lvds83']
   	'ti,sn75lvds93' is not one of ['ti,ds90cf364a', 'ti,ds90cf384a', 'ti,sn65lvds822', 'ti,sn65lvds94']
   	'ti,sn75lvds93' is not one of ['thine,thc63lvdm83d']
   	'lvds-decoder' was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml
>> arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dtb: /lvds-encoder: failed to match any schema with compatible: ['ti,sn75lvds93', 'lvds-encoder']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
