Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE3321AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 22:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGseBdVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697755956; x=1729291956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1jEfC83TMDmfMHrqv9S98gOn/TGYp+SsQyOCwUN9No=;
  b=jGseBdVjGz2VGtCNAjcGsck/yD30bpAgStZMJlZ/C1OvDKUvpt7wxQW4
   xX4IMvXc9oXfet7DunOeIu9+HFaNftio/+oa7Li8f2kf/Q6xh0xZkJv3k
   NOnlrUtsmLhcAuDoGffOm2bwd90QVGtdYKs8K+5maMX2x/0UtR3/gC8sm
   O1ovKbBqlDg35XE6BY3vqfOkSR36jCJVV0sGO8icRKlTf/7Yrc3mv1iIE
   FSZgCHMrmHGuOk6GPWFF3glkPO4Wjp4ffa2uQ7TIwrj5mCk5RgzqaxVhF
   qlXxc0aE1jOBvLcevDijQ1d7iAMcTSvaLkwUv1WRlhq12OcjVjALYQG44
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7947149"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="7947149"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 15:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="880873133"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="880873133"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Oct 2023 15:52:34 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtbsV-0002gc-31;
	Thu, 19 Oct 2023 22:52:31 +0000
Date: Fri, 20 Oct 2023 06:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 3675/15767]
 drivers/mfd/max17135-core.c:35:10: fatal error: asm/mach-types.h: No such
 file or directory
Message-ID: <202310200658.xNsGT5uR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 7ac5bea860d8a9ca05c341d4600142fa8b55eb11 [3675/15767] MLK-11556-1 pmic: max17135: add hwmon, mfd and regulator drivers for this pmic
config: x86_64-randconfig-161-20231020 (https://download.01.org/0day-ci/archive/20231020/202310200658.xNsGT5uR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200658.xNsGT5uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200658.xNsGT5uR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/max17135-core.c:35:10: fatal error: asm/mach-types.h: No such file or directory
      35 | #include <asm/mach-types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +35 drivers/mfd/max17135-core.c

  > 35	#include <asm/mach-types.h>
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
