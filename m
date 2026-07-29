Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E441939795F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335983; cv=none; b=NEXa2ovmg9Fz3Bc9PYGiK+2dcO+dgjFr7fxbXOzCMJDhjpOwFQUc8zKbdWhRuhd4ZV/EF2wqWZcyc9m73LwFEvd6rzCpo8DbZmZtUhSegZ6NEt4puS1EaEx61t+41GJ4bnXPcdDPDvJek2q22ijrK30HW8EIu5ta7DR4ihc3FmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335983; c=relaxed/simple;
	bh=IJVvIHPbqRe2a4pQBN9unfZxMe9n7GbZnZOWCqM9M3E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NALNp/pPraxYpILJFR2ytonU1PC8TuLzijneIkJiEB9GXy0lb06+60L6uQvHma3PiPnfmCsT4VCwKZlLPkUsBeOOh8yA8TdXumY+OnBjQAWJw33ngIE/Kz9CRkxZ5M4lPUCXSivKjVZ5gVMtCVGxoRmwniO7donzexgNXRLQHmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9WnoTL6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9WnoTL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785335982; x=1816871982;
  h=date:from:to:cc:subject:message-id;
  bh=IJVvIHPbqRe2a4pQBN9unfZxMe9n7GbZnZOWCqM9M3E=;
  b=Z9WnoTL63/JVPXJGuilGiSsfRj/L36l7SLIyuYgKaBchnwFSnxGHCExy
   fwY1J+atnIT9aF+dTd0egTbkVQc71C+O3S5X9oV1UjImtSKJb8vMZe3HE
   veyIndnrNeUNtewIfpMTTTkk11lFk0g7Y+ST9m5aMGFRcigvLcyn89wtp
   yXXFRev2zlkwc/qJ7pBod0/A/NFNsa6TH8FgOrrAmJav61cRR+z/mdscQ
   Rzy+tJe2RNb9hFrLFnBz2QZhzO+vwiWtLJUPIWvylgj8F1RnXe1gGM7l0
   sX4iuRfijoYk1mQyQPwcYmiMvTjaWXiZfE3q6mitOrT0AFxn7IUmcA5Sc
   w==;
X-CSE-ConnectionGUID: GgiggaQPQKS4xj/+iyqcoA==
X-CSE-MsgGUID: m+70jkWzSgqtFY7tLazKtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97455516"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="97455516"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 07:39:41 -0700
X-CSE-ConnectionGUID: YcjT1BkqRPmzC0SJH0mA4A==
X-CSE-MsgGUID: 9Jx+FkPjSRmRU0t3QTpV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="263525478"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2026 07:39:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp5RZ-000000002Ag-1ngo;
	Wed, 29 Jul 2026 14:39:37 +0000
Date: Wed, 29 Jul 2026 16:39:08 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 344/700] kismet: WARNING: unmet
 direct dependencies detected for GENERIC_PINCONF when selected by MSC313E_SAR
Message-ID: <202607291626.duoK0PVi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 88c3adc69c81ffc51dcc5902ec2f4b50e72ce948 [344/700] iio: adc: Add driver for mstar SAR
config: alpha-kismet-CONFIG_GENERIC_PINCONF-CONFIG_MSC313E_SAR-0-0 (https://download.01.org/0day-ci/archive/20260729/202607291626.duoK0PVi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607291626.duoK0PVi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291626.duoK0PVi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCONF when selected by MSC313E_SAR
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
