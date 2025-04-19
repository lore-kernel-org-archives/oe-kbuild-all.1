Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DA1E1E0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 19:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745089207; cv=none; b=PzaVUFlqNnyMSjRIJI/O0it+xIgXTvZ2a2ItfBw+1hW0bYMdAX97mWkxR+7xk5muLvmN11yepB7MslC32sPAG6ps0RciAJoEDrCvucDw/LVG8Dc8BbKu+Vw+h4crFrurT1dK8EfcGUz/+eBtHaAHlO60cde5+mYoYwmrtm/MUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745089207; c=relaxed/simple;
	bh=jFXISy5FELbtctICUPlvh64YkrAyUvyKDZFol8THsXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fce6akbNd1g/fYslglG/DSe+6tBqe3SQdHoaxoHcyqm5U579o4Y2yyuFrOlD6W9pyViR+aCits5saGL1syjnvqB8MGxzwS0B17RsgpMKkOIn80vhWfyxquFAH1CKcxc7QgR6CENd4LWtaPAWZ/0sQJ7KfTjKj47LWC/t7iQSHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxaogRxb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxaogRxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745089204; x=1776625204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFXISy5FELbtctICUPlvh64YkrAyUvyKDZFol8THsXg=;
  b=KxaogRxbibT73f4BQOSUomrZrZRHwDRLEQjAgAQtF+RGV1ihqOZED4DF
   S93fl73re4vYsuxdl8gst0N+DqVUHOgbqNw1WShsVHajF2e6lm+b8QD3H
   vsGSQ4PB7IZHqeloaLVghat8qpVt5IGXwri9wesw74cx8wAbv/R6UqA7g
   2hkxhfuosiNfdoZm2ztAmErDDGZY1/dXPNn/Z2vr+c+j/vzEsAGi4qYo5
   esubH8JGXnHagP0UoQz7XktlrQYz3VkXG9AUuzpKmxI2lbxvEc4TPsctf
   ZAdAaCr0qTelglo5XGZod5g0AxTOfHWBwncclS3rt31ED5z33+OytXCpd
   Q==;
X-CSE-ConnectionGUID: DjHp+751TlOSIvYNUHitnA==
X-CSE-MsgGUID: lAjZsCl3Rf+4yR+f+sKRfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="45808102"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="45808102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 12:00:04 -0700
X-CSE-ConnectionGUID: izYv/8iUSb6ae/baUdfILQ==
X-CSE-MsgGUID: +Dth9RJ6RZeDcHJD8p4/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="132257016"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Apr 2025 12:00:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6DQ0-00046X-0n;
	Sat, 19 Apr 2025 19:00:00 +0000
Date: Sun, 20 Apr 2025 02:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: cem@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
Message-ID: <202504200217.lAUS8TXX-lkp@intel.com>
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
[also build test ERROR on v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cem-kernel-org/math-h-Account-for-64-bit-division-on-i386/20250419-195242
base:   linus/master
patch link:    https://lore.kernel.org/r/20250419115157.567249-1-cem%40kernel.org
patch subject: [RFC PATCH] math.h: Account for 64-bit division on i386
config: arc-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200217.lAUS8TXX-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200217.lAUS8TXX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200217.lAUS8TXX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/interconnect.h:10,
                    from drivers/soc/qcom/icc-bwmon.c:10:
   drivers/soc/qcom/icc-bwmon.c: In function 'bwmon_set_threshold':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:558:17: note: in expansion of macro 'mult_frac'
     558 |         thres = mult_frac(bwmon_kbps_to_count(bwmon, kbps),
         |                 ^~~~~~~~~
   In file included from include/linux/err.h:5,
                    from drivers/soc/qcom/icc-bwmon.c:9:
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:558:17: note: in expansion of macro 'mult_frac'
     558 |         thres = mult_frac(bwmon_kbps_to_count(bwmon, kbps),
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:558:17: note: in expansion of macro 'mult_frac'
     558 |         thres = mult_frac(bwmon_kbps_to_count(bwmon, kbps),
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:558:17: note: in expansion of macro 'mult_frac'
     558 |         thres = mult_frac(bwmon_kbps_to_count(bwmon, kbps),
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:558:17: note: in expansion of macro 'mult_frac'
     558 |         thres = mult_frac(bwmon_kbps_to_count(bwmon, kbps),
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:558:17: note: in expansion of macro 'mult_frac'
     558 |         thres = mult_frac(bwmon_kbps_to_count(bwmon, kbps),
         |                 ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/soc/qcom/icc-bwmon.c: In function 'bwmon_start':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
>> include/asm-generic/div64.h:187:21: error: assignment of read-only variable 'x_'
     187 |                 (n) >>= ilog2(__base);                  \
         |                     ^~~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:191:21: error: assignment of read-only variable 'x_'
     191 |                 (n) = __div64_const32(n, __base);       \
         |                     ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
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
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:197:21: error: assignment of read-only variable 'x_'
     197 |                 (n) = (uint32_t)(n) / __base;           \
         |                     ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    const unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'const unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
>> include/linux/math.h:143:11: error: assignment of read-only variable 'r'
     143 |         r *= n_;                        \
         |           ^~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
>> include/asm-generic/div64.h:187:21: error: assignment of read-only variable 'r'
     187 |                 (n) >>= ilog2(__base);                  \
         |                     ^~~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:191:21: error: assignment of read-only variable 'r'
     191 |                 (n) = __div64_const32(n, __base);       \
         |                     ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
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
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:197:21: error: assignment of read-only variable 'r'
     197 |                 (n) = (uint32_t)(n) / __base;           \
         |                     ^
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    const unsigned int *
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:574:18: note: in expansion of macro 'mult_frac'
     574 |         window = mult_frac(bwmon->data->sample_ms, HW_TIMER_HZ, MSEC_PER_SEC);
         |                  ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'const unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/soc/qcom/icc-bwmon.c: In function 'bwmon_intr':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:640:30: note: in expansion of macro 'mult_frac'
     640 |         bwmon->target_kbps = mult_frac(max, MSEC_PER_SEC, bwmon->data->sample_ms);
         |                              ^~~~~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:640:30: note: in expansion of macro 'mult_frac'
     640 |         bwmon->target_kbps = mult_frac(max, MSEC_PER_SEC, bwmon->data->sample_ms);
         |                              ^~~~~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   include/linux/math.h:142:24: note: in expansion of macro 'do_div'
     142 |         typeof(x_) r = do_div(x_, d_);  \
         |                        ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:640:30: note: in expansion of macro 'mult_frac'
     640 |         bwmon->target_kbps = mult_frac(max, MSEC_PER_SEC, bwmon->data->sample_ms);
         |                              ^~~~~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   include/linux/math.h:144:9: note: in expansion of macro 'do_div'
     144 |         do_div(r, d_);                  \
         |         ^~~~~~
   drivers/soc/qcom/icc-bwmon.c:640:30: note: in expansion of macro 'mult_frac'
     640 |         bwmon->target_kbps = mult_frac(max, MSEC_PER_SEC, bwmon->data->sample_ms);
         |                              ^~~~~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~


vim +/x_ +187 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  176  
^1da177e4c3f41 Linus Torvalds     2005-04-16  177  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  178   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  179   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  181  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @183  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  184  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  185  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  186  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02 @187  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  188  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  189  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  190  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  191  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  192  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  193  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  194  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  195  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  196  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  197  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  198  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  199  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  200  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  202   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
