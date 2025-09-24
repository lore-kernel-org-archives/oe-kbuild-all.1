Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C62BEFF3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758703942; cv=none; b=qMEsJ8Qc471oFMpnvBz/WW+cQWEQMqBxn6LHts8KXFruMOrkr5mCPz8U1QNVmGuoE77fLSHqTWG9yjo0thadxAnKFQr9/jQqTGCjJ9zWKRzXBrDyhi3rTWxzcQ/obS8/W1yVbJGWwwnxBk1yQkW1/nevrFqJV4La9pLGRtwiyzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758703942; c=relaxed/simple;
	bh=Ms2qGYUy1CHkhn5h0wyOV8SnChb6GEz0rlPz899jI0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMUnZXnoVu65qdIWcP7Njydvs98uuwtnnPqx0MoqfoyVrPxSpxPMEALh38B8m8CpEsWVmU7OE2DvxDS/1dTCOEhjHAOwhlaSCx3YeM3PBMpjeaY/q0A/RE23BTBPO4G7Ipjk9EIn9gviq7tli0DmmQo6+hEmyv/iZ45KQ92QRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMFhy5OR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMFhy5OR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758703941; x=1790239941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ms2qGYUy1CHkhn5h0wyOV8SnChb6GEz0rlPz899jI0M=;
  b=AMFhy5ORsh6UbsOueiYtW3q7jW9TTsdAWg/+aOv7C6rbkuIFF+h1JvN8
   PjlmKlw/fwy49+E/a4mqIgL95llJfScZvi+LUdYlAID13697ipsSWwYaC
   t889ZGEWEjuAdn5hYf2G5QWMCXuu4RS5wgUxFvETw/2JHfH4pbdTEM+4K
   2nYdugSkapaDVBYapcdLweTpwypwwXpfvW2yHSQ4AVaGAN8aPbFh1IB41
   ktmO8aNnsuDauJnsohMPZHs5+B2as9GVwuktIw2mOCdstz/vqVIw9+sX+
   N8qFFo9+jp4UNB4nkgn841F7btThm4TROwvQzUcTOlNaxZPxv2ADbzEKZ
   Q==;
X-CSE-ConnectionGUID: Xgvyp57CRKiQ93TwC4JITQ==
X-CSE-MsgGUID: iTFUmAzsRxOU1IrL5JndjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60699550"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="60699550"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 01:52:21 -0700
X-CSE-ConnectionGUID: 23k1c7EESN+9qoSaR2eBew==
X-CSE-MsgGUID: vy/P/OxORCKGhX7Ej72Uew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="180999514"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2025 01:52:20 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1LEW-000000004Rd-3BwO;
	Wed, 24 Sep 2025 08:52:16 +0000
Date: Wed, 24 Sep 2025 10:51:48 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4lite 38/116]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000
 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509241033.Lo6y6EDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4lite
head:   9a70bbe70bba99a85bc2ae4e361c254101229422
commit: 39bb7cea2c1ad79f7b3c39e0b4de11a6a51656a9 [38/116] dt-bindings: net: pcs: add bindings for MediaTek USXGMII PCS
config: arm64-randconfig-2051-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241033.Lo6y6EDB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241033.Lo6y6EDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241033.Lo6y6EDB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
