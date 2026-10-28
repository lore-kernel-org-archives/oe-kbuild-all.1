Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214659;
	b=laQjhTKoVEOe0BjCia8IZ4UY7DLI6CtTbfsBdA+cf4hE97PjmVmNZp7otipoHcqPkI1W
	 RC8MdvC7F8YoAiaa+lwgcbNOI8ys6BaHVcfWSExC0jZCq3FyLwqT3mSyj5t39htIxHEyG
	 kWgSoDOj/XWd0YZEYH1Dy/xYm62Z62wY0TATWivU354T+JhUX5tDkwc431/kXpc1xsZo1
	 ZauoHhQj7O2CA39qtPbfZV/LKfcsrVcWzHWVqYq5lohEqvaNG+lmWW8fHg324V/yXfd1x
	 tcMTqAV6JY/nNsDpxSYiJlG/fi4eK3eHceeTFD+4mJeLvgRXdWbIKjYla4C5563z3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214659;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=dTNczvOr+vjGhC0acjPGTzN7IaXt+7N/7lGbZpVpG2o=;
	b=bw6hiiJxonx3NfCVHKkPHZEL6AadWQxUBF3N+l31l1DFemRdNmxVCayxpYPWN19KPJ6s
	 7d56X5jw0PMPapXMRmpKD28/3IzEqVzzkq6iNH8XnsfBaTLNt14wWQaIg2JIrfy1fxrfn
	 8NWDG9v4r98zF8MEj5qolDC+30VO5ju/rPiCtsN9gQFOqFWj2gGSM14aFxBpHUF9qAdrD
	 Ds+cGW+h23SBwO4z8OffOTqTxRr8Ibg9AQE3M38yK3QsruBkGNBCuJKvDwu2aU+T2vcef
	 k6kvXQ9rVuwPI6xBnjcFH+f5EygJ2qVGVyJfgvVqxaVq/5/GpN8lBFF1BTISidJmDvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvge8U3O;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 19:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D16B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvge8U3O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793214659; x=1824750659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXkrH7R+9/8A5jCF2tf1blAcqCRRrX9jd/VUNDa/8Yk=;
  b=hvge8U3OEv8JY4SLnrRTvWThnI+jUlNDHpnC5Oje3Tb3vxTFkZjjyGxr
   URR/8G4yTlpnrAdaLUPxIYKam6AxOYdjg6ux7rLIO2znikKeh0HftNfs7
   6WblqhYWqtMYtAh3CZd4Cz0ZUlqHV8hoLyTqM44cDYZZq1icDfyATfNpK
   jYdcH2JblXOJWt0LakynZ9VWQoqZO8V3dMvqxzVfwiex3+hOV9f/c7rsQ
   e3tnwOOyfZteuxgS7xpS4Jg8kXlEVYfn1vcHW0X7bqbVfLfs5sQwoNT70
   MRFg9gmpYGasgNWijFzmIkegtXgIV+u2tsNmBTtXJM5vioS47gud1J140
   w==;
X-CSE-ConnectionGUID: uwRNs3uARdGBJ8SftGPgvA==
X-CSE-MsgGUID: phg7lmHCS3yBoE2xHtvDAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1831309"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1831309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:10:45 -0700
X-CSE-ConnectionGUID: 6OdKwz+LS2OqPjNKUY6sOg==
X-CSE-MsgGUID: qwZa6+h+RZKc74+10DLlCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5031507"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2026 12:10:33 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM92c-000000004xV-3l57;
	Wed, 28 Oct 2026 19:10:30 +0000
Date: Wed, 28 Oct 2026 20:09:36 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/41]
 include/linux/build_bug.h:80:41: error: static assertion failed:
 "SMP_CACHE_BYTES % sizeof(struct tk_aux_mono_conv) == 0"
Message-ID: <202610282025.cicvH1O3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   b07585bb535605fb7baff6811b5b778c83af0805
commit: b07585bb535605fb7baff6811b5b778c83af0805 [41/41] timekeeping: Only copy valid auxiliary clock conversion parameters
config: openrisc-randconfig-r2202-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282025.cicvH1O3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282025.cicvH1O3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282025.cicvH1O3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/proc_fs.h:10,
                    from kernel/time/timer_list.c:8:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "SMP_CACHE_BYTES % sizeof(struct tk_aux_mono_conv) == 0"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/timekeeping_types.h:62:1: note: in expansion of macro 'static_assert'
      62 | static_assert(SMP_CACHE_BYTES % sizeof(struct tk_aux_mono_conv) == 0);
         | ^~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  61  
6bab69c65013be Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  63   * static_assert - check integer constant expression at build time
6ffd853b0b10e1 Randy Dunlap     2026-03-01  64   * @expr: expression to be checked
6bab69c65013be Rasmus Villemoes 2019-03-07  65   *
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  67   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  69   *
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  74   *
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  76   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  78   */
6bab69c65013be Rasmus Villemoes 2019-03-07  79  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @80  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  81  
07a368b3f55a79 Maxim Levitsky   2022-10-25  82  

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
