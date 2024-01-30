Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A255C762D3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 21:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706649520; cv=none; b=WAn1pUowtV5d2DUfbaDEc/HLrBHDNPR+54IpZUKSd5hio4m08enb+9FAdPNC7LnQ5zJlGCtTaH9cEyTTTMhAeDhViTflhZP+pPX55XafW699dK51nKDWJBF2/qF2SmMkp0Xaey6ObaeNmNkprChN6BO4AKd2aHG/+5QPosPw+Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706649520; c=relaxed/simple;
	bh=FZbsedM2GVILC8DjHKjYoUuPVJNyOBr4Xn58kQY5J7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chK6lEo06rfjn15XZQCBKHzmhW+R7oP6++K10FT8L5k4PPJ1W7B8VXPqEXdCNQ+RfSCKsNXNKRUMDUxm4MYQMGLbl2y0t/TmfcOLyay5eQsDEi9HIH6B6c7kBrNeSB4m163U5niOUJLC3Y8I6Ogu9Hk9oc1ASbqzo8niVPOJPLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dU60RMZ+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dU60RMZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706649517; x=1738185517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FZbsedM2GVILC8DjHKjYoUuPVJNyOBr4Xn58kQY5J7o=;
  b=dU60RMZ+gAGYlV22wABq7DFTAij5o+TMcCeDk7TcPbZ6ITPSTyrnNeQY
   D7E93kC5HisXpR05WZiu3EFZD42CQdBtw5aOAx+pN9cJw20AM4DT3izEk
   4zjMAyadoLudXa7ELbvIkcEiZza1ZU2bH4F5x4y+YwPLc8T89rNZAdU7M
   Dh/z0eWPq6Nm92EPRnSaIbJ4Y9RaeESIgpjcdxVMRnvZy8CDZyfAYEILt
   bNdcVRgHxBChLRaZGzKYdkXmHbMptoA3x9hzxi7dV4xnLobM62Af1N/L4
   0Ds2UCTzpizAmUPgn8VtS69eV2rdPZG7nc8MD+kCAGoH1QrRmfxZcwK3n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3251379"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3251379"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 13:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="30024427"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2024 13:18:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUvV2-0000q4-33;
	Tue, 30 Jan 2024 21:18:32 +0000
Date: Wed, 31 Jan 2024 05:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/ubsan-only 4/6]
 lib/vdso/gettimeofday.c:113:undefined reference to
 `__ubsan_handle_out_of_bounds'
Message-ID: <202401310530.lZHCj1Zl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/ubsan-only
head:   ec27d9baa678ce3b875e5784ba6ebbf759daabd6
commit: c37e9d494f33891d3228e7941cba1158fe8a0e77 [4/6] ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401310530.lZHCj1Zl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310530.lZHCj1Zl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310530.lZHCj1Zl-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   `.LANCHOR0' referenced in section `.text' of arch/loongarch/vdso/vgettimeofday.o: defined in discarded section `.data.rel.local' of arch/loongarch/vdso/vgettimeofday.o
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `do_hres':
>> lib/vdso/gettimeofday.c:113:(.text+0x364): undefined reference to `__ubsan_handle_out_of_bounds'
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `do_coarse':
   lib/vdso/gettimeofday.c:204:(.text+0x378): undefined reference to `__ubsan_handle_out_of_bounds'
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `do_coarse_timens':
   lib/vdso/gettimeofday.c:170:(.text+0x390): undefined reference to `__ubsan_handle_out_of_bounds'
>> loongarch64-linux-ld: lib/vdso/gettimeofday.c:169:(.text+0x3ac): undefined reference to `__ubsan_handle_out_of_bounds'
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `do_hres_timens':
   lib/vdso/gettimeofday.c:65:(.text+0x3c4): undefined reference to `__ubsan_handle_out_of_bounds'
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o:lib/vdso/gettimeofday.c:53: more undefined references to `__ubsan_handle_out_of_bounds' follow
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `vdso_shift_ns':
>> lib/vdso/gettimeofday.c:23:(.text+0x3f8): undefined reference to `__ubsan_handle_shift_out_of_bounds'
>> loongarch64-linux-ld: lib/vdso/gettimeofday.c:23:(.text+0x418): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `vdso_read_begin':
>> include/vdso/helpers.h:14:(.text+0x66c): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   loongarch64-linux-ld: arch/loongarch/vdso/vgettimeofday.o: in function `vdso_shift_ns':
   lib/vdso/gettimeofday.c:23:(.text+0x68c): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   make[3]: *** [arch/loongarch/vdso/Makefile:77: arch/loongarch/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/loongarch/Makefile:143: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +113 lib/vdso/gettimeofday.c

9d90b93bf325e0 Thomas Gleixner   2019-06-26   19  
8345228ccf31f9 Christophe Leroy  2020-02-07   20  #ifndef vdso_shift_ns
8345228ccf31f9 Christophe Leroy  2020-02-07   21  static __always_inline u64 vdso_shift_ns(u64 ns, u32 shift)
8345228ccf31f9 Christophe Leroy  2020-02-07   22  {
8345228ccf31f9 Christophe Leroy  2020-02-07  @23  	return ns >> shift;
8345228ccf31f9 Christophe Leroy  2020-02-07   24  }
8345228ccf31f9 Christophe Leroy  2020-02-07   25  #endif
8345228ccf31f9 Christophe Leroy  2020-02-07   26  
1dff4156d1f63b Thomas Gleixner   2020-02-07   27  #ifndef __arch_vdso_hres_capable
1dff4156d1f63b Thomas Gleixner   2020-02-07   28  static inline bool __arch_vdso_hres_capable(void)
1dff4156d1f63b Thomas Gleixner   2020-02-07   29  {
1dff4156d1f63b Thomas Gleixner   2020-02-07   30  	return true;
1dff4156d1f63b Thomas Gleixner   2020-02-07   31  }
1dff4156d1f63b Thomas Gleixner   2020-02-07   32  #endif
1dff4156d1f63b Thomas Gleixner   2020-02-07   33  
ae12e08539de67 Christophe Leroy  2020-02-07   34  #ifndef vdso_clocksource_ok
ae12e08539de67 Christophe Leroy  2020-02-07   35  static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
ae12e08539de67 Christophe Leroy  2020-02-07   36  {
ae12e08539de67 Christophe Leroy  2020-02-07   37  	return vd->clock_mode != VDSO_CLOCKMODE_NONE;
ae12e08539de67 Christophe Leroy  2020-02-07   38  }
ae12e08539de67 Christophe Leroy  2020-02-07   39  #endif
ae12e08539de67 Christophe Leroy  2020-02-07   40  
72ce778007e57e Thomas Gleixner   2020-06-06   41  #ifndef vdso_cycles_ok
72ce778007e57e Thomas Gleixner   2020-06-06   42  static inline bool vdso_cycles_ok(u64 cycles)
72ce778007e57e Thomas Gleixner   2020-06-06   43  {
72ce778007e57e Thomas Gleixner   2020-06-06   44  	return true;
72ce778007e57e Thomas Gleixner   2020-06-06   45  }
72ce778007e57e Thomas Gleixner   2020-06-06   46  #endif
72ce778007e57e Thomas Gleixner   2020-06-06   47  
660fd04f931717 Thomas Gleixner   2019-11-12   48  #ifdef CONFIG_TIME_NS
58efe9f696cf90 Christophe Leroy  2021-03-31   49  static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
660fd04f931717 Thomas Gleixner   2019-11-12   50  					  struct __kernel_timespec *ts)
660fd04f931717 Thomas Gleixner   2019-11-12   51  {
808094fcbf4196 Christophe Leroy  2021-03-31   52  	const struct vdso_data *vd;
660fd04f931717 Thomas Gleixner   2019-11-12   53  	const struct timens_offset *offs = &vdns->offset[clk];
660fd04f931717 Thomas Gleixner   2019-11-12   54  	const struct vdso_timestamp *vdso_ts;
660fd04f931717 Thomas Gleixner   2019-11-12   55  	u64 cycles, last, ns;
660fd04f931717 Thomas Gleixner   2019-11-12   56  	u32 seq;
660fd04f931717 Thomas Gleixner   2019-11-12   57  	s64 sec;
660fd04f931717 Thomas Gleixner   2019-11-12   58  
808094fcbf4196 Christophe Leroy  2021-03-31   59  	vd = vdns - (clk == CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_COARSE);
808094fcbf4196 Christophe Leroy  2021-03-31   60  	vd = __arch_get_timens_vdso_data(vd);
660fd04f931717 Thomas Gleixner   2019-11-12   61  	if (clk != CLOCK_MONOTONIC_RAW)
660fd04f931717 Thomas Gleixner   2019-11-12   62  		vd = &vd[CS_HRES_COARSE];
660fd04f931717 Thomas Gleixner   2019-11-12   63  	else
660fd04f931717 Thomas Gleixner   2019-11-12   64  		vd = &vd[CS_RAW];
660fd04f931717 Thomas Gleixner   2019-11-12   65  	vdso_ts = &vd->basetime[clk];
660fd04f931717 Thomas Gleixner   2019-11-12   66  
660fd04f931717 Thomas Gleixner   2019-11-12   67  	do {
660fd04f931717 Thomas Gleixner   2019-11-12   68  		seq = vdso_read_begin(vd);
f86fd32db70661 Thomas Gleixner   2020-02-07   69  
ae12e08539de67 Christophe Leroy  2020-02-07   70  		if (unlikely(!vdso_clocksource_ok(vd)))
5d51bee725cc14 Thomas Gleixner   2020-02-07   71  			return -1;
f86fd32db70661 Thomas Gleixner   2020-02-07   72  
4c5a116ada953b Thomas Gleixner   2020-08-04   73  		cycles = __arch_get_hw_counter(vd->clock_mode, vd);
72ce778007e57e Thomas Gleixner   2020-06-06   74  		if (unlikely(!vdso_cycles_ok(cycles)))
72ce778007e57e Thomas Gleixner   2020-06-06   75  			return -1;
660fd04f931717 Thomas Gleixner   2019-11-12   76  		ns = vdso_ts->nsec;
660fd04f931717 Thomas Gleixner   2019-11-12   77  		last = vd->cycle_last;
660fd04f931717 Thomas Gleixner   2019-11-12   78  		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
8345228ccf31f9 Christophe Leroy  2020-02-07   79  		ns = vdso_shift_ns(ns, vd->shift);
660fd04f931717 Thomas Gleixner   2019-11-12   80  		sec = vdso_ts->sec;
660fd04f931717 Thomas Gleixner   2019-11-12   81  	} while (unlikely(vdso_read_retry(vd, seq)));
660fd04f931717 Thomas Gleixner   2019-11-12   82  
660fd04f931717 Thomas Gleixner   2019-11-12   83  	/* Add the namespace offset */
660fd04f931717 Thomas Gleixner   2019-11-12   84  	sec += offs->sec;
660fd04f931717 Thomas Gleixner   2019-11-12   85  	ns += offs->nsec;
660fd04f931717 Thomas Gleixner   2019-11-12   86  
660fd04f931717 Thomas Gleixner   2019-11-12   87  	/*
660fd04f931717 Thomas Gleixner   2019-11-12   88  	 * Do this outside the loop: a race inside the loop could result
660fd04f931717 Thomas Gleixner   2019-11-12   89  	 * in __iter_div_u64_rem() being extremely slow.
660fd04f931717 Thomas Gleixner   2019-11-12   90  	 */
660fd04f931717 Thomas Gleixner   2019-11-12   91  	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
660fd04f931717 Thomas Gleixner   2019-11-12   92  	ts->tv_nsec = ns;
660fd04f931717 Thomas Gleixner   2019-11-12   93  
660fd04f931717 Thomas Gleixner   2019-11-12   94  	return 0;
660fd04f931717 Thomas Gleixner   2019-11-12   95  }
660fd04f931717 Thomas Gleixner   2019-11-12   96  #else
808094fcbf4196 Christophe Leroy  2021-03-31   97  static __always_inline
808094fcbf4196 Christophe Leroy  2021-03-31   98  const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
660fd04f931717 Thomas Gleixner   2019-11-12   99  {
660fd04f931717 Thomas Gleixner   2019-11-12  100  	return NULL;
660fd04f931717 Thomas Gleixner   2019-11-12  101  }
660fd04f931717 Thomas Gleixner   2019-11-12  102  
58efe9f696cf90 Christophe Leroy  2021-03-31  103  static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
660fd04f931717 Thomas Gleixner   2019-11-12  104  					  struct __kernel_timespec *ts)
660fd04f931717 Thomas Gleixner   2019-11-12  105  {
660fd04f931717 Thomas Gleixner   2019-11-12  106  	return -EINVAL;
660fd04f931717 Thomas Gleixner   2019-11-12  107  }
660fd04f931717 Thomas Gleixner   2019-11-12  108  #endif
660fd04f931717 Thomas Gleixner   2019-11-12  109  
c966533f8c6c45 Andrei Vagin      2019-11-12  110  static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
00b26474c2f161 Vincenzo Frascino 2019-06-21  111  				   struct __kernel_timespec *ts)
00b26474c2f161 Vincenzo Frascino 2019-06-21  112  {
00b26474c2f161 Vincenzo Frascino 2019-06-21 @113  	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
00b26474c2f161 Vincenzo Frascino 2019-06-21  114  	u64 cycles, last, sec, ns;
00b26474c2f161 Vincenzo Frascino 2019-06-21  115  	u32 seq;
00b26474c2f161 Vincenzo Frascino 2019-06-21  116  
1dff4156d1f63b Thomas Gleixner   2020-02-07  117  	/* Allows to compile the high resolution parts out */
1dff4156d1f63b Thomas Gleixner   2020-02-07  118  	if (!__arch_vdso_hres_capable())
1dff4156d1f63b Thomas Gleixner   2020-02-07  119  		return -1;
1dff4156d1f63b Thomas Gleixner   2020-02-07  120  
00b26474c2f161 Vincenzo Frascino 2019-06-21  121  	do {
660fd04f931717 Thomas Gleixner   2019-11-12  122  		/*
2d6b01bd88ccab Thomas Gleixner   2020-02-07  123  		 * Open coded to handle VDSO_CLOCKMODE_TIMENS. Time namespace
660fd04f931717 Thomas Gleixner   2019-11-12  124  		 * enabled tasks have a special VVAR page installed which
660fd04f931717 Thomas Gleixner   2019-11-12  125  		 * has vd->seq set to 1 and vd->clock_mode set to
2d6b01bd88ccab Thomas Gleixner   2020-02-07  126  		 * VDSO_CLOCKMODE_TIMENS. For non time namespace affected tasks
660fd04f931717 Thomas Gleixner   2019-11-12  127  		 * this does not affect performance because if vd->seq is
660fd04f931717 Thomas Gleixner   2019-11-12  128  		 * odd, i.e. a concurrent update is in progress the extra
660fd04f931717 Thomas Gleixner   2019-11-12  129  		 * check for vd->clock_mode is just a few extra
660fd04f931717 Thomas Gleixner   2019-11-12  130  		 * instructions while spin waiting for vd->seq to become
660fd04f931717 Thomas Gleixner   2019-11-12  131  		 * even again.
660fd04f931717 Thomas Gleixner   2019-11-12  132  		 */
660fd04f931717 Thomas Gleixner   2019-11-12  133  		while (unlikely((seq = READ_ONCE(vd->seq)) & 1)) {
660fd04f931717 Thomas Gleixner   2019-11-12  134  			if (IS_ENABLED(CONFIG_TIME_NS) &&
2d6b01bd88ccab Thomas Gleixner   2020-02-07  135  			    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
660fd04f931717 Thomas Gleixner   2019-11-12  136  				return do_hres_timens(vd, clk, ts);
660fd04f931717 Thomas Gleixner   2019-11-12  137  			cpu_relax();
660fd04f931717 Thomas Gleixner   2019-11-12  138  		}
660fd04f931717 Thomas Gleixner   2019-11-12  139  		smp_rmb();
660fd04f931717 Thomas Gleixner   2019-11-12  140  
ae12e08539de67 Christophe Leroy  2020-02-07  141  		if (unlikely(!vdso_clocksource_ok(vd)))
5d51bee725cc14 Thomas Gleixner   2020-02-07  142  			return -1;
f86fd32db70661 Thomas Gleixner   2020-02-07  143  
4c5a116ada953b Thomas Gleixner   2020-08-04  144  		cycles = __arch_get_hw_counter(vd->clock_mode, vd);
72ce778007e57e Thomas Gleixner   2020-06-06  145  		if (unlikely(!vdso_cycles_ok(cycles)))
72ce778007e57e Thomas Gleixner   2020-06-06  146  			return -1;
00b26474c2f161 Vincenzo Frascino 2019-06-21  147  		ns = vdso_ts->nsec;
00b26474c2f161 Vincenzo Frascino 2019-06-21  148  		last = vd->cycle_last;
9d90b93bf325e0 Thomas Gleixner   2019-06-26  149  		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
8345228ccf31f9 Christophe Leroy  2020-02-07  150  		ns = vdso_shift_ns(ns, vd->shift);
00b26474c2f161 Vincenzo Frascino 2019-06-21  151  		sec = vdso_ts->sec;
00b26474c2f161 Vincenzo Frascino 2019-06-21  152  	} while (unlikely(vdso_read_retry(vd, seq)));
00b26474c2f161 Vincenzo Frascino 2019-06-21  153  
00b26474c2f161 Vincenzo Frascino 2019-06-21  154  	/*
00b26474c2f161 Vincenzo Frascino 2019-06-21  155  	 * Do this outside the loop: a race inside the loop could result
00b26474c2f161 Vincenzo Frascino 2019-06-21  156  	 * in __iter_div_u64_rem() being extremely slow.
00b26474c2f161 Vincenzo Frascino 2019-06-21  157  	 */
00b26474c2f161 Vincenzo Frascino 2019-06-21  158  	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
00b26474c2f161 Vincenzo Frascino 2019-06-21  159  	ts->tv_nsec = ns;
00b26474c2f161 Vincenzo Frascino 2019-06-21  160  
00b26474c2f161 Vincenzo Frascino 2019-06-21  161  	return 0;
00b26474c2f161 Vincenzo Frascino 2019-06-21  162  }
00b26474c2f161 Vincenzo Frascino 2019-06-21  163  
660fd04f931717 Thomas Gleixner   2019-11-12  164  #ifdef CONFIG_TIME_NS
58efe9f696cf90 Christophe Leroy  2021-03-31  165  static __always_inline int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
660fd04f931717 Thomas Gleixner   2019-11-12  166  					    struct __kernel_timespec *ts)
660fd04f931717 Thomas Gleixner   2019-11-12  167  {
808094fcbf4196 Christophe Leroy  2021-03-31  168  	const struct vdso_data *vd = __arch_get_timens_vdso_data(vdns);
660fd04f931717 Thomas Gleixner   2019-11-12 @169  	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
660fd04f931717 Thomas Gleixner   2019-11-12  170  	const struct timens_offset *offs = &vdns->offset[clk];
660fd04f931717 Thomas Gleixner   2019-11-12  171  	u64 nsec;
660fd04f931717 Thomas Gleixner   2019-11-12  172  	s64 sec;
660fd04f931717 Thomas Gleixner   2019-11-12  173  	s32 seq;
660fd04f931717 Thomas Gleixner   2019-11-12  174  
660fd04f931717 Thomas Gleixner   2019-11-12  175  	do {
660fd04f931717 Thomas Gleixner   2019-11-12  176  		seq = vdso_read_begin(vd);
660fd04f931717 Thomas Gleixner   2019-11-12  177  		sec = vdso_ts->sec;
660fd04f931717 Thomas Gleixner   2019-11-12  178  		nsec = vdso_ts->nsec;
660fd04f931717 Thomas Gleixner   2019-11-12  179  	} while (unlikely(vdso_read_retry(vd, seq)));
660fd04f931717 Thomas Gleixner   2019-11-12  180  
660fd04f931717 Thomas Gleixner   2019-11-12  181  	/* Add the namespace offset */
660fd04f931717 Thomas Gleixner   2019-11-12  182  	sec += offs->sec;
660fd04f931717 Thomas Gleixner   2019-11-12  183  	nsec += offs->nsec;
660fd04f931717 Thomas Gleixner   2019-11-12  184  
660fd04f931717 Thomas Gleixner   2019-11-12  185  	/*
660fd04f931717 Thomas Gleixner   2019-11-12  186  	 * Do this outside the loop: a race inside the loop could result
660fd04f931717 Thomas Gleixner   2019-11-12  187  	 * in __iter_div_u64_rem() being extremely slow.
660fd04f931717 Thomas Gleixner   2019-11-12  188  	 */
660fd04f931717 Thomas Gleixner   2019-11-12  189  	ts->tv_sec = sec + __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
660fd04f931717 Thomas Gleixner   2019-11-12  190  	ts->tv_nsec = nsec;
660fd04f931717 Thomas Gleixner   2019-11-12  191  	return 0;
660fd04f931717 Thomas Gleixner   2019-11-12  192  }
660fd04f931717 Thomas Gleixner   2019-11-12  193  #else
58efe9f696cf90 Christophe Leroy  2021-03-31  194  static __always_inline int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
660fd04f931717 Thomas Gleixner   2019-11-12  195  					    struct __kernel_timespec *ts)
660fd04f931717 Thomas Gleixner   2019-11-12  196  {
660fd04f931717 Thomas Gleixner   2019-11-12  197  	return -1;
660fd04f931717 Thomas Gleixner   2019-11-12  198  }
660fd04f931717 Thomas Gleixner   2019-11-12  199  #endif
660fd04f931717 Thomas Gleixner   2019-11-12  200  

:::::: The code at line 113 was first introduced by commit
:::::: 00b26474c2f1613d7ab894c525f775c67c8a9e8f lib/vdso: Provide generic VDSO implementation

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
