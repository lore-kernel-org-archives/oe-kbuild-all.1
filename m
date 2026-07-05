Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B08364EA4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240065; cv=none; b=PCP1f0dWbNp6wYn0OnEXRDT5EFwjCCUxZ63PNstwhptt/s7RFXqJce3ulX0I3mgFEpLUxrqu7mHZJ1ILb+X4ozLGJfegK7iKKXYWVK9lFIcVvsuqesSADoGPrg3WDrjUT2vgcLAW3Eh8U+PNdhWrMzJekxjP8NeumYt5ysSR/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240065; c=relaxed/simple;
	bh=JxkaO7THP/z/1CpDH3eCpQJQ8WQ7UTwN7Uc7yVwSV0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BIOnbZSxBbK/ohivX3D5Lb7zKFNTnm6LF40SOZxYWOGS+xwG4FGBj0yWalxvXGPX/auRq5DddhtFdr+8boLiQrgP8Q6c6BYsi0Zo2gTG4hmWTVK5LYwi1dno4+Ecv8BT6uQi7cIlTOzioAZ6y7cMMmqvB2S+XaVt7EdalnKTAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGbY8k7Q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGbY8k7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783240062; x=1814776062;
  h=date:from:to:cc:subject:message-id;
  bh=JxkaO7THP/z/1CpDH3eCpQJQ8WQ7UTwN7Uc7yVwSV0g=;
  b=LGbY8k7QAr0R2MffMVUzExX31oXCMHrOJ+bbskCh8K/d4GpPWL8DkjE5
   dLQELZrDwWKOsOkBllg/PsFD7A4CzHGIY/p7cx4OTMsXs2HGpn1ayIfMt
   NFmFbc37kBw6F1fgos4xV5OpGtMGR3zqruGs2IYb8IWzd1ojpotkFoHPp
   Z6J3QW7IAdFUCXekTIaiexUq6iJdi8IjN9jQAb0UfAuIY+ivLJVDjTEZn
   dUUW7Rc2HBs81uWeF08w1gyVjaX8iBSLySI8rvV1AUgZ056St1QPLqfLO
   wpaKI7Mu64L9Tkbi3sgQvQrgHT5xCF+amyQXto8fQjjrKsgIQJWnSCGEv
   A==;
X-CSE-ConnectionGUID: NlYf7LaFQsG2gVg9MnxhMg==
X-CSE-MsgGUID: pOad6lv5Q6+1X6fxCHnF2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="84030031"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="84030031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 01:27:41 -0700
X-CSE-ConnectionGUID: Tiq0qLW1T0uSL5mOYDkamg==
X-CSE-MsgGUID: xaroaupSQIqL3mIGAgTxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="249001226"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jul 2026 01:27:38 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgICN-000000001th-3GNi;
	Sun, 05 Jul 2026 08:27:35 +0000
Date: Sun, 05 Jul 2026 10:27:15 +0200
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Kevin Hilman (TI)" <khilman@baylibre.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 1798/2307]
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm_conf@0
 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
Message-ID: <202607051026.jZA7WPtf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
commit: 68f994ec51e279e63c8fc40c1bfa8add4b708111 [1798/2307] ARM: dts: ti: Add specific compatibles for SCM conf nodes
config: arm-randconfig-2051-20260630 (https://download.01.org/0day-ci/archive/20260705/202607051026.jZA7WPtf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project df8b27d618d987e2d8961659514efdaa41ffea05)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607051026.jZA7WPtf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607051026.jZA7WPtf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revb1.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-revc.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am572x-idk.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am571x-idk.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/am574x-idk.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra7-evm.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra72-evm-revc.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra71-evm.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000: failed to match any schema with compatible: ['ti,dra7-l4-cfg', 'simple-pm-bus']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: scm@0 (ti,dra7-scm-core): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0: failed to match any schema with compatible: ['ti,dra7-scm-core', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: scm_conf@0 (ti,dra7-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0: failed to match any schema with compatible: ['ti,dra7-scm-conf', 'syscon', 'simple-bus']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/pbias_regulator@e00: failed to match any schema with compatible: ['ti,pbias-dra7', 'ti,pbias-omap']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: scm_conf@1c04 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: scm_conf@1c24 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/dma-router@c78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
   arch/arm/boot/dts/ti/omap/dra76-evm.dtb: cm_core_aon@0 (ti,dra7-cm-core-aon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
