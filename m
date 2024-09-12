Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14821192D89
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 23:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726184189; cv=none; b=FvkglybsCrwQpwlrWtIn/Hs9tarCwrPAJPtytLq48WayvdpPHMA7S/9Vr5W7upUwrstkFIcCgk3OAGpqLLfg2UGMI4IIp4DPjaKLL0NJFtCUOo7x9EeDREZaj7FGGBlh5FUBQtX+qZNDTBUwTq17itOVez2n9Oux/b27aoT5Dr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726184189; c=relaxed/simple;
	bh=A87a7sEn6MuMmZM0Gw1Oxu7oZPn3T+Rzo8D3594z/DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a4mjjvi20doBsuBu98CJPVuuk/ja+kAlnS/iK0BII7KIWyf3qO20A8FcyIZjH3RCTXzv8K22DoYIUKXaVy/G4Uc8Gwtus+4aecApcY2w3Llh+ppVqSnEQ/H/2MR2W0WedBTomtip8yhYx2pJkT083BxGX5F9gJELOdA3ljqlksI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5d51IFe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5d51IFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726184188; x=1757720188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A87a7sEn6MuMmZM0Gw1Oxu7oZPn3T+Rzo8D3594z/DU=;
  b=c5d51IFe99NOyTZ2eu8cveHJgSykL6abefMPLEb/OUkncbpUmcXekid2
   6vrfgmvEkXCo2NPk8VIE3BOtWn6fXRy9kK2VUQnXyjOYIqYnsn8F1QQSL
   5ZoXFYzEkcPYvvdSoV2Nmsy0H9HgbC8phSoaXopTllNCwfWHFu3Di4/4n
   EMGKVUsk/Lj0wQgIJy9Fn9gyvRUaQH4pVpVb3jUSyFHOv3MJH03d+rb3c
   yvhyXa8nX6sw9t0Qz77dujpj56arjuBFSD9bGzcJJXOBQAmDw6YqJvmJI
   vJfxrCkIdmYKmsrVWxm1+KFiQh7isKoVia1HKv8V0HQVE7G928f6WehTs
   w==;
X-CSE-ConnectionGUID: VpByrv/PR4GftK6p2K5VgA==
X-CSE-MsgGUID: 6OrOrqd+St2HopwPdxYAvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13503393"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="13503393"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 16:36:27 -0700
X-CSE-ConnectionGUID: bcdR+hklSdiftHwa9pOMOQ==
X-CSE-MsgGUID: +aBQraS2R9mUndEh7+lOwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="67841773"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Sep 2024 16:36:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sotMN-0005oo-2Y;
	Thu, 12 Sep 2024 23:36:23 +0000
Date: Fri, 13 Sep 2024 07:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19446/30000]
 drivers/ub/urma/uburma/uburma_dev_ops.c:32:5: warning: no previous prototype
 for 'uburma_mmap'
Message-ID: <202409130707.LQaWHUsI-lkp@intel.com>
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
commit: 7d130c6018dbfd09c6e1c5d91b347fdbf3924321 [19446/30000] ub: add mmap ops support in ubcore and uburma
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130707.LQaWHUsI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130707.LQaWHUsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130707.LQaWHUsI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/uburma/uburma_dev_ops.c:32:5: warning: no previous prototype for 'uburma_mmap' [-Wmissing-prototypes]
      32 | int uburma_mmap(struct file *filp, struct vm_area_struct *vma)
         |     ^~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:64:6: warning: no previous prototype for 'uburma_release_file' [-Wmissing-prototypes]
      64 | void uburma_release_file(struct kref *ref)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c:81:5: warning: no previous prototype for 'uburma_open' [-Wmissing-prototypes]
      81 | int uburma_open(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c: In function 'uburma_open':
   drivers/ub/urma/uburma/uburma_dev_ops.c:98:50: warning: the comparison will always evaluate as 'false' for the address of 'dev_name' will never be NULL [-Waddress]
      98 |         if (ubc_dev == NULL || ubc_dev->dev_name == NULL) {
         |                                                  ^~
   In file included from drivers/ub/urma/uburma/uburma_dev_ops.c:25:
   include/urma/ubcore_types.h:1589:14: note: 'dev_name' declared here
    1589 |         char dev_name[UBCORE_MAX_DEV_NAME];
         |              ^~~~~~~~
   drivers/ub/urma/uburma/uburma_dev_ops.c: At top level:
   drivers/ub/urma/uburma/uburma_dev_ops.c:134:5: warning: no previous prototype for 'uburma_close' [-Wmissing-prototypes]
     134 | int uburma_close(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/uburma_mmap +32 drivers/ub/urma/uburma/uburma_dev_ops.c

    31	
  > 32	int uburma_mmap(struct file *filp, struct vm_area_struct *vma)
    33	{
    34		struct uburma_file *file = filp->private_data;
    35		struct uburma_device *ubu_dev;
    36		struct ubcore_device *ubc_dev;
    37		int srcu_idx;
    38		int ret;
    39	
    40		if (file == NULL || file->ucontext == NULL) {
    41			uburma_log_err("can not find ucontext.\n");
    42			return -EINVAL;
    43		}
    44	
    45		ubu_dev = file->ubu_dev;
    46		uburma_cmd_inc(ubu_dev);
    47	
    48		srcu_idx = srcu_read_lock(&ubu_dev->ubc_dev_srcu);
    49		ubc_dev = srcu_dereference(ubu_dev->ubc_dev, &ubu_dev->ubc_dev_srcu);
    50		if (ubc_dev == NULL || ubc_dev->ops == NULL || ubc_dev->ops->mmap == NULL) {
    51			uburma_log_err("can not find ubcore device.\n");
    52			ret = -ENODEV;
    53			goto out;
    54		}
    55	
    56		ret = ubc_dev->ops->mmap(file->ucontext, vma);
    57	
    58	out:
    59		srcu_read_unlock(&ubu_dev->ubc_dev_srcu, srcu_idx);
    60		uburma_cmd_dec(ubu_dev);
    61		return ret;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
