Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0921D596
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758532329; cv=none; b=GSs00UAznVUVRijOKxqiay5WYfANK0TSDwI6oCnoDQGVXjN/mr3zwHSqzEFlc2RbkRgS6G07WLLN3WD+RqxLlAHG9NmNc3qWtMXpKS5o3I9v8kBmrPAvMEfytye2KbY5OB3ujA/s3AlPy+rB4oLl17ccFlXo7FHf8f9SqCnH+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758532329; c=relaxed/simple;
	bh=3KGfcU1X7mN6RRniJiNupMfnmXM50TXm8f6XF8g2bco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uX8KAVWxtCWsnGAkHfJEVdY1PUmxs7Q857e+AZ3rtFTT1mVpNsOaXBlshFOHFPjgb+Z42ARSwtKMdSdTn0gwiHeKWzndI1fk0H64WCg5h7NSHzRznfwDpkGfDpHGD+46h4rkuwlqZPmWmyzNMGegnVViccVuxF9VyeFsEIlen68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cpk6uq2I; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cpk6uq2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758532327; x=1790068327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3KGfcU1X7mN6RRniJiNupMfnmXM50TXm8f6XF8g2bco=;
  b=Cpk6uq2I0gfsceOcnrGBhGiWyqbesmZ6sOC7dvpAXV526e0t2qZPdaGq
   SoE2n56vwgxdlaT2qyUZ4ABiML0AWTNFGN/Gj4ebQ8jkCGDxUnVI6asbJ
   hWTKHv8a2ioWU6eK9wov4QMQBjpiqjJU4XuF/tc4WOkdUs8vbjpfe5V9z
   mATWk6a7jHyNTQ7NtJp8ypoQcp/MUjbCg5xOm/TFsyvkdqtj4xFB2Df6R
   tsEJpPyUwamuj4qhYTwUCq7yqyMZgkHuCHteh/e/uMmwgq92YNUFSTD1T
   /Fhia/dgQ1Bm2kIE0mQJHLZ4KoW2L+DFt4eJuGt1O+jakLjSxa8nlajOW
   g==;
X-CSE-ConnectionGUID: wjlLtQUvT/KVgJkgY4kHhA==
X-CSE-MsgGUID: eTC3zb1HRdy4pY84MPb8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="78231121"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="78231121"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 02:12:06 -0700
X-CSE-ConnectionGUID: cMEh2XEBS7GWlUpFOY/HOQ==
X-CSE-MsgGUID: WEV2qGzjR2mXqFY3PX7Fgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="176251167"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2025 02:12:05 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0caY-0001VJ-2s;
	Mon, 22 Sep 2025 09:12:02 +0000
Date: Mon, 22 Sep 2025 17:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 10500/11136]
 drivers/pmdomain/rockchip/pm-domains.c:675:16: error: call to undeclared
 function 'devm_of_regulator_get'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202509221729.IKs3MPvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mikko,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: aff3de3b9a597763bec5d1c56c11b56fb2613085 [10500/11136] arm64: select ROCKCHIP_PM_DOMAINS with ARCH_ROCKCHIP
config: arm64-randconfig-r122-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221729.IKs3MPvQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project efd96afedf2c0f6f2cc34cf5a9a7e3e78f592255)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221729.IKs3MPvQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221729.IKs3MPvQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      37 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
>> drivers/pmdomain/rockchip/pm-domains.c:675:16: error: call to undeclared function 'devm_of_regulator_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     675 |                 pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
         |                              ^
   drivers/pmdomain/rockchip/pm-domains.c:675:16: note: did you mean 'devm_regulator_get'?
   include/linux/regulator/consumer.h:309:1: note: 'devm_regulator_get' declared here
     309 | devm_regulator_get(struct device *dev, const char *id)
         | ^
>> drivers/pmdomain/rockchip/pm-domains.c:675:14: error: incompatible integer to pointer conversion assigning to 'struct regulator *' from 'int' [-Wint-conversion]
     675 |                 pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
         |                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ROCKCHIP_PM_DOMAINS
   Depends on [n]: (ARCH_ROCKCHIP [=y] || COMPILE_TEST [=y]) && PM [=y] && HAVE_ARM_SMCCC_DISCOVERY [=y] && REGULATOR [=n]
   Selected by [y]:
   - ARCH_ROCKCHIP [=y]


vim +/devm_of_regulator_get +675 drivers/pmdomain/rockchip/pm-domains.c

db6df2e3fc1626 Sebastian Reichel 2025-02-20  666  
db6df2e3fc1626 Sebastian Reichel 2025-02-20  667  static int rockchip_pd_regulator_enable(struct rockchip_pm_domain *pd)
db6df2e3fc1626 Sebastian Reichel 2025-02-20  668  {
db6df2e3fc1626 Sebastian Reichel 2025-02-20  669  	struct rockchip_pmu *pmu = pd->pmu;
db6df2e3fc1626 Sebastian Reichel 2025-02-20  670  
db6df2e3fc1626 Sebastian Reichel 2025-02-20  671  	if (!pd->info->need_regulator)
db6df2e3fc1626 Sebastian Reichel 2025-02-20  672  		return 0;
db6df2e3fc1626 Sebastian Reichel 2025-02-20  673  
db6df2e3fc1626 Sebastian Reichel 2025-02-20  674  	if (IS_ERR_OR_NULL(pd->supply)) {
db6df2e3fc1626 Sebastian Reichel 2025-02-20 @675  		pd->supply = devm_of_regulator_get(pmu->dev, pd->node, "domain");
db6df2e3fc1626 Sebastian Reichel 2025-02-20  676  
db6df2e3fc1626 Sebastian Reichel 2025-02-20  677  		if (IS_ERR(pd->supply))
db6df2e3fc1626 Sebastian Reichel 2025-02-20  678  			return PTR_ERR(pd->supply);
db6df2e3fc1626 Sebastian Reichel 2025-02-20  679  	}
db6df2e3fc1626 Sebastian Reichel 2025-02-20  680  
db6df2e3fc1626 Sebastian Reichel 2025-02-20  681  	return regulator_enable(pd->supply);
db6df2e3fc1626 Sebastian Reichel 2025-02-20  682  }
db6df2e3fc1626 Sebastian Reichel 2025-02-20  683  

:::::: The code at line 675 was first introduced by commit
:::::: db6df2e3fc16263e319a0869fc0334c9c2290ddb pmdomain: rockchip: add regulator support

:::::: TO: Sebastian Reichel <sebastian.reichel@collabora.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
