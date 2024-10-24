Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05201E51D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729738535; cv=none; b=aPmkE3kipJ/S63GLlV8P6lvUMkkne4m16gRrqw3rKIN8joQIa3s5FdG65xornzxfo5VcJ3YKghGmQUoajQFqgawvQgHUb2maOJD4Zp5aFYfymdj+Ci48JlG9UFkq7OBJh7FWxxsBS9RcX4aYwAb9LdD3MAucs7H6C1sK9n/K1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729738535; c=relaxed/simple;
	bh=+vzhJYi7WJ+t5J6e5aVwo6DLRhXRQQjly1Cls5HaO7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhATBQ0WMS9XgfE1xElW4PdAjH6ErYmXHxPYmlfXsYgPJMkxqhGurUJBd2EYX18uVWk8bkq7zWoh5QFP/likHpbhRA/9el+9zDvrU7e0rPTFNVs8FEnDL0xWV/tzvMfIEsuWqAcr/rkZjM9eLSi9neJkXNzDl+FLMHWW+Ibbilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tt/mroz5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tt/mroz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729738533; x=1761274533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vzhJYi7WJ+t5J6e5aVwo6DLRhXRQQjly1Cls5HaO7U=;
  b=Tt/mroz5Br68HRgVSsnLspxNEYFkOM7ZEZwHQFR59lTnbTrQGGOCFeEN
   S2ktMyMehfP/N9ycBG9jQeIGW7LWDJ7JQ18gP0kn6YGq7xVcMXg/zw4sn
   b1X+dEjJ1Uu8EhfBMbL9SpHYD7JFzcUlmaamGwIZngsnk8GGo/YRD4Pn2
   R4H4tfeMm+r5AcWkpZtEIJfcqYZGGBX8v1m1294lGnPMmsiYKH1PI7g8T
   1NoIM5B+1ZzH8us268BIZw2SwlRI2Or5xFYcqMxXL2xzNPf8C1k9LisnI
   yvg7/P0O89dCRVFkMY59odVIfNWmB6wzUpMe5sdktvBxi8rYusZ0pTi9Y
   A==;
X-CSE-ConnectionGUID: 0ulA097ORGGba64uzcJ3iw==
X-CSE-MsgGUID: obHTsivkQY2xjDxDCEVeUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29473955"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29473955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 19:55:32 -0700
X-CSE-ConnectionGUID: GG4wJTKxRlG3xirLi/cjCA==
X-CSE-MsgGUID: Z7T0dzAfSRmJMobWnPuz4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80459523"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2024 19:55:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3o0W-000VrI-1z;
	Thu, 24 Oct 2024 02:55:28 +0000
Date: Thu, 24 Oct 2024 10:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13479/15255]
 drivers/crypto/ccp/hygon/hct.c:1730:51: error: 'struct device' has no member
 named 'numa_node'
Message-ID: <202410241021.mDLDP8B3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yabin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [13479/15255] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-buildonly-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241021.mDLDP8B3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241021.mDLDP8B3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241021.mDLDP8B3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/hct.c: In function 'hct_get_page':
>> drivers/crypto/ccp/hygon/hct.c:1730:51: error: 'struct device' has no member named 'numa_node'
    1730 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                                                   ^


vim +1730 drivers/crypto/ccp/hygon/hct.c

  1713	
  1714	static struct page *hct_get_page(pgoff_t page_idx)
  1715	{
  1716		u64 *node;
  1717	
  1718		mutex_lock(&hct_share.lock);
  1719		if (!hct_share.pages[page_idx]) {
  1720			hct_share.pages[page_idx] =
  1721				alloc_pages(GFP_HIGHUSER | __GFP_ZERO, 0);
  1722			if (!hct_share.pages[page_idx]) {
  1723				mutex_unlock(&hct_share.lock);
  1724				return NULL;
  1725			}
  1726		}
  1727		get_page(hct_share.pages[page_idx]);
  1728	
  1729		node = page_to_virt(hct_share.pages[page_idx]) + PAGE_SIZE - 8;
> 1730		*node = hct_data.iommu[page_idx].pdev->dev.numa_node;
  1731		mutex_unlock(&hct_share.lock);
  1732	
  1733		return hct_share.pages[page_idx];
  1734	}
  1735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
