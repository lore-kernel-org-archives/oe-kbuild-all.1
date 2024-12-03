Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A42A8D0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 01:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733189614; cv=none; b=fB2pu0d88I9XgvENBNjmDuYDooeLnCTOxJy4nnDFzpoh1enWx0+Rk/OOQopzkJlRuGhpgL3Rx+UpYoYXM75mPI3vCs//la6R5tc3WbL+f37ICPd2S6cHnc3AsVYHF4E0C+Adq7R0CKXxeJPS0deJBV3ZxGlE1wqEYH+meVTDrxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733189614; c=relaxed/simple;
	bh=+gPxAGqN1tapjki5LFqh/GwVS4dQNqjBLsviGkBFwRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CpWGiwdDsTikrtXcKzZZysP37eqEs0r9soFxycyUKc6ElaHRx8sq8TSkMbkfIbM3aBUsiF85orkQEAC/0E5OZf3SBhNI6xb5OIUoLEZL3xFIVVEhRMP4vdV78Mht4cdpleWdUDy2xhld6L35cjUm0D3GNn+Vz7yxWXjyxFPvyn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dV43KHHB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dV43KHHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733189613; x=1764725613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gPxAGqN1tapjki5LFqh/GwVS4dQNqjBLsviGkBFwRw=;
  b=dV43KHHBGwN8totGPg8Efni7QZzO/Fdr4RMbnnliw6egkTazolMXBMyv
   HVlYp6m2ya/W8vJGrX/Wq/FXAgpqe510Lvsms1bOdOh1Qbv6TKHFCjkM5
   ChLnU9hGq3qMiX8KkplSBxhFjoRau01kH3/eQNN0X/+DRWOnYebhOYgmX
   vA+il2M2lY1KdV61dkL9RpcvBSRP9k4JQw1SYolR9yS48/nzR23Jq6O0g
   rwerVB7pNvE/ll1qqrgCUGAqcHlmRTXhsTuLffkwHh5eCQfEWGeMoCecV
   /16R86WYvMiHjGd5uR4XihpydIuxOQnXc8+A5BXccZufthvTf/gJGCbPV
   A==;
X-CSE-ConnectionGUID: ItZhRLjyQkilk7j5KuAHBg==
X-CSE-MsgGUID: MXAChzs7RVKzq8BJBmkG5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37321223"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="37321223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:33:33 -0800
X-CSE-ConnectionGUID: S6X0G0XMSTmFuagd2UISkw==
X-CSE-MsgGUID: m9ztgyr2S6i4b8651Z7FaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="116541108"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2024 17:33:31 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHn3-000382-1c;
	Tue, 03 Dec 2024 01:33:27 +0000
Date: Tue, 3 Dec 2024 09:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/uburma/uburma_dev_ops.c:32:5: warning: no previous prototype
 for 'uburma_mmap'
Message-ID: <202412030936.hofHSOhc-lkp@intel.com>
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
commit: 7d130c6018dbfd09c6e1c5d91b347fdbf3924321 [2516/2516] ub: add mmap ops support in ubcore and uburma
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030936.hofHSOhc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030936.hofHSOhc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030936.hofHSOhc-lkp@intel.com/

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
