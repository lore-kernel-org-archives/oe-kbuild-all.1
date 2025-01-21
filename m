Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9245028C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737476419; cv=none; b=jo5CG6ewEeJvVg8LsoXFcNarvt14iJR0v2OcvKRQlsXFXesHhU/Brx2Sa7RSAp26AaMdqE+SgsYClcVNnya5wDrXQVWti3U/DIAge5Wrxhi6pbhYG+54+fqiJ2phl6GXEdgTuaIBHo8zpUvb0mokRRSJSxHOdGU3h0tfBW3rq9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737476419; c=relaxed/simple;
	bh=enOXgngyoQ3ves7+z00NpVAUMVe1xbLX2FtmpG6MPvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=StVUn5HlEMgahgmNsVgaadkmfbH/n+iV4lZZQUMOh3KYE/5r3XkbMUKKEu0WHGRX3UiI4Hlz4DKUupdgSS1KgvQdy29NjdCw30+jFEofiBBL12lMoVoXdGiUD3sQCCBl95D4JRog56NaObvUVV7UobtKbI3RjuIICHIvp/JRBFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kn26xJJ7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kn26xJJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737476417; x=1769012417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=enOXgngyoQ3ves7+z00NpVAUMVe1xbLX2FtmpG6MPvI=;
  b=Kn26xJJ7t+qfX3arCI5P39CjXs0oadPLsdLdbuMgLAnFYdb6R4fzmRFB
   EQXAOBAnLYvYwgpOWkK/NP2fld31T47ba4BHXGVdxgBpAY5gAtSMfoxjq
   jsnK5N9Ry6hzKAYMu/OT2+Jpg7HDkoHxdKZ74vaP4HbziD5cfKZsXN+aD
   uTNpHJHZGGSFkfdXkWEr2giVghrbG6u2QYVhapvjE/lW4UUPNW8F4W+4R
   PTZkeEAj+n+wA9ZrPezMhUENS8cfvPTl24GS0Qp+/0/ThT5/ZFVtH8JcT
   t0AE+XsraBCaGxYIoWq2+u1wpXMeDT0fLo29lqSEWM/AakJXoNns6MQUz
   A==;
X-CSE-ConnectionGUID: qnkdYDlCTyOv1sxbeAkotA==
X-CSE-MsgGUID: QgBfmG7MT1abjdCOk2+0bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37778689"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="37778689"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 08:20:07 -0800
X-CSE-ConnectionGUID: jbexqO0SQ76QFFaX5BLC+g==
X-CSE-MsgGUID: Z7z2SxuPTJqPpYeh5j+i6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="111850250"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jan 2025 08:20:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taGyx-000YHV-37;
	Tue, 21 Jan 2025 16:20:03 +0000
Date: Wed, 22 Jan 2025 00:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/phy@16900000: failed to
 match any schema with compatible: ['mediatek,mt8196-pcie-phy']
Message-ID: <202501220029.Du5O5rUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5e3ae83915369906e21e74bf1f59bc74a3d1877
commit: 40e0ded60c61ea66329ee950ff7c921f5368546e [333/333] CHROMIUM: arm64: dts: mt8196: Enable PCIe0 and PCIe1
config: arm64-randconfig-052-20250120 (https://download.01.org/0day-ci/archive/20250122/202501220029.Du5O5rUD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220029.Du5O5rUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220029.Du5O5rUD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: compatible: ['mediatek,xsphy'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: usb3-phy0@16773000: 'power-domains', 'usb3-phy0@16773400' do not match any of the regexes: '^usb-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@167a0000: failed to match any schema with compatible: ['mediatek,mt8196-usbwkcfg-ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@16890000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao-sec', 'mediatek,mt8196-ufscfg_ao_sec', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@168a0000: failed to match any schema with compatible: ['mediatek,mt8196-ufscfg-ao', 'mediatek,mt8196-ufscfg_ao', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/phy@16900000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: clock-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16910000: Unevaluated properties are not allowed ('compatible', 'pextpcfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/phy@16930000: failed to match any schema with compatible: ['mediatek,mt8196-pcie-phy']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16940000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-pcie'] is too short
   	'mediatek,mt8192-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16940000: clock-names:4: 'ahb_apb' was expected
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: pcie@16940000: Unevaluated properties are not allowed ('compatible', 'pextpcfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
