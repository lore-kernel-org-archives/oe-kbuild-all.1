Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF343173
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723161618; cv=none; b=Yr0ENlyFYSI5T/P8VlhwVTm6JxWh3iA5eYTpaB30eMCOoWVSEIS0GducfTcQy6psj6xIFZXxJcA5z6Adx0OpP7Dfp7X/EIN8anZAyXQ55ngiBHB25n0U/92xVCQz5RSvNuJHliJslojB6txzfNMniY10yrNlP75O69sTyO0pi8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723161618; c=relaxed/simple;
	bh=ELw3J+v40diKaQCH6gYG3OYJmEDdceEu6aD0tTyW8Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bRfgrd6ZD5/GeTeSWmnC0hl+JMKKmjSYIpawUKCdNM9ctrzlwfMq5wDHbexWi/jFhQzDfPu4jqM1dcuYN5dMSJfxugd0i916iM31GuXpROWdPStmKZ9muTqNart1z3C4NV6mm6JG8CxnfYo3tlu81iO7lFH8fYK8RzYqueuqzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Db7q9bh2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Db7q9bh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723161616; x=1754697616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELw3J+v40diKaQCH6gYG3OYJmEDdceEu6aD0tTyW8Ok=;
  b=Db7q9bh2hGzKSQRaQNzLsjxK5Uw8IMlN5j/gW+39p1z/FHOkjTpUSeyf
   5S92IAtqCA3DETmD4+2mLkOMbiJWMKaJZVDWI2NwlS3FjOFBO5T2Oj9nM
   40UjFs8+hKZCeY3naXSN0Ce4j6xIQaoxkxPOHi8mBspnUgWeU0lN+KTL9
   TDyUrMmbV/xx9hQWyM8DpovaBsW6HXBEu0HyfR3W9DZwGYneMOAa/897y
   OiWMrYsOhmJ1MBln7w2fOdo3tdPGo3eamxBvUgieJ9BAS6cuRAbdbuU3T
   JWACfxbaO8Vv7P7VKWr25hYrgcQpwOxruC6RDMfSfn3xvNzE5USR3NhAC
   A==;
X-CSE-ConnectionGUID: lfLEG+XdS+i/oQmO3xPHSw==
X-CSE-MsgGUID: LTzqoxLYStKSr7g9nA9nMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="25191347"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="25191347"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:00:15 -0700
X-CSE-ConnectionGUID: DGVkeweISsyJVnykjapNGw==
X-CSE-MsgGUID: 6y0GxRdIT7qV+t8KiH+Zzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="88023711"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 08 Aug 2024 17:00:15 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scD3D-0006eE-2v;
	Fri, 09 Aug 2024 00:00:11 +0000
Date: Fri, 9 Aug 2024 07:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v4-2024-08-07 19/26] drivers/cxl/core/extent.c:44:4:
 sparse: sparse: symbol 'empty_tag' was not declared. Should it be static?
Message-ID: <202408090713.lSbvd5dx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v4-2024-08-07
head:   9e6891fa14e880557d502a78bae03e40402b41c6
commit: 2cc7420ec9ad454f4a828a6e2c8279f5ac1e8b82 [19/26] cxl/region/extent: Expose region extent information in sysfs
config: x86_64-randconfig-121-20240809 (https://download.01.org/0day-ci/archive/20240809/202408090713.lSbvd5dx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090713.lSbvd5dx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090713.lSbvd5dx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/extent.c:44:4: sparse: sparse: symbol 'empty_tag' was not declared. Should it be static?

vim +/empty_tag +44 drivers/cxl/core/extent.c

    43	
  > 44	u8 empty_tag[CXL_EXTENT_TAG_LEN] = { 0, };
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
