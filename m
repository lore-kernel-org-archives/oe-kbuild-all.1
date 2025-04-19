Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C17647
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 18:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745087344; cv=none; b=evWat9uG0cbAbZivBSB1bSErU86aePervySe9NIAyvtVhhTrVMOT7DL8qHkzExqPSwPoaiYkwTaHZxUd9ajGwcW3Ho+xNYWq3F5/r/PcdxlPjwBWKyS5ZxxHOY0/3kts4NlzUj0mMdGc3zynE2Ya2mw2NPSRY0N98zEGBDXbpZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745087344; c=relaxed/simple;
	bh=QhfrW4YRgz8t9qXfRlkwE6UNKJ796PP6wTqGnA/7GMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3ArfmK1c3wZhlS/qSbBz1AMO5xfrqhycRhA1t7b90kuFnFPBPYRMkIaHy4C26JuJV3QbwTOGqBSYjC8kbOQsYBaYUdW8dkV60a5ZEN922jq2XgORnO2hgsYlRjI+U4CZku1NwebRVVTE1duXA36ZPY5edCNT1s8i2rOOBGP00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5l1cD6P; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5l1cD6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745087342; x=1776623342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QhfrW4YRgz8t9qXfRlkwE6UNKJ796PP6wTqGnA/7GMg=;
  b=J5l1cD6PoK+LtOsIqivVvKy470WIHMNIaM4WUhW5i7GiF4Q/11L9e+XQ
   RGbIV/mAl83g4AIzKd5k4uwGKoWsxlUDno5ghPlUUBKYhFxqtE0HvG1TU
   t6fjSTO4GZMc+b3g1inN4rmsnFp8U5G4OBa3pFVkZ2bLEM+gCV0PSJr1k
   oTRhKhaa63xbEuNbP16+CbZFxph/sHI+7/CGlSuTp7uT3Bwij69JnSP18
   sCsNIA3I1iyHjKR3REX1Jh71lmXN4wbT29+G1KKvUrezhW73QNvIHkFrV
   1kIwWnOSYw8wr0tJsm4YRuYGwhr7ORr+pTPSlBPfFfUnD+cYZtWS18/Aj
   A==;
X-CSE-ConnectionGUID: AzIXR687T8icbAPCPxc/3g==
X-CSE-MsgGUID: BcqGVpKKSTaCwqGH6DQpyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50345877"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="50345877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 11:29:00 -0700
X-CSE-ConnectionGUID: qryW0QNsRyyMMEto9tb4cA==
X-CSE-MsgGUID: /TjSJ75iSym6eEt3M+TzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="132253970"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Apr 2025 11:28:59 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Cvx-00045N-0L;
	Sat, 19 Apr 2025 18:28:57 +0000
Date: Sun, 20 Apr 2025 02:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: cem@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <202504200218.98vwdj3m-lkp@intel.com>
References: <20250419115157.567249-1-cem@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419115157.567249-1-cem@kernel.org>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on hch-configfs/for-next v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cem-kernel-org/math-h-Account-for-64-bit-division-on-i386/20250419-195242
base:   linus/master
patch link:    https://lore.kernel.org/r/20250419115157.567249-1-cem%40kernel.org
patch subject: [RFC PATCH] math.h: Account for 64-bit division on i386
config: csky-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200218.98vwdj3m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200218.98vwdj3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200218.98vwdj3m-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/power/supply/ltc4162-l-charger.c:12:
   drivers/power/supply/ltc4162-l-charger.c: In function 'ltc4162l_get_ibat':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:360:23: note: in expansion of macro 'mult_frac'
     360 |         val->intval = mult_frac(ret, chip_info->ibat_resolution_pv, info->rsnsb);
         |                       ^~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bitfield.h:10,
                    from drivers/power/supply/ltc4162-l-charger.c:11:
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:360:23: note: in expansion of macro 'mult_frac'
     360 |         val->intval = mult_frac(ret, chip_info->ibat_resolution_pv, info->rsnsb);
         |                       ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:360:23: note: in expansion of macro 'mult_frac'
     360 |         val->intval = mult_frac(ret, chip_info->ibat_resolution_pv, info->rsnsb);
         |                       ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:360:23: note: in expansion of macro 'mult_frac'
     360 |         val->intval = mult_frac(ret, chip_info->ibat_resolution_pv, info->rsnsb);
         |                       ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:360:23: note: in expansion of macro 'mult_frac'
     360 |         val->intval = mult_frac(ret, chip_info->ibat_resolution_pv, info->rsnsb);
         |                       ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:360:23: note: in expansion of macro 'mult_frac'
     360 |         val->intval = mult_frac(ret, chip_info->ibat_resolution_pv, info->rsnsb);
         |                       ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/power/supply/ltc4162-l-charger.c: In function 'ltc4162l_get_icharge':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:417:32: note: in expansion of macro 'mult_frac'
     417 |         val->intval = 10000u * mult_frac(regval, 100000u, info->rsnsb);
         |                                ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:417:32: note: in expansion of macro 'mult_frac'
     417 |         val->intval = 10000u * mult_frac(regval, 100000u, info->rsnsb);
         |                                ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:417:32: note: in expansion of macro 'mult_frac'
     417 |         val->intval = 10000u * mult_frac(regval, 100000u, info->rsnsb);
         |                                ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:417:32: note: in expansion of macro 'mult_frac'
     417 |         val->intval = 10000u * mult_frac(regval, 100000u, info->rsnsb);
         |                                ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:417:32: note: in expansion of macro 'mult_frac'
     417 |         val->intval = 10000u * mult_frac(regval, 100000u, info->rsnsb);
         |                                ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:417:32: note: in expansion of macro 'mult_frac'
     417 |         val->intval = 10000u * mult_frac(regval, 100000u, info->rsnsb);
         |                                ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/power/supply/ltc4162-l-charger.c: In function 'ltc4162l_set_icharge':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:426:17: note: in expansion of macro 'mult_frac'
     426 |         value = mult_frac(value, info->rsnsb, 100000u);
         |                 ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:426:17: note: in expansion of macro 'mult_frac'
     426 |         value = mult_frac(value, info->rsnsb, 100000u);
         |                 ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:426:17: note: in expansion of macro 'mult_frac'
     426 |         value = mult_frac(value, info->rsnsb, 100000u);
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:426:17: note: in expansion of macro 'mult_frac'
     426 |         value = mult_frac(value, info->rsnsb, 100000u);
         |                 ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:426:17: note: in expansion of macro 'mult_frac'
     426 |         value = mult_frac(value, info->rsnsb, 100000u);
         |                 ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:426:17: note: in expansion of macro 'mult_frac'
     426 |         value = mult_frac(value, info->rsnsb, 100000u);
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/power/supply/ltc4162-l-charger.c: In function 'ltc4015_get_vcharge':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:528:37: note: in expansion of macro 'mult_frac'
     528 |                 voltage = 2000000 + mult_frac(regval, 1000000, 105);
         |                                     ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:528:37: note: in expansion of macro 'mult_frac'
     528 |                 voltage = 2000000 + mult_frac(regval, 1000000, 105);
         |                                     ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:528:37: note: in expansion of macro 'mult_frac'
     528 |                 voltage = 2000000 + mult_frac(regval, 1000000, 105);
         |                                     ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:528:37: note: in expansion of macro 'mult_frac'
     528 |                 voltage = 2000000 + mult_frac(regval, 1000000, 105);
         |                                     ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:528:37: note: in expansion of macro 'mult_frac'
     528 |                 voltage = 2000000 + mult_frac(regval, 1000000, 105);
         |                                     ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:528:37: note: in expansion of macro 'mult_frac'
     528 |                 voltage = 2000000 + mult_frac(regval, 1000000, 105);
         |                                     ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/power/supply/ltc4162-l-charger.c: In function 'ltc4162l_set_iin_limit':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:655:18: note: in expansion of macro 'mult_frac'
     655 |         regval = mult_frac(value, info->rsnsi, 50000u);
         |                  ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:655:18: note: in expansion of macro 'mult_frac'
     655 |         regval = mult_frac(value, info->rsnsi, 50000u);
         |                  ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:655:18: note: in expansion of macro 'mult_frac'
     655 |         regval = mult_frac(value, info->rsnsi, 50000u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:655:18: note: in expansion of macro 'mult_frac'
     655 |         regval = mult_frac(value, info->rsnsi, 50000u);
         |                  ^~~~~~~~~
>> include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:655:18: note: in expansion of macro 'mult_frac'
     655 |         regval = mult_frac(value, info->rsnsi, 50000u);
         |                  ^~~~~~~~~
>> include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:655:18: note: in expansion of macro 'mult_frac'
     655 |         regval = mult_frac(value, info->rsnsi, 50000u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/power/supply/ltc4162-l-charger.c: In function 'ltc4162l_set_term_current':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:746:18: note: in expansion of macro 'mult_frac'
     746 |         regval = mult_frac(value, info->rsnsb, 14660u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:746:18: note: in expansion of macro 'mult_frac'
     746 |         regval = mult_frac(value, info->rsnsb, 14660u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:746:18: note: in expansion of macro 'mult_frac'
     746 |         regval = mult_frac(value, info->rsnsb, 14660u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:746:18: note: in expansion of macro 'mult_frac'
     746 |         regval = mult_frac(value, info->rsnsb, 14660u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:746:18: note: in expansion of macro 'mult_frac'
     746 |         regval = mult_frac(value, info->rsnsb, 14660u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/power/supply/ltc4162-l-charger.c:746:18: note: in expansion of macro 'mult_frac'
     746 |         regval = mult_frac(value, info->rsnsb, 14660u);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~


vim +/__div64_32 +199 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  176  
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  187  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
