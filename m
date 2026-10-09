Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22449BD7C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540231; cv=none; b=XbARyemn8Qd3XdVmTQWqdPlNHX6LsUlllVsGKP/OzCbytFzw1UfFH3nWFzk6WBUsrKcJ1hB63PRrxm0qoP5agd30xwRMWPyNkis9Xn02kA4LMWqs1DohZrd+onTN7BLMu65YtgvldleRt7pyrLtyR+ya1WmAks7CvwFTFD9e92w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540231; c=relaxed/simple;
	bh=qxrZRTizrsHsKOZc16mW909TBm/UOaUCDSo9qVmfeE0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZWMVhNacAN5f5u1i4g3zcZ2I6KnrcvQTp1ZSkG5I0xjx0lGCRh1/MRhiwj3K3QKMF8KUSNra2E6E3ooG50fdme3fVuk5HGJCFS4JyyichfWLjQYR3Ev2hiuobweTRjLMP9Casd3C7jfOqQkHorqZJZnjfSckwvWkkkXiPQv4fMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iiw3zABR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iiw3zABR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791540224; x=1823076224;
  h=date:from:to:cc:subject:message-id;
  bh=qxrZRTizrsHsKOZc16mW909TBm/UOaUCDSo9qVmfeE0=;
  b=Iiw3zABRAiVuDY3O4jz792t7cUTsFr6EfyQVTo1kqWyr/Vto9cyccVbm
   fH65E+8i5qqye68SCLJGugLZ+QI7STs/SRGCynKIa3dCY3RAUl10rjVtX
   LsOXnkY+zeeQwaDmtu60TG+cqFxgbGXyfZS663b72Xuf00zlXuMcdRK+W
   KYePpRlzjRTp4NU9jttyzoPmJc2J0eudRXxhzfCYIDN2RToh2bpIpHHnG
   d67I/ec4Tqgg8p1QUdWdg6zgYTeZnuWRlbP747zBtWb7FEG4uFJb890kJ
   w3xLveNeiyuRYQi7lcbQP1whH8DzesjsCxxAjqdcki35hVC9xZaxjXRZ2
   w==;
X-CSE-ConnectionGUID: 4sYlOInrSCeXKCA/c4c0MQ==
X-CSE-MsgGUID: CqNnu/+1RQOQbirsUkByyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="433215"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="433215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:03:44 -0700
X-CSE-ConnectionGUID: yYazf1E2RUeoo77XQbrTJw==
X-CSE-MsgGUID: p4kV4v/YQDOBZJf8Ei47PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="381632"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2026 03:03:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF7Rz-000000006xf-1B8M;
	Fri, 09 Oct 2026 10:03:39 +0000
Date: Fri, 09 Oct 2026 12:03:39 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 10687/15343]
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811):
 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202610091216.47z22GCM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: f05cb3d259d3fb9f811cb9b14591ab08e9e7a182 [10687/15343] ARM: dts: imx: remove undocument properties of st,stmpe*
config: arm-randconfig-2403-20260930 (https://download.01.org/0day-ci/archive/20261009/202610091216.47z22GCM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091216.47z22GCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091216.47z22GCM-lkp@intel.com/

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
