Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3003859EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772196425; cv=none; b=hXchoYnJPMJWgs6Oa8QuQb2elNQkfzrrm8s3ehpebHc8lfr5x6l18xz0eCm5Wx/bV/Wttv9FP8WjwS+OSnDwBQjwwTvq87Mrw08pf3sI8cyjixUTjtUDgxFxW44jhmCo71mvL/gYKIzXrQdcnplNlBtBEn/3/yF4sJQ4SejAz94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772196425; c=relaxed/simple;
	bh=0MotmN1FZpbZL+Z5YgOPVtpB+FbLKYYFvWhY290K38c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i6cg54dn1stRKuIMe+6Xxtc/r+3HeAkekRobDyahP5uq9zq8KVDHQn5hszVoUlEqbAUMLNnJ6jVlIz/ZmEYNkA/ZsFWiaxNhptb/QDgMWvYJEOWkHmOdwkbIeBa8MneKUq8JB4I1fOAlqRwDcoiYPfp0fRpIYRxh/7omSN/zIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt41M+5Z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt41M+5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772196423; x=1803732423;
  h=date:from:to:cc:subject:message-id;
  bh=0MotmN1FZpbZL+Z5YgOPVtpB+FbLKYYFvWhY290K38c=;
  b=jt41M+5ZBJ4p4Y7mZUObh/Xne1s3L5RWPM/0bdXY0tY/otXXcjRkxb+L
   ZkVw6f1iMXaGrlZSQ5WP3qgrSCwu2AjLsRngeYh6srv+QeDxBUjXtVhul
   7o4ORg7TuMaH5qsAcKeKcR6tzp95LLrk8vSsaqMc47gPXYEu8r6C6DUNq
   /Zc2t/r/+B2GUi8e9mgnS5z0eBDNnxTe0ENdxZzHfOKBrT6K4JxCKo8ue
   7u43R7vX1ZggVoteeHdiTiHIFhG6yHbLfWaPba/0EdDGxNKMsvNnihUQH
   sTV05jCdx8af1xnqck2DqOHkZ4KuNlzCTMhHGSTUK1V8+3J+dAYZdz0R5
   Q==;
X-CSE-ConnectionGUID: k8vxQ55nRxOA6BKLtOZT9Q==
X-CSE-MsgGUID: 4TsyoLz8SouxfJHjsmlIeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76884740"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="76884740"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 04:47:03 -0800
X-CSE-ConnectionGUID: yFa6i8vHTealbwZp8YricA==
X-CSE-MsgGUID: glC8NxbuSAKrX1zSc76R9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="215524786"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Feb 2026 04:47:01 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvxEr-00000000Aa7-03DV;
	Fri, 27 Feb 2026 12:46:46 +0000
Date: Fri, 27 Feb 2026 20:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghua Huang <yonghua.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Yifan Liu <yifan1.liu@intel.com>,
 Fei Li <fei1.li@intel.com>
Subject: [acrn:6.17/linux 2/8] mm/hugetlb.c:57:10: fatal error:
 asm/hypervisor.h: No such file or directory
Message-ID: <202602272021.TtCmI3Ty-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: 4867d13cd20c2bf8264e53e223e9b7283f667a73 [2/8] postpone ACRN guest VM memory cleanup
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260227/202602272021.TtCmI3Ty-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272021.TtCmI3Ty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272021.TtCmI3Ty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb.c:57:10: fatal error: asm/hypervisor.h: No such file or directory
      57 | #include <asm/hypervisor.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +57 mm/hugetlb.c

    47	
    48	#include <linux/io.h>
    49	#include <linux/hugetlb.h>
    50	#include <linux/hugetlb_cgroup.h>
    51	#include <linux/node.h>
    52	#include <linux/page_owner.h>
    53	#include "internal.h"
    54	#include "hugetlb_vmemmap.h"
    55	#include "hugetlb_cma.h"
    56	#include <linux/page-isolation.h>
  > 57	#include <asm/hypervisor.h>
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
