Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A7BBE7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692798737; x=1724334737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/NTYeuGA5/wyB8Cd9zpovHWYXMiV35WLMCejluzwPA=;
  b=it42l30B2247SG1B1nx3rFebeVwgbeQeX38KGrtEGzOOS6hEe5wPQ8IB
   hlV/NkLJjPiwpXuOyAP472jZt/v0vZ/5PqzHPaomP3Au8k/cXbke4SnO8
   t49rUWzkauyhqwfQ4Ko9Jvrf0GjJzJ7UdxVlL7fG+8Ewe/Y/a7gS8NfXk
   VpHR7LMz4/iMfAkGjAxpLmA/QexDYfqkW62vKrlWGXilkrZbfYi+tbN+z
   GKLCVSl/pczLs19zxzs+ie51qCfUEYc2f1vwplP8MSYdioeOqZyfqzfyp
   eNyMByhHRdEdgmR1xfjIJkvxOw4mIL5+H5kk7epROwohMyodg8p4PUvOv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377923015"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377923015"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 06:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736680324"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="736680324"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2023 06:52:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYoHO-0001FV-2q;
	Wed, 23 Aug 2023 13:52:14 +0000
Date: Wed, 23 Aug 2023 21:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-12 23043/23290]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:2: error: static assertion failed
 due to requirement 'sizeof(struct kobject) >= sizeof(struct work_struct)':
 kobject is smaller than work_struct
Message-ID: <202308232117.fAptHGNt-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.10-2022-12
head:   6bd08d107095ac76b3210aac75ee13576366885c
commit: 5aec776ef8c9319df4938fa87e8f2df018426960 [23043/23290] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: x86_64-randconfig-012-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232117.fAptHGNt-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232117.fAptHGNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232117.fAptHGNt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf-sysfs-stats.c:142:2: error: static assertion failed due to requirement 'sizeof(struct kobject) >= sizeof(struct work_struct)': kobject is smaller than work_struct
           _Static_assert(sizeof(struct kobject) >= sizeof(struct work_struct),
           ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-buf-sysfs-stats.c:142:40: note: expression evaluates to '64 >= 80'
           _Static_assert(sizeof(struct kobject) >= sizeof(struct work_struct),
                          ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
