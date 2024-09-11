Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5291AE87E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074315; cv=none; b=rdjtDK7XTBduHyNC7TY7EByx5l2n637x8busDIIIs0JUpRijgsOK2o3sSfEVWOB5d7zTSJ+EqLv7yKvpbvKJUfzxeodOlblmtOFTp0DOPpzlWPFNEEERdK+qFt6Aabz462NeGM1ge53abAef2oJyfcfM85taXlM9lXS94FaRJ6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074315; c=relaxed/simple;
	bh=5THX0i0ovWyOWNvuggCQsXNwlTQYroQftKa7148F+3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WwnlSvMBDlrxbJbrYM1k9Bk/IRXkyGZSri3IE6RTplpLixusB+eA3EU6gqCOD78ByzwMSheiNo2j/w/eBD46a6LrSDOYZprAIcTDRMYag2OBEfJIXXB7kPy70vBp8Y970vOBLZxXdGwslyd1vW/H7jpQ19kPK8GVg+8P4F6eTEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LEkDsIFd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LEkDsIFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726074313; x=1757610313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5THX0i0ovWyOWNvuggCQsXNwlTQYroQftKa7148F+3U=;
  b=LEkDsIFdy0vQuezEIhvHzky3srBwvY8aXq1lcE/CiGlQEjG2LEq+aGwu
   IxgnN7m5JXlqQ4szRcRA43xj2p7V4m3dUtk9+HRUN38I9nAxoWXM+P4in
   lDfhyrEv/jTPT9GCdd+FwP5ASlvTJmIgdDN18EKuA7RZRFz4f07Lr8GvB
   teZQln5PzqnF8NdAU9UF9l3Ttl2JWzvcAOXJeWu094SXbIBjiBhqKur/p
   tX4uyulgH+w/w6bXFfWW7co8+yQu5+svNXbY9vjjW9jv5TtrCPiM7jNVw
   QaJgmKF9/CIWqaQSi02o213RcXM+kLRwTGzwJyL00CiE5BvkJjXbKIbI+
   Q==;
X-CSE-ConnectionGUID: TS3MWtiLSGWWED5KqlhdMw==
X-CSE-MsgGUID: nDYhSTBhSQW/wZaj8nCtcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24384376"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24384376"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 10:05:06 -0700
X-CSE-ConnectionGUID: UgpTLT5LRR+tfi7sxrcW8Q==
X-CSE-MsgGUID: rF17wxrQQqefvziyWAj0OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67154320"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2024 10:05:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soQm6-0003sI-0e;
	Wed, 11 Sep 2024 17:05:02 +0000
Date: Thu, 12 Sep 2024 01:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13473/13927]
 drivers/crypto/ccp/hygon/hct.c:1730:45: error: no member named 'numa_node'
 in 'struct device'
Message-ID: <202409120059.aFjFwIVD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   63fb41399626bd7c0b102eec56b5790ef3909db6
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [13473/13927] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240912/202409120059.aFjFwIVD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409120059.aFjFwIVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120059.aFjFwIVD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for function 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/hct.c:1333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         | ^
         | static 
>> drivers/crypto/ccp/hygon/hct.c:1730:45: error: no member named 'numa_node' in 'struct device'
    1730 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VFIO_MDEV
   Depends on [n]: VFIO [=n]
   Selected by [m]:
   - CRYPTO_DEV_HCT [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]


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
