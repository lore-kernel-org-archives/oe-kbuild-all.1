Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E330AD1A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774782046; cv=none; b=JJPdR+hPKCUtRMMUhM8uu9cOarlB+HkAhmbZ/W+ESpSCUSjIvypDOCJi+LBx1q6V2aUX1YhUSvx/551jGxI9Q2RbQlQy7/t6XUomdCQmUp0OcwAdbTQK3DSumc4F9RLu9xJanO9HlGsglvbFM8BQ/ALF5MJH09RdDNvRzB6hpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774782046; c=relaxed/simple;
	bh=gwRpwduG+6A3Tr/k35sd3BuoX94ADNWv0reYdxIJhV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OKo2UhTDDhoU36tIiaGU0vUaXkQiE4pQpHIyDTL9QcKpaD0WqB+riRcMF8T0SMYY1XRSEayL0P29GrQpib5g294pvQo9fNkm4lOnnN4XRe1TcnlmFyv+DKULiGY+HRQyd67R2rhhr1KTf4bFs5BmmdQL+kKmwBT//2L83YfMx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFnNTC/a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFnNTC/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774782045; x=1806318045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwRpwduG+6A3Tr/k35sd3BuoX94ADNWv0reYdxIJhV0=;
  b=NFnNTC/afvPDZhxBsAIgMIVF7F+nvdraSQ12n88bNEqiUhkkC5rBG+Hj
   ByUxnvp1S0ciXMrVp6NBeqc+jmXvMB8APp8ivfDIkim7wDkoVuTzRslFf
   ESKpSJRHLhWxB6WdsafiD851gsalY4+MiF9IWvNCfVlfyutcCs5r/XMf9
   R4sbkI00mc+hdOkG7a2xqyKsiLUiqgc6idzOTDfJtZ01wn44wETv6DFhZ
   ytfYbt4da3UDBb2rj88un+tKXo+Ad1rEuQcoy79WKauVU3sLscZok8JUH
   fPU4IYKISTz4X+5Cr298wSoVWjEPjT0+4qNxHkRcxAEqUTI+T+YEuErWN
   A==;
X-CSE-ConnectionGUID: K2jBInRzTzOzTZI/jQUkOQ==
X-CSE-MsgGUID: v1VGXApYRsyBOufltg+leA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75677131"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="75677131"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:00:45 -0700
X-CSE-ConnectionGUID: cmm5UlAFR5GXd1+BNa9v4A==
X-CSE-MsgGUID: S8inByrRTlqUFdonxFGgVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="224799546"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Mar 2026 04:00:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6nsn-00000000CIf-0GXu;
	Sun, 29 Mar 2026 11:00:41 +0000
Date: Sun, 29 Mar 2026 18:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cached-prefix 86/89] lib/dynamic_debug.c:1929:32:
 warning: shift count >= width of type
Message-ID: <202603291848.JyVbS8zl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cached-prefix
head:   a138e116d24e080d1c0778ca2bbb7b9cc4770e9b
commit: b00af02b193459e4b8f56031f395c3cfa10fc506 [86/89] dyndbg: cache the dynamic prefixes per callsite.
config: arm-lpc32xx_defconfig (https://download.01.org/0day-ci/archive/20260329/202603291848.JyVbS8zl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291848.JyVbS8zl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291848.JyVbS8zl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1929:32: warning: shift count >= width of type [-Wshift-count-overflow]
    1929 |         return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1925:43: note: expanded from macro 'DDEBUG_PREFIX_KEY_ADDR_MASK'
    1925 | #define DDEBUG_PREFIX_KEY_ADDR_MASK ((1UL << DDEBUG_PREFIX_KEY_FLAGS_SHIFT) - 1)
         |                                           ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1930:45: warning: shift count >= width of type [-Wshift-count-overflow]
    1930 |                 ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                           ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1982:15: warning: variable 'mod_ct' set but not used [-Wunused-but-set-variable]
    1982 |         int ret = 0, mod_ct = 0;
         |                      ^
   3 warnings generated.


vim +1929 lib/dynamic_debug.c

  1926	
  1927	static unsigned long ddebug_prefix_key(const struct _ddebug *desc)
  1928	{
> 1929		return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
  1930			((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
  1931	}
  1932	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
