Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86E6FA7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aryf/Xxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701237281; x=1732773281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mp+qTCvif3bQphLxSgQE0By2gVWoF7Z+LznNaa2PuTg=;
  b=aryf/Xxx+S+Z0jMZpGJsBPNdGpOMguhB46g6Az8ODSusF5Df1P3sSmIr
   lNZVYkSP6OLugP4TVVU2epEgjpiyIhv/HzYRPkKFbxMpyJt6PNDvPLsy1
   GmXSl+79UNbx24ksTYZ+5whbdUrnmbiUSRjLbkgZA+kUG8xY/sq7kB8w9
   2p/OexE1akyGGiT6BPxdCGSQMDdmrV1d4a9+gObeqQcyJOOErKnAfXwHO
   ZaNRjnDWcLBYFFEO7Z6KL/DqcPebj+sYkL5BP9Zl4Ve7gDqp37UCbH4Fe
   rFA/kii6t5Se7C7Fqrk/VudufiISlNPslGLh3Gl5yMeTaVWh6eFzo+D1a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391970109"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="391970109"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 21:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="859687445"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="859687445"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Nov 2023 21:54:39 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8DWv-0008dU-0J;
	Wed, 29 Nov 2023 05:54:37 +0000
Date: Wed, 29 Nov 2023 13:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 22/41] kernel/power/user.c:328:63: sparse:
 sparse: incorrect type in argument 3 (different base types)
Message-ID: <202311291141.bkYhWlhE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   497d4172be23a640ebf74e892d8abce52751a4f2
commit: 0b15f05ae56061c55d3fb9d7412fef3385132ecd [22/41] CHROMIUM: PM: hibernate: Rewrite xfer block device ioctls
config: x86_64-randconfig-123-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291141.bkYhWlhE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291141.bkYhWlhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291141.bkYhWlhE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/power/user.c:328:63: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int new @@     got restricted blk_status_t [usertype] bi_status @@
   kernel/power/user.c:328:63: sparse:     expected int new
   kernel/power/user.c:328:63: sparse:     got restricted blk_status_t [usertype] bi_status
>> kernel/power/user.c:342:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got int @@
   kernel/power/user.c:342:47: sparse:     expected restricted blk_status_t [usertype] status
   kernel/power/user.c:342:47: sparse:     got int
   kernel/power/user.c:405:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted blk_status_t [usertype] status @@     got int @@
   kernel/power/user.c:405:54: sparse:     expected restricted blk_status_t [usertype] status
   kernel/power/user.c:405:54: sparse:     got int

vim +328 kernel/power/user.c

   318	
   319	static void snapshot_bio_end_io(struct bio *bio)
   320	{
   321		struct snapshot_bio_batch *batch = bio->bi_private;
   322		struct page *page = bio_first_page_all(bio);
   323	
   324		if (bio->bi_status) {
   325			pr_alert_ratelimited("snapshot io error sector %Lu block error %d\n",
   326				 (unsigned long long)bio->bi_iter.bi_sector,
   327				 bio->bi_status);
 > 328			atomic_cmpxchg(&batch->status, BLK_STS_OK, bio->bi_status);
   329		} else if (bio_data_dir(bio) == READ)
   330			flush_icache_range((unsigned long)page_address(page),
   331					   (unsigned long)page_address(page) + PAGE_SIZE);
   332	
   333		if (atomic_dec_and_test(&batch->count))
   334			wake_up(&batch->wait);
   335	
   336		bio_put(bio);
   337	}
   338	
   339	static int snapshot_bio_batch_wait(struct snapshot_bio_batch *batch)
   340	{
   341		wait_event(batch->wait, atomic_read(&batch->count) == 0);
 > 342		return blk_status_to_errno(atomic_read(&batch->status));
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
