Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C41465B7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 20:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712606887; cv=none; b=S7ZmVNT3f+4mbkGBKZ/jis2N70H0zp4TuuyVvTizxLPaZwpuL51dV6mjCfzZLcT26VMZ+5oCQx2hc7bGiUPTriy9sNWdQyudxM+9xqM6l6p8hL9h27z2XQPwQ1Ai/7WFOyvSN6fC9QOJq2It0oVWribklzhuWzIPlb7mxpsWTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712606887; c=relaxed/simple;
	bh=HDhjStkm1FenaZ9CbDp1mKw4FXlb7u6EqInpKttJdYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTnt08cqxZeivdnr/8UhbEXMI+dmJZtj+Y6mitUjp9n1DLYmze6shyBNNAQXkHPHtRdpOZR2e4R6n2lx40y8md28QdGBZdbqEB/1vHuLI7Odf8xFpRPK6qBfOf505fY29DHFe6S/BTMvPUB2rjOPJsId52L/37TWYA3MaL/nIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARnLarLt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARnLarLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712606885; x=1744142885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HDhjStkm1FenaZ9CbDp1mKw4FXlb7u6EqInpKttJdYw=;
  b=ARnLarLtzQsJk4v0NgMleVuU7Lk1CgZK/ATX9WNaR3deRbkPfosm9Xm7
   c+43JBihwqCLgUnGk7rzgCu0DVtBWyBn6wc3qUihWFLRmOx08G68mAvbM
   YL4AtxPL2pipxziizbIZ98TEYcEmm3xGQclzi97bkCJsiscuEnqmHaLD3
   APFQwBv/2B5iPhdusYp53ooTV6w9JHibXgOHZsWjbJobiadSKvVkzTDfg
   WC3giujtfPB13hynqw+xHaNXnpzrPwr2l4HUEvO0cDgftCYGNKGgOUjtj
   dt6y3WP4fOfJHNLCuNuZq97AFxv6VEvR4bMGy3LNB4lhLH543btJuxD3e
   w==;
X-CSE-ConnectionGUID: 8SXeACDYSJS9sGIc8iYiQw==
X-CSE-MsgGUID: NIHvzsdHRwumhoCKr4G7qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18512805"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="18512805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 13:08:04 -0700
X-CSE-ConnectionGUID: bW2oY2OOQlWAqnJ917ksLg==
X-CSE-MsgGUID: mNZff9rRQKaJ4+n0xgVlJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="50985725"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2024 13:08:03 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtvHb-0005Sg-2v;
	Mon, 08 Apr 2024 20:07:59 +0000
Date: Tue, 9 Apr 2024 04:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/144] lib/kstrtox.c:464:18: error: conflicting
 types for 'kstrtoull_from_user'; have 'int(const struct iov_iter *, size_t,
  unsigned int,  long long unsigned int *)' {aka 'int(const struct iov_iter
 *, long unsigned int,  unsigned int,  long long unsigned int *)...
Message-ID: <202404090444.XSg4jjCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   1b82b543d52b554590942733a069919265a5f27b
commit: 0e32bf18f84067b75d543d34fe510f00b75b20f7 [8/144] kstrtox: add iov_iter versions of the string conversion helpers
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404090444.XSg4jjCB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090444.XSg4jjCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090444.XSg4jjCB-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/kstrtox.c: In function 'kstrtobool_from_iter':
   lib/kstrtox.c:418:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
     418 |         if (!copy_from_iter_full(buf, count, src))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   lib/kstrtox.c: At top level:
>> lib/kstrtox.c:464:18: error: conflicting types for 'kstrtoull_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long long unsigned int *)'}
     464 | kstrto_from_iter(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:439:18: note: previous definition of 'kstrtoull_from_user' with type 'int(const char *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long long unsigned int *)'}
     439 | kstrto_from_user(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
   In file included from lib/kstrtox.c:17:
>> lib/kstrtox.c:464:18: error: conflicting types for 'kstrtoull_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long long unsigned int *)'}
     464 | kstrto_from_iter(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:464:1: note: in expansion of macro 'kstrto_from_iter'
     464 | kstrto_from_iter(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:439:18: note: previous definition of 'kstrtoull_from_user' with type 'int(const char *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long long unsigned int *)'}
     439 | kstrto_from_user(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:465:18: error: conflicting types for 'kstrtoll_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long long int *)'}
     465 | kstrto_from_iter(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:440:18: note: previous definition of 'kstrtoll_from_user' with type 'int(const char *, size_t,  unsigned int,  long long int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long long int *)'}
     440 | kstrto_from_user(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:465:18: error: conflicting types for 'kstrtoll_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long long int *)'}
     465 | kstrto_from_iter(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:465:1: note: in expansion of macro 'kstrto_from_iter'
     465 | kstrto_from_iter(kstrtoll_from_user,    kstrtoll,       long long);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:440:18: note: previous definition of 'kstrtoll_from_user' with type 'int(const char *, size_t,  unsigned int,  long long int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long long int *)'}
     440 | kstrto_from_user(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:466:18: error: conflicting types for 'kstrtoul_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long unsigned int *)'}
     466 | kstrto_from_iter(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:441:18: note: previous definition of 'kstrtoul_from_user' with type 'int(const char *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long unsigned int *)'}
     441 | kstrto_from_user(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:466:18: error: conflicting types for 'kstrtoul_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long unsigned int *)'}
     466 | kstrto_from_iter(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:466:1: note: in expansion of macro 'kstrto_from_iter'
     466 | kstrto_from_iter(kstrtoul_from_user,    kstrtoul,       unsigned long);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:441:18: note: previous definition of 'kstrtoul_from_user' with type 'int(const char *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long unsigned int *)'}
     441 | kstrto_from_user(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:467:18: error: conflicting types for 'kstrtol_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long int *)'}
     467 | kstrto_from_iter(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:442:18: note: previous definition of 'kstrtol_from_user' with type 'int(const char *, size_t,  unsigned int,  long int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long int *)'}
     442 | kstrto_from_user(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:467:18: error: conflicting types for 'kstrtol_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  long int *)'}
     467 | kstrto_from_iter(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:467:1: note: in expansion of macro 'kstrto_from_iter'
     467 | kstrto_from_iter(kstrtol_from_user,     kstrtol,        long);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:442:18: note: previous definition of 'kstrtol_from_user' with type 'int(const char *, size_t,  unsigned int,  long int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  long int *)'}
     442 | kstrto_from_user(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:468:18: error: conflicting types for 'kstrtouint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  unsigned int *)'}
     468 | kstrto_from_iter(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:443:18: note: previous definition of 'kstrtouint_from_user' with type 'int(const char *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  unsigned int *)'}
     443 | kstrto_from_user(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:468:18: error: conflicting types for 'kstrtouint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  unsigned int *)'}
     468 | kstrto_from_iter(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:468:1: note: in expansion of macro 'kstrto_from_iter'
     468 | kstrto_from_iter(kstrtouint_from_user,  kstrtouint,     unsigned int);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:443:18: note: previous definition of 'kstrtouint_from_user' with type 'int(const char *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  unsigned int *)'}
     443 | kstrto_from_user(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:469:18: error: conflicting types for 'kstrtoint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  int *)'}
     469 | kstrto_from_iter(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:444:18: note: previous definition of 'kstrtoint_from_user' with type 'int(const char *, size_t,  unsigned int,  int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  int *)'}
     444 | kstrto_from_user(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:469:18: error: conflicting types for 'kstrtoint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  int *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  int *)'}
     469 | kstrto_from_iter(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:469:1: note: in expansion of macro 'kstrto_from_iter'
     469 | kstrto_from_iter(kstrtoint_from_user,   kstrtoint,      int);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:444:18: note: previous definition of 'kstrtoint_from_user' with type 'int(const char *, size_t,  unsigned int,  int *)' {aka 'int(const char *, long unsigned int,  unsigned int,  int *)'}
     444 | kstrto_from_user(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:470:18: error: conflicting types for 'kstrtou16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u16 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  short unsigned int *)'}
     470 | kstrto_from_iter(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:445:18: note: previous definition of 'kstrtou16_from_user' with type 'int(const char *, size_t,  unsigned int,  u16 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  short unsigned int *)'}
     445 | kstrto_from_user(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:470:18: error: conflicting types for 'kstrtou16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u16 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  short unsigned int *)'}
     470 | kstrto_from_iter(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:470:1: note: in expansion of macro 'kstrto_from_iter'
     470 | kstrto_from_iter(kstrtou16_from_user,   kstrtou16,      u16);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:445:18: note: previous definition of 'kstrtou16_from_user' with type 'int(const char *, size_t,  unsigned int,  u16 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  short unsigned int *)'}
     445 | kstrto_from_user(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:471:18: error: conflicting types for 'kstrtos16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s16 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  short int *)'}
     471 | kstrto_from_iter(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:446:18: note: previous definition of 'kstrtos16_from_user' with type 'int(const char *, size_t,  unsigned int,  s16 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  short int *)'}
     446 | kstrto_from_user(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:471:18: error: conflicting types for 'kstrtos16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s16 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  short int *)'}
     471 | kstrto_from_iter(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:471:1: note: in expansion of macro 'kstrto_from_iter'
     471 | kstrto_from_iter(kstrtos16_from_user,   kstrtos16,      s16);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:446:18: note: previous definition of 'kstrtos16_from_user' with type 'int(const char *, size_t,  unsigned int,  s16 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  short int *)'}
     446 | kstrto_from_user(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:472:18: error: conflicting types for 'kstrtou8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u8 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  unsigned char *)'}
     472 | kstrto_from_iter(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:447:18: note: previous definition of 'kstrtou8_from_user' with type 'int(const char *, size_t,  unsigned int,  u8 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  unsigned char *)'}
     447 | kstrto_from_user(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:472:18: error: conflicting types for 'kstrtou8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u8 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  unsigned char *)'}
     472 | kstrto_from_iter(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:472:1: note: in expansion of macro 'kstrto_from_iter'
     472 | kstrto_from_iter(kstrtou8_from_user,    kstrtou8,       u8);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:447:18: note: previous definition of 'kstrtou8_from_user' with type 'int(const char *, size_t,  unsigned int,  u8 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  unsigned char *)'}
     447 | kstrto_from_user(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:473:18: error: conflicting types for 'kstrtos8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s8 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  signed char *)'}
     473 | kstrto_from_iter(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:448:18: note: previous definition of 'kstrtos8_from_user' with type 'int(const char *, size_t,  unsigned int,  s8 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  signed char *)'}
     448 | kstrto_from_user(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:473:18: error: conflicting types for 'kstrtos8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s8 *)' {aka 'int(const struct iov_iter *, long unsigned int,  unsigned int,  signed char *)'}
     473 | kstrto_from_iter(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   lib/kstrtox.c:462:1: note: in expansion of macro 'EXPORT_SYMBOL'
     462 | EXPORT_SYMBOL(f)
         | ^~~~~~~~~~~~~
   lib/kstrtox.c:473:1: note: in expansion of macro 'kstrto_from_iter'
     473 | kstrto_from_iter(kstrtos8_from_user,    kstrtos8,       s8);
         | ^~~~~~~~~~~~~~~~
   lib/kstrtox.c:448:18: note: previous definition of 'kstrtos8_from_user' with type 'int(const char *, size_t,  unsigned int,  s8 *)' {aka 'int(const char *, long unsigned int,  unsigned int,  signed char *)'}
     448 | kstrto_from_user(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
   cc1: some warnings being treated as errors


vim +464 lib/kstrtox.c

   463	
 > 464	kstrto_from_iter(kstrtoull_from_user,	kstrtoull,	unsigned long long);
 > 465	kstrto_from_iter(kstrtoll_from_user,	kstrtoll,	long long);
 > 466	kstrto_from_iter(kstrtoul_from_user,	kstrtoul,	unsigned long);
 > 467	kstrto_from_iter(kstrtol_from_user,	kstrtol,	long);
 > 468	kstrto_from_iter(kstrtouint_from_user,	kstrtouint,	unsigned int);
 > 469	kstrto_from_iter(kstrtoint_from_user,	kstrtoint,	int);
 > 470	kstrto_from_iter(kstrtou16_from_user,	kstrtou16,	u16);
 > 471	kstrto_from_iter(kstrtos16_from_user,	kstrtos16,	s16);
 > 472	kstrto_from_iter(kstrtou8_from_user,	kstrtou8,	u8);
 > 473	kstrto_from_iter(kstrtos8_from_user,	kstrtos8,	s8);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
