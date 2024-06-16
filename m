Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C761D10A19
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 17:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718557951; cv=none; b=Uj1n9GsVAGuUt7y7F+c36U35nVYPiEQ3k0806TqEgUzcu3hZwLbVUdlME99v0QtGISWbvbDCoyCmW6WY0YbzLr0nZ/IZ+WQYao3ataqgCtxHtEaDYwmNRyZ9+KgM3vYefDxa84ZvRqMVabFQ6OFrymF7BtUJK6shXeZI7hAr5kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718557951; c=relaxed/simple;
	bh=H2EZcAWGg1BxeChHgpeehhxwzO9demWZnyzirQIYTvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApRcXwvSRH7rVUYDYH2wAbPzECBLg0W+/CsJcirCqwQaLNYghaQvR1eC8NUGnyjhxJQPiip4OHkkXPc2MLQS6AmqOfkhh2DNupuLZVK1TErR/G2/QBGsrnUKuYbSdBTm73ZXBxyGKmhFA27lrwxsSR9ZVLXJc6TSUqMF/s7wrPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbEgClTT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbEgClTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718557950; x=1750093950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2EZcAWGg1BxeChHgpeehhxwzO9demWZnyzirQIYTvE=;
  b=QbEgClTT93OdH1K5az0Ryk3JIyuX4KzMmGzpRrdHeWUPrme4Z7vZqBlw
   bIQv2HRDriUsMX7lPkzlEaXY8Ot2TkTEiLVto8yfItHui6l/CJahvVuaU
   VsLUpE+Vzgpsv2caQ+N46wiV0ZtqibAc8I45n62XBzehPc8iS7JQzNHIw
   MjQYfwoinJby3qywTkDC9jKnSQ8SRtB987m/M+cXuX5emLjpoW7Hte1bg
   IGxK0qbMrmD8KGwg1FnV5RjnpoF/2ptk2eOMxXrkQWokRP7lv6sCDhCj+
   Y7ARU12q2hF0T4Ro/U5eZrVTm9PxypMKBPFo3kbbO657Z5kNQ7BBkKyON
   w==;
X-CSE-ConnectionGUID: c2kZg61oSie+oyToPFCx7A==
X-CSE-MsgGUID: TRveXPoNSJ2tBPG57OZVDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15539881"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="15539881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 10:12:30 -0700
X-CSE-ConnectionGUID: +oAa4ZcIRHylpPNHz4xADg==
X-CSE-MsgGUID: wHXadxXmShC48aFcELZgsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="71765982"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jun 2024 10:12:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sItQY-00035i-0t;
	Sun, 16 Jun 2024 17:12:26 +0000
Date: Mon, 17 Jun 2024 01:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 7/8]
 arch/arm64/boot/dts/apm/apm-mustang.dtb: poweroff_mbox@10548000: compatible:
 ['syscon'] is too short
Message-ID: <202406170337.mzcUrPTs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   0f4f5cdbae0695ae8533aec60f629593d2c818f8
commit: 09928d5821f837e08a75e5ffab3d16d05893aac9 [7/8] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/archive/20240617/202406170337.mzcUrPTs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170337.mzcUrPTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170337.mzcUrPTs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mdio@17020000: failed to match any schema with compatible: ['apm,xgene-mdio-rgmii']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000: phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/ethernet@17020000: failed to match any schema with compatible: ['apm,xgene-enet']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/ethernet@17020000/mdio: failed to match any schema with compatible: ['apm,xgene-mdio']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/ethernet@1f210000: failed to match any schema with compatible: ['apm,xgene1-sgenet']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/ethernet@1f210030: failed to match any schema with compatible: ['apm,xgene1-sgenet']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/ethernet@1f610000: failed to match any schema with compatible: ['apm,xgene1-xgenet']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/ethernet@1f620000: failed to match any schema with compatible: ['apm,xgene1-xgenet']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/dma@1f270000: failed to match any schema with compatible: ['apm,xgene-storm-dma']
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: poweroff_mbox@10548000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@1f63c000: failed to match any schema with compatible: ['apm,xgene-gpio']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/gpio@17001000: failed to match any schema with compatible: ['apm,xgene-gpio-sb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mdio@1f610000: failed to match any schema with compatible: ['apm,xgene-mdio-xfi']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f610000: failed to match any schema with compatible: ['apm,xgene2-sgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/ethernet@1f620000: failed to match any schema with compatible: ['apm,xgene2-xgenet']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: i2c@10511000: Unevaluated properties are not allowed ('#clock-cells', 'bus_num' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: i2c@10640000: Unevaluated properties are not allowed ('bus_num' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: poweroff_mbox@10548000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
