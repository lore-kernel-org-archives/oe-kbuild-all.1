Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9984A1C13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694677280; x=1726213280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k9tzPjDGucXQrVJqH5L941CR1sIiZChvdfUXhsjfOA0=;
  b=noQ2bWMa/XcKMvd2m+SGZfKma2p5DixjFduLiDfGTuxTBNyiN3Bwdr6h
   U1vI5Sbp+NgGjutcUYf3gDZFS9qJCXs/QlMGSuEH23ChrdHm2/u+CR5Ed
   vd4oH7PLjIX/RrUuNT0xuulbvpLkzZf5Ce1hyypRHLfuUiadNtnWD4ITF
   F1U6yFkiVVMOd+ggELFv9Wu7EZnUhyLaqy8G5wJsKQ5++tQqtC6VWPu7Z
   mCZFc+VatyhoCq4+imu4HY0oZDArwjaUek6br0RkYeLNoO2FE1tzA3n32
   nX1o+x93eozoxfoZM8xNyDRQTp37OEAn8Xzkn28FULKgA9TBUD6we/JwS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377787459"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="377787459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 00:41:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918149185"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="918149185"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 00:41:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qggyR-0001KP-2M;
	Thu, 14 Sep 2023 07:41:15 +0000
Date: Thu, 14 Sep 2023 15:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 07/12] drm/msm/dpu: add support for virtual planes
Message-ID: <202309141500.5UFd8NkL-lkp@intel.com>
References: <20230914050706.1058620-8-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914050706.1058620-8-dmitry.baryshkov@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-atomic-helper-split-not-scaling-part-of-drm_atomic_helper_check_plane_state/20230914-130917
base:   linus/master
patch link:    https://lore.kernel.org/r/20230914050706.1058620-8-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 07/12] drm/msm/dpu: add support for virtual planes
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230914/202309141500.5UFd8NkL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141500.5UFd8NkL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141500.5UFd8NkL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bitops/hweight.h:6,
                    from arch/arm/include/asm/bitops.h:244,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/interconnect.h:10,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h:11,
                    from drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:8:
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c: In function 'dpu_rm_reserve_sspp':
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:10:16: note: in definition of macro '__const_hweight8'
      10 |          ((!!((w) & (1ULL << 0))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:11:16: note: in definition of macro '__const_hweight8'
      11 |           (!!((w) & (1ULL << 1))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:12:16: note: in definition of macro '__const_hweight8'
      12 |           (!!((w) & (1ULL << 2))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:13:16: note: in definition of macro '__const_hweight8'
      13 |           (!!((w) & (1ULL << 3))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:14:16: note: in definition of macro '__const_hweight8'
      14 |           (!!((w) & (1ULL << 4))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:15:16: note: in definition of macro '__const_hweight8'
      15 |           (!!((w) & (1ULL << 5))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:16:16: note: in definition of macro '__const_hweight8'
      16 |           (!!((w) & (1ULL << 6))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:17:16: note: in definition of macro '__const_hweight8'
      17 |           (!!((w) & (1ULL << 7)))))
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:10:16: note: in definition of macro '__const_hweight8'
      10 |          ((!!((w) & (1ULL << 0))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:11:16: note: in definition of macro '__const_hweight8'
      11 |           (!!((w) & (1ULL << 1))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:12:16: note: in definition of macro '__const_hweight8'
      12 |           (!!((w) & (1ULL << 2))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:13:16: note: in definition of macro '__const_hweight8'
      13 |           (!!((w) & (1ULL << 3))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:14:16: note: in definition of macro '__const_hweight8'
      14 |           (!!((w) & (1ULL << 4))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:15:16: note: in definition of macro '__const_hweight8'
      15 |           (!!((w) & (1ULL << 5))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:16:16: note: in definition of macro '__const_hweight8'
      16 |           (!!((w) & (1ULL << 6))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:17:16: note: in definition of macro '__const_hweight8'
      17 |           (!!((w) & (1ULL << 7)))))
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:31: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                               ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:10:16: note: in definition of macro '__const_hweight8'
      10 |          ((!!((w) & (1ULL << 0))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:11:16: note: in definition of macro '__const_hweight8'
      11 |           (!!((w) & (1ULL << 1))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:12:16: note: in definition of macro '__const_hweight8'
      12 |           (!!((w) & (1ULL << 2))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
>> include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:13:16: note: in definition of macro '__const_hweight8'
      13 |           (!!((w) & (1ULL << 3))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:14:16: note: in definition of macro '__const_hweight8'
      14 |           (!!((w) & (1ULL << 4))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:15:16: note: in definition of macro '__const_hweight8'
      15 |           (!!((w) & (1ULL << 5))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:16:16: note: in definition of macro '__const_hweight8'
      16 |           (!!((w) & (1ULL << 6))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:17:16: note: in definition of macro '__const_hweight8'
      17 |           (!!((w) & (1ULL << 7)))))
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:29:49: note: in expansion of macro '__const_hweight64'
      29 | #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))
         |                                                 ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:646:26: note: in expansion of macro 'hweight64'
     646 |                 weight = hweight64(hw_sspp->cap->features & ~mask);
         |                          ^~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:76: warning: right shift count >= width of type [-Wshift-count-overflow]
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
         |                                                                            ^~
   include/asm-generic/bitops/const_hweight.h:10:16: note: in definition of macro '__const_hweight8'
      10 |          ((!!((w) & (1ULL << 0))) +     \
         |                ^
   include/asm-generic/bitops/const_hweight.h:20:54: note: in expansion of macro '__const_hweight16'
      20 | #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:21:54: note: in expansion of macro '__const_hweight32'
      21 | #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))


vim +21 include/asm-generic/bitops/const_hweight.h

1527bc8b928dd1 Peter Zijlstra 2010-02-01   4  
1527bc8b928dd1 Peter Zijlstra 2010-02-01   5  /*
1527bc8b928dd1 Peter Zijlstra 2010-02-01   6   * Compile time versions of __arch_hweightN()
1527bc8b928dd1 Peter Zijlstra 2010-02-01   7   */
1527bc8b928dd1 Peter Zijlstra 2010-02-01   8  #define __const_hweight8(w)		\
c32fa99f0b4252 Paul Walmsley  2013-12-18   9  	((unsigned int)			\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  10  	 ((!!((w) & (1ULL << 0))) +	\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  11  	  (!!((w) & (1ULL << 1))) +	\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  12  	  (!!((w) & (1ULL << 2))) +	\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  13  	  (!!((w) & (1ULL << 3))) +	\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  14  	  (!!((w) & (1ULL << 4))) +	\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  15  	  (!!((w) & (1ULL << 5))) +	\
1527bc8b928dd1 Peter Zijlstra 2010-02-01  16  	  (!!((w) & (1ULL << 6))) +	\
c32fa99f0b4252 Paul Walmsley  2013-12-18  17  	  (!!((w) & (1ULL << 7)))))
1527bc8b928dd1 Peter Zijlstra 2010-02-01  18  
1527bc8b928dd1 Peter Zijlstra 2010-02-01  19  #define __const_hweight16(w) (__const_hweight8(w)  + __const_hweight8((w)  >> 8 ))
1527bc8b928dd1 Peter Zijlstra 2010-02-01  20  #define __const_hweight32(w) (__const_hweight16(w) + __const_hweight16((w) >> 16))
1527bc8b928dd1 Peter Zijlstra 2010-02-01 @21  #define __const_hweight64(w) (__const_hweight32(w) + __const_hweight32((w) >> 32))
1527bc8b928dd1 Peter Zijlstra 2010-02-01  22  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
