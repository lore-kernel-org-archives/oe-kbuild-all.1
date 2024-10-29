Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805410E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730211728; cv=none; b=QUH+mA/fAoOG9m+GADcVb7fRVF1VZ9fno1l9tjBBd21+WO4tUIeKeWeIF7PldbsQKKjWFcaO7r/JKXiB1JZkFE0NiGtXOj4DxjARnDom1Qub7MwgqAElLSU6Z8Bh8lr/rdrpWx5+UNqpI9WDtX/cH1SyVWI0iRvFU+AvZHa28fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730211728; c=relaxed/simple;
	bh=tWBAT+Xqjs6O5Et/u84aFwL6Qnh6+l94NL4vhnorswA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxl9rU3kIAmxKctp1GTvzgy6ZYbCEe1yRoFMjBYaNczStdWfCT4EbUEKkARFXiX4celpcy6PXcAZqqFVCJtINVVk7KigiDCfnSESim559p3MdIb6+Xj2OqvnoxTW1a6+HOV0K0+NSIKnLHUfP29UcLf11y4+pGpU9+dX1AcjC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ev/zw+8r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ev/zw+8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730211726; x=1761747726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tWBAT+Xqjs6O5Et/u84aFwL6Qnh6+l94NL4vhnorswA=;
  b=Ev/zw+8roMhQ9aYA49GUGRr1R26n7aO8ISn2LZTKuGIaX6kgWp/XsTU5
   jnF/W3oTTVjyWL8yVi+2gTIKpd/KHmfO3Ege5woa/xuKyzZ4yHCngon6+
   hQ9ALYmuN7D4WKkgN3sErPFv9dplzXYk9U4nxk75LajXKXia8Jndu8cnf
   8WpOutREfP5dsx/LlR9SHO4h/EaSwAldKE+8d2rgeEXLX+i+2Gj6FdPT+
   PGxHcz6WU1tvPrvKujbeolrAJtyT5RybBkrJt2vgCU+hncrrUO1yHXZ3b
   w3jST8gUoRHJBu8L3mrRnH7kRxKcbKjHizwbL/LBhhjdt/Qvf2Yc3iLPg
   Q==;
X-CSE-ConnectionGUID: I7g7zzkUTnSyiTInfm1tFw==
X-CSE-MsgGUID: HcogUK55T7GZukQN4X17aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30064395"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="30064395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 07:22:05 -0700
X-CSE-ConnectionGUID: YtnGgNEhRFapAo3I/fOCiA==
X-CSE-MsgGUID: vuaQZsj9QY++tpyh3VVc9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="105305979"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2024 07:22:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5n6g-000dlG-1j;
	Tue, 29 Oct 2024 14:22:02 +0000
Date: Tue, 29 Oct 2024 22:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18678/30000]
 drivers/ub/urma/uburma/uburma_dev_ops.c:32:5: warning: no previous prototype
 for 'uburma_mmap'
Message-ID: <202410292243.lj3Xa1zr-lkp@intel.com>
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
head:   ffc5791ca9102a55d29c6dea26de38d32f052b01
commit: 7d130c6018dbfd09c6e1c5d91b347fdbf3924321 [18678/30000] ub: add mmap ops support in ubcore and uburma
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292243.lj3Xa1zr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292243.lj3Xa1zr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292243.lj3Xa1zr-lkp@intel.com/

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
