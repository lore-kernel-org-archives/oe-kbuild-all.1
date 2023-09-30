Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC4125DA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696082219; x=1727618219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XGLvrngTiUFXSYEYYHIUbbhBxFlTQoLgEB+tKiQxvxY=;
  b=Gol8DeTX7CenapkpQO1cEbMqWLMI3xX61bwqcwg3i8z1I1hDOuyQCLk+
   Hsc6ayyjBlhk5vCiBis799fk1imUJLhxXQ8Uiwl3zEgVyjbCvFT2BRgpL
   /nUFQzjWkB+lWrVZmFUDiIkH6mLnwYdS61sGp1624DLS2s8ffycnnJp9P
   qyfAW3DTHAa19FnHvNxlYS5TtR57pS4SM8VeA8Ogxz/4hRx+7aO6klzXc
   BdH8nxvczQglm7vwHi8dTtoTrDUjAXdo5OJI/SUWEBaR3AWQVFS4I6+jX
   g9Nyhn4Rsgg/nJ+FtdPrqgdEvq3aMjUtVVa7KRqOdUHvHJgqO6xT3PXzT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="381327030"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="381327030"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 06:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="750183846"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="750183846"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Sep 2023 06:56:56 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmaSk-0004Bm-2A;
	Sat, 30 Sep 2023 13:56:54 +0000
Date: Sat, 30 Sep 2023 21:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 17409/28554] htmldocs:
 Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc"
 directive:
Message-ID: <202309302133.o8o734PM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WeiXiong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a1b9dbe5628adf6bc61b5bb150dd2fb2b286fda0
commit: c0003a71672a751ec23d85451cbe43ff64609ab1 [17409/28554] UPSTREAM: Documentation: Add details for pstore/blk
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309302133.o8o734PM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309302133.o8o734PM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc" directive:
>> Documentation/admin-guide/pstore-blk.rst: WARNING: document isn't included in any toctree

vim +152 Documentation/admin-guide/pstore-blk.rst

   151	
 > 152	.. kernel-doc:: fs/pstore/blk.c
   153	   :identifiers: register_pstore_blk
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
