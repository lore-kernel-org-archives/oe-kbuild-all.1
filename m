Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CA9185B72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445148; cv=none; b=Kpg/9IlkM1cJPecY6SnGpTPJHmveYUQ+q+yyJCiOLoX7Qgd3BHaxYndVFM4Qx3uGEEXiBA2eqRS1XRAES0FJZKB5FiY+424lgm/syYhzYyHKug5OIV4gFZIfwHAqOuc55GNuAQU3fNXVhI8a5fbnAjAni2Dv9244h/BApQFwk8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445148; c=relaxed/simple;
	bh=9MVCA0bXocgqiyccwWfVuPhOWovkeg+LUq8XcoFOu/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PO8tIJdOB5MxpEC+2peuRlDUezM4QncofAFFv4VuvD0cbL0hQxgZaoEv5WelThOS4G+tLBkjvgk+G1pefB+YchZ9WndcXdvSDHjtM5hxE9exkVXKL501vmujAMW6uX3MlIVagsqh/kgJ89RDCm80/uot8qJeF2Yazo78SFyy2R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmbh8qb+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmbh8qb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445147; x=1758981147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MVCA0bXocgqiyccwWfVuPhOWovkeg+LUq8XcoFOu/M=;
  b=jmbh8qb+Pebm93O4pAXHqQsqCjZpKpqCERUyqLFYIuVrbCUdMckFp+6n
   7wPH9kItzoaIlGo5MaNFN5pr1lR5HqSbiuQhZCk/V/ehvdFu7Z2XxyVrZ
   0/DwT+4oDJOBSolQX0h0o4beKajttDdZ2DmAox4b0fiHr37wKx5lNgvH3
   5jRTa/GpsiGFEYWGOq69DZM5bYkw1T2SIHfYbMwRF4dhOfSKxFVwHepKz
   jkbOEVa6G2nAY2hSbFYkGbO3PfcN5ctdmLYYChxU6y+sJ6o2Sl48uKR0V
   iGqNzqS1DLhRXxT/ACLRGOnYmY6imxUptiDb2Vcr6FhAXOUQqCQDsxN1c
   w==;
X-CSE-ConnectionGUID: qpq6GDbZQ4SQjwZEwYOORA==
X-CSE-MsgGUID: jfbR1OuKTTmIzFRpyk3Vng==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="29470084"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="29470084"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:52:26 -0700
X-CSE-ConnectionGUID: jON3yEtmQl2sXMiCMNnd3g==
X-CSE-MsgGUID: QR+gCKv2TcqndelcUCUKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72620263"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 06:52:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBOQ-000MCd-1V;
	Fri, 27 Sep 2024 13:52:22 +0000
Date: Fri, 27 Sep 2024 21:51:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 20/25] drivers/cxl/core/mbox.c:1726:26: sparse:
 sparse: symbol 'cxl_fwctl_type' was not declared. Should it be static?
Message-ID: <202409272121.cRi89H0l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: 231da137a959331cc5bc80ef4acb3d7e667bfbad [20/25] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands
config: m68k-randconfig-r131-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272121.cRi89H0l-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409272121.cRi89H0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272121.cRi89H0l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/cxl/core/mbox.c:810:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got unsigned int @@
   drivers/cxl/core/mbox.c:810:23: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:810:23: sparse:     got unsigned int
   drivers/cxl/core/mbox.c:888:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got int [assigned] alloc_size @@
   drivers/cxl/core/mbox.c:888:31: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:888:31: sparse:     got int [assigned] alloc_size
   drivers/cxl/core/mbox.c:889:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] start_idx @@     got int [assigned] start @@
   drivers/cxl/core/mbox.c:889:35: sparse:     expected restricted __le16 [addressable] [usertype] start_idx
   drivers/cxl/core/mbox.c:889:35: sparse:     got int [assigned] start
   drivers/cxl/core/mbox.c:922:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:933:54: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:934:23: sparse: sparse: invalid assignment: +=
   drivers/cxl/core/mbox.c:934:23: sparse:    left side has type int
   drivers/cxl/core/mbox.c:934:23: sparse:    right side has type restricted __le16
>> drivers/cxl/core/mbox.c:1726:26: sparse: sparse: symbol 'cxl_fwctl_type' was not declared. Should it be static?

vim +/cxl_fwctl_type +1726 drivers/cxl/core/mbox.c

  1725	
> 1726	const struct device_type cxl_fwctl_type = {
  1727		.name = "cxl_fwctl",
  1728		.release = cxl_fwctl_release,
  1729	};
  1730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
