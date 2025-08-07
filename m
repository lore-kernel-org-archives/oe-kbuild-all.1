Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529F1DF759
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561680; cv=none; b=VG7Wo+27LhmZdZ7eZ2Bn40SU6yKfyetN0nvYgvLlwJZ9bzqVYQgv8w3S7C61w+qQegn7p5CY4PxzpX3HNA+pAfc0FwbtH2tDehI3fvmW1cS/36wb7thSPtCKXtcJ3LOU9FqRF0NUYNCM7VZp1zmgDZMBtXcmUhDbZTotnnpkE7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561680; c=relaxed/simple;
	bh=wIsr0qXuAvaUiAbo/MoSUNVe07CX53R7iyeOoEOX9lg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ordmkehV98LQUAazYE52ACT6YGIpgVwV0tmhgSsF28Nl+6FGA3q7ObqMfu2LRMFJzP/ngwNgF78U7/bHzwes8aJyPGDIqHLaRJt68ziftYCrCI+jp7p3ys4Jdpz9mEkC00Jig0fqDjfCjxFYE5LZCgBqLUTNhPT0JT2kdB/64RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Voob2CRt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Voob2CRt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754561679; x=1786097679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wIsr0qXuAvaUiAbo/MoSUNVe07CX53R7iyeOoEOX9lg=;
  b=Voob2CRti7ffAyHCVLbd/4avRzs0CyVNvoSs/GsmPso9Zm1uTb/HuKHc
   LcvZRBN4H8IPzdBMYIx5ScdVNzCZJ298dDz23YLe6L27zUwRAwhwcXlwN
   1g5ZWLRVBLhy1Jcxi+vF/0/uq9DtmuUXIFcZUBXOB30Uqhw/RkSPm12ts
   EcTDkihnoAAtJZiGgT9aZkGjSljPQw5SQBkRVy1dDQueuLIL5wra8Il9l
   Q6H1j0HpnsOGAUYJHDqeAJcuCIxh1c7HAW6IbKBe6hbLJiKQOLUE5tvp2
   sDbJdHq8QDryalrsoE301JbZjjkvrt6ANwXrEoen24bQdiiB8f6kr906a
   g==;
X-CSE-ConnectionGUID: NAjT0Gx5T/qWfO1Ub5zC3A==
X-CSE-MsgGUID: 27H/wmZ3RWKWy5SKdHj0UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57033482"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57033482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 03:14:39 -0700
X-CSE-ConnectionGUID: VHCHSUVfQZuDmsqk9UAZNg==
X-CSE-MsgGUID: vHkZaTkdTiK6DGDTWLnXYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169486816"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 03:14:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujxdr-0002fw-0z;
	Thu, 07 Aug 2025 10:14:35 +0000
Date: Thu, 7 Aug 2025 18:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 170/801] Warning: Duplicate compatible
 "cdns,gpio-r1p02" found in schemas matching "$id":
Message-ID: <202508071848.BFQO1ufN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: aef30b22351af10c21e6e0219d8bb071321969a3 [170/801] dt-bindings: gpio: Convert cdns,gpio-r1p02 to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071848.BFQO1ufN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071848.BFQO1ufN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071848.BFQO1ufN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/aspeed,ast2400-cf-fsi-master.yaml#
   	http://devicetree.org/schemas/fsi-master.yaml#
   Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/fsi-master.yaml#
   	http://devicetree.org/schemas/fsi-master-gpio.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#
   Warning: Duplicate compatible "ti,omap4-dss" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,omap-dss.yaml#
   	http://devicetree.org/schemas/display/ti/ti,omap4-dss.yaml#
   Warning: Duplicate compatible "ti,opa362" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/ti/ti,opa362.yaml#
   	http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
>> Warning: Duplicate compatible "cdns,gpio-r1p02" found in schemas matching "$id":
   	http://devicetree.org/schemas/cdns,gpio-r1p02.yaml#
   	http://devicetree.org/schemas/gpio/cdns,gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
