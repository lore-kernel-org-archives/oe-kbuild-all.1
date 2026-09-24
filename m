Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6891037F337
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248618; cv=none; b=czBsmebl9/iW9K1orIqvHmVbRez/Mz3h1gqDN1JFNKDeesffB35JVMBUmjPPsgIIbb3rSJXBeAG/H6u+ZxvProq0L418k744O4j0ZoRw9Q5FMhQoycnxNX1dPqjZtQ0B1se3wxFMhA9p/s/3gl1W4KXUCYr76lSsuXWqOgORjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248618; c=relaxed/simple;
	bh=Mlg5fsw6WCTKic3vHFpdmtywrghSfbJGiccWZjjkbqQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mR2MC0bWv3cUzGDULRZVVSleUCObjq8jAujssa8swDCMfz03CSFPxjl/1sRVXVu4AS5cMlhcNoboaxggRiV4rC5ohO64KtRTRz23c49ZN0QwXSrGDcdlCzMBJN2/VCYQbYxGUXGRfIe3SrCwl6FfvgPnzVDZ4j8rz5wo8Q55IIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtMuQ/HZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtMuQ/HZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790248613; x=1821784613;
  h=date:from:to:cc:subject:message-id;
  bh=Mlg5fsw6WCTKic3vHFpdmtywrghSfbJGiccWZjjkbqQ=;
  b=YtMuQ/HZIAzNx9RkiS7Zm7QBcee9umH2fmsk2Rsa68xWG07iZH7T9iQd
   zXIorRFyb3taZ7eKOnZHMqLUIAvvpAFE7RfU3kA9wBCSjDNMhJ2480eQF
   dvx61ZiQSg3XgJXd39q8f/VAtytsuDXDJbhNhcGtHWH68YMl0cJL+DKL6
   m/3jormAbGcnFkncX11v0SkBOcBFPYUVyrByJ5N17g9upPVt09HFSCfMB
   WgwRY4HbI0OcxXylWNZHvx+00hr/F/vpBlhokkjRdinKWWlyFXpJutcxp
   g+iQnQrOvmU8gmu+xgU+Bq0JzU/786EGtAjDZjB4UagBTkewVKu/nyFJK
   Q==;
X-CSE-ConnectionGUID: L+MgOtBXTS6cl/M7LsBqxg==
X-CSE-MsgGUID: yWjlqNZLSea0vx71vSitzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101671647"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101671647"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 04:16:48 -0700
X-CSE-ConnectionGUID: i/8MO6lnTW6UEBHe4Fiz8A==
X-CSE-MsgGUID: pZttZg01StCEGoO2yP2lvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="274202131"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2026 04:16:47 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9hRU-000000000JK-3KGz;
	Thu, 24 Sep 2026 11:16:44 +0000
Date: Thu, 24 Sep 2026 13:16:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] mm/gup.c:408:6: warning:
 no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202609241302.ZwTBLS5p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c905c29016dd2dbf8df45e7c0287455f67ef165b
commit: 9309f0022ffe8a1b6714f8d70dfa9f57e428a6d2 [2/2] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: arm-randconfig-r2105-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241302.ZwTBLS5p-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241302.ZwTBLS5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241302.ZwTBLS5p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:408:6: warning: no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     408 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_trace_android_vh_mm_customize_longterm_pinnable +408 mm/gup.c

   402	
   403	/*
   404	 * trace_android_vh_mm_customize_longterm_pinnable is called in include/linux/mm.h
   405	 * by including include/trace/hooks/mm.h, which will result to build-err.
   406	 * So we create func: _trace_android_vh_mm_customize_longterm_pinnable.
   407	 */
 > 408	void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
   409			bool *is_longterm_pinnable)
   410	{
   411		trace_android_vh_mm_customize_longterm_pinnable(folio, is_longterm_pinnable);
   412	}
   413	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
