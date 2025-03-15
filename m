Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE7115D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742037029; cv=none; b=I3nNoDzKlfxQNSzbWLPDUCLe10zM90wpv4HeYcZsg1ES6sH7c96HL7fhWdszPFU+LJf+cOWB86/r6oxZ5dU62b/4x6ncuRr6WU5r6dyAWLPiqjwnPlNCDt58/szNXcW2x0juKuFO76kZQnX44oz7oPPqqWbaMabc1IJtaOXJsXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742037029; c=relaxed/simple;
	bh=4SclI1KF6mt0ZP6CXPCWClyVqqjDGey4RKNwjoSqyqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lF/TmlB0oqV6P/58kw7jq9IUaYb/iH6MQaFbWZM/enzXqyjPZ6ZpPESN9zJzvQWV2f3Qzo0MRw5FCDaV38O+qQ83W55q8CSqdIQlnVgIXdo6op+SqHwxZEsGBQ2s0EvVCXwsWxd0HgvFff7V8K9TAVMYN+cbQ0nDUNcJMfquBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDAxvsew; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDAxvsew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742037029; x=1773573029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4SclI1KF6mt0ZP6CXPCWClyVqqjDGey4RKNwjoSqyqA=;
  b=oDAxvsew3lB9aKPDOfZlA3RI1Jb+2Dh91fWMfhZ/ncslNCdDyyi1Y9LS
   OdduGRENI2K5i4cEhOCbXZR5p78ldgBEu5JKgxlso/EZ6JPzsyme7KE4W
   qxLGIVzTbJw01UFE0BMQnidDJXr9cIhuCBqLibXe+IO1BqJtXy/j6+6Vj
   iVZY5NO+Anix1xKTSaZBB/CNdklUNQkdXBTTpTnTaTfDGNBvhHmvdHEKz
   k3Q4JVLXKaiZzFgocKcjafoH2vLXBzO5yVJBzsmKYtHBMe/JIvM9+Rney
   JUA6MP0YeafvLtXyPl/uJ4LTBwVn6kOSH1SuGc++wm1ulGj3I40QdN0v4
   A==;
X-CSE-ConnectionGUID: 2v8krrLCQQuCmZtvhEtf4g==
X-CSE-MsgGUID: qjto+kGVQiS4OAXgx3YHCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="46833624"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="46833624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 04:10:28 -0700
X-CSE-ConnectionGUID: IcOfPXDxQzSp6X5U2Vk1Yw==
X-CSE-MsgGUID: AiRpUC0lR7qJvIPhra6zZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="121232868"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Mar 2025 04:10:27 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPPI-000BIV-0d;
	Sat, 15 Mar 2025 11:10:21 +0000
Date: Sat, 15 Mar 2025 19:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 8/15] include/asm-generic/io.h:977:16:
 error: passing argument 1 of 'readsb' discards 'const' qualifier from
 pointer target type
Message-ID: <202503151909.ixQljbJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   02710864b974d663d56bc99493fb1976caab42a2
commit: 58774c1d8c8834d8be1dbea1e8ca339792d73935 [8/15] mips: drop GENERIC_IOMAP wrapper
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250315/202503151909.ixQljbJu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151909.ixQljbJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151909.ixQljbJu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/io.h:547,
                    from arch/mips/include/asm/page.h:181,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:10:
   include/asm-generic/io.h: In function 'ioread8_rep':
>> include/asm-generic/io.h:977:16: error: passing argument 1 of 'readsb' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     977 |         readsb(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:429:1: note: in expansion of macro 'BUILDSTRING'
     429 | BUILDSTRING(b, u8)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread16_rep':
>> include/asm-generic/io.h:986:16: error: passing argument 1 of 'readsw' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     986 |         readsw(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:430:1: note: in expansion of macro 'BUILDSTRING'
     430 | BUILDSTRING(w, u16)
         | ^~~~~~~~~~~
   include/asm-generic/io.h: In function 'ioread32_rep':
>> include/asm-generic/io.h:995:16: error: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     995 |         readsl(addr, buffer, count);
         |                ^~~~
   arch/mips/include/asm/io.h:389:55: note: expected 'volatile void *' but argument is of type 'const volatile void *'
     389 | static inline void reads##bwlq(volatile void __iomem *mem, void *addr,  \
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/mips/include/asm/io.h:426:1: note: in expansion of macro '__BUILD_MEMORY_STRING'
     426 | __BUILD_MEMORY_STRING(bwlq, type)                                       \
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/io.h:431:1: note: in expansion of macro 'BUILDSTRING'
     431 | BUILDSTRING(l, u32)
         | ^~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +977 include/asm-generic/io.h

9e44fb1816dba8f Horia Geantă   2016-05-19  971  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  972  #ifndef ioread8_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  973  #define ioread8_rep ioread8_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  974  static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  975  			       unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  976  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @977  	readsb(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  978  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  979  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  980  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  981  #ifndef ioread16_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  982  #define ioread16_rep ioread16_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  983  static inline void ioread16_rep(const volatile void __iomem *addr,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  984  				void *buffer, unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  985  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @986  	readsw(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  987  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  988  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  989  
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  990  #ifndef ioread32_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  991  #define ioread32_rep ioread32_rep
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  992  static inline void ioread32_rep(const volatile void __iomem *addr,
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  993  				void *buffer, unsigned int count)
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  994  {
9ab3a7a0d2b4177 Thierry Reding 2014-07-04 @995  	readsl(addr, buffer, count);
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  996  }
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  997  #endif
9ab3a7a0d2b4177 Thierry Reding 2014-07-04  998  

:::::: The code at line 977 was first introduced by commit
:::::: 9ab3a7a0d2b417773e8e8a880fc3a69f7fc1f57a asm-generic/io.h: Implement generic {read,write}s*()

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
