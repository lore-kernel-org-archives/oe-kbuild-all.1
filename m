Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FB29460
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771547587; cv=none; b=ZwPYVtS+31hJxdaxhELbCtvplJXKh3x2EuL+/Qnykq3HvADgkp+tuh4vEmHoZLlYDCbvIsNCrL6XMg9ciGR3snm+O4OVap1KU2qauHRdrqLct9qklD2gnE9IGxa9M64Qz95fzdggx24Vm89nAGDgYAXCaohIHOAULToqgIb00Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771547587; c=relaxed/simple;
	bh=mI7ehixkqOm66V6E78mMneO9FJNSxNT5moOzyZ0ViyA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ahGgDkAgHw1NfidcwxiE4H42dPFLI0Vxs3NjrkG+sd+oZ/StBVgxm6UtWirSMAzS+2ojxIOVQEsJ/hjv1TsPvwG2KPPccdRUR5LqUcut74VDfcDYPzfOELeWh9o9RQzhlF+c/gR19MXiz6ueTu2+9fefHGG4azQYEdXDnZBwH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6958992009C; Fri, 20 Feb 2026 01:32:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5ADA092009B;
	Fri, 20 Feb 2026 00:32:57 +0000 (GMT)
Date: Fri, 20 Feb 2026 00:32:57 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
    oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
    Keith Busch <kbusch@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
    Damien Le Moal <dlemoal@kernel.org>
Subject: Re: arch/mips/include/asm/bitops.h:104:2: warning: used $at (currently
 $1) without ".set noat"
In-Reply-To: <202602191524.ahByivoK-lkp@intel.com>
Message-ID: <alpine.DEB.2.21.2602200009130.61446@angie.orcam.me.uk>
References: <202602191524.ahByivoK-lkp@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Feb 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   956b9cbd7f156c8672dac94a00de3c6a0939c692
> commit: 511b3b644e28d9b66e32515a74c57ff599e89035 nvmet: pci-epf: move DMA initialization to EPC init callback
> date:   3 months ago
> config: mips-randconfig-r111-20260219 (https://download.01.org/0day-ci/archive/20260219/202602191524.ahByivoK-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191524.ahByivoK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602191524.ahByivoK-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/nvme/target/pci-epf.c:11:
>    In file included from include/linux/delay.h:12:
>    In file included from include/linux/math.h:6:
>    In file included from arch/mips/include/asm/div64.h:89:
>    In file included from include/asm-generic/div64.h:55:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:67:
> >> arch/mips/include/asm/bitops.h:104:2: warning: used $at (currently $1) without ".set noat" [-Winline-asm]
>      104 |         __bit_op(*m, "or\t%0, %2", "ir"(BIT(bit)));
>          |         ^
>    arch/mips/include/asm/bitops.h:33:3: note: expanded from macro '__bit_op'
>       33 |         "1:     " __stringify(LONG_LL)  "       %0, %1  \n"     \
>          |          ^
>    <inline asm>:4:13: note: instantiated into assembly here
>        4 | 1:      ll      $3, 0($1)       
>          |                       ^

 FWIW, it seems to me like a compiler bug hitting the commit by chance.  

 The issue is $1 must not be supplied as a register operand to inline asm, 
as MIPS inline asm is in the `noat' assembly mode by default (as correctly 
reported here) and code authors are not supposed to switch the mode only 
to make compiler output work and may assume $1 is available for use by 
macro expansions.  Either the register allocator has to avoid choosing $1 
for expressions that are used with inline asm or the register has to be 
excluded from allocation altogether, such as with GCC where it's a fixed 
register.

  Maciej
