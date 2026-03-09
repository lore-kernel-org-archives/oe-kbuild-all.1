Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE4136896B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048151; cv=none; b=YHCm10hbgqETqRv6Y5WifX/XDfE5s66fSAsJwB34Om36QFkR6XsDgKIZNrqR2B5569X5PMMBk7Borccz4zCqhlnfrHDWxyqwaq7U6MU1MLSfT5WVK9pwpShz6/G+qzrTUvHFI5GbEbvPfp4TQ0blWo7jYyq+Z6N3T1RGwUqa7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048151; c=relaxed/simple;
	bh=WIlFH3Sv0HQlpEA2H5CWvDUumheOwsy8O3u5k+36JLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4ABHl9iRYoSJhFSlJWHAajCE1kRWu/B+qdxdYUyRkyMGKCpLl3H/304iOQjIrs/7NERkZbNP2JM2xTOjXW1frp5gj7BuBbYfjH5GYjr1rOxGrYnZLUNC9hfb6S49P0C7XLUdR3DM/aEpu6fuR7sn7gvx20cdnTC4cnz8/idCyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNkCxAf+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNkCxAf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773048150; x=1804584150;
  h=date:from:to:cc:subject:message-id;
  bh=WIlFH3Sv0HQlpEA2H5CWvDUumheOwsy8O3u5k+36JLg=;
  b=aNkCxAf+gnZDjCSft8p9So+4pNXOyWThKskHtPq0nr6EQOZHHSgckSid
   hqAIfaok6ouuLv8ZavKitF+7mimtbC0OA/nAVZb28zJcNnoeMpZ26yWZ3
   KUkzz+cR3sTrF04897o960ZKIQpUoIo8GfCibGTA70DTEPB4iyHq6thi2
   576JS2AII78qVi5oTDgJ6Ab92IcWTpHyufz4uMdX5/RP5XQn9uCgmY0qR
   1fL39U0FqFiuuiuvNT0h/C6vzVEWzRNKhq4A/2NBx1K3FzW5oHi0zooKM
   o+TtO5v6EXjf4figvYjOaZ/Yv2O4HNjWWcFRaV1cJNZRaxgK/iREQ9rof
   g==;
X-CSE-ConnectionGUID: rvUrjhT+SZ2mgQNnc6K79g==
X-CSE-MsgGUID: lQNVoIC9Ru+w+Fh7gRApPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84777542"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84777542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:22:29 -0700
X-CSE-ConnectionGUID: 9x3HmUGATNOlFb97y7UWeA==
X-CSE-MsgGUID: 2rYpzqUqTA61V/eWhTv3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245689370"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:22:28 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzWoj-000000002pp-2cfU;
	Mon, 09 Mar 2026 09:22:25 +0000
Date: Mon, 09 Mar 2026 10:21:27 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 58/64]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal'
 was expected
Message-ID: <202603091052.JVYhRKhc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 9304d882411725938db1df65dd6fac86fa2ec489 [58/64] arm64: dts: r4pro: fix switch label
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/archive/20260309/202603091052.JVYhRKhc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091052.JVYhRKhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091052.JVYhRKhc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' was expected
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:reg:0:0: 13 is not one of [5, 6]
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' was expected
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:reg:0:0: 13 is not one of [5, 6]
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' was expected
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:reg:0:0: 13 is not one of [5, 6]
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' was expected
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:reg:0:0: 13 is not one of [5, 6]
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' was expected
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:reg:0:0: 13 is not one of [5, 6]
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
