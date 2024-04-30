Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6367C1802DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714499700; cv=none; b=Vhdzyb8/NxQOd5NNKUQN5uprlHnrjj+kke+jczRGGTVQn9MBgrsP2Bml7NZQlcjDJwJdnKC6eyzeoqavuqxTtIEo80nJMT0BaIVpg/aV5vYIZ5+Uqm+J2PFhVsZZ8f62/+YKA9/jN9KLyMZ1fQFDGlkhV2k3Gx/KRCVIWs1D9o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714499700; c=relaxed/simple;
	bh=1LxL23nGRyjW2xUInrY6Mm5qmylyJIeZ0ypfoAn79Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqf7ejRoAqtfsKIwkR9+SEMW1NBGywbBVdY6uuX66gSiditc7O9pZdnYVmo3iQAlJySwxhFrlxSNHqMe7xFFZ/teDISSYYT0eCcrtwdBxE3jewDT17DSEtgnm3x/q2WJsFVRrgdvHTM/vgRTAOh4r6l3kUob7jNXHzFwCODJ6hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOez/C/E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOez/C/E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1034C2BBFC;
	Tue, 30 Apr 2024 17:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714499699;
	bh=1LxL23nGRyjW2xUInrY6Mm5qmylyJIeZ0ypfoAn79Ek=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UOez/C/E/ORsVJ2pSSlEMoAWC/D7k2hWGyrVZ/iWHyK67ukRzrFPpfP2xABh9SnGb
	 SQfvw2gchZvqPV8dMMzC4kamqRMjyO+qrjEjRGq+I2sLRXoNF+pPSK8LsWC0ZnyKIu
	 NfXyeDdNU8gjldL4jMH/mlCF/1Su1DrjO69H0GS89F80T37QL/auJvU1L2QPyOU8Mh
	 o4UDBDJQEJ0Gii92ShHVDxtzf+enbtqmwdtToFtkZGSkSMi0kOwO8vNO27iqPr/Mou
	 VStNZ/QxMB9sPatE8DQyObxQQexQjulGLaaal/R8ZVD6C/u2ePv+QjGFY34n+/aWgb
	 ALG7Pkwl5H8Eg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 802EACE0C37; Tue, 30 Apr 2024 10:54:59 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:54:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [linux-next:master 4535/6266]
 arch/arc/include/asm/cmpxchg.h:73:27: error: implicit declaration of
 function 'cmpxchg_emu_u8'
Message-ID: <15ae9a2f-a7dc-4b39-b7f7-9268d7163031@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202404160503.zFIp77TO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404160503.zFIp77TO-lkp@intel.com>

On Tue, Apr 16, 2024 at 05:07:03AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
> commit: d4f26ed66a53be57567bf71d60e80a116cec34e1 [4535/6266] ARC: Emulate one-byte cmpxchg
> config: arc-randconfig-r016-20230816 (https://download.01.org/0day-ci/archive/20240416/202404160503.zFIp77TO-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160503.zFIp77TO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404160503.zFIp77TO-lkp@intel.com/

I might be suffering a failure of imagination, but I am not seeing how
my change could result in these diagnostics.  Please let me know what
I am missing!

							Thanx, Paul

> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/bitops.h:68,
>                     from include/linux/log2.h:12,
>                     from kernel/bounds.c:13:
>    arch/arc/include/asm/bitops.h: In function '__fls':
>    arch/arc/include/asm/bitops.h:137:17: error: implicit declaration of function '__builtin_arc_fls'; did you mean '__builtin_arc_flag'? [-Werror=implicit-function-declaration]
>      137 |         return  __builtin_arc_fls(x);
>          |                 ^~~~~~~~~~~~~~~~~
>          |                 __builtin_arc_flag
>    In file included from arch/arc/include/asm/atomic.h:31,
>                     from include/linux/atomic.h:7,
>                     from include/asm-generic/bitops/lock.h:5,
>                     from arch/arc/include/asm/bitops.h:188:
>    arch/arc/include/asm/atomic64-arcv2.h: At top level:
>    arch/arc/include/asm/atomic64-arcv2.h:13:3: error: conflicting types for 'atomic64_t'; have 'struct <anonymous>'
>       13 | } atomic64_t;
>          |   ^~~~~~~~~~
>    In file included from include/linux/page-flags.h:9,
>                     from kernel/bounds.c:10:
>    include/linux/types.h:184:3: note: previous declaration of 'atomic64_t' with type 'atomic64_t'
>      184 | } atomic64_t;
>          |   ^~~~~~~~~~
>    In file included from arch/arc/include/asm/atomic.h:13:
>    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
> >> arch/arc/include/asm/cmpxchg.h:73:27: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
>       73 |                 __flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_); \
>          |                           ^~~~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^~~~~~~~~~~~
>    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>     2026 |         return raw_cmpxchg(&v->counter, old, new);
>          |                ^~~~~~~~~~~
>    In file included from arch/arc/include/uapi/asm/byteorder.h:14,
>                     from include/asm-generic/bitops/le.h:6,
>                     from arch/arc/include/asm/bitops.h:192:
>    include/linux/byteorder/big_endian.h: At top level:
>    include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
>        8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
>          |  ^~~~~~~
>    cc1: some warnings being treated as errors
>    make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1197: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +/cmpxchg_emu_u8 +73 arch/arc/include/asm/cmpxchg.h
> 
>     62	
>     63	#define arch_cmpxchg(ptr, old, new)				        \
>     64	({									\
>     65		volatile __typeof__(ptr) _p_ = (ptr);				\
>     66		__typeof__(*(ptr)) _o_ = (old);					\
>     67		__typeof__(*(ptr)) _n_ = (new);					\
>     68		__typeof__(*(ptr)) _prev_;					\
>     69		unsigned long __flags;						\
>     70										\
>     71		switch(sizeof((_p_))) {						\
>     72		case 1:								\
>   > 73			__flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_);	\
>     74			_prev_ = (__typeof__(*(ptr)))__flags;			\
>     75			break;							\
>     76			break;							\
>     77		case 4:								\
>     78			/*							\
>     79			 * spin lock/unlock provide the needed smp_mb()		\
>     80			 * before/after						\
>     81			 */							\
>     82			atomic_ops_lock(__flags);				\
>     83			_prev_ = *_p_;						\
>     84			if (_prev_ == _o_)					\
>     85				*_p_ = _n_;					\
>     86			atomic_ops_unlock(__flags);				\
>     87			break;							\
>     88		default:							\
>     89			BUILD_BUG();						\
>     90		}								\
>     91										\
>     92		_prev_;								\
>     93	})
>     94	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
