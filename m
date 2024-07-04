Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF99457
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720057120; cv=none; b=tBAQplydrC5UCTleopi8uN7/FTZEYVaHgcNK8y5xAmjEKv/CyiyHbxlCQtlLu8XvSRtGz0J/Wpdzivm/LXjPj1bYm3mmNNqYq0J3iheARtyJ/ZbTpCXDTnEjZtbPy0B1jQ84Bp2iGw7F3ssxIltU5eCFAH2rbTMVcc1qG7e20oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720057120; c=relaxed/simple;
	bh=1svsln2L76zC5XKpxj0K1BtViGhtz3iCv5VnExIGyHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCwHi1mzf9gC3o+EryjrKwUi3B2Fpp/I8TV0od/r0ykk+PY9U50k48T0lHCvPek3jD9E0fM7V6OU02uDGBbZBMnJQykKSqIzuggOe8DHwqtuVj8KiZMQdpSokgsEAALkksS3yVipU2GjtIikFhRDYlDNl7M2k7X/mwQMKAsoxus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTcTtK7o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTcTtK7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720057118; x=1751593118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1svsln2L76zC5XKpxj0K1BtViGhtz3iCv5VnExIGyHA=;
  b=iTcTtK7ottzfQQmDzZcO3nkALnOcfsSjkaO+rraGrKy8t1AEDa8DJT/n
   JLeiUsAGAzBU3Q1PY9Ij+gba/RO4niDlJmtlB6uYPkOGcnr6WWu0e4y1d
   C6I3fflxj83MWEfHv0GXn4mXUfeZFH5GcERiokyxY8FbFNfC4Xfyg49BD
   ktc1GxFlJ3cu/I9gPH0xV3MYZ+iQN7OkFLowMewJn3oUcialjofqV0LFw
   ewTSCuDBuSmSj1dSpZqg1D4AlAafhS0shNUHtWZ7rShcJojHl7CxaM/OL
   6ir/T836FTrKcNhys4Y+vvTAjcvGBKQjZGzCVqo+Y7XVvFF3im5jRT4i3
   g==;
X-CSE-ConnectionGUID: XzIc8b2GSO2ulQEBXTyLfA==
X-CSE-MsgGUID: KmA4P0fvRaS5+DDSBaXFJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34856342"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34856342"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 18:38:37 -0700
X-CSE-ConnectionGUID: h9kKAZAzSSK4pZ83It2RnQ==
X-CSE-MsgGUID: BW4quCm3RB2atekNEC9smg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46581961"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2024 18:38:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPBQf-000QPG-0u;
	Thu, 04 Jul 2024 01:38:33 +0000
Date: Thu, 4 Jul 2024 09:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 8670/10451]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: ethernet-phy@0: compatible:
 ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
Message-ID: <202407040920.cBmytSav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 8fda53719a596fa2a2880c42b5fa4126fbbbfc3d [8670/10451] dt-bindings: net: realtek,rtl82xx: Document known PHY IDs as compatible strings
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/archive/20240704/202407040920.cBmytSav-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407040920.cBmytSav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040920.cBmytSav-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
--
   arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/nxp,tda998x.yaml#
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
