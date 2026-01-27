Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47336EA84
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542797; cv=none; b=D7+wurLDMxYgIac8s7itaYImQt72kwfvmV8ldiyYa+392xDsh4Wzs0wHecPoqsgTJwjPsKyoEg3qO9X3D9KMC/1qJlpJsQTR7Yea/XxTPO6BcsBf4wmmK1ZqsAy7pCtTjJRMxuYJjDska46du/0tgzr02/l/wjhW09bNEsnodnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542797; c=relaxed/simple;
	bh=6bkg1mrU6FHYMdClssW2rDJDHEc707zMzCU9SFJ5P3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=seD+pvJkWFvNJ6n5f/2UbzRaBbx6Ib1GghZ0MZkskVAK7Fo8z5Ddd/tv+SI1NmBQ9YVrPDl13Gj2R5Cp4kJ8HrfBJx6QJdsWbBb2M7v52jh3fovM99hlRry8/E8xacuc3vnnf65vW8JBuGWA1sQ0DemqGGTAgmWntCg0vQVvmps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5GFgVPs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5GFgVPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769542795; x=1801078795;
  h=date:from:to:cc:subject:message-id;
  bh=6bkg1mrU6FHYMdClssW2rDJDHEc707zMzCU9SFJ5P3Y=;
  b=a5GFgVPsyuvSIshUZHAPHMlf5yGZG7Z4/7BezACJ5hyvzRCytu2vYaK/
   WbTKjVVv6SY10zReb6KV5qGNaW8T9nB+TDLtX8wF7m6IlV0PGOnv3EL1U
   vYxmIuFXVt4rQGBguAke+lBAMPvwg3UVIj+HM0kLdtgi+1ADXaHeEzfRF
   1h0mamYKMw5hCEhKvmIFEPJF5x1exYszYahaYzVZaDXNUesOosCPnzr5Q
   G+oMtuiuCwwZUUzFjTKfvPjmUgXITeerfx9mO1+jWKNsk6EqA/jUDcm+c
   zAUt5aKvaICB8cYDk9qfl1aa17lFBbNH7K//4wu5DVMR9NYa/akQj7Q5J
   w==;
X-CSE-ConnectionGUID: tfVlRg12SciHSzqXGb4y2A==
X-CSE-MsgGUID: BX9iiY+DTDivE2FiVnVdfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82178266"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="82178266"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 11:39:54 -0800
X-CSE-ConnectionGUID: prkqp5cQSpO0jAg/HB4Mdg==
X-CSE-MsgGUID: m9cLc4sjT9C0XHbZfE0JDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212918375"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2026 11:39:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkouk-00000000Ytc-0xED;
	Tue, 27 Jan 2026 19:39:50 +0000
Date: Wed, 28 Jan 2026 03:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 26/38]
 arch/hexagon/kernel/irq-hexagon-h2.c:61:19: sparse: sparse: symbol
 'hexagon_irq_domain' was not declared. Should it be static?
Message-ID: <202601280357.nhNdngPg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: c03d45c08b8a1046b1502fc07d0a7145fc2fb5b8 [26/38] hexagon: add memory management enhancements
config: hexagon-randconfig-r132-20260127 (https://download.01.org/0day-ci/archive/20260128/202601280357.nhNdngPg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280357.nhNdngPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280357.nhNdngPg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/irq-hexagon-h2.c: note: in included file (through arch/hexagon/include/asm/processor.h, arch/hexagon/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/irq-hexagon-h2.c:61:19: sparse: sparse: symbol 'hexagon_irq_domain' was not declared. Should it be static?

vim +/hexagon_irq_domain +61 arch/hexagon/kernel/irq-hexagon-h2.c

6061edff3d8ebe Richard Kuo 2025-08-26  59  
6061edff3d8ebe Richard Kuo 2025-08-26  60  /*  Warning:  irq domain ahead.  */
6061edff3d8ebe Richard Kuo 2025-08-26 @61  struct irq_domain *hexagon_irq_domain;
6061edff3d8ebe Richard Kuo 2025-08-26  62  

:::::: The code at line 61 was first introduced by commit
:::::: 6061edff3d8ebe38f05bbe7fb07b774fb0269edf hexagon: add H2 hypervisor interface support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
