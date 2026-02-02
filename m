Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E2214813
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770075933; cv=none; b=qx/YJVrz9ipFdeogMmJr2EHamiM0BHIHOzRzK3CF0J0E0AfF4DuHxBf6l9t7kQ0QFStCkk60lZwYKimfMh6+l/gVKBhuSsyPU7gm/KGZTzoSNHW6EIuhwAIYLFw1gpTDam4qCoN5gPohjBw2tuGP0I1gQyQ6y87LoBGJLDUH5YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770075933; c=relaxed/simple;
	bh=SWUlxPD8uedD9YBryzKZPEgBde+5lyQJZ9R2I6Q8cfk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R0ussc2u3yY+ywstasFJA5Rbg2Ef0hH4xxdPcqM5i2gBqjo2rBDh4/mMF/fY4KlFGUjtUu+rO2ywv9kZ2XShWdTZZ8Uwb/TIk/bRoFksLSj5wWRXJ/9sW2LC0XdZeKc7oMG1wrxpmUN6N1eEIRZNQwqBgZQICA55LLb3RXOgoXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RX0wgbIg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RX0wgbIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770075931; x=1801611931;
  h=date:from:to:cc:subject:message-id;
  bh=SWUlxPD8uedD9YBryzKZPEgBde+5lyQJZ9R2I6Q8cfk=;
  b=RX0wgbIgheCzZF7kM24kquhkmja5iEIjZFw9ZwFbT28Olo9dMvgOYLS1
   6SS3myXY6JRUis6dk4gqVavojnoMyUJuX0MFmhuAzyzB/IdcOQIEDWf2Q
   3xRzMAu/cXCXd04IfLZmEjAbs0Q+J3VVIAMsJnhtxmMwCS1kQKqOv2fvm
   ekciHRovrVx7Bkxeo6Y2IKbSA5drVkJaAbOjYHc6530V9INx6XWHkYt8E
   IqzbuXxT9WxlahLNDNNyFKOZRXM9b6+A/s7aZI1f2dqTBHNnqTXmZQ1F1
   /+YLPlRUdGioXpd366ISNVIf1ALnKRaRU7zLovgp/kIqWcGM/xW5Sr2eG
   Q==;
X-CSE-ConnectionGUID: qhO0facqQAulftn/qHYrUg==
X-CSE-MsgGUID: JoZH8Ag5RYONGRNkzyrzMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71142440"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71142440"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 15:45:30 -0800
X-CSE-ConnectionGUID: ilEfBjeYR3OMkdzG4Qnv3A==
X-CSE-MsgGUID: JqxRIWyiSLWdehvygnaEnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="240722930"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Feb 2026 15:45:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn3bi-00000000g3E-3ZYa;
	Mon, 02 Feb 2026 23:45:26 +0000
Date: Tue, 03 Feb 2026 07:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 5/6]
 drivers/iommu/iommufd/io_pagetable.c:855:23: warning: variable 'area_iova'
 set but not used
Message-ID: <202602030758.hZavVdX9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   5259d5e34eb7da1c96802e79113ccca538730d5e
commit: ca213f193f2c2aa9b43a653bc6466e1216f6e767 [5/6] iommufd: Add an ioctl IOMMU_IOAS_GET_PA to query PA from IOVA
config: parisc-randconfig-001-20260203 (https://download.01.org/0day-ci/archive/20260203/202602030758.hZavVdX9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030758.hZavVdX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030758.hZavVdX9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/io_pagetable.c: In function 'iopt_get_phys':
>> drivers/iommu/iommufd/io_pagetable.c:855:23: warning: variable 'area_iova' set but not used [-Wunused-but-set-variable]
     855 |         unsigned long area_iova;
         |                       ^~~~~~~~~


vim +/area_iova +855 drivers/iommu/iommufd/io_pagetable.c

   851	
   852	int iopt_get_phys(struct io_pagetable *iopt, unsigned long iova, u64 *paddr,
   853			  u64 *length)
   854	{
 > 855		unsigned long area_iova;
   856		struct iopt_area *area;
   857		int rc = 0;
   858	
   859		if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU))
   860			return -EOPNOTSUPP;
   861	
   862		down_read(&iopt->iova_rwsem);
   863		area = iopt_area_iter_first(iopt, iova, iova);
   864		if (!area || !area->pages) {
   865			rc = -ENOENT;
   866			goto unlock_exit;
   867		}
   868	
   869		if (!area->storage_domain ||
   870		    area->storage_domain->owner != &iommufd_noiommu_ops) {
   871			rc = -EOPNOTSUPP;
   872			goto unlock_exit;
   873		}
   874	
   875		area_iova = iopt_area_iova(area);
   876		*paddr = iommu_iova_to_phys(area->storage_domain, iova);
   877		if (!*paddr) {
   878			rc = -EINVAL;
   879			goto unlock_exit;
   880		}
   881		/*
   882		 * TBD: we can return contiguous IOVA length so that userspace can
   883		 * keep searching for next physical address.
   884		 */
   885		*length = PAGE_SIZE;
   886	
   887	unlock_exit:
   888		up_read(&iopt->iova_rwsem);
   889	
   890		return rc;
   891	}
   892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
