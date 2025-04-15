Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4717220A5C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Apr 2025 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684964; cv=none; b=ApBdJOoVwwsidHI3Pvls2knENePYCfymZBRiQMuBT6LUfQgu3GsAorNEfKRW7kYUo41WdLc5Nyx87osKHoQWCfMv3e+JnP8HV+sLkKxjEsaOfGQRuyCNyLdr9KhQ5HfyMK4qWhbMsDrLcOvWuxnbedbWfYYAhZcYc62GhaN1K+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684964; c=relaxed/simple;
	bh=pLvHqrpj812+uUWWC64fPJKzNLiwNbdKUwEvFSG4X+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMOKJ1MkpfQA4XTPotQIfzatv4+NJ/Ge8Ml3wpIVZc+agvTKpKQh7kuyp+NPSCxOFv6i86HKKt9IuLlLqK8+BMbLm1oyzP8lamtY8cMzhTfucPg/BrZxv6cVfoHWZ/eX3JNIcxZM6/xHRxv04dewOTIWNDFjieGTFJqdlTk+68U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLH+bcMg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLH+bcMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744684963; x=1776220963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLvHqrpj812+uUWWC64fPJKzNLiwNbdKUwEvFSG4X+s=;
  b=cLH+bcMg4uLOZrZIBWN+ch7yLfm+s67lBS1bIKW23qIWU/l8T/SwZQ09
   DZWwDFhjS0KpQJaCBCVJuU8lF3Vc0sb2hdhbm9+FA7plldUJSn4xQ2qDU
   797Z/KvPIoVbt7DfLg65CqzcYMB5H18QpCrGl5tUJl3M+GemM5MlWh2Cz
   udf+6G/EMLQp2EaQipyaJ17T+YuRnkDKzn3BAdbtRSMTQwBBoZhZQZggL
   8dWiHWV3+1xYAcgaRuJaMBzT2dMq/K85HsjQFk1TYfQmg5+SwRx+dz7Bx
   6fJp8m4pSqQS1ujVEqna/YCuSYLjy67L46JcbffzaPZrSj3t0g2MXayBu
   g==;
X-CSE-ConnectionGUID: Lx9ozi0yRd2YtV1XxEFLhw==
X-CSE-MsgGUID: k0Zd5v66TCyPAc2xBQFa2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46184743"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46184743"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 19:42:42 -0700
X-CSE-ConnectionGUID: ibXlMTpNTTK9S9AH8LqCfw==
X-CSE-MsgGUID: vuC/jieVTkKepNJkaLW0rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130860301"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2025 19:42:40 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4WFy-000F6n-2Z;
	Tue, 15 Apr 2025 02:42:38 +0000
Date: Tue, 15 Apr 2025 10:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] ERROR: modpost:
 "of_regulator_bulk_get_all" [drivers/pci/pwrctrl/pci-pwrctl-slot.ko]
 undefined!
Message-ID: <202504151021.VCzPa8Fr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c1627b3b5ce8ef12a045149c319242f79b835426
commit: c61d3053974a917407ce02ff923505d45dd5b5bd [0/3] UPSTREAM: PCI/pwrctrl: Add pwrctrl driver for PCI slots
config: x86_64-buildonly-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504151021.VCzPa8Fr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504151021.VCzPa8Fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151021.VCzPa8Fr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "of_regulator_bulk_get_all" [drivers/pci/pwrctrl/pci-pwrctl-slot.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
