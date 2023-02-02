Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E679B8F7D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675375914; x=1706911914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tz9WnHSyiF9y3a3jHxVIJVughXLxDXFj6TwLk8CkpWg=;
  b=hAA6gJniXxjvDsxhHtquzMFiXnnovhTZamgKJJ08sqCswPcPqlu6UM/5
   U3XGww6lg+ugOmSjJfxUMR7rMzZJcFdo1pQbrEpDvUOnbxnWTs+AwB3hy
   LeCdXhS+nYmbtl3SLYAW66+jFfhYd9tzDocOlK2rpfpHsPxv/h5gB888K
   9x/9cyDUUtVwX0pUj7QxdIEhL92neI/aTivwd7/F3pwu4l7rD32VrREGm
   UH94NemneV/KZEpUvxn0U6TFCvEaUhsA1/UXVMxfspwW/aNHrzBAvWpjS
   yVRd8qclZ5e/5W8fKYFEwW+gmMe/0DmRRTsaFykzIbc07NqNXVQdj6RR0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308925101"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="308925101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 14:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="808101220"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="808101220"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 14:11:53 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNho8-0006uA-2m;
	Thu, 02 Feb 2023 22:11:52 +0000
Date: Fri, 3 Feb 2023 06:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-10 21714/21729]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:9: error: static assertion failed:
 "kobject is smaller than work_struct"
Message-ID: <202302030613.1BNDmnvT-lkp@intel.com>
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
head:   f69b6402e19f3796053cf9420bcbf38fb164c8c0
commit: d34064cf6258cb4980ac890e00c3f5e75066d905 [21714/21729] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230203/202302030613.1BNDmnvT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10-2022-10
        git checkout d34064cf6258cb4980ac890e00c3f5e75066d905
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
