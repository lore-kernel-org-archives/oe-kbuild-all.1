Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC184381B10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271490; cv=none; b=CkcvBp3aBoAJmDcqacU3zJkIgqAU/0z86UthyQ5XG5/uZLpcXP+5mpx7ej0JRTy/FYbx91yHWEhITAA9uFgs0vsoMgnqtDlqJ+VXiRT/wK0VcaAiIof9eL+DazgMXvClKsSvmhwBESlb2fmPjzhLzosrm5oMfVNl2QVJrkARhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271490; c=relaxed/simple;
	bh=/JI3SRbm6b5ZAGbIaelP/0mmbOWvt1FHBRydesXeaJ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pLfGPLWHFsgfmPSi59TrpVWpN6dYJ5GI50jqj2cf88c5YPK0ZqhBHip314iCY7Fosmj1IDUaXOOusiPSF3I+XCNSIMuyJ9qa2Tt5nYzfy5WMk4xMPH2xSLd9jPgmu9TyViAevOXp319UeAcC6rCg/OSQUCQF8FUgTcM2Mwb3liI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ygsyz0Ma; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ygsyz0Ma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781271489; x=1812807489;
  h=date:from:to:cc:subject:message-id;
  bh=/JI3SRbm6b5ZAGbIaelP/0mmbOWvt1FHBRydesXeaJ4=;
  b=Ygsyz0MaQLBzJaxjP55i7E/6mg5AdpeybrqlDfn6InhWTZvuQjUJz78Y
   qBaIZWJZ0G8ixcwJRgBniqq4TA1/R/wErDU1qIv2Y/5bxus+JkL4TGTxi
   3e72hjLoTOdFLRJJS2bDXfppMHoKTyUTsP0+MqGkqBtVQjWXYg//VCuHI
   mTEU05mck57otO6Je/ogkeHPvSKuEAnp1ELb5zDRwi7+bmafNUh5LbejG
   NYtg/q4lN1EPz8EUYVCT41osAjqxUFeVmCqKmAOglcGFBEiVkJczUbO7y
   J+IkuKRFdXTiuc2f6RQ8aIQItMURzVgPSCfoqFnMgQ2ExzbbrLlqc4KAp
   w==;
X-CSE-ConnectionGUID: 8no0GRTWRjGqn5amBGcGLA==
X-CSE-MsgGUID: V2GtNmbUSGOygmgj0XZXDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82162189"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82162189"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 06:38:08 -0700
X-CSE-ConnectionGUID: J3kzb6wbQcCtDA17n6SAqQ==
X-CSE-MsgGUID: lFuxcfyqQ8+2GMWB+PjM6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242441317"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2026 06:38:06 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY25E-000000004Gb-2GoI;
	Fri, 12 Jun 2026 13:38:04 +0000
Date: Fri, 12 Jun 2026 15:37:44 +0200
From: kernel test robot <lkp@intel.com>
To: bui duc phuc <phucduc.bui@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 12430/13336]
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: sound@fe1f0000
 (renesas,fsi2-r8a7740): 'clock-names' is a required property
Message-ID: <202606121504.gQAUu2CQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
commit: 955fecff55c301044c63575e606c2b5ff522331f [12430/13336] ASoC: dt-bindings: renesas,fsi: add support multiple clocks
config: arm-randconfig-2051-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121504.gQAUu2CQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121504.gQAUu2CQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121504.gQAUu2CQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'arm,coresight-etm4x-sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
   arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
   arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
   arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'cpu' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
   arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'out-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>> arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: sound@fe1f0000 (renesas,fsi2-r8a7740): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/renesas,fsi.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
