Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87D324B31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162808; cv=none; b=ZW0nXIStoF8/sXF1qI6j75D97uNDQpCSZ0LICUUTd6OH5WBo8innZkWQzGyEj6iOCP4o+gLgAvy07EbFkU3I6f8cDz6SjBwtS29AtQRBiwzxQoNveGTTC4Pd5O86+Ovzghrs6VZd/7Qe62SEvRwygCQM7QvYeHc3EbjEm5c9AXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162808; c=relaxed/simple;
	bh=4R1l0IGsOLxFNv6a9IW/TA/45tr+ADiPnUi8JjDPPsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SufxbeKwRCk2bh/b4fW39OutgaLVUorQtdlirFaCguGZv89zRe8MT6cl3uKJLLqlNKUpRanzr4GF8ayzSkX3ycwphnKldw8+lHlMVpxqzck/XXuAf4uvymEVzDW4e7I2WXbDXCFjTgm5EYOTuBFDIlsfH6WruCQQIPKoyfDoshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hB0kftnW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hB0kftnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772162806; x=1803698806;
  h=date:from:to:cc:subject:message-id;
  bh=4R1l0IGsOLxFNv6a9IW/TA/45tr+ADiPnUi8JjDPPsA=;
  b=hB0kftnW/BacljBjQ2RHSoz1HqmqJklGzRJIRHti6thZOPrgESr0IyId
   LK+DzrilqycvUKyRMpyALLg/37A9FiRBlRFaeMnIEBxOKJvAQ6Y/4OyPy
   nzHuD+/pnzUg4JECN5Wx4xzhGrt1DC/ZkTghfyGDo1RultVJM5tMj1ELR
   1QWMG30P3Bdt244uuIRoVqCVUTgLPb/NBL/1CZwzbYGPv6Rc5yl8pwkmo
   /90L21i8rh7eoh7j6lPgy4Zlnbb7ZSTv4+9AaE1NyoyNesLgdMGRQxjjI
   s+HffAmmoxJhWmMizoLLj/RnuQtyoV8XOvbW1PmXFOhJFdN7xMOylA3X7
   w==;
X-CSE-ConnectionGUID: yk63hR3cTdaid0ffV8nubg==
X-CSE-MsgGUID: 0Iv96nM2QaGoZCqqeriwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84702728"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="84702728"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 19:26:46 -0800
X-CSE-ConnectionGUID: c+fJay9bSEKwrbmYQKzwSA==
X-CSE-MsgGUID: +YZXsb4qQlCB2Lz9cyYwcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214970642"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 19:26:44 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvoUU-00000000A9n-3jTs;
	Fri, 27 Feb 2026 03:26:19 +0000
Date: Fri, 27 Feb 2026 11:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sme-no-cpuidle 2/2]
 topology.c:(.text+0x240): multiple definition of `arch_cpu_idle_enter';
 arch/arm64/kernel/process.o:process.c:(.text+0x1c0): first defined here
Message-ID: <202602271129.hyAdTJSO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sme-no-cpuidle
head:   cb493e527146b1c3eae12bb35c71a165dc6491fd
commit: cb493e527146b1c3eae12bb35c71a165dc6491fd [2/2] arm64/fpsimd: Ensure we don't contend a SMCU from idling CPUs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602271129.hyAdTJSO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271129.hyAdTJSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271129.hyAdTJSO-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/kernel/topology.o: in function `arch_cpu_idle_enter':
>> topology.c:(.text+0x240): multiple definition of `arch_cpu_idle_enter'; arch/arm64/kernel/process.o:process.c:(.text+0x1c0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
