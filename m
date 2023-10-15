Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2FEBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHtCY5mG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697359307; x=1728895307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6Mg5C2niOFfQPw8gH4/15raxcirQyRs52npAdWTPPM=;
  b=DHtCY5mGK+zHTVh5Tyq2acRY9PTGbQjlZvWzdACtaK3hwQhIrZgWwM5T
   l4ON5tHY0ayRzbQSIPLU7XoKQTSkfdZCQD+I4/Opjl101o8h+MmAPzRbQ
   Jw53GtHFH2OdO1xeCswWkpUtEsDORrbNlILaSU+a0XVNrgSqqlV3nXYub
   LA0oJHrj7XclkyhgGl8A97FXI6vlKUeoM4VJnrdMGjFDb3IlqyVZMg9hT
   qN7Py8v1n5thtWKT8v9FVO5P6A9mN/5ia8Dtvb3yzKC3dWq5QwrKC5M5L
   xoHC7MZ5HA5YVzTDD35d1waE4rOAA672XXs1UlXt8PFvE6qcgFr9P3edF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6939649"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6939649"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="821204489"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="821204489"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Oct 2023 01:41:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrwgu-0007FP-21;
	Sun, 15 Oct 2023 08:41:40 +0000
Date: Sun, 15 Oct 2023 16:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 7063/29071] htmldocs:
 Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interpreted
 text or phrase reference start-string without end-string.
Message-ID: <202310151604.Ltj8ix3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Minchan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   99d2841c81a763168b0a0bda36c03a032058038c
commit: a5903592595d8bed46236c5cf3c3786d8237dcd5 [7063/29071] FROMLIST: mm: cma: support sysfs
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151604.Ltj8ix3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151604.Ltj8ix3e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interpreted text or phrase reference start-string without end-string.

vim +2 Documentation/ABI/testing/sysfs-kernel-mm-cma

   > 2	Date:		Feb 2021
     3	Contact:	Minchan Kim <minchan@kernel.org>
     4	Description:
     5			/sys/kernel/mm/cma/ contains a subdirectory for each CMA
     6			heap name (also sometimes called CMA areas).
     7	
     8			Each CMA heap subdirectory (that is, each
     9			/sys/kernel/mm/cma/<cma-heap-name> directory) contains the
    10			following items:
    11	
    12				alloc_pages_success
    13				alloc_pages_fail
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
