Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D7B25B0AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 04:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791693776; cv=none; b=RPf+i7ijifTJtyMttxSOF6x2Yk3bZqZLZJVvIpo4KHXnj5M3DyRXJtYpCh+dghCpCNIvcNa4j3uqlGhVZyq/Lw+4wJj2cLyCmTrERfYrz1LgBRKN2wM7e3DSyaYX7phuejvcoUd0AMmeeMNpVK2p9CVJJtCcsAfViVVtk2U9y+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791693776; c=relaxed/simple;
	bh=+1z8tMRr3xaXUJl45LME7XcgqgFj2m8+JAkNCJRaohc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UTJnF3yYs8qjPxFDUTFjuDAUU1nnQ2AYiXs/miHRE+CwvsI+k4cSdkFKzhT2UUJCxlOE4gNmtNpEvS+XvkbDtRe97ekm7N+gi3oeBD1i7D+dQUSl6haUiIqtDpKTKTiAXRG4OHJcxvFg/aR486l50Hj3QABTqk7BYbZpyfCxeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Un5V4Hzk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Un5V4Hzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791693774; x=1823229774;
  h=date:from:to:cc:subject:message-id;
  bh=+1z8tMRr3xaXUJl45LME7XcgqgFj2m8+JAkNCJRaohc=;
  b=Un5V4HzkV9i5LSd6bwr1ovFQiz0Qg3JVwGKBYGJmuj8IAOtW0dr+LT7G
   mAXxftBQicSOxOeBsqv3+SknzI4Tj8bAUq1WrEvgiOa3D5R00zvVuRGe/
   EWqVrVORUT+fFsszLlzHNI0zGdvAtoasnDHEvRxswmsEFaUIZwUkT9dqT
   oowodeL+FAPV7BB9oMvZRhcVcDOXGO2NWWmZcCvK7UKNsb8heGTQEc/cK
   9+HUGCfoUriAd9Cs060bbbbPZMskK40qwGKPGb6Sfq0KIWYqmLYk+HaMG
   GCJExOpg+gyWIDZUImavUEtl9DlCwi+2nf++rYF+YasN09/IfImYdsNfi
   Q==;
X-CSE-ConnectionGUID: 8JPCg4ypRXqaP1NnS4hHVg==
X-CSE-MsgGUID: tYbFS3KhSB6En2knIgxxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="336580"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="336580"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 21:42:52 -0700
X-CSE-ConnectionGUID: rNGcT/TxT0WKgjnc2i/MZA==
X-CSE-MsgGUID: fq5cxGlWSDOYbQJi3s7dgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="750073"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Oct 2026 21:42:50 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFlOa-000000009PH-2SWP;
	Sun, 11 Oct 2026 04:42:48 +0000
Date: Sun, 11 Oct 2026 06:42:06 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 10873/16158]
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811):
 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202610110646.ZPy3hpa5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
commit: f05cb3d259d3fb9f811cb9b14591ab08e9e7a182 [10873/16158] ARM: dts: imx: remove undocument properties of st,stmpe*
config: arm-randconfig-2403-20260930 (https://download.01.org/0day-ci/archive/20261011/202610110646.ZPy3hpa5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110646.ZPy3hpa5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110646.ZPy3hpa5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dts:230.7-249.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/ethernet@2188000/mdio: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:936.28-944.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
