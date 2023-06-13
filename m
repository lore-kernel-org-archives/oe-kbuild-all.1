Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5972915
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686650995; x=1718186995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQ2NKHMJF2pjCAToyc0tjdgWJcx96fiiGeIkoq83i8I=;
  b=c99X4OtP8hQix594vYAtvP1k25yGWpQeMyJzHpNkVShp/45VyuxSILNn
   b5Osg+WY2BinXNOvl5Ebvkg8mkbmcCuxULeiUtttph3yYhI9UQij07KVk
   HktwKcd4Cvp+ZoDre8Mj/31S3FV1PYTs26sU+D/3G2rn1rEy5nmpBq1T1
   Jie4whkjduPw5qGA7LC0b3NQ66MjjuZnEDNggRDBpS5d2k/JEmbS2Zun5
   vxM+OoctQMVTmJ1NNkhyyOOasdtGyv1FvlCLkp7y9DtHxreGWXNvz7HF2
   i+//OnBNjWC+cIptptUeAf5YKaX3RMQSslNPsqcjKhKAZhovPyagg0zm7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358285056"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="358285056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 03:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711582108"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="711582108"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 03:09:47 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q90yB-0001Dk-0s;
	Tue, 13 Jun 2023 10:09:47 +0000
Date: Tue, 13 Jun 2023 18:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-10 21714/21864]
 drivers/dma-buf/dma-buf-sysfs-stats.c:142:9: error: static assertion failed:
 "kobject is smaller than work_struct"
Message-ID: <202306131840.iIHxN3Xu-lkp@intel.com>
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
head:   c38b396f0413289daf7a9664ef2bb2865c3e3dc4
commit: d34064cf6258cb4980ac890e00c3f5e75066d905 [21714/21864] BACKPORT: ANDROID: dma-buf: Move sysfs work out of DMA-BUF export path
config: i386-randconfig-r016-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131840.iIHxN3Xu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10-2022-10
        git checkout d34064cf6258cb4980ac890e00c3f5e75066d905
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131840.iIHxN3Xu-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
