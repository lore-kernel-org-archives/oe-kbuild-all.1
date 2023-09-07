Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25915EA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 04:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694060402; x=1725596402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nxqN112zYzbmOtiHskLw8CVCat6EKMp0tifAwYDthik=;
  b=DsIHvNDGlim0nipr99ow65ve9d3heSyfpBeEISuj+YjMwYZmn9LGeSql
   aKDqlg2d05dsh0lKLRXXnD8z4OebKlKe2pFVwdt480YG2oakuXL4j2+Il
   d5BxrdutAcVg4cJB0w2EbeJhXBs7feGrNuOcR4Ugl8XGTgbZEFW4+arrP
   K3QLAtZyNqIKydREqdgjZGivUBVtGeVvk1sdjZj3iRSqK6Qfx8gAeOzVr
   2tBv9O7rvZGL/YUSLYK4L72Je5X8Qqo6N7joav1hsEzo2I/MATJV6zpcK
   oF2YOFmXUF1kyJN1GCu3Ha0Af9hEI2VZHLGqWUFxYBWVcv6g20AOZPkuS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="381041333"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="381041333"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 21:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741850324"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="741850324"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Sep 2023 21:19:44 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe6UX-0000rr-1s;
	Thu, 07 Sep 2023 04:19:41 +0000
Date: Thu, 7 Sep 2023 12:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:pks-core-2023-09-04 24/34] htmldocs:
 ./arch/x86/include/asm/pks.h:1: warning: 'pks_available' not found
Message-ID: <202309071259.lqsjm5AT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git pks-core-2023-09-04
head:   f3805d41ebb5e9da27bb5b1569757eaa542cb2d9
commit: 02f1931b1c142d1a9024e6497ece44a9e6ca7278 [24/34] mm/pkeys: Add pks_available()
reproduce: (https://download.01.org/0day-ci/archive/20230907/202309071259.lqsjm5AT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071259.lqsjm5AT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./arch/x86/include/asm/pks.h:1: warning: 'pks_available' not found

vim +/pks_available +1 ./arch/x86/include/asm/pks.h

aa94cdf38aaa35 Ira Weiny 2021-12-08 @1  /* SPDX-License-Identifier: GPL-2.0 */
aa94cdf38aaa35 Ira Weiny 2021-12-08  2  #ifndef _ASM_X86_PKS_H
aa94cdf38aaa35 Ira Weiny 2021-12-08  3  #define _ASM_X86_PKS_H
aa94cdf38aaa35 Ira Weiny 2021-12-08  4  

:::::: The code at line 1 was first introduced by commit
:::::: aa94cdf38aaa35b1b9c7ac4b3ba100dc3bd9dfe4 x86/pkeys: Enable PKS on cpus which support it

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Ira Weiny <ira.weiny@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
