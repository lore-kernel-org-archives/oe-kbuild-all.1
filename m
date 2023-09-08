Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C0410EF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 01:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694135327; x=1725671327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kqo6nnM7NKWWr1BPf8oelj3+J9ysbtkCAd3q7cTu01w=;
  b=GvjIXQhmUGCdfrfZh3mSD75H7vpXpwRsxaOQnlKX0vO2lpMgiwnv4etN
   n4baIIyuHkcDZ9SpvzjD8t+NsM95UxK69IVDGFg62mN+0P8gDvYhdU3ck
   pX3XLovjnHySgrRQCND0z5H+j/MmU4Wk8afX8/ufHVXxN6AsDZvQIokZy
   d55HGLip2Ag1xUVF9AT0x3BFNl1tYujoaWjQO6CY2zlhHqP+FimuvVmmM
   GN/XHjtpIMOUhNz61VYrWPWg2E4n2DkFeEyfuRVeyLFk35WFPXhvUYB4Q
   qo9gk9yTjKkujgMhRtp4r7wB7X4F8Og0b/HKGvcow5fvvg2dl2WXMRb/Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381331173"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="381331173"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 18:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="812369229"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="812369229"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2023 18:08:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qePzD-0001lm-2e;
	Fri, 08 Sep 2023 01:08:39 +0000
Date: Fri, 8 Sep 2023 09:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 2/4] mm/rmap_id.c:12:10: fatal error:
 linux/thread.h: No such file or directory
Message-ID: <202309080955.0wgQstIy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   17125381adce3cd008977d62b31863b283bf75bb
commit: 1730d1c9fe15d22df5daa27747c938e2093f1541 [2/4] rmap_id per MM
config: sparc64-randconfig-r006-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080955.0wgQstIy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080955.0wgQstIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080955.0wgQstIy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/rmap_id.c:12:10: fatal error: linux/thread.h: No such file or directory
      12 | #include <linux/thread.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 mm/rmap_id.c

  > 12	#include <linux/thread.h>
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
