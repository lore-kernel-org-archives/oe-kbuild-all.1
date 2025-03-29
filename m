Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D30199E80
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743254849; cv=none; b=No0b9U0Id36/WncX1LL30Augt+x9oUPvOI2uwaKE55WAGfbF+7I6yrBrBYnj+ajid9ENDkU6rWJ4WoVK0wFrNfbu2Y6GuKEq4BT9tpX3YIde/dStbNm8SAz4G4TJS7AmG5w4cas94XvbfHEV23p4Sqnb+NIKzchYuWrSImhCbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743254849; c=relaxed/simple;
	bh=+OgdubdukT2/EFsOfru43+LM2Ue4GZ52pj94cItxxGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjsXq9IT70aFtup/C1hG9ONIEb9J6Pv82/tJVrHJ28g65biKK5AXoT24TkPPN+vHAmCDj37WaduF0UvlyX0umH26iETcwFOuIm702uW/DfDnsp9HLZOaTAgaBLJc6pt4FdsHR+Tr2i0YR0I+v1s0KqxO/axxHmlEJXVUfePxv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzTZuER+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzTZuER+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743254848; x=1774790848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+OgdubdukT2/EFsOfru43+LM2Ue4GZ52pj94cItxxGs=;
  b=SzTZuER+/CdUZgEvBVI3s3H3HzeVu13FO0GEUjpKDuwbdv4bTDuRnjkM
   nEJpzUnkJSMtaehZ0rko48/Cb3e5xt8XEqSTQFXPOxByZyW128flfqFRq
   S7CzVH81siHSvMNMUI+7/lOXTU7TfjLSaY/eONfbWjUNsn7zPWZ9FjW/L
   xaO/HYsaGpZAJcuMAjnKNJHbEJ676kyU+6U1+18LjOZgeMC4MVEN5tFwU
   AhAIJNV00uVYe0aeJ39obZsfrmY8pqnhfqfsckqCSFU8+jvFQWMf2WjBI
   E53alk4yajVodp7SL8W+4EaXBvLG1gGHwIg4UWAirKIkikdKuqiVS7YU8
   Q==;
X-CSE-ConnectionGUID: UpJo4sIcQkSOL3V9b36Iaw==
X-CSE-MsgGUID: o9zBdqaUSCW/VX4TbgK8vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="55264137"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="55264137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 06:27:27 -0700
X-CSE-ConnectionGUID: LqttO1o/TYGoL983Korhew==
X-CSE-MsgGUID: hbIn19GtSbWw9CHUXjkRtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130903160"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Mar 2025 06:27:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyWDb-000882-2O;
	Sat, 29 Mar 2025 13:27:23 +0000
Date: Sat, 29 Mar 2025 21:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rsslro2 50/58]
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb:
 ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0,
 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
Message-ID: <202503292148.aZAJjOaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-rsslro2
head:   33c7677746e06467ff53077b884250c034ad320a
commit: 87520135dab5aceb010c91e8c53cf269d7f54bf6 [50/58] arm64: dts: mediatek: mt7986: add interrupts for RSS
config: arm64-randconfig-051-20250326 (https://download.01.org/0day-ci/archive/20250329/202503292148.aZAJjOaU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292148.aZAJjOaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503292148.aZAJjOaU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts:98.10-154.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1100a000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31: 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
