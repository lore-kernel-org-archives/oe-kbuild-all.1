Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0897195803
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725528180; cv=none; b=sZPf3ypUopnuI4he08bj21gzPsfsbWLUIxkxsWs15AHpKXlLSnavmwCvKFKmv1R81PVZ7sESR3Xph1eefm8Wt+P/jIAX5HEV8Mt+2XK37w9pQt1bx5XS3GyNh1bbtlCqxFJx5a4sgKBnXaiC0s3/MunzPZVUtnaNGUEMBYTu9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725528180; c=relaxed/simple;
	bh=N4iC40EzEPc13bQ576OAMKyjKURS6QAGYI+Q/cUFnok=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ptotH4uNDGa5MuiNueE2q0NswgEhu/z+6iWJQhA/ykxwotohVWt7pzO2R0vMfwoOZ3A+ZIvQ+BetI0xMeh/j9oPMTY+CC7GLwvnisTENkNl8ApCcAdBe2THZhvyt8QTNGeMY/73a10hMkXepnn7Y9A2oNNBoW4YZ2iIVwf/gJLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5F88392009C; Thu,  5 Sep 2024 11:22:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 58DAA92009B;
	Thu,  5 Sep 2024 10:22:49 +0100 (BST)
Date: Thu, 5 Sep 2024 10:22:49 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: kernel test robot <lkp@intel.com>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: error: ABI 'o32' is not supported on CPU 'mips64'
In-Reply-To: <202408310705.y2OPq3Xs-lkp@intel.com>
Message-ID: <alpine.DEB.2.21.2409051011570.1802@angie.orcam.me.uk>
References: <202408310705.y2OPq3Xs-lkp@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 31 Aug 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   fb24560f31f9dff2c97707cfed6029bfebebaf1c
> commit: 2326c8f2022636a1e47402ffd09a3b28f737275f MIPS: Fix fallback march for SB1
> date:   7 weeks ago
> config: mips-randconfig-r121-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310705.y2OPq3Xs-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20240831/202408310705.y2OPq3Xs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408310705.y2OPq3Xs-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error: ABI 'o32' is not supported on CPU 'mips64'
> >> error: error: ABI 'o32' is not supported on CPU 'mips64'
>    ABI 'o32' is not supported on CPU 'mips64'
>    make[3]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1
>    make[3]: *** [scripts/Makefile.build:244: scripts/mod/empty.o] Error 1
>    make[3]: Target 'scripts/mod/' not remade because of errors.
>    make[2]: *** [Makefile:1207: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.

 This is a compiler bug.  The MIPS64 ISA does certainly support the o32 
ABI, so they need to fix their "CPU 'mips64'" definition.

  Maciej
