Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686191;
	b=lNmt6gCdqLM/zt2Qn9plzltISsQqMUF//VcOOJYSOHICkgwr7ywmvyvH4qQFwspzKGgC
	 d+62Lx1m1gFc0mxM7yxa2IhnDzM4u3h+PPbDl1mZNbY8KEXdiXLx6gQZB9ddu7BOhgSd1
	 LZy/ivDFr+9fujNG43bI775i66RRx8+Rdi159iBcEWcsfJyR+d4VlzG/8IecF+j/BLXWX
	 u9C4r4jBF1KpNe/cMOkx+lhDido2qjbBLMliYYm4p3SotmdNBnSc3b0ke7t88YDDIMj+Y
	 Xxgq1RRTeoW340SPRtQiEomUO5YEyABJHpi8jLccLW79jHW4BfKMFXT50yZHH1gZ8Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686191;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fYWZaM/UrC/0hrI2HfUc58HQTS0zLSiPLM17NYmANbg=;
	b=Jqna5wOGqsgWNl0k4bZXZ9t41EcO4Z/ttdcNqyKgdRRRpgtDqiFw8MmWRLl7FXoVBieY
	 VaYuqlyWcNoOjiFosgLNRD3q4fAb38eotRK6tfWmQIWQQnqmLjTsEHcI7vthX9DSjI0Gb
	 cjllnm75+7K4oqjMuyZfmN0hFzNe7jBukhhgV0DQk/2daQgTw2TiQ8Co+YT0utEomyjS+
	 Eu+F0ue7oeMvV2ogKLqc2yftkekPqM0KHigVAEK6R+BLd6Fb2ooqXW+RpMZOeyD3Yl5CS
	 C7S5ZDGMxgTWlXOmuuM9dVewr4RnankKYiKnK6XcHr5HrZoq3EHMevqPUjdeP/5G2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eLXpxdQ8;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F244606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 16:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F244606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eLXpxdQ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792686190; x=1824222190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3sLJ4F1+L+z4XbsPEwM8K/xe4zUnnKXgoLNhnWi8Ke8=;
  b=eLXpxdQ8bQ0RGLmMxsdprRNf3tqnhL+t6vUNzZ+a7gQLv4w/6drKjZlM
   bjpsXp119IlqdgMKNQoYN+nXA+XzNpJO6uqJvGRGBbK8kiEJkSIPelR9f
   xBc+CDosYDNjAVHEPRx6FSr2eoKBcpf4aBZWmFQFCzIzTIT4ssYLbNOfl
   wmChmkgHO2H07xTbK9P9l+RXxtrr2iOhTt+T7pCJC0FbH80kIj+gWzkNb
   75SqqcUB9AK4iOgn37dd3Sz9LPVPL2hThS1P347Rt42djG3JNgcOLqUKv
   nR1nwijD/ihWO0b7fG7j0CSUi7OiP7S0GZNvnIYIZ03TzZm9nX007WFix
   A==;
X-CSE-ConnectionGUID: YKZXdhAPSz2DXensi0eMcw==
X-CSE-MsgGUID: ne9Zl4V5Q72khBobPKFscA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1448619"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1448619"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:22:31 -0700
X-CSE-ConnectionGUID: chGmvJk+TjaODZTVU5GRew==
X-CSE-MsgGUID: EjmstTv3RKmLGzDIz3vgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3737263"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2026 09:22:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJvYh-00000000RKw-2cdU;
	Thu, 22 Oct 2026 16:22:27 +0000
Date: Fri, 23 Oct 2026 00:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] gcc-plugins: Add a plugin to ease debugging of
 memory ordering bugs
Message-ID: <202610230010.G5QozV51-lkp@intel.com>
References: <20261018152608.1323494-1-gautam@linux.ibm.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018152608.1323494-1-gautam@linux.ibm.com>

Hi Gautam,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on v7.3]
[cannot apply to linus/master next-20261021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gautam-Menghani/gcc-plugins-Add-a-plugin-to-ease-debugging-of-memory-ordering-bugs/20261018-205606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20261018152608.1323494-1-gautam%40linux.ibm.com
patch subject: [RFC PATCH] gcc-plugins: Add a plugin to ease debugging of memory ordering bugs
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20261023/202610230010.G5QozV51-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230010.G5QozV51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230010.G5QozV51-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   net/core/skbuff.c: In function 'skb_extensions_init':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_1377' declared with attribute error: BUILD_BUG_ON failed: skb_ext_total_length() > 255
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   net/core/skbuff.c:5188:9: note: in expansion of macro 'BUILD_BUG_ON'
    5188 |         BUILD_BUG_ON(skb_ext_total_length() > 255);
         |         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   lib/tests/ffs_kunit.c: In function 'build_test___fls.isra':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_246' declared with attribute error: BUILD_BUG_ON failed: init___fls < 32
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/tests/ffs_kunit.c:510:9: note: in expansion of macro 'BUILD_BUG_ON'
     510 |         BUILD_BUG_ON(init_##func < 32);                                 \
         |         ^~~~~~~~~~~~
   lib/tests/ffs_kunit.c:521:1: note: in expansion of macro 'CREATE_WRAPPER'
     521 | CREATE_WRAPPER(__fls)
         | ^~~~~~~~~~~~~~
   lib/tests/ffs_kunit.c: In function 'build_test_fls.isra':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_244' declared with attribute error: BUILD_BUG_ON failed: init_fls < 32
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   lib/tests/ffs_kunit.c:510:9: note: in expansion of macro 'BUILD_BUG_ON'
     510 |         BUILD_BUG_ON(init_##func < 32);                                 \
         |         ^~~~~~~~~~~~
   lib/tests/ffs_kunit.c:519:1: note: in expansion of macro 'CREATE_WRAPPER'
     519 | CREATE_WRAPPER(fls)
         | ^~~~~~~~~~~~~~
--
   In file included from <command-line>:
   drivers/vfio/pci/virtio/legacy_io.c: In function 'virtiovf_init_legacy_io':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_1024' declared with attribute error: BUILD_BUG_ON failed: !is_power_of_2(virtvdev->bar0_virtual_buf_size)
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/vfio/pci/virtio/legacy_io.c:377:9: note: in expansion of macro 'BUILD_BUG_ON'
     377 |         BUILD_BUG_ON(!is_power_of_2(virtvdev->bar0_virtual_buf_size));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_1377 +702 include/linux/compiler_types.h

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
