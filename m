Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7C1DFCD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 17:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha1xdnjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698945471; x=1730481471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/lRIzVgAOoGETCFiDbglY9NWMmHNVkEXyLup1k0O0c=;
  b=ha1xdnjEuFfKBvwd0kR90AzHqn56PcW4SmM4hn9fVko9uelUI4n2zeUk
   fJQ04JBdznwsG1cqpANxaJe0HOdWxN1Da//DNEbyB8f/055OSyFuncjhj
   Ay95FcYuGN4L3xpTLjQfKPZ3Xj6rB9+Ildv+H3ciBmQ8ZXiArxvy1QOoR
   TIT1w6M/mlUFgfFbBKx7Tklw4dQetsIguJiIK01JvIWjCs8XvJI+r9Dzm
   njQiIhV1u1m3zatuBWgoclAVduKctW03y2YuMTBzhQ9YMd0e6cMZOqqnk
   J20ljeRGd9+UvYNl42xMLtzcxhwmXpBRJcFDPxi3RT39834mbdmR73uo+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373806337"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="373806337"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="884957850"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="884957850"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2023 10:17:48 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qybKD-0001hn-2a;
	Thu, 02 Nov 2023 17:17:45 +0000
Date: Fri, 3 Nov 2023 01:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/memfd.c:271:1: sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202311030146.4SJnQUwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
commit: 626e98cb0366e66bdc2088918aecabee1fc6c4b2 mm: make MEMFD_CREATE into a selectable config option
date:   3 months ago
config: s390-randconfig-r133-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030146.4SJnQUwE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030146.4SJnQUwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030146.4SJnQUwE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memfd.c:271:1: sparse: sparse: Using plain integer as NULL pointer
>> mm/memfd.c:271:1: sparse: sparse: Using plain integer as NULL pointer

vim +271 mm/memfd.c

5d752600a8c373 Mike Kravetz 2018-06-07  270  
5d752600a8c373 Mike Kravetz 2018-06-07 @271  SYSCALL_DEFINE2(memfd_create,

:::::: The code at line 271 was first introduced by commit
:::::: 5d752600a8c373382264392f5b573b2fc9c0e8ea mm: restructure memfd code

:::::: TO: Mike Kravetz <mike.kravetz@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
