Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794549625
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 01:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729733015; cv=none; b=QyCFUy2E13/LzUH86eQcSlmeZHzCIh3+UH8I3XTLen09tpMnm9ZPk9nDaXJ+88TTFQSRvQAEB5jkK0jcDhEcmIJ89TV60dKQuLJTmUBTfluXJnEEdUNKhkY2pPX5S44l8gapDMp6RZ4AgkRNt56oPQEj1cr+wEP77h2ZErNMcj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729733015; c=relaxed/simple;
	bh=59+M5w4cWCmUpk4iWFBVNtXNuJGTPzR10JjGt27onRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dx5K+iRdhd9rsJekIE3znDxj+Xp0Um0lzE6DwLfEEbffRZVV470cwre1G4v4iYx8nEyJZ2cPubq2G6trSZQ/Q6PaCpTCuL85JEkuih4zuqAeN4qz2aO2EanplOY4axyEx7wRXRTy3B7zqWkXgEdp+yuHj8g8y/BYWy7GsHJO1m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rz9amNWV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rz9amNWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729733012; x=1761269012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=59+M5w4cWCmUpk4iWFBVNtXNuJGTPzR10JjGt27onRY=;
  b=Rz9amNWV1Bb2m+mWAuoRfX35paiSSbq8ZTi1GSMJ354Qg/Gpx9QXFZ3W
   0v9/kh02BnUQHOSu+Q3G4iq6+8bfqzxbXq+qsFdTADvmvcWcUUmWNedOl
   NpA1Vyr7zK4fOW5EexcIxT5T13QGtv25Oiyoc34SqxdxbHBop3GrAcCru
   LypuIu8zhLbaqhsGoKRfx+DMTXG4QxryUdIEJoDyBu5vWROq7LOMh26dk
   lzqla2D2arC4ZCRk/DfNUcrErkri38mNUngb2V0nPBCDrA43LrS33oDre
   2DMzajXEboBwebbXkZDcnkymWCF9D0p1ZZZwkYIWJfkY5vwQKQm2xiJI2
   A==;
X-CSE-ConnectionGUID: u4YS/r3hSTqiWFirOgQRug==
X-CSE-MsgGUID: nlsVYZ9rQtmsPb5dPnQTQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29468161"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29468161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:23:32 -0700
X-CSE-ConnectionGUID: 3276th1YRPGepHc7VS5o6A==
X-CSE-MsgGUID: pmXVcYqCSgSzt4FHiofS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80358323"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2024 18:23:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mZS-000VnI-1k;
	Thu, 24 Oct 2024 01:23:26 +0000
Date: Thu, 24 Oct 2024 09:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7182/13046]
 drivers/crypto/ccp/hygon/hct.c:1729:51: error: 'struct device' has no member
 named 'numa_node'
Message-ID: <202410240922.HJ1Jpofy-lkp@intel.com>
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

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 346dc8c7ca8d21796c3ae7fbc1cd7bfcae4eddaf [7182/13046] Add mediated ccp driver support for hygon crypto technology.
config: x86_64-buildonly-randconfig-005-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240922.HJ1Jpofy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240922.HJ1Jpofy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240922.HJ1Jpofy-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1332:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1332 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/hct.c: In function 'hct_get_page':
>> drivers/crypto/ccp/hygon/hct.c:1729:51: error: 'struct device' has no member named 'numa_node'
    1729 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                                                   ^


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
