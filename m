Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA12ED16D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804133; cv=none; b=rq5dKpmW7dwsqGJty98LXFXN/2ThsNHpJdbaqU9tUqr+YWZ6U2sZSEZKQoiQaiVRAvTBqTABH966r3J4hQdSMSUeAQrVUsn0JOBcami6tnoYrXnYYCfY0iFPcjS3sP7i6pSGiQB4bii7x59zv6EEBKXT9NGPC99DZJAn0/p6IWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804133; c=relaxed/simple;
	bh=EoJmXN2iZ/aXoGe3Lu7OUN64DYG7G1rAEy9DCvtufr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=akeAeFvN9IPj7T3us+i7VO4XpBxwhQ9QZBxWQOcHNGS6WA7+NDDXcVty4rWlpMeaqCPnxjMoAMYrLijT8RcpflqEwgxzVpIGIhZ9/vL+QJ/6TkgYC9fxjTTM68lSTBBsBZpi98wR6qViC23OVNjpQQ/ozzSt7axzkUzgRUSW1B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EypiTHcT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EypiTHcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769804132; x=1801340132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoJmXN2iZ/aXoGe3Lu7OUN64DYG7G1rAEy9DCvtufr4=;
  b=EypiTHcTu3N3LGqC9bsE3xogb3byri7C+auyRAXHc+W82NtcR3aRpcYQ
   VwakzmI3OTqo9WMKHe80l+aHyVtx1TeSEk4bscQoYNmuN2wUqT5dWWbci
   j8HihFv4RkG5Y+vK4iCLOsl8YnZgmvY2thM5mEhE0GtsST30uDsvj5MzU
   AH33jb539MbVs/E089Bfizh4rz1nxCQeasp0mrtbmSSBzgvUP4F4C/2PW
   2X7NrmhriHTzSnE/VkZ2a00VN8GfpZ5A/eV1q9iBpjr53fiHnOhpQbxqL
   E9JmAcwHlZcmYdX/exL948JX6ZiTEgpJlaOFYNAeMAnHoPBq8w3OXTYX4
   A==;
X-CSE-ConnectionGUID: shWRSBkqQfCvUWm/+qRkKQ==
X-CSE-MsgGUID: +AW7zRblTuipXQhI+j32Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88477191"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="88477191"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 12:15:31 -0800
X-CSE-ConnectionGUID: q/oEI/K5SVuIlFJBmzb59w==
X-CSE-MsgGUID: q2UQB6K3Qp2u9Djb9lR3iQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 12:15:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlutr-00000000dKS-0xdX;
	Fri, 30 Jan 2026 20:15:27 +0000
Date: Sat, 31 Jan 2026 04:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex@shazbot.org>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: [leon-rdma:dmabuf-revoke-v7 9/10]
 drivers/vfio/pci/vfio_pci_dmabuf.c:344:31: warning: unused variable 'wait'
Message-ID: <202601310416.b7okgiIP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-revoke-v7
head:   ec05a8f8037a95ae4080863e79f68dea0e6fbe0b
commit: 29f7617562d4dfd10f0487facde8c8d16a71f8f3 [9/10] vfio: Permit VFIO to work with pinned importers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260131/202601310416.b7okgiIP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310416.b7okgiIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310416.b7okgiIP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_dmabuf.c: In function 'vfio_pci_dma_buf_move':
>> drivers/vfio/pci/vfio_pci_dmabuf.c:344:31: warning: unused variable 'wait' [-Wunused-variable]
     344 |                 unsigned long wait;
         |                               ^~~~
   drivers/vfio/pci/vfio_pci_dmabuf.c: In function 'vfio_pci_dma_buf_cleanup':
   drivers/vfio/pci/vfio_pci_dmabuf.c:390:31: warning: unused variable 'wait' [-Wunused-variable]
     390 |                 unsigned long wait;
         |                               ^~~~


vim +/wait +344 drivers/vfio/pci/vfio_pci_dmabuf.c

5d74781ebc86c5 Leon Romanovsky 2025-11-20  335  
5d74781ebc86c5 Leon Romanovsky 2025-11-20  336  void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
5d74781ebc86c5 Leon Romanovsky 2025-11-20  337  {
5d74781ebc86c5 Leon Romanovsky 2025-11-20  338  	struct vfio_pci_dma_buf *priv;
5d74781ebc86c5 Leon Romanovsky 2025-11-20  339  	struct vfio_pci_dma_buf *tmp;
5d74781ebc86c5 Leon Romanovsky 2025-11-20  340  
5d74781ebc86c5 Leon Romanovsky 2025-11-20  341  	lockdep_assert_held_write(&vdev->memory_lock);
5d74781ebc86c5 Leon Romanovsky 2025-11-20  342  
5d74781ebc86c5 Leon Romanovsky 2025-11-20  343  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
4592582c95df50 Leon Romanovsky 2026-01-19 @344  		unsigned long wait;
4592582c95df50 Leon Romanovsky 2026-01-19  345  
5d74781ebc86c5 Leon Romanovsky 2025-11-20  346  		if (!get_file_active(&priv->dmabuf->file))
5d74781ebc86c5 Leon Romanovsky 2025-11-20  347  			continue;
5d74781ebc86c5 Leon Romanovsky 2025-11-20  348  
5d74781ebc86c5 Leon Romanovsky 2025-11-20  349  		if (priv->revoked != revoked) {
5d74781ebc86c5 Leon Romanovsky 2025-11-20  350  			dma_resv_lock(priv->dmabuf->resv, NULL);
29f7617562d4df Leon Romanovsky 2026-01-14  351  			if (revoked)
29f7617562d4df Leon Romanovsky 2026-01-14  352  				priv->revoked = true;
fc81bff4b62ad8 Leon Romanovsky 2026-01-21  353  			dma_buf_invalidate_mappings(priv->dmabuf);
4592582c95df50 Leon Romanovsky 2026-01-19  354  			dma_resv_wait_timeout(priv->dmabuf->resv,
4592582c95df50 Leon Romanovsky 2026-01-19  355  					      DMA_RESV_USAGE_BOOKKEEP, false,
4592582c95df50 Leon Romanovsky 2026-01-19  356  					      MAX_SCHEDULE_TIMEOUT);
5d74781ebc86c5 Leon Romanovsky 2025-11-20  357  			dma_resv_unlock(priv->dmabuf->resv);
4592582c95df50 Leon Romanovsky 2026-01-19  358  			if (revoked) {
4592582c95df50 Leon Romanovsky 2026-01-19  359  				kref_put(&priv->kref, vfio_pci_dma_buf_done);
29f7617562d4df Leon Romanovsky 2026-01-14  360  				wait_for_completion(&priv->comp);
4592582c95df50 Leon Romanovsky 2026-01-19  361  			} else {
4592582c95df50 Leon Romanovsky 2026-01-19  362  				/*
4592582c95df50 Leon Romanovsky 2026-01-19  363  				 * Kref is initialize again, because when revoke
4592582c95df50 Leon Romanovsky 2026-01-19  364  				 * was performed the reference counter was decreased
4592582c95df50 Leon Romanovsky 2026-01-19  365  				 * to zero to trigger completion.
4592582c95df50 Leon Romanovsky 2026-01-19  366  				 */
4592582c95df50 Leon Romanovsky 2026-01-19  367  				kref_init(&priv->kref);
4592582c95df50 Leon Romanovsky 2026-01-19  368  				/*
4592582c95df50 Leon Romanovsky 2026-01-19  369  				 * There is no need to wait as no mapping was
4592582c95df50 Leon Romanovsky 2026-01-19  370  				 * performed when the previous status was
4592582c95df50 Leon Romanovsky 2026-01-19  371  				 * priv->revoked == true.
4592582c95df50 Leon Romanovsky 2026-01-19  372  				 */
4592582c95df50 Leon Romanovsky 2026-01-19  373  				reinit_completion(&priv->comp);
29f7617562d4df Leon Romanovsky 2026-01-14  374  				dma_resv_lock(priv->dmabuf->resv, NULL);
29f7617562d4df Leon Romanovsky 2026-01-14  375  				priv->revoked = false;
29f7617562d4df Leon Romanovsky 2026-01-14  376  				dma_resv_unlock(priv->dmabuf->resv);
4592582c95df50 Leon Romanovsky 2026-01-19  377  			}
5d74781ebc86c5 Leon Romanovsky 2025-11-20  378  		}
5d74781ebc86c5 Leon Romanovsky 2025-11-20  379  		fput(priv->dmabuf->file);
5d74781ebc86c5 Leon Romanovsky 2025-11-20  380  	}
5d74781ebc86c5 Leon Romanovsky 2025-11-20  381  }
5d74781ebc86c5 Leon Romanovsky 2025-11-20  382  

:::::: The code at line 344 was first introduced by commit
:::::: 4592582c95df50f1252f96a40d1fd8b16fb99d21 vfio: Wait for dma-buf invalidation to complete

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leonro@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
