Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB101CC16C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724338578; cv=none; b=SFIwN+of2pCYGLXxLM2M7DzqOGwuRT4kaiW2A2uG+LCIeZnKLr4FBxUagOARYb36uAexo2P/0wX4P/QGLBy0JjwXckntPt4vEVdjiaFp+wd31rPgP5AgDbHNFNjQzTY1TwFL7AVWFZOxnQrJv9+oO8E4IKfoTngRK+PsbJTsAIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724338578; c=relaxed/simple;
	bh=aQAsWU9NxMQHRs2YdiTiuQj5Kzr1wzJycOtT8kSih84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/zbLT/op/X0/Tz9/tTq+aaRSaFp+GEeE2XX8Qmz40a7t1xX8j+zOPvIoAvFiYuEDvVHGbYO97os+s0nPjZXMkctofxJIb7gJr/MdIWHcAtPmGQH+qxF20ws7hdHLJo7PF9tL4uqb4pF/hd/WnpHq8Xrk8+O2eVII6btF4k4mx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6ia/pqO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6ia/pqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724338577; x=1755874577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aQAsWU9NxMQHRs2YdiTiuQj5Kzr1wzJycOtT8kSih84=;
  b=L6ia/pqOZfsCG79PR5T+2tIrKBPw5T33mTw5AAXyFCBx4dzUsUm5Z7bp
   zpZHPa6dDfK9zIMt1lmc4HqBQvrd3H0ybfZ3WfC2yiL3QBaNsaHmY6tFt
   ePGbdkQ8M2Bhxu/0Xn8jKbQBz967ou0UDotAnZ5c7Dg6FrZA8LWOGim3R
   Zz5QAUX+zoR/XmdLhcC4Vhz2mVkS/m5VD8+y8bGk8SYDYQ9MPX1paqI+J
   nAoh8idivzX9bdAXkg+SbFyuSFbX5Rf1AYsJVnFGdytMQWCficwYmL+mh
   kEID/X5DEfKRi/r8FmZKjk3TPpgfYCYYvQw+c+EYI4IizfJ9gRhoRSdvE
   w==;
X-CSE-ConnectionGUID: rVxkggAlTEGu+x6xwmO/Kg==
X-CSE-MsgGUID: w+tpVoIRSeiL2/7eju+5fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22913561"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22913561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:56:16 -0700
X-CSE-ConnectionGUID: EtCmNJcOQOW3X9AMbWZ34w==
X-CSE-MsgGUID: OgIXeNpATfqEZw1zPgEwOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="65668774"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2024 07:56:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh9ES-000Csq-10;
	Thu, 22 Aug 2024 14:56:12 +0000
Date: Thu, 22 Aug 2024 22:55:47 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
Message-ID: <202408222209.vpdzQng3-lkp@intel.com>
References: <20240819205714.316380-21-harry.wentland@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819205714.316380-21-harry.wentland@amd.com>

Hi Harry,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-21-harry.wentland%40amd.com
patch subject: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
config: um-randconfig-r123-20240821 (https://download.01.org/0day-ci/archive/20240822/202408222209.vpdzQng3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222209.vpdzQng3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222209.vpdzQng3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_fixp_test.c:11:59: error: overflow in expression; result is 9'223'372'036'854'775'807 with type 'long long' [-Werror,-Winteger-overflow]
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |                                                      ~~~~~~~~~~~~^~~
   include/kunit/test.h:917:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                         ^~~~~
   include/kunit/test.h:922:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                              ^~~~~
   include/kunit/test.h:758:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                               ^~~~~
   include/kunit/test.h:725:33: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   1 error generated.


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
