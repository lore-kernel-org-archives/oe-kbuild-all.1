Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C73635C6B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283177; cv=none; b=YLO0pASuwZ4xurz7TCQ1uoJXqo9HEt2IyDQCl4EFYnmkbQ8yl0a3UqAJ8lAz5Yj8hSfhk4AAQ5Nlc+F+y1pRIEiPltsCfKy1hGA0R82GN0K3CJXb/lC9ydo6CKCt5yZM4v+5OECyxHkGIewKSmh49yvQturukMli9NLlocRfOBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283177; c=relaxed/simple;
	bh=9UpFwI862u3aAloVW9yON1KJGBoWf8WByoba6S30BiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPaPObwrcXmg0SIRftfIugIWOuLB2hRNwJDL4UIiX0M5yP+P59uxbOoW/aOddAnTuD1gz3GqfnrlCPlvg91/uCY8XSD4AQH7LvPgWNfnlYAJsaM/PLG0apVcpxqAnSwvjpt+reKnhbyeBQZZRnbwWbT32A091rj5ulW5uUvetrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwqtcG9r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwqtcG9r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84151F000FF;
	Thu, 24 Sep 2026 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283176;
	bh=uIzmfV9F/XZ6X4H7F7PdFSUESsZ401D4IoK+Dp/1stI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YwqtcG9rugUyeHKQGr9znFj6B8QtleUN+ddXtgK1nx0Agu7XQz7u/HBtB3tbLIOix
	 2GlbBC7tBvklzFKd/WcOlyW0RZuTwFxC29MD0LK5VzwW2p38t30eoBuVOMJW/DBj1w
	 RUiiTC0JSshK622YXiDMe+TDEqemi4Z9Xq2y5G115ow8/kLNjIrHr/MC267h6pUjo5
	 v5WkmZEbCS91jSPW471BVOShJS96mBjy/JHsKQVlB4V1yDa5uSOviXU6vMqZYk6LBM
	 DEfxZABa4Ns0dyVkM+sL1GYUTELKBoGv5aaKNmKpPEBRlDvFtEyd60vvIgEQFx9gLU
	 2RC93+llJ7cIw==
Message-ID: <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
Date: Thu, 24 Sep 2026 13:52:55 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
 conditional expression
To: kernel test robot <lkp@intel.com>, Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <202609241517.SSV1Goz3-lkp@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <202609241517.SSV1Goz3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 00:51, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
> head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
> commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     In file included from arch/arc/include/asm/atomic.h:13,
>                      from include/linux/atomic.h:7,
>                      from include/asm-generic/bitops/lock.h:5,
>                      from arch/arc/include/asm/bitops.h:190,
>                      from include/linux/bitops.h:67,
>                      from include/linux/log2.h:12,
>                      from include/asm-generic/div64.h:55,
>                      from ./arch/arc/include/generated/asm/div64.h:1,
>                      from include/linux/math.h:6,
>                      from include/linux/math64.h:6,
>                      from include/linux/time.h:6,
>                      from include/linux/stat.h:19,
>                      from include/linux/fs_dirent.h:5,
>                      from include/linux/fs/super_types.h:5,
>                      from include/linux/fs/super.h:5,
>                      from include/linux/fs.h:5,
>                      from include/linux/fscrypt.h:16,
>                      from fs/crypto/fscrypt_private.h:15,
>                      from fs/crypto/hooks.c:10:
>     fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
>        46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \

Issue is in  fs/crypto/hooks.c doing cmpxchg_release(&inode->i_link, 
NULL, pstr.name)
where i_link is char * and pstr.name is unsigned char *),

The problem is when pointer types are incompatible and that's exactly 
the W toggle above.

So Bradley's patch needs this fixup

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 4596edfefa95..9053098bb152 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -42,8 +42,10 @@
  #define arch_cmpxchg_relaxed(ptr, old, new)     \
  ({    \
         __typeof__(ptr) _p_ = (ptr);     \
-       unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));       
       \
-       unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));       
       \
+       __typeof__(*(ptr)) _o_ = (old);    \
+       __typeof__(*(ptr)) _n_ = (new);    \
+       unsigned long _old_ = (unsigned long)_o_;            \
+       unsigned long _new_ = (unsigned long)_n_;            \

P.S: For arch changes shouldn't the submitter be required to at least 
test the building, specially when this involves the macro maze. Its 
really easy with crosstool hosting all the cross-compilers [1] - just 
download and untar.

[1] 
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/16.2.0/

Thx,
-Vineet

>           |                                                          ^
>     include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
>        68 |         op##_relaxed(args);                                             \
>           |         ^~
>     include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
>        80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>      4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>           |         ^~~~~~~~~~~~~~~~~~~
>     fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>       420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>           |             ^~~~~~~~~~~~~~~
>     arch/arc/include/asm/cmpxchg.h:46:51: note: first expression has type 'char *'
>        46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
>           |                                                   ^~~~~~
>     include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
>        68 |         op##_relaxed(args);                                             \
>           |         ^~
>     include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
>        80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>      4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>           |         ^~~~~~~~~~~~~~~~~~~
>     fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>       420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>           |             ^~~~~~~~~~~~~~~
>     arch/arc/include/asm/cmpxchg.h:46:60: note: second expression has type 'unsigned char *'
>        46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
>           |                                                            ^~~~~
>     include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
>        68 |         op##_relaxed(args);                                             \
>           |         ^~
>     include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
>        80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
>      4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
>           |         ^~~~~~~~~~~~~~~~~~~
>     fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
>       420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
>           |             ^~~~~~~~~~~~~~~
>
>
> vim +46 arch/arc/include/asm/cmpxchg.h
>
>      41	
>      42	#define arch_cmpxchg_relaxed(ptr, old, new)				\
>      43	({									\
>      44		__typeof__(ptr) _p_ = (ptr);					\
>      45		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
>    > 46		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
>      47		__typeof__(*(ptr)) _prev_;					\
>      48										\
>      49		switch (sizeof(*(_p_))) {						\
>      50		case 1:								\
>      51			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, _old_, _new_);	\
>      52			break;							\
>      53		case 2:								\
>      54			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, _old_, _new_);	\
>      55			break;							\
>      56		case 4:								\
>      57			_prev_ = (__typeof__(*(ptr)))__cmpxchg(_p_, _old_, _new_);			\
>      58			break;							\
>      59		default:							\
>      60			BUILD_BUG();						\
>      61		}								\
>      62		_prev_;								\
>      63	})
>      64	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

