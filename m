Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094997470
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4sh2PuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700247178; x=1731783178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eAtpTQ3wMl0uO+JUbnTPU9wK1M2iiRCqPZrPjmYZfAY=;
  b=Q4sh2PuJVfDlGOQaq5m6ohwX/SEdJmEfxL3KX5iiYAGX/CL6B2oTdJMi
   ZDEPKVVyGna6wABdA4NIWK/ye+ca/nNsRtA6HrT6MYhdq2O6/BO3xUc2n
   6MSvecb59rFYi3Vj860ide37OYr9uPP1rhwbMRnjg1fV73pvC9HwG7E0s
   /vDhgEyxnskp3BT8X/Rk++Gt6RJIOuLcjlaP9ORSh67jhk4JN0ZFOxQbN
   eE09Pw5oHgZUNa+3tFQ3GgZQ1/FjdZyPXUS/YvK+QlLWQZut9eQqtQ2WD
   ISS+3zp0vHnzTiZ9ChPlbbo4d1NHTv7Nx4KFYKAhZRUFA228iLYFlUpPp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422444918"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422444918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 10:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6928611"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2023 10:52:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r43xU-00032x-2J;
	Fri, 17 Nov 2023 18:52:52 +0000
Date: Sat, 18 Nov 2023 02:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/splice.c:53:19: sparse: sparse: cast from restricted fmode_t
Message-ID: <202311180228.sLGuM7AA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc40e44f1ddef16a787f3501b97f1fff909177c
commit: 0f99fc513ddd28de155c58547824a9fd63daacea splice: clear FMODE_NOWAIT on file if splice/vmsplice is used
date:   7 months ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/archive/20231118/202311180228.sLGuM7AA-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180228.sLGuM7AA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180228.sLGuM7AA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/splice.c:53:19: sparse: sparse: cast from restricted fmode_t
>> fs/splice.c:53:19: sparse: sparse: cast from restricted fmode_t
>> fs/splice.c:53:19: sparse: sparse: cast to restricted fmode_t
   fs/splice.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false

vim +53 fs/splice.c

    39	
    40	/*
    41	 * Splice doesn't support FMODE_NOWAIT. Since pipes may set this flag to
    42	 * indicate they support non-blocking reads or writes, we must clear it
    43	 * here if set to avoid blocking other users of this pipe if splice is
    44	 * being done on it.
    45	 */
    46	static noinline void noinline pipe_clear_nowait(struct file *file)
    47	{
    48		fmode_t fmode = READ_ONCE(file->f_mode);
    49	
    50		do {
    51			if (!(fmode & FMODE_NOWAIT))
    52				break;
  > 53		} while (!try_cmpxchg(&file->f_mode, &fmode, fmode & ~FMODE_NOWAIT));
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
