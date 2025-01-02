Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF2189B80
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 04:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735792733; cv=none; b=AcRP2R/7KQlvHiNkypIHTyj7O7aj0frdpjiI8k4nW8GT6eTjNCJRQNvhGA9whWEz1o1MhXsqQpqq+lJPkkgpguZU59s04ei47GK4F1JI6NvuVXYMi6IfVKEyotzrsA917zApb9+/+WcP1wqZiV6/zhY7JH0YIHD9rwE3QnWtysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735792733; c=relaxed/simple;
	bh=hbFLCBUVdO+NtdIdrbz4ZCrltIvXjeGV0qnhHgPkT9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tOlplSrHB91lyvIbLy2yENhaZHhct9a9mksN2tcb9m+GT/D/iBapLQ8T8EG3X7Z7BR5RRAvaf9TzAy2bBZUJWZHN+F51DNT2I9cxY6slTFa6b0aib+BAKT3uJ6luifziekoGLjdTwT7Q31BvyaPnBrp3Lht28B44goLo7532Kr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gi3bjgUm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gi3bjgUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735792732; x=1767328732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hbFLCBUVdO+NtdIdrbz4ZCrltIvXjeGV0qnhHgPkT9M=;
  b=gi3bjgUm1vewHC0vgamUgNqU+KfBdG3rYU/TzMhHSdH2R+WAqFjD1Rn3
   44R/PBkYDEHDoK6igQqmi4mvhMMMrfzBaf9m9xAk67JRG7bktfQ9XY/aW
   HuaQa728ZIGdFJzYmCUv02v9t4Drg5xXcJQXTu1iUCpoVI7iv80OrJ6C4
   PFlsuny33eX/co6HpQaQ3d17UbrzQeNat094ubhNDr7n6wNkNqa6ZpLsq
   WSnqgePU0D/KoR5p77yndrHIkXg9eDH55c5OzwIQxwiO/lg2RaXe/qqXL
   Q41aAZ4rCIdX/tpi2kuQyTp6yfHVLFOjI4q99mLqGUr99Uz6Bzjtp7LfX
   Q==;
X-CSE-ConnectionGUID: fZdPTlABT/SicxAXhYhRYg==
X-CSE-MsgGUID: I6tPmQTdTvS2wPHq8z/eww==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="38852956"
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="38852956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 20:38:51 -0800
X-CSE-ConnectionGUID: k5HA+giOTW+S7d6SQgoklg==
X-CSE-MsgGUID: Tv2e/W+RSoifDcuh6skxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,284,1728975600"; 
   d="scan'208";a="106377894"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2025 20:38:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTCyt-0008En-2o;
	Thu, 02 Jan 2025 04:38:47 +0000
Date: Thu, 2 Jan 2025 12:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/android/binderfs.c:237: warning: Function parameter or
 struct member 'file' not described in 'binder_ctl_ioctl'
Message-ID: <202501021220.itBTTNCC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: 1045a06724f322ed61f1ffb994427c7bdbe64647 remove CONFIG_ANDROID
date:   2 years, 6 months ago
config: csky-randconfig-r036-20230303 (https://download.01.org/0day-ci/archive/20250102/202501021220.itBTTNCC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021220.itBTTNCC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021220.itBTTNCC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binderfs.c:237: warning: Function parameter or struct member 'file' not described in 'binder_ctl_ioctl'
>> drivers/android/binderfs.c:237: warning: Function parameter or struct member 'cmd' not described in 'binder_ctl_ioctl'
>> drivers/android/binderfs.c:237: warning: Function parameter or struct member 'arg' not described in 'binder_ctl_ioctl'
   drivers/android/binderfs.c:237: warning: expecting prototype for binderfs_ctl_ioctl(). Prototype was for binder_ctl_ioctl() instead
--
   drivers/android/binder.c:260: warning: Function parameter or struct member '_proc' not described in 'binder_proc_unlock'
   drivers/android/binder.c:260: warning: Excess function parameter 'proc' description in 'binder_proc_unlock'
   drivers/android/binder.c:362: warning: expecting prototype for binder_node_unlock(). Prototype was for binder_node_inner_unlock() instead
   drivers/android/binder.c:1182: warning: expecting prototype for binder_dec_ref(). Prototype was for binder_dec_ref_olocked() instead
>> drivers/android/binder.c:1848: warning: Function parameter or struct member 'file' not described in 'binder_task_work_cb'
>> drivers/android/binder.c:1848: warning: Excess struct member 'fd' description in 'binder_task_work_cb'
>> drivers/android/binder.c:2286: warning: Function parameter or struct member 'offset' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2286: warning: Function parameter or struct member 'skip_size' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2286: warning: Function parameter or struct member 'fixup_data' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2286: warning: Function parameter or struct member 'node' not described in 'binder_ptr_fixup'
>> drivers/android/binder.c:2306: warning: Function parameter or struct member 'offset' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2306: warning: Function parameter or struct member 'sender_uaddr' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2306: warning: Function parameter or struct member 'length' not described in 'binder_sg_copy'
>> drivers/android/binder.c:2306: warning: Function parameter or struct member 'node' not described in 'binder_sg_copy'
   drivers/android/binder.c:2802: warning: Function parameter or struct member 'procp' not described in 'binder_get_node_refs_for_txn'
   drivers/android/binder.c:2802: warning: Excess function parameter 'proc' description in 'binder_get_node_refs_for_txn'
>> drivers/android/binder.c:3699: warning: Function parameter or struct member 'thread' not described in 'binder_free_buf'


vim +237 drivers/android/binderfs.c

3ad20fe393b310 Christian Brauner 2018-12-14  224  
3ad20fe393b310 Christian Brauner 2018-12-14  225  /**
3ad20fe393b310 Christian Brauner 2018-12-14  226   * binderfs_ctl_ioctl - handle binder device node allocation requests
3ad20fe393b310 Christian Brauner 2018-12-14  227   *
3ad20fe393b310 Christian Brauner 2018-12-14  228   * The request handler for the binder-control device. All requests operate on
3ad20fe393b310 Christian Brauner 2018-12-14  229   * the binderfs mount the binder-control device resides in:
3ad20fe393b310 Christian Brauner 2018-12-14  230   * - BINDER_CTL_ADD
3ad20fe393b310 Christian Brauner 2018-12-14  231   *   Allocate a new binder device.
3ad20fe393b310 Christian Brauner 2018-12-14  232   *
3ad20fe393b310 Christian Brauner 2018-12-14  233   * Return: 0 on success, negative errno on failure
3ad20fe393b310 Christian Brauner 2018-12-14  234   */
3ad20fe393b310 Christian Brauner 2018-12-14  235  static long binder_ctl_ioctl(struct file *file, unsigned int cmd,
3ad20fe393b310 Christian Brauner 2018-12-14  236  			     unsigned long arg)
3ad20fe393b310 Christian Brauner 2018-12-14 @237  {
3ad20fe393b310 Christian Brauner 2018-12-14  238  	int ret = -EINVAL;
3ad20fe393b310 Christian Brauner 2018-12-14  239  	struct inode *inode = file_inode(file);
3ad20fe393b310 Christian Brauner 2018-12-14  240  	struct binderfs_device __user *device = (struct binderfs_device __user *)arg;
3ad20fe393b310 Christian Brauner 2018-12-14  241  	struct binderfs_device device_req;
3ad20fe393b310 Christian Brauner 2018-12-14  242  
3ad20fe393b310 Christian Brauner 2018-12-14  243  	switch (cmd) {
3ad20fe393b310 Christian Brauner 2018-12-14  244  	case BINDER_CTL_ADD:
3ad20fe393b310 Christian Brauner 2018-12-14  245  		ret = copy_from_user(&device_req, device, sizeof(device_req));
3ad20fe393b310 Christian Brauner 2018-12-14  246  		if (ret) {
3ad20fe393b310 Christian Brauner 2018-12-14  247  			ret = -EFAULT;
3ad20fe393b310 Christian Brauner 2018-12-14  248  			break;
3ad20fe393b310 Christian Brauner 2018-12-14  249  		}
3ad20fe393b310 Christian Brauner 2018-12-14  250  
3ad20fe393b310 Christian Brauner 2018-12-14  251  		ret = binderfs_binder_device_create(inode, device, &device_req);
3ad20fe393b310 Christian Brauner 2018-12-14  252  		break;
3ad20fe393b310 Christian Brauner 2018-12-14  253  	default:
3ad20fe393b310 Christian Brauner 2018-12-14  254  		break;
3ad20fe393b310 Christian Brauner 2018-12-14  255  	}
3ad20fe393b310 Christian Brauner 2018-12-14  256  
3ad20fe393b310 Christian Brauner 2018-12-14  257  	return ret;
3ad20fe393b310 Christian Brauner 2018-12-14  258  }
3ad20fe393b310 Christian Brauner 2018-12-14  259  

:::::: The code at line 237 was first introduced by commit
:::::: 3ad20fe393b31025bebfc2d76964561f65df48aa binder: implement binderfs

:::::: TO: Christian Brauner <christian@brauner.io>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
