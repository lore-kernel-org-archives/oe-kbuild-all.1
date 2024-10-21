Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB01F9401
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 20:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543132; cv=none; b=O7pcarMsWrXuH6T1U6jdvJxupCiQ+c9UQMyZ8XZLeMs1CETnTd2cz9PJh+OMSWO2dS5ZDDYrLuUM4JgyGkQgEA5bv8gnxqC9twZp5Bs7GQYItCd/D4zYQOjBMHzL370T1/svQUT/dI0aawnPNTQ6dGetbbRemxIF1LfZwzEllac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543132; c=relaxed/simple;
	bh=auoAbHeAbQJMZHoNLfXSH0TzYjqMTjFU43W91SZdkUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZ1pg0Yge6grvLUvsK/xnev67jpF+ntGg2tgZUb70Koa9rLCpQqdFHFfG8LejyZu43RUYSMd42IBXOaHYbGBoc5nF7nA5TWA/3DhMPQcUN22auDjyS6MgqV2+QnUq/FFI74nuKyec7LcBKIe395omieZcGyAuBoCz/pKzhP8h7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGelqnlZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGelqnlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729543131; x=1761079131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=auoAbHeAbQJMZHoNLfXSH0TzYjqMTjFU43W91SZdkUM=;
  b=oGelqnlZkI1yvDr3eZW6Lu14v5IPFGR1UQm25AP9gJk61e4DaUULtBew
   rGy60oAgR4HBvfEBslnxQTs9338zaT1xceM2quTQAFHQb9wETrtOP4Pov
   dx78LBj+Lo5aEExAd+HRKrdWcV/mDgFaVA+24wF1hUGQGq18J06ZanrHK
   ybEjfd4MC03iECJ4ZdcbjFUYWzol0PMtZDXrB0564dV3mBljjKtZIWHET
   gt8tpyL4KOMq7xj3Hs6Bl6gJxJ60DJ9rMhflNJttiY40UCIwYAF0h2sfl
   x9ZKyMTtXWq606uY8H3zCs93DqE1FzF49rl5uFqupsNeRQ3PFIPMvktFe
   Q==;
X-CSE-ConnectionGUID: p/+0rt0KRZWNGf3ZQXyaKQ==
X-CSE-MsgGUID: AP9OwyrtTDq4Lxyz1JLZWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="46538294"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="46538294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 13:38:50 -0700
X-CSE-ConnectionGUID: JimCOEFRQiCKB9eio24BkA==
X-CSE-MsgGUID: jlfB6x3ZTw2ETwdZvJ+JLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84245659"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2024 13:38:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2zAr-000Scs-00;
	Mon, 21 Oct 2024 20:38:45 +0000
Date: Tue, 22 Oct 2024 04:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1806/2444]
 drivers/vfio/pci/vfio_pci_core.c:267:5: warning: no previous prototype for
 'vfio_pci_iommu_dev_fault_handler'
Message-ID: <202410220422.bfZ1xxed-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: d2073c40368fe63e37a196df6f9b0a2952d90ce6 [1806/2444] vfio/pci: Register an iommu fault handler
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241022/202410220422.bfZ1xxed-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220422.bfZ1xxed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220422.bfZ1xxed-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_core.c:267:5: warning: no previous prototype for 'vfio_pci_iommu_dev_fault_handler' [-Wmissing-prototypes]
     267 | int vfio_pci_iommu_dev_fault_handler(struct iommu_fault *fault, void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vfio_pci_iommu_dev_fault_handler +267 drivers/vfio/pci/vfio_pci_core.c

   266	
 > 267	int vfio_pci_iommu_dev_fault_handler(struct iommu_fault *fault, void *data)
   268	{
   269		struct vfio_pci_core_device *vdev = (struct vfio_pci_core_device *)data;
   270		struct vfio_region_dma_fault *reg =
   271			(struct vfio_region_dma_fault *)vdev->fault_pages;
   272		struct iommu_fault *new;
   273		int head, tail, size;
   274		int ret = 0;
   275	
   276		if (WARN_ON(!reg))
   277			return -ENOENT;
   278	
   279		new = (struct iommu_fault *)(vdev->fault_pages + reg->offset +
   280					     reg->head * reg->entry_size);
   281	
   282		if (fault->type != IOMMU_FAULT_DMA_UNRECOV)
   283			return -ENOENT;
   284	
   285		mutex_lock(&vdev->fault_queue_lock);
   286	
   287		head = reg->head;
   288		tail = reg->tail;
   289		size = reg->nb_entries;
   290	
   291		if (CIRC_SPACE(head, tail, size) < 1) {
   292			ret = -ENOSPC;
   293			goto unlock;
   294		}
   295	
   296		*new = *fault;
   297		reg->head = (head + 1) % size;
   298	unlock:
   299		mutex_unlock(&vdev->fault_queue_lock);
   300		return ret;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
