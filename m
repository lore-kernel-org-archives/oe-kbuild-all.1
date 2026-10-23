Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725719;
	b=yENrYeYzGuFva7jzOgQzN5UbywgzT4jTgqNRBaKk544LKbbL4w9p2e8CNZvhnVxAzSiB
	 a+EI11qGuaKeTURMtjeY0xxJriDWI3p75O9ABOz0doU/QK4XdeC+vlSxcG7EBkQ5pqAvq
	 j5YewjXWlk1HMSnUmS8kGTCG2uNBFTPLBMFYbIx4ialnD1ND7BL4+X79mnrIovOfdOGLL
	 FwB5ueXSnaFIW2/qBpt6FM0c+W53LDfhVNQJqenU9YIfxERVCHms3kVXWYVJL//vuBz6W
	 KdAK3wD4r1fRAyBxsBV+CpXXSA8vmKY1RGMMPgdUtZN1tZoGyGSxmPvXuGNSSE4v1VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725719;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iBXTTDfno/0fCVAWcXPGlvBc2e+bx4YrioHApxCIYeg=;
	b=OPnYR4wvP5+88TxPdZJEHsmQvn2lvdLxS9nogQ0K+Y2FSe6NoWVytOm0uMvreaJ8dDa8
	 R/IcKTPIQd20fJLkZOnrr7s9IixJNCj6TlvmJlB4cgRfGujUiyw1JFtVmDasGIwQioOqE
	 lUaMXn9hcGRD8PXEyQAAeyga4Vk7LoCBiDxzPi8ld3n0B9S9ZlP9nM4SX+JvZ7a+1bsy+
	 YsMoNxcMTYXG/KnfddTg4u6EIjqbvezz58dudK6/Z//nhZO++DQi3WsuV6u4ITzhdkIGv
	 VBRc0f/FIX+a6nQVjxVUAP26iynYC+HVUMx6oFqouCHwpuK8e6vKr3QdOyob5nmLnIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nEA30Na3;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A581606A319
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 03:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A581606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nEA30Na3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792725716; x=1824261716;
  h=date:from:to:cc:subject:message-id;
  bh=UDojbRun6VPCiV2pPNcgSUmfH61UdKoeutu8iP/4foM=;
  b=nEA30Na3L+eAeL4+ElAagRu5pjFZDwqVFGu7UTjaJmm+e6uKCDXHJ7q9
   pPZdv/lffBhCS4p1rVx42diFZlnzpb6XaNuzp1YSnqrSHQi4unxSERPbi
   TS0q5HQGLocv+c5+fKYymE9MWyf0a8uOaxEzq5zvHd8WXN65LGRM1QYtX
   xsmLqctUbG50Ge2mCrFQXIudPgBd9S7PygD4VE8FjgDHrSwYBRCutIp4z
   GcryIu84KTMmNtf5oBNf0jgf478ag3uaPCx5bq9IEOyuRzzej05SLnKza
   k6GSF2PgBvd3Q0mTgHK+cnSbR/4L3icSNg2ofuOMsP08O8nJc/C7dqX9V
   w==;
X-CSE-ConnectionGUID: SNFElvSTRO6fFkszG4IU9Q==
X-CSE-MsgGUID: uI9Pl5Q/Tvm5WfdthV7tFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1503832"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1503832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 20:21:56 -0700
X-CSE-ConnectionGUID: 8jz3M2FWQWCt/o9iyKwplQ==
X-CSE-MsgGUID: i+ryPpo9Q16Mu/iax8VMuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3909586"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2026 20:21:54 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK5qp-00000000S5C-22lR;
	Fri, 23 Oct 2026 03:21:51 +0000
Date: Fri, 23 Oct 2026 11:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lumag-msm:venus-8996-vmem 95/173]
 drivers/pmdomain/qcom/cprh.c:1902:33: warning: format '%lu' expects argument
 of type 'long unsigned int', but argument 3 has type 'int'
Message-ID: <202610231134.APP4wqc4-lkp@intel.com>
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

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/lumag/msm venus-8996-vmem
head:   4dff7b31dd13e97b8f7abab7bc115d2875afd5e8
commit: 4bacca3e66429db0f24a06a26002a59f684da2dc [95/173] pmdomain: qcom: rename the CPR3 driver to CPRh
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261023/202610231134.APP4wqc4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231134.APP4wqc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231134.APP4wqc4-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/pmdomain/qcom/cprh.c:364:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
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
   drivers/pmdomain/qcom/cprh.c:1902:39: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
    1902 |         seq_printf(s, "busy = %lu, ", FIELD_GET(CPR3_RESULT0_BUSY_MASK, reg));
         |                                       ^~~~~~~~~
>> drivers/pmdomain/qcom/cprh.c:1902:33: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
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


vim +1902 drivers/pmdomain/qcom/cprh.c

a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1866  
4bacca3e66429d drivers/pmdomain/qcom/cprh.c Dmitry Baryshkov           2026-10-16  1867  static int cprh_debug_info_show(struct seq_file *s, void *unused)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1868  {
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1869  	struct cpr_thread *thread = s->private;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1870  	struct fuse_corner *fuse = thread->fuse_corners;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1871  	struct corner *corner = thread->corners;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1872  	u32 tid = thread->desc->hw_tid;
c8fc9539ac891c drivers/pmdomain/qcom/cpr3.c Dmitry Baryshkov           2026-10-16  1873  	u32 ctl, reg;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1874  	unsigned int i;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1875  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1876  	ctl = cpr_read(thread, CPR3_REG_CPR_CTL);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1877  	seq_printf(s, "cpr_ctl = 0x%x\n", ctl);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1878  
c8fc9539ac891c drivers/pmdomain/qcom/cpr3.c Dmitry Baryshkov           2026-10-16  1879  	seq_printf(s, "thread %d - hw tid: %u:\n",
c8fc9539ac891c drivers/pmdomain/qcom/cpr3.c Dmitry Baryshkov           2026-10-16  1880  		   thread->id, thread->desc->hw_tid);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1881  	seq_printf(s, "%d corners, derived from %d fuse corners\n",
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1882  		   thread->num_corners, thread->desc->num_fuse_corners);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1883  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1884  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1885  	/* The corners have not been initialized yet. */
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1886  	if (!thread->num_corners)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1887  		return 0;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1888  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1889  	for (i = 0; i < thread->num_corners; i++, corner++)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1890  		seq_printf(s, "corner %d - uV=[%d %d %d] quot=%d freq=%llu\n",
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1891  			   i, corner->min_uV, corner->uV, corner->max_uV,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1892  			   corner->fuse_corner->quot - corner->quot_adjust,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1893  			   corner->freq);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1894  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1895  	for (i = 0; i < thread->desc->num_fuse_corners; i++, fuse++)
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1896  		seq_printf(s, "fuse %d - uV=[%d %d %d] quot=%d freq=%llu\n",
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1897  			   i, fuse->min_uV, fuse->uV, fuse->max_uV,
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1898  			   fuse->quot, fuse->max_freq);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1899  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1900  	reg = cpr_read(thread, CPR3_REG_RESULT0(tid));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1901  	seq_printf(s, "cpr_result_0 = 0x%x\n  [", reg);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09 @1902  	seq_printf(s, "busy = %lu, ", FIELD_GET(CPR3_RESULT0_BUSY_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1903  	seq_printf(s, "step_dn = %lu, ", FIELD_GET(CPR3_RESULT0_STEP_DN_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1904  	seq_printf(s, "step_up = %lu, ", FIELD_GET(CPR3_RESULT0_STEP_UP_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1905  	seq_printf(s, "error_steps = %lu, ", FIELD_GET(CPR3_RESULT0_ERROR_STEPS_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1906  	seq_printf(s, "error = %lu, ", FIELD_GET(CPR3_RESULT0_ERROR_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1907  	seq_printf(s, "negative = %lu", FIELD_GET(CPR3_RESULT0_NEG_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1908  	seq_puts(s, "]\n");
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1909  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1910  	reg = cpr_read(thread, CPR3_REG_RESULT1(tid));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1911  	seq_printf(s, "cpr_result_1 = 0x%x\n  [", reg);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1912  	seq_printf(s, "quot_min = %lu, ", FIELD_GET(CPR3_RESULT1_QUOT_MIN_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1913  	seq_printf(s, "quot_max = %lu, ", FIELD_GET(CPR3_RESULT1_QUOT_MAX_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1914  	seq_printf(s, "ro_min = %lu, ", FIELD_GET(CPR3_RESULT1_RO_MIN_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1915  	seq_printf(s, "ro_max = %lu", FIELD_GET(CPR3_RESULT1_RO_MAX_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1916  	seq_puts(s, "]\n");
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1917  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1918  	reg = cpr_read(thread, CPR3_REG_RESULT2(tid));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1919  	seq_printf(s, "cpr_result_2 = 0x%x\n  [", reg);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1920  	seq_printf(s, "qout_step_min = %lu, ", FIELD_GET(CPR3_RESULT2_STEP_QUOT_MIN_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1921  	seq_printf(s, "qout_step_max = %lu, ", FIELD_GET(CPR3_RESULT2_STEP_QUOT_MAX_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1922  	seq_printf(s, "sensor_min = %lu, ", FIELD_GET(CPR3_RESULT2_SENSOR_MIN_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1923  	seq_printf(s, "sensor_max = %lu", FIELD_GET(CPR3_RESULT2_SENSOR_MAX_MASK, reg));
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1924  	seq_puts(s, "]\n");
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1925  
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1926  	return 0;
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1927  }
4bacca3e66429d drivers/pmdomain/qcom/cprh.c Dmitry Baryshkov           2026-10-16  1928  DEFINE_SHOW_ATTRIBUTE(cprh_debug_info);
a1003a4971201d drivers/pmdomain/qcom/cpr3.c AngeloGioacchino Del Regno 2026-09-09  1929  

:::::: The code at line 1902 was first introduced by commit
:::::: a1003a4971201d9683a0a804476cf1003353b8bc pmdomain: qcom: Add a driver for CPR3+

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
