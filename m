Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA115E97
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jul 2024 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722157212; cv=none; b=kSMy7AVKCuwv3Kmjidx+vgzlHO55Ww4N1mR5X/wosQApI9t5qZVAk/3qFBLOU/ees/mhcXyVD7sPm758J0r489Ijb89dpyatwZlpoLjuxl3A72ZaJdI7b3jF6ROXMfHJRaaZciQl6askiYKf3PCPs0WMsiGQlWGl5cxmH0GPB6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722157212; c=relaxed/simple;
	bh=e6lX1ra1K1EzJOL/JUFRIDEgjI2WvusPYPEnd/l9XHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svzaGzU/b7/9AbXXmiNDrPqhcpiZn5Kwrm46XrjD0NGTptMe8fmNa5vRyOTz8t4UaUd8Uzd1zkQgPQNNT6eipMGWdi8iBIfqyxcmmoPvIcUCSJ1EeZi6jcyW1pWXGJ6qqW0KOJ/ukIBc4e8E8JS+CoiZmzut0LX9e0lAhLwGBRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2S5b6d6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2S5b6d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722157210; x=1753693210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e6lX1ra1K1EzJOL/JUFRIDEgjI2WvusPYPEnd/l9XHo=;
  b=m2S5b6d6uSGo+eO5aUfrn+S//X3VBphTOptiFdnoYLKj32NchlmfI6It
   DvFsB6tpiKXoTADZRdkGC6YX0XvCeZ62tnhgxqCZiaWDxqKPcscUoiWyI
   WWDn7/9720heJpMoaSqeVRNBXYZqfXyMlFpvlCsrZgiHFylDBxOaOkplU
   F2F+RgQDPMHLfUqy7Ky77OaoPyyaf4OYrsfImgmbRa2GwAmiKwEnw665H
   XRqhFwddyimGrJT2H49478oPM+szdW4fdyjQidr4Wtj810EDg+1htuke4
   Yp0/9gG43PGMAHAbEPlEhIA5BThXoia/Vh1keswMrRpNHimQRzTgXgpaC
   g==;
X-CSE-ConnectionGUID: Lf6G+A6FQXapmee2FuJ2eg==
X-CSE-MsgGUID: +qgtp82LRK2oMXhxML0jJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="45317314"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="45317314"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 01:59:58 -0700
X-CSE-ConnectionGUID: uLzC2fGMRKi55jQ5kqaayg==
X-CSE-MsgGUID: xwSjS29jTOO5YjGSN97lFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="57961216"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jul 2024 01:59:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXzkx-000qfK-12;
	Sun, 28 Jul 2024 08:59:55 +0000
Date: Sun, 28 Jul 2024 16:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 14/25]
 drivers/iommu/generic_pt/pt_defs.h:208:26: warning: 'pt_table_item_size'
 declared 'static' but never defined
Message-ID: <202407281656.32xK3nwc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   ea5c6d0c8914861c8e337228c4880001bf40f7c4
commit: 46d214b7baec51735b369a423ab6887a2a36ab01 [14/25] genpt: Add an allocator for page table levels
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240728/202407281656.32xK3nwc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281656.32xK3nwc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281656.32xK3nwc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/pt_alloc.c:107:
>> drivers/iommu/generic_pt/pt_defs.h:208:26: warning: 'pt_table_item_size' declared 'static' but never defined [-Wunused-function]
     208 | static inline pt_vaddr_t pt_table_item_size(const struct pt_state *pts);
         |                          ^~~~~~~~~~~~~~~~~~


vim +208 drivers/iommu/generic_pt/pt_defs.h

238517582c3f63 Jason Gunthorpe 2024-06-28  207  
238517582c3f63 Jason Gunthorpe 2024-06-28 @208  static inline pt_vaddr_t pt_table_item_size(const struct pt_state *pts);
238517582c3f63 Jason Gunthorpe 2024-06-28  209  

:::::: The code at line 208 was first introduced by commit
:::::: 238517582c3f6345ebaf2eecc116501f67de8d7c genpt: Generic Page Table base API

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
