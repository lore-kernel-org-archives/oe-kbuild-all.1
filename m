Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07A363B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766679376; cv=none; b=jgpZL2tCI2v0grxBQzLF++pOc4TVChpVgf7GUHjsbBzvSz3m7CPvt+jTm/Wn3qfFgDUGSXxKyYkJ9WKQyhNdBS8Vl1cHNsmfNDqozLZZqAXhWO6NdzoiA5RhmMm/XZpGpTmu8lKTIX0uYxeW9ZlKXrppz8QmsAT88G06QqYj3OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766679376; c=relaxed/simple;
	bh=7XlsGph1/QlfDgAuXZdJeDPkBGk99lA/BQnOo5AazDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ciboah/56wIQGI4sLxNTBHIvoD7FNlolJ2MIs8ksCeLhb8QDSOBrx8HdgAE9+AVPZVjKkPZ12+aoDU0mvcvIX2o/QaUrEeJ0PLRF2EyShC7Qrn+R9prqG0uJ1sYyCUYBF/ukkImiguMWyuAbUZN+kxpk71BJxzqVHBkkN0g37x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSkRzYTX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSkRzYTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766679375; x=1798215375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XlsGph1/QlfDgAuXZdJeDPkBGk99lA/BQnOo5AazDc=;
  b=mSkRzYTX9Skr4dYWtx9oRIWF82RQJhXyYt5YjWcwZgZOyD8KLdC5Mj6+
   wsDCBPgjMj90hszja+Uhq9vsOMMAkICQo/1NeK+FlP8dJPRskKz0DDfu2
   tDsISfPcjbjxaL2yTMlG/GOocLNwLzw8Sdw3y0R6a6J8SAn/69x3//R+2
   UZxM8Kdma3+5NSe+U3vnHgAjFed56xTVwn5CW9fH2/4VeGIDNe2AFMV3e
   I8uysETXecYB1AKKhrJwdJD0aO1XyIHiBYblfZP1hR+ZTg1c9n8sKm5Nw
   qzf14CeejyvdPeyrUkr6gwRqXTbyLrKgSBJGEYVjn/iRaXt61Pw3nTrgS
   A==;
X-CSE-ConnectionGUID: +iQNLjz+RN+g9nQTz/lG8Q==
X-CSE-MsgGUID: z9JU+8ODTdatHXmKoGWmUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68359996"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68359996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 08:16:14 -0800
X-CSE-ConnectionGUID: IG6BZ5MVTpq/uoERC5OVtQ==
X-CSE-MsgGUID: Hv9eX3bLTxiGzVUJA00vDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="230903577"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Dec 2025 08:16:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYo0Y-000000006cq-29qS;
	Thu, 25 Dec 2025 16:16:10 +0000
Date: Thu, 25 Dec 2025 17:15:39 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 65/111]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do
 not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
Message-ID: <202512251711.7jSClXa4-lkp@intel.com>
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
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251225/202512251711.7jSClXa4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251711.7jSClXa4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251711.7jSClXa4-lkp@intel.com/

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
