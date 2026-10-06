Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC63542D4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286079; cv=none; b=t1EWYkPwLDlHHgLBUxGS97/2AFA2sQ72FBHlH14KNuVGzFGQkrVfirwN5++5PLZmUhT8FG/jytF8qq8Kwzoa7ybztkFYPa7/4Ko5GXmdk5PT6X2KwYgrwtC24h6RZZtegBYdzZ1Y5of3fz0f3UuoQgMXSCTqv5earX7yRkq4bco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286079; c=relaxed/simple;
	bh=bcsDD/g9ZeZmHVvheDdFuG+GE2sxWnHNHu9iGbcQBKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FtxI6fX5XTC94CV/7EO52lYcDrjosDdvkbDMfOo3rUbViOqh+g2/Z7Bbd0/8o/6yyZZDKQ0drErZGFAW/HRnax/DfE87sgtU+Ib4+wHT1/I1GJkfnzzg/iA+TmESIwofla43DwwiQw3jpkxHrFS2HJaI+xnc3K1PZL25BZbAawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSvb8ebQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSvb8ebQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791286077; x=1822822077;
  h=date:from:to:cc:subject:message-id;
  bh=bcsDD/g9ZeZmHVvheDdFuG+GE2sxWnHNHu9iGbcQBKY=;
  b=HSvb8ebQqyN4iHoe8txylAuvW3z2fPHtQCi5gYjFi4y1ra99nRbmUkzp
   3GNkK1TGUKvv65ubiv/4jMlFV0t6TiEZBdVPBqo81G+18wNv0Yh9HTSVD
   meZnBGVLhKFjEkjbLE6F6BIIv0DoedGbE5Esqgy2rn0u5l5XPLKV36P06
   mHH8a0iCEIOSrQwdDNHGmTWg6orkKsQFntppfh2DRH0pBW/2Ilm61Q0PO
   CgVDqs20u3r4Dlsh1y9QRG6kjPGRW15hLLur14pcgUSXfD3dBw2yarGx3
   e1zY7XBfrnwBw6hE3+Vw26K5dHlz/wNqTlZ8KspwUgWIhXOMXXo7RJDFI
   Q==;
X-CSE-ConnectionGUID: 21Ihqt59RrmII1rSxhcbyQ==
X-CSE-MsgGUID: dkGNe6w4S+usezX5P+AhKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="30062"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="30062"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 04:27:57 -0700
X-CSE-ConnectionGUID: obqsWO8AQxykh23aeFfIMQ==
X-CSE-MsgGUID: AVjGSj8gRVyA4OTT9AlRQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280414601"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Oct 2026 04:27:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE3Kq-000000001Ap-3gch;
	Tue, 06 Oct 2026 11:27:52 +0000
Date: Tue, 06 Oct 2026 13:27:27 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 10820/14242]
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811):
 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202610061355.pgZ9VogQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
commit: f05cb3d259d3fb9f811cb9b14591ab08e9e7a182 [10820/14242] ARM: dts: imx: remove undocument properties of st,stmpe*
config: arm-randconfig-2403-20260930 (https://download.01.org/0day-ci/archive/20261006/202610061355.pgZ9VogQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061355.pgZ9VogQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061355.pgZ9VogQ-lkp@intel.com/

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
