Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36129AAEA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889762; cv=none; b=U0BvfCQA21UgGugFEIhEia+Tp9Tq/at6Pd62Yhox3/Ls0b9dvSGGrvhHhI3vfzsfZxX7epsDRpYRVNx2fOYRbaetMFm4hirR1rIV6WGFan73U+5kmpaL1ZocdyhcHDlsPb8/aKrXoo0wTrehJC4GnuOEsqE5ZLQPWKtQZPjU2Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889762; c=relaxed/simple;
	bh=wBT4Q+pyrF7Qfbs5xIuZmSmQ7W0KdrOfDcDWLBgtIPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMFucjsYtM7BIcc0Z6Lr3XoGnRzk7T8TNt/wb7pIaDye127RRsMMGxN6J/+pfG6c7CVNwueZC+jzHiguTyJ5SX2JWu6KdQfQGYqhoOMWsZCY7zfvgwu52LoMMcbSK1+sxXDkGsDxaJ0lBsz5UWIJBJ5yxJrokkk2TC7C9WFFOQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UB1nG6vo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UB1nG6vo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751889761; x=1783425761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBT4Q+pyrF7Qfbs5xIuZmSmQ7W0KdrOfDcDWLBgtIPA=;
  b=UB1nG6voVWU3Bp/G7kA7uP5jg0liE4XLuyHeIcupX2nV2Wf3MdhjBsNr
   SOmKyWbp4aX++t+P4oHFi4t490tN8UHFpNDsfTbmxOXeoNnGEOV0JL1x9
   +SWQ59NbHDGQ4wbt7bDoc8Zf/1ApFYsK2VzdZlHpN5117s1afJTIMGiRF
   tMuijE2jSaaR9Hw+S7LTdbcLZCwK8dwg2igkghsifk1P/xyk9BvIT36PT
   1dY2Uak0ENSAP5xqRzi2zF2119Z9/mBWPDzgh/zwvI6erZin8tUyolO1b
   983wIsLVDenb2NECX5aIuPXlbpdjw/mSHDyH7obxsdDlijlhsjleGJONj
   g==;
X-CSE-ConnectionGUID: hPXWBqN4QC685wmKC03Lyw==
X-CSE-MsgGUID: 4/oj/pFhQZKAB8anxc1EnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71544276"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="71544276"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 05:02:40 -0700
X-CSE-ConnectionGUID: ZeZAo0J/S4Wd42bdiwWPCg==
X-CSE-MsgGUID: 0PSDn4giSfa007VsXS5QNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="154620752"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2025 05:02:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYkYO-0000ON-1F;
	Mon, 07 Jul 2025 12:02:36 +0000
Date: Mon, 7 Jul 2025 20:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 1/1]
 include/linux/overflow.h:88:22: warning: comparison of distinct pointer
 types lacks a cast
Message-ID: <202507071931.EMnWMxik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   4d8e1d27db152f18e8e9064c37d1fa993f4d7e77
commit: c91b41e6a4cc972b62dc7c0f433436091b4028e5 [1/1] drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250707/202507071931.EMnWMxik-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507071931.EMnWMxik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507071931.EMnWMxik-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:14,
                    from include/drm/drm_crtc.h:29,
                    from drivers/gpu/drm/drm_modes.c:41:
   drivers/gpu/drm/drm_modes.c: In function 'drm_mode_vrefresh':
>> include/linux/overflow.h:88:22: warning: comparison of distinct pointer types lacks a cast
      88 |         (void) (&__a == &__b);                  \
         |                      ^~
   drivers/gpu/drm/drm_modes.c:772:13: note: in expansion of macro 'check_mul_overflow'
     772 |         if (check_mul_overflow(mode->clock, num, &num))
         |             ^~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:89:22: warning: comparison of distinct pointer types lacks a cast
      89 |         (void) (&__a == __d);                   \
         |                      ^~
   drivers/gpu/drm/drm_modes.c:772:13: note: in expansion of macro 'check_mul_overflow'
     772 |         if (check_mul_overflow(mode->clock, num, &num))
         |             ^~~~~~~~~~~~~~~~~~
>> include/linux/overflow.h:88:22: warning: comparison of distinct pointer types lacks a cast
      88 |         (void) (&__a == &__b);                  \
         |                      ^~
   drivers/gpu/drm/drm_modes.c:775:13: note: in expansion of macro 'check_mul_overflow'
     775 |         if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
         |             ^~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:89:22: warning: comparison of distinct pointer types lacks a cast
      89 |         (void) (&__a == __d);                   \
         |                      ^~
   drivers/gpu/drm/drm_modes.c:775:13: note: in expansion of macro 'check_mul_overflow'
     775 |         if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))
         |             ^~~~~~~~~~~~~~~~~~


vim +88 include/linux/overflow.h

f0907827a8a915 Rasmus Villemoes 2018-05-08  83  
9b80e4c4ddaca3 Kees Cook        2020-08-12  84  #define check_mul_overflow(a, b, d) __must_check_overflow(({	\
f0907827a8a915 Rasmus Villemoes 2018-05-08  85  	typeof(a) __a = (a);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  86  	typeof(b) __b = (b);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  87  	typeof(d) __d = (d);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08 @88  	(void) (&__a == &__b);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  89  	(void) (&__a == __d);			\
f0907827a8a915 Rasmus Villemoes 2018-05-08  90  	__builtin_mul_overflow(__a, __b, __d);	\
9b80e4c4ddaca3 Kees Cook        2020-08-12  91  }))
f0907827a8a915 Rasmus Villemoes 2018-05-08  92  

:::::: The code at line 88 was first introduced by commit
:::::: f0907827a8a9152aedac2833ed1b674a7b2a44f2 compiler.h: enable builtin overflow checkers and add fallback code

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
