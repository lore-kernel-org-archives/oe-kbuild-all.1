Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442279;
	b=qzv+MAEJpetYRdVrAh8IH80N9RtoPncIhx3gumnqkgWHemd+banLMyRYK+m61bsswYFs
	 r//Z60Mkis5x1CtsZK4AqnInpD138WSwar+Fjqsh+/J48AqexSdjkA8UpgBpx+xU1oiKt
	 9Oq88ltJTC38a1ORxvTFokYRuMmY2MyvIIGtUTEUiIiJRURELa2z73p0EVwX6AMuXC0Dv
	 p7UXQFhuYkXBG87Wg5ofSTM+Ze9MJo17h27o4fQbHKdU1+XlwlZq/yZQZTn2WZF+Gz3wj
	 ycUyaB5cLw8j5Per2I+QA/uJECsQEgYkGl73r7JSjnrtUuGo4CN6NaG6JdZjBZwU6wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442279;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=e/4fcVKw2EKpGtwVjLOzpQDkf4rhTm24lfHZw1tAlTI=;
	b=SSPIhDEMV4Yyg+twfsA2/PNHw2UNd+biPBogO6MhVr8gHqJWbcy6TCNFy4Jn9Af4lfFi
	 fBuMIXC/VPZu1JpGItAuLUFgxslk39ZY5K9KXEGMWaYOJG7BKuODkXB7xTw60pd4waVDP
	 f9Zvq+1eWqgCXl+GKFE77Tg+7oO5qtyG8dBDjbCLaXm4hmNoEEJOMTOWbRcAcVYcLVnpI
	 32ExQcXI6OIXqWXkmvsv67frfRaPbqaWdLtwRsx1Ijz6FoVzCNqHWkCMx1Nvh1j7Q4t/G
	 hI9j6WoCb+jv7hTk3pNr40+rqE4H/2XGgU/DG/YvN5SKQrc3kaqvHoqk6oU9nE7ANTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PG6M8+Gs;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82CA606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 00:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PG6M8+Gs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794442278; x=1825978278;
  h=date:from:to:cc:subject:message-id;
  bh=H/TGoIxcCik1KqB9GmQ/Nkvs49GuZvg0vShD3ye/17Y=;
  b=PG6M8+Gs7jyfj6mbSWbG2fNwovjoAlNNdGLRv1hYjB7v5c3GXgUsAehv
   D+CWGJ8gTnjuXBYCHQ8koJBRkbd9oG1W6cBH+++KFdaWKi3jqr6XbX+Dd
   1DFOVB4q0+ohxcVs38IbfgX4nJPw1abShREwSf5eAC8Z4pII5qZ4JlQeK
   IlkycSdZRlygtp+kpomAi4KE29qE1TZJ4nz+YEsACSrL2aUo3ck8p6zzJ
   g+ODTNEFzphnc5lIMfVo6ygPT1s94+XfYVl5UAPD9UAV3WaVTPL7WCoad
   XFWEZdlDr/5TgwfJoGIwWahqzqAzzF6Ckirrw8CZ8pNrWRlRpMGCU0+l2
   A==;
X-CSE-ConnectionGUID: hkhw7k9ETDqW8z4yrmHQEg==
X-CSE-MsgGUID: 5KrVRrVoTu2stiUAACi4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3262498"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3262498"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 16:11:18 -0800
X-CSE-ConnectionGUID: lpof/rzcRnOPmTyGVNpE5A==
X-CSE-MsgGUID: QojbO+jfSuiOMK+MMaNz7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="10301916"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 11 Nov 2026 16:11:15 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRIPJ-000000000kh-2kH8;
	Thu, 12 Nov 2026 00:11:13 +0000
Date: Thu, 12 Nov 2026 01:10:58 +0100
From: kernel test robot <lkp@intel.com>
To: Tan Siewert <tan@siewert.io>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Zev Weiss <zev@bewilderbeest.net>
Subject: [linux-next:master 5261/6673]
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2500-lhc']
Message-ID: <202611120115.pVP36VRY-lkp@intel.com>
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
head:   aaa2f954c21b205a0bcd0961e5b2be4e82e58455
commit: 3251db5e8a31b456ff9b841d73412a22735a7416 [5261/6673] ARM: dts: aspeed: Add ASRock X470D4U BMC
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611120115.pVP36VRY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120115.pVP36VRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120115.pVP36VRY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']
--
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u-data64.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2500-lhc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
