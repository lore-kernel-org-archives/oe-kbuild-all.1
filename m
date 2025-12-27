Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467524466D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 17:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766855204; cv=none; b=Ofr0X4wcvM3icaGyM18Nd8Ao7EFxY8NN2nTmQufHQsqWBo/k8/0EIfCa6OgIwdskmu5I8T3Oy6ey8Fn3TleSI+Rj1xLO16psxG4SN13amS3a5Y8/DnTKhh6XBvR0pjJjf7BscwfQFnojDl8dRsrSoTMr2IjfSpWm5vak4ukBX+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766855204; c=relaxed/simple;
	bh=wuuLWfm5DH4MOEfh+cVrhCpfpoxPtTUiU+LtWBgTOkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wv2rrAS3wTX70CMRkcBgNG5jG6coxQj+Ss89/V3Ns5gQXYsooGz/gx1SE083R+dLccHf97Fy5qI1/Z8U4Y9JyEHUb07M7k7QeXbQlamk0IxHv9DOVoYsU8Hwb5+F0BBnCY6UqXFsu7y8P+aXibJubTkdduE3Fz6CAR/gAV0Rzj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRSP5ryh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRSP5ryh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766855202; x=1798391202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wuuLWfm5DH4MOEfh+cVrhCpfpoxPtTUiU+LtWBgTOkM=;
  b=RRSP5ryhAKN3Kswwd2jmd1THU8PaKDW/9y12m7HC/LQS4RaKWkjxROWc
   /ssQC5qe62WjGFx++fAnBGVVVpYOHvSeL79LQb9Un8Rj79zAZQc6SAqQn
   yLwJwetzIG15ErHup/Cj+6aR7o7BUgSYF0yNLZs1FqYTAUj1b/Ip/0hJo
   eZt5FZlYbv/3k2INuwXvJ0Hjj+iuDXy0wrH1hxORnUJZSz4zadG3bzEwP
   Ec37yrW9WBjkQPkChr+uZ9BmPo4KFZDdxz3sZMoiOqD2Rxn6qjnZPCvDh
   LuEnG2s+EMfVT2tZOKHVf2/Ple2iZFO3jKHhL41RehCDsx1qT4BGvmCa4
   w==;
X-CSE-ConnectionGUID: 1FPWkW7ISDS634Xga7L1ug==
X-CSE-MsgGUID: 3LYmQRibQWynevO4ZgdFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68531981"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68531981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 09:06:41 -0800
X-CSE-ConnectionGUID: xSEujfr8QceCP4r2AytQBA==
X-CSE-MsgGUID: DuNJYorUTbabANnAhlxqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200492145"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2025 09:06:40 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZXkU-000000007Em-2zvp;
	Sat, 27 Dec 2025 17:06:38 +0000
Date: Sat, 27 Dec 2025 18:06:04 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 65/111]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do
 not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
Message-ID: <202512271835.tBOumO6P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   fff6186ad59ed77c50897afb2a9258b9b260308d
commit: 3339397672bd2845fd3df9473b698e6d9dfb3cdc [65/111] arm64: dts: r4pro: add gmac 1+2 and phys
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251227/202512271835.tBOumO6P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271835.tBOumO6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271835.tBOumO6P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:685.24-706.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
