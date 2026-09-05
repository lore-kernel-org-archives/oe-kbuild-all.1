Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406A320CD1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621719; cv=none; b=rlSwGPIOMtzQmk7CBD5oukZFRDbRHFzvB/ggeSfvfwAFI3btXSLQzsm9yu4C6gFoc1/y2g86lWbMZUYAGtRDVGp3Qna0+Rm90gfiuc7HJylm9adz1VrZgH/eSwkp+25tQgYWQcvIxt17ov3LcS3W3Hi03Q38gy6Y8DAfAwoZ8Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621719; c=relaxed/simple;
	bh=9e7Ky9ZjejduMAbnwjp+nFhC07W5KG53gLqhIs8zT50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LZoqSwLd8t0j9Km97+1OZ+btEZ/Q8qG0ZFOtBrP5WrKtB/jrMrC1+PzIvvXLcS1U9nHdUuH3B+m471hKasBgp1epMxaLvKeJ25sA5AGsMe+gXHMqYk7GPjNTmu5E/92L6Y3MMO6wPrKMa6gowKAMBobQmluphXd1YYvKVrvneTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQo0kLkP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQo0kLkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788621717; x=1820157717;
  h=date:from:to:cc:subject:message-id;
  bh=9e7Ky9ZjejduMAbnwjp+nFhC07W5KG53gLqhIs8zT50=;
  b=JQo0kLkP+svw9WEccYNB+zz0iNxRZKidIFc8QEcKSMx7NK9nvErG9A1t
   mObwnzs1Gar5vGo3miAZm/uXgSdXtogWK7sjrv82rpXfLzTLR2Ktk5Ey9
   2ZvlQieUqI6LQGZH8pwyk52EXUjF80IFUw+hFqi3oi8n+d56/yPuufeTO
   TK+Z8DYHexro1kcW5vWha6asZioe0901TQwke4yXOTuJiJqOrSvT626J1
   2V4Po+dvlteEgaVi4JZlSocIk9hA2oLaDMQEpn/PU36ET2t0u5MiYa4tW
   MFgGqKT99YkHic0SflEgTaEfIl00JmM3aDZtYgCU7M2HHc7K8sxxe0Z8o
   g==;
X-CSE-ConnectionGUID: WeM/bWadTuOam+2qVQ3GUQ==
X-CSE-MsgGUID: S5eHndeLRlSVveFpQkFl3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="106464608"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="106464608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 08:21:57 -0700
X-CSE-ConnectionGUID: 5L6tBQWqSFSkVltd5gXGOQ==
X-CSE-MsgGUID: J/9rGpRBT8KT7L4sQprACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="274121319"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Sep 2026 08:21:56 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2sDJ-000000000eR-2k7F;
	Sat, 05 Sep 2026 15:21:53 +0000
Date: Sat, 05 Sep 2026 23:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol
 'regu_irqs' was not declared. Should it be static?
Message-ID: <202609052342.1u7GNrMC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 162e23657e5379f07c6404dbfbf4367cb438ea7d [1/1] regulator: pf0900: Add PMIC PF0900 support
config: x86_64-randconfig-r123-20260904 (https://download.01.org/0day-ci/archive/20260905/202609052342.1u7GNrMC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609052342.1u7GNrMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 162e23657e53 ("regulator: pf0900: Add PMIC PF0900 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609052342.1u7GNrMC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol 'regu_irqs' was not declared. Should it be static?

vim +/regu_irqs +774 drivers/regulator/pf0900-regulator.c

   773	
 > 774	struct pf0900_regulator_irq regu_irqs[] = {
   775		PF0900_REGU_IRQ(PF0900_REG_SW_ILIM_INT, PF0900_SW, REGULATOR_ERROR_OVER_CURRENT_WARN),
   776		PF0900_REGU_IRQ(PF0900_REG_LDO_ILIM_INT, PF0900_LDO, REGULATOR_ERROR_OVER_CURRENT_WARN),
   777		PF0900_REGU_IRQ(PF0900_REG_SW_UV_INT, PF0900_SW, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   778		PF0900_REGU_IRQ(PF0900_REG_LDO_UV_INT, PF0900_LDO, REGULATOR_ERROR_UNDER_VOLTAGE_WARN),
   779		PF0900_REGU_IRQ(PF0900_REG_SW_OV_INT, PF0900_SW, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   780		PF0900_REGU_IRQ(PF0900_REG_LDO_OV_INT, PF0900_LDO, REGULATOR_ERROR_OVER_VOLTAGE_WARN),
   781	};
   782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
