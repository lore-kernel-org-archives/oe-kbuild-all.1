Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B5176ADB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760276233; cv=none; b=RDIwL5k8LqW1vstzRBya3olchhkwJwXlLQXBVVaWNhXgVBExcrhreyUOvx175dPmsGTzUTkNIRKYW/bgH9VbS5REF280BAI7aJ8E8Ag6mHYnwlG4mOZzkMfNH19AKhSVVR6vgSwIKMw/gXE4QYezfPhKAueJe6GRB4q523+vpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760276233; c=relaxed/simple;
	bh=4h4VchR9m8TahgeGHdPRFb8CdBkMlDfw1yqi1KooQOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2dIwuFlHuwksu5ErCdMcaBte9Q4n88bElNlLdvgx8BpqiXE8B3dwqywo6+1ji3CSCQdfWpMWPmBGGTM+9RVs7h2dsz+iuWPkakoKVZu+l5W3xAZ+To5/K9B6NPyJaqZruTIHTYxqoyDYIUVsKjJOmaXIQ0+PkyTCj8X1Aft6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVycKHpS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVycKHpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760276232; x=1791812232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4h4VchR9m8TahgeGHdPRFb8CdBkMlDfw1yqi1KooQOE=;
  b=mVycKHpS03/OyJ9L9VTuSkuy2lMzDeZm7XCeZAUCgv546FFOoaia9drL
   W6X5WzcFRGrAhaBA8pRa7HML15icbUr8zCi6ZCDRKzEj6fvwEYYi+dQ6A
   eQbRTKmHo2avBl+qIMdDqmTMTlmM8Yky/nEs1sZfpY1eiMwiXRaN36LiP
   QMgAfhAsQnX/xPeybPVCQOFgBUaG6gzPcIIZDYaiYNNgoV3o9FZ7w8QlQ
   m2tpIXrf7G84t+bQCDv5bziVyLRZ1Pnxh+Ec+r0L2Tp9qMwZpLavVNXTe
   isdAStpME787LhdRO4dDEVDBElzdejCUqlrn2JcouuM+z0U+cXYQhWvre
   g==;
X-CSE-ConnectionGUID: JAox/sEqS9O8SxL04jvEkg==
X-CSE-MsgGUID: Rwlh8o2mS3q0OrLYPPTHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="72686124"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="72686124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 06:37:11 -0700
X-CSE-ConnectionGUID: IgWk2Hf3SR66R8dO6tPNpA==
X-CSE-MsgGUID: yUpwThukRSKz9irxxpxDGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="181794644"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2025 06:37:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7wG3-0004PD-1K;
	Sun, 12 Oct 2025 13:37:07 +0000
Date: Sun, 12 Oct 2025 21:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro2 94/139]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema
 with compatible: ['mediatek,eth-mux']
Message-ID: <202510122118.WPvZpHh0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4pro2
head:   7b9918476e16be05ccbbc0d029a1672264fb604e
commit: 31d0249ba55b2ab3fd523284b8d23cbc50af6014 [94/139] dts64: r4pro: try to get wan phy working, but still crash when i activate eth1
config: arm64-randconfig-052-20251012 (https://download.01.org/0day-ci/archive/20251012/202510122118.WPvZpHh0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510122118.WPvZpHh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510122118.WPvZpHh0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0', 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy28_led0@0', 'an8831x_phy28_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
