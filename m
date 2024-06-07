Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3876CB64E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 07:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717744718; cv=none; b=iTU4hN2MpOb5prxioEB374zlHhuMCokyWYXyJYEmGN5oxyseYVCpeY1jAcfjtN1ZS4fRLSbvooqnPkTbhoSbKqw4iMtXatb+KOeuOcgbX1UbzqRfelUPJ6CiI3ryP9d2VxCXQdcZ0mdOwbSHu4vjcFzWFfTRKsuxoxRYNndPWC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717744718; c=relaxed/simple;
	bh=n8XyCpC54dLGD+3b6AU+F8CsYHoitMK4INsX4iE24ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVN4ynheLjhwP28ztQuQAuNDXm8pqhVDMCgh5aI7//2Xt14EMVkg5d9FwJalQQuoQxRIxVNG52LJ2rvDlXpcfM37cFx5FCwDldWv1qTbEnYxJygApM7W2ifGXcvmfXzCK5+MJleielPXNgJw4brMIyWKL2qT1wtjmOdea2WINjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdkhjBVY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdkhjBVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717744717; x=1749280717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n8XyCpC54dLGD+3b6AU+F8CsYHoitMK4INsX4iE24ws=;
  b=gdkhjBVYuRnSU+5OK8Ne02pIycXzqYG9/jVDebwnRKHnW6LITAoTplKO
   Oad3LR42GpRY6dkAH4j7Yz4LOmm85UXMD31I5RvLFcLMfH+JDu7K+QqVU
   NOvm/5WqGW/xPeKwfYtzZCjApsStb43O2Iui6F/tUO177NDjZ1u5LYPj3
   oVgn5UVIWYAGJhn56AY8sPQ1JMxg6NiQ+m4vK8JNmUVWbYcGvf5eQJ9/L
   ds7NnpdNQ3fLsG+nyBgd+TwK1FgVJSP1B4bgarkNbUkk7lGOvpifTDf80
   f1OaQAWu49RDt1kbU3DONW4XALTDO0YLXibYxbrWYzbXfNpDi0p9ltyEP
   g==;
X-CSE-ConnectionGUID: E7feHpvbRr6mF6zyCnz+DA==
X-CSE-MsgGUID: 1xr16SasRaKaVA6CeVSsEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17381750"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="17381750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:18:36 -0700
X-CSE-ConnectionGUID: PT5hB1JzRZW/Zub46xwF5Q==
X-CSE-MsgGUID: mwNrxT6WR1Cb2yHr3R45sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="42804802"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jun 2024 00:18:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFTrt-0004Ck-1i;
	Fri, 07 Jun 2024 07:18:33 +0000
Date: Fri, 7 Jun 2024 15:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/2]
 drivers/android/android_debug_symbols.c:49:31: error: use of undeclared
 identifier 'try_to_compact_pages'
Message-ID: <202406071550.GzEVo0rH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   08901ec9f16528acf557b4c8c66883508e1810a4
commit: 7d32bc386a2608acecce8a43089b169d2dad0e05 [1/2] ANDROID: android: Add symbols to debug_symbols driver
config: i386-randconfig-016-20240607 (https://download.01.org/0day-ci/archive/20240607/202406071550.GzEVo0rH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071550.GzEVo0rH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071550.GzEVo0rH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/android_debug_symbols.c:49:31: error: use of undeclared identifier 'try_to_compact_pages'
      49 |         ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
         |                                      ^
   1 error generated.


vim +/try_to_compact_pages +49 drivers/android/android_debug_symbols.c

    33	
    34	/*
    35	 * This module maintains static array of symbol and address information.
    36	 * Add all required core kernel symbols and their addresses into ads_entries[] array,
    37	 * so that vendor modules can query and to find address of non-exported symbol.
    38	 */
    39	static const struct ads_entry ads_entries[ADS_END] = {
    40		ADS_ENTRY(ADS_PER_CPU_START, __per_cpu_start),
    41		ADS_ENTRY(ADS_PER_CPU_END, __per_cpu_end),
    42		ADS_ENTRY(ADS_TEXT, _text),
    43		ADS_ENTRY(ADS_SEND, _end),
    44		ADS_ENTRY(ADS_MEM_BLOCK, &memblock),
    45		ADS_ENTRY(ADS_INIT_MM, &init_mm),
    46		ADS_ENTRY(ADS_ITERATE_SUPERS, iterate_supers),
    47		ADS_ENTRY(ADS_DROP_SLAB, drop_slab),
    48		ADS_ENTRY(ADS_FREE_PAGES, try_to_free_pages),
  > 49		ADS_ENTRY(ADS_COMPACT_PAGES, try_to_compact_pages),
    50	};
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
