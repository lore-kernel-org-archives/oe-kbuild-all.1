Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5849CF45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371546; cv=none; b=YXVHPSboizWRl50opZQ/oBQlhk2/KuabkW5TgNHaEmC/C3ziVnsKwyoCUgs0B+hFrV6Mj+yF5RZ0sIavhphWuVGWvHOWv8aUgAAN2rBdfgdrRSSjw1uw4UN0IylnDdI4pTWPJsZugwKhbE8rcO5E+nfM73vqaS741q8bq4oo8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371546; c=relaxed/simple;
	bh=c1MRKnuOyLyLanMd9g1yAUxesRaCkh9CBeBEwevZhC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GmVCyCde8XrgJO7UFW5pG/Hb1bA3MA/WXUJNXhGjJ+NrtQY5V2q5aKAcAhDl7X4sAZWfdFEiQBfO1iYB+77L1VIUETOnhBukqc+BSyPVosY2X3SRz7vxWJ8U64eCT9oh9LiCkVO55J1VQdG+7kAUxOALwWenUdReMRblVZ8Ip1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G8YfjMm/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G8YfjMm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790371545; x=1821907545;
  h=date:from:to:cc:subject:message-id;
  bh=c1MRKnuOyLyLanMd9g1yAUxesRaCkh9CBeBEwevZhC4=;
  b=G8YfjMm/1it6zLs/oRxN+mAQJckJEqozRDj/dy+blxNonqNpRYQNeHxC
   7r3ME0MsTftav/EgRFHUXj2fK/GcfayYkQjYeoEiLsRTXcmN4CX9dc6pR
   0dNmbPMvxsHBzKyhPMPD3Wv6N/Gjk5xAeyujKwBeGRovbjMEc1GMusaEx
   hjUFlrsBdFSeeosDe1bpPPpuqNWrzeYvGg+WDWE1i8uqu0eB+W93aoBP9
   YHFLd1PzF8ZSbp1jiZ6hWuPF5atF0UIzQh74lSUzsCYstIsaAky9H0VeK
   O/8LrF5R/E3CfcL/fCtcCJGCC+GHlcLtf6dcCzcWGyuP9i/ai2o8u68TL
   w==;
X-CSE-ConnectionGUID: aJiFdPIOTua9Zex0nU9tAA==
X-CSE-MsgGUID: KzigvGvPSRSbgLvZzXcPgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90382462"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90382462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:25:37 -0700
X-CSE-ConnectionGUID: xry49TUXQXityKLHi4zM4g==
X-CSE-MsgGUID: V9Mgq39pRRenuUkUSsyA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303945508"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 14:25:35 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADQC-000000000u0-29ne;
	Fri, 25 Sep 2026 21:25:32 +0000
Date: Fri, 25 Sep 2026 23:25:16 +0200
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9229/10910]
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: aop-cmd-db-region@81c60000
 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were
 unexpected)
Message-ID: <202609252250.0O55BOZO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: ad8424e851415bddf52c5e1a87a154ff8afb83ce [9229/10910] arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree
config: arm64-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260925/202609252250.0O55BOZO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252250.0O55BOZO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252250.0O55BOZO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5762.27-5837.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5859.27-5915.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/ramoops.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: aop-cmd-db-region@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: lpm-region@6000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: lpm-region@6c80000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: lpm-region@6d40000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dtb: lpm-region@7c10000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
