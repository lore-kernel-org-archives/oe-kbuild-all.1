Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2801E52F99
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758675729; cv=none; b=X4M5Uc8gMcBQn3Bu3/7ipNLifH+j0HD00ngWU9D22ypRpUQvuQXpN+DlvdmgNpgi/06kGgVMZ0RINkjqnHIXA95xkBJvaAy6URWgxbQg+rYiKBi/UdBlYDfJDiIvq05kP8OUhCY8l9j4mYjawkw1MSgWCN3PfotUkCWnSueZoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758675729; c=relaxed/simple;
	bh=pFunarHf/Ry+TmbJvv8jzu+OIZD/iUBczL26oeRjccc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+IBB7+IQm+GhgvNkqa5qo3RemXtp11L/vLyyze6VSkCQlFHb2QYXZ4jdFlnRZ2yPEYWeblzci6WtEGmWk/721fhUuRA4Ea96LJNuBFkm9krZU3uzOOkcY8htvAQHr4C7Pru95xmR1SOfqs8LOd7C4FxWPY00UEm59BAuD8cqHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpfjAESl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpfjAESl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758675727; x=1790211727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFunarHf/Ry+TmbJvv8jzu+OIZD/iUBczL26oeRjccc=;
  b=JpfjAESlFZghwYYQD0w8TKPKLdlp4Y87f/PkKg7xHcvGSaGGWFABvt/D
   MAWrmyQKyxBzPJYgwFsAxZs+6/1Bms5elizaQEBWs2Y2N0imnNDfNIVl4
   34vJJumNKhtkDZbrEw4+2O5EdJqZ/wUawCOzLr1tIci8f5W2sYvMJStW4
   5xBK3RE+RLxGLCul/EFA9KLcUF0OamVP/0LHhNxGnmyI32GYCJcsrwJSH
   H1dS6NNGSqT96yCH73nmZC1VBCOwa+U+wpF0gizeG67NFkl1IHJRCVJgb
   y/vPX6zDzAEuKIVu+sld0MreMKyHu7ayhjjNTF0CQ33aVHnmvMk6y2Asc
   w==;
X-CSE-ConnectionGUID: BJuqmdz2S5GUGUQe0f4Xog==
X-CSE-MsgGUID: pBFMSHpASjaUYecg12qztQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72071673"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="72071673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 18:02:06 -0700
X-CSE-ConnectionGUID: /qysHImvSxGQ83vHwdiKTg==
X-CSE-MsgGUID: wFAlKjviTWqaVQqt2bfTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="200602466"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2025 18:02:05 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1DtS-0003gj-37;
	Wed, 24 Sep 2025 01:02:02 +0000
Date: Wed, 24 Sep 2025 09:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of
 distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long
 *') and 'typeof (1) *' (aka 'int *'))
Message-ID: <202509240848.LlWAWLQ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: 6242f1a36109cc7f9d1236c228543e841fa83a6d [1/1] media: venus: vdec: Clamp param smaller than 1fps and bigger than 240.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250924/202509240848.LlWAWLQ7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240848.LlWAWLQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240848.LlWAWLQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long *') and 'typeof (1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:45: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:883:19: note: expanded from macro 'max'
     883 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kernel.h:867:35: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ~~~~~~~~~~~^~~~~
   include/linux/kernel.h:857:16: note: expanded from macro '__safe_cmp'
     857 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ~~~~~~~~~~~~^~~~~
   include/linux/kernel.h:843:22: note: expanded from macro '__typecheck'
     843 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                    ^
>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof ((typeof (us_per_frame))__builtin_choose_expr(((!!(sizeof ((typeof (us_per_frame) *)1 == (typeof (1) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)(us_per_frame) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)(1) * 0L)) : (int *)8))))), ((us_per_frame) > (1) ? (us_per_frame) : (1)), ({
       typeof (us_per_frame) __UNIQUE_ID___x494 = (us_per_frame);
       typeof (1) __UNIQUE_ID___y495 = (1);
       ((__UNIQUE_ID___x494) > (__UNIQUE_ID___y495) ? (__UNIQUE_ID___x494) : (__UNIQUE_ID___y495));
   }))) *' (aka 'unsigned long long *') and 'typeof (1000000L) *' (aka 'long *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:28: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:876:19: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:857:4: note: expanded from macro '__safe_cmp'
     857 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:843:29: note: expanded from macro '__typecheck'
     843 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                            ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long *') and 'typeof (1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:45: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:883:19: note: expanded from macro 'max'
     883 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kernel.h:857:43: note: expanded from macro '__safe_cmp'
     857 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                                       ~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/kernel.h:854:19: note: expanded from macro '__no_side_effects'
     854 |                 (__is_constexpr(x) && __is_constexpr(y))
         |                  ~~~~~~~~~~~~~~~^~
   include/linux/kernel.h:851:48: note: expanded from macro '__is_constexpr'
     851 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long *') and 'typeof (1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:45: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:883:19: note: expanded from macro 'max'
     883 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kernel.h:876:33: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/kernel.h:868:9: note: expanded from macro '__careful_cmp'
     868 |                 __cmp(x, y, op), \
         |                 ~~~~~~^~~~~~~~~
   include/linux/kernel.h:859:27: note: expanded from macro '__cmp'
     859 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long *') and 'typeof (1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:45: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:883:19: note: expanded from macro 'max'
     883 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kernel.h:876:33: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/kernel.h:868:9: note: expanded from macro '__careful_cmp'
     868 |                 __cmp(x, y, op), \
         |                 ~~~~~~^~~~~~~~~
   include/linux/kernel.h:859:40: note: expanded from macro '__cmp'
     859 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long *') and 'typeof (1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:45: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:883:19: note: expanded from macro 'max'
     883 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kernel.h:876:33: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/kernel.h:869:14: note: expanded from macro '__careful_cmp'
     869 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:862:10: note: expanded from macro '__cmp_once'
     862 |                 typeof(x) unique_x = (x);               \
         |                        ^
>> drivers/media/platform/qcom/venus/vdec.c:421:17: warning: comparison of distinct pointer types ('typeof (us_per_frame) *' (aka 'unsigned long long *') and 'typeof (1) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
     421 |         us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:920:45: note: expanded from macro 'clamp'
     920 | #define clamp(val, lo, hi) min((typeof(val))max(val, lo), hi)
         |                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:883:19: note: expanded from macro 'max'
     883 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/kernel.h:876:33: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/kernel.h:869:14: note: expanded from macro '__careful_cmp'
     869 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
         |                 ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:862:25: note: expanded from macro '__cmp_once'
     862 |                 typeof(x) unique_x = (x);               \
         |                                       ^
>> drivers/media/platform/qcom/venus/vdec.c:424:8: warning: comparison of distinct pointer types ('typeof (240) *' (aka 'int *') and 'typeof (fps) *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     424 |         fps = min(VENUS_MAX_FPS, fps);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:876:19: note: expanded from macro 'min'
     876 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:867:24: note: expanded from macro '__careful_cmp'
     867 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/kernel.h:857:4: note: expanded from macro '__safe_cmp'
     857 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:843:29: note: expanded from macro '__typecheck'
     843 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                            ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   8 warnings generated.


vim +421 drivers/media/platform/qcom/venus/vdec.c

   398	
   399	static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
   400	{
   401		struct venus_inst *inst = to_inst(file);
   402		struct v4l2_captureparm *cap = &a->parm.capture;
   403		struct v4l2_fract *timeperframe = &cap->timeperframe;
   404		u64 us_per_frame, fps;
   405	
   406		if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
   407		    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
   408			return -EINVAL;
   409	
   410		memset(cap->reserved, 0, sizeof(cap->reserved));
   411		if (!timeperframe->denominator)
   412			timeperframe->denominator = inst->timeperframe.denominator;
   413		if (!timeperframe->numerator)
   414			timeperframe->numerator = inst->timeperframe.numerator;
   415		cap->readbuffers = 0;
   416		cap->extendedmode = 0;
   417		cap->capability = V4L2_CAP_TIMEPERFRAME;
   418		us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
   419		do_div(us_per_frame, timeperframe->denominator);
   420	
 > 421		us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);
   422		fps = (u64)USEC_PER_SEC;
   423		do_div(fps, us_per_frame);
 > 424		fps = min(VENUS_MAX_FPS, fps);
   425	
   426		inst->fps = fps;
   427		inst->timeperframe = *timeperframe;
   428	
   429		return 0;
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
