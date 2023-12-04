Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A512E856
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k6rvU5Ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701711217; x=1733247217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvJR+Va7uKHOQtLjsEFdxgJ0n/y5RfBCgQC+bCYlQ+4=;
  b=k6rvU5ExzFhLJcJQBd9072n0UXlGaL/3hYHxZDSFbxbKOu0X4m+1LuxA
   MeX+EZWnGE1Ui68243V8fzOh8I0oBTqOGG4mSrHMjEGemhljkSaA4c/74
   rive8xmXmclxBAbfVNhJQEOPAOdGOfKR2cpeU7XDqcM6mbBWK+T4c9uxD
   nojcTgmWbX+wQ9gy8/VGRb7t2SEa0VLXXkTTnXooFqz92WxffkxOEbQlp
   1H2t/wQjX1jt6m0p93e28exokml2VL0SIzyT6kpLE/2czA2t0hs29MCYd
   DlmO4N3teq1ZpdF0/+QG1moldqmwczXghGI4W0ci5LfDVUhRyPIoGcbT+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384174449"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="384174449"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 09:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764027147"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764027147"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 09:33:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rACoy-0007xP-2f;
	Mon, 04 Dec 2023 17:33:28 +0000
Date: Tue, 5 Dec 2023 01:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@google.com>,
	Jan Kara <jack@suse.cz>
Subject: fs/super.c:1785:15: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202312050045.w3LqhNoX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 439bc39b3cf0014b1b75075812f7ef0f8baa9674 fs: move sb_init_dio_done_wq out of direct-io.c
date:   10 months ago
config: hexagon-randconfig-r121-20231117 (https://download.01.org/0day-ci/archive/20231205/202312050045.w3LqhNoX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050045.w3LqhNoX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312050045.w3LqhNoX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/super.c:1785:15: sparse: sparse: Using plain integer as NULL pointer

vim +1785 fs/super.c

  1767	
  1768	/*
  1769	 * Create workqueue for deferred direct IO completions. We allocate the
  1770	 * workqueue when it's first needed. This avoids creating workqueue for
  1771	 * filesystems that don't need it and also allows us to create the workqueue
  1772	 * late enough so the we can include s_id in the name of the workqueue.
  1773	 */
  1774	int sb_init_dio_done_wq(struct super_block *sb)
  1775	{
  1776		struct workqueue_struct *old;
  1777		struct workqueue_struct *wq = alloc_workqueue("dio/%s",
  1778							      WQ_MEM_RECLAIM, 0,
  1779							      sb->s_id);
  1780		if (!wq)
  1781			return -ENOMEM;
  1782		/*
  1783		 * This has to be atomic as more DIOs can race to create the workqueue
  1784		 */
> 1785		old = cmpxchg(&sb->s_dio_done_wq, NULL, wq);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
