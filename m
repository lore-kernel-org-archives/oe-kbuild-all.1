Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF878D50F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUg4enjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701760030; x=1733296030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=98VZNfub+HclPOzauYfBNQql86RkYdBKS9eKmGijQsc=;
  b=aUg4enjprjJYEwGF58gl1p7ewdZg3xLKiCIHNzzZg7U3NqHZmnSaESDm
   wJn8nKnXE4tlTIqgHt28rpQ4VPHprpP9HIPgTotyx6PQT6ZNJSUu0UltC
   vhEQktClDQXugzNY0eq3lZJU1a86baLptE63651Pr4rCzEl7yHoM8kMwF
   Gxrrz4kqDYqfnfGqRK0pvIoeAcTMsP0UlnXVKHIWV3uHtyP6ZS7UE84mz
   piAZ2S1p3WA+FlXuZOeQgs2qEVSeVpziED0uRrtKoSpvjG7COgGFgPxc+
   BLWy5bi3MEuN6VdkG0OivKDwnZ6xZsxT8ttCEPqKdI6vNffMo6jdqvOo9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="393589010"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="393589010"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 23:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888825361"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="888825361"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2023 23:07:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAPWM-0008Tw-1e;
	Tue, 05 Dec 2023 07:07:06 +0000
Date: Tue, 5 Dec 2023 15:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:dynamic-hz 1/1] include/asm-generic/param.h:10:25:
 warning: "__kernel_hz" is not defined, evaluates to 0
Message-ID: <202312051456.XBCPgWck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux dynamic-hz
head:   ccfcc35f75018f05039a35c98e4685ea5ce32ab5
commit: ccfcc35f75018f05039a35c98e4685ea5ce32ab5 [1/1] HZ: Allow modifying HZ at boot time
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312051456.XBCPgWck-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051456.XBCPgWck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051456.XBCPgWck-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from ./arch/parisc/include/generated/uapi/asm/param.h:1,
                    from include/uapi/linux/param.h:5,
                    from include/linux/ratelimit_types.h:6,
                    from include/linux/printk.h:9,
                    from include/linux/kernel.h:31,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/parisc/kernel/asm-offsets.c:18:
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   ./include/generated/timeconst.h:10:5: note: in expansion of macro 'HZ'
      10 | #if HZ != 250
         |     ^~
   In file included from include/linux/jiffies.h:14,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15:
>> ./include/generated/timeconst.h:11:2: error: #error "include/generated/timeconst.h has the wrong HZ value!"
      11 | #error "include/generated/timeconst.h has the wrong HZ value!"
         |  ^~~~~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:23:5: note: in expansion of macro 'HZ'
      23 | #if HZ >= 12 && HZ < 24
         |     ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:25:7: note: in expansion of macro 'HZ'
      25 | #elif HZ >= 24 && HZ < 48
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:27:7: note: in expansion of macro 'HZ'
      27 | #elif HZ >= 48 && HZ < 96
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:29:7: note: in expansion of macro 'HZ'
      29 | #elif HZ >= 96 && HZ < 192
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:31:7: note: in expansion of macro 'HZ'
      31 | #elif HZ >= 192 && HZ < 384
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:33:7: note: in expansion of macro 'HZ'
      33 | #elif HZ >= 384 && HZ < 768
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:35:7: note: in expansion of macro 'HZ'
      35 | #elif HZ >= 768 && HZ < 1536
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:37:7: note: in expansion of macro 'HZ'
      37 | #elif HZ >= 1536 && HZ < 3072
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:39:7: note: in expansion of macro 'HZ'
      39 | #elif HZ >= 3072 && HZ < 6144
         |       ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:41:7: note: in expansion of macro 'HZ'
      41 | #elif HZ >= 6144 && HZ < 12288
         |       ^~
>> include/linux/jiffies.h:44:3: error: #error Invalid value of HZ.
      44 | # error Invalid value of HZ.
         |   ^~~~~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/vdso/jiffies.h:9:34: note: in expansion of macro 'HZ'
       9 | #define TICK_NSEC ((NSEC_PER_SEC+HZ/2)/HZ)
         |                                  ^~
   include/linux/jiffies.h:407:31: note: in expansion of macro 'TICK_NSEC'
     407 | #if !((((NSEC_PER_SEC << 2) / TICK_NSEC) << (SEC_JIFFIE_SC - 2)) & 0x80000000)
         |                               ^~~~~~~~~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/vdso/jiffies.h:9:40: note: in expansion of macro 'HZ'
       9 | #define TICK_NSEC ((NSEC_PER_SEC+HZ/2)/HZ)
         |                                        ^~
   include/linux/jiffies.h:407:31: note: in expansion of macro 'TICK_NSEC'
     407 | #if !((((NSEC_PER_SEC << 2) / TICK_NSEC) << (SEC_JIFFIE_SC - 2)) & 0x80000000)
         |                               ^~~~~~~~~
   In file included from include/linux/jiffies.h:12:
>> include/vdso/jiffies.h:9:39: error: division by zero in #if
       9 | #define TICK_NSEC ((NSEC_PER_SEC+HZ/2)/HZ)
         |                                       ^
   include/linux/jiffies.h:407:31: note: in expansion of macro 'TICK_NSEC'
     407 | #if !((((NSEC_PER_SEC << 2) / TICK_NSEC) << (SEC_JIFFIE_SC - 2)) & 0x80000000)
         |                               ^~~~~~~~~
>> include/linux/jiffies.h:406:29: warning: "SHIFT_HZ" is not defined, evaluates to 0 [-Wundef]
     406 | #define SEC_JIFFIE_SC (31 - SHIFT_HZ)
         |                             ^~~~~~~~
   include/linux/jiffies.h:407:46: note: in expansion of macro 'SEC_JIFFIE_SC'
     407 | #if !((((NSEC_PER_SEC << 2) / TICK_NSEC) << (SEC_JIFFIE_SC - 2)) & 0x80000000)
         |                                              ^~~~~~~~~~~~~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:452:5: note: in expansion of macro 'HZ'
     452 | #if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
         |     ^~
>> include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:452:44: note: in expansion of macro 'HZ'
     452 | #if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
         |                                            ^~
>> include/linux/jiffies.h:452:42: error: division by zero in #if
     452 | #if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
         |                                          ^
   include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:462:7: note: in expansion of macro 'HZ'
     462 | #elif HZ > MSEC_PER_SEC && !(HZ % MSEC_PER_SEC)
         |       ^~
   include/asm-generic/param.h:10:25: warning: "__kernel_hz" is not defined, evaluates to 0 [-Wundef]
      10 | # define HZ             __kernel_hz     /* Internal kernel timer frequency */
         |                         ^~~~~~~~~~~
   include/linux/jiffies.h:527:22: note: in expansion of macro 'HZ'
     527 | #if !(USEC_PER_SEC % HZ)
         |                      ^~
   include/linux/jiffies.h:527:20: error: division by zero in #if
     527 | #if !(USEC_PER_SEC % HZ)
         |                    ^
   make[3]: *** [scripts/Makefile.build:116: arch/parisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__kernel_hz +10 include/asm-generic/param.h

     8	
     9	# undef HZ
  > 10	# define HZ		__kernel_hz	/* Internal kernel timer frequency */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
