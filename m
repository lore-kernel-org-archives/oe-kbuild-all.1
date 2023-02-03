Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11531FBC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 10:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA820C433D2;
	Fri,  3 Feb 2023 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675420150;
	bh=LXcNmy6g3C5XCMxJuo9YsXMW2skSzPomIrpT4a9UBhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PWuyzT3VONcdcrYAfifIv+OLEABalf1dx4lGMEhKLkN2TdgfX+Op1xKb5EaPlbPwi
	 MCNzDn9F+fxf1Y+XhFLSOwqaDNoSOF6ufuRHb7BlOgm1SKFBZaoVbyX4gEuhlHvKv5
	 GDnplsLaCl24H5FUc+QENvEdHI5SNbRiHw+M8Et9HoYfSE1K5fkT0RiqhvCi8hokqt
	 JyyWqxKo9+wnEqERkZr10wd81zrSNJJ2Yg+K84l0mQm65JOWsPVQQRth+CaKOvxvFO
	 NTD5mvJG4YdRFTxWXsBz9OjIM0Bj5GoKMTm+5jdWhfvhNkV3Z5QepRtbSTFHBufABR
	 SFeEr5C7GCDlA==
Date: Fri, 3 Feb 2023 10:29:06 +0000
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Liu Shixin <liushixin2@huawei.com>, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [stable:linux-6.1.y 1681/2293]
 arch/arm64/include/asm/pgtable.h:871:51: error: implicit declaration of
 function 'pud_user_exec'; did you mean 'pmd_user_exec'?
Message-ID: <20230203102905.GA5867@willie-the-truck>
References: <202302021638.tYWqFXQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302021638.tYWqFXQb-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Feb 02, 2023 at 04:40:53PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
> head:   68a95455c153f8adc513e5b688f4b348daa7c1b1
> commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [1681/2293] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
> config: arm64-buildonly-randconfig-r006-20230129 (https://download.01.org/0day-ci/archive/20230202/202302021638.tYWqFXQb-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a006aaffd78ff70efcffa44e325633c0840b2bf2
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-6.1.y
>         git checkout a006aaffd78ff70efcffa44e325633c0840b2bf2
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:29,
>                     from include/linux/pid_namespace.h:7,
>                     from include/linux/ptrace.h:10,
>                     from include/linux/elfcore.h:11,
>                     from include/linux/crash_core.h:6,
>                     from include/linux/kexec.h:18,
>                     from arch/arm64/kernel/asm-offsets.c:12:
>    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
> >> arch/arm64/include/asm/pgtable.h:871:51: error: implicit declaration of function 'pud_user_exec'; did you mean 'pmd_user_exec'? [-Werror=implicit-function-declaration]
>      871 |         return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
>          |                                                   ^~~~~~~~~~~~~
>          |                                                   pmd_user_exec
>    cc1: some warnings being treated as errors
>    make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:1270: prepare0] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:231: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

This is probably because you don't have:

4e4ff23a35ee ("arm64/mm: Define dummy pud_user_exec() when using 2-level page-table")

Will
