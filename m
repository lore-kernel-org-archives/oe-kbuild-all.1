Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B740184524
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743243959; cv=none; b=CqxK1N/RhqGO+0EvwzpCiZeGL5j/vz+EUCpLFRWZQuDafhp+7K4VV5VHpIhIfqZx5jjLxxloTBcFwMGxnyBTHJpVtQPcpeT391HTKSCPbgeQlKr6NuIO0YkIJoxpQidIA/3CBo4ydI9gJY8sU/01Q3sU49oZsGZb4tuToCPhwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743243959; c=relaxed/simple;
	bh=GlugGqi6j7JxS/AMaG8Et0RheYpbJ9xS5gZzBhr0Mnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SgiVmDVVv4g0oon4jGE/AWKOf/r1muFKD8TM2ow49g19aYdPQmhm9BGC6Q+wBJEvaj5y3Ffx1WGSVZJxcg3Q53ncM3uLoiHw5WPvSvKn9vy25bfpU5NjMvruQWwQSOxZYGBmj5jEQtyl4U/t+xGsBSWYXBQzF5EBb5i6q5L80rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdjEiEDE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdjEiEDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743243958; x=1774779958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlugGqi6j7JxS/AMaG8Et0RheYpbJ9xS5gZzBhr0Mnw=;
  b=WdjEiEDEPUfMbHbSHvOvTPPdBinJJC/5dpS0mOleUp6E+QWIcwISsHmT
   fU6NeGFiDRTeX+E3cXoaFNF01sOk/UDHjXvhCL/aZtZLoAgKI4sr/4xZD
   ceet6uc6GBqu8OFiJCWHsa66gmWMjtOPHqUUXOCtoMH9CeT8bpb4JFuLS
   Izp9JW3Xoez7Y4BA0kQz8plgrDILo4CzDbnIO6LNmXjb5UqWzyvWXQTZR
   ZV4XMYsM5tosOljqu7BxPtl2lE3Ze+DRenh+ReJ7A3aRg0Y33f0WqFIKZ
   eII2C6fjDufcKBH+GONbPhKIDCGgBAf+UpEinS3HkQ8gXm3gTuZ+F0IwI
   g==;
X-CSE-ConnectionGUID: NzocLXKLQIGS6e9Nw+pyKw==
X-CSE-MsgGUID: Y6m6T85sRUSi5/uV4Cousg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54799302"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="54799302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 03:25:57 -0700
X-CSE-ConnectionGUID: 8s6oSG7NSpmpuUTQOVY+SA==
X-CSE-MsgGUID: R8DDmvybRZyhm/MEj8fkXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130506004"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 Mar 2025 03:25:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyTNL-00082g-1F;
	Sat, 29 Mar 2025 10:25:41 +0000
Date: Sat, 29 Mar 2025 18:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rsslro2 49/58]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb:
 ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0,
 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
Message-ID: <202503291838.osTwy6Qp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-rsslro2
head:   9b73048865d89da6f43aff7b0b3b5ed838ce3160
commit: 7046f879b3f4fa33bd7251d1826e679e995fb636 [49/58] arm64: dts: mediatek: mt7988: add interrupts for RSS
config: arm64-randconfig-051-20250326 (https://download.01.org/0day-ci/archive/20250329/202503291838.osTwy6Qp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291838.osTwy6Qp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291838.osTwy6Qp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: switch@15020000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@0: leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@1: leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@2: leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet-phy@3: leds: 'gsw-phy3-led0@0', 'gsw-phy3-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet@15100000: interrupts: [[0, 189, 4], [0, 190, 4], [0, 191, 4], [0, 192, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: ethernet@15100000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: gpio-keys: 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
