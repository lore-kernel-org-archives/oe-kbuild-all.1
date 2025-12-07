Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4E1F956
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765074139; cv=none; b=I9Z9w8wB7PGvBnb7T3R6fuq4tyP5/iP2w6ToOSPw/BkQWqX2yHo5Fy4jnlG8TsoMk7KSLy4bVXW5qm5IBl/29OMNL+uviHWx5FK1Bl1FmjzYiDp+e7ZnIMatcftvQheUB/n+2THzTNi21FI/EhMCIVs+BngTQ3rrf8se0ziwWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765074139; c=relaxed/simple;
	bh=x9ypJwRg+BYnwRXVhUS6eiOLj6GlGziDtiKxjBXC73Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmQM0aFiiLgOrq46nHbxZI0DEHWgQoyDvQvxS98UtoGHhdYhXitdXBWlFFZHlyVpBOV9kgaWJ7lUK3Ac1ysoFFXBSRYG1jfsd1ClPPvbJu2Ttyz1sSDOEDDbrqM2oj0xAG8KRTRP1utCK53kgnINTezFAlkHVWfzYHJQUB+c5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MrBZLsSt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MrBZLsSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765074137; x=1796610137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9ypJwRg+BYnwRXVhUS6eiOLj6GlGziDtiKxjBXC73Q=;
  b=MrBZLsStbxD6XJHwK4J5hQzG3rpTGtBAs1QLrlU2njNiDbBUf7gCso01
   Tfsh3ojYTtrgT1YMhCf3KEQXp7bAfrJM+DO+e7JUz7INRLcjxX9vEzBm/
   m/C5BcsqlSNDanlRXcDKvwJn27pBxvvX3fQKr32bc4C1PRYKkBb172/KI
   cWfmPj2hkYtUbuqmBPbqU041BmLSqhfP9XjiodPx4/r1uIa53k74JxPEt
   frmwjB9ilYp5w9SgOhFQrbf8cPaFnekCfR//JwX/Og7l+U57d9Mw+y6KH
   saRkR98Oh2QzdwGkVnra+w10UEwsFdQciyKAKaL/z/V3USfKF0sYkBUcm
   w==;
X-CSE-ConnectionGUID: GmBC9R68QU2dSp4hJslymg==
X-CSE-MsgGUID: FUz5Sv0rTH6LyePHmj/bpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="67099304"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="67099304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 18:22:17 -0800
X-CSE-ConnectionGUID: nmAFFOiYSR2Oqy60/0TblQ==
X-CSE-MsgGUID: pHGRY2GWRTujyLxOWI1axA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200754688"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2025 18:22:14 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS4Pb-00000000IvV-1pNV;
	Sun, 07 Dec 2025 02:22:11 +0000
Date: Sun, 7 Dec 2025 10:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] printf: add __printf attribute
Message-ID: <202512070958.HMqvski6-lkp@intel.com>
References: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com>

Hi Tamir,

kernel test robot noticed the following build errors:

[auto build test ERROR on 559e608c46553c107dbba19dae0854af7b219400]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/printf-add-__printf-attribute/20251206-212115
base:   559e608c46553c107dbba19dae0854af7b219400
patch link:    https://lore.kernel.org/r/20251206-printf-kunit-printf-attr-v1-1-1682808b51d0%40gmail.com
patch subject: [PATCH] printf: add __printf attribute
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20251207/202512070958.HMqvski6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512070958.HMqvski6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512070958.HMqvski6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/printf_kunit.c:271:1: error: 'format' attribute argument 3 value '3' does not refer to a variable argument list
     271 | {
         | ^


vim +271 lib/tests/printf_kunit.c

707cc7280f452a lib/test_printf.c        Rasmus Villemoes 2015-11-06  268  
c23bf7282349cc lib/tests/printf_kunit.c Tamir Duberstein 2025-12-06  269  static void __printf(2, 3)
81a03aa9b88c5d lib/tests/printf_kunit.c Tamir Duberstein 2025-03-07  270  test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04 @271  {
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  272  	char buf[PLAIN_BUF_SIZE];
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  273  
81a03aa9b88c5d lib/tests/printf_kunit.c Tamir Duberstein 2025-03-07  274  	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  275  
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  276  	test(buf, fmt, p);
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  277  }
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
