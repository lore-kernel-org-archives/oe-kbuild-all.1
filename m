Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19511CD25
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715188336; cv=none; b=fq3kvJdC8CCEwh3w0SEUEZ9H12bWdEUNUp2YRMoY33dGn8hJRse+5e9gPexnV6GZA8+LTYV/BWuO5DpiCEnWaLvUQ5bIEiF38IzMbXyFHC4+IesmO2dLhJ6zz93hxgkrKkgFKChkXLclcy2T39ypIAKLFZ2d17+FDqHc7a0WHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715188336; c=relaxed/simple;
	bh=yo1ooz5CIKyHvFNuqxWwyAce3pzv8kH0zcjKhsWI99I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEFX52UqTO4SJLTZVOdmcw3UrofU+hZOiCC+lt6b3Hcu5Eef3h3+o694uuGLt1ESjEazqtRnXNWEiX9Y9SFTZcCgwgo41KOShO/Uy9Ut3yClSev7uie2sHUXHTenSJ19MjijI1xybczp4tDp9gV35hJEs2AinhedT+V9eR5ScMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGWxFZfO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGWxFZfO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FA3C113CC;
	Wed,  8 May 2024 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715188336;
	bh=yo1ooz5CIKyHvFNuqxWwyAce3pzv8kH0zcjKhsWI99I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGWxFZfO5gw1j5G+HVYhcqeTiaISoIhlwfuUhtonJdvlM/r3yI0/d40iPngr2IoSS
	 2vL2OvYiieio9Qr++bqLt2hxOLk0DW4Zd1DNQNJar0DYykdGHUTWMvO9NlAQv/ANtW
	 4eAdfxc14vgn+oOl9YqUDvpsIpOF7roPHYIS0qYCuGFjaCsrHdhESIPsRVyQW1Rdau
	 X5NWhGPJKcG03lXcLnmBLvwI6ylVB7J/I1AvOryxnrLpnATCTOGyZwRGIkeYOCakYc
	 zPHQrURDG7GqiA10aDhKwXsNBBeLEhouRRGdJuiBN6b00HpIJobpV6ixmuTAvlCP9X
	 2/hBU5vQ86pFQ==
Date: Wed, 8 May 2024 18:12:11 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [linux-next:master 10159/12060]
 arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of
 function 'pud_valid'; did you mean 'pmd_valid'?
Message-ID: <20240508171211.GB23294@willie-the-truck>
References: <202405082221.43rfWxz5-lkp@intel.com>
 <10cd4b97-d780-4524-a0ee-89f26a7897fc@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10cd4b97-d780-4524-a0ee-89f26a7897fc@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hey Ryan,

On Wed, May 08, 2024 at 04:38:01PM +0100, Ryan Roberts wrote:
> On 08/05/2024 15:24, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   e7b4ef8fffaca247809337bb78daceb406659f2d
> > commit: f0f5863a0fb0fb48a5881c3f6acca1958899dd76 [10159/12060] arm64/mm: Remove PTE_PROT_NONE bit
> > config: arm64-randconfig-r013-20230528 (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405082221.43rfWxz5-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202405082221.43rfWxz5-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from include/linux/pgtable.h:6,
> >                     from arch/arm64/include/asm/io.h:12,
> >                     from include/linux/io.h:13,
> >                     from include/linux/irq.h:20,
> >                     from include/asm-generic/hardirq.h:17,
> >                     from arch/arm64/include/asm/hardirq.h:17,
> >                     from include/linux/hardirq.h:11,
> >                     from include/linux/interrupt.h:11,
> >                     from include/linux/trace_recursion.h:5,
> >                     from include/linux/ftrace.h:10,
> >                     from arch/arm64/kernel/asm-offsets.c:12:
> >    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
> >>> arch/arm64/include/asm/pgtable.h:1102:16: error: implicit declaration of function 'pud_valid'; did you mean 'pmd_valid'? [-Werror=implicit-function-declaration]
> >     1102 |         return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_exec(pud));
> >          |                ^~~~~~~~~
> >          |                pmd_valid
> 
> Hi Will,
> 
> Looks like this is due to pud_valid() not being defined for
> CONFIG_PGTABLE_LEVELS <= 2. Seems to me that this is the cleanest solution. But
> pgtable folding breaks my brain so perhaps there is a better way?

I think your approach is the right idea. pgtable-nopmd.h defines
pud_present() as 'return 1', but I think pud_valid() can be false given
that it's only used directly by the arch code.

> What's the process here? Can you just merge this into the broken patch, or do I
> need to re-post the series, or post a fix patch formally?

for-next/mm is stable, so please just submit proper patches on top of
that (and you can add a Fixes: tag as well).

Cheers,

Will
