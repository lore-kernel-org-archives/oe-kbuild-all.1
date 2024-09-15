Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8C17BA0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 05:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726378898; cv=none; b=pXZhY0fOs9/Uk4vWIYenp9dv3ECs5cWFTVx0hS5dewAAuJ8jBy3UckeBCkQBGgSqGXFAxKOZXeDHI09QCCw1G7u2bKVHIGZ6i+lb/NxTNYtucjF3XtTwaEbhYJgkFzdjCE8G8UR3OETsJx1NnRJDS1sljtbaQkltkfWBpWibbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726378898; c=relaxed/simple;
	bh=XfY0Fj2mHThCqiHsM7zd/Lo96pDa3z9gUcZ0WPxG6jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lgHTyOGsVzH2Pcx8KiVEHdAfx/PYD8Qtcu/rV3PfQCDIetM7SnCn2/1/PiR+PymHJ5ki6N3TyzdDQPQ/l95qb3+6+gcTobXOZsHnS5SuIjf5GmS3Eq7+68vNZhgH04pb//9Zgx9PdbzanVdHFAkijB9lVRy+Ho3uEB8h1YPeQTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9tGvKGk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9tGvKGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726378895; x=1757914895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfY0Fj2mHThCqiHsM7zd/Lo96pDa3z9gUcZ0WPxG6jc=;
  b=I9tGvKGk6tpboVDHnqwX+bvjgUS0+3NuC288V52m1e0F7HjBdfztoyrL
   ORz3PZDxhPooTede2hMv8a5xoSijdWUJQmyjFW7Y6BgXUlj8hG2RwcvpL
   3x3oy+MoGaJKQE5AwVfyuf2H0WYRs/P38nMkR6cHUyPOpMKF8sgkSTEjP
   V0SRB208xkrkn33u++KlC71dvTtBniNS6PL2jHRFqBcfyYr86O+q5VA1O
   D7UQtSFIb0fc4HEEWksyc2HLuQPbtS/2yB4tmOs+IS82NV8iNbDpv5uFB
   tGF8OIiuM1ahl+lRQAFLaPKKp0/hRNS4J+s/kkwpJWWuywpGRnabgzlTo
   g==;
X-CSE-ConnectionGUID: 9pzxrTJoTsCcLrX/109sTA==
X-CSE-MsgGUID: zBJ7IZFPQVCWi5I4zJKbAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42717079"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="42717079"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 22:41:34 -0700
X-CSE-ConnectionGUID: P4Tsxf/rTSKl5hym0EwKCA==
X-CSE-MsgGUID: bde5L/9rSM2cCsJsOXeNYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="73547699"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Sep 2024 22:41:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spi0p-0008Ri-1u;
	Sun, 15 Sep 2024 05:41:31 +0000
Date: Sun, 15 Sep 2024 13:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangdepei <yangdepei@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13473/13950]
 drivers/crypto/ccp/hygon/hct.c:1730:51: error: 'struct device' has no member
 named 'numa_node'
Message-ID: <202409151313.4XBOlxtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [13473/13950] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-randconfig-013-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151313.4XBOlxtN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151313.4XBOlxtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151313.4XBOlxtN-lkp@intel.com/

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
