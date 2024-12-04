Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562E20C49C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328141; cv=none; b=QaUapQGETfLgON+aMrxG64Hpl72649VZyVfoyfmXhvKXniTFz+FYYmPtAFARkZYf37cqVy70xPFYW8XaSWsaT1jxze6+BKhII/AXXfuB20L4fu05k9c4p4A5yheLpdNuuw9K3BlgYNgz3Sw5B2rMLyxsXsPMnz46jorFr2emKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328141; c=relaxed/simple;
	bh=BTbMv4QXPxF2fUPsDk9CFS0Ns4v8tVtlqj7mVhRhmV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juQvqJETYlNaXb6ZEE0N30SXdTPYQjuRpdxolUjhBhXGSeMPI8+ncKIshGLttyiDETjXqxJmL4EUA3hQKFPeVYlYrqEsvrkQ2f3m3CbezUcZYpwoILgvLGt9Vv82OaJPGBl+DgBxT/CIrkg23pl8XU0xprKiA02xrffogYk2IXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7C1xjBI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7C1xjBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733328140; x=1764864140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTbMv4QXPxF2fUPsDk9CFS0Ns4v8tVtlqj7mVhRhmV0=;
  b=d7C1xjBI56cfUEKaqVAU2lgsvtlvo3pyNNwAg3xVrQybbmtGpkmpxpmC
   0WAUwXEt9SIm/I/6T7w9CfraQWBcwmSPfAG+YHJdyKbSjRC8MAIQ9NMS8
   401//YO9yj3xUm28mCFUyrvJWA5gu4keeyAZ3zbcCCpFPjv7B4k2FHVhh
   lrmbX/2N/L0NhBY2Opu8SCca2L9CrT0DXutOm5Qw6fZRNnd8LaCVf/SWw
   NVspxA7NyHhto6SYSIHuE0dVnjpZaRpp776Br0lilvZbE7fCmzi4W5lwm
   S3jxquUx2YiDRRxuU8XiMYLEBP4Vxu+W+7AYq6L+bmbiZ8RddfJe2cpNX
   w==;
X-CSE-ConnectionGUID: wn1roGKfRn+3a4K/D4v1YQ==
X-CSE-MsgGUID: iuH37NFNTPWpuBrC8uXfWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44632329"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44632329"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 08:02:17 -0800
X-CSE-ConnectionGUID: bYDleqoxTgOZmmJb6iIObg==
X-CSE-MsgGUID: SjCi+Bb2S6eaBWd7dp4HBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98785138"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 08:02:16 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIrpN-0003EN-28;
	Wed, 04 Dec 2024 16:02:13 +0000
Date: Thu, 5 Dec 2024 00:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 3/3] drivers/iommu/iommufd/device.c:366:30:
 error: initialization of 'struct device *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202412042329.7spcJ8AZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   b17a3f31fb80cd096e5842d588a2adbc554c24ba
commit: b17a3f31fb80cd096e5842d588a2adbc554c24ba [3/3] iommufd: Implement sw_msi support natively
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241204/202412042329.7spcJ8AZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042329.7spcJ8AZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042329.7spcJ8AZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/device.c: In function 'iommufd_sw_msi':
   drivers/iommu/iommufd/device.c:366:30: error: implicit declaration of function 'msi_desc_to_dev' [-Wimplicit-function-declaration]
     366 |         struct device *dev = msi_desc_to_dev(desc);
         |                              ^~~~~~~~~~~~~~~
>> drivers/iommu/iommufd/device.c:366:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/iommu/iommufd/device.c:377:35: error: implicit declaration of function 'msi_desc_get_iommu_cookie' [-Wimplicit-function-declaration]
     377 |                 iova = (uintptr_t)msi_desc_get_iommu_cookie(desc);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/device.c:381:20: error: invalid use of undefined type 'struct msi_msg'
     381 |                 msg->address_hi = upper_32_bits(iova);
         |                    ^~
   drivers/iommu/iommufd/device.c:382:20: error: invalid use of undefined type 'struct msi_msg'
     382 |                 msg->address_lo = lower_32_bits(iova) |
         |                    ^~
   drivers/iommu/iommufd/device.c:383:39: error: invalid use of undefined type 'struct msi_msg'
     383 |                                   (msg->address_lo % PAGE_SIZE);
         |                                       ^~
   drivers/iommu/iommufd/device.c:412:9: error: implicit declaration of function 'msi_desc_set_iommu_cookie' [-Wimplicit-function-declaration]
     412 |         msi_desc_set_iommu_cookie(desc, (void *)(uintptr_t)iova);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +366 drivers/iommu/iommufd/device.c

   356	
   357	/*
   358	 * Called by the irq code if the platform translates the MSI address through the
   359	 * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
   360	 * allocate a fd global iova for the physical page that is the same on all
   361	 * domains and devices.
   362	 */
   363	int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
   364			   phys_addr_t msi_addr, struct msi_msg *msg)
   365	{
 > 366		struct device *dev = msi_desc_to_dev(desc);
   367		struct iommu_attach_handle *raw_handle;
   368		struct iommufd_hwpt_paging *hwpt_paging;
   369		struct iommufd_attach_handle *handle;
   370		struct iommufd_sw_msi_map *msi_map;
   371		struct iommufd_ctx *ictx;
   372		unsigned long iova;
   373		int ret;
   374	
   375		/* Compose an already prepared mapping */
   376		if (msg) {
   377			iova = (uintptr_t)msi_desc_get_iommu_cookie(desc);
   378			if (WARN_ON(!iova))
   379				return 0;
   380	
   381			msg->address_hi = upper_32_bits(iova);
   382			msg->address_lo = lower_32_bits(iova) |
   383					  (msg->address_lo % PAGE_SIZE);
   384			return 0;
   385		}
   386	
   387		/* FIXME: We need to make an attach_handle, and fault_data always not just for fault */
   388		raw_handle =
   389			iommu_attach_handle_get(dev->iommu_group, IOMMU_NO_PASID, 0);
   390		if (!raw_handle)
   391			return 0;
   392		hwpt_paging = domain->fault_data;
   393	
   394		handle = to_iommufd_handle(raw_handle);
   395		/* No IOMMU_RESV_SW_MSI means no change to the msi_msg */
   396		if (handle->idev->igroup->sw_msi_start == PHYS_ADDR_MAX)
   397			return 0;
   398	
   399		ictx = handle->idev->ictx;
   400		guard(mutex)(&ictx->sw_msi_lock);
   401		msi_map = iommufd_sw_msi_get_map(handle->idev->ictx, msi_addr,
   402						 handle->idev->igroup->sw_msi_start);
   403		if (IS_ERR(msi_map))
   404			return PTR_ERR(msi_map);
   405	
   406		ret = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
   407		if (ret)
   408			return ret;
   409		set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);
   410	
   411		iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
   412		msi_desc_set_iommu_cookie(desc, (void *)(uintptr_t)iova);
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
