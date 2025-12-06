Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80A3178372
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765008773; cv=none; b=sw6mSbedQ81YGp5Hj7rywZulOLng4Ry++mf7AZl8OPtZmRaL51Xy0DNApR6MCf+bliNrVPbKhIlENRiK/KOilH5OV2PLAZWZMz2K/WwpAzQjlx21woheNuZTIRXrecvm58ZzjylFWVTS1jVLYcL/Du5QpQFVwZW5+Tq2+HIO0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765008773; c=relaxed/simple;
	bh=8pbK0755qbTUPWBGAznK3QNVzA2aICnOZmTXAvMtDcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NC8XLk4IBXbARMtEGVnTw3JpBldXkcYOtr+q3LDMXpqhosDTooZErZdw5wg9S4VhrYkhBV/q/7L5EeEAYAZATJJRXQcbaMsOaiMU1qKLijYtMIVjSldDVlu18VUbKgaO5kMA7H2x/ErkJ6LfVdhuJiQdvyBw1X92rVzhrGnS/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PI42npoC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PI42npoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765008771; x=1796544771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pbK0755qbTUPWBGAznK3QNVzA2aICnOZmTXAvMtDcc=;
  b=PI42npoCZgT/2c++YqQIyYVEf1xV/h9xtlHS0YBX36JlbJoENejBsZjx
   IMp6GzzoG/bjpO7JTdH8vv9yL+l6Gj6IGC3dJIwHHfucYpr+aa3MIkjJu
   NMgMx07mYRqDiOMd27eAcpPwb9nzjaBztCBauXbgcCIMqnGSTu1DmLoWj
   tzs+iyMkYSQGlOSzQh/A6/ZW3hU/rP0ey8NyzX69/QFtAgS+TX5HHdr3R
   hU1nhT/Hbpv8Vyivj6aj/lQUbetizUTLqeE2FdZiFyj0SR478nbkRiI44
   hRDUcpeWWnexbLBwo+FFJG6k9Lbb1G+FZf9xIkt2zU7tTN63KqJfiGZ7P
   w==;
X-CSE-ConnectionGUID: XxA7n+tDQH6JkiRlnE7QXA==
X-CSE-MsgGUID: qFqN8pKlTFm3LUda8Z/hnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="92510633"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="92510633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 00:12:51 -0800
X-CSE-ConnectionGUID: ixQBh36mRSGzhNkBegDrxw==
X-CSE-MsgGUID: MPfmv6oTR+azPRCjqaTJ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199971728"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Dec 2025 00:12:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRnPL-00000000G1J-0GIP;
	Sat, 06 Dec 2025 08:12:47 +0000
Date: Sat, 6 Dec 2025 16:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>
Subject: lib/tests/printf_kunit.c:339:2: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 1, 2)' attribute to the declaration
 of 'test_hashed'
Message-ID: <202512061600.89CKQ3ag-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tamir,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416f99c3b16f582a3fc6d64a1f77f39d94b76de5
commit: 7a79e7daa84e230266184a2018507551086c2317 printf: convert self-test to KUnit
date:   9 months ago
config: arm-randconfig-r072-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061600.89CKQ3ag-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061600.89CKQ3ag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/tests/printf_kunit.c:339:2: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 2)' attribute to the declaration of 'test_hashed' [-Wmissing-format-attribute]
     325 | static void
         | __attribute__((format(printf, 1, 2))) 
     326 | test_hashed(const char *fmt, const void *p)
     327 | {
     328 |         char buf[PLAIN_BUF_SIZE];
     329 |         int ret;
     330 | 
     331 |         /*
     332 |          * No need to increase failed test counter since this is assumed
     333 |          * to be called after plain().
     334 |          */
     335 |         ret = plain_hash_to_buffer(p, buf, PLAIN_BUF_SIZE);
     336 |         if (ret)
     337 |                 return;
     338 | 
     339 |         test(buf, fmt, p);
         |         ^
   lib/tests/printf_kunit.c:147:51: note: expanded from macro 'test'
     147 |         __test(expect, strlen(expect), fmt, ##__VA_ARGS__)
         |                                                          ^
   lib/tests/printf_kunit.c:326:1: note: 'test_hashed' declared here
     326 | test_hashed(const char *fmt, const void *p)
         | ^
   1 warning generated.


vim +339 lib/tests/printf_kunit.c

707cc7280f452a lib/test_printf.c        Rasmus Villemoes 2015-11-06  324  
7a79e7daa84e23 lib/tests/printf_kunit.c Tamir Duberstein 2025-03-07  325  static void
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  326  test_hashed(const char *fmt, const void *p)
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  327  {
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  328  	char buf[PLAIN_BUF_SIZE];
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  329  	int ret;
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  330  
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  331  	/*
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  332  	 * No need to increase failed test counter since this is assumed
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  333  	 * to be called after plain().
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  334  	 */
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  335  	ret = plain_hash_to_buffer(p, buf, PLAIN_BUF_SIZE);
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  336  	if (ret)
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  337  		return;
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  338  
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04 @339  	test(buf, fmt, p);
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  340  }
4d42c44727a062 lib/test_printf.c        Andy Shevchenko  2018-12-04  341  

:::::: The code at line 339 was first introduced by commit
:::::: 4d42c44727a062e233e446c6c86da1c84d762d79 lib/vsprintf: Print time and date in human readable format via %pt

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
