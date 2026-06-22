Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD13B0AE8;
	Mon, 22 Jun 2026 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136322; cv=none; b=FMgu1ArB4gtYFUyBVUVv1ZFjg2ql8+UNteRxLVp0Voj7PQuVqRfZomrq+SCDqHH6ydREq8NrvgmX9RsHofGynIEGyl7Lf4D4bPrTp/1ut++9+3Q9llPCJlZmSoGypC2q9kqIHhQBMuBdhIkYG66flYDX9Br1wCQCdGOfCfFOLEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136322; c=relaxed/simple;
	bh=gaw6StFLYo8TtGFOf4oWEfzuiQeY0pOjYb3h9/76yHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5G2pPL2DshbfTciZN485uQJK5SKfp0sdZAszMcQXRqZqPnTYv/cBs2S/7Qe/REWX02xPjsKsCAnp954Ak6jaPG/06Xrek6rcofztqS7ztWoDf5CjOCYUEBlDERFsqdIlSW4RvUPZcQEFE0Y1iwFkQ+By/7vmOLH7fNeTEEYSx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKIj/76l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKIj/76l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46E51F000E9;
	Mon, 22 Jun 2026 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782136321;
	bh=+5Tf1aK8g+ZKENypXzO/+sigvN9tcOrY12gLHfs9mT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XKIj/76lzwCjYTe0OCB1syC6OIZS4opDFHSpcAOShdAxVLbcMoHwHT24XI0JGh4ht
	 hvtpOdPC9EWhEH+9VaFoW1ZCZ1rxVPEVOuy3ytIwwUE28r5vrV17ZH05Ehu6ikN5Is
	 fbOQwnKJVik1ypbS0twm6A0g4YKmfvFkcZL2qWKV8x0NK1USdldjnv4fvvqxUMMZI/
	 XTrk7R5NsMU+45i2Xf6zbnyIpa16r0CMmD14eEzVYliiLF1uJnGLOq/zj6Ck9T2Kxv
	 XcdQGZ/3zoptUGQbndRGBXw6rskmhVidDxoKf+N3+VXXnKjHRvUzkuLsSipkF0dQVu
	 JsFQUVhOsZmRA==
Date: Mon, 22 Jun 2026 14:51:56 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/mprotect.c:700:43: sparse: sparse: cast to non-scalar
Message-ID: <ajk9RsbGcMjFIpxL@lucifer>
References: <202606221720.CGRCyQ8e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606221720.CGRCyQ8e-lkp@intel.com>

On Mon, Jun 22, 2026 at 06:02:20PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ef0c9f75a19532d7675384708fc8621e10850104
> commit: 3a6455d56bd7c4cfb1ea35ddae052943065e338e mm: convert do_brk_flags() to use vma_flags_t
> date:   3 months ago
> config: alpha-randconfig-r111-20260618 (https://download.01.org/0day-ci/archive/20260622/202606221720.CGRCyQ8e-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 10.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221720.CGRCyQ8e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 3a6455d56bd7 ("mm: convert do_brk_flags() to use vma_flags_t")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606221720.CGRCyQ8e-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> mm/mprotect.c:700:43: sparse: sparse: cast to non-scalar
> >> mm/mprotect.c:700:43: sparse: sparse: cast from non-scalar
>    mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
>    arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast to non-scalar
>    arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast from non-scalar
>    arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast to non-scalar
>    arch/alpha/include/asm/pgtable.h:272:21: sparse: sparse: cast from non-scalar
>    mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
>    include/linux/pgtable.h:475:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:475:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:468:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:468:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast to non-scalar
>    include/linux/pgtable.h:461:16: sparse: sparse: cast from non-scalar
>
> vim +700 mm/mprotect.c
>
>    693
>    694	int
>    695	mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>    696		       struct vm_area_struct *vma, struct vm_area_struct **pprev,
>    697		       unsigned long start, unsigned long end, vm_flags_t newflags)
>    698	{
>    699		struct mm_struct *mm = vma->vm_mm;
>  > 700		const vma_flags_t old_vma_flags = READ_ONCE(vma->flags);

Ah yeah... this works right now but is actually sketchy, as we need to copy not assign.

Will come up with a fix for this, but I think it needn't be backported as this
all works correctly right now.

Thanks, Lorenzo
