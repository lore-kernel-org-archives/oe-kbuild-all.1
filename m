Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF436D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 22:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678314783; x=1709850783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2tVCR8VjvUbGuohwdl5+IrN2H8EXEuK/clgLouuqO4=;
  b=oG0BMOfPv2VPWYQNTCRWc/eIGYF0GxwVyhnnBSrpt5unoTJ10IDfrea9
   iLRyZiH8Zniv/S234Smczys7mxcYX1oRf/tVNIIk/bdA13PcnKKw9zlW4
   sJ9Wj9ErFzIC1tMrKTciXVxhj/fv7RYsCibYLySlZ73vjshcNhRnckZhx
   6uLPbnZlwgGQrhDOve8VsizoY/eSFhftkc20ad2fx5kZCK2ZQlMmUw2uq
   Uu5Lzz746G5md7aVd4dBKcZEJ9VXVxGVDpZ4wllmb8cPGB6b+tqRsB9Vs
   c7xOoJZDRQCvnW5FpgUt9T1TcU+WjpWb+DmbKSfNhoS1nXUHiaSpWQvAq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315949906"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315949906"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 14:33:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627116192"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="627116192"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 14:33:01 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa2LE-0002Rd-0t;
	Wed, 08 Mar 2023 22:33:00 +0000
Date: Thu, 9 Mar 2023 06:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-12 23043/23271]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:9: error: static assertion failed:
 "kobject is smaller than work_struct"
Message-ID: <202303090614.pnHIjc95-lkp@intel.com>
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
head:   8d44cb1a9e4253fe215bcc16435564f8d2e42333
commit: 5aec776ef8c9319df4938fa87e8f2df018426960 [23043/23271] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230309/202303090614.pnHIjc95-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10-2022-12
        git checkout 5aec776ef8c9319df4938fa87e8f2df018426960
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090614.pnHIjc95-lkp@intel.com/

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
