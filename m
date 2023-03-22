Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A181B9476
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 18:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679509792; x=1711045792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ce0khf7YWLAu0vTq/lEDn2YBHj4dNV12sOoqLm0mBas=;
  b=EffaYd1iTqRzUt/yQHl7dI+wNFykZ0sDTn3RDQ6XOEktMtYgVYIKx9Dn
   n1wjw99uSWRpNIVz/28WrdB0l+ErtmH3AoGn5b7BPk3xS/Rn1IIsnOW0c
   2CiHrhX6FqqC075LpyKoDvIJhShRDYoej/nZmHsog12z6tuYL0YWIE5fV
   JMKpI34Isz2057RZG0RQckHpTexm0Pq5gCre6BEzZw4+1cwfuFJiWYwvs
   jTHACb/pS0+QMHLHcPWOFUvrIHr1USurw0rDezo5fQwJIxF0zEA6lqRha
   a61bz7iqaYgr8yMhCA9zcNIEksI8IVRDzjkhpvKCGxu3LaDWCDUwiddHT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341658724"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="341658724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 11:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712357397"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="712357397"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 11:29:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf3DZ-000DZR-30;
	Wed, 22 Mar 2023 18:29:49 +0000
Date: Thu, 23 Mar 2023 02:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 288/290] mm/vmalloc.c:3448:8: warning: no
 previous prototype for 'zero_iter'
Message-ID: <202303230226.NucKb3B7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   39aca4f17e02ee4076b6ab327577c9b1be23775d
commit: d9cab54f77377439e766e1c5916f79ec2ee27a6c [288/290] mm: vmalloc: convert vread() to vread_iter()
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230323/202303230226.NucKb3B7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=d9cab54f77377439e766e1c5916f79ec2ee27a6c
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout d9cab54f77377439e766e1c5916f79ec2ee27a6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230226.NucKb3B7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:3448:8: warning: no previous prototype for 'zero_iter' [-Wmissing-prototypes]
    3448 | size_t zero_iter(struct iov_iter *iter, size_t count)
         |        ^~~~~~~~~


vim +/zero_iter +3448 mm/vmalloc.c

  3442	
  3443	/*
  3444	 * Atomically zero bytes in the iterator.
  3445	 *
  3446	 * Returns the number of zeroed bytes.
  3447	 */
> 3448	size_t zero_iter(struct iov_iter *iter, size_t count)
  3449	{
  3450		size_t remains = count;
  3451	
  3452		while (remains > 0) {
  3453			size_t num, copied;
  3454	
  3455			num = remains < PAGE_SIZE ? remains : PAGE_SIZE;
  3456			copied = copy_page_to_iter_atomic(ZERO_PAGE(0), 0, num, iter);
  3457			remains -= copied;
  3458	
  3459			if (copied < num)
  3460				break;
  3461		}
  3462	
  3463		return count - remains;
  3464	}
  3465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
