Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88B83FB14
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 08:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047492; cv=none; b=Bg+2q+A8UAaob+CdZNmRqtjn+d7QftUdY3XhHB1sV50srjl4hrfCdnLuRg4rfgataM+Fz8wp+yLuJ/9iu6jhkkiYsPtGGdjbEx1b4Qggql8ZldJWVR7YIwBZlE5qM5knuEfJf28TgQQK5pXh6QjIU3fufWvdzQC0Vbtal+FqmNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047492; c=relaxed/simple;
	bh=5ZIUMY5io4ibg0PbPEYnVv0Mp5qsoWQMjTaCTVeue8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=elIJRILASB81yrUYBeQMtn5E0O9L3a5fiyEvKR2U2TjJh/Hr6hRIl68/MiNP/frM99FImCkcG571p12VdxvptwqGirtV3yBmG1iDDpXAsBQxgzD9Fhn4rX1DrNS4JumqjUR039iOQ/4XJbsezWndRkEzQ2eQe4m2x0N8q1bUI5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB9y6OYb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB9y6OYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712047490; x=1743583490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZIUMY5io4ibg0PbPEYnVv0Mp5qsoWQMjTaCTVeue8g=;
  b=YB9y6OYbT01tQJSxQ1tOiTppkuYuURgwxCoPmcS+g+/9/vQbXykE+4+V
   ytk25BQh6CAEDv34WrXtR5PtkDhpSqkzTPkHTakPOho6EcAwAKEb0VPLn
   2p5hy2EqXm2uPlmphxibYI3TwS/dF8QeYn5OoplC+rt4An9uWoWTyqhaO
   oDLzYD9MIs/dxE5+PvrWyH+N07nxSP1LgKpze0Ydr9ZkcAh87FngILoyn
   i0c0wMrtpyhqbx38UURL2nU/7JxxZ8ShnMTonalKmAoyKsoB6Wi6z5hsz
   q7zBWpL9h4E/g57cOUWxMuf4Mw8+ZcjOvAp443H98XE32Xf9YYN9BzL03
   A==;
X-CSE-ConnectionGUID: j+KvNrOaR3Ob6Ajb9wqEWg==
X-CSE-MsgGUID: 2bCXy3XlTN2atzr9ABEceQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18653271"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18653271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 01:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="55441225"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Apr 2024 01:44:50 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrZl9-00013f-0K;
	Tue, 02 Apr 2024 08:44:47 +0000
Date: Tue, 2 Apr 2024 16:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommufd-io-pgfault-delivery-v4 4/12]
 include/linux/iommu.h:1526:1: warning: 'iommu_sva_bind_device' used but
 never defined
Message-ID: <202404021618.0DG5SC6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git iommufd-io-pgfault-delivery-v4
head:   91344398110065da3f748b104d4b54d44414e3d6
commit: 962e4c5599b0bd8a513c2f1ee3261373b8ca996a [4/12] iommu: Replace sva_iommu with iommu_attach_handle
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240402/202404021618.0DG5SC6l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021618.0DG5SC6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021618.0DG5SC6l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/uacce/uacce.c:4:
   include/linux/iommu.h:1527:1: error: expected identifier or '(' before '{' token
    1527 | {
         | ^
>> include/linux/iommu.h:1526:1: warning: 'iommu_sva_bind_device' used but never defined
    1526 | iommu_sva_bind_device(struct device *dev, struct mm_struct *mm);
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/iommu_sva_bind_device +1526 include/linux/iommu.h

  1516	
  1517	void mm_pasid_drop(struct mm_struct *mm);
  1518	struct iommu_attach_handle *iommu_sva_bind_device(struct device *dev,
  1519							  struct mm_struct *mm);
  1520	void iommu_sva_unbind_device(struct iommu_attach_handle *handle);
  1521	u32 iommu_sva_get_pasid(struct iommu_attach_handle *handle);
  1522	struct iommu_domain *iommu_sva_domain_alloc(struct device *dev,
  1523						    struct mm_struct *mm);
  1524	#else
  1525	static inline struct iommu_attach_handle *
> 1526	iommu_sva_bind_device(struct device *dev, struct mm_struct *mm);
> 1527	{
  1528		return ERR_PTR(-ENODEV);
  1529	}
  1530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
