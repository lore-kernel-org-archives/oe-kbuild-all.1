Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7A923A99F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 16:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194085; cv=none; b=U2v5eqrDr/b9SPYr8LyHJwwhAkHOUPwcTrG4V3nn0jPSxkVfRM+2jj4JirQAHWgj53pj1w8gBw4nzdCMMbPsmIV2YJ+ba6xpYbmUOeqzpzMBZHnOc6CXTduKm8Ycax2JqoIfY85GG58xXH2uPpG9pd99oMqkofwM3/voTKgIBPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194085; c=relaxed/simple;
	bh=LB+rVJLHBlER+OmdWm9hKgJ6AWcVB3ZCx3TlUvmhWQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UdNsnnR6k60t5iDovoiuXLmYgMvDqrcyWog1Q+X0bqM5PnjjqX+kcoIel5H3zTY1tXN4xyW2hcSyWJxIzrrUPpPILWTWU6W1l4bybakQNw2X7Dqe5bXiqsf8wa4giR3HlS9YVWIOtigB26ShG/KaQJQMfgi9ylf/FGHchDcCFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krRwswsj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krRwswsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781194085; x=1812730085;
  h=date:from:to:cc:subject:message-id;
  bh=LB+rVJLHBlER+OmdWm9hKgJ6AWcVB3ZCx3TlUvmhWQI=;
  b=krRwswsjfDexH0XfKE8CoTyhbMnjpoRGZ8TA0MEd/FWWF0SoXS2omgEw
   ObTJGVCWVUpXqwEL+Kbg8ml9TTpMCA+WA5Rz9HWKYRpg0LXD34ntBfbeI
   y9/KpSDIP9/1nH+x//rI6LCwj+aPhuT0FX4wZ9fzFq7Dc/X/TUmY0tUWM
   8e0CXXIZJDroMptyjKOeNfvlJdUDN5GpnpTa32iE6hjFI2svv+k7rdo9L
   hgxoDEIxl7kQ6Et7LGFeVpHyB675iHjmvCvKTEXjdGs4K5uzlbnT0YsW2
   NrcKrSMMj+6y4+wR4SPgz1hNZAiYu4zOMd4ziQYbNelR/4FV4vzQxmDaS
   Q==;
X-CSE-ConnectionGUID: G5Jq/c3/Rtepphz4wblFDg==
X-CSE-MsgGUID: J/xax8hmQlmufRbjc8H0iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93119589"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93119589"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:08:05 -0700
X-CSE-ConnectionGUID: qo9GLh1qSt6Or1irnRPESw==
X-CSE-MsgGUID: cOpAVFtXSlWptRrr/zfn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270193322"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 09:08:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXhwm-00000000NQy-1B6c;
	Thu, 11 Jun 2026 16:08:00 +0000
Date: Fri, 12 Jun 2026 00:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-01 0/1] mm/gup.c:408:6:
 warning: no previous prototype for
 '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202606120026.7G7aEkIW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-01
head:   8f9e170c392732a2d092ff485e4eec4226e42830
commit: 05787dce1ef1cfa228a7c75941480d4267411440 [0/1] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: i386-randconfig-017-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120026.7G7aEkIW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120026.7G7aEkIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120026.7G7aEkIW-lkp@intel.com/

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
