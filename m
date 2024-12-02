Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B491DED5B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733180418; cv=none; b=CKcYmbXXqrEshL+EnGva1Nz7qiw7AcvjQqI0FmAN4vXc2u7JuyLBsmnJDNlQc6UxmQqm13zd3rkOBSE9tfKdcb87Ikx+h38pE+omTJ4rLP2VfyvjQMBWaOhr7KJMGBnQMpf+dJP0SoWPTlpKDoxzu31bYtgP5dOdOBRY127ClPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733180418; c=relaxed/simple;
	bh=Ek0sPA2aE4OM68IDbfNUx4087l01ItcRSUTSKn5s5u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CzVNjdoNyzrIZi5pB2thYsFKvhPTTUiur1ulJBTw58nikMn5JRHpHqsktm5YwkuiuQRoG1r0P1DZBjzJ9jGaic9lAos6lrk+tMlEl4RWVD8jFmj9czzfb1f8xA3D06L6F/mggnMg6XeGPRfPVvrM2x0mqY3+9QwVqsqurBM+S0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2MRVI0N; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2MRVI0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733180417; x=1764716417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ek0sPA2aE4OM68IDbfNUx4087l01ItcRSUTSKn5s5u8=;
  b=e2MRVI0N8JfitBbCzQBjpgbrweWLdTI4S9xR5hXrmN1R6F8850M/Sh0L
   edWslCnJRxaZrwxfFmpR3mXYalhTrHJdv9R7uqPpBPej+zsvXAYDgiVtQ
   GsVM/yirEUfWtVVREBVxu3YGDjoqywsrCGPcCjNdGnpvVdW38jXWuj7EK
   9LbB6tvyccHYbRWFYaJCj0yIhV79GdBE9vsZHZoEBSYKuZyW3I2h16nvR
   thY8VV+fUFwQHrgBS0V7SyPAYCGI2u0cY9g7R27cbWsBWjKtEdoi5etyW
   ASh6HG9GA1mH4n7fvyV6IrRkFQRO4o57yIPnobwa/q5uyW0r8W+0mb4QK
   Q==;
X-CSE-ConnectionGUID: jk3sCIEzTl27/Yc7vsZoUg==
X-CSE-MsgGUID: DKT0bI3oTMuFMBqs9SZcKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33431261"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33431261"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 15:00:16 -0800
X-CSE-ConnectionGUID: 6KpAN2ioRM6Oha026TJFYA==
X-CSE-MsgGUID: HyS4U8x/QTaSHONUM0WdBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97680781"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 15:00:14 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIFOm-0002zx-0x;
	Mon, 02 Dec 2024 23:00:12 +0000
Date: Tue, 3 Dec 2024 06:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/uburma/uburma_dev_ops.c:32:6: warning: no previous prototype
 for 'uburma_release_file'
Message-ID: <202412030644.iR7DHrYL-lkp@intel.com>
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
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: cd637a6dded9c0dce5f8d79898bb25be2edb927a [2516/2516] ub: uburma support open/release file ops
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030644.iR7DHrYL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030644.iR7DHrYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030644.iR7DHrYL-lkp@intel.com/

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
