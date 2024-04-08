Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F961146599
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712607609; cv=none; b=DQrCUMPpLBDt2YZmu4YJggXiwuTy02uZWIDZmuS18JO1GhDywLPRo2IXt3W4eJfmB4DLvCgsZE7dob8IWEa4BP9mnyCG8wThDr35PiOm7KbtU7GWJFnVgzNnWklyoPhlfkObuQ/oZwucUaXFm7z3RMhFkPp/mu/vEVwJ6LlRBJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712607609; c=relaxed/simple;
	bh=MlyH1697BnLsSgZkeuG/RoqLh30RxywdT9/+kd4qyQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mhnO7kaiTD8fkrdCmaruFZDx6pfpsIWrn5wZvoTI7DndJJgCRUMIHNtltFoWgNMJK+ndhLFVVmsuxn7Rk4L7U+VrECr2bHgD+jQQKRpiOJLTZhq0wg8pOREfDFddKXQYbVqd+po6UHZ9R1s2Y9k6qZvvNiL1NQlcynfUv39yxEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKRmqtK3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKRmqtK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712607606; x=1744143606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlyH1697BnLsSgZkeuG/RoqLh30RxywdT9/+kd4qyQk=;
  b=OKRmqtK3TKa6VnFWTNFa7+2ZScv+a9im2egBgUtgOJpemTOtIpHz2sxy
   pDOTQOYLx6ZCz27wFacbYp9nBrmtulw/VGbr7qrmlJWpPkkWy0AlU0nAo
   rN1yRx769Yrc9M4THKZMD/BuSCnAAspqyKBiBzbxYs+awC+0IR/VwgNgO
   LYfR7QK5uDxf7DAkDSvEU/1tuUR0tySADy98/DSB5KMCUgnO1NXDXiUFG
   3PV4nD+ct6iwVUWVrikqVxM2kqeZIkRf4yFkJSbX6zVOWb6Kon34QZ6Wy
   10NMs3AHJAKebNdNFV1NaH5hwt9ACazitl2FVKZXTczii9F0xpe2NtHn8
   Q==;
X-CSE-ConnectionGUID: xRUCwnAMSROW3DhZ8Zd6eQ==
X-CSE-MsgGUID: ocmQuUXkTIywy5F7hXaFSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8085751"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8085751"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 13:20:04 -0700
X-CSE-ConnectionGUID: lWLnNX5TTDyomqsCgcctCw==
X-CSE-MsgGUID: J9/z+te1Q5O4TaQzoVzQAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19866441"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Apr 2024 13:20:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtvTE-0005Su-12;
	Mon, 08 Apr 2024 20:20:00 +0000
Date: Tue, 9 Apr 2024 04:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/144] lib/kstrtox.c:418:14: error: implicit
 declaration of function 'copy_from_iter_full'; did you mean
 'copy_from_user_nofault'?
Message-ID: <202404090428.ta0JpVFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   b32f790cdb298ce85171870c8bf5557dc35a51a5
commit: 0e32bf18f84067b75d543d34fe510f00b75b20f7 [8/144] kstrtox: add iov_iter versions of the string conversion helpers
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240409/202404090428.ta0JpVFk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404090428.ta0JpVFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090428.ta0JpVFk-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/kstrtox.c: In function 'kstrtobool_from_iter':
>> lib/kstrtox.c:418:14: error: implicit declaration of function 'copy_from_iter_full'; did you mean 'copy_from_user_nofault'? [-Werror=implicit-function-declaration]
     418 |         if (!copy_from_iter_full(buf, count, src))
         |              ^~~~~~~~~~~~~~~~~~~
         |              copy_from_user_nofault
   lib/kstrtox.c: At top level:
>> lib/kstrtox.c:464:18: error: conflicting types for 'kstrtoull_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long long unsigned int *)'}
     464 | kstrto_from_iter(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:439:18: note: previous definition of 'kstrtoull_from_user' with type 'int(const char *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long long unsigned int *)'}
     439 | kstrto_from_user(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
   In file included from lib/kstrtox.c:17:
>> lib/kstrtox.c:464:18: error: conflicting types for 'kstrtoull_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long long unsigned int *)'}
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
   lib/kstrtox.c:439:18: note: previous definition of 'kstrtoull_from_user' with type 'int(const char *, size_t,  unsigned int,  long long unsigned int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long long unsigned int *)'}
     439 | kstrto_from_user(kstrtoull_from_user,   kstrtoull,      unsigned long long);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:465:18: error: conflicting types for 'kstrtoll_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long long int *)'}
     465 | kstrto_from_iter(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:440:18: note: previous definition of 'kstrtoll_from_user' with type 'int(const char *, size_t,  unsigned int,  long long int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long long int *)'}
     440 | kstrto_from_user(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:465:18: error: conflicting types for 'kstrtoll_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long long int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long long int *)'}
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
   lib/kstrtox.c:440:18: note: previous definition of 'kstrtoll_from_user' with type 'int(const char *, size_t,  unsigned int,  long long int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long long int *)'}
     440 | kstrto_from_user(kstrtoll_from_user,    kstrtoll,       long long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:466:18: error: conflicting types for 'kstrtoul_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long unsigned int *)'}
     466 | kstrto_from_iter(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:441:18: note: previous definition of 'kstrtoul_from_user' with type 'int(const char *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long unsigned int *)'}
     441 | kstrto_from_user(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:466:18: error: conflicting types for 'kstrtoul_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long unsigned int *)'}
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
   lib/kstrtox.c:441:18: note: previous definition of 'kstrtoul_from_user' with type 'int(const char *, size_t,  unsigned int,  long unsigned int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long unsigned int *)'}
     441 | kstrto_from_user(kstrtoul_from_user,    kstrtoul,       unsigned long);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:467:18: error: conflicting types for 'kstrtol_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long int *)'}
     467 | kstrto_from_iter(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:442:18: note: previous definition of 'kstrtol_from_user' with type 'int(const char *, size_t,  unsigned int,  long int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long int *)'}
     442 | kstrto_from_user(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:467:18: error: conflicting types for 'kstrtol_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  long int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  long int *)'}
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
   lib/kstrtox.c:442:18: note: previous definition of 'kstrtol_from_user' with type 'int(const char *, size_t,  unsigned int,  long int *)' {aka 'int(const char *, unsigned int,  unsigned int,  long int *)'}
     442 | kstrto_from_user(kstrtol_from_user,     kstrtol,        long);
         |                  ^~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:468:18: error: conflicting types for 'kstrtouint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  unsigned int *)'}
     468 | kstrto_from_iter(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:443:18: note: previous definition of 'kstrtouint_from_user' with type 'int(const char *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const char *, unsigned int,  unsigned int,  unsigned int *)'}
     443 | kstrto_from_user(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:468:18: error: conflicting types for 'kstrtouint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  unsigned int *)'}
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
   lib/kstrtox.c:443:18: note: previous definition of 'kstrtouint_from_user' with type 'int(const char *, size_t,  unsigned int,  unsigned int *)' {aka 'int(const char *, unsigned int,  unsigned int,  unsigned int *)'}
     443 | kstrto_from_user(kstrtouint_from_user,  kstrtouint,     unsigned int);
         |                  ^~~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:469:18: error: conflicting types for 'kstrtoint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  int *)'}
     469 | kstrto_from_iter(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:444:18: note: previous definition of 'kstrtoint_from_user' with type 'int(const char *, size_t,  unsigned int,  int *)' {aka 'int(const char *, unsigned int,  unsigned int,  int *)'}
     444 | kstrto_from_user(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:469:18: error: conflicting types for 'kstrtoint_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  int *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  int *)'}
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
   lib/kstrtox.c:444:18: note: previous definition of 'kstrtoint_from_user' with type 'int(const char *, size_t,  unsigned int,  int *)' {aka 'int(const char *, unsigned int,  unsigned int,  int *)'}
     444 | kstrto_from_user(kstrtoint_from_user,   kstrtoint,      int);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:470:18: error: conflicting types for 'kstrtou16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u16 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  short unsigned int *)'}
     470 | kstrto_from_iter(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:445:18: note: previous definition of 'kstrtou16_from_user' with type 'int(const char *, size_t,  unsigned int,  u16 *)' {aka 'int(const char *, unsigned int,  unsigned int,  short unsigned int *)'}
     445 | kstrto_from_user(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:470:18: error: conflicting types for 'kstrtou16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u16 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  short unsigned int *)'}
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
   lib/kstrtox.c:445:18: note: previous definition of 'kstrtou16_from_user' with type 'int(const char *, size_t,  unsigned int,  u16 *)' {aka 'int(const char *, unsigned int,  unsigned int,  short unsigned int *)'}
     445 | kstrto_from_user(kstrtou16_from_user,   kstrtou16,      u16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:471:18: error: conflicting types for 'kstrtos16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s16 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  short int *)'}
     471 | kstrto_from_iter(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:446:18: note: previous definition of 'kstrtos16_from_user' with type 'int(const char *, size_t,  unsigned int,  s16 *)' {aka 'int(const char *, unsigned int,  unsigned int,  short int *)'}
     446 | kstrto_from_user(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:471:18: error: conflicting types for 'kstrtos16_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s16 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  short int *)'}
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
   lib/kstrtox.c:446:18: note: previous definition of 'kstrtos16_from_user' with type 'int(const char *, size_t,  unsigned int,  s16 *)' {aka 'int(const char *, unsigned int,  unsigned int,  short int *)'}
     446 | kstrto_from_user(kstrtos16_from_user,   kstrtos16,      s16);
         |                  ^~~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:472:18: error: conflicting types for 'kstrtou8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u8 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  unsigned char *)'}
     472 | kstrto_from_iter(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:447:18: note: previous definition of 'kstrtou8_from_user' with type 'int(const char *, size_t,  unsigned int,  u8 *)' {aka 'int(const char *, unsigned int,  unsigned int,  unsigned char *)'}
     447 | kstrto_from_user(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:472:18: error: conflicting types for 'kstrtou8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  u8 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  unsigned char *)'}
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
   lib/kstrtox.c:447:18: note: previous definition of 'kstrtou8_from_user' with type 'int(const char *, size_t,  unsigned int,  u8 *)' {aka 'int(const char *, unsigned int,  unsigned int,  unsigned char *)'}
     447 | kstrto_from_user(kstrtou8_from_user,    kstrtou8,       u8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
>> lib/kstrtox.c:473:18: error: conflicting types for 'kstrtos8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s8 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  signed char *)'}
     473 | kstrto_from_iter(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:451:5: note: in definition of macro 'kstrto_from_iter'
     451 | int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)     \
         |     ^
   lib/kstrtox.c:448:18: note: previous definition of 'kstrtos8_from_user' with type 'int(const char *, size_t,  unsigned int,  s8 *)' {aka 'int(const char *, unsigned int,  unsigned int,  signed char *)'}
     448 | kstrto_from_user(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
   lib/kstrtox.c:473:18: error: conflicting types for 'kstrtos8_from_user'; have 'int(const struct iov_iter *, size_t,  unsigned int,  s8 *)' {aka 'int(const struct iov_iter *, unsigned int,  unsigned int,  signed char *)'}
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
   lib/kstrtox.c:448:18: note: previous definition of 'kstrtos8_from_user' with type 'int(const char *, size_t,  unsigned int,  s8 *)' {aka 'int(const char *, unsigned int,  unsigned int,  signed char *)'}
     448 | kstrto_from_user(kstrtos8_from_user,    kstrtos8,       s8);
         |                  ^~~~~~~~~~~~~~~~~~
   lib/kstrtox.c:426:5: note: in definition of macro 'kstrto_from_user'
     426 | int f(const char __user *s, size_t count, unsigned int base, type *res) \
         |     ^
   cc1: some warnings being treated as errors


vim +418 lib/kstrtox.c

   407	
   408	/*
   409	 * Like kstrtobool_from_user(), but takes a source iov_iter rather than a
   410	 * buffer.
   411	 */
   412	int kstrtobool_from_iter(const struct iov_iter *src, size_t count, bool *res)
   413	{
   414		/* Longest string needed to differentiate, newline, terminator */
   415		char buf[4];
   416	
   417		count = min(count, sizeof(buf) - 1);
 > 418		if (!copy_from_iter_full(buf, count, src))
   419			return -EFAULT;
   420		buf[count] = '\0';
   421		return kstrtobool(buf, res);
   422	}
   423	EXPORT_SYMBOL(kstrtobool_from_iter);
   424	
   425	#define kstrto_from_user(f, g, type)					\
   426	int f(const char __user *s, size_t count, unsigned int base, type *res)	\
   427	{									\
   428		/* sign, base 2 representation, newline, terminator */		\
   429		char buf[1 + sizeof(type) * 8 + 1 + 1];				\
   430										\
   431		count = min(count, sizeof(buf) - 1);				\
   432		if (copy_from_user(buf, s, count))				\
   433			return -EFAULT;						\
   434		buf[count] = '\0';						\
   435		return g(buf, base, res);					\
   436	}									\
   437	EXPORT_SYMBOL(f)
   438	
   439	kstrto_from_user(kstrtoull_from_user,	kstrtoull,	unsigned long long);
   440	kstrto_from_user(kstrtoll_from_user,	kstrtoll,	long long);
   441	kstrto_from_user(kstrtoul_from_user,	kstrtoul,	unsigned long);
   442	kstrto_from_user(kstrtol_from_user,	kstrtol,	long);
   443	kstrto_from_user(kstrtouint_from_user,	kstrtouint,	unsigned int);
   444	kstrto_from_user(kstrtoint_from_user,	kstrtoint,	int);
   445	kstrto_from_user(kstrtou16_from_user,	kstrtou16,	u16);
   446	kstrto_from_user(kstrtos16_from_user,	kstrtos16,	s16);
   447	kstrto_from_user(kstrtou8_from_user,	kstrtou8,	u8);
   448	kstrto_from_user(kstrtos8_from_user,	kstrtos8,	s8);
   449	
   450	#define kstrto_from_iter(f, g, type)					\
   451	int f(const struct iov_iter *s, size_t count, unsigned int base, type *res)	\
   452	{									\
   453		/* sign, base 2 representation, newline, terminator */		\
   454		char buf[1 + sizeof(type) * 8 + 1 + 1];				\
   455										\
   456		count = min(count, sizeof(buf) - 1);				\
   457		if (!copy_from_iter_full(s, s, count))				\
   458			return -EFAULT;						\
   459		buf[count] = '\0';						\
   460		return g(buf, base, res);					\
   461	}									\
   462	EXPORT_SYMBOL(f)
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
