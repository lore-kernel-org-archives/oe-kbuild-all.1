Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4E2FE0D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkJ6/+fF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697725876; x=1729261876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FqcTlusm2KYAcY0LUONyhO2t0qjUhzhIZ4dEkvAofrM=;
  b=WkJ6/+fFGz1T1XPL2JYbb5BY5tweWGufoI4BBqTdhhK4IDp6Oa8Ljk8H
   aOfXQIuIghLx9IXnojP/kgZWrA3i7Y6xkSLnWN7vmQtMm8VTenElNUfxJ
   mnt7Gb+FM3n+Lp3y/6anVEo12q9lQC2mThxvtJ6JFoQ1E/1vXNkI5UmX4
   cposj7BmB25zNV9yPC+Cs2hgshvC9AehD3CUzQfjJGg+Ej+04PfBpsuyB
   CCufpXQbheuUdhkrxRnouWYQei5FNgnG1NdC5FC9ozkLckmOGjrketyZ1
   vbSHtA4UTggweDWEbyHDuGCx9Mvx9LLaXeFFS5TcmqWsum+Qd7LMnwZ+p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417382009"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="417382009"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 07:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4769034"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2023 07:30:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtU3K-0002B6-24;
	Thu, 19 Oct 2023 14:31:10 +0000
Date: Thu, 19 Oct 2023 22:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.7/io_uring 7/15] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310192207.aorAN7Xn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.7/io_uring
head:   6ce4a93dbb5bd93bc2bdf14da63f9360a4dcd6a1
commit: 2e521a2064bf8b26cf178c0f7644a70ed1a512fa [7/15] exit: add internal include file with helpers
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310192207.aorAN7Xn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192207.aorAN7Xn-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#97: FILE: kernel/exit.h:1:
+// SPDX-License-Identifier: GPL-2.0-only

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
