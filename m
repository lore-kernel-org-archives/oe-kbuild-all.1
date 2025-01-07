Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2513C914
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736261936; cv=none; b=GQ5njTEQMhgBxgToKT/uc/e6JmxpZ1qSSfj41PgSFDpZELgjoR1DDjYQxQO3l/76/8IJkowu8qcpcqd8RCC/rzAfYYX3FCjaJBdF9eEaKe+LOn9HHyEBrH/iyY/EzV4PeidVaQ1ddPJlBZztN+XtwNT4+vZqgMx8l7dXmryQ3iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736261936; c=relaxed/simple;
	bh=9nwOcyHXvtE65qvsD3PuHDq9fcFA8ZLW2xs+8b3oWqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYkbSkUu62YQRSPSb/pdK52HEuD6IjOLwjwJnhJP+qoj5wK1iUsKt9SXb94175U5d8SxAuUL63CZa01m+2x6INj7lKW8VawPfRr3D97cJrfQKBzzETA1IqsiFrOHF/X6CXCI+ILnsl9jSX2Aq5Fvz8Eq9JSOua33W2R9WDRZYJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awQ61BzQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awQ61BzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736261932; x=1767797932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nwOcyHXvtE65qvsD3PuHDq9fcFA8ZLW2xs+8b3oWqI=;
  b=awQ61BzQ33jLrB7UCa9jzfemsRTPs1TKbOTJJrOT05qgurIPhHhOEiFj
   6Uj/uOSj5Jln/nVe6zaNc4zrNMfvN3Ogv8V/nYWz12sP89oDHtEZRTFR1
   MYAXcCZuovaBWmwPb1YasQ3J/lgXB9WIaS64piv07Tf8JKs+HTNTMteQW
   /4MfMgBCZtPoh9ZTDDGCjBFDmj/ET9gTDkLvzKyowGSoaOr90WMa0RoEl
   WmhYrTVq8H+YqQIWdAhK+ykdZoTkenjSvIKeOa4WQgerUIO6qbO8ewu4+
   Vqh8PxWvWFN9NO9Ni2r3ZJkrzT/Dr5nnGj64gXdCIEJ/BG9Z9SuCkwkFx
   A==;
X-CSE-ConnectionGUID: H7zMdjnEROuug5xaRkgisw==
X-CSE-MsgGUID: tKE1KsbuTu2fa0W+ZGQAUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="53986224"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="53986224"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:58:52 -0800
X-CSE-ConnectionGUID: HRBMBh9kSdOGO4EOTi4KGA==
X-CSE-MsgGUID: aBHVuWz2Q5CFAGoim2Lv3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="133643641"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Jan 2025 06:58:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVB2e-000ErN-0O;
	Tue, 07 Jan 2025 14:58:48 +0000
Date: Tue, 7 Jan 2025 22:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 18062/25291] mm/damon/vaddr.c:
 linux/sched/mm.h is included more than once.
Message-ID: <202501072209.kfZIhRmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 77c2d4931d57f00759fdb5ad856e4f29d6f6dd3c [18062/25291] treewide: Add missing includes masked by cgroup -> bpf dependency
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072209.kfZIhRmr-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/damon/vaddr.c: linux/sched/mm.h is included more than once.

vim +17 mm/damon/vaddr.c

     9	
    10	#include <linux/damon.h>
    11	#include <linux/hugetlb.h>
    12	#include <linux/mm.h>
    13	#include <linux/mmu_notifier.h>
    14	#include <linux/highmem.h>
    15	#include <linux/page_idle.h>
    16	#include <linux/pagewalk.h>
  > 17	#include <linux/sched/mm.h>
    18	#include <linux/random.h>
  > 19	#include <linux/sched/mm.h>
    20	#include <linux/slab.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
