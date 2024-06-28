Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C214D8BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719607223; cv=none; b=HRhbv75G8FV3hK0iXh9z31sdttme4mg4gnEohmYmn1NYKU2HZGM2hM5Kxql21GSueZ3LHTM9b9ge0WuMXaONal4E0bQjlry46THDqfrS2c1aZjOTPhqcF7HIEd0u1L0MOLTVGm01RFMofnicuy2u6mPRWTGoQm2Ro9pTEDvj0lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719607223; c=relaxed/simple;
	bh=J7gV5DqiNsr4xfyCNDFfhCJ6Kko7DESmkalDs69v/vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8AJ+phZxmdTssU+hdm8vghyV4qoeTvyYFuRNqtoYgG3z1ud/I1qZOwUKu6yzc7vEii64r4Ix8MMi5plWLfU6diZj+4TuDSuThIM5a8a1xtczOav8vTHVs3kTwwvQHQrytXAwbyvCXgBSnjs6JpSt5lizk7kL2kvSkgqoMTDoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ3+TAQx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ3+TAQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719607222; x=1751143222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7gV5DqiNsr4xfyCNDFfhCJ6Kko7DESmkalDs69v/vM=;
  b=kQ3+TAQxF/8wRCNz4WLWjlsHbQDaMx+AmUa9L6NF7HLosm7f96uC0XTb
   RWJXya5uJ0V/tWFVHDmKWJMBbSYe+WlJ3f2dslglayR+lYhSoCAAsuqGH
   19ozBDvSfYf2K4WJFQC47CBCbAb3xcys1E6ODTV3C+vhiq3oLTpT0zeWd
   9f3h/Ddm6PA8NUPGXRF4c/eOeZ7kg9qG/dU6fk34cdG8oTLEaGcKvZPv0
   pmzdC5CglreJCyWlxoyERp1fWRdkAzQh9TudJ8P/cr2ZI7jWA44fHEh7Z
   KswZlJxtbype6vsLdH2nNP9e1z/OaWUOkCKA1p5VEK9DiWCYC0ygDmJH3
   w==;
X-CSE-ConnectionGUID: +iM0KUKgQOqdTuriRVZakw==
X-CSE-MsgGUID: 9b1hPLVcQWWMXV7WoxQJLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="12307472"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="12307472"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 13:40:21 -0700
X-CSE-ConnectionGUID: XnS4E5IfSJOAfTl9JzAWCQ==
X-CSE-MsgGUID: zLqbl9uLSeuk8Aa3XM7QuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44731230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jun 2024 13:40:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNIOH-000ITG-2h;
	Fri, 28 Jun 2024 20:40:17 +0000
Date: Sat, 29 Jun 2024 04:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>
Subject: [sunxi:sunxi/dt-for-6.11 14/14]
 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/iommu@30f0000:
 failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
Message-ID: <202406290449.8yYLf60J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-6.11
head:   0c85e2e377c368e1e0f04ea28dcbc5aa06302551
commit: 0c85e2e377c368e1e0f04ea28dcbc5aa06302551 [14/14] arm64: dts: allwinner: h616: add IOMMU node
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290449.8yYLf60J-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290449.8yYLf60J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290449.8yYLf60J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /: compatible: ['oranth,tanix-tx1', 'allwinner,sun50i-h616'] is valid under each of {}, {}, {'items': [{'const': 'oranth,tanix-tx1'}, {'const': 'allwinner,sun50i-h616'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /: compatible: ['bigtreetech,cb1-manta', 'bigtreetech,cb1', 'allwinner,sun50i-h616'] is valid under each of {}, {}, {'items': [{'const': 'bigtreetech,cb1-manta'}, {'const': 'bigtreetech,cb1'}, {'const': 'allwinner,sun50i-h616'}], 'type': 'array', 'minItems': 3, 'maxItems': 3}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /: compatible: ['bigtreetech,pi', 'allwinner,sun50i-h616'] is valid under each of {}, {}, {'items': [{'const': 'bigtreetech,pi'}, {'const': 'allwinner,sun50i-h616'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /: compatible: ['xunlong,orangepi-zero2', 'allwinner,sun50i-h616'] is valid under each of {}, {}, {'items': [{'const': 'xunlong,orangepi-zero2'}, {'const': 'allwinner,sun50i-h616'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /: compatible: ['hechuang,x96-mate', 'allwinner,sun50i-h616'] is valid under each of {}, {}, {'items': [{'const': 'hechuang,x96-mate'}, {'const': 'allwinner,sun50i-h616'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /: compatible: ['sipeed,longan-pi-3h', 'sipeed,longan-module-3h', 'allwinner,sun50i-h618'] is valid under each of {}, {}, {'items': [{'const': 'sipeed,longan-pi-3h'}, {'const': 'sipeed,longan-module-3h'}, {'const': 'allwinner,sun50i-h618'}], 'type': 'array', 'minItems': 3, 'maxItems': 3}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /: compatible: ['xunlong,orangepi-zero2w', 'allwinner,sun50i-h618'] is valid under each of {}, {}, {'items': [{'const': 'xunlong,orangepi-zero2w'}, {'const': 'allwinner,sun50i-h618'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /: compatible: ['xunlong,orangepi-zero3', 'allwinner,sun50i-h618'] is valid under each of {}, {}, {'items': [{'const': 'xunlong,orangepi-zero3'}, {'const': 'allwinner,sun50i-h618'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /: compatible: ['transpeed,8k618-t', 'allwinner,sun50i-h618'] is valid under each of {}, {}, {'items': [{'const': 'transpeed,8k618-t'}, {'const': 'allwinner,sun50i-h618'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /: compatible: ['anbernic,rg35xx-2024', 'allwinner,sun50i-h700'] is valid under each of {'items': [{'const': 'anbernic,rg35xx-2024'}, {'const': 'allwinner,sun50i-h700'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}, {}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@3a3: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /: compatible: ['anbernic,rg35xx-plus', 'allwinner,sun50i-h700'] is valid under each of {}, {'items': [{'const': 'anbernic,rg35xx-plus'}, {'const': 'allwinner,sun50i-h700'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@3a3: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-926.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /: compatible: ['anbernic,rg35xx-h', 'allwinner,sun50i-h700'] is valid under each of {}, {}, {'items': [{'const': 'anbernic,rg35xx-h'}, {'const': 'allwinner,sun50i-h700'}], 'type': 'array', 'minItems': 2, 'maxItems': 2}, {}
   	from schema $id: http://devicetree.org/schemas/arm/sunxi.yaml#
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: /soc/iommu@30f0000: failed to match any schema with compatible: ['allwinner,sun50i-h616-iommu']
   arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@3a3: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
