Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528CF39448F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 21:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582564; cv=none; b=n/XEaXP1JkVMXbE1MPXyPGKyQNa7V9fQRKJK9+D2zXvmHZNnO717aCLEZHr7Y4QmSbrUn6pWFqM9OATiMiyjn63VvB7GCeGv8jvLQqEDcMgZTarknxgpMrl82AFAg/X7J+oEjKpef7C1Vg3/NxvDaTxN+EmtyhaTrvP5WkAyZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582564; c=relaxed/simple;
	bh=XZAcBFbViXgsWhey0VBOu4CftvukWc8uxBHsNeS1Z+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H+rA+aZdu9wDEhBKHPuDUt3zGoGfUzOVd1SXIBR96O4tyqzHbA0yHkBmEjyO+SQ9GCCTloha7SAUUkfF4NKWPwK9n92/Y3n/0EvrbrVxrG3gfFZYcu3jqe8lebAlfO1LoqI3ZHTpw4WJ2vooQtAklufs/gq9f9cxueKwxH1YmRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euiHjnsT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euiHjnsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791582562; x=1823118562;
  h=date:from:to:cc:subject:message-id;
  bh=XZAcBFbViXgsWhey0VBOu4CftvukWc8uxBHsNeS1Z+E=;
  b=euiHjnsTV9kJflQgTDS+0qVW2AUBjqGXOWUmYfIC1YXlzlGp1wkq+09C
   OkKY2HtIL2MLtIn8W1rQAnEgT1iC2QFTOOABEt7JIu+Fj1bDHbP7QAUWe
   FGeJOBnsNk2XP8d/vAIZGW457hq5AT4sTbo4a0EQVBj15hIV36TMtuI3s
   D+xqDRH3Ust5BJk1CThtXhfeOtXV33a/kaMLUOH1Y3qf7dAA83WGuCQ+I
   YC22103xDYDf/Ua5gnTd/bu2+RCjr3aSYb0B7mzq4FK75tJUMp7zYypPP
   anEIylP8K5gZJ4pFZhvcrK3I2l1ZnYfTxpUkqd4/2j7eGPSmzeCFrzPCP
   Q==;
X-CSE-ConnectionGUID: cZI2uhyzSGez7VkMJj+9Kw==
X-CSE-MsgGUID: tpYaq1ZMRrSuSLCODzXEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="281075"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="281075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 14:49:21 -0700
X-CSE-ConnectionGUID: DAQrKbgYRDuqhyFWQGP9Aw==
X-CSE-MsgGUID: qNHxM2T6Tceqzl3Y3VIFKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="333373"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Oct 2026 14:49:21 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFISs-000000007KJ-0UT0;
	Fri, 09 Oct 2026 21:49:18 +0000
Date: Fri, 09 Oct 2026 23:48:22 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 13/13] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
Message-ID: <202610092315.INpAGFPM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [13/13] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20261009/202610092315.INpAGFPM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261009/202610092315.INpAGFPM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610092315.INpAGFPM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_DMIC
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_AMD_RENOIR_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_RENOIR [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
