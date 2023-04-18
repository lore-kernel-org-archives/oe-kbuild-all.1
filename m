Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BFB10F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 01:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681780991; x=1713316991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWn0vujcf3JF3bxamB5pP7E2NaiFZSYnUufettAR/jg=;
  b=FaLRLYCF/TrTN82+zvEBFSIbTLhLFu+QVCf7U9UF5rJHSj0UbxZaVaGF
   fHZx49Tm4CTuIWlbTsbzCV/QyFIp8SFkBLd+O4oQhJ9ZSkGUeez2PLHMI
   2SuKZULmOw/Dm6jbm0TybwbjcbOcAlZB+bQ2541wWkTUXMKzu0sEDBzxO
   uEp8ZaSACY8HsKR8q7k9U/ECKYJ8j+ulMLGFOKw34ObnlxiG6JTWz2N68
   sOQ8OodfGVO1f+iDm0DUjnm5x03Dm7L7BxVbojuRcPOpxsp50iGHV9/5E
   Ujl/+wYH1hlNPK6nTPHgv3mfsDbvqkgAs3UtaRybL1/lriV7UqeNs1KXa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410264148"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="410264148"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668298837"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="668298837"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Apr 2023 18:23:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poa3p-000co5-1x;
	Tue, 18 Apr 2023 01:23:09 +0000
Date: Tue, 18 Apr 2023 09:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-12 23043/23276]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:9: error: static assertion failed:
 "kobject is smaller than work_struct"
Message-ID: <202304180931.mfu5ACjH-lkp@intel.com>
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
head:   230976ad916b89fd73f8ef67ef701a3d37ada7b3
commit: 5aec776ef8c9319df4938fa87e8f2df018426960 [23043/23276] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: arm64-randconfig-r033-20230417 (https://download.01.org/0day-ci/archive/20230418/202304180931.mfu5ACjH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10-2022-12
        git checkout 5aec776ef8c9319df4938fa87e8f2df018426960
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180931.mfu5ACjH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma-buf/dma-buf-sysfs-stats.c: In function 'sysfs_add_workfn':
>> drivers/dma-buf/dma-buf-sysfs-stats.c:142:9: error: static assertion failed: "kobject is smaller than work_struct"
     142 |         _Static_assert(sizeof(struct kobject) >= sizeof(struct work_struct),
         |         ^~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
