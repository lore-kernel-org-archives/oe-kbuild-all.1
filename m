Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFA22B8AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747853434; cv=none; b=gGnVrmu+ljkXbGPQZsG/66tChou2e+1/Dds6zuOtraBm90dXFbihzh9rJ1gpjIArZbBQl7fnSMXV2Y93XaI+e2raH71EoN5hwxdLDEFj+6Gjp+2vZrixDn9Z4NwKaumQv8nPUHQ7pott68LTIL+q0GInDFKcbpPtDnM6qu0J4Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747853434; c=relaxed/simple;
	bh=pjmBGUtfHHSMAoQL6EGlGuprhH1sgZQccadSWnlod70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qklGvWGRw9NQDTfBVierBwRRSMronAfVPkRmcG3+jS32ksY/tc+1d50CL+SaP2jb3Mu0pdVUYSPJOliSVlGsRaLhKlczREf5xtHdVrua2oSxvpffUYOra0RC9W4souiHFHo1qhzeEQSO9B0bmaYKTJh0apQdk1E0vRzQ06XN6O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jAEdSg98; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jAEdSg98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747853432; x=1779389432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjmBGUtfHHSMAoQL6EGlGuprhH1sgZQccadSWnlod70=;
  b=jAEdSg98n3t4QmaSSxAvYVpxsHkR58sNpNqSo8C02cGSPswjkkN2/f9D
   OVqZuD+TinPjMNEQn1YapKSlVzOxc42t9g2rj+mzuGG4rWhI1bQau/DNP
   o2VWn86Z7E+mB97tTtcyjfR82w7GiL4L34DXw02HSyBU2wBfMNSFqTSo9
   t7nVB7WldKTsIKNRquOlSCNVkvzPZCPRQsJ56UtnMoEGQgREnnhjKuYNA
   rTZ6qdyAUeUbElujWi5sZCO4yyFjMWZs6JUn+BEmBGL7IgFY17v2Mw2eJ
   PKSStnn615wdlcdHCMza5tbiVPpNK0ElkuXOXjt6tInxSU56R46HhGQ2/
   A==;
X-CSE-ConnectionGUID: ME38EYoZSu6OdAaN1s3QZg==
X-CSE-MsgGUID: 4JRBQkXvRza9LieTeaWjcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49950301"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49950301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 11:50:31 -0700
X-CSE-ConnectionGUID: 9fVq8SISStqNmfWkSgqePA==
X-CSE-MsgGUID: yuYVp8pNT+uNc+6Bdv7B7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="171065711"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2025 11:50:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHoWK-000OXQ-25;
	Wed, 21 May 2025 18:50:28 +0000
Date: Thu, 22 May 2025 02:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 259/259]
 arch/x86/include/asm/string_32.h:195:29: warning: 'memset' used with
 constant zero length parameter; this could be due to transposed parameters
Message-ID: <202505220250.LTGElWSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   931ffb231a45d53ede3ea0e28f28de35c7817a55
commit: 931ffb231a45d53ede3ea0e28f28de35c7817a55 [259/259] fs: dcache exlusion between overlayfs, casefolding
config: i386-buildonly-randconfig-003-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220250.LTGElWSM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220250.LTGElWSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220250.LTGElWSM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/string.h:3,
                    from arch/x86/include/asm/cpuid/api.h:10,
                    from arch/x86/include/asm/cpuid.h:6,
                    from arch/x86/include/asm/processor.h:19,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from fs/dcache.c:18:
   fs/dcache.c: In function 'd_casefold_enable':
>> arch/x86/include/asm/string_32.h:195:29: warning: 'memset' used with constant zero length parameter; this could be due to transposed parameters [-Wmemset-transposed-args]
     195 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                             ^~~~~~~~~~~~~~~~
   fs/dcache.c:3307:9: note: in expansion of macro 'memset'
    3307 |         memset(e, sizeof(*e), 0);
         |         ^~~~~~


vim +/memset +195 arch/x86/include/asm/string_32.h

^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  186  
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  187  #define __memset(s, c, count)				\
78d64fc21d2aa4 include/asm-x86/string_32.h      Joe Perches      2008-05-12  188  	(__builtin_constant_p(count)			\
78d64fc21d2aa4 include/asm-x86/string_32.h      Joe Perches      2008-05-12  189  	 ? __constant_count_memset((s), (c), (count))	\
78d64fc21d2aa4 include/asm-x86/string_32.h      Joe Perches      2008-05-12  190  	 : __memset_generic((s), (c), (count)))
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  191  
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  192  #define __HAVE_ARCH_MEMSET
6974f0c4555e28 arch/x86/include/asm/string_32.h Daniel Micay     2017-07-12  193  extern void *memset(void *, int, size_t);
6974f0c4555e28 arch/x86/include/asm/string_32.h Daniel Micay     2017-07-12  194  #ifndef CONFIG_FORTIFY_SOURCE
ff60fab71bb3b4 arch/x86/include/asm/string_32.h Arjan van de Ven 2009-09-28 @195  #define memset(s, c, count) __builtin_memset(s, c, count)
6974f0c4555e28 arch/x86/include/asm/string_32.h Daniel Micay     2017-07-12  196  #endif /* !CONFIG_FORTIFY_SOURCE */
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  197  

:::::: The code at line 195 was first introduced by commit
:::::: ff60fab71bb3b4fdbf8caf57ff3739ffd0887396 x86: Use __builtin_memset and __builtin_memcpy for memset/memcpy

:::::: TO: Arjan van de Ven <arjan@infradead.org>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
