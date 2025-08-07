Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBEC1EB9F2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754559684; cv=none; b=Y1FtBDhJFSo0cNJmWGUyrnwWMAjYXjYDdMY0fBzXzle4uMmN7NDQQZS7P1Wcky152FQyjtA6iZBE45PBuGg5EiTOaOgw/fbRm2C4MXtEsuKNbQnLbc0YdypQGg18ublq6HN34QOLznb5tcc6R1ACbOgiWij6eBOwXAsKp/zFiLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754559684; c=relaxed/simple;
	bh=1L0emHJ0GjvifbK11XHR2mQfSOSEpxvCU1vvsNrxY1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G44J+ue3otoAR5WdRw9kziHJMCl4MqQKx+HLx+OV5P3hAQjp9qBPSQcqhfvF1TmAdHPHH8TKira20lBy5GuPooXo/P4LV5hqrvl1NeAju04ECmKEZpNKjqzI0fMEPZ7EfFzQOW94ZnjVe7LQzwt3ia94OavH7CrrAufC8OzPtaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dince4a2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dince4a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754559683; x=1786095683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1L0emHJ0GjvifbK11XHR2mQfSOSEpxvCU1vvsNrxY1E=;
  b=Dince4a2KgJO8wrTwNwqGg6990nbcQsG9oL5BsycJhOu5RKZdMgXedOV
   MS0MCXs2Q+3a8+ZDjQJUJYFvSvKmchWOdQEyJcf6NM4Rl/zo4uavjwnbf
   2TuX1oxL/pfnupxKvidPIgFice2zR9pOOijL0qnKiypYxpxaAPSDy+znU
   Mibex8xu5Trz5NOJE3cMvxfxCfNRBi78lTwz5BBYIL69nv4AGVpYWfCGD
   QXdpm6mK9WbafBDvopERjFRAZHUAg2vuFOmvND+1QyKoAKHuXE5QglzHj
   XVZR/gDzxBEwnKEQLwFbUv50jfyUvW/cxzIu+CzzAynOGLCU3a8t+t8Xn
   A==;
X-CSE-ConnectionGUID: OoEgd0X/R4y1xB37bCzbyw==
X-CSE-MsgGUID: Qh5OgTffTPesCz99VYex8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67157311"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67157311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 02:41:22 -0700
X-CSE-ConnectionGUID: fRXKL+8jTWeFix1sp1Ygeg==
X-CSE-MsgGUID: AmO9UWAETIaCUJtKRrZGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="169480870"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 02:41:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujx77-0002ca-1D;
	Thu, 07 Aug 2025 09:40:55 +0000
Date: Thu, 7 Aug 2025 17:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 163/801] Warning: Duplicate compatible "fsi-master"
 found in schemas matching "$id":
Message-ID: <202508071725.fVNf6eEI-lkp@intel.com>
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
commit: 876cacefcb282d27d2d4c4043365b208bce47e60 [163/801] dt-bindings: fsi: Convert fsi-master-gpio to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071725.fVNf6eEI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071725.fVNf6eEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071725.fVNf6eEI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
>> Warning: Duplicate compatible "fsi-master" found in schemas matching "$id":
   	http://devicetree.org/schemas/aspeed,ast2400-cf-fsi-master.yaml#
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
   Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
   Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
