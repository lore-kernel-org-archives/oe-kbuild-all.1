Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8672E9EDA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 03:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546862; cv=none; b=ncGn08hRjyg224vqreqSDAXYDpkgBJ7MrhFJFeoG1677pYh4drlPaw19EQh5vzLlYe7D5ilhrFKyfgnfy3IcZx40u5cs0Vnq6mLmKEljynNof+EXKn/GRjNwKZ9qINX1jfqMEu4gxyuR9D7VGAZv9uqpqet4CaMcw2cbxfP4i/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546862; c=relaxed/simple;
	bh=++6OIyeAiqtOA4o71irTzZsHHRWPkJJxib8qN6tNsMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EZ04kTx+enFXXswx5yrDrJY7H8PzCMy3+s5P1hEjKHiZp23Owa3zBqGj7UwFYAD4IpB/4kxeqMzUXunnAyBgLKh3SkMyPoYHiVbp2ExZgxpDOGOrzhtRHFLzkgIYSZ11qVauZjAZF1z99e66IjGYR1Gy8Kio/L3ONCSQhmjisLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xa0TIaAN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xa0TIaAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766546860; x=1798082860;
  h=date:from:to:cc:subject:message-id;
  bh=++6OIyeAiqtOA4o71irTzZsHHRWPkJJxib8qN6tNsMY=;
  b=Xa0TIaANUBH9f7QcxQ4DqSJCQ5XjFk3W39VP+8xd9ddrZSg/54nt3tFQ
   fwx3O3HkPf7w2vpMa/G8OykFip//G+v3oTW6UYyRPpW89rOZC1Zw+Rrt0
   oI3x54OY8JzsSDkL7yWzBUBJpKyovN1pn5uIe/v9pgxT1aeovJTQYXqVI
   VjrC4vFeMOiysAsdLhhUJtBWt0SUYDTaDc+2l2v7VJGG9uWbrn24lkS38
   Vo0nMg+lcFiJVS+6kEYcnPQ9Mz7+sTO+plPos4ld8XR/kQvyDyZV+wc9V
   q5DpXVjaxGS995o8GR0U4mETEiQT5JeC2MfquyxZU7cgcXvBggHZK3RV1
   w==;
X-CSE-ConnectionGUID: iA7LXJGzT3amA+GUgXyHWg==
X-CSE-MsgGUID: o/ucfGlTTWipBwRkQhEVow==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="67585960"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="67585960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 19:27:38 -0800
X-CSE-ConnectionGUID: B7ErNpeKTsatXaDTARsmkw==
X-CSE-MsgGUID: u2S+4JnXQKu3V/mIuklHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="204993892"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2025 19:27:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYFXC-000000002d9-3GJZ;
	Wed, 24 Dec 2025 03:27:34 +0000
Date: Wed, 24 Dec 2025 11:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-revoke-v1 22/22]
 drivers/iommu/iommufd/selftest.c:2056:38: warning: variable 'priv' set but
 not used
Message-ID: <202512241134.suNLfOUI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-revoke-v1
head:   aabf78c22b38ad7fb45937e47fd9c97f7dc7b592
commit: aabf78c22b38ad7fb45937e47fd9c97f7dc7b592 [22/22] iommufd/selftest: Reuse dma-buf revoke semantics
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20251224/202512241134.suNLfOUI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241134.suNLfOUI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241134.suNLfOUI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/selftest.c: In function 'iommufd_test_dmabuf_revoke':
>> drivers/iommu/iommufd/selftest.c:2056:38: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
    2056 |         struct iommufd_test_dma_buf *priv;
         |                                      ^~~~


vim +/priv +2056 drivers/iommu/iommufd/selftest.c

d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2052  
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2053  static int iommufd_test_dmabuf_revoke(struct iommufd_ucmd *ucmd, int fd,
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2054  				      bool revoked)
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2055  {
d2041f1f11dd99 Jason Gunthorpe 2025-11-21 @2056  	struct iommufd_test_dma_buf *priv;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2057  	struct dma_buf *dmabuf;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2058  	int rc = 0;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2059  
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2060  	dmabuf = dma_buf_get(fd);
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2061  	if (IS_ERR(dmabuf))
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2062  		return PTR_ERR(dmabuf);
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2063  
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2064  	if (dmabuf->ops != &iommufd_test_dmabuf_ops) {
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2065  		rc = -EOPNOTSUPP;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2066  		goto err_put;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2067  	}
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2068  
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2069  	priv = dmabuf->priv;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2070  	dma_resv_lock(dmabuf->resv, NULL);
aabf78c22b38ad Leon Romanovsky 2025-12-23  2071  	if (revoked)
aabf78c22b38ad Leon Romanovsky 2025-12-23  2072  		dma_buf_invalidate(dmabuf);
aabf78c22b38ad Leon Romanovsky 2025-12-23  2073  	else
aabf78c22b38ad Leon Romanovsky 2025-12-23  2074  		dma_buf_mark_valid(dmabuf);
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2075  	dma_resv_unlock(dmabuf->resv);
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2076  
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2077  err_put:
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2078  	dma_buf_put(dmabuf);
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2079  	return rc;
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2080  }
d2041f1f11dd99 Jason Gunthorpe 2025-11-21  2081  

:::::: The code at line 2056 was first introduced by commit
:::::: d2041f1f11dd99076010841a86c4d02d04650814 iommufd/selftest: Add some tests for the dmabuf flow

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
