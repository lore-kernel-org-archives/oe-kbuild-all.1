Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3322F28
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688772091; x=1720308091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mb824xly/EwSkvCsxD8FuFAMMAqOeAfDcP0H3Xerm5o=;
  b=KIpNB9hNGo4HWxnCirq2fk89y2MbuNq3Au717w5FqEwt1OphdTpXObVH
   G1IFyl9d/IDrUf5tARNfYwInbIZbC1fXyK4ap5J9Kdft118FFfREKtWUy
   y6KW8RuIEcUAmtTVvaKfZSxg6KNdj/g5vQe0y5c79oTe67vQfuufFp7wJ
   zQCwYwefpnGEWXengtFzhrE9f4w/0hp9g5/byklvtzsvtlw1BpSkTBywC
   oET3GlnOerY0ZDZspYRST20fuUTGIKGyySXooZBEXvyzo2Nuxbz0NcH3k
   jdnNgiA1FnjKuz9to/0NBtV1JaNvf6TWbjBG79LEMApoW4c1nKverE9vr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="344330117"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="344330117"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 16:21:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="833569965"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="833569965"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2023 16:21:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHulE-0002NI-1O;
	Fri, 07 Jul 2023 23:21:12 +0000
Date: Sat, 8 Jul 2023 07:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-10 21714/21865]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:2: error: static assertion failed
 due to requirement 'sizeof(struct kobject) >= sizeof(struct work_struct)':
 kobject is smaller than work_struct
Message-ID: <202307080710.bfva0ZXb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2022-10
head:   987d4745ed78ca0f958513bab62fa9de303f2676
commit: d34064cf6258cb4980ac890e00c3f5e75066d905 [21714/21865] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: x86_64-buildonly-randconfig-r002-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080710.bfva0ZXb-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080710.bfva0ZXb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080710.bfva0ZXb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf-sysfs-stats.c:142:2: error: static assertion failed due to requirement 'sizeof(struct kobject) >= sizeof(struct work_struct)': kobject is smaller than work_struct
           _Static_assert(sizeof(struct kobject) >= sizeof(struct work_struct),
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +142 drivers/dma-buf/dma-buf-sysfs-stats.c

   138	
   139	static void sysfs_add_workfn(struct work_struct *work)
   140	{
   141		/* The ABI would have to change for this to be false, but let's be paranoid. */
 > 142		_Static_assert(sizeof(struct kobject) >= sizeof(struct work_struct),
   143			"kobject is smaller than work_struct");
   144	
   145		struct dma_buf_sysfs_entry *sysfs_entry =
   146			container_of((struct kobject *)work, struct dma_buf_sysfs_entry, kobj);
   147		struct dma_buf *dmabuf = sysfs_entry->dmabuf;
   148	
   149		/*
   150		 * A dmabuf is ref-counted via its file member. If this handler holds the only
   151		 * reference to the dmabuf, there is no need for sysfs kobject creation. This is an
   152		 * optimization and a race; when the reference count drops to 1 immediately after
   153		 * this check it is not harmful as the sysfs entry will still get cleaned up in
   154		 * dma_buf_stats_teardown, which won't get called until the final dmabuf reference
   155		 * is released, and that can't happen until the end of this function.
   156		 */
   157		if (file_count(dmabuf->file) > 1) {
   158			/*
   159			 * kobject_init_and_add expects kobject to be zero-filled, but we have populated it
   160			 * to trigger this work function.
   161			 */
   162			memset(&dmabuf->sysfs_entry->kobj, 0, sizeof(dmabuf->sysfs_entry->kobj));
   163			dmabuf->sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
   164			if (kobject_init_and_add(&dmabuf->sysfs_entry->kobj, &dma_buf_ktype, NULL,
   165							"%lu", file_inode(dmabuf->file)->i_ino)) {
   166				kobject_put(&dmabuf->sysfs_entry->kobj);
   167				dmabuf->sysfs_entry = NULL;
   168			}
   169		} else {
   170			/*
   171			 * Free the sysfs_entry and reset the pointer so dma_buf_stats_teardown doesn't
   172			 * attempt to operate on it.
   173			 */
   174			kfree(dmabuf->sysfs_entry);
   175			dmabuf->sysfs_entry = NULL;
   176		}
   177		dma_buf_put(dmabuf);
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
