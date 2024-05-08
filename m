Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974081ACB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715167413; cv=none; b=QbHXaij7hrF4GXSoh88mEtfPlpiyZkg6Xz+Hf17gFQWcaSU1UNdPfPmBoLoPoBBNE71F59P5EUG5zHRfIHtfKC90R2jijwRSSzU11ZdneavIa/1TUfuf5sGtf9gp+E0QwJ/i7f1zjWs6ZrNltitTaVkMDnHkQ6qf7uhy1szNbqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715167413; c=relaxed/simple;
	bh=tbuJVqd/TCcVgqimceNSwW4YkyonSknoAymtB2dN4hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TATfiSTSRnk2p4i5hrj0lHhBY1gDdVferSDb6FJ4x8bnQniwX4Qkiiak75IAMxdikCCT9AMi2/N1oRU5uIMlY4Ka/cl2fDkKZvyxRtPjNqhMEmX5AQkzcwPY2SEWBinNTp4xQlpVnZhTzAchE7AAdC6K7K+XmP1TEClIDcNRA2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNJH9lQ5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNJH9lQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715167412; x=1746703412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tbuJVqd/TCcVgqimceNSwW4YkyonSknoAymtB2dN4hI=;
  b=eNJH9lQ5N7MRfe7jJRe47qJGeNoDLxmSVUvPkjF0s5RWOOxFC0HS2P31
   Cv3eiBERbBFrDLFRUnU33qlHk3xWlCAt6p4ALc3kwmNxoY/+f2PK6Vs89
   RzqjQIFQO65lQWxq27QTNiC1H8SP9Joy513XOfKTPWP08S+PFmU9DkMmE
   +WEnSIoMKzxR6bC6xZwW7hLX4UpVFyt23cLoSvUyvFdCHtBf6arzrtwTS
   q9IN8UJwWvhShHrdz/ztST9GA832K6ywqgW2+D5Lzetm7jC3kF42oEnzA
   cXFEHOFuCXnmVzGP0GvfSmz+/EKzljFTJdh/d80sWvGppCmrkF6fO6UXu
   Q==;
X-CSE-ConnectionGUID: DNRFyBVbRmunYwB9PymBFQ==
X-CSE-MsgGUID: p8+XPubCS66i2/LWjXGI6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22412254"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="22412254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 04:23:30 -0700
X-CSE-ConnectionGUID: H+sDVJoPSp+zgBz5f+FChA==
X-CSE-MsgGUID: cqupnF8JSUajQLFn9O9kIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="59714790"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2024 04:23:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4fOO-0003LC-0e;
	Wed, 08 May 2024 11:23:24 +0000
Date: Wed, 8 May 2024 19:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6570/6577] drivers/crypto/ccp/hygon/hct.c:1729:51:
 error: 'struct device' has no member named 'numa_node'
Message-ID: <202405081933.4hzXpD2a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ffca8a908fafd64ef6729c1f9953adc81cd5ffe1
commit: 346dc8c7ca8d21796c3ae7fbc1cd7bfcae4eddaf [6570/6577] Add mediated ccp driver support for hygon crypto technology.
config: x86_64-randconfig-123-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081933.4hzXpD2a-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081933.4hzXpD2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081933.4hzXpD2a-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1332:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1332 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/hct.c: In function 'hct_get_page':
>> drivers/crypto/ccp/hygon/hct.c:1729:51: error: 'struct device' has no member named 'numa_node'
    1729 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                                                   ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VFIO_MDEV
   Depends on [n]: VFIO [=n]
   Selected by [m]:
   - CRYPTO_DEV_HCT [=m] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]


vim +1729 drivers/crypto/ccp/hygon/hct.c

  1712	
  1713	static struct page *hct_get_page(pgoff_t page_idx)
  1714	{
  1715		u64 *node;
  1716	
  1717		mutex_lock(&hct_share.lock);
  1718		if (!hct_share.pages[page_idx]) {
  1719			hct_share.pages[page_idx] =
  1720				alloc_pages(GFP_HIGHUSER | __GFP_ZERO, 0);
  1721			if (!hct_share.pages[page_idx]) {
  1722				mutex_unlock(&hct_share.lock);
  1723				return NULL;
  1724			}
  1725		}
  1726		get_page(hct_share.pages[page_idx]);
  1727	
  1728		node = page_to_virt(hct_share.pages[page_idx]) + PAGE_SIZE - 8;
> 1729		*node = hct_data.iommu[page_idx].pdev->dev.numa_node;
  1730		mutex_unlock(&hct_share.lock);
  1731	
  1732		return hct_share.pages[page_idx];
  1733	}
  1734	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
