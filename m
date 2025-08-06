Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF822E36EC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 01:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754442088; cv=none; b=UiW6UKic0++iWgfCk9rqzjdf61V8ECHD2CCjqOZuzzUj7XssPqxQYTVHcSaTQlqfU+3dUcix7aCBX/bG0WFOEfdmN/vh9h3LWqI+xOUb1Pm7Exw/qUiHMWfYDTxtFyCWF6fSoiUwYa9nn2yRCt8ssP7ILPET9j+7zykbVOiOW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754442088; c=relaxed/simple;
	bh=2/Vkfm3l6h3A0cqiPVA7pX5VJg8HcqOTfMh2rmM6OLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaiS4BVbtWhYlKbmIQRAfdzYKQCSvAANk8NXxt+GOcIk58K8nQwiyOl7P+NdDDPs6fpN1vN15zswrr41AViXnz8OtdT7IUVeacStjhBYLZ2hnnTrwJCH8dkHG0p2sE/Ih/vWI9hnu+20WN+mI0DubZBojjZv6Vf3DEeEgjw81aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhegWB7u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhegWB7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754442087; x=1785978087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/Vkfm3l6h3A0cqiPVA7pX5VJg8HcqOTfMh2rmM6OLc=;
  b=NhegWB7uWAvD13yd0JsFEcISs1bMrUQs6CkPK49rIk9tqtKg2FTP2uSj
   /XCDtHnKdpkhtcgdT3tuhdThSWW2SjZ5Z7ymowwxjHeGCo5m1UQuPylsX
   tiP5rijUH9j9Bi5cpSYVfckZB48PYeHr6sVZrpCgCa7ApILCi0WKHC+OO
   huSUJvVJdNFj7rEZMuIJFkbChwexmoziarCN0FEeNmGmluu36ZuB65eE6
   B+YsMoYGC0+FOzyOIwzQR9wKVDcmrI+GfzaGKts27FlV3N56T/dKP8b78
   zGHB3s2ACPzB0iwqOoxwXvW4dBpwjplaxs0W2QEorkrmdteMyba7acmlz
   w==;
X-CSE-ConnectionGUID: GCdt+0KIQqKjzjZqPwQyyw==
X-CSE-MsgGUID: Kry+uKBCQsC6iOmdRNFXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44344598"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="44344598"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 18:01:26 -0700
X-CSE-ConnectionGUID: wa2bQiXGQZa6pIPrMSkaKA==
X-CSE-MsgGUID: nmfKwJ2HSMe+GPvsF/CDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169087381"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 05 Aug 2025 18:01:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujSWt-0000rO-0q;
	Wed, 06 Aug 2025 01:01:19 +0000
Date: Wed, 6 Aug 2025 09:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18144000
 (img,pistachio-clk): compatible: ['img,pistachio-clk', 'syscon'] is too long
Message-ID: <202508060831.IvkZDvx3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
commit: 46dba2e6a3eeac025d7331f4a6f85d6a04b62185 dt-bindings: clock: Convert img,pistachio-clk to DT schema
date:   7 weeks ago
config: mips-randconfig-052-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060831.IvkZDvx3-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060831.IvkZDvx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060831.IvkZDvx3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: mmc@18142000 (img,pistachio-dw-mshc): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /dma-controller@18143000: failed to match any schema with compatible: ['img,pistachio-mdc-dma']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18144000 (img,pistachio-clk): compatible: ['img,pistachio-clk', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml#
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): 'reset-controller' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml#
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): compatible: ['img,pistachio-cr-periph', 'syscon', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18148000/reset-controller: failed to match any schema with compatible: ['img,pistachio-reset']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18149000 (img,pistachio-cr-top): compatible: ['img,pistachio-cr-top', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml#
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18149000 (img,pistachio-cr-top): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml#
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18149000 (img,pistachio-cr-top): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml#
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /usb-phy: failed to match any schema with compatible: ['img,pistachio-usb-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
