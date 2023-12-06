Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7B3714E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdG2iQNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701867817; x=1733403817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8aWlSqvz1w9cQL1KngAQJAbUWY1+vF1r7t2xrh/lmU=;
  b=LdG2iQNzWmupF/B+yWltgX3XchpWpEQfkKKHb+MHTFJeaXXOIgclNfFn
   TaNea4UGefyCgecqDc9pVeXxYsG3hnjp3JU9JNRtqL2TKyDjuhYpeeCtE
   X/Xrirl3pW0+044XYrmg5hgLS4pwOs1Y8NWni0KlPUXYwtJuo/bqmT0df
   AFvLsW7M7NnMC+Ees+CQwXRh2Q+P4KhCJqXWiy4Z6nfUwLs8Dh/yPrSMQ
   7TCwh3Fb4IvHc8MS8McG6rqTiWKx1iTY2V/hmY8xxiCeBuYvLyZbJyZ45
   5uSwp0vXe24oQ+jVFsRi7SVN9r2F6x9ntPXXZgeR6ggoT+KmF8cChDa3u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="897410"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="897410"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 05:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944648449"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="944648449"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2023 05:03:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rArYn-000AoI-0O;
	Wed, 06 Dec 2023 13:03:29 +0000
Date: Wed, 6 Dec 2023 21:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dgc-xfs:vfs-scale 1/11] lib/dlock-list.c:198: warning: Excess
 function parameter 'dlist' description in '__dlock_list_next_list'
Message-ID: <202312062040.baSag4OL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git vfs-scale
head:   5e5e95a86ea3aa15d83654ec3752451959a689e6
commit: e110421085e9f39f401af6f6cbf40816751f18b2 [1/11] lib/dlock-list: Distributed and lock-protected lists
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20231206/202312062040.baSag4OL-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062040.baSag4OL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062040.baSag4OL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dlock-list.c:198: warning: Excess function parameter 'dlist' description in '__dlock_list_next_list'


vim +198 lib/dlock-list.c

   188	
   189	/**
   190	 * __dlock_list_next_list: Find the first entry of the next available list
   191	 * @dlist: Pointer to the dlock_list_heads structure
   192	 * @iter : Pointer to the dlock list iterator structure
   193	 * Return: true if the entry is found, false if all the lists exhausted
   194	 *
   195	 * The information about the next available list will be put into the iterator.
   196	 */
   197	struct dlock_list_node *__dlock_list_next_list(struct dlock_list_iter *iter)
 > 198	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
