Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C453B1BD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081648; cv=none; b=MY9o8Paee5nyzBs0j9xoHLzbtBqyA+VuJLcJvVPI7if/l+15l0PTFm72RxUIDQLoz6/Ya4GsVdzi+f6SNhnmE29D68t7FAmy2oU5Q4RdFY7q5UbskO8/NG9oQgN1HSRGBzoudNWVn9DqUQB2k+voYvAAb46/XuyLjTOEaq+/wsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081648; c=relaxed/simple;
	bh=oc2LTeX1fYJSOgdqCJ+v4RwLUsHhb1atRqAhTsK5aaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LIAB2YHDmhkgLFuKbGBOG+oHenDOvSgFHt8h+vYKSTMB6DZX0Wx/USLNLFq9jZEo4XSseJsG6n6GCfA9FY/nzWNhfm4/Eq8/sqfqVbj5x8wCZtmpeob2ShAOn7shBxBdjRYOMaZOfTKsRuy34IUKbbCUy7vI0nYrzHqfvHwRhrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbWANKce; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbWANKce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770081646; x=1801617646;
  h=date:from:to:cc:subject:message-id;
  bh=oc2LTeX1fYJSOgdqCJ+v4RwLUsHhb1atRqAhTsK5aaM=;
  b=XbWANKcecaynNpD+uMf4W/W920aWfyvt6+oM+1Jv0VlmQdNK9SUhORPG
   832z8nhETY4DmMBDHxcp0rNyr402PBv8rjDPV0Hr5m5KMGskPgVrVUMRy
   lUsRpAEFK6fgEH35pSbON8F2e1q7TukvPrh4Wm/1Ehd2RFtKMqAQEIaC0
   1wxjevjXmH5gnblWmm+zFKy2VDFsDfnLDPjibeeNT2Kg7kCj1vTPIi1Ob
   gLnx7c+AfDMx7wKEfG8Lh2THTUwTOYNRi0OYXqWDLJCJl34Tm7jcUzl35
   DEO8867tUaUAYpJignS2mwyOLKz//Pqfxt5ibEcg55Jp3gsq96/w+xWOn
   g==;
X-CSE-ConnectionGUID: srKmrASqSJOUvEddf7FBDw==
X-CSE-MsgGUID: Lyooct+wRy+35xSaV62Neg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82357492"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="82357492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:20:43 -0800
X-CSE-ConnectionGUID: +0wiMAjURFKhzDA+gqibtQ==
X-CSE-MsgGUID: 2GkmB5I2SqKR000heq+oJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="209145097"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Feb 2026 17:20:41 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vn55r-000000003F7-1Nfm;
	Tue, 03 Feb 2026 01:20:39 +0000
Date: Tue, 03 Feb 2026 02:19:40 +0100
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 5/6]
 drivers/iommu/iommufd/io_pagetable.c:855:23: warning: variable 'area_iova'
 set but not used
Message-ID: <202602030211.fCQFe9Ar-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   5259d5e34eb7da1c96802e79113ccca538730d5e
commit: ca213f193f2c2aa9b43a653bc6466e1216f6e767 [5/6] iommufd: Add an ioctl IOMMU_IOAS_GET_PA to query PA from IOVA
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260203/202602030211.fCQFe9Ar-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030211.fCQFe9Ar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602030211.fCQFe9Ar-lkp@intel.com/

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
