Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD2A3C25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686654715; x=1718190715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C41mkPw7LhGTgOZhknyyHtXHZrIheAOWN5OQ9XHs1n8=;
  b=fi2cCvGeNelgp/nz4883lYwHFx9sqbYWZFzqDTOKj1SeMRNnRSuodKBw
   Ff1xJnQGCbD0YmB0EsyZaAmxiP3mt+lSGw8Q4094cWTM7pUvLBtHIjVvl
   qCJp/KTPke4fkvWuzfqZFkICGsA+2UcKSbIJBBPZeIFX7Hq6P0QhANuIh
   SMAGnhadCcCe0WR6wakbDmlNFS4s7mQbbYqJRSNFizska8rlXy+rnQu1T
   TS0DgM0Y+jXviaVdaamPdjf3NXuWVFTLLzqYOVFoafIyk3jd0Vr6hpYAq
   s/SlvnpIBKCzsqn7dwa+R4PPz71d1MK+Ds6L8yCclQPoZfDuRweJn9axb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="444673619"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="444673619"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 04:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="885811312"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="885811312"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Jun 2023 04:11:52 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q91wG-0001Hz-0i;
	Tue, 13 Jun 2023 11:11:52 +0000
Date: Tue, 13 Jun 2023 19:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-10 21714/21864]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:2: error: static assertion failed
 due to requirement 'sizeof(struct kobject) >= sizeof(struct work_struct)':
 kobject is smaller than work_struct
Message-ID: <202306131921.5BViQPw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2022-10
head:   c38b396f0413289daf7a9664ef2bb2865c3e3dc4
commit: d34064cf6258cb4980ac890e00c3f5e75066d905 [21714/21864] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: x86_64-randconfig-a002-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131921.5BViQPw1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10-2022-10
        git checkout d34064cf6258cb4980ac890e00c3f5e75066d905
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131921.5BViQPw1-lkp@intel.com/

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
