Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA88831
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 08:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A403C433EF;
	Sat, 10 Jun 2023 08:39:32 +0000 (UTC)
Date: Sat, 10 Jun 2023 09:39:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm64:devel/kmalloc-minalign 18/18]
 include/linux/cache.h:104:38: error: missing binary operator before token
 "("
Message-ID: <ZIQ2wXRVNh/NKDK2@arm.com>
References: <202306101526.kiwBY0Xr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306101526.kiwBY0Xr-lkp@intel.com>

On Sat, Jun 10, 2023 at 04:10:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
> head:   e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
> commit: e5bbe79231baf5cad690c6fc9de3910ad14a2aa6 [18/18] fixup! mm/slab: Decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230610/202306101526.kiwBY0Xr-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
>         git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>         git fetch --no-tags arm64 devel/kmalloc-minalign
>         git checkout e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 prepare
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306101526.kiwBY0Xr-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/include/asm/current.h:9,
>                     from arch/x86/include/asm/preempt.h:7,
>                     from include/linux/preempt.h:78,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/swait.h:7,
>                     from include/linux/completion.h:12,
>                     from include/linux/crypto.h:15,
>                     from arch/x86/kernel/asm-offsets.c:9:
> >> include/linux/cache.h:104:38: error: missing binary operator before token "("
>      104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
>          |                                      ^
>    include/linux/slab.h:239:39: note: in expansion of macro 'ARCH_DMA_MINALIGN'
>      239 | #if defined(ARCH_HAS_DMA_MINALIGN) && ARCH_DMA_MINALIGN > 8 && \
>          |                                       ^~~~~~~~~~~~~~~~~
>    make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:1287: prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:226: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

I noticed this as well but somehow pushed the fixup in error. Removed
now and fixed properly.

Thanks for the report.

-- 
Catalin
