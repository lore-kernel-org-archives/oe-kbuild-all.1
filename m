Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47703C8EB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 03:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769829557; cv=none; b=KfpiTBvjLpRGa1SFn8/lOd4hHyMtSwN+/LW/PH0P/GjxJKEk0hUZiWuZxRdoxlntJbcxGvITmLHO0cCGtzT6ZYsQ6iUjRB1ip/NVkMbDdzZ9S2l4GEF7sKU8HvTdPnFB4YqyIiwLDP1D8V3p0eXxeyAscHJ8CGsUnINZUMfeLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769829557; c=relaxed/simple;
	bh=+IKRbWf3rKPlCWeye31pxkfhNpGf5PoY4UTD1HsDTDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EVDpJ9J6/YvaAJg00WX99k1ue9s4goQZoJocIF91FSlPCocWS137T+bxXXuzMoCzHv70hejmvcPLKTgy4x4/GW7JptLUedNl19ycBi6IHIN1np8DeEQru/fs5wQqRDY4fNjZ04f7kcpxkEOzuSHZqzXSdVcZ53V+pgifkeJ0Y4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mY64gUkG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mY64gUkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769829555; x=1801365555;
  h=date:from:to:cc:subject:message-id;
  bh=+IKRbWf3rKPlCWeye31pxkfhNpGf5PoY4UTD1HsDTDE=;
  b=mY64gUkGnslUOJs+FdOYiGEDKxj+MtIFpx6dwZL/mujOephfPcDk6HDZ
   x/g4QlKj7w25lxtq62UMnejBj/ri8A6QumfecZPMb1vrymsH6s2AgyufR
   49uFcN/ZLxmzD/UZhO0Dz5kToQID8p4LtSrgy9JdIdnCIMlKrwYIDcsB1
   GL6FDQ99G7grpPPOEryW1+3H1GtieYqkoc++KohVKdhXOm/qpVFlH/pIt
   HH2F2lB8TRrz1ummL9+/8UhCOsc3yKb/yvy0rj3PFq6vpWaL6zJo+SWqG
   kgPx+ZfqI46ZFvPd3ulWHOeAIM/XgvDwczx5YQ5/udPdraEvV8a5JOrqj
   A==;
X-CSE-ConnectionGUID: NPTYJr80RxuueSCX5OQpEw==
X-CSE-MsgGUID: hwSYaty/RRKJVL4fVUMF/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81396621"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="81396621"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 19:19:14 -0800
X-CSE-ConnectionGUID: Llbov2RRQSCwSx+z9uVjtA==
X-CSE-MsgGUID: 6qEGbkWgSwaT+dpoycOJOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208587171"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2026 19:19:12 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm1Vu-000000002dh-1hCi;
	Sat, 31 Jan 2026 03:19:10 +0000
Date: Sat, 31 Jan 2026 04:18:25 +0100
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 5/6]
 drivers/iommu/iommufd/io_pagetable.c:857:23: warning: variable 'offset' set
 but not used
Message-ID: <202601310441.TpTsfgVh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   7786a2757eb91ada48627ce3c749705507a3cdd3
commit: 302d355a6e327aa415cb85ed0e5bf021cbb1f5b3 [5/6] iommufd: Add an ioctl IOMMU_IOAS_GET_PA to query PA from IOVA
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260131/202601310441.TpTsfgVh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310441.TpTsfgVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310441.TpTsfgVh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommufd/io_pagetable.c: In function 'iopt_get_phys':
>> drivers/iommu/iommufd/io_pagetable.c:857:23: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
     857 |         unsigned long offset;
         |                       ^~~~~~


vim +/offset +857 drivers/iommu/iommufd/io_pagetable.c

   851	
   852	int iopt_get_phys(struct io_pagetable *iopt, unsigned long iova,
   853				phys_addr_t *paddr, u64 *length)
   854	{
   855		unsigned long area_iova;
   856		struct iopt_area *area;
 > 857		unsigned long offset;
   858		int rc = 0;
   859	
   860		if (!IS_ENABLED(CONFIG_VFIO_NOIOMMU))
   861			return -EOPNOTSUPP;
   862	
   863		down_read(&iopt->iova_rwsem);
   864		area = iopt_area_iter_first(iopt, iova, iova);
   865		if (!area || !area->pages) {
   866			rc = -ENOENT;
   867			goto unlock_exit;
   868		}
   869	
   870		if (!area->storage_domain ||
   871		    area->storage_domain->owner != &iommufd_noiommu_ops) {
   872			rc = -EOPNOTSUPP;
   873			goto unlock_exit;
   874		}
   875	
   876		area_iova = iopt_area_iova(area);
   877		offset = iova - area_iova;
   878		*paddr = iommu_iova_to_phys(area->storage_domain, iova);
   879		if (!*paddr) {
   880			rc = -EINVAL;
   881			goto unlock_exit;
   882		}
   883		/*
   884		 * TBD: we can return contiguous IOVA length so that userspace can
   885		 * keep searching for next physical address.
   886		 * e.g.
   887		 * iopt_area_length(area) - offset;
   888		 */
   889		*length = PAGE_SIZE;
   890	
   891	unlock_exit:
   892		up_read(&iopt->iova_rwsem);
   893	
   894		return rc;
   895	}
   896	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
