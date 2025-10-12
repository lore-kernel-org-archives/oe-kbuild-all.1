Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801A51EB9FA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760307567; cv=none; b=OYpgyROg8C8MdtE8N0UvsouJi/wglcIRPBvboxlA+nLZCWP8+/nJsjPaK/q9MsX2+g/RQbEMP/PBP06c7YhnHNZcJSHubeYJwnsXO52CCZIweCQ4gGR8bBR5477FN78mTC1tXVBhFAXJ5QLY50suO+0rNHrdGBBRMlqOUR+LuCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760307567; c=relaxed/simple;
	bh=YG9jUlBv3nLuU8APAvpqNS0gb+2+Q8toP0RSvdVchOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE0jfBvsf8nH+icFFy1rlcBTKDRkQI3cdmY2Q9xZSb4YMWKnOXS8gfJK6UKSD41c1L/XVrLjxcw6ewC8RnZg2pmgZgP7n/Atv4UwkaOH+gz0qVIxDQUT8ATobUm67xSId02+ogdADG1CXHf/QoKkNmUubAvYpaPP2qbcszW1/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckpxdze/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckpxdze/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760307565; x=1791843565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YG9jUlBv3nLuU8APAvpqNS0gb+2+Q8toP0RSvdVchOQ=;
  b=ckpxdze/Vq1apHXtKAowolhDlUQsY3g+LLiFEUuuTOgmMuLHKEJ649b1
   M4+dbovVJ98xaaTC8VqcGjmFz/v5OceCYFpyIJova0UY8XRz05XebxsmL
   /dEff8IqrgLiJ3lg3+tdZTQgAq0LPz+mXCpCO8Y9ICeeR3uZeD4Y3rMSS
   8L3TiXJTUfK29Lr+cCNrWsvc46IBbfc1La9/yzOyWedkM5m+h6TMAK6I2
   B7gRBkDCkqi+vDG+TV4Z1rsrO950qDaIMKO0cy5CRz/XVEV3EdRcHaEAk
   yKdmAAfApf4ZOIVuE6LRv54aus8Hh2d4kpkk3bXwgvfOO5mi4UxVke6/v
   A==;
X-CSE-ConnectionGUID: XD9X7STVT/CGTerwQ2T6bQ==
X-CSE-MsgGUID: QQVo8oAgSqWccEDRXmKLtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="66102645"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="66102645"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 15:19:20 -0700
X-CSE-ConnectionGUID: 1ZEz4QJ1SPmbA0L6GMsBQA==
X-CSE-MsgGUID: VBARQgy6RYWexlleGgZogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181861334"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2025 15:19:19 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v84PM-0004cX-2W;
	Sun, 12 Oct 2025 22:19:16 +0000
Date: Mon, 13 Oct 2025 06:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 105/110]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to
 match any schema with compatible: ['mxl862xx,ds-mux']
Message-ID: <202510130648.m9B6Ah2Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   03a2d4a9a273dee05ce257bd5b673d647742564d
commit: 567342ac6d5d63d56875cf9ead8d3aebd3b06fa4 [105/110] dts: try to get lan-phy working
config: arm64-randconfig-052-20251012 (https://download.01.org/0day-ci/archive/20251013/202510130648.m9B6Ah2Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510130648.m9B6Ah2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510130648.m9B6Ah2Z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts:149.28-154.6: Warning (avoid_default_addr_size): /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0/channel@1: Relying on default #size-cells value
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
