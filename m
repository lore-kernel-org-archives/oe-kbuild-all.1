Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067FE6FB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752874786; cv=none; b=dRSynCAsvGGo1btGfdpSjrB2KBcNORX4rY7QkBO2ELJXLy1Iw8EqqbztHbbE7JK6J0jgRxkNo4CjPvHMlG5FuJuyqUdVNkgekbshiamvw89aoWdK89m7zyjjeCA7UTj+tOhzb9IwoeefxKFQDwAK2qDHbJ6VbVn3HgIUHdFKUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752874786; c=relaxed/simple;
	bh=EknmOa+YE54S9/u2gIOeyNN8EzoUfRgcdpPXzuBSvtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LjAP58CGKQ8sxmm5MeXsZD52CNYNmFhAj05OzFUIknSOmyY0dka4UpT4swQApHxTfpn68nc+9kUKVhSWbi/SYmqH1ugfFOB8FCyeawboPG8EQ8sCkSn52gmr9gHhm2xDo9npYng27bM1zINlVkFlY6Sy+bsnBw6KdnJ7+5m9q7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAKT7Ar5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAKT7Ar5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752874785; x=1784410785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EknmOa+YE54S9/u2gIOeyNN8EzoUfRgcdpPXzuBSvtY=;
  b=RAKT7Ar5APfCCDGanyo1Z0kueazIeVSOdiTXALCdj6gzVoN9lQjZfe9r
   w9iU/m3DlwzOTZB6tkm+i0euwGFH8fEDgJP9roedyzxRf0HiOeg8NLhl8
   gLT1Xedvb9sfOSeNlGPrVyzQvORF3TR1HOIzc2TRXYmwp9DN7U8kd8l+m
   CRki+nQ8ndbOAladfVsD94tZOc3n2WFLH1IA0xNoqcSrtB91Pjq0i+JAB
   M0UUDWZVHnX22pjjaIfbmrFsykpRPB5165roZFuqG8CmrBEwibZGAv/xR
   ocE7ah3hqVDUNc6qF37VnH7Ku1xIOw45eqlJDSEEKZprACmVhLk2dejPJ
   Q==;
X-CSE-ConnectionGUID: eWFsJGusRGK23dnfmdTzbQ==
X-CSE-MsgGUID: tLU5LYUUQTmiBxhRc8Sgmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55261832"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="55261832"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 14:39:44 -0700
X-CSE-ConnectionGUID: svbor/FuRSK5VPeBr8h+7g==
X-CSE-MsgGUID: UgORMoUXQSaM1Twuz9zTww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158051502"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2025 14:39:43 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucsns-0000yP-1S;
	Fri, 18 Jul 2025 21:39:40 +0000
Date: Fri, 18 Jul 2025 23:39:11 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 5503/11307]
 arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: ethernet@40010000
 (nxp,lpc1850-dwmac): Unevaluated properties are not allowed ('mdio0' was
 unexpected)
Message-ID: <202507182346.Zpy1qqHS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 69fcb70c433437ae1319da2ceaed147297c7b297 [5503/11307] dt-bindings: net: convert nxp,lpc1850-dwmac.txt to yaml format
config: arm-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250718/202507182346.Zpy1qqHS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507182346.Zpy1qqHS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507182346.Zpy1qqHS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): clock-names:0: 'biu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): clock-names:1: 'ciu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: mmcsd@40004000 (snps,dw-mshc): Unevaluated properties are not allowed ('bus-width', 'clock-names', 'resets', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/memory-controller@40005000: failed to match any schema with compatible: ['arm,pl172', 'arm,primecell']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: lcd-controller@40008000 (arm,pl111): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/arm,pl11x.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/eeprom@4000e000: failed to match any schema with compatible: ['nxp,lpc1857-eeprom']
>> arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: ethernet@40010000 (nxp,lpc1850-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nxp,lpc1850-dwmac.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000: failed to match any schema with compatible: ['nxp,lpc1850-creg', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/clock-controller: failed to match any schema with compatible: ['nxp,lpc1850-creg-clk']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/phy: failed to match any schema with compatible: ['nxp,lpc1850-usb-otg-phy']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: /soc/syscon@40043000/dma-mux: failed to match any schema with compatible: ['nxp,lpc1850-dmamux']
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible:0: 'nxp,lpc1788-rtc' was expected
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000 (nxp,lpc1850-rtc): compatible: ['nxp,lpc1850-rtc', 'nxp,lpc1788-rtc'] is too long
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,lpc1788-rtc.yaml#
   arch/arm/boot/dts/nxp/lpc/lpc4357-myd-lpc4357.dtb: rtc@40046000 (nxp,lpc1850-rtc): Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
