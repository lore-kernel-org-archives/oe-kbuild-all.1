Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2115C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710639673; cv=none; b=SBg2LLgH+B2WED0mH4w9WXkVHvZTAG3Teks1W7b2OdlEPrVFegEKwvj8XAvnlzJm4SRuLSmwqdFIftLsNitwR+/a0h71m5J1TcRrh/kpZ6U2SiqPRYBUyxZt6KQ9/ixAueOGfJRy4Q4nv8jhfdFueJbpl9CBlspBNqEBrw7+994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710639673; c=relaxed/simple;
	bh=xzohO4gMYTJUeesbCkyjT5qJ4hc1hG1uo6MgWYejV1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlCGnqBh1wzfr1wjRa1aphXq4Vn9TQLdBXiaC1KFf53DYIre4tsU4Vcb7e98S+PlTfLGhJ5kF//CiVe2EIrL6iBZ7h0axW8J56MbKQ0CZNkzfD3dktUVDIiKryQh9+nPE3WHkH2gA/qmhHwNGOEj0nrBdXOw5JfeghGJ23PHJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1KtwftI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1KtwftI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710639670; x=1742175670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzohO4gMYTJUeesbCkyjT5qJ4hc1hG1uo6MgWYejV1Y=;
  b=Q1KtwftIMzoeERxnCCmrnwqcx4udWZESYinYODDzv8bXo4ZZifUkB4Zs
   c7CMN5XYCJrhA3am1j5TWxAD/EVvds2QyDrhbhYeShzkM3r7x120uOpHo
   n/rAAXxx6fmF4bZMuuQZ1A8a3vyPoxh+Z/X+rsI2D3BXDqtfYDNlPk0NV
   pYxZ4Kk+3eIhAS8+zy6L5Ggv/fFyQFIUY1kOrckBA5WhMWEZIzujN6Ycb
   l79h1jYL5CFjSJfROwO7798n6AH4upo16qWVl22jidYTbhhA8WWAqh2Vz
   mdEbFqfW78wAj13gPzSMq412AaUsKrUot/f2jJMkjlAZPsb8AlfngWOC2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="6083697"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="6083697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 18:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="43994282"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Mar 2024 18:41:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlfWJ-000Fuv-2D;
	Sun, 17 Mar 2024 01:41:03 +0000
Date: Sun, 17 Mar 2024 09:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/amd_iommu_init.c:160:6: sparse: sparse: symbol
 'amd_iommu_unmap_flush' was not declared. Should it be static?
Message-ID: <202403170905.KfIJIoEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: bdf97d5c82aa99f1cfe187884d4151cbc962fbd4 Build report error when config IOASID disable
date:   8 months ago
config: x86_64-randconfig-122-20240316 (https://download.01.org/0day-ci/archive/20240317/202403170905.KfIJIoEH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170905.KfIJIoEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170905.KfIJIoEH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd_iommu_init.c:160:6: sparse: sparse: symbol 'amd_iommu_unmap_flush' was not declared. Should it be static?

vim +/amd_iommu_unmap_flush +160 drivers/iommu/amd_iommu_init.c

^590eaf1fec755 Kaixu Xia 2021-03-16  155  
^590eaf1fec755 Kaixu Xia 2021-03-16  156  u16 amd_iommu_last_bdf;			/* largest PCI device id we have
^590eaf1fec755 Kaixu Xia 2021-03-16  157  					   to handle */
^590eaf1fec755 Kaixu Xia 2021-03-16  158  LIST_HEAD(amd_iommu_unity_map);		/* a list of required unity mappings
^590eaf1fec755 Kaixu Xia 2021-03-16  159  					   we find in ACPI */
398cd2eca8291d Zhuo Chen 2022-07-19 @160  bool amd_iommu_unmap_flush;		/* if true, flush on every unmap */
^590eaf1fec755 Kaixu Xia 2021-03-16  161  

:::::: The code at line 160 was first introduced by commit
:::::: 398cd2eca8291da6a64cc1b74f33f7f9a389fef2 iommu: Restore intel_iommu_strict and remove iommu_set_dma_strict()

:::::: TO: Zhuo Chen <sagazchen@tencent.com>
:::::: CC: Song, Youquan <youquan.song@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
