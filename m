Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1F71DFFA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYeHEKM/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699538580; x=1731074580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2xL+cTPdB2MNToSoxtfsC7Fr129XZf+HtlR2cJxsZc4=;
  b=DYeHEKM/iHl7U1nJ/HWtkAy3xEmbkDjG/zwbIYlWdXMo81up7zuzj1xH
   uW000NvURJnmvoNQOue/YjWzNtzBr0MsG8zuPt3kh0lHTt5mz/708mrma
   a+z8T+Lw/L6i1eIggrrBfJ+Zct3PhhOAfZih0B7q7kMQBcpOEyDtbmbiC
   k1Dv5tsiivjJI5bj1JWs9FV8AbEnEKUyp/eg1HrBlEWi4ltRf8SxNqmIV
   51KJ/aGvDqn1bmRxxuPRE9AIR2jKLTq+3W27QapjTwVTcrIa1sJnGorZy
   YVq1zsvMNaJaaMb849TYg6dRJqVInK5vM6W0QX2zlneiQbxxQXGZforcl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="380379184"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="380379184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4727936"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2023 06:02:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r15cH-0008ls-0J;
	Thu, 09 Nov 2023 14:02:43 +0000
Date: Thu, 9 Nov 2023 22:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 22/23] drm/tests: Add a few tests around
 drm_fixed.h
Message-ID: <202311092116.vQlZq8Tt-lkp@intel.com>
References: <20231108163647.106853-23-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108163647.106853-23-harry.wentland@amd.com>

Hi Harry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip]
[cannot apply to drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.6 next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Don-t-treat-0-as-1-in-drm_fixp2int_ceil/20231109-024233
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231108163647.106853-23-harry.wentland%40amd.com
patch subject: [RFC PATCH v3 22/23] drm/tests: Add a few tests around drm_fixed.h
config: loongarch-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311092116.vQlZq8Tt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092116.vQlZq8Tt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092116.vQlZq8Tt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tests/drm_fixp_test.c:6:
   drivers/gpu/drm/tests/drm_fixp_test.c: In function 'drm_test_sm2fixp':
>> drivers/gpu/drm/tests/drm_fixp_test.c:11:66: warning: integer overflow in expression of type 'long long int' results in '9223372036854775807' [-Woverflow]
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |                                                                  ^
   include/kunit/test.h:687:40: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     687 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   include/kunit/test.h:878:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     878 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:875:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     875 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_fixp_test.c:11:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |         ^~~~~~~~~~~~~~~


vim +11 drivers/gpu/drm/tests/drm_fixp_test.c

     8	
     9	static void drm_test_sm2fixp(struct kunit *test)
    10	{
  > 11		KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
    12	
    13		/* 1 */
    14		KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
    15	
    16		/* -1 */
    17		KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
    18	
    19		/* 0.5 */
    20		KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
    21	
    22		/* -0.5 */
    23		KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
