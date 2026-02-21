Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1688D1C28E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771680853; cv=none; b=WsgICIw5C7a6NrNC7wjN1mOs3g73nI9+dYbKqxnrCChEht5WdPRoNbu/6Ae7hREqziAwvn+RkQ3sGrmu/u3c2AJJe1QkXCISEYptI8KbgIvTeZfQBzu8K82MU/JRg7Y4MZqKUXUp6Y+Cb8j6by5aGDYFiGyI6eI4aw8v8uO+aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771680853; c=relaxed/simple;
	bh=3+4Yo0gn0/COZT4BeglDsJr70K3UcwB7e7s0IpFhDIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iIqWyiBg3SZxIuLqJecQ30jq+ng28O11ZpvjfboP1vKM3v1364iLH7qc0ZlFXL4L/IbEpjabQVVdvh+i7wVqLyPJo6fiQ3OI8Bd8vadOX0xSydSncOjim41zvrMlQdEHy1Xl7rFNxX4t3gMIFBcc/gCwaVsaN5Iwb1ONf/d/vRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5Z0Iw5c; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5Z0Iw5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771680851; x=1803216851;
  h=date:from:to:cc:subject:message-id;
  bh=3+4Yo0gn0/COZT4BeglDsJr70K3UcwB7e7s0IpFhDIc=;
  b=j5Z0Iw5cKY/580yhy9xuwekHmwktpb0zgJLwA1vjRkadg5V7Cn68bg2F
   rjGLwdauAppJYpy2xdf5Wx4zz7iFXLFQiX5j4FSb/GLLPrF124ZcXAMvm
   SeanF/ohpKYidI4cUGLhI6Czhib2D/KGzPKpzmB+Qu4YaEABd4VFm04/p
   IAW+M0qP2ZN+V4P5Xg/6zOFgnMgEh0fuTqQXGceYCLSrVAc9zkSg/rRvO
   YR1PRK/EkTcg2NB6RS9Nh++oqr3mmdZHA96kjCPK/h64HXkGuXnqB9GiK
   55Ubr3bxkY6t4kOZoqg05Hslaap9ajW9iHvfZZdBYH4Wn4ZynO6wPlq16
   Q==;
X-CSE-ConnectionGUID: N5HKxhJ7SJu5B/hUgEOFng==
X-CSE-MsgGUID: QswTmnWPRlykabtzCt4oiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72732608"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72732608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 05:34:10 -0800
X-CSE-ConnectionGUID: CC+xtXnNTCSkCATQ1o3J6A==
X-CSE-MsgGUID: K1yrRD6PSD+KLspxGWPK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219614845"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Feb 2026 05:34:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtn7W-000000014we-0Wdx;
	Sat, 21 Feb 2026 13:34:06 +0000
Date: Sat, 21 Feb 2026 21:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:lkp/page_alloc-unmapped 20/20] ERROR: modpost:
 "mermap_mm_init" [mm/tests/page_alloc_kunit.ko] undefined!
Message-ID: <202602212150.Brivt9UN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   bde871371ec16d6d1168f9ed687e60ba2e49acd0
commit: bde871371ec16d6d1168f9ed687e60ba2e49acd0 [20/20] mm: Minimal KUnit tests for some new page_alloc logic
config: x86_64-randconfig-071-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212150.Brivt9UN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212150.Brivt9UN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212150.Brivt9UN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/tests/page_alloc_kunit.o
>> ERROR: modpost: "mermap_mm_init" [mm/tests/page_alloc_kunit.ko] undefined!
>> ERROR: modpost: "kernel_page_present" [mm/tests/page_alloc_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
