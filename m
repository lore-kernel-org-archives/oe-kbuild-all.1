Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E415F41F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 03:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748921004; cv=none; b=rIS5i7rWh4QBZXe1qKtFH1iYIwE1LWBChBcars5iHP7JkpTdzlo0CbBao7M6Ufzeq8PAqz44lvwkc5BhqZ0/ttrWSx4Ub26G0SV9yi6KC2jaT5umUtG4cmhBxoPKlX4G1RZAdEsBztD6J3tv4xDR2IqH3U2IMuoWn6yrSEFeRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748921004; c=relaxed/simple;
	bh=NUQzJlANHq2SGdaVIfcx7anEua1lj23A5dS+jQshbi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJoP2sEGNOdPDqFrQmJb7TqF1xldlj1ts4lP/1P8VWMoBuKTpR7HOuxfGzOd8lh3MvxG/2YUXbwc/EEka4mgQlAeltmJFXAZbakceaHTiai00G/oJw0FUS95SlyvxxFDIA6HErFw6YQskV5+66oPiNuBduUzU8iSbOFlqaYzur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYBNzOmG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYBNzOmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748921002; x=1780457002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUQzJlANHq2SGdaVIfcx7anEua1lj23A5dS+jQshbi0=;
  b=CYBNzOmGLvqak0Gos54iYHuTFNrdl3zpVbEjH+7Da32iUM2QqgQl7UEQ
   /wGYC7o4mBQ1svpt3VpowsKOzSJXFRNoX3OK469MoyC65rCV1XI43Kw8b
   lMdxg6fa8LbADiIRzjewgElfgYzhcSjh8oH2/DYwDVrbcs1pJWL1GDmNH
   i0aJii3kfOAUURXn0GXKbamdPLIAfjYBtdM+cJE5inFqd89CteIU507j7
   Tt0ZnPsmdIAlm40rceKi3k631AbdQJzLuciZx9j4ZNaINYbrx0jyXb/Th
   Or06WtN2/Az0GgssrQnphNjUqKBuMqTIfG3b49IxDMn9w1onG5KoO+m0l
   Q==;
X-CSE-ConnectionGUID: WQhppzu1QECNY/yWyCGAJQ==
X-CSE-MsgGUID: EG9o3ANVT9qtJM3aUFCt8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51089408"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="51089408"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 20:23:20 -0700
X-CSE-ConnectionGUID: a7UjyrUHR+uU3E/ouycL/g==
X-CSE-MsgGUID: ApKV2ZiBS7axEcE/GS6k2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="149774303"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jun 2025 20:23:19 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMIFB-0001Pa-04;
	Tue, 03 Jun 2025 03:23:17 +0000
Date: Tue, 3 Jun 2025 11:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 drivers/crypto/ccp/hygon/hct.c:1730:45: error: no member named 'numa_node'
 in 'struct device'
Message-ID: <202506031108.JuNV3xoC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97c2d1a4aa1430a6305c949fa1f72efe454c946d
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [2195/2195] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-buildonly-randconfig-2004-20250502 (https://download.01.org/0day-ci/archive/20250603/202506031108.JuNV3xoC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031108.JuNV3xoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031108.JuNV3xoC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/hct.c:20:
   In file included from include/linux/vfio.h:12:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/crypto/ccp/hygon/hct.c:1333:15: warning: no previous prototype for function 'hct_pin_memory' [-Wmissing-prototypes]
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/hct.c:1333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1333 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         | ^
         | static 
>> drivers/crypto/ccp/hygon/hct.c:1730:45: error: no member named 'numa_node' in 'struct device'
    1730 |         *node = hct_data.iommu[page_idx].pdev->dev.numa_node;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   2 warnings and 1 error generated.


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
