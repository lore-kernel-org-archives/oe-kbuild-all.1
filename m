Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069D349B19
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 08:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411067; cv=none; b=KEtJidXq3IuCNVpXAEcvBKuuqZT0Lkb99dCEE7WjiwJcmAJvwRDZQSGSvAQ3obGhEsUCk6U3WHi64GXW8FhmxzZdcojulmHmlBsu/0owUt5QaqrAk14Fl1rpogdtwBRWqWxJ9oQsthZXWrzZM8c4oIQBzlBJTSU/PTfvQpYnOQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411067; c=relaxed/simple;
	bh=otRhqA/gZPZBi5Xa/NBlUnxopNM0wsaTjmOXxgUSmlY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M8Flg0TWg9ESGRacebARjyfDSmuO0ba/Lbwz+k9c9/aorSGrUC+271PhHt9LddHQfgUCpDZIjvHGpJ7jcLuwsiCwzBGI66yhBR8gKJgVJyWtHlROIhSto2rEYUMeB6ozhIwWvcj5RDYe+vqINFcF56i35UqBoFaSdCd4LHz6KIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZeLSzzf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZeLSzzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790411066; x=1821947066;
  h=date:from:to:cc:subject:message-id;
  bh=otRhqA/gZPZBi5Xa/NBlUnxopNM0wsaTjmOXxgUSmlY=;
  b=KZeLSzzfiVV5UQqANeUlYMD3i4CI60wnXeoieqjnGZpS62iaJ+0pAy53
   jf1b6euAYpTV1r+n9ap6ZXDUryNieaHDqCEG4oKdS8GdYcNVJSlw/f1Ka
   CcBN3GZuLxy4bR9jd48MrQNXplofe9dUTpAOKwhsjTAIyV7rP/i75NLx9
   sdWPJHfnt5n+ZM0YSIgYxKclw3Yqvyio44vhJcu6FB7V5EgZGAhcHxah1
   aLaNnTmJl4wVsoknBZfXxbGRxuOAf8wkEM3NXR9mpaatobvmyNlb+KvZV
   oEyg3d0GwSB1dZRiHmSmu+3Z/TcLP1LiOnPQNWpM3EsrZyZfZv86za5WS
   Q==;
X-CSE-ConnectionGUID: xNmmFUUoSIS9cFq48W8Dag==
X-CSE-MsgGUID: g3XAlvu7Sk6D78ZZcqsjIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90090962"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="90090962"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 01:24:25 -0700
X-CSE-ConnectionGUID: cW6XTjbASwWYF2yYm49nIA==
X-CSE-MsgGUID: tFIdK/KNQIWz/mnEANlZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="273640577"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2026 01:24:24 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xANhl-000000000Td-0DMg;
	Sat, 26 Sep 2026 08:24:21 +0000
Date: Sat, 26 Sep 2026 10:23:36 +0200
From: kernel test robot <lkp@intel.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 1382/10910]
 arch/arm64/boot/dts/freescale/imx952-frdm.dtb: linux,cma (shared-dma-pool):
 Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size'
 were unexpected)
Message-ID: <202609261010.qYWQPhqM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 4725482e4e6c9d7b5adfaecd48230d7d83111ecd [1382/10910] arm64: dts: freescale: add i.MX952 FRDM Board support device tree
config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260926/202609261010.qYWQPhqM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261010.qYWQPhqM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261010.qYWQPhqM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx952.dtsi:343.6-1534.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/freescale/imx952-frdm.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx952-frdm.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
