Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847580;
	b=KSwlZV6a1NlNEqLltgZH1+4K5IVLa3qLCMT6jYv6PMlPloeSbytpp+tJzTCq3usYj7gT
	 glGG2lF5bHz76zSehc0xd0vkm5eiCjcZH1EM9TnUEUXnKR3IG0/TnBdh44P3TTIbU6L9w
	 nqVJJTTZR/hYf1zx4fKmAvx9GA0uhUWFn+5TvxFe6dPTHHGtFwLvpZBo5MRGx2z+VaV3h
	 raY83pmco/uTG4nXugKzHscfCF8//NY8suY3qn1VZ/1Y//Mu1uH18iJhi2GTslG8K8uU+
	 H9sho2UsKRttZqz/9hfPJaBuutjWFTbiqhposQB9nOamHnS8ZZBM8NTcKfMQGWRnaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847580;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XP2D/7VG3KnhtFZ0T4jDeUxlgz0WMPGxWcmiclIBmD0=;
	b=IRRaiTJNBjvQsByUcIUf7UU3zzZns/aCB1j9zJ5jDAwIovUBcaABDhKutpcwSURssC3W
	 fCZ7KmBG1Y+7PAf1Kt7P1VGFOaNr83w7XZ5e5LQGUQQ9dMKMPEd/y8oG/Z9zNCOd5W3My
	 MHtW1YwTc32JEHQWmy+feZk5pk7ic0w1jSuXPl76y0b5qBSss5r4ukUkS3pA48GaeI8oK
	 O/Z0KLG+5hWPdCdyeP1IX2rgEAVi/QnOEUWzVkw7RUeHIYgeyvoJsqsw2/bAidgZ5DHQW
	 OX8xfmwi+wBjou4A6NsFE9viLRktP5WUydgx5gL2J0zEDqpHyai7AvfgbMzHOo8jPLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P5TexkQ0;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A4D606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 13:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A4D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P5TexkQ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792847579; x=1824383579;
  h=date:from:to:cc:subject:message-id;
  bh=qarH6U9vrnDN0lAY8bz9ubKywn3x/IIfp39YKSDGqUE=;
  b=P5TexkQ02LmPFF486o8PqucdaZnKDcrCVn9a//x/eEEMiaXK6cxahN/H
   BbLJSFliAXpkZTS/GmIK530GV5QVBLYLikzB87XE4cAO/7ZTnIzaP8V5O
   OC4dnV635NQtOBH/3neHKcaW+EFu/pkz/mknsi6GP6505jfhmj51t7V+9
   8tTJQo4m/AzsCVB/8QhNh6n49ElKj4UDbXoWBTfPkrJVQVkFtwcLcDQOh
   bJ3Bzz+HAYKCwsUnQB16wM9+TJlFLXNhBAkaBzVujGheM+v0ZH5eKtNla
   v3gSceSnDi8oLtKchjeG74Bgx8Ib0zf9h5ONxmUWLFbXtfstsn7Ckgrzo
   A==;
X-CSE-ConnectionGUID: fm2mApd7T76wwanSqt4Ezg==
X-CSE-MsgGUID: jT3Az1QtS8ugi2S7jqql9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1457076"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1457076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 06:12:58 -0700
X-CSE-ConnectionGUID: zGEuilaKSFulu79+e0nXcg==
X-CSE-MsgGUID: OjppqQAXRjqJ+yjf4fJV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4210652"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2026 06:12:56 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKbYM-000000003Nv-08s1;
	Sat, 24 Oct 2026 13:12:54 +0000
Date: Sat, 24 Oct 2026 15:12:03 +0200
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 94/110]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_536' declared with attribute error: min(count,
 (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct
 {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)),
 typeof(&(p...
Message-ID: <202610241549.J9R32Wf7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   c9dbe2a47f635465c9985b7af74d2ae310e98125
commit: 3992072f44910c0eb3fdb3cb09540b60f04cd04b [94/110] iio: adc: ti-ads1262: support excitation currents
config: mips-randconfig-r2200-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241549.J9R32Wf7-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241549.J9R32Wf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241549.J9R32Wf7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iio/adc/ti-ads1262.c: In function 'ads1262_parse_channel_node.constprop':
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_536' declared with attribute error: min(count, (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)), typeof(&(pins)[0])))), "must be array");})))) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1262.c:1384:18: note: in expansion of macro 'min'
               pins, min(count, ARRAY_SIZE(pins)));
                     ^~~
--
   In file included from <command-line>:
   ti-ads1262.c: In function 'ads1262_parse_channel_node.constprop':
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_536' declared with attribute error: min(count, (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)), typeof(&(pins)[0])))), "must be array");})))) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   ti-ads1262.c:1384:18: note: in expansion of macro 'min'
               pins, min(count, ARRAY_SIZE(pins)));
                     ^~~


vim +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
