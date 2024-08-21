Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300933D8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 04:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724212870; cv=none; b=Vcm1nCbGKyML7ywQjVA/IIVrw7dBIPF0ch3fj7arDcAo8u23Y7x9qJCg4iNrwGzrjvlrd8C2kHDRsZH5B29bjDStNzIr5sKm1qBs1f+1KsCASEwIec/JHMs+op6kjDXiNNZvGt3xa0LTlfbF4d6/k6KJ141jkhkYIt6agQ9btkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724212870; c=relaxed/simple;
	bh=AthkwurUrh7MXaMGqfRpIHLmubGQ6eqXlluCjr+zuMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa8kAP2T0H/cQckhqnEgZRHWvq4L21R8F4l/GUsR4aXN+3dAzDfQVb8Rgh7IZAkPSLqxFPmL0I7c16IqdWF6U22INtrMh0t1uwUhYVSNLeAqAwtasrrAmm0iIdf8GAQY2/e96C+pUFHuo3jniKpcXAQ6I0Atf5d2h+RdjFFqmdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBFbVd6Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBFbVd6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724212868; x=1755748868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AthkwurUrh7MXaMGqfRpIHLmubGQ6eqXlluCjr+zuMY=;
  b=ZBFbVd6ZwdCdoP0gyuizrUM+nPXcQJWG/li416e1xkpcMjhA4aGWLDPD
   EBdaVRH43kxwM1XsfVdVm3Z6WZT7Fu3ErhlkX9qbm29NGq0ySoUJa+CdB
   fPMAhQHdWuBXBXeA44R8Iwu0Ye2gVSi5N6qDeSlknnN0BbxFJuvMKIFXW
   b/+SNXb2LiTpqNiQSfAGdjjh+/R9hznlOaUtNkDe6F1+HQsVvmeNYQq/z
   V/5KlmEtMBXUgyfbxtOcmofFkj+TmsrDMoUKO+0A+YjmdO0qtGRgAZodH
   A9PhvZKOa44G//gcvRhxeB/Ud9zAMRaEbm3hnum4jsmYm8tLMhHfeIDUR
   A==;
X-CSE-ConnectionGUID: 5UaUhhjAR+yRjnI6rWl+wg==
X-CSE-MsgGUID: tOEZQMy5TgeYf4PkZgad5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22359403"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="22359403"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 21:01:07 -0700
X-CSE-ConnectionGUID: J6Jlxwx3R6+NfYSXw9xtBg==
X-CSE-MsgGUID: bIDTgDRoRgWsHcc/vZKyDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="91700465"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Aug 2024 21:01:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgcWt-000As6-2x;
	Wed, 21 Aug 2024 04:01:03 +0000
Date: Wed, 21 Aug 2024 12:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, wayland-devel@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
Message-ID: <202408211157.n8ubZpFl-lkp@intel.com>
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
[also build test ERROR on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-21-harry.wentland%40amd.com
patch subject: [PATCH v5 20/44] drm/tests: Add a few tests around drm_fixed.h
config: parisc-randconfig-001-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211157.n8ubZpFl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211157.n8ubZpFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211157.n8ubZpFl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tests/drm_fixp_test.c:6:
   drivers/gpu/drm/tests/drm_fixp_test.c: In function 'drm_test_sm2fixp':
>> drivers/gpu/drm/tests/drm_fixp_test.c:11:66: error: integer overflow in expression of type 'long long int' results in '9223372036854775807' [-Werror=overflow]
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |                                                                  ^
   include/kunit/test.h:725:40: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   include/kunit/test.h:920:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
     920 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:917:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tests/drm_fixp_test.c:11:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      11 |         KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1LL << 63) - 1));
         |         ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
