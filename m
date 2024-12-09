Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB775FEED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716806; cv=none; b=uXTD5/7TlPqFa/skD4osISiG18V4ShbscihPIWHNT2i9XiHQnseGsTsH4HJwNtAAcurQBOViMNyAa6tBChkruJiY/8Wfx3QhwR4dntOpRdRrWbRmWndzDQeQhD3b4v4JAz5MlAJG61npefMqOKBULywh9KsTfDa9z28Uz8la0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716806; c=relaxed/simple;
	bh=bnWxl3IcPfOhZvL45cnAyZRMxCNIQGAfYykVt/uiO4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U1EIZ5xsRCaVtBP8f1QdnNTUelA5hvtIVLeAiwoiD/mqugxOdyTLzXKlMP4WR6GxnoaE9HemA8tGl1N8VUDkonD1pUz861HiaGgOce0pMisISgGniR8wqPo6Dqrb9vZjnWHwKOWnsvyPKtrFzdxt2LxoDuHi+eYuQApzsm8RDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5knzCei; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5knzCei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716805; x=1765252805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bnWxl3IcPfOhZvL45cnAyZRMxCNIQGAfYykVt/uiO4c=;
  b=j5knzCeig0ejCiNYAbXrjfDMmOXW8bhUIK38e97JUfTU6S1m5BsHzvss
   UlwTh0lj4DBV1lF6ZxHxKyVA19onBlflGLd3hwGviXtPQYvmZtSV5Bq08
   FZgCNXYCFm0qOdY/7C/puyTPS+7ebzwVAUeRr/SiTqAhwdXmAaaz7gcUB
   Tv2I5zmrGaqv2MUNoOdWuoGr/yfS4z/FJ1d8ytHJxENxc6taqvpRn2rDb
   YysslpsHtK4Ga9zUct2V1DUhFMWUbg/EAQ4o/JKi4mkAXSAig6wcvAKiZ
   duJimigsrTegh4F9MPzVVHlKX5XqVpq52Kj7X88JEqGBhQ4mcgaMIw1rm
   w==;
X-CSE-ConnectionGUID: THuhhP04QV+jshGAo9oYiw==
X-CSE-MsgGUID: mj84DWzsSDaKxv/eLAavaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33923308"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33923308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:00:05 -0800
X-CSE-ConnectionGUID: My5b5+6CSemwuMxxLfLbqQ==
X-CSE-MsgGUID: 1AkiX6ixScONUVw5A/yuAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95149131"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Dec 2024 20:00:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUwD-0003lp-1P;
	Mon, 09 Dec 2024 04:00:01 +0000
Date: Mon, 9 Dec 2024 11:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin 6/6] drivers/iommu/iommufd/device.c:304:1:
 warning: 'iommufd_sw_msi_get_map' defined but not used
Message-ID: <202412070927.rImSTb0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin
head:   e0c7417c5a977930a0951821100a3ac0353d456e
commit: e0c7417c5a977930a0951821100a3ac0353d456e [6/6] iommufd: Implement sw_msi support natively
config: arc-randconfig-001-20241207 (https://download.01.org/0day-ci/archive/20241207/202412070927.rImSTb0a-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070927.rImSTb0a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070927.rImSTb0a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:304:1: warning: 'iommufd_sw_msi_get_map' defined but not used [-Wunused-function]
     304 | iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/iommufd_sw_msi_get_map +304 drivers/iommu/iommufd/device.c

   296	
   297	/*
   298	 * Get a iommufd_sw_msi_map for the msi physical address requested by the irq
   299	 * layer. The mapping to IOVA is global to the iommufd file descriptor, every
   300	 * domain that is attached to a device using the same MSI parameters will use
   301	 * the same IOVA.
   302	 */
   303	static struct iommufd_sw_msi_map *
 > 304	iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
   305			       phys_addr_t sw_msi_start)
   306	{
   307		struct iommufd_sw_msi_map *cur;
   308		unsigned int max_pgoff = 0;
   309	
   310		lockdep_assert_held(&ictx->sw_msi_lock);
   311	
   312		list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
   313			if (cur->sw_msi_start != sw_msi_start)
   314				continue;
   315			max_pgoff = max(max_pgoff, cur->pgoff + 1);
   316			if (cur->msi_addr == msi_addr)
   317				return cur;
   318		}
   319	
   320		if (ictx->sw_msi_id >=
   321		    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
   322			return ERR_PTR(-EOVERFLOW);
   323	
   324		cur = kzalloc(sizeof(*cur), GFP_KERNEL);
   325		if (!cur)
   326			cur = ERR_PTR(-ENOMEM);
   327		cur->sw_msi_start = sw_msi_start;
   328		cur->msi_addr = msi_addr;
   329		cur->pgoff = max_pgoff;
   330		cur->id = ictx->sw_msi_id++;
   331		list_add_tail(&cur->sw_msi_item, &ictx->sw_msi_list);
   332		return cur;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
