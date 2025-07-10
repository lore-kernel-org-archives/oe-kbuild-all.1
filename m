Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33935383
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752126921; cv=none; b=LIGizb8oD5+tA4p9vGX14nvYxSNze7rXgyOBbW7O7BxC8XebV9SCrLPY5q/5+PrhjAKfEn+VhogapLk0uRqv3K5vGTvV5Pk3BU6DG7mP4zUy/vbhpmv+T0/FleOGWwbfPLiDIVtg9hh/YHk+/hPGZ8L/vmkAhl04+t3DGbBN0HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752126921; c=relaxed/simple;
	bh=VZRle5fT15DA2cJLD4dtJ7iVcZVne6IWQy7VTgxvCsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5Ysj4Ay+K3THPWXHlNMFhrLGSDWvS8dyeQM5zXcfH+vy8nnJItiONA8hWyXW9/lsvgXBTYdx0XH+uV70S/VbnOcXJyghRxZotKVKSbMjIRtU2Ps46JvKK7TIGRP8a3OpR3SjMlMEUbl4oQuQF6Y7OLJd4My7E8Q8WLyQ6ETbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3eVgDt2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3eVgDt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752126919; x=1783662919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZRle5fT15DA2cJLD4dtJ7iVcZVne6IWQy7VTgxvCsc=;
  b=d3eVgDt2YbzF+1qVZAtaNfem9o95M/cLLq8PB2vaXYqPvNFd7EwngB3V
   XMECWpPwaCcO/cXTnDHK0ReKlb/K4YQJvdzb+NGzdITlyfQzmW5W9JA/D
   q7ugUvu4l7K6HTpNKCU5ATW+jzUGnnY+JGMt1wB+xm2Mw3Rz1Zfd3cfQB
   gsIjMFaglELT16baTF/a4e358DL4eMhe6t4qgAsIpdWosEKa3A+dl3rWi
   iUsKWBvI2UyMOvOAx9fQ1lzCub42iPTy4w/cu/BGmKWZsZTGGUJ9OusvG
   qAiHJKblm3fzICUoIw+9xEqj3PECXl6uyqbUjE0i0aYEMSqB0xx+tjxsS
   w==;
X-CSE-ConnectionGUID: PNxlg1ALQo2KlPmKNvfBQA==
X-CSE-MsgGUID: L7J15uCCSt+Jbl0Sp+ukWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="76940620"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="76940620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 22:55:18 -0700
X-CSE-ConnectionGUID: qADJV0XTRsaJQnK6PCi3gA==
X-CSE-MsgGUID: RbiL0eihSRyvdq25Qi/FCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="161639493"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jul 2025 22:55:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZkFW-0004XP-2Q;
	Thu, 10 Jul 2025 05:55:14 +0000
Date: Thu, 10 Jul 2025 13:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [leon-rdma:dmabuf-vfio 16/16]
 drivers/vfio/pci/vfio_pci_dmabuf.c:315:40: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202507101337.KvPciEaK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   76398694a39d0be3b1e8a107e4dd025cfd1448fd
commit: 76398694a39d0be3b1e8a107e4dd025cfd1448fd [16/16] vfio/pci: Allow MMIO regions to be exported through dma-buf
config: parisc-randconfig-r122-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101337.KvPciEaK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250710/202507101337.KvPciEaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101337.KvPciEaK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/vfio_pci_dmabuf.c:315:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   drivers/vfio/pci/vfio_pci_dmabuf.c:315:40: sparse:     expected struct file [noderef] __rcu **f
   drivers/vfio/pci/vfio_pci_dmabuf.c:315:40: sparse:     got struct file **
   drivers/vfio/pci/vfio_pci_dmabuf.c:335:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   drivers/vfio/pci/vfio_pci_dmabuf.c:335:40: sparse:     expected struct file [noderef] __rcu **f
   drivers/vfio/pci/vfio_pci_dmabuf.c:335:40: sparse:     got struct file **

vim +315 drivers/vfio/pci/vfio_pci_dmabuf.c

   300	
   301	void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
   302	{
   303		struct vfio_pci_dma_buf *priv;
   304		struct vfio_pci_dma_buf *tmp;
   305	
   306		lockdep_assert_held_write(&vdev->memory_lock);
   307	
   308		list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
   309			/*
   310			 * Returns true if a reference was successfully obtained.
   311			 * The caller must interlock with the dmabuf's release
   312			 * function in some way, such as RCU, to ensure that this
   313			 * is not called on freed memory.
   314			 */
 > 315			if (!get_file_rcu(&priv->dmabuf->file))
   316				continue;
   317	
   318			if (priv->revoked != revoked) {
   319				dma_resv_lock(priv->dmabuf->resv, NULL);
   320				priv->revoked = revoked;
   321				dma_buf_move_notify(priv->dmabuf);
   322				dma_resv_unlock(priv->dmabuf->resv);
   323			}
   324			dma_buf_put(priv->dmabuf);
   325		}
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
