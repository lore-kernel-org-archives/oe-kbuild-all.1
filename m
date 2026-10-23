Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755017;
	b=YrBYYYDb5ctdWhJ73E5JO1ffNCb4rWCv3lDzdOZHoJVIbwYCh4LVg0CDiRy4unI+ilf9
	 av4Owm5dFEykzy2abU7iD0yJhLYg++GX8GdFOWPBsWXmWhq3AG0okTpP/A93Y5XiHwdTC
	 Bo35cI1umb0JLabExwHgvbb1i4x/QrKGhb8eToIx50a7VUVKZh/XTzMZvnizdfw5tQXp2
	 JxYAFWBRzX21AnWWiomuR4uDPHuVLuan/XTuFDN7XLqdHz/fvaqb1feyf0o8cpbP+gTzf
	 scp2aptj+AYcemHfYSrT4U+cwgl4hZyDTXth2ax1wGQalO5G8vH5Y3GvZM5/34yctjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755017;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=stSnoxRhtt4+RlOOPYNyOyUNv9mv4Li2UgGhGtQq/nk=;
	b=y9Q6TrWdr1GwPYxHP4njRHv7k9cEYhBMWQSwbTtocC2a5C56V29BIA7ARPBD59jM5jAJ
	 Ll7lO+rgFt5PeA2oCwIA0jNy+Cx6DQ2fyTk+s95lWPPEedOjctJZ9mvnXuUexSE3rAEuR
	 5Sd9l6R4fZlEGwmeL/WGhw3dQCCzeEN8tmEPBai0u7SA8aY3BLwQe4D0ZKmoQyv7p8uDl
	 e0w3T3lT3u9cRN9SOorCg7ffPyaDkgNGrnuHraX6BAyfAMOobphhaEO/rNAPh176F87cL
	 lcrXYAW3JTnfJk4Yi2HBpcChymikUKeX8PstpunaRGUvDHDZyg/WJiP8GJIQmzJAvgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fYG0ZPGY;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A99606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 11:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fYG0ZPGY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792755016; x=1824291016;
  h=date:from:to:cc:subject:message-id;
  bh=GxJWrSm+ECAfy3dNT6tjS8qMlV0KfUed5kjUmtPmzbE=;
  b=fYG0ZPGYArfLRyccelhwAjqPCfUuq5sqBz79uAg/9ix0QD3kOhtO29U/
   JZLTV7vdt5iGB9aBlGtb1hPGLN2TVmdfxs3oO0bkssKkFBHexAGZKtakp
   OfZ1ptYA5sZUhPZR16uU1aYY7WG/arhgeOB0Rm9rpKSR4pmOq65nG2twl
   hpqANeQxEy7MBXp2P7iXEhZSvstGaH1BVEVTawZ69qejUgn/ZkHxuD6Oj
   +NgTMbq5CEgYdEUWroleOWRyLz6UKGjxVPOvFVDr34dyQtndaYPQG6BjG
   IlaUKY73/g+5oQfsvEfj4wz8k3PW5jclZTb5pox0+jJlgcM9/Pnlb1CeX
   w==;
X-CSE-ConnectionGUID: GYO66tAJRtu93o2zrfQKgQ==
X-CSE-MsgGUID: BLHUH0vaSeOzdiPM+oIiFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1546882"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1546882"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 04:30:16 -0700
X-CSE-ConnectionGUID: CZ9XDZmETFSR4dOtMjGIVg==
X-CSE-MsgGUID: yY6/TSckTdW1XINc6+fCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3655851"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2026 04:30:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKDTO-00000000SdC-3JgV;
	Fri, 23 Oct 2026 11:30:10 +0000
Date: Fri, 23 Oct 2026 19:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lumag-msm:venus-8996-vmem 95/173]
 drivers/pmdomain/qcom/cprh.c:364:15: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <202610231956.2uvSBto1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dmitry,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/lumag/msm venus-8996-vmem
head:   4dff7b31dd13e97b8f7abab7bc115d2875afd5e8
commit: 4bacca3e66429db0f24a06a26002a59f684da2dc [95/173] pmdomain: qcom: rename the CPR3 driver to CPRh
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261023/202610231956.2uvSBto1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231956.2uvSBto1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231956.2uvSBto1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/kernel.h:26,
                    from include/linux/clk.h:13,
                    from drivers/pmdomain/qcom/cprh.c:10:
   drivers/pmdomain/qcom/cprh.c: In function 'cpr_configure':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/pmdomain/qcom/cprh.c:352:9: note: in expansion of macro 'do_div'
     352 |         do_div(drv->gcnt, 1000);
         |         ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from drivers/pmdomain/qcom/cprh.c:9:
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/pmdomain/qcom/cprh.c:352:9: note: in expansion of macro 'do_div'
     352 |         do_div(drv->gcnt, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u32 * {aka unsigned int *}
   drivers/pmdomain/qcom/cprh.c:352:9: note: in expansion of macro 'do_div'
     352 |         do_div(drv->gcnt, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/pmdomain/qcom/cprh.c:356:9: note: in expansion of macro 'do_div'
     356 |         do_div(val, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/pmdomain/qcom/cprh.c:356:9: note: in expansion of macro 'do_div'
     356 |         do_div(val, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u32 * {aka unsigned int *}
   drivers/pmdomain/qcom/cprh.c:356:9: note: in expansion of macro 'do_div'
     356 |         do_div(val, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
>> drivers/pmdomain/qcom/cprh.c:364:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     364 |         val = FIELD_PREP(CPR3_CPR_CTL_IDLE_CLOCKS_MASK, desc->idle_clocks) |
         |               ^~~~~~~~~~
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/pmdomain/qcom/cprh.c:406:9: note: in expansion of macro 'do_div'
     406 |         do_div(val, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/pmdomain/qcom/cprh.c:406:9: note: in expansion of macro 'do_div'
     406 |         do_div(val, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    u32 * {aka unsigned int *}
   drivers/pmdomain/qcom/cprh.c:406:9: note: in expansion of macro 'do_div'
     406 |         do_div(val, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/pmdomain/qcom/cprh.c: In function 'cprh_init_parameters':
   include/asm-generic/div64.h:183:35: warning: comparison of distinct pointer types lacks a cast [-Wcompare-distinct-pointer-types]
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   drivers/pmdomain/qcom/cprh.c:1098:9: note: in expansion of macro 'do_div'
    1098 |         do_div(drv->ref_clk_khz, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:195:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   drivers/pmdomain/qcom/cprh.c:1098:9: note: in expansion of macro 'do_div'
    1098 |         do_div(drv->ref_clk_khz, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:199:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Wincompatible-pointer-types]
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   drivers/pmdomain/qcom/cprh.c:1098:9: note: in expansion of macro 'do_div'
    1098 |         do_div(drv->ref_clk_khz, 1000);
         |         ^~~~~~
   include/asm-generic/div64.h:174:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/pmdomain/qcom/cprh.c: In function 'cprh_debug_info_show':
>> drivers/pmdomain/qcom/cprh.c:1902:39: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    1902 |         seq_printf(s, "busy = %lu, ", FIELD_GET(CPR3_RESULT0_BUSY_MASK, reg));
         |                                       ^~~~~~~~~
   drivers/pmdomain/qcom/cprh.c:1902:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1902 |         seq_printf(s, "busy = %lu, ", FIELD_GET(CPR3_RESULT0_BUSY_MASK, reg));
         |                               ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |     |
         |                                 |     int
         |                                 long unsigned int
         |                               %u
   drivers/pmdomain/qcom/cprh.c:1903:36: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1903 |         seq_printf(s, "step_dn = %lu, ", FIELD_GET(CPR3_RESULT0_STEP_DN_MASK, reg));
         |                                  ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |     |
         |                                    |     int
         |                                    long unsigned int
         |                                  %u
   drivers/pmdomain/qcom/cprh.c:1904:36: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1904 |         seq_printf(s, "step_up = %lu, ", FIELD_GET(CPR3_RESULT0_STEP_UP_MASK, reg));
         |                                  ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |     |
         |                                    |     int
         |                                    long unsigned int
         |                                  %u
   drivers/pmdomain/qcom/cprh.c:1905:40: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1905 |         seq_printf(s, "error_steps = %lu, ", FIELD_GET(CPR3_RESULT0_ERROR_STEPS_MASK, reg));
         |                                      ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        |     |
         |                                        |     int
         |                                        long unsigned int
         |                                      %u
   drivers/pmdomain/qcom/cprh.c:1906:34: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1906 |         seq_printf(s, "error = %lu, ", FIELD_GET(CPR3_RESULT0_ERROR_MASK, reg));
         |                                ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  |     |
         |                                  |     int
         |                                  long unsigned int
         |                                %u
   drivers/pmdomain/qcom/cprh.c:1907:37: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1907 |         seq_printf(s, "negative = %lu", FIELD_GET(CPR3_RESULT0_NEG_MASK, reg));
         |                                   ~~^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |   |
         |                                     |   int
         |                                     long unsigned int
         |                                   %u
   drivers/pmdomain/qcom/cprh.c:1912:37: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1912 |         seq_printf(s, "quot_min = %lu, ", FIELD_GET(CPR3_RESULT1_QUOT_MIN_MASK, reg));
         |                                   ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |     |
         |                                     |     int
         |                                     long unsigned int
         |                                   %u
   drivers/pmdomain/qcom/cprh.c:1913:37: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1913 |         seq_printf(s, "quot_max = %lu, ", FIELD_GET(CPR3_RESULT1_QUOT_MAX_MASK, reg));
         |                                   ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |     |
         |                                     |     int
         |                                     long unsigned int
         |                                   %u
   drivers/pmdomain/qcom/cprh.c:1914:35: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1914 |         seq_printf(s, "ro_min = %lu, ", FIELD_GET(CPR3_RESULT1_RO_MIN_MASK, reg));
         |                                 ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |     |
         |                                   |     int
         |                                   long unsigned int
         |                                 %u
   drivers/pmdomain/qcom/cprh.c:1915:35: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1915 |         seq_printf(s, "ro_max = %lu", FIELD_GET(CPR3_RESULT1_RO_MAX_MASK, reg));
         |                                 ~~^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |   |
         |                                   |   int
         |                                   long unsigned int
         |                                 %u
   drivers/pmdomain/qcom/cprh.c:1920:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1920 |         seq_printf(s, "qout_step_min = %lu, ", FIELD_GET(CPR3_RESULT2_STEP_QUOT_MIN_MASK, reg));
         |                                        ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          |     |
         |                                          |     int
         |                                          long unsigned int
         |                                        %u
   drivers/pmdomain/qcom/cprh.c:1921:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1921 |         seq_printf(s, "qout_step_max = %lu, ", FIELD_GET(CPR3_RESULT2_STEP_QUOT_MAX_MASK, reg));
         |                                        ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                          |     |
         |                                          |     int
         |                                          long unsigned int
         |                                        %u
   drivers/pmdomain/qcom/cprh.c:1922:39: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1922 |         seq_printf(s, "sensor_min = %lu, ", FIELD_GET(CPR3_RESULT2_SENSOR_MIN_MASK, reg));
         |                                     ~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |     |
         |                                       |     int
         |                                       long unsigned int
         |                                     %u
   drivers/pmdomain/qcom/cprh.c:1923:39: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    1923 |         seq_printf(s, "sensor_max = %lu", FIELD_GET(CPR3_RESULT2_SENSOR_MAX_MASK, reg));
         |                                     ~~^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |   |
         |                                       |   int
         |                                       long unsigned int
         |                                     %u


vim +/FIELD_PREP +364 drivers/pmdomain/qcom/cprh.c

a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  323  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  324  /**
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  325   * cpr_configure() - Configure main HW parameters
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  326   * @thread: Structure holding CPR thread-specific parameters
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  327   *
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  328   * This function configures the main CPR hardware parameters, such as
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  329   * internal timers (and delays), sensor ownerships, activates and/or
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  330   * deactivates cpr-threads and others, as one sequence for all of the
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  331   * versions supported in this driver. By design, the function may
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  332   * return a success earlier if the sequence for "a previous version"
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  333   * has ended.
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  334   *
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  335   * Context: The CPR must be clocked before calling this function!
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  336   *
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  337   * Return: Zero for success or negative number on errors.
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  338   */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  339  static int cpr_configure(struct cpr_thread *thread)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  340  {
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  341  	const struct cpr_thread_desc *tdesc = thread->desc;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  342  	struct cpr_drv *drv = thread->drv;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  343  	const struct cpr_desc *desc = drv->desc;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  344  	u32 val;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  345  	int i;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  346  
c8fc9539ac891c drivers/pmdomain/qcom/cpr3.c Dmitry Baryshkov           2026-10-16  347  	/* Disable CPR */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  348  	cpr_write(thread, CPR3_REG_CPR_CTL, 0);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  349  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  350  	/* Init and save gcnt */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  351  	drv->gcnt = drv->ref_clk_khz * desc->gcnt_us;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  352  	do_div(drv->gcnt, 1000);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  353  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  354  	/* Program the delay count for the timer */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  355  	val = drv->ref_clk_khz * desc->timer_delay_us;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  356  	do_div(val, 1000);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  357  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  358  	cpr_write(thread, CPR3_REG_CPR_TIMER_AUTO_CONT, val);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  359  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  360  	dev_dbg(drv->dev, "Timer count: %#0x (for %d us)\n", val,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  361  		desc->timer_delay_us);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  362  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  363  	/* Program the control register */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09 @364  	val = FIELD_PREP(CPR3_CPR_CTL_IDLE_CLOCKS_MASK, desc->idle_clocks) |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  365  	      FIELD_PREP(CPR3_CPR_CTL_COUNT_MODE_MASK, desc->count_mode) |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  366  	      FIELD_PREP(CPR3_CPR_CTL_COUNT_REPEAT_MASK, desc->count_repeat);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  367  	cpr_write(thread, CPR3_REG_CPR_CTL, val);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  368  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  369  	/* Configure CPR default step quotients */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  370  	val = FIELD_PREP(CPR3_CPR_STEP_QUOT_MIN_MASK, tdesc->step_quot_init_min) |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  371  	      FIELD_PREP(CPR3_CPR_STEP_QUOT_MAX_MASK, tdesc->step_quot_init_max);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  372  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  373  	cpr_write(thread, CPR3_REG_CPR_STEP_QUOT, val);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  374  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  375  	/* Configure the CPR sensor ownership (always on thread 0) */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  376  	for (i = tdesc->sensor_range_start; i < tdesc->sensor_range_end; i++)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  377  		cpr_write(thread, CPR3_REG_SENSOR_OWNER(i), 0);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  378  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  379  	/* Program Consecutive Up & Down */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  380  	val = FIELD_PREP(CPR3_THRESH_CONS_DOWN_MASK, desc->timer_cons_down) |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  381  	      FIELD_PREP(CPR3_THRESH_CONS_UP_MASK, desc->timer_cons_up) |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  382  	      FIELD_PREP(CPR3_THRESH_DOWN_THRESH_MASK, desc->down_threshold) |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  383  	      FIELD_PREP(CPR3_THRESH_UP_THRESH_MASK, desc->up_threshold);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  384  	cpr_write(thread, CPR3_REG_THRESH(tdesc->hw_tid), val);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  385  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  386  	/* Mask all ring oscillators for all threads initially */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  387  	cpr_write(thread, CPR3_REG_RO_MASK(tdesc->hw_tid), CPR3_RO_MASK);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  388  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  389  	/* HW Closed-loop control */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  390  	cpr_masked_write(thread, CPR4_REG_MARGIN_ADJ_CTL,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  391  			 CPR4_MARGIN_ADJ_HW_CLOSED_LOOP_EN,
c8fc9539ac891c drivers/pmdomain/qcom/cpr3.c Dmitry Baryshkov           2026-10-16  392  			 CPR4_MARGIN_ADJ_HW_CLOSED_LOOP_EN);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  393  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  394  	if (tdesc->hw_tid > 0)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  395  		cpr_masked_write(thread, CPR4_REG_MISC,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  396  				 CPR4_MISC_RESET_STEP_QUOT_LOOP_EN |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  397  				 CPR4_MISC_THREAD_HAS_ALWAYS_VOTE_EN,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  398  				 CPR4_MISC_RESET_STEP_QUOT_LOOP_EN |
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  399  				 CPR4_MISC_THREAD_HAS_ALWAYS_VOTE_EN);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  400  	else if (desc->reset_step_quot_loop_en)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  401  		cpr_masked_write(thread, CPR4_REG_MISC,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  402  				 CPR4_MISC_RESET_STEP_QUOT_LOOP_EN,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  403  				 CPR4_MISC_RESET_STEP_QUOT_LOOP_EN);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  404  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  405  	val = drv->vreg_step;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  406  	do_div(val, 1000);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  407  	cpr_masked_write(thread, CPR4_REG_MARGIN_ADJ_CTL,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  408  			 CPR4_MARGIN_ADJ_PMIC_STEP_SIZE_MASK,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  409  			 val << CPR4_MARGIN_ADJ_PMIC_STEP_SIZE_SHIFT);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  410  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  411  	cpr_masked_write(thread, CPR4_REG_SAW_ERROR_STEP_LIMIT,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  412  			 CPR4_SAW_ERROR_STEP_LIMIT_DN_MASK,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  413  			 desc->vreg_step_down_limit <<
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  414  			 CPR4_SAW_ERROR_STEP_LIMIT_DN_SHIFT);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  415  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  416  	cpr_masked_write(thread, CPR4_REG_SAW_ERROR_STEP_LIMIT,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  417  			 CPR4_SAW_ERROR_STEP_LIMIT_UP_MASK,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  418  			 desc->vreg_step_up_limit <<
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  419  			 CPR4_SAW_ERROR_STEP_LIMIT_UP_SHIFT);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  420  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  421  	cpr_masked_write(thread, CPR4_REG_MARGIN_ADJ_CTL,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  422  			 CPR4_MARGIN_ADJ_PER_RO_KV_MARGIN_EN,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  423  			 CPR4_MARGIN_ADJ_PER_RO_KV_MARGIN_EN);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  424  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  425  	if (tdesc->hw_tid > 0)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  426  		cpr_masked_write(thread, CPR4_REG_CPR_TIMER_CLAMP,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  427  				 CPR4_CPR_TIMER_CLAMP_THREAD_AGGREGATION_EN,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  428  				 CPR4_CPR_TIMER_CLAMP_THREAD_AGGREGATION_EN);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  429  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  430  	/* Settling timer to account for one VDD supply step */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  431  	if (desc->vdd_settle_time_us > 0) {
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  432  		u32 m = CPR4_MARGIN_TEMP_CORE_TIMERS_SETTLE_VOLTAGE_COUNT_MASK;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  433  		u32 s = CPR4_MARGIN_TEMP_CORE_TIMERS_SETTLE_VOLTAGE_COUNT_SHFT;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  434  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  435  		cpr_masked_write(thread, CPR4_REG_MARGIN_TEMP_CORE_TIMERS,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  436  				 m, desc->vdd_settle_time_us << s);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  437  	}
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  438  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  439  	/* Settling timer to account for one corner-switch request */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  440  	if (desc->corner_settle_time_us > 0)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  441  		cpr_masked_write(thread, drv->reg_ctl,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  442  				 CPRH_CTL_MODE_SWITCH_DELAY_MASK,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  443  				 desc->corner_settle_time_us <<
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  444  				 CPRH_CTL_MODE_SWITCH_DELAY_SHIFT);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  445  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  446  	/* Base voltage and multiplier values for CPRh internal calculations */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  447  	cpr_masked_write(thread, drv->reg_ctl,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  448  			 CPRH_CTL_BASE_VOLTAGE_MASK,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  449  			 (DIV_ROUND_UP(desc->cpr_base_voltage,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  450  				       drv->vreg_step) <<
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  451  			  CPRH_CTL_BASE_VOLTAGE_SHIFT));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  452  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  453  	cpr_masked_write(thread, drv->reg_ctl,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  454  			 CPRH_CTL_VOLTAGE_MULTIPLIER_MASK,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  455  			 DIV_ROUND_UP(drv->vreg_step, 1000) <<
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  456  			 CPRH_CTL_VOLTAGE_MULTIPLIER_SHIFT);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  457  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  458  	return 0;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  459  }
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  460  

:::::: The code at line 364 was first introduced by commit
:::::: a1003a4971201d9683a0a804476cf1003353b8bc pmdomain: qcom: Add a driver for CPR3+

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
