Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFFC12E7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752854546; cv=none; b=ndxhblQ2AjULHFvQS2Ebd2AbwGdlbLuI8dmXgv5Wr8KARna5sZAI224xFfW4r5yhjArtPkpQ1jspPaMWmwslEM61E0Zotb0QT/f2PvZ1NAsDAqMt68i8LQSJgkywwPUSU94uSPN+gL8EMN+iSPvVgvH3+6c/HoPMfoYObRp30Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752854546; c=relaxed/simple;
	bh=IaEmvYuHftIpxxpDophQ9/SITMJe6ejLmv0il5gaoJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAo2McWCr1N37FqgTJ2TGq0aAgQGeOTRib9A/od62tw0i2uUhoO1XqN9wYmS5/aYIZ36huY+L7Y3Cie+Q97RkpHaP3UJODVsZ807nMUMId4ry5EpoF1J5XXwgjRkmmbNN+WYgtH8aNpSOzp792lNAeFCWuEw74RVKghiHQMJYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVQB4nrd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVQB4nrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752854545; x=1784390545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaEmvYuHftIpxxpDophQ9/SITMJe6ejLmv0il5gaoJk=;
  b=aVQB4nrdD/I+wRxnaMyud5ozJQvDyoBFegdBzY/kOACM0L11PbXwmMKE
   LeTZR8ro9ODvHpVTgyaQwxedWC0wIhiA7VBgnGVvos3ObuKvWBFLlTuJo
   sR7u6KhDLqGaXYDhdMmfcVLi6p6XecVoqYyN8jLHsK14hyWYMrWVIFeDP
   Rem8BsoRm3P4fw7ATqQyfPdA1qfzerk4E8Rlt+yl1q4iKHUKBhAu/loYX
   irbh9EkWZUx/tUG6VHAaZa6+yXoMWVuQZWq9HUoid76/EBvajv4jFVDoP
   SPfg6X8a4J6KKcdsaRSfgBwFGXiob9aAVbQsOm7LSUpkxqRzVmm60f6jp
   A==;
X-CSE-ConnectionGUID: vIE0muZmRvOhiKEuDmm9Lw==
X-CSE-MsgGUID: DB3YR0gTSd6uyWy7SHAa+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="77689638"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="77689638"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 09:02:24 -0700
X-CSE-ConnectionGUID: iaiiuCNLRniAPPIJn8SM4g==
X-CSE-MsgGUID: z7WHt6orQw28csiqUuPDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="158442147"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jul 2025 09:02:23 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucnXR-0000w5-0j;
	Fri, 18 Jul 2025 16:02:21 +0000
Date: Fri, 18 Jul 2025 18:01:41 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 8067/11307]
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb:
 ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197,
 4], [0, 198, 4], [0, 199, 4]] is too short
Message-ID: <202507181819.yDa5ApF5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 356dea0baf4c0903ac188bf18e8ff1af0866c930 [8067/11307] dt-bindings: net: mediatek,net: allow up to 8 IRQs
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250718/202507181819.yDa5ApF5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181819.yDa5ApF5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181819.yDa5ApF5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts:98.10-154.4: Warning (avoid_unnecessary_addr_size): /soc/spi@1100a000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@31 (mediatek,mt7531): 'interrupts' is a dependency of 'interrupt-controller'
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7986a.dtsi:431.19-445.5: Warning (simple_bus_reg): /soc/t-phy: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: ethernet@15100000 (mediatek,mt7986-eth): interrupts: [[0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
