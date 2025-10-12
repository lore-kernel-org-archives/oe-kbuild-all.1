Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321A2522BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Oct 2025 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760273110; cv=none; b=NCoMBZprrz8tJ1XIPJKYWL1/KjybMC5MpRtPRn2074jRhO9pl53TgXOr6KRAS67aORSx+no9PQzsMxPQnkPr+Yk4sSAqpBO7NjnEyCKDsW/5b+eHyHzvWxOTGDEG5vZ8q2pfzYu3j7BbW1yC/0ioK0LXIf7ck6tjX15IuKGuajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760273110; c=relaxed/simple;
	bh=f4jj61fkeZMNt15p302mJ21wohQmYYwBjpm5CgWfIeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mdvnh32Sv3D4Vt0Jl4ypKlGX28d+pFmXMyNrs8IfOvYwfr6uCg5gjjzJY6zNBZa060eKlVWsthvkY+9oM7dvpezV6vmGnnztnIL6p7MYC2DSUwNpV1l92EOE4zNMM7vgP/87yrMVWdfTlpJUBV2LhBgex0ScNeEK7nu9M69/fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdzWu3+/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdzWu3+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760273109; x=1791809109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4jj61fkeZMNt15p302mJ21wohQmYYwBjpm5CgWfIeA=;
  b=ZdzWu3+/3iWrBS+JWa967VybS8petZPfZ1JbL/vw230GCqXaq4qYVO5W
   eHlSWl3mqFz38LMb6Cg/PYDgrKUkUWsSLjag1myx70MqosX+F45eFNQUR
   nzAPDNybCJMrubZyIhgvhapEmZwkFPqlnuRXL9ms5uX2fx5IQy1cRFW9z
   PrcT5qKqTE9jUtpGznkSCZBJYe1Jn5h5JhahOEzBeb1jE5kov8oSLOCLK
   P0zsX3c+iiLegf4FbqMrrS8bXh0Xen0nUVWpMWcDQs65lACorcjsUJlIV
   gJU5QtfZSLWgdQcL+zcXERfSp9cYmWWN71G9zuiHhIoCJVAY/r6c+MUvG
   g==;
X-CSE-ConnectionGUID: R+XLROC6TOC6L/Hgu7rnmQ==
X-CSE-MsgGUID: 8kVo7+dbQb2FKbb/LYgD2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73528636"
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="73528636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 05:45:07 -0700
X-CSE-ConnectionGUID: fttOujR6TiGgJF6xPoP30A==
X-CSE-MsgGUID: TNpCLQLpRnmv5mvGO2cbfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,223,1754982000"; 
   d="scan'208";a="181382723"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Oct 2025 05:45:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7vRf-0004Nj-1i;
	Sun, 12 Oct 2025 12:45:03 +0000
Date: Sun, 12 Oct 2025 20:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro2 89/139]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb:
 ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'an8831x_phy24_led0@0',
 'an8831x_phy24_led1@1' do not match any of the regexes: '^led@[a-f0-9]+$',
 '^pinctrl-[0-9]+$'
Message-ID: <202510122040.QSx5usK7-lkp@intel.com>
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
commit: 53b17b5c4d48b772bb3b51696a1a1fad0d496893 [89/139] dts64: r4pro: enable phys+sfps and reorder i2c mux
config: arm64-randconfig-052-20251012 (https://download.01.org/0day-ci/archive/20251012/202510122040.QSx5usK7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510122040.QSx5usK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510122040.QSx5usK7-lkp@intel.com/

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
