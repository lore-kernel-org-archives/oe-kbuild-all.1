Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61318E57E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 03:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713842216; cv=none; b=Et3801mhgrkqCzfT2S0I3EVJn6XDTs5hVNeP+iQ81Jb2oN+JRK2yPcBUDdBd7p/Li1zzNtnCh/VqfsiyHtfEly4IVcP7ICBL5XnHUuDwsZhs813njPArZABFUrtkrMq2HhHV3bdLrQ0Klx87tdsugel1bwSWhAtsbmAytigacZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713842216; c=relaxed/simple;
	bh=cjZcDfZdB/fwHX+HBIgEjbUnlELNpWQFtHCE86WFlj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WhmA9jIM0D8XPW6n54b+t227jK5eCBvOe9QdQRG8v0/pIBwmf2zMqz7MPpY3JDVVXMu2LiprkRlcqfnIspea6VEQsW4P+YJjyy2szMjjioBXFORgjJTtTtZyuRWWYIcvJ8AZ2D4CLcbIDdBI8ysuaM3JMjk5OOQNeKzHcHOzWAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crMqNbpw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crMqNbpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713842214; x=1745378214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjZcDfZdB/fwHX+HBIgEjbUnlELNpWQFtHCE86WFlj0=;
  b=crMqNbpwdOpzFG9mQcsVm2utOrekf38d90t4MKXy+sXjNtnnxMeZNIEz
   C2XmYQTgLtSXkHpd+xLWMQtd7iXgV9jv7jE4HMIgmcluDJKZnv2z+uyLr
   lMfiLyBZOeaUovFcxPBx9uGS7jllVSYZpXRGDcBUl9VCEVFHLTMKrcZrO
   f14h5JL8HsT4P8MnZcB96nsy9/bMbeVYeWnG4D5gWHe/E83tpuq99+J4b
   dAjTIgoqBRRvLaiaLusob8lve5uWNKTt3DA5qAiPP7CYW/YZmcFKcj7WK
   Lvod1rqXuUoI+dMOVKrk6DIwN3I+pdgEmzeAFkzp9VP7DbXc75g9d5TGw
   g==;
X-CSE-ConnectionGUID: 8XLe0bRvS4qwsyy9XeMssg==
X-CSE-MsgGUID: KdHqMSFvQPWquLR8NIUsPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9580228"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9580228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 20:16:54 -0700
X-CSE-ConnectionGUID: ooKXQogPTHGhlXAbQd3Hkg==
X-CSE-MsgGUID: mcFAzfYdQ5miHrpU2hswpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24274795"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2024 20:16:53 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz6eI-0000Rc-2r;
	Tue, 23 Apr 2024 03:16:50 +0000
Date: Tue, 23 Apr 2024 11:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vivek-drm-tip:vfio_dmabuf_v1 7/7]
 drivers/vfio/pci/dma_buf.c:317:40: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202404231109.7NK4BRAU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/Vivek/drm-tip.git vfio_dmabuf_v1
head:   5ef225e951f7d39f11703af6060984e434c6dc4b
commit: 5ef225e951f7d39f11703af6060984e434c6dc4b [7/7] vfio/pci: Allow MMIO regions to be exported through dma-buf
config: x86_64-randconfig-123-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231109.7NK4BRAU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231109.7NK4BRAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231109.7NK4BRAU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/dma_buf.c:317:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   drivers/vfio/pci/dma_buf.c:317:40: sparse:     expected struct file [noderef] __rcu **f
   drivers/vfio/pci/dma_buf.c:317:40: sparse:     got struct file **
   drivers/vfio/pci/dma_buf.c:336:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   drivers/vfio/pci/dma_buf.c:336:40: sparse:     expected struct file [noderef] __rcu **f
   drivers/vfio/pci/dma_buf.c:336:40: sparse:     got struct file **

vim +317 drivers/vfio/pci/dma_buf.c

   308	
   309	void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
   310	{
   311		struct vfio_pci_dma_buf *priv;
   312		struct vfio_pci_dma_buf *tmp;
   313	
   314		lockdep_assert_held_write(&vdev->memory_lock);
   315	
   316		list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
 > 317			if (!get_file_rcu(&priv->dmabuf->file))
   318				continue;
   319			if (priv->revoked != revoked) {
   320				dma_resv_lock(priv->dmabuf->resv, NULL);
   321				priv->revoked = revoked;
   322				dma_buf_move_notify(priv->dmabuf);
   323				dma_resv_unlock(priv->dmabuf->resv);
   324			}
   325			dma_buf_put(priv->dmabuf);
   326		}
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
