Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC611A8F6E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336806; cv=none; b=b6jMW+ji3Xa079pYr5Bqj07irrqAWkFrRMUVJrn39C9avaBxC87NWw/WqwtYHB4d3kE7alswfQYKnjg+DuSzZ/8WlsoZsu5zFh2aZN9w/tJMguoAy7jcEnM1Togr2rVTEIE4XoZRAojk0sNo0RALSamhDf2AEix/ZiaH8b4HN4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336806; c=relaxed/simple;
	bh=krFHOzJd0hMkukTddRETtyEiMMNnCvUuLJ8McHlLeDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l//WWHA5WZnc2aTcUGXGImgyxS5kKn3YBHLpWZ9hDGF9frlcb8TAdawzBNePo9mMTt9RMvBQ1L+m8HAInhl6rGV22BThdeSuRnkdAmqGrZt2sF6fxVDW8ENc/DfZXAL00A+JyJEe4gjL3uFObmiXCdgNL5qX5WFcIOK+2qRX9NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ehq+opzb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ehq+opzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733336803; x=1764872803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krFHOzJd0hMkukTddRETtyEiMMNnCvUuLJ8McHlLeDk=;
  b=Ehq+opzbauTznn9OLwuGiq0M8mv2krmxyHJRNf9Go6JpT07FFXYW2w1W
   qiOhfBCzLjHRDTOS3hQltknMKHHbVfsbYh5J2ZBFJ4voNzNGfENSXoq6I
   0BcPW+xb8NRmwW29FXARTkS5k4q5K0SKCrGcAlLmfoi8BTYNaWTpr1Ccw
   oeRTyB1co1oBW6PJ8kL/p7VeIpJbiDs1GVIf5bQIltyoFoDWCEFnLh25k
   W/X2Pm9Ptq1hbR/Lg/t7ZtrKua3VwhN1/PG4KNNStVIsrWEOaQ4cMOwiQ
   EOlRDtGTkLxNQKg1A91J6VOMFkj16SHlwjfjsDPjNaWVACrHHztWvbAat
   Q==;
X-CSE-ConnectionGUID: wBy5E/noTKWue8vkqTD96A==
X-CSE-MsgGUID: 8M2kfvK1RfuQzfdyxyUsog==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33768730"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33768730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 10:26:39 -0800
X-CSE-ConnectionGUID: ai7E1qOwSuKtXo/L7+7Y8w==
X-CSE-MsgGUID: w6Qsfb+IQ+uF31KKjAl9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98920817"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2024 10:26:38 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIu55-0003Nd-31;
	Wed, 04 Dec 2024 18:26:35 +0000
Date: Thu, 5 Dec 2024 02:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-rc 60/65]
 arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: memory: 'device_type' is a
 required property
Message-ID: <202412050259.xBGAyDqd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-rc
head:   fe872584c0223203da393054206487d248a0bdd0
commit: ee0bc0b8828ff43afd14563dc6a09daad335783f [60/65] fix some dts-errors (dtsi+rfb)
config: arm64-randconfig-051-20241203 (https://download.01.org/0day-ci/archive/20241205/202412050259.xBGAyDqd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050259.xBGAyDqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050259.xBGAyDqd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:25.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1043.23-1064.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1076.23-1098.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1159.27-1324.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: memory: False schema does not allow {'reg': [[0, 1073741824, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7988a-rfb', 'mediatek,mt7988']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7988a-rfb', 'mediatek,mt7988']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table0: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: cci: compatible:0: 'mediatek,mt7988-cci' is not one of ['mediatek,mt8183-cci', 'mediatek,mt8186-cci']
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: cci: compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /cci: failed to match any schema with compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table_cci: $nodename:0: 'opp_table_cci' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table_cci: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pwm-fan: '#thermal-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-passive' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/phy-firmware@f000000: failed to match any schema with compatible: ['mediatek,2p5gphy-fw']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/syscon@10060000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10070000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10070000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10070000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcs@10080000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcs@10081000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11001000: clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11001000: clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/ecc@11002000: failed to match any schema with compatible: ['mediatek,mt7686-ecc']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: i2c@11004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/i2c@11004000: failed to match any schema with compatible: ['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: i2c@11005000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected
--
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/i2c@11005000: failed to match any schema with compatible: ['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11007000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,ipm-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/spi@11007000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11008000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,ipm-spi-single', 'mediatek,spi-ipm'] is too long
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-single' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/spi@11008000: failed to match any schema with compatible: ['mediatek,ipm-spi-single', 'mediatek,spi-ipm']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11009000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,ipm-spi-quad', 'mediatek,spi-ipm'] is too long
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7629-spi', 'mediatek,mt8365-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt8516-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt6779-spi', 'mediatek,mt8186-spi', 'mediatek,mt8192-spi', 'mediatek,mt8195-spi']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt7981-spi-ipm', 'mediatek,mt7986-spi-ipm', 'mediatek,mt8188-spi-ipm']
   	'mediatek,ipm-spi-quad' is not one of ['mediatek,mt2701-spi', 'mediatek,mt2712-spi', 'mediatek,mt6589-spi', 'mediatek,mt6765-spi', 'mediatek,mt6893-spi', 'mediatek,mt7622-spi', 'mediatek,mt8135-spi', 'mediatek,mt8173-spi', 'mediatek,mt8183-spi']
   	'mediatek,mt7622-spi' was expected
   	'mediatek,mt2712-spi' was expected
   	'mediatek,mt6765-spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/spi@11009000: failed to match any schema with compatible: ['mediatek,ipm-spi-quad', 'mediatek,spi-ipm']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11190000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: clock-names:1: 'ref_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: clock-names:2: 'mcu_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: clock-names:3: 'dma_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: clock-names:4: 'xhci_ck' was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: usb@11200000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/audio-controller@11210000: failed to match any schema with compatible: ['mediatek,mt79xx-audio']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcie@11280000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/pcie@11280000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcie@11290000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/pcie@11290000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcie@11300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
--
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/pcie@11300000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcie@11310000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie'] is too long
   	'mediatek,mt7988-pcie' is not one of ['mediatek,mt7986-pcie', 'mediatek,mt8188-pcie', 'mediatek,mt8195-pcie']
   	'mediatek,mt8192-pcie' was expected
   	'airoha,en7581-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/pcie@11310000: failed to match any schema with compatible: ['mediatek,mt7988-pcie', 'mediatek,mt7986-pcie', 'mediatek,mt8192-pcie']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: tphy@11c50000: $nodename:0: 'tphy@11c50000' does not match '^t-phy(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: tphy@11c50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt7988' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt7988' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt7988' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: tphy@11c50000: usb-phy@11c50700: 'mediatek,usb3-pll-ssc-delta', 'mediatek,usb3-pll-ssc-delta1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/tphy@11c50000: failed to match any schema with compatible: ['mediatek,mt7988', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: xphy@11e10000: $nodename:0: 'xphy@11e10000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: xphy@11e10000: compatible:0: 'mediatek,mt7988' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: xphy@11e10000: usb-phy@11e13000: 'mediatek,syscon-type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/xphy@11e10000: failed to match any schema with compatible: ['mediatek,mt7988', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: switch@15020000: ports:port@6:phy-mode:0: 'internal' is not one of ['rgmii', 'trgmii']
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: switch@15020000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@0: leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@1: leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@2: leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@3: leds: 'gsw-phy3-led0@0', 'gsw-phy3-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:0: 'crypto' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:1: 'fe' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:2: 'gp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:3: 'gp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:4: 'gp3' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:5: 'ethwarp_wocpu2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:6: 'ethwarp_wocpu1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:7: 'ethwarp_wocpu0' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:8: 'esw' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:9: 'top_eth_gmii_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:10: 'top_eth_refck_50m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:11: 'top_eth_sys_200m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:12: 'top_eth_sys_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:13: 'top_eth_xgmii_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:14: 'top_eth_mii_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:15: 'top_netsys_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:16: 'top_netsys_500m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:17: 'top_netsys_pao_2x_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:18: 'top_netsys_sync_250m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:19: 'top_netsys_ppefb_250m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:20: 'top_netsys_warp_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:21: 'xgp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:22: 'xgp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet@15100000: clock-names:23: 'xgp3' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: crypto@15600000: interrupts: [[0, 214, 4], [0, 215, 4], [0, 216, 4], [0, 217, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: crypto@15600000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: crypto@15600000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
