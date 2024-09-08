Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81511145FE5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725831265; cv=none; b=VB2/CYfnWANkTMo1K/VCxNcwSdzD3OwtfsXeCoGy6If75+vRfBmKBFt/dDOtjY8AANofQXCCh8tv8OCO3XwtopCG9OXeBRUKBZ7Bd4PTYpw6J86FwUMNzYAquai9y3D7EwIyEoYOdv6nv6hgkMeeK1MMaH/WQK6SRUerOft2LHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725831265; c=relaxed/simple;
	bh=LhtuifP5IpdNvKQRLUnCHialW7Brlt+b4DPn+TFoBKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MJydijC2ePg3GrnR38s3Hp3MvYQinlKPY+wNJJV6iUPe1PNnovMeMRI3n3glKbNlHD7eh0uc8/HtqJ8f1BBrbABfWFq+6uczp6ZDQsxp7niIFZldzGaKSunioVF+1z+vxoR67MfvlPSoV5gpHD/EZ6Y5AFcBZv8wS7a1r1u9zZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D34F092009C; Sun,  8 Sep 2024 23:34:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id C30B492009B;
	Sun,  8 Sep 2024 22:34:21 +0100 (BST)
Date: Sun, 8 Sep 2024 22:34:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: kernel test robot <lkp@intel.com>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: error: ABI 'o32' is not supported on CPU 'mips3'
In-Reply-To: <202409062003.wDQ7fEq1-lkp@intel.com>
Message-ID: <alpine.DEB.2.21.2409082231560.60835@angie.orcam.me.uk>
References: <202409062003.wDQ7fEq1-lkp@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Sep 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b831f83e40a24f07c8dcba5be408d93beedc820f
> commit: bfc0a330c1b4526b88f6f9e711484b342cb00fb5 MIPS: Fallback CPU -march flag to ISA level if unsupported
> date:   7 months ago
> config: mips-randconfig-r111-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062003.wDQ7fEq1-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce: (https://download.01.org/0day-ci/archive/20240906/202409062003.wDQ7fEq1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409062003.wDQ7fEq1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error: ABI 'o32' is not supported on CPU 'mips3'
> >> error: ABI 'o32' is not supported on CPU 'mips3'
> >> error: ABI 'o32' is not supported on CPU 'mips3'
>    make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
>    make[3]: *** [scripts/Makefile.build:243: scripts/mod/empty.o] Error 1
>    make[3]: Target 'scripts/mod/' not remade because of errors.
>    make[2]: *** [Makefile:1198: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

 This is analogous to the same failure for "CPU 'mips64'", and presumably 
also addressed in newer LLVM.

  Maciej
