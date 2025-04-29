Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87E9227EAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913289; cv=none; b=eCEFVyMftPB+ZdnoqTc65eH5967yxm9dxL07Ndro5RaFMhuG8x6jcca47+w0E7BIwNZWFfZq/3dp8psSSbF/q6MtwYc+M900LOIJINhj649NQFeGoyibwsXpbCwCtdFXIlKuZk3SAKhmcW028j8mMZH1bM1u0uzEt62XVMVo6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913289; c=relaxed/simple;
	bh=MSJM+/9QPssjk8YIPMyhm9EH9eX77pHstrsk/hfrW3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sp7UWUyjT8byHvvlSuS5W+VdD621HYYHr6cKpjASnU0KKL3h+k0Mwv/vxnIcoA0cR1Q6I8cV50O9SpUZh/w+WJH+e80Q/rFAU/xW8jO9txsexvGwdfOaoUYVlGlTJXB5/ivQBu29buqtH1yF7fUxk8G5p1B1s0UdpO77vTjsPW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fC/dhCxn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fC/dhCxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913288; x=1777449288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSJM+/9QPssjk8YIPMyhm9EH9eX77pHstrsk/hfrW3o=;
  b=fC/dhCxnmGzIY6+O61vhmXb5EovxScnPPZpBQw5zgwFHoAL501X2io3h
   z9M0D9mmDnCdpAAnTDdMFBiJ3S8QqAuKV9Gs5yaJ1L36O4lkgkEk6GOe0
   KKew5bRKFaCkVNs76/f6NIlnPbpWcQTbhLuAksN38rbiCcN0jZLEl8/oQ
   cNOsksy0cFPZeSM/Zgd7Lus8GmVmwQhPw7c8hLsJx0z3XK0wBY3q7ZlOT
   0vfzW1P3DuaTYVe7OeIfkIJYqFDGoi2d9185Ky5I7IWld4IH9+4+8eu15
   E1AIVgNLzefdwXH+mIGBheEV44r5z2fGApEC6qCybHlBCqM9jDtGcZmWi
   w==;
X-CSE-ConnectionGUID: tSs3Wwh+TTCAEHUZyXrcDw==
X-CSE-MsgGUID: U4j5B53DT5W+THNmweN/tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58896156"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58896156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:54:45 -0700
X-CSE-ConnectionGUID: 4/0f6aFKQJe717xQW6go1g==
X-CSE-MsgGUID: 6kdEOyx9SY2y0YBzyAKL0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="170985930"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2025 00:54:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9fnc-0000Z3-2U;
	Tue, 29 Apr 2025 07:54:40 +0000
Date: Tue, 29 Apr 2025 15:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/string.h:249:16: warning: '__builtin_strncpy' accessing 80
 bytes at offsets 100 and 36 may overlap up to 0 bytes at offset
 [9223372036854775807, -9223372036854775808]
Message-ID: <202504291551.FOwjwu8e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7bd21c560a6f5df598200cc367cad1a683cef8ef
commit: a24ec7d8d3462ba48b4bd932960c397d92de8782 [1597/1597] ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is not set
config: arm64-randconfig-002-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291551.FOwjwu8e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291551.FOwjwu8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291551.FOwjwu8e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:41,
                    from include/linux/rcupdate.h:43,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arm64/include/asm/compat.h:25,
                    from arch/arm64/include/asm/stat.h:24,
                    from include/linux/stat.h:6,
                    from include/linux/module.h:11,
                    from sound/soc/soc-generic-dmaengine-pcm.c:6:
   In function 'strncpy',
       inlined from 'dmaengine_pcm_new' at sound/soc/soc-generic-dmaengine-pcm.c:318:4:
>> include/linux/string.h:249:16: warning: '__builtin_strncpy' accessing 80 bytes at offsets 100 and 36 may overlap up to 0 bytes at offset [9223372036854775807, -9223372036854775808] [-Wrestrict]
     249 |         return __builtin_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__builtin_strncpy +249 include/linux/string.h

6974f0c4555e28 Daniel Micay 2017-07-12  240  
6974f0c4555e28 Daniel Micay 2017-07-12  241  #if !defined(__NO_FORTIFY) && defined(__OPTIMIZE__) && defined(CONFIG_FORTIFY_SOURCE)
6974f0c4555e28 Daniel Micay 2017-07-12  242  __FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t size)
6974f0c4555e28 Daniel Micay 2017-07-12  243  {
6974f0c4555e28 Daniel Micay 2017-07-12  244  	size_t p_size = __builtin_object_size(p, 0);
6974f0c4555e28 Daniel Micay 2017-07-12  245  	if (__builtin_constant_p(size) && p_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  246  		__write_overflow();
6974f0c4555e28 Daniel Micay 2017-07-12  247  	if (p_size < size)
6974f0c4555e28 Daniel Micay 2017-07-12  248  		fortify_panic(__func__);
6974f0c4555e28 Daniel Micay 2017-07-12 @249  	return __builtin_strncpy(p, q, size);
6974f0c4555e28 Daniel Micay 2017-07-12  250  }
6974f0c4555e28 Daniel Micay 2017-07-12  251  

:::::: The code at line 249 was first introduced by commit
:::::: 6974f0c4555e285ab217cee58b6e874f776ff409 include/linux/string.h: add the option of fortified string.h functions

:::::: TO: Daniel Micay <danielmicay@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
