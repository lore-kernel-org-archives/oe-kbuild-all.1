Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4E717BBE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711290643; cv=none; b=kMDL0bCkyIEBkKdNFuJ+Fl3/ueGs+1SZSRCO5DGLePdg56o3rvG5yBw1A/51sOYkGtOumzyWaaSuqBqw6x7evSQtvMAx8NiNJgH4K2zLRTuBabW813KpndCoaNmgBc+UQ0iFeEjpoylSM7Hpl1/4Ctpr5fPkIGRB5Ghjd9UlzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711290643; c=relaxed/simple;
	bh=EzQPvJswjw2xJFp0bdi7/oqh9yF9lj8QGd3DRcsqmF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hhbxZWwDK8XxUawT9NL8yEoaDmUqDwInm9+gj4kzr1iNW99QyzWm5/NsSyYB5z/Np6BFt9ZBCcDecJYz2UbxQ9rYB4GiO+8qa5Zx1BqRiV3reMDAE5RySGGrSD+7UGHJF/1CJiGeDJwG53hF8RAnExTwzHu3kIcl66GfekqT5SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXj7xCXb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXj7xCXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711290640; x=1742826640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EzQPvJswjw2xJFp0bdi7/oqh9yF9lj8QGd3DRcsqmF4=;
  b=GXj7xCXb1HB1tePnwq8RHAXkSLiyewnzvMP8pLHfrtlafeGCIhZY7Xch
   39cPsj7snKLgjMJ4g8R2HZnkbdkB7B1OkuewX8rIqRwCgzBjgjt4XW3vS
   eEwgqD4N8+o0Al9W5BEtkaLxv+0gSZLmRQwIk2bI3LMncbK5ZxdxsQ5Ac
   JxX1jxmQ2uR91MP4iXeohSfUgT5PkD6amh7yWh5lPDx7tkLB7iRIxhuc8
   2tQQBk7+HiFutZS4D0to38flmR64fK/cQtSnLqMBvH/uUR4mxo7g5M2xr
   5M0S0biwysUtF3CvviBu12s7ZpnvDDwawjqQcj9RLmjqLbmkDK/Kn3KJI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6117542"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="6117542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 07:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="15359560"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Mar 2024 07:30:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roOrr-000Lrv-0M;
	Sun, 24 Mar 2024 14:30:35 +0000
Date: Sun, 24 Mar 2024 22:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 24518/30000]
 drivers/ub/urma/uburma/uburma_dev_ops.c:32:6: warning: no previous prototype
 for 'uburma_release_file'
Message-ID: <202403242235.dk8Ti59s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: cd637a6dded9c0dce5f8d79898bb25be2edb927a [24518/30000] ub: uburma support open/release file ops
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240324/202403242235.dk8Ti59s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403242235.dk8Ti59s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403242235.dk8Ti59s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_dev_ops.c:32:6: warning: no previous prototype for 'uburma_release_file' [-Wmissing-prototypes]
      32 | void uburma_release_file(struct kref *ref)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_dev_ops.c:49:5: warning: no previous prototype for 'uburma_open' [-Wmissing-prototypes]
      49 | int uburma_open(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c: In function 'uburma_open':
>> drivers/ub/urma/uburma/uburma_dev_ops.c:66:50: warning: the comparison will always evaluate as 'false' for the address of 'dev_name' will never be NULL [-Waddress]
      66 |         if (ubc_dev == NULL || ubc_dev->dev_name == NULL) {
         |                                                  ^~
   In file included from drivers/ub/urma/uburma/uburma_dev_ops.c:25:
   include/urma/ubcore_types.h:1589:14: note: 'dev_name' declared here
    1589 |         char dev_name[UBCORE_MAX_DEV_NAME];
         |              ^~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c: At top level:
>> drivers/ub/urma/uburma/uburma_dev_ops.c:102:5: warning: no previous prototype for 'uburma_close' [-Wmissing-prototypes]
     102 | int uburma_close(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~~


vim +/uburma_release_file +32 drivers/ub/urma/uburma/uburma_dev_ops.c

    31	
  > 32	void uburma_release_file(struct kref *ref)
    33	{
    34		struct uburma_file *file = container_of(ref, struct uburma_file, ref);
    35		int srcu_idx;
    36	
    37		srcu_idx = srcu_read_lock(&file->ubu_dev->ubc_dev_srcu);
    38		srcu_dereference(file->ubu_dev->ubc_dev, &file->ubu_dev->ubc_dev_srcu);
    39	
    40		srcu_read_unlock(&file->ubu_dev->ubc_dev_srcu, srcu_idx);
    41	
    42		if (atomic_dec_and_test(&file->ubu_dev->refcnt))
    43			complete(&file->ubu_dev->comp);
    44	
    45		kobject_put(&file->ubu_dev->kobj);
    46		kfree(file);
    47	}
    48	
  > 49	int uburma_open(struct inode *inode, struct file *filp)
    50	{
    51		struct uburma_device *ubu_dev;
    52		struct ubcore_device *ubc_dev;
    53		struct uburma_file *file;
    54		int srcu_idx;
    55		int ret;
    56	
    57		ubu_dev = container_of(inode->i_cdev, struct uburma_device, cdev);
    58		if (!atomic_inc_not_zero(&ubu_dev->refcnt)) {
    59			uburma_log_err("device was not ready.\n");
    60			return -ENXIO;
    61		}
    62	
    63		srcu_idx = srcu_read_lock(&ubu_dev->ubc_dev_srcu);
    64		mutex_lock(&ubu_dev->lists_mutex);
    65		ubc_dev = srcu_dereference(ubu_dev->ubc_dev, &ubu_dev->ubc_dev_srcu);
  > 66		if (ubc_dev == NULL || ubc_dev->dev_name == NULL) {
    67			uburma_log_err("can not find ubcore device.\n");
    68			ret = EIO;
    69			goto err;
    70		}
    71	
    72		file = kzalloc(sizeof(struct uburma_file), GFP_KERNEL);
    73		if (!file) {
    74			ret = -ENOMEM;
    75			uburma_log_err("can not alloc memory.\n");
    76			goto err;
    77		}
    78	
    79		file->ubu_dev = ubu_dev;
    80		file->ucontext = NULL;
    81		kref_init(&file->ref);
    82		mutex_init(&file->mutex);
    83		filp->private_data = file;
    84	
    85		list_add_tail(&file->list, &ubu_dev->uburma_file_list);
    86		kobject_get(&ubu_dev->kobj); // Increase reference count for file.
    87	
    88		mutex_unlock(&ubu_dev->lists_mutex);
    89		srcu_read_unlock(&ubu_dev->ubc_dev_srcu, srcu_idx);
    90	
    91		uburma_log_info("device: %s open succeed.\n", ubc_dev->dev_name);
    92		return nonseekable_open(inode, filp);
    93	
    94	err:
    95		mutex_unlock(&ubu_dev->lists_mutex);
    96		srcu_read_unlock(&ubu_dev->ubc_dev_srcu, srcu_idx);
    97		if (atomic_dec_and_test(&ubu_dev->refcnt))
    98			complete(&ubu_dev->comp);
    99		return ret;
   100	}
   101	
 > 102	int uburma_close(struct inode *inode, struct file *filp)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
