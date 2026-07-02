Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CB9281525
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956058; cv=none; b=cye2sRbEFe974VOOQtw4qlikWCf6VqDy7wJE8vRCbGvG899Ko3bhj0TxBXe4pL58I5qkKCIsrTC8zkCqODsf0eI2FuLHPgGcHG5Sq20fQ+iilqmIO8/1VB5tv3GM+kjEZ0sBigUoKL3lUf2Z3ay13vBi1FiBkAK8hj1l6+n+XJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956058; c=relaxed/simple;
	bh=L1RFnmG/ScgmE3UBeke7Ta0iS/WTAwJy1mud40mOXdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FPVMNzP+rnB0h4dPtO+ONnsNCaGfpCpJh8CYqSpm/ZjWF4ETO6FtBZ5KgpkxkjEGP6g/Xg4Av5uosApFKB3Fxv9WCwQjp2s5i5r/YIi7iBQ+49YAPOVOSnFGEBttLXunyGT9SFj+hiUFGHQoI/ziMKxpSJG3PQQNZvM9YuINEbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2xDmCSc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2xDmCSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782956057; x=1814492057;
  h=date:from:to:cc:subject:message-id;
  bh=L1RFnmG/ScgmE3UBeke7Ta0iS/WTAwJy1mud40mOXdY=;
  b=S2xDmCScjG+Bgfvmij5G1JI+5hjatJFHrKzhzfrnI4sPquBen8HjMoev
   VjsEwyRjBUj0flbpNIYP+QN5PV1I6+HrO1dDbXQg1ku8cgYT287z2OiZe
   Gh0wdy9H12TB7nHAONS7OnAFpsSpH0bfOLb7i7NiAfyICSCEd8wjwBwgM
   nI5ZzGD3+dQ0tw9kXFz0efHEZi3E8zhAGnwo7t/VWtLIqZjSs/pfxw/V3
   1GhsOBmBDt4D3KGlpNo4JhjrxTEtFYkxcxcBhsqZTSzt/0UREjA2wNzU1
   pAuMYLQo7GiSlX5I4P5pC9wSCROhHTtzbDky6EsbeMSCOLm5d4GLjOHJ/
   Q==;
X-CSE-ConnectionGUID: CmQ3UxkTT/6ljRLRKG0cAg==
X-CSE-MsgGUID: sp+p+3GAROeEp5U8ex6gIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83729921"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83729921"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:34:14 -0700
X-CSE-ConnectionGUID: XkzmAfmhRCGgjtJnAmBCYw==
X-CSE-MsgGUID: oMgQE67vRdGQONcPJRUeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="254650197"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2026 18:34:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf6Jd-000000009pl-20Oa;
	Thu, 02 Jul 2026 01:34:09 +0000
Date: Thu, 02 Jul 2026 09:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 86/95]
 drivers/iio/adc/mt6323-auxadc.c:25:10: fatal error:
 dt-bindings/iio/adc/mediatek,mt6323-auxadc.h: No such file or directory
Message-ID: <202607020953.EPrGWOdn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   2bf164847e2e83599b4c2454e301a3aff92fddfc
commit: 022cc99d5d1cdc76b09b424a769c3cfea3812378 [86/95] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607020953.EPrGWOdn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020953.EPrGWOdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020953.EPrGWOdn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/mt6323-auxadc.c:25:10: fatal error: dt-bindings/iio/adc/mediatek,mt6323-auxadc.h: No such file or directory
      25 | #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +25 drivers/iio/adc/mt6323-auxadc.c

    24	
  > 25	#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
    26	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
