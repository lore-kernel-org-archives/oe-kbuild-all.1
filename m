Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D62063EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740213830; cv=none; b=Y4aoZaX3z6x1s4rJONULekrVRKuTgiz+Q+5i9A+o8TcJrtnSIaZ1X+ELcQI9NvmMmJlFkxbT8VOYQhzRfN65O0m5JmBlsFN5QCwNqHWfjOaFwO+VBoMc+5VCzcd0uIuCiQ/SaAHxF52CoXZ+rW31b19as3AuE4+JPNp/M5QQW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740213830; c=relaxed/simple;
	bh=HIw0xqv8KqBNKo84MZeAQadpK5laCkNBK2C23n1WaQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GebUWlgm6LdMmuxl6uykopL+D2Iy1zDAse48J7CBpw+UxJ2qHxdWEftfaUtMge0gzeCGVTp8Unw9ybZE1ofzjrRBbOMg2qqiivTb95shqd2LfO1XUgYEcL/UgAhVGxZeUbQQ0IWXzQtuctcGLdf5aCI2DZ+PQYFvJFFXohYICQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxJTc0oS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxJTc0oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740213828; x=1771749828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HIw0xqv8KqBNKo84MZeAQadpK5laCkNBK2C23n1WaQQ=;
  b=QxJTc0oSub/9iiATyuqNSKloxNGzm87pjrDrhu6HbcSp1dGQTxtDzWbU
   pP5W2PoN3OErwp62uYeNqgsUXXKwPVbRAuT9Od3mjAKsFcvxQSfVPPu2Q
   7YA83YvaPN6rlT8PsQrq1pEhpEiKSGR0Mr6GPNgi1zgDiG9eZhi/wmTMc
   GztjECWkDE7NTcmogmMQTx1XOuS+m3fVRMROO4yw71KlMS3kTf24+uPAW
   Hf8uvEpz2nkXlURJvb2WEaHU1dz2riJbP00s4l2SBJoU+GOxyvQP8DiDr
   dI4UF0zxt0uyk+8NiSbAKwT5poklaMiNzffrwev2JDinS8leA6B8M2exv
   w==;
X-CSE-ConnectionGUID: +3fF8yoKRXKrT3btOfI/tQ==
X-CSE-MsgGUID: T0oAXfDiQUC23F4Us4AmSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58447619"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="58447619"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 00:43:47 -0800
X-CSE-ConnectionGUID: nJnFSM8LR5OM/LsE73jFoA==
X-CSE-MsgGUID: 4fuWxl8SSOCJRBU1jyS6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115417537"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2025 00:43:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tll6u-0006PL-0f;
	Sat, 22 Feb 2025 08:43:44 +0000
Date: Sat, 22 Feb 2025 16:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1958/1958] include/linux/fortify-string.h:583:4:
 warning: call to '__write_overflow_field' declared with 'warning' attribute:
 detected write beyond size of field (1st parameter); maybe use
 struct_group()?
Message-ID: <202502221657.bPUaL9Yl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97a32f076246fcfdb99917daa4daffc96a22e3d9
commit: 165b3cc224374728856b5584455d7ae7f054fbe5 [1958/1958] SCSI: SSSRAID: Support 3SNIC 3S5XX serial RAID/HBA controllers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250222/202502221657.bPUaL9Yl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221657.bPUaL9Yl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221657.bPUaL9Yl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/sssraid/sssraid_fw.c:7:
   In file included from include/linux/pci.h:27:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:294:
>> include/linux/fortify-string.h:583:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     583 |                         __write_overflow_field(p_size_field, size);
         |                         ^
   1 warning generated.


vim +583 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  527  
f68f2ff91512c1 Kees Cook      2021-04-20  528  /*
f68f2ff91512c1 Kees Cook      2021-04-20  529   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  530   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  531   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  532   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  533   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  534   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  535   *
f68f2ff91512c1 Kees Cook      2021-04-20  536   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  537   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  538   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  539   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  540   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  541   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  542   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  543   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  544   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  545   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  546   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  547   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  548   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  549   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  550   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  551   *
f68f2ff91512c1 Kees Cook      2021-04-20  552   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  553   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  554   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  555   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  556   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  557   *
f68f2ff91512c1 Kees Cook      2021-04-20  558   */
54d9469bc515dc Kees Cook      2021-06-24  559  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  560  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  561  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  562  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  563  					 const size_t q_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  564  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  565  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  566  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  567  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  568  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  569  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  570  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  571  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  572  
f68f2ff91512c1 Kees Cook      2021-04-20  573  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  574  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  575  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  576  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  577  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  578  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  579  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  580  
f68f2ff91512c1 Kees Cook      2021-04-20  581  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  582  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20 @583  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  584  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  585  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  586  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  587  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  588  		 */
fa35198f39571b Kees Cook      2022-09-19  589  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  590  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  591  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  592  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  593  	}
f68f2ff91512c1 Kees Cook      2021-04-20  594  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  595  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  596  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  597  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  598  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  599  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  600  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  601  
f68f2ff91512c1 Kees Cook      2021-04-20  602  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  603  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  604  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  605  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  606  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  607  	 */
311fb40aa0569a Kees Cook      2022-09-02  608  	if ((p_size != SIZE_MAX && p_size < size) ||
311fb40aa0569a Kees Cook      2022-09-02  609  	    (q_size != SIZE_MAX && q_size < size))
f68f2ff91512c1 Kees Cook      2021-04-20  610  		fortify_panic(func);
54d9469bc515dc Kees Cook      2021-06-24  611  
54d9469bc515dc Kees Cook      2021-06-24  612  	/*
54d9469bc515dc Kees Cook      2021-06-24  613  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  614  	 *
54d9469bc515dc Kees Cook      2021-06-24  615  	 * We must ignore p_size_field == 0 for existing 0-element
54d9469bc515dc Kees Cook      2021-06-24  616  	 * fake flexible arrays, until they are all converted to
54d9469bc515dc Kees Cook      2021-06-24  617  	 * proper flexible arrays.
54d9469bc515dc Kees Cook      2021-06-24  618  	 *
9f7d69c5cd2390 Kees Cook      2022-09-19  619  	 * The implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  620  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  621  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  622  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  623  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  624  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  625  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  626  	 */
54d9469bc515dc Kees Cook      2021-06-24  627  	if (p_size_field != 0 && p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  628  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  629  		return true;
54d9469bc515dc Kees Cook      2021-06-24  630  
54d9469bc515dc Kees Cook      2021-06-24  631  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  632  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  633  

:::::: The code at line 583 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
