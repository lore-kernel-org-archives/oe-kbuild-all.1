Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7029CE1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720854554; cv=none; b=bDEggSYGXSdDnJWSV8JF3aBxm1IXrtpL9q7jryLkBpYi9KyHMT9/Pex0p/jNM9yUQXflej9rOQQOPjxNKLuQcfzG4U33Zn2lnF/MghdNk2LjbThuNAUvnlPo8A+7czmy1luB26BPh06iooBWjFO4/CAZM2012liXTWmcxIe/D+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720854554; c=relaxed/simple;
	bh=LY1VIR1fNJWKJAVH1Mmnvb67NEa5kzpWLgoZzDNtgyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gbEptPtabz1kN0qayUcXTq4mYZSbNVFKmnMZVc20H33H1WuDKLpMGYAlJBqAlqv+E4jZCNg1nmFChgvm1PsFNTrapsQ26CKtOJ3SYsQqIlHVG0eytYvla0OljpJdvlorAe5jtZYlx/gzHLWjcMFMktwqva6nyr/0VAG3X+ZHw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miKSjs3E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miKSjs3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720854552; x=1752390552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LY1VIR1fNJWKJAVH1Mmnvb67NEa5kzpWLgoZzDNtgyA=;
  b=miKSjs3ElxTLvtmd5XPBit81DZyb7/Bw7yUeCLqsvTsUl3Gi7O2A0a7Z
   3tWEEqKCKwl4b7aKyCNolfo2wf4venhCqGOP8KXMRnjYz9MYQO5nGnd8e
   lLCeJRNDTFRFxmqNzf8KeKrpC4b1nijtLdclGLu4Vnu1MUnAF4yszZiop
   zmxCnnYRRE+uRhTlcgzDQIPsr7F+lvXcCwCpfbrnlGiZjd7aEGV1rbslr
   cThZqJQKZk7qZepXUI3ReA/Fxq5F4W+J5rXzfTkO/S3+rPWrDY5/YZaGO
   QxE+v1BRS+9daDfdx8JDhFB96pRBeRYvgcu0GUpp6F3AyASpBMaUEBLEK
   Q==;
X-CSE-ConnectionGUID: W2ygkrc6SoOuqGStBGbsBQ==
X-CSE-MsgGUID: UJYbzz/PSUyDYRfH0a6Miw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29695295"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="29695295"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 00:09:10 -0700
X-CSE-ConnectionGUID: Kj90/9FJSJeCb1JudEp2TQ==
X-CSE-MsgGUID: 3uex/y9HQJuqR0iv87VZEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="80215814"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2024 00:09:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSWsT-000boG-0h;
	Sat, 13 Jul 2024 07:09:05 +0000
Date: Sat, 13 Jul 2024 15:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 6744/12880]
 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <202407131514.r1brwRNE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 83a6f4c62cb12aa902043fc1910fdbe483193f3c [6744/12880] arm64: dts: meson: add initial support for Dreambox One/Two
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131514.r1brwRNE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131514.r1brwRNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131514.r1brwRNE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
