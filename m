Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E642AA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189826; cv=none; b=lkxgB4+YGUSTDPZo9KdeZJKbFqnvNHSofAuJ86KfwmH3Oj2Jry9SmsIoyl9pXWY4LoY/ImrQ8u9L1Ju7+8OBGVAiBfHVFEimPYTlF2ENHIMqIJ6q5lc0RnEA8aBh0QPaKTcB3mj/kvxIprJELA/8+NXF52crpYVc5PahXpMCvHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189826; c=relaxed/simple;
	bh=D+p/yG0J1EHETnjSNQMZZ/soq919BhOeSZtV5THhIo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nux3S34oqlhP2SV7Xai6rWayZkOiIn9pXTRGkR659/aXDowcn1CQ4YS3YXJxxLzxeXH4vRT/9jPcQF0fSftZd6AI9sd+CGPqvWD+isjaI8BG0JCMWtEOTuQg5MpJn7ehv5fvDjvU066mNfafapN3k+0Urw0Ig0/t+/e7NrINwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqCZpfwM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqCZpfwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767189825; x=1798725825;
  h=date:from:to:cc:subject:message-id;
  bh=D+p/yG0J1EHETnjSNQMZZ/soq919BhOeSZtV5THhIo0=;
  b=UqCZpfwMNTCNkVptAJsII7Rm+WewksEUaHRsZZ7sLDRYB7H4cqjvY+To
   NXLbAkND3+edE/oc2v90Y+vWnY8nhHQkVXtnfUSxli0/5D7Dc58jUURfQ
   DkXtff4XQlf7s7UPVbsboXc2pbVj1pKNVm24vasYo7kcmlsNqWAyn+8fx
   xzMCsL1ghDClKah8Ok60netPp2ARh6aVcjB5OaIXH/0CQVqfPKy9dmDIA
   yyxL5/lI3eHObe6eCmziDo1FA/s1s9aAlBFNqF4FnwpZEUPhbXN26kHgR
   xqVDCGFWtAm0HivnSiKhhtbbZWGleQjTJUV65oyruOxBKEMjRycIMky+L
   A==;
X-CSE-ConnectionGUID: nm4F+oFkR9GiUP4LioBXhw==
X-CSE-MsgGUID: 0LpTtQcQT3+oZaaPxf0Bbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67953853"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="67953853"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 06:03:44 -0800
X-CSE-ConnectionGUID: jxljxxMMT/mQFQZv8lfefg==
X-CSE-MsgGUID: yhLvnjsBQlSJZbC9Xxh1LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="232524689"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Dec 2025 06:03:43 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vawnc-000000001Fn-1JMO;
	Wed, 31 Dec 2025 14:03:40 +0000
Date: Wed, 31 Dec 2025 22:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/mmzone.c:118:47:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202512312122.3FIjP3iV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ecd8c13eebd9ac39eaa1b45d9fe23ff020c4e68c
commit: 14abb0c187843dc59614b0a461b291623ec1b3b6 [2/2] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: arm64-randconfig-r123-20251231 (https://download.01.org/0day-ci/archive/20251231/202512312122.3FIjP3iV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512312122.3FIjP3iV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512312122.3FIjP3iV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mmzone.c:118:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/mmzone.c:118:47: sparse:     expected unsigned int *flags
   mm/mmzone.c:118:47: sparse:     got restricted gfp_t *

vim +118 mm/mmzone.c

   115	
   116	enum zone_type gfp_zone(gfp_t flags)
   117	{
 > 118		trace_android_rvh_set_gfp_zone_flags(&flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
