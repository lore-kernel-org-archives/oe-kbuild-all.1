Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE32E762C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 04:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395600; cv=none; b=qd4+I66+TJleeOILBtTiIxJutzsSHkR/PtsTboUQ4S+nuswcCfBDs67A78bKt+1VT7NtL9FBdrqqNl0sb5yMBUgHtRu0A6cgXqtMSg4l1Gcg5oJpr7ImmcG66qQ5S330FKep30m7oYBG9brsen+wY8qrJWIi0zAQeHU9VJYlK20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395600; c=relaxed/simple;
	bh=7HyhUFYbpKvAKFZwLFnwzZ2k2gDcSH6I4Mp59FHGB2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GEuGVUQvqOGO+cxDMbDrv7CtGEgRLVbuDSkll5UTS5fDTHCpzKoSrkRvX1j4XyFOBAvoZ108OnuYOq+mzwRkTHphuV1YwmlFEi9MwHgLjIzBHXgQxT4xBFPyZ0hbsgBHPP2fmfXW6zzq5BANowcfQdfSju54oxv8akC0HN3forE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ace77ptF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ace77ptF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790395597; x=1821931597;
  h=date:from:to:cc:subject:message-id;
  bh=7HyhUFYbpKvAKFZwLFnwzZ2k2gDcSH6I4Mp59FHGB2Y=;
  b=ace77ptFBFquSA71qsofI7Nk5FlMYwJiffqogZT6UjA8KCcd6/mlj0rY
   GHKwm9kRQZ78LVOQEgebkU24cqHW4wASbXva0AEXTOTTxQxI4wQty8/oE
   +SYqBPdvDRwUcc3yH282klUpaPq6OSiO4K1EQZolOlBNrWwJXNH3NuXBf
   R2GT/9yg+GmUsEMolvwgYkYcX1jBxnlOhQWriN0w5w2nfjOChD5fw1uZw
   sPJbbjtF9wq4KmswZSOLR/OyTQ6uRcF+mjZClrTjZa5ANyR3lYd6Y2IEM
   GGXltGYUb8OZa+3l5qTXZpqLD84vjMqxeNCIEA6OCucbKdYjbx7Kr9DJw
   g==;
X-CSE-ConnectionGUID: 1CSlyANmT9OJ4VvGqQzgvw==
X-CSE-MsgGUID: ERD1rkzgR9as7lPTGjqAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="107558793"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="107558793"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 21:06:36 -0700
X-CSE-ConnectionGUID: 2CC1IRAHTiKoD7pj8yZ/nA==
X-CSE-MsgGUID: q21z87yNSDKWU7t5Rj1fCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="302435048"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2026 21:06:34 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAJgD-000000000D9-3vch;
	Sat, 26 Sep 2026 04:06:29 +0000
Date: Sat, 26 Sep 2026 06:06:01 +0200
From: kernel test robot <lkp@intel.com>
To: Nathan Morrisson <nmorrisson@phytec.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Davis <afd@ti.com>,
 Wadim Egorov <w.egorov@phytec.de>
Subject: [linux-next:master 4675/10910]
 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a0000000
 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg'
 were unexpected)
Message-ID: <202609260658.uBR4QZNk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 02b57c8a48ecbf5e1c11a62da840b4ae7e6332a6 [4675/10910] arm64: dts: ti: Add support for the phyCORE-AM67x
config: arm64-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260926/202609260658.uBR4QZNk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260658.uBR4QZNk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260658.uBR4QZNk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a0000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a0100000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a1000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a1100000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a2000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a2100000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a3000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a3100000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a4000000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dtb: memory@a4100000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
