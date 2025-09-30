Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593E211A09
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 02:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759199424; cv=none; b=FaDgvdwA1joK1+zVCsGWvPkRYXpG+8x+K+hIEesA/B9FpTqdhgEEmIHz2WKYv4W1vQurtdmcDi6jSvRQS6Yl9SKsGXHMvhv7xYKTu+unQq4ofU5vdRgHy72y2XqwW6WyUoMLcSe4Xd+/VHCK8Ud9FPqBbMceENs48cq1kkFeUqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759199424; c=relaxed/simple;
	bh=EodgqfIT7pDnWg09QOP3TqQ3kM8Nm3l3zIGgtVYcEzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9QIjvQ1sF97JZcxn1kr0OWoLDs7Jq9Fj9t2ejoK/aR2g/tJ+OD4qSTYekv56KRZRVI4QI8xW82j6jmRhEPgAmLLTeQoZpd1Oo5zVx2N6UiQXzuaVHwyE6zKP/ltYZBbriNw++UdRpGRfblvDWHVSdYyYNAAvVgqZPthF1o6w0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRljG6pV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRljG6pV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759199423; x=1790735423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EodgqfIT7pDnWg09QOP3TqQ3kM8Nm3l3zIGgtVYcEzI=;
  b=jRljG6pVf/+BOCb0DlE3AWkun5e/WSxAjL14VKN4Z6K3zX7ZkrWEd5oI
   PDJ0sHUhgouYCxTNbQRfClZPo+quNjsbZ+B1gkifGLucDrlwmOSIyLkZa
   M4cA5Fnuz0sETbTyidkxGHiSGyxu25M0PMSjMXsEgl90LBfXJi2PChL67
   tmT0LnPDmigBpAJmn4VES9qCp4roLlDuh/e+VuHTSGh9K+CgwPBG6RTS0
   dNbKbvW7xbzUgRfnv4INHsjhyPpG7WHPc0S1B0UZtG/clQjMtVGpZ0ukp
   xx2FcGm6YSgd20rAnDWbemf0KkvlhXM6Vr1sMT6UsN9yxkqHCV/cKJepJ
   g==;
X-CSE-ConnectionGUID: MHdbPGDoQjGcbWZMYYF38g==
X-CSE-MsgGUID: w/IqP/c1TI29bgiu2RdoXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72127406"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="72127406"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 19:30:22 -0700
X-CSE-ConnectionGUID: JToRL14pRP2N2hN/ClTevQ==
X-CSE-MsgGUID: tNNOXDkBRv2iYj8F9NPZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="178429760"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2025 19:30:20 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3Q8A-0000000065J-2fkl;
	Tue, 30 Sep 2025 02:30:18 +0000
Date: Tue, 30 Sep 2025 04:29:48 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro 89/96]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0',
 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$',
 '^pinctrl-[0-9]+$'
Message-ID: <202509300431.50WByBNv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4pro
head:   36b4e168b26818fc2a5e17881f5400a64c5050e6
commit: e0a291b7b791339590bd46d67f753e7ecd1731ae [89/96] dts64: r4pro: enable phys+sfps and reorder i2c mux
config: arm64-randconfig-2051-20250930 (https://download.01.org/0day-ci/archive/20250930/202509300431.50WByBNv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2d6ce5148cf144ab800116e1f75a5d007e82cf58)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250930/202509300431.50WByBNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300431.50WByBNv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
