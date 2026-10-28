Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217222;
	b=DOIq9sFRjf3fdzBth0o0s8xcCaE8qsZD5yXR4Vb3ZQ5z7FaLJ5eKPLPaVBrrWfvSrNrV
	 LbEM/cjKBr21dxDLEtks/v9HUPbf6agJo3TdtPvvpBhKtz5ZDUHYyZLwYQyt1E5gG4z9T
	 A63rrOixdkn8eTpmgk6b9H/WXeVJKI8AigcOSGt8l+eC1aQnLbbhzdSZ7FC4FW2fqfToc
	 GAf0/aBm/MB3kcFz45Vkdd/vTNU2kO9x7HfiG9BS2lmFU3BxCXaJj7559/KxxZG+BaZlA
	 i7lVNFky6Ilt5atLDv43sf2B2rnL7Lw/y4wGmyUHfkyeHLz13IUbaeEJ7fK7aVpsk5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217222;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=KhKlZbek+6W5eyoU7qfxW8EDSDNpO8MdahH15FM6324=;
	b=khYlu2AoulNLPQLK+OynVXOzlVZuYfLNRsr/vg9TVvfTOo9K2plmImDDDd5ysGgezTG8
	 AylilmzQontRXOp2JMH9szu8PKx16o0GnB5j0Ce2KNyfU7PVQ76DJe4EIIWWIOq7kGnow
	 LSdw5ZcJU2Kdz0d8sEb5hHRDHUT8jtcHG9If8yBSnvuhVQ7J9VZUBXsXcb9t5uPymQfRP
	 48IoGXePtyA90rq3srD54pn6TZZ9+gVPtNJq0/WJVqbkzFdw/rnFojxwAQWtW18haFryJ
	 LoyaAGEm5mAXs+ZzRji7NQ7cGG0DB36dy/1qaZC9blyYNKkHFYLzb2A9MJbuvvVhUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W/PPhxQw";
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F7B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F7B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W/PPhxQw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793217220; x=1824753220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vo+KSYJNSOjnXd6RZd0lC+ZVJEDMuWwLKHTZ3MgWO/c=;
  b=W/PPhxQwpr59n1fDSREnAC1JxcWVE3Z0yprjY4ccp3O9cjKIyhD4HS/a
   vUdW3a7j+LWM/CyKQDhHP3vvf/4UGPdcR8nduxIlMb0wLmriUVY4QhP9t
   7S0dq/1ltTnhKqgUdHZOwGbx0ZIfdIWm060G57ONoixy/daEVDbc6NRsa
   M3OS37np2w6VlfQ2iJ4A6y6aS/8qrUpWUnv2Q9mp/iWxPT6U6QZWYTsp4
   auWdjr2qKIo/za6g0au/WyRpqa2z4hB2ZWOmm5Il4QeW88j8qJOnbJaYs
   DceXGjLYH/2dF8l9PNGbB2zCJ1QAffFTj27Bultei6owCUz7S3uR7xuvr
   Q==;
X-CSE-ConnectionGUID: 1H1Kh1RzSKqKDzXANyZHgg==
X-CSE-MsgGUID: m3JX9TFDTMKWG/mJyMmgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1844904"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1844904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 12:53:39 -0700
X-CSE-ConnectionGUID: l6jMGbR+TTiOsuk7k3RyWQ==
X-CSE-MsgGUID: 13ytbY7GQ0esJvPCIXD9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5025069"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2026 12:53:37 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM9iJ-000000004xt-2cJV;
	Wed, 28 Oct 2026 19:53:35 +0000
Date: Wed, 28 Oct 2026 20:52:48 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 41/41]
 include/linux/compiler.h:200:82: error: expression in static assertion is not
 an integer
Message-ID: <202610282037.7oUndeYE-lkp@intel.com>
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
config: openrisc-randconfig-r2100-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282037.7oUndeYE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282037.7oUndeYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282037.7oUndeYE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from sound/drivers/dummy.c:7:
   include/linux/build_bug.h:80:41: error: static assertion failed: "SMP_CACHE_BYTES % sizeof(struct tk_aux_mono_conv) == 0"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/timekeeping_types.h:62:1: note: in expansion of macro 'static_assert'
      62 | static_assert(SMP_CACHE_BYTES % sizeof(struct tk_aux_mono_conv) == 0);
         | ^~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5:
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:544:20: note: in expansion of macro 'ARRAY_SIZE'
     544 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:528:9: note: in expansion of macro 'module_param_array_named'
     528 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:64:1: note: in expansion of macro 'module_param_array'
      64 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
   sound/drivers/dummy.c:50:12: warning: 'index' defined but not used [-Wunused-variable]
      50 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


vim +200 include/linux/compiler.h

230fa253df6352 Christian Borntraeger 2014-11-25  196  
cb7380de9e4cbc Kees Cook             2025-02-05  197  #ifdef __CHECKER__
243c90e917f5cf Vincent Mailhol       2025-03-29  198  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) (0)
cb7380de9e4cbc Kees Cook             2025-02-05  199  #else /* __CHECKER__ */
243c90e917f5cf Vincent Mailhol       2025-03-29 @200  #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
cb7380de9e4cbc Kees Cook             2025-02-05  201  #endif /* __CHECKER__ */
cb7380de9e4cbc Kees Cook             2025-02-05  202  

:::::: The code at line 200 was first introduced by commit
:::::: 243c90e917f5cfc99821e5104d1c8a81c11cda4c build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Yury Norov <yury.norov@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
