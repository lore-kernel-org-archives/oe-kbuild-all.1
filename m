Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539134;
	b=KlCWChDYD/qa2hqYB8C6SzeMpqUz1ySYM38Cp0sVrCgvjoA+BcaOxSkMnVy/T9XyPXvq
	 lKLo01YWcq/Z1ZWK5ie5Kz9rtzkY1iOKiu60XTTntJG+FVqk/kv04VcUnk6IprfQRxi8q
	 9z8vxcKcJPHwhkclf7a+y1cA3kKd5QblbfHfE0YoK2HDhiARyJpLlx+zUHPdZFiKrWQZT
	 mAP7JHygd/LnaBKghphCBjVBFY06mgB9oUf55yQxzqDTK/aLYuVBx1BqArggFiZLRY359
	 rm8Z3KD6dQsJATtXTIH3FRkIInXNAtFdn+aXRYf9wQ1Y/6effs3sIMsho1UzewtfThA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539134;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5ukiYHeobmSrjD/MvZcrDSuumKRc8IELabO2rx7nXJ0=;
	b=nbGbiwx23iy+ts25n7ASEvAEQiT21LbV6b8NrAmmtUxu3GuiCmdxmCG3WDCvpnVd923V
	 /Q5tAuIp9fLTonZmlBiKBtYKS1cNSIm4NFUM4nRttTOlAA0wJ4tSh0xVhOyIunRTYN2DA
	 WZUrS50nXXJqmvJwWSzjbtEIYRJNu2N1IvyhZzEi6qi6y45o+X15+VhNKK2X9zLp2BNfn
	 DThwM75uPDls4cRH+IkpESm59+dpxlbj6Aj2AB1AE0XpY4yzu2Xq6h2bKOD1+EUl/Q/N5
	 ez3CCIXSniwLwooKFsP3XWy4yLK4GeO0sDKlvzS1IKtSycvziCcOL3wuup/bIYeQU7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QiJDpzvN;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110DE606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 23:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 110DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QiJDpzvN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792539133; x=1824075133;
  h=date:from:to:cc:subject:message-id;
  bh=h69lnHoHzkmnjKM8JxC/GrYk5T+8JRBP2kX3kFGsDaM=;
  b=QiJDpzvNTTX6sN/DvV7QOtO62qZPW94VN4y0sGuINEB92heZaWmr/UmO
   5sRePF7Taz92ORIoWG24DS6qmJZChwe8ugI170++UJljhBfLOrNqsqF92
   a4kdOWu8Zx/uL1RUeWIC7+eM+3h+JpNuAV+vc4Je/aEuEi2MSMDUlqAS1
   jhCHqG+DDmxMidLoK+McyyYv+SY9eeCJxQ7M1MITWFFSIkNSAtGB0g+GT
   CrWY8RzEWFirABYhCDD4NHZrRlIWiZwRjd8bw4/RHvA5JNQ/kTFjuDMWZ
   9Zlt3EBIRNoVdLyIB9fX0gpSLGA4NJe3u0COlrOTXs0E7eos3BLSpFKGj
   Q==;
X-CSE-ConnectionGUID: xLbo88mQTlCWvmqy8k00KQ==
X-CSE-MsgGUID: 5Xi5pj7CQ7WOBRMAyPc+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1157458"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1157458"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 16:32:11 -0700
X-CSE-ConnectionGUID: aIX2ohQJQ+if0kCPHoM1LA==
X-CSE-MsgGUID: bOTVrZStRKizXqqt1aHKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3361770"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2026 16:31:51 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJJJ6-000000006Ut-270s;
	Tue, 20 Oct 2026 23:31:48 +0000
Date: Wed, 21 Oct 2026 01:31:36 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [linux-next:master 16219/19064]
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: pmic@0
 (hisilicon,hi6421-spmi): 'gpios' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202610210105.hmjf8KGY-lkp@intel.com>
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
head:   8f7df005a7564bd7ffa75da9c3085d5b996f1e16
commit: 1b482faa86591dbd8524d294383281f4adf2f6cf [16219/19064] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261021/202610210105.hmjf8KGY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210105.hmjf8KGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210105.hmjf8KGY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dtb: soc (simple-bus): gpio-range: 'ranges' is a required property
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
