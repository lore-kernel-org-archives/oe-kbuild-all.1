Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938713A8CB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709259921; cv=none; b=u1xk3nttpP0DOVmvyF17rFRCBy2Ccie2vyEIHhXtjedQ6mU1Rndojwqqwa74xLvazFpwFksNdfO74h2gEMHKh7mFrGmJ6Wghkv1Q9Xphwsm6v2RvxurYQQyProdlxonqfTSXsfs+/ynQsiS8akDqN40kqsfiGX3zNh3vber8olY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709259921; c=relaxed/simple;
	bh=lnLBJ9/GkyabQCRnoOIR/0ka8IYPntYmspTukM433Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kx/STxXYinUMK8MQxdSYplQKOB7QD2CMoK70mvqimD2DgzNVNDypNtB/zqrr/gk+6uC94oRUQSJS82BXPWTK7gZOjQkaaI1o0+4zD/D0HEla6tpaDaSbNlhijEYLCYZT1o+G4hMXLJfvepLE0P0vnp24R2FGSzRSI0wKJswOYwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKOfOwHK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKOfOwHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709259920; x=1740795920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnLBJ9/GkyabQCRnoOIR/0ka8IYPntYmspTukM433Fw=;
  b=eKOfOwHKisAeVS739wr/De0K66gHSgcLuIF7/O4b4+l5eHmzu4C1FwkB
   xmfs7BRQjZVsxugD367Fk/MVL6ZAXV7gIpdJamEJpvZHBKqGEMoJFwKzk
   6LCirFV8ZY9EsEwnXtdvJ1ePiL3i7w2S/BRbEGoxto3lPHYVsaKXx0r68
   vOAz91o8R+FEubOPeNyzzwqthdly6FOaiG/lEBWad+G9wZAd1skKntbWP
   uTFl56C95hLxnqysUwYSvq4TZ1GdfRlmGS/0sUbHv++Kj+kQ6t4LH6eqQ
   8H0M6C5nrt3OILYIlBB+QfiPDPGSPf4r7lvJg4HlrBy24/zzlPaOYdWbJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14484324"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14484324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 18:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12587577"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 18:25:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfsa7-000DTM-0l;
	Fri, 01 Mar 2024 02:25:06 +0000
Date: Fri, 1 Mar 2024 10:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [linux-next:master 10220/11156] fs/f2fs/segment.c:4912:12: sparse:
 sparse: symbol 'f2fs_zone_status' was not declared. Should it be static?
Message-ID: <202403011059.7pTCPJX9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaegeuk,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 4b0d87ebb87528029a8ca6074fd035f252194395 [10220/11156] f2fs: print zone status in string and some log
config: powerpc-randconfig-r121-20240229 (https://download.01.org/0day-ci/archive/20240301/202403011059.7pTCPJX9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403011059.7pTCPJX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011059.7pTCPJX9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/f2fs/segment.c:4912:12: sparse: sparse: symbol 'f2fs_zone_status' was not declared. Should it be static?
   fs/f2fs/segment.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/f2fs/segment.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/f2fs_zone_status +4912 fs/f2fs/segment.c

  4910	
  4911	#ifdef CONFIG_BLK_DEV_ZONED
> 4912	const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {
  4913		[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
  4914		[BLK_ZONE_COND_EMPTY]		= "EMPTY",
  4915		[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICITE_OPEN",
  4916		[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICITE_OPEN",
  4917		[BLK_ZONE_COND_CLOSED]		= "CLOSED",
  4918		[BLK_ZONE_COND_READONLY]	= "READONLY",
  4919		[BLK_ZONE_COND_FULL]		= "FULL",
  4920		[BLK_ZONE_COND_OFFLINE]		= "OFFLINE",
  4921	};
  4922	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
