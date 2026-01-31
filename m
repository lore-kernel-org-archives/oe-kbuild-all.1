Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D72F6900
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 00:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769819263; cv=none; b=t7PXss4zUmscFEyMNC4zl0vX4bsxZPD84NJafj6AUyb7doKac1f6tj1KUpJwHjp4QeT4VXOwj3l3e26WUMzQtxpAx1fIhqP5chKfrqk9VdXul0aSLkEQJqfih+0zqzXi3eDoZSn6lb1ECZIssKbIry/xbPOkxqfE9gzBBfwNP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769819263; c=relaxed/simple;
	bh=3hWJkoZFVlgrQsVabtEfajGtohm3KD3GnoE7TaQgfEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mvIpPbpxwp3hIVkASkVlCqoURKMtPxnukDRBm2oEdX103F9aidCADKfyYUYi0Kj3kFQd3jE9amVk/iw3H649xaJJBJ9KjNcDvViwrZk/GW3bd/NvwwT00fxx+9c/2VoHPnSeB4RIch6XBjgp8dT7vSP9Kpp9k+oL/p/7sbpxJws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiJMsQiD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiJMsQiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769819261; x=1801355261;
  h=date:from:to:cc:subject:message-id;
  bh=3hWJkoZFVlgrQsVabtEfajGtohm3KD3GnoE7TaQgfEg=;
  b=RiJMsQiD5GQiWQAZ/PRuqwRkch8M0Y/JCRQVqTpRAvae5fJf6v2H0xTo
   Kwv+JClDB8HjSvM1psMYHKyziRxDExuDu4/+VyEtpzwN4NmbSdM3ad8nB
   7v4DzRfhr9KnloSjd+u1uSKGU5G5OSA/ps82H0TF1rWXTdie1FmDJbYZN
   6088/vCYlRp1c5nrTSTcGFRUhrOjr1iBLLD2BBCTF+6ckRplEefouYL8B
   18R5Gkpvub5g6twCoMPs28o/tNPfhOU/gz28sp28WQFQw2XTL5dyQW7gO
   iELfpr9Kz+EqpeFxHeGmzWIa3wshbBY+1LMIWMz9jjiM/N5/NHSM1f8SF
   g==;
X-CSE-ConnectionGUID: 6OG2isJ5T/+rw+IR7rcA2Q==
X-CSE-MsgGUID: yAnhzJWZTPCnhpy83enb8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70792644"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70792644"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:27:39 -0800
X-CSE-ConnectionGUID: fUVjLqXyQq6YOTJxg0obRA==
X-CSE-MsgGUID: ZvoTQE8aSpmR6XItmiMb6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213917792"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Jan 2026 16:27:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlypr-00000000dVQ-2Js0;
	Sat, 31 Jan 2026 00:27:35 +0000
Date: Sat, 31 Jan 2026 08:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 5/6]
 drivers/iommu/iommufd/io_pagetable.c:857:23: warning: variable 'offset' set
 but not used
Message-ID: <202601310858.8HJlC04v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   7786a2757eb91ada48627ce3c749705507a3cdd3
commit: 302d355a6e327aa415cb85ed0e5bf021cbb1f5b3 [5/6] iommufd: Add an ioctl IOMMU_IOAS_GET_PA to query PA from IOVA
config: x86_64-buildonly-randconfig-003-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310858.8HJlC04v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310858.8HJlC04v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310858.8HJlC04v-lkp@intel.com/

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
