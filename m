Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095B211A27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641222; cv=none; b=bItyuxnuZtzTh649QGqKE1id2qd43fCCnSqayHns0I9qdhxekBBH4fRKzHn+iH73+94z6qPTpfc7zNZMhniNy4MOyvHS/VXdytj3Pc7GG/DqVm4iHMSQW4DpkIF1o/LHK+KngaIYsbmkJO7S8yqR3Me2QeTS9Qu2uvnPn3zcZPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641222; c=relaxed/simple;
	bh=PYVRKhLGQiuJ0E4gvSyGdgjgpSQH2zlqAvj2xucnzLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oa4yR4beg6CFnpAVe2kJ7mmI6S+ShfsLZoPYuqZWpfHJyZqM880sqHJ+MFh6mQWd/m8S5cBrE6Y+PVnBh/GX09KOCcoFZr20gXN7daiVfX5DR+jHBoDDdH87ZH8w653xQUe+iKSYlRjWPCPVKdzLtJsX4Ngoibbmsa2zUlDi6j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fm/WgPbm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fm/WgPbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748641221; x=1780177221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYVRKhLGQiuJ0E4gvSyGdgjgpSQH2zlqAvj2xucnzLk=;
  b=Fm/WgPbmuaYG+2n9ZPuWokb7KOpmCM+s1XIve+OIo0DeCdLybVlKfVQx
   t+bgpw0Z0+Wi/yety+n1quJuf0DefM6BNuL4eAHmKWDw1z9FJ0JQB9Iz/
   utex+q9he0ywdczOJZaM74XZl4+PUoGIbVy/MzH36fBOFBVjVrOe4r0S8
   lwUtbWJGftfq13v54PWeDQa1ycJV1eWLbxw1uxWyQENcaP3BAFXuFVzlf
   AsbJ36W/WqNdawulmdU+90smFxsugyJalA9pqXK8BYYAgTjg7ygb+I108
   TQERoA2E5bqoKLBkFLLQ+WZorZpw0p7o5iRBpOUqt4/IbWkaIxaKG4EA6
   Q==;
X-CSE-ConnectionGUID: cq6ezIm/QV+66tn0SOTNkg==
X-CSE-MsgGUID: YXpeNANSQv6jZhjze2SuRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61368546"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61368546"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:40:02 -0700
X-CSE-ConnectionGUID: ysL+ToQhTUuLHwatwE05Tg==
X-CSE-MsgGUID: GFyUqFGSRpisI0YsQLsb7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="181191780"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 May 2025 14:40:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7SI-000XzG-1Q;
	Fri, 30 May 2025 21:39:58 +0000
Date: Sat, 31 May 2025 05:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.15-rc 80/88]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000
 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202505310516.eMdiSynY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.15-rc
head:   cc779b8ab7f799ada320315dd27b87b0ad746227
commit: a515d30587c84bdaff5751807bd1151de3b7c796 [80/88] dt-bindings: net: pcs: add bindings for MediaTek USXGMII PCS
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250531/202505310516.eMdiSynY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310516.eMdiSynY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310516.eMdiSynY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:477.31-481.5: Warning (simple_bus_reg): /soc/phy-firmware@f000000: simple-bus unit address format error, expected "f100000"
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:691.24-712.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:721.26-743.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: / (bananapi,bpi-r4): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: / (bananapi,bpi-r4): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi:34.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:477.31-481.5: Warning (simple_bus_reg): /soc/phy-firmware@f000000: simple-bus unit address format error, expected "f100000"
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:691.24-712.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:721.26-743.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: / (bananapi,bpi-r4-2g5): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: / (bananapi,bpi-r4-2g5): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: partition@200000 (linux,ubi): volumes:ubi-volume-ubootenv:nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'fixed-layout' was expected
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'u-boot,env-redundant-bool-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
