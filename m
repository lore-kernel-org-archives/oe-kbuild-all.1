Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0B1189F5C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753986801; cv=none; b=F8/1VxLl3VxWOWTz2E+gdSWxfM6KIV0E2+gdmNKN2GmUX8DgNMb541TXj89k6Pujx4CJpicDzum0UmYjk4H4q+JZn5phy4teOhkqf2vrYPp6KQCACGrYALu+tGmtC7uEwYO7LEvshj9yB654hK+5QOlI10UsLQmTR+F2BRNrkJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753986801; c=relaxed/simple;
	bh=nGi83Fo8HWXw33ORxAdpwPtuiYcr7vffPeHiSiZK75g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGT0K5RnN80PThgoFmY1Uw43rry1d1z0BuuiK1JHI1+35qwpFTJlzMy7s5B3FmhJxtymV9bmeCqTV3ZVY9iIxiEcEPp1M7R246+U82UlfowL5tgHctFsf8YcjPTKtZi38qApnyuyUhiPSKb2KIIpvJtW0JQUDuG7WHqhnyqSquc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbZstxu9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbZstxu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753986799; x=1785522799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nGi83Fo8HWXw33ORxAdpwPtuiYcr7vffPeHiSiZK75g=;
  b=HbZstxu90w9z2HWn1/euo9pWRSuHxForjOoe4L9L5HTpRGp+d+5G6M8r
   PIIRsy3kSjah2fvh5bOBmH6zdYu/r2DEGKxSt8AtX95wlO3VpC5GXKuIh
   TvlyPtk/rhOJIgDiehHyFYzYur9zbSA0+kcfzrEJXJpqTjcINt3CU/4TI
   FqnOpGmN1WdeNon8qjvvjir1v0hWtgw/YkTm6xZ+rPTK4xp3yDOtqHiJ4
   MVR32wEx0YEDb6F2+4I+Ni9Hw23TKS1IYlXe5MMcg9cD4M+7JITtv2UoQ
   KP83mg/O211dIABfqTdfHokcW7e7hMNfrwrXC9ojj65ffP1spSzhZ0BE7
   A==;
X-CSE-ConnectionGUID: Ly+DSxtfRHeN1IFfxqPqMA==
X-CSE-MsgGUID: +iryiUjlS96upX+RD9AxkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56404408"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56404408"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 11:33:19 -0700
X-CSE-ConnectionGUID: jaVNikdAQUeiKjM74PoBOw==
X-CSE-MsgGUID: O2ktB5HpRI6zMly9xkgUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="162915965"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2025 11:33:18 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhY5b-000400-2E;
	Thu, 31 Jul 2025 18:33:15 +0000
Date: Fri, 1 Aug 2025 02:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 8/8] mm/gup.c:479:6: warning: no
 previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202508010249.NZMlXmEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bf0fb8bb181b86adf67dcc60b8269d60814de5a1
commit: 792718bb234ac19db3efdbc3215485e874c41584 [8/8] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: arm-randconfig-004-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010249.NZMlXmEK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010249.NZMlXmEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010249.NZMlXmEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:479:6: warning: no previous prototype for '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_trace_android_vh_mm_customize_longterm_pinnable +479 mm/gup.c

   473	
   474	/*
   475	 * trace_android_vh_mm_customize_longterm_pinnable is called in include/linux/mm.h
   476	 * by including include/trace/hooks/mm.h, which will result to build-err.
   477	 * So we create func: _trace_android_vh_mm_customize_longterm_pinnable.
   478	 */
 > 479	void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
   480			bool *is_longterm_pinnable)
   481	{
   482		trace_android_vh_mm_customize_longterm_pinnable(folio, is_longterm_pinnable);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
