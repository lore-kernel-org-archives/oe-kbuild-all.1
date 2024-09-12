Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6E1C1AA7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 19:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726170682; cv=none; b=LpHfIRHrlM72Br9zks+eFF6AsrZCHBUqHVxgSc8PaJL5T3QNxZXq31ntNjoYYIgfy5Qyd6onzlGfA4KcfaANsYJxaOxMOYUB1+ZZnoqyV70ayd8jUoICJAM4RPArgGUuOfUndXI4boZ81tQIFraNyeuKOzsDuHpfjphNob6c7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726170682; c=relaxed/simple;
	bh=yMn9s6yvrz4xdp5rJ0PyrVYbyFx+98iHRRzNmAb1RYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqeExjzbeIT9lAXwHlbxjpS+/DRnQBzs7fRN8nbYWtZyiXsjthIPlF+nI0ZQ8SovT+FoZqPEP7K4AUjogDaFLAN6vXRNFYltJYfX5IwhAnfOshY747yhKfUvTnqaodzsed0I9rIvXjxZ4nqO9tuzfjQeLPYpmQow8H5fSNNuOm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdYZVKss; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdYZVKss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726170680; x=1757706680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMn9s6yvrz4xdp5rJ0PyrVYbyFx+98iHRRzNmAb1RYU=;
  b=FdYZVKss5mdSaD0ADMwF/xRqsiGy47n40P36IfjQmsK6vIKiot7HeVlG
   gJN168gtKXjaUSBd6nBJn8nkgQc0YjMOWh4RtR9OGXl9YOVQ/2JAea/cL
   CLrpRDsa4T7tiVvAt0VJyK+NaFzaFNo1ahq7x70RLE43iLJow3p4Faque
   2+3c7EchC2Uc5jLdG1kaWw95mfSBOnA14KTw5wdAdUkyxX8pUlCIMEzLx
   6w9Q5KDlPMylRqX1r1H6xMK778K4TzOIXgD0u4rgM4z7XjBa2Y/PBcBU1
   vHCf/kaANIkrXMtd4TvI1cYajjIpKNdo8dyU9A4d6THLklujd/Yul7CKf
   g==;
X-CSE-ConnectionGUID: /aHU2hpWSYCjQulvY9AVhA==
X-CSE-MsgGUID: l6gVFOh8STG8oUn7hLkQuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25176378"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="25176378"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 12:51:19 -0700
X-CSE-ConnectionGUID: qjFkM7mFT/iEnu1fmxEoZQ==
X-CSE-MsgGUID: EBhwLiucRT2AmHocwtLzsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="98629651"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Sep 2024 12:51:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sopqW-0005ds-0z;
	Thu, 12 Sep 2024 19:51:16 +0000
Date: Fri, 13 Sep 2024 03:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19445/30000]
 drivers/ub/urma/uburma/uburma_dev_ops.c:32:6: warning: no previous prototype
 for 'uburma_release_file'
Message-ID: <202409130325.7Mu8hINa-lkp@intel.com>
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
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: cd637a6dded9c0dce5f8d79898bb25be2edb927a [19445/30000] ub: uburma support open/release file ops
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130325.7Mu8hINa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130325.7Mu8hINa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130325.7Mu8hINa-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


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
