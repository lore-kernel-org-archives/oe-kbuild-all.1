Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253D1119F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710867650; cv=none; b=QQtBWp8OvkDHfC1bQSdIYGozJzzOLVC/rUZhP7uFSzwLB0UrAGj282kNTHqVbu7VHyc+r2X557tw1DdjF5FzdaqFA8/DZFsQyYCMT7JeuMKu91vGpfskYjWgjkEzvSJB2x+m/ttD+/7r6ChHMORNTlKCacEs2ZqOyg69AoNKj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710867650; c=relaxed/simple;
	bh=qXRFg2Kpkabli7dpl8DUeB25wKVJJ3WC70RdlWgx+JU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WD9RTDeN/r9LlTmpswsQFwP2UHxC1xd/D4/mMq+AB8QNeu3O+BNH/g+jtgXcqmoOGfOypqfnkEgTnw6p6vplS3Mo6gHpyV/Dc3f1j4pAN1VY8lMHeB6opN35JrwVPU/S6xJ5Fsbe1vweVyBV8W7+7wsTIz1fzCp54k5avt7I5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6K3U17N; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6K3U17N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710867649; x=1742403649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXRFg2Kpkabli7dpl8DUeB25wKVJJ3WC70RdlWgx+JU=;
  b=T6K3U17NRhv0sgVBJNVgvnzLD7zGYx+soijZEE7xYnpne1wNiRe3GBiy
   4AuLDX1M68SuWErOWlVB3x6SLyaHACzts/fmMJTVcjDE4i2iIMfZptj19
   iNDXjWrBHxFu05Jyq8FCAlfCtwdc6k0Z4c3gDNu88OQAH7iB35pTnNRnI
   RiiDbwijwZtcEvs9Q8nEW7ISPBjIpYX1bsHF97gPETaYRdGzmR9P1HK2d
   80vSHjD8ZFPkiTfsc4gmB1m3e3Kqf7WlcFDdRUI4vNB2zj+wNd3dDebjw
   u9s2g4X9LraiFgJC/jF8WivBYnjrn6qccfyeRSfOsz1tPeRqwr4lYGDOB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="23210654"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="23210654"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 10:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="14311738"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2024 10:00:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmcpO-000Hxz-0g;
	Tue, 19 Mar 2024 17:00:42 +0000
Date: Wed, 20 Mar 2024 01:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 1008/22725]
 include/asm-generic/div64.h:48:22: error: passing argument 1 of '__div64_32'
 from incompatible pointer type
Message-ID: <202403200007.PCPYW1S6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   0a25e06c1d858ae27efabaa88494a6dc998a0138
commit: ad64c64a8f7ac0cb8357c598d152076cd3a7216d [1008/22725] Add upstream swait
config: powerpc-randconfig-003-20240319 (https://download.01.org/0day-ci/archive/20240320/202403200007.PCPYW1S6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403200007.PCPYW1S6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403200007.PCPYW1S6-lkp@intel.com/

All errors (new ones prefixed by >>):

                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:26:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:75:27: note: in definition of macro 'BUG_ON'
     if (__builtin_constant_p(x)) {    \
                              ^
   arch/powerpc/include/asm/page.h:135:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:140:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:76:7: note: in definition of macro 'BUG_ON'
      if (x)      \
          ^
   arch/powerpc/include/asm/page.h:135:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:140:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:129:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
    #define pfn_valid(pfn)  ((pfn) >= ARCH_PFN_OFFSET && (pfn) < max_mapnr)
                                   ^
   arch/powerpc/include/asm/bug.h:84:25: note: in definition of macro 'BUG_ON'
        "r" ((__force long)(x)));   \
                            ^
   arch/powerpc/include/asm/page.h:135:32: note: in expansion of macro 'pfn_valid'
    #define virt_addr_valid(kaddr) pfn_valid(virt_to_pfn(kaddr))
                                   ^~~~~~~~~
   include/linux/scatterlist.h:140:10: note: in expansion of macro 'virt_addr_valid'
     BUG_ON(!virt_addr_valid(buf));
             ^~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/generated/asm/div64.h:1:0,
                    from include/linux/kernel.h:136,
                    from include/asm-generic/bug.h:13,
                    from arch/powerpc/include/asm/bug.h:127,
                    from include/linux/bug.h:4,
                    from include/linux/mmdebug.h:4,
                    from include/linux/gfp.h:4,
                    from include/linux/slab.h:14,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:5,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/event.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h:3,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:26:
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c: In function 'gk20a_pllg_calc_rate':
   include/asm-generic/div64.h:43:28: warning: comparison of distinct pointer types lacks a cast
     (void)(((typeof((n)) *)0) == ((uint64_t *)0)); \
                               ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:144:2: note: in expansion of macro 'do_div'
     do_div(rate, divider);
     ^~~~~~
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:4,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/event.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h:3,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:26:
   include/asm-generic/div64.h:44:18: warning: right shift count >= width of type [-Wshift-count-overflow]
     if (likely(((n) >> 32) == 0)) {   \
                     ^
   include/linux/compiler.h:165:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:144:2: note: in expansion of macro 'do_div'
     do_div(rate, divider);
     ^~~~~~
   In file included from arch/powerpc/include/generated/asm/div64.h:1:0,
                    from include/linux/kernel.h:136,
                    from include/asm-generic/bug.h:13,
                    from arch/powerpc/include/asm/bug.h:127,
                    from include/linux/bug.h:4,
                    from include/linux/mmdebug.h:4,
                    from include/linux/gfp.h:4,
                    from include/linux/slab.h:14,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:5,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/event.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h:3,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:26:
>> include/asm-generic/div64.h:48:22: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
      __rem = __div64_32(&(n), __base); \
                         ^
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:144:2: note: in expansion of macro 'do_div'
     do_div(rate, divider);
     ^~~~~~
   include/asm-generic/div64.h:35:17: note: expected 'uint64_t * {aka long long unsigned int *}' but argument is of type 'u32 * {aka unsigned int *}'
    extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
                    ^~~~~~~~~~
   In file included from include/linux/bug.h:4:0,
                    from include/linux/mmdebug.h:4,
                    from include/linux/gfp.h:4,
                    from include/linux/slab.h:14,
                    from drivers/gpu/drm/nouveau/include/nvif/os.h:5,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/event.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:3,
                    from drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h:3,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/priv.h:4,
                    from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:26:
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c: In function 'gk20a_pllg_calc_mnp':
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:248:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     WARN_ON(best_delta == ~0);
                        ^
   arch/powerpc/include/asm/bug.h:98:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(x);    \
                            ^
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:29:0:
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c: In function '_gk20a_pllg_program_mnp':
   drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h:48:59: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } while (_taken = nvkm_timer_read(_tmr) - _time0, _taken < _nsecs);    \
                                                              ^
   drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h:59:32: note: in expansion of macro 'nvkm_nsec'
    #define nvkm_usec(d,u,cond...) nvkm_nsec((d), (u) * 1000, ##cond)
                                   ^~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:411:6: note: in expansion of macro 'nvkm_usec'
     if (nvkm_usec(device, 300,
         ^~~~~~~~~
   drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h:50:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (_taken >= _nsecs) {                                                \
                ^
   drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h:59:32: note: in expansion of macro 'nvkm_nsec'
    #define nvkm_usec(d,u,cond...) nvkm_nsec((d), (u) * 1000, ##cond)
                                   ^~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:411:6: note: in expansion of macro 'nvkm_usec'
     if (nvkm_usec(device, 300,
         ^~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c: In function 'gk20a_clk_new':
   drivers/gpu/drm/nouveau/nvkm/subdev/clk/gk20a.c:658:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < ARRAY_SIZE(gk20a_pstates); i++) {
                   ^
   cc1: some warnings being treated as errors


vim +/__div64_32 +48 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  36  
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds 2005-04-16  38   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds 2005-04-16  39   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  	if (likely(((n) >> 32) == 0)) {			\
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds 2005-04-16  46  		(n) = (uint32_t)(n) / __base;		\
^1da177e4c3f41 Linus Torvalds 2005-04-16  47  	} else 						\
^1da177e4c3f41 Linus Torvalds 2005-04-16 @48  		__rem = __div64_32(&(n), __base);	\
^1da177e4c3f41 Linus Torvalds 2005-04-16  49  	__rem;						\
^1da177e4c3f41 Linus Torvalds 2005-04-16  50   })
^1da177e4c3f41 Linus Torvalds 2005-04-16  51  

:::::: The code at line 48 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
