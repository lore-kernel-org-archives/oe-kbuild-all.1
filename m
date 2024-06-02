Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAF412B7D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347485; cv=none; b=bvAtyYM3qNVjh/5ebbB/cgmfz7hF5CP1Z1tCC2/gF5DNaMKQ07YzGsMOZAq7XyI5dxLgVv+cGeidHIm9le0LcFhOHjVrrUNQjGheyI0KITygnaPvWxNN5ez6RURMwLe5ytNX+aDHnfH1j5RXfy/Gh9GXPBqx6Swsl9+4Fiqm6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347485; c=relaxed/simple;
	bh=9q9L/gIbnbM7XjgtJ3CAkv+ZYzjtHqSpV29hZxYwVDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iu2euKXJDxW5lcI0LNMroaB3MMkGROzYGfMv7jnAqlwtaFrms8/VpC8w8uhdndJwZmA2LwcaDpb1MWnz0Txhfhu/wQ+UqPa8sVvi9n07PRoD/pfn++d0jxJ2OmdxL3NXX7prGTL3bQW4TCUzErlgY3Pes3qjbAObk/5dNQkJNAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9zejESM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9zejESM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B816C2BBFC;
	Sun,  2 Jun 2024 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717347485;
	bh=9q9L/gIbnbM7XjgtJ3CAkv+ZYzjtHqSpV29hZxYwVDo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=q9zejESMNhbZFjJD2C8rEbtcSgz8ZvZS8mXu9S6g8tGN3jyDSk4vGRCNFHuaib7TV
	 iATR60x+aCpLFmwjYmVJLSnbxB+B4KW1JI1wBOnjXtg5jrMLU8GgMnraTk30rTf13v
	 f7ImSOd8h2PgkHGQCwofPcIxhkNy84RZfjwhtgIu/gWfjnNEFi/wIounyPhR1dUHti
	 16lvylrV4XBwDdPnlphvKrSWcwvGvgvzQOl5c0QOeoNcpyQIA6cFYq8kw+yl1l1C0w
	 MMiEz/WfCxaZr+e7+Al+51VNoiinjQw45Ap5BE/kUPEcypGF3/H2Kh633+xxJLlw25
	 Aq1JzbYQeyaqg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EC415CE3F0A; Sun,  2 Jun 2024 09:58:04 -0700 (PDT)
Date: Sun, 2 Jun 2024 09:58:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2654/3060]
 arch/arm/include/asm/cmpxchg.h:167:12: error: call to undeclared function
 'cmpxchg_emu_u8'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <d1abdcd7-fc21-4017-8b32-0e3f181fd844@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202406021249.imvU1Clu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406021249.imvU1Clu-lkp@intel.com>

On Sun, Jun 02, 2024 at 12:56:31PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0e1980c40b6edfa68b6acf926bab22448a6e40c9
> commit: 6ba3d5014d24a46ed329fc567e554c218eb62cfa [2654/3060] ARM: Emulate one-byte cmpxchg
> config: arm-randconfig-r051-20240602 (https://download.01.org/0day-ci/archive/20240602/202406021249.imvU1Clu-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406021249.imvU1Clu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406021249.imvU1Clu-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/bounds.c:13:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:63:
>    In file included from arch/arm/include/asm/bitops.h:245:
>    In file included from include/asm-generic/bitops/lock.h:5:
>    In file included from include/linux/atomic.h:7:
>    In file included from arch/arm/include/asm/atomic.h:16:
> >> arch/arm/include/asm/cmpxchg.h:167:12: error: call to undeclared function 'cmpxchg_emu_u8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      167 |                 oldval = cmpxchg_emu_u8((volatile u8 *)ptr, old, new);

This is an old commit.  This should be fixed by its replacement:

74e3470afaca ("ARM: Emulate one-byte cmpxchg")

							Thanx, Paul

>    1 error generated.
>    make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1208: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +/cmpxchg_emu_u8 +167 arch/arm/include/asm/cmpxchg.h
> 
>    152	
>    153	/*
>    154	 * cmpxchg only support 32-bits operands on ARMv6.
>    155	 */
>    156	
>    157	static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
>    158					      unsigned long new, int size)
>    159	{
>    160		unsigned long oldval, res;
>    161	
>    162		prefetchw((const void *)ptr);
>    163	
>    164		switch (size) {
>    165	#ifdef CONFIG_CPU_V6	/* min ARCH >= ARMv6K */
>    166		case 1:
>  > 167			oldval = cmpxchg_emu_u8((volatile u8 *)ptr, old, new);
>    168			break;
>    169	#else
>    170		case 1:
>    171			do {
>    172				asm volatile("@ __cmpxchg1\n"
>    173				"	ldrexb	%1, [%2]\n"
>    174				"	mov	%0, #0\n"
>    175				"	teq	%1, %3\n"
>    176				"	strexbeq %0, %4, [%2]\n"
>    177					: "=&r" (res), "=&r" (oldval)
>    178					: "r" (ptr), "Ir" (old), "r" (new)
>    179					: "memory", "cc");
>    180			} while (res);
>    181			break;
>    182		case 2:
>    183			do {
>    184				asm volatile("@ __cmpxchg1\n"
>    185				"	ldrexh	%1, [%2]\n"
>    186				"	mov	%0, #0\n"
>    187				"	teq	%1, %3\n"
>    188				"	strexheq %0, %4, [%2]\n"
>    189					: "=&r" (res), "=&r" (oldval)
>    190					: "r" (ptr), "Ir" (old), "r" (new)
>    191					: "memory", "cc");
>    192			} while (res);
>    193			break;
>    194	#endif
>    195		case 4:
>    196			do {
>    197				asm volatile("@ __cmpxchg4\n"
>    198				"	ldrex	%1, [%2]\n"
>    199				"	mov	%0, #0\n"
>    200				"	teq	%1, %3\n"
>    201				"	strexeq %0, %4, [%2]\n"
>    202					: "=&r" (res), "=&r" (oldval)
>    203					: "r" (ptr), "Ir" (old), "r" (new)
>    204					: "memory", "cc");
>    205			} while (res);
>    206			break;
>    207		default:
>    208			__bad_cmpxchg(ptr, size);
>    209			oldval = 0;
>    210		}
>    211	
>    212		return oldval;
>    213	}
>    214	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
