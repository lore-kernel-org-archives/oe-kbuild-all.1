Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2322F392829
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Sep 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788727907; cv=none; b=UOL4bsGgh03xIKxSCJMPfvx5NNdMeUxF6taF9PrgKDZzFgfTpkZT0KYrc3Pa4u9UPEIK2yp5S/ZPWJzcEW1XJRebgbTGmFmVniC06at1gDo9QzAHkPq5P4p0nG+R4hshcnNafi4K/ecS1/4ykZQOSdm6mZjffuZmGEiDGdMYph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788727907; c=relaxed/simple;
	bh=esWtjvhWYNEB6ta4Lksaz0tj004EQM+kGMHO6PeUvYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t5ILgXQan856j5uJTHsjhKhm5bcNwN4W1zaHsesEV8idYqe7EA4nacSJx+gPURrjTLAPPQVTdtc8pWBOiivdiox41p1atcyG96A2UFZFofKs/XTM1uynIj3TUQZxwO1ny0kL1hw8yfwlIfCSY9ZRjrmJ11JtwW5KiwNdoADolAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JozobQU1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JozobQU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788727905; x=1820263905;
  h=date:from:to:cc:subject:message-id;
  bh=esWtjvhWYNEB6ta4Lksaz0tj004EQM+kGMHO6PeUvYo=;
  b=JozobQU1X/8cy8JnpyQMlLxyrHp1w62p5t+PFT1SJhBRwTLXPEjMRuCG
   4V5ef7mEpuwqcyDYhBzYlxq8r6GupcX9Xhq1oa8XJL5UAioOd1JftZZMj
   PcRVdg3LgFQT0zKS3d3cG8mdY3Es/QliLZYwwb7P1X3JLvDeQwmHwVcLV
   X8C0/mzMjctqRZlBuAtZYtghZzYTu7WuTbe1qF7LoNy8Y+jtpTFiBlHLd
   IZX/91byRtLqkpsblVdGyjKJSWBm0dZ05jpJcvM5anhWZujBpHqsq/Orz
   nJTL9mcr3xP/Iwo/fRUtFBadaU1p9jWMDkMACHgyYjuXV2tzRdxGWfM1G
   Q==;
X-CSE-ConnectionGUID: tkdC9ivHShScBXdDGSjK9Q==
X-CSE-MsgGUID: CszcYKasSd+ujkGHkWAhAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="92838242"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="92838242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2026 13:51:45 -0700
X-CSE-ConnectionGUID: U+LJ6CvnQdya/jch34SILg==
X-CSE-MsgGUID: SSmPwJN1TXmUA3nX3NLpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; 
   d="scan'208";a="268802645"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2026 13:51:44 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3Jq1-000000002Vv-263O;
	Sun, 06 Sep 2026 20:51:41 +0000
Date: Mon, 07 Sep 2026 04:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 drivers/regulator/pf0900-regulator.c:774:29: sparse: sparse: symbol
 'regu_irqs' was not declared. Should it be static?
Message-ID: <202609070427.pqhlRJzu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 162e23657e5379f07c6404dbfbf4367cb438ea7d [1/1] regulator: pf0900: Add PMIC PF0900 support
config: x86_64-randconfig-r123-20260904 (https://download.01.org/0day-ci/archive/20260907/202609070427.pqhlRJzu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609070427.pqhlRJzu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 162e23657e53 ("regulator: pf0900: Add PMIC PF0900 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609070427.pqhlRJzu-lkp@intel.com/

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
