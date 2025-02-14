Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733712163A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523589; cv=none; b=QCIDwfMJ6U97Ntnxc11QGsyOGmPQNfxFZqSg7yvRE4BLyjXxgK2POG5RzonDaSKcMW6GYcjC6I3qAHto9JSLYkt8KIXu31kXdHGigx/il7uu8I1HVT1/JEGK6HzKnoGT4KGKRtzNU6Omdx+ahDBIGNKfnZSqnIxvY9HDEQLDQpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523589; c=relaxed/simple;
	bh=Qb1Pjg4590ozSI6YZptwQP/uuu/WB1DLml9/p53iYis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNhnntu4WbWB1dxp9gqMAAQEwuzgn2iGTwYcdphZjwtnj9EnDJBXxsdqG+OLpcprrG5IdVy0Xr7KDuk4H8sBdAB8qHXvv+XpJuo8tMs7nbuDbGQhpmTx8KWDqgnW2V31dVnYfevqR/e61bZXwD6acMV2swVRYtgH3+EvbMr2nNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWMOeImq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWMOeImq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739523588; x=1771059588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qb1Pjg4590ozSI6YZptwQP/uuu/WB1DLml9/p53iYis=;
  b=gWMOeImqyATFNLZ/1vukB/FNrXOaHGEENQVh0km/ADTC65rH6AGB14Lc
   dJS4W09iRXvxsDcyHI5Rsi+0CdGDyTxQIUTgLrgxCqQCCqjLIzAzep7Zi
   8CE/rxiYfqq6PZgxIs0NGvSgyryG6O4Y2DdO4O4TZAgubMGdw7tOv5nGb
   nH4x+YHtI3/RdaosBpkcP0pyClT2TXBbvMMKW8HoEuh0FcnsjeZK5zfeG
   ycVm283CluFpn56mkGxUDDuX9Ru+fcgLlqmsF3NCXy5WEnhAaxcAyeKR9
   b1A8ll9+yhLabJ5Spi2rBOviMf7+tRoBprODTwC1m/pDrBSyylR2eTsUC
   A==;
X-CSE-ConnectionGUID: 0/ktIanlSgC40qAtGBBcRw==
X-CSE-MsgGUID: pt6WIe8wQzmIdsiaEfHYIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="57672385"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="57672385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 00:59:46 -0800
X-CSE-ConnectionGUID: aoKCEiy3RYWx3aqIJb4ymw==
X-CSE-MsgGUID: dKe6+yfgSkWFUsxOSoGosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144339771"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2025 00:59:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tirXx-0019IW-1j;
	Fri, 14 Feb 2025 08:59:41 +0000
Date: Fri, 14 Feb 2025 16:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>
Subject: [djiang:cxl/fwctl 22/25] ./usr/include/fwctl/cxl.h:37:45: error:
 field 'set_feat_in' has incomplete type
Message-ID: <202502141628.ezqob5ml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: c9935e6f00834729baa8db86cf6c0b94549fda01 [22/25] cxl: Add support to handle user feature commands for set feature
config: i386-buildonly-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141628.ezqob5ml-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141628.ezqob5ml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141628.ezqob5ml-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./usr/include/fwctl/cxl.h:35:50: error: field 'get_sup_feats_in' has incomplete type
      35 |                 struct cxl_mbox_get_sup_feats_in get_sup_feats_in;
         |                                                  ^~~~~~~~~~~~~~~~
   ./usr/include/fwctl/cxl.h:36:45: error: field 'get_feat_in' has incomplete type
      36 |                 struct cxl_mbox_get_feat_in get_feat_in;
         |                                             ^~~~~~~~~~~
>> ./usr/include/fwctl/cxl.h:37:45: error: field 'set_feat_in' has incomplete type
      37 |                 struct cxl_mbox_set_feat_in set_feat_in;
         |                                             ^~~~~~~~~~~
   ./usr/include/fwctl/cxl.h:54:51: error: field 'get_feats_out' has incomplete type
      54 |                 struct cxl_mbox_get_sup_feats_out get_feats_out;
         |                                                   ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
