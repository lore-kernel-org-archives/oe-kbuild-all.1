Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6E92522A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 02:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257207; cv=none; b=Wiqmw3Xrdob0ySadwgrdrXdA1iOyIwNtMmT+QVNvkaW8IcAZkw3ro1PPzMLhaHdLF+sCRMtB99NN9KNJNh0K6Dzrhdp4KT5V0KNiDx/y+5n0iDrFAs2qxOrMTOh3l/yVGJsKXFzldznMBbyfQmSRdyTmIwdh7Rnunw71g1t11JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257207; c=relaxed/simple;
	bh=3aKpNd2VifVVM5yicoUHFQfNZnH1ZgwlFuv1pE1F900=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPWIC82Q51GQeVOZfP17JhZv0ZlbvXwrFAte4Fwz6Rk4LZXcnnk+0fOlfr19E+mZ9ptQRNaVUzcpxNsmndIl+LuqeT3Cxeos2KBhclysKt0KkriXVlkKElnfP4HzIRSln5rQQIK8bOb1Qe7WHu7aSJqUHkeMUhcKs89rYx7HLSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiucmrP0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiucmrP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770257206; x=1801793206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3aKpNd2VifVVM5yicoUHFQfNZnH1ZgwlFuv1pE1F900=;
  b=hiucmrP0S8tCfYPNQiPknOAFYD6u/WpnmC4Bc0GdZK6293X7qK7iWndE
   7d1qqW/I5o4No+hcMc1Rax9DHhOZoqdPzjXbBp90sne5Pcm8HtyuQMJmn
   D8jdB15qes0cS5M4+kG0QC930drk/X61yhdDRyAiixV5Q+hX/HG0gtp2m
   QotyrNrU0MOcZD8qjtwT/bYbxsJ38fv2GjCz1IjRFFNupUuF508pPBGbs
   ulmR0vpx2eGMCZug2aKpzYZ0/qB9qsu1afDh6oCCTTrKSccDa+wF2+rfB
   Fr/m0J5ozyxow2KZVq4nI9zpG16YeO6JnChk9hRtplxEdnWru40FnJxVu
   w==;
X-CSE-ConnectionGUID: Omkf86fYQemwxr8suLlvPQ==
X-CSE-MsgGUID: ADZbp7/uT32Ma2u4a2gv/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71547182"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71547182"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 18:06:46 -0800
X-CSE-ConnectionGUID: dFXMbz+nRJKzriAaK5r5gQ==
X-CSE-MsgGUID: KV2WJx7ZRp2wATFOC3Z3PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="247940291"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2026 18:06:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnolV-00000000jJc-0wfk;
	Thu, 05 Feb 2026 02:06:41 +0000
Date: Thu, 5 Feb 2026 10:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>, pasha.tatashin@soleen.com,
	rppt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pratyush@kernel.org,
	linux-kernel@vger.kernel.org, surenb@google.com,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
Message-ID: <202602050952.VeOX2Uoh-lkp@intel.com>
References: <20260204182816.2463931-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204182816.2463931-1-sashal@kernel.org>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc8 next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kexec-allow-KEXEC_HANDOVER-to-build-with-COMPILE_TEST/20260205-023202
base:   linus/master
patch link:    https://lore.kernel.org/r/20260204182816.2463931-1-sashal%40kernel.org
patch subject: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260205/202602050952.VeOX2Uoh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050952.VeOX2Uoh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050952.VeOX2Uoh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/liveupdate/kexec_handover.c: In function 'kho_fill_kimage':
   kernel/liveupdate/kexec_handover.c:1547:26: error: storage size of 'scratch' isn't known
    1547 |         struct kexec_buf scratch;
         |                          ^~~~~~~
   kernel/liveupdate/kexec_handover.c:1552:14: error: invalid use of undefined type 'struct kimage'
    1552 |         image->kho.fdt = virt_to_phys(kho_out.fdt);
         |              ^~
   kernel/liveupdate/kexec_handover.c:1556:18: error: 'struct kexec_buf' has no member named 'image'
    1556 |                 .image = image,
         |                  ^~~~~
>> kernel/liveupdate/kexec_handover.c:1556:26: warning: excess elements in struct initializer
    1556 |                 .image = image,
         |                          ^~~~~
   kernel/liveupdate/kexec_handover.c:1556:26: note: (near initialization for '(anonymous)')
   kernel/liveupdate/kexec_handover.c:1557:18: error: 'struct kexec_buf' has no member named 'buffer'
    1557 |                 .buffer = kho_scratch,
         |                  ^~~~~~
   kernel/liveupdate/kexec_handover.c:1557:27: warning: excess elements in struct initializer
    1557 |                 .buffer = kho_scratch,
         |                           ^~~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1557:27: note: (near initialization for '(anonymous)')
   kernel/liveupdate/kexec_handover.c:1558:18: error: 'struct kexec_buf' has no member named 'bufsz'
    1558 |                 .bufsz = scratch_size,
         |                  ^~~~~
   kernel/liveupdate/kexec_handover.c:1558:26: warning: excess elements in struct initializer
    1558 |                 .bufsz = scratch_size,
         |                          ^~~~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1558:26: note: (near initialization for '(anonymous)')
   kernel/liveupdate/kexec_handover.c:1559:18: error: 'struct kexec_buf' has no member named 'mem'
    1559 |                 .mem = KEXEC_BUF_MEM_UNKNOWN,
         |                  ^~~
   kernel/liveupdate/kexec_handover.c:1559:24: error: 'KEXEC_BUF_MEM_UNKNOWN' undeclared (first use in this function)
    1559 |                 .mem = KEXEC_BUF_MEM_UNKNOWN,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1559:24: note: each undeclared identifier is reported only once for each function it appears in
   kernel/liveupdate/kexec_handover.c:1559:24: warning: excess elements in struct initializer
   kernel/liveupdate/kexec_handover.c:1559:24: note: (near initialization for '(anonymous)')
   kernel/liveupdate/kexec_handover.c:1560:18: error: 'struct kexec_buf' has no member named 'memsz'
    1560 |                 .memsz = scratch_size,
         |                  ^~~~~
   kernel/liveupdate/kexec_handover.c:1560:26: warning: excess elements in struct initializer
    1560 |                 .memsz = scratch_size,
         |                          ^~~~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1560:26: note: (near initialization for '(anonymous)')
   kernel/liveupdate/kexec_handover.c:1561:18: error: 'struct kexec_buf' has no member named 'buf_align'
    1561 |                 .buf_align = SZ_64K, /* Makes it easier to map */
         |                  ^~~~~~~~~
   In file included from include/linux/mm.h:29,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/elfcore.h:11,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from kernel/liveupdate/kexec_handover.c:16:
>> include/linux/sizes.h:28:41: warning: excess elements in struct initializer
      28 | #define SZ_64K                          0x00010000
         |                                         ^~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1561:30: note: in expansion of macro 'SZ_64K'
    1561 |                 .buf_align = SZ_64K, /* Makes it easier to map */
         |                              ^~~~~~
   include/linux/sizes.h:28:41: note: (near initialization for '(anonymous)')
      28 | #define SZ_64K                          0x00010000
         |                                         ^~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1561:30: note: in expansion of macro 'SZ_64K'
    1561 |                 .buf_align = SZ_64K, /* Makes it easier to map */
         |                              ^~~~~~
   kernel/liveupdate/kexec_handover.c:1562:18: error: 'struct kexec_buf' has no member named 'buf_max'
    1562 |                 .buf_max = ULONG_MAX,
         |                  ^~~~~~~
   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from include/linux/bitops.h:6,
                    from include/linux/bitmap.h:8,
                    from include/linux/nodemask.h:91,
                    from include/linux/numa.h:6,
                    from include/linux/cma.h:7,
                    from kernel/liveupdate/kexec_handover.c:13:
>> include/vdso/limits.h:13:25: warning: excess elements in struct initializer
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   kernel/liveupdate/kexec_handover.c:1562:28: note: in expansion of macro 'ULONG_MAX'
    1562 |                 .buf_max = ULONG_MAX,
         |                            ^~~~~~~~~
   include/vdso/limits.h:13:25: note: (near initialization for '(anonymous)')
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   kernel/liveupdate/kexec_handover.c:1562:28: note: in expansion of macro 'ULONG_MAX'
    1562 |                 .buf_max = ULONG_MAX,
         |                            ^~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1563:18: error: 'struct kexec_buf' has no member named 'top_down'
    1563 |                 .top_down = true,
         |                  ^~~~~~~~
   kernel/liveupdate/kexec_handover.c:1563:29: warning: excess elements in struct initializer
    1563 |                 .top_down = true,
         |                             ^~~~
   kernel/liveupdate/kexec_handover.c:1563:29: note: (near initialization for '(anonymous)')
   kernel/liveupdate/kexec_handover.c:1555:37: error: invalid use of undefined type 'struct kexec_buf'
    1555 |         scratch = (struct kexec_buf){
         |                                     ^
   kernel/liveupdate/kexec_handover.c:1565:15: error: implicit declaration of function 'kexec_add_buffer' [-Wimplicit-function-declaration]
    1565 |         err = kexec_add_buffer(&scratch);
         |               ^~~~~~~~~~~~~~~~
   kernel/liveupdate/kexec_handover.c:1568:14: error: invalid use of undefined type 'struct kimage'
    1568 |         image->kho.scratch = &image->segment[image->nr_segments - 1];
         |              ^~
   kernel/liveupdate/kexec_handover.c:1568:36: error: invalid use of undefined type 'struct kimage'
    1568 |         image->kho.scratch = &image->segment[image->nr_segments - 1];
         |                                    ^~
   kernel/liveupdate/kexec_handover.c:1568:51: error: invalid use of undefined type 'struct kimage'
    1568 |         image->kho.scratch = &image->segment[image->nr_segments - 1];
         |                                                   ^~
>> kernel/liveupdate/kexec_handover.c:1547:26: warning: unused variable 'scratch' [-Wunused-variable]
    1547 |         struct kexec_buf scratch;
         |                          ^~~~~~~
   kernel/liveupdate/kexec_handover.c: In function 'kho_locate_mem_hole':
   kernel/liveupdate/kexec_handover.c:1599:32: error: invalid use of undefined type 'struct kexec_buf'
    1599 |         if (!kho_enable || kbuf->image->type == KEXEC_TYPE_CRASH)
         |                                ^~
   kernel/liveupdate/kexec_handover.c:1599:49: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
    1599 |         if (!kho_enable || kbuf->image->type == KEXEC_TYPE_CRASH)
         |                                                 ^~~~~~~~~~~~~~~~
         |                                                 KEXEC_ON_CRASH


vim +1556 kernel/liveupdate/kexec_handover.c

3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1542  
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1543  int kho_fill_kimage(struct kimage *image)
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1544  {
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1545  	ssize_t scratch_size;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1546  	int err = 0;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09 @1547  	struct kexec_buf scratch;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1548  
d7255959b69a4e kernel/liveupdate/kexec_handover.c Pasha Tatashin            2025-11-14  1549  	if (!kho_enable)
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1550  		return 0;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1551  
70f9133096c833 kernel/kexec_handover.c            Mike Rapoport (Microsoft  2025-11-01  1552) 	image->kho.fdt = virt_to_phys(kho_out.fdt);
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1553  
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1554  	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1555  	scratch = (struct kexec_buf){
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09 @1556  		.image = image,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1557  		.buffer = kho_scratch,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1558  		.bufsz = scratch_size,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1559  		.mem = KEXEC_BUF_MEM_UNKNOWN,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1560  		.memsz = scratch_size,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1561  		.buf_align = SZ_64K, /* Makes it easier to map */
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1562  		.buf_max = ULONG_MAX,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1563  		.top_down = true,
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1564  	};
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1565  	err = kexec_add_buffer(&scratch);
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1566  	if (err)
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1567  		return err;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09 @1568  	image->kho.scratch = &image->segment[image->nr_segments - 1];
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1569  
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1570  	return 0;
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1571  }
3bdecc3c93f9f6 kernel/kexec_handover.c            Alexander Graf            2025-05-09  1572  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
