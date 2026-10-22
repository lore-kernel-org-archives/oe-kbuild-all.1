Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663733;
	b=RENpM2Rmt2UZprQ4c+hSNhInnfnSAAGFxR5NN6ZRCJlLg/8ml8kipzC84zU7Yceo93l/
	 OCxElWDZYPzRs+rIiFwkDKw6qVSdYl26S8BLAcrtoqpaLkbtfEjczueXPBJfMK0EDDTzg
	 BaEZJHtDzJdXyUVI/mYIP9C0vUZBSXPsW+BcP3CGnb3l/FwKHG6yAFtAo+SmLFy3vnKBx
	 uLlMO9ZACIIegxisxpSl6xNeaJeOjhSLeU7BBdslS/0aCjMKuRxxlq1F2K6klgyroopad
	 n7AlYxXNcdmCH5PCrS/yyZ+aCdn9VwuP1eiUHWQqhYDmzGvnQm6orXONzz8apn4Hl4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663733;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qthHXwZdJTAPjYgoRGh6HpmxAzgWwTzYGsGMb0zflh8=;
	b=aJdc+URxyvIUncOhPibu3SRl8B1ma8ye4Ccn5F8AHeHtV88QjnXJs0S46GzddUI8v5tc
	 gsBBEDwgSt5m2inGnTOq8yDDtxeDjabxe6P03De+cqHG6dKaVwDnI2WMj42+oyr7hiAvy
	 AkVSsIqChNrWr6IlEDDe5Inju0Y79XlaXag9WcMHVH2oBJ5aGPI2zMG3NEILpxsRPnbTt
	 Xbfu+fvg1jFVV6NBZ/GwDBM47iyy7n986izb7Gfey9fcOLtolNhc4hrIg4PUDoCpTwH5K
	 +M1AaudpVKKi305dEiibZnMXNQHEHCkbrTntluIuhxgUMxo1LlprkP8oM5k1UI4K3dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="PHt/vZj6";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BF606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 10:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1BF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PHt/vZj6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792663732; x=1824199732;
  h=date:from:to:cc:subject:message-id;
  bh=ke7VBmbwLZWnq2zYygRr6MOhRKcP/LD2BeF3UKMCyb8=;
  b=PHt/vZj6NwB5s+CRH6t48rfeQuPfpy9+0Q15JkawKE7VZztUL8rFjWiA
   LCljc+ML3GKRf5Dw+2LPkSDT8gLcafDp/vpzUKt2LxGiU7D5nOq2MUqQE
   4LSEWbnplGCDR+S54kUIv3bYnyLS1fh/LOCr0n84omySAtsfnKXecfWpM
   ieRlHjUgiwVb2qqJnCUWp75p54LUOQf7mvKE12xSMmaGYZTjNXCHIhBh0
   rdZO7Cv5ZUDbl1rVtGmRtFBeG/qVPXzbA+tI8QKv5W7e+Jv7uII4dGdGh
   gYbMt8LUNIxdEhzxB1bfVj+ScyjtaCrGmn69GyDnMkEbqQgRP9Y5JpFRN
   g==;
X-CSE-ConnectionGUID: bcGGX5S0RauFpd7IGLsdrw==
X-CSE-MsgGUID: 3Iz/aNKaTtG9L8to3VJybg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1407897"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1407897"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 03:08:52 -0700
X-CSE-ConnectionGUID: TxAGJoIcQtGKhV3RbeObdQ==
X-CSE-MsgGUID: h6jXWKpJTteWjTr8AIsfug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3719735"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2026 03:08:50 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJpj6-000000000I5-0Ovh;
	Thu, 22 Oct 2026 10:08:48 +0000
Date: Thu, 22 Oct 2026 12:08:11 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [linux-next:master 16173/19668]
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0
 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202610221236.bq5LCPVt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9a482184d910775cf648863148944945b74e2815
commit: 1b482faa86591dbd8524d294383281f4adf2f6cf [16173/19668] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261022/202610221236.bq5LCPVt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610221236.bq5LCPVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610221236.bq5LCPVt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: soc (simple-bus): reset: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff35000: failed to match any schema with compatible: ['hisilicon,hi3670-crgctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/pctrl@e8a09000: failed to match any schema with compatible: ['hisilicon,hi3670-pctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/crg_ctrl@fff34000: failed to match any schema with compatible: ['hisilicon,hi3670-pmuctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/sctrl@fff0a000: failed to match any schema with compatible: ['hisilicon,hi3670-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3670-iomcu', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media1_crgctrl@e87ff000: failed to match any schema with compatible: ['hisilicon,hi3670-media1-crg', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: /soc/media2_crgctrl@e8900000: failed to match any schema with compatible: ['hisilicon,hi3670-media2-crg', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/hisilicon,hi6421-spmi-pmic.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
