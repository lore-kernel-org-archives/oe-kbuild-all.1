Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD039FC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710097286; cv=none; b=H/Eo0q2gCUHhEFygQUfI3pPRFl7NoHzYHlAfOWNduIAJImo+D2wfycjeWgOo1d6bp+yYsG0VjEEupG8bZy62DIauZ5IoJlkmWqtiiX3VhLaTvT/XpdBNNdIQPV1Hzia0Gyb11Dn5Wa52sSqbLjMI6WpJIzApygOeOCAVvXpDoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710097286; c=relaxed/simple;
	bh=f6+DpWWdZMNdhYqcaS4/r4nCA8cS9F23cU/LntBBVOo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEN4S/eFBTh6RYkLujMnmxP3e7vxH3/JCwbSM3tYf0wGVKJLoQmAcbb1MSZcQ7NLWjFiFyez7IhnnupC+FQ9uxTnV3J0rYA/Goz2NggQvZkeMgWA1t7wvLhig6JooKbnrmMC5OHu6kNQJ+6q5uw6hPMNYqgxSvp+imA+JXy/tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdpP0aMH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdpP0aMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710097284; x=1741633284;
  h=date:from:cc:subject:message-id:mime-version;
  bh=f6+DpWWdZMNdhYqcaS4/r4nCA8cS9F23cU/LntBBVOo=;
  b=jdpP0aMHrl3DZNiR2Nrc+C9FYYp4Bc6vQccGLRSmBUUon98EtyelfOO9
   XyCTtePcVINn/EGPBMNIsQnps3SLIpcqgetVTqKs5qXyT3qGH16oNdym3
   QaKXH0x5TzZUD72XR2cWZJPEpebtqiQc5w4qUsm4NV/sFprD1yYwqR3ES
   usbULORkr2Bus6CovqlZ+OC8/giRzW9euvy4NL+rdIoX66yDTYtBxM+ER
   FkbB0QLDC7wZeGNlTBjJE1ypzndUZYJRiuRR8Ha+NLpIiWuitY6Ln+u3R
   kEL6Y+3/eZ+srX24CKY17XfGN+7fYXMrpjr54pGIn0UxsbTlHWqukpTdO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4884499"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4884499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 12:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="48404471"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Mar 2024 12:01:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjOQC-0008UH-2E
	for oe-kbuild-all@lists.linux.dev;
	Sun, 10 Mar 2024 19:01:20 +0000
Date: Mon, 11 Mar 2024 03:00:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct ipv6_devconf,
 sysctl_header) - offsetof(struct ipv6_devconf, ioam6_enabled) >=
 sizeof(((struct ipv6_devconf *)0)->ioam6_enabled) + sizeof(__u16)"
Message-ID: <202403110253.5n9kubp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrick,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common 5.15/android_t
head:   a2f507017385e5d7471bfd45d84949c4007a514d
commit: ae0fb8d614c267b5197bf7ac1dca4a6d85b52200 [1/1] ANDROID: Hack to support ABI stable accept_ra_min_lft
config: m68k-q40_defconfig (https://download.01.org/0day-ci/archive/20240311/202403110253.5n9kubp5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110253.5n9kubp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110253.5n9kubp5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/vsprintf.c:21:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct ipv6_devconf, sysctl_header) - offsetof(struct ipv6_devconf, ioam6_enabled) >= sizeof(((struct ipv6_devconf *)0)->ioam6_enabled) + sizeof(__u16)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/ipv6.h:96:1: note: in expansion of macro 'static_assert'
      96 | static_assert(offsetof(struct ipv6_devconf, sysctl_header) -
         | ^~~~~~~~~~~~~
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1713:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1713 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
--
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from lib/test_blackhole_dev.c:13:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct ipv6_devconf, sysctl_header) - offsetof(struct ipv6_devconf, ioam6_enabled) >= sizeof(((struct ipv6_devconf *)0)->ioam6_enabled) + sizeof(__u16)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/ipv6.h:96:1: note: in expansion of macro 'static_assert'
      96 | static_assert(offsetof(struct ipv6_devconf, sysctl_header) -
         | ^~~~~~~~~~~~~
   lib/test_blackhole_dev.c: In function 'test_blackholedev_init':
   lib/test_blackhole_dev.c:32:24: warning: variable 'ethh' set but not used [-Wunused-but-set-variable]
      32 |         struct ethhdr *ethh;
         |                        ^~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
