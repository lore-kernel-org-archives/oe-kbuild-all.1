Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A532378
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 01:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687571906; x=1719107906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UQgSUJXzji8+Hx4m9a0CSH99k9dDssf141UzmvhL6Pw=;
  b=jFNHL95uV6N38eJmvssdumFt6UyMRevJnTsvj2BvIuwGMA/jDJFtlPmA
   4E34QB06BZ7weybvim8eAv40KGXrvthMmJPbAS4B7Tmb2Nyb5SERI2IZX
   tmjWHYCU7QhcMU+TgqomrIl4MdI/DtviMXm+7zgWvatO3Q5gfeunkjNhq
   AqJTcK5FKeoM31Os0pCyQubNuKBPMTmIIbBB9DFCNMBQ8NHxI/+KshFO6
   V37Vf7rw8Rg2JuFjWOVut4/EbESMuovLhOa0jEoudVRC4YCk8Va6n/Q6v
   MgxxktSZsXnoqvZ0dRZSzLIuTxdLgSa1C5cuYXL8qtZTP+qZ9RIWY1Fyo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359767878"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="359767878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 18:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="709632663"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="709632663"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Jun 2023 18:58:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCsXe-0008dr-24;
	Sat, 24 Jun 2023 01:58:22 +0000
Date: Sat, 24 Jun 2023 09:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenny Ho <Kenny.Ho@amd.com>
Subject: [linux-next:master 7532/12162]
 include/linux/fortify-string.h:529:25: error: call to
 '__read_overflow2_field' declared with attribute warning: detected read
 beyond size of field (2nd parameter); maybe use struct_group()?
Message-ID: <202306240951.XX1tI4YV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 1b320ad3f5a88602aef2f207bc211539a5496702 [7532/12162] drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
config: mips-randconfig-c024-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240951.XX1tI4YV-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240951.XX1tI4YV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240951.XX1tI4YV-lkp@intel.com/

Note: the linux-next/master HEAD 8d2be868b42c08290509c60515865f4de24ea704 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/firmware.h:7,
                    from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:26:
   In function 'fortify_memcpy_chk',
       inlined from 'sienna_cichlid_append_powerplay_table' at drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:444:2:
>> include/linux/fortify-string.h:529:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
     529 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/__read_overflow2_field +529 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  464  
f68f2ff91512c1 Kees Cook      2021-04-20  465  /*
f68f2ff91512c1 Kees Cook      2021-04-20  466   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  467   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  468   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  469   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  470   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  471   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  472   *
f68f2ff91512c1 Kees Cook      2021-04-20  473   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  474   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  475   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  476   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  477   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  478   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  479   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  480   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  481   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  482   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  483   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  484   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  485   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  486   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  487   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  488   *
f68f2ff91512c1 Kees Cook      2021-04-20  489   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  490   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  491   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  492   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  493   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  494   *
f68f2ff91512c1 Kees Cook      2021-04-20  495   */
54d9469bc515dc Kees Cook      2021-06-24  496  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  497  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  498  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  499  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  500  					 const size_t q_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  501  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  502  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  503  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  504  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  505  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  506  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  507  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  508  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  509  
f68f2ff91512c1 Kees Cook      2021-04-20  510  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  511  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  512  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  513  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  514  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  515  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  516  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  517  
f68f2ff91512c1 Kees Cook      2021-04-20  518  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  519  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  520  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  521  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  522  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  523  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  524  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  525  		 */
fa35198f39571b Kees Cook      2022-09-19  526  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  527  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  528  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20 @529  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  530  	}
f68f2ff91512c1 Kees Cook      2021-04-20  531  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  532  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  533  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  534  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  535  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  536  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  537  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  538  
f68f2ff91512c1 Kees Cook      2021-04-20  539  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  540  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  541  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  542  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  543  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  544  	 */
311fb40aa0569a Kees Cook      2022-09-02  545  	if ((p_size != SIZE_MAX && p_size < size) ||
311fb40aa0569a Kees Cook      2022-09-02  546  	    (q_size != SIZE_MAX && q_size < size))
f68f2ff91512c1 Kees Cook      2021-04-20  547  		fortify_panic(func);
54d9469bc515dc Kees Cook      2021-06-24  548  
54d9469bc515dc Kees Cook      2021-06-24  549  	/*
54d9469bc515dc Kees Cook      2021-06-24  550  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  551  	 *
54d9469bc515dc Kees Cook      2021-06-24  552  	 * We must ignore p_size_field == 0 for existing 0-element
54d9469bc515dc Kees Cook      2021-06-24  553  	 * fake flexible arrays, until they are all converted to
54d9469bc515dc Kees Cook      2021-06-24  554  	 * proper flexible arrays.
54d9469bc515dc Kees Cook      2021-06-24  555  	 *
9f7d69c5cd2390 Kees Cook      2022-09-19  556  	 * The implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  557  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  558  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  559  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  560  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  561  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  562  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  563  	 */
54d9469bc515dc Kees Cook      2021-06-24  564  	if (p_size_field != 0 && p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  565  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  566  		return true;
54d9469bc515dc Kees Cook      2021-06-24  567  
54d9469bc515dc Kees Cook      2021-06-24  568  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  569  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  570  

:::::: The code at line 529 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
