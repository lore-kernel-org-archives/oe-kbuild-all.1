Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AE12F4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 05:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758433830; cv=none; b=Bmvk8gHgjzD17THf4VoG8WKPPsWXQhKDfbFvwz1Oin/4+1SpG5RiReOph5+k0q79Ez/yfbNBV2W7E09YSXph86uxmx84i4L8rpNe4dOvXsmUKpBpDczDXucYitVHpIquvkJiHoxc6HguCg43VQJqihKVK33M2Tm6jkJQwKOl8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758433830; c=relaxed/simple;
	bh=TSVC8N2GodlaKAQaAY5OOOC/Kc/9NpEegQNC+DqLKYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzgLCxYvQucGgRv7Oym7iTUbQ9iS00jsC57SnfGZ6lAOo1V4zab9LljWHRdFGoSl4obaBzNZciSfeoV3Gml4PbkSOGtPHytHXQfmVBTcgjdZIwF1OB7lgNEKqgUWtfY7aSLH/y5Dp8mEGkRL2AaaQIPCN6TeJaHDzzOEKqAT1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhwVuUvB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhwVuUvB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5598C4CEE7;
	Sun, 21 Sep 2025 05:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758433828;
	bh=TSVC8N2GodlaKAQaAY5OOOC/Kc/9NpEegQNC+DqLKYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhwVuUvBiheXc/46XR2qLZt3+NU4gqqsYQzJ0kPwoNmLt2MUhemSYYpJi5H7W5jhI
	 T1Y1QFv7sinCoGcvt4N85QZJ/hCJDJ4Yg+MkBXCsmXmlNk3LucB6ToAWwhD/UoGfOJ
	 F+EjsZLdEC39g5u+oQnl4DjexZmKCIMu0CPKGgMv1ysKh7bBZyXLxE0xxsQSLabkjT
	 NPJ8DcbKFskOLinPCkUYRbJRWnUVkiRBvgtLduEgKzham5yyeXvORONG5g2WgPqPYn
	 /u5znp1HQR2saKtV/UCAuOznvTOYXHxG4913A/OySHOKWGdCeL7EXXpPhWbKW55Jet
	 kX925caNnEtjQ==
Date: Sun, 21 Sep 2025 08:50:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [akpm-mm:mm-everything 254/254] kernel/kexec_handover.c:970:50:
 error: passing argument 1 of 'kho_restore_page' makes integer from pointer
 without a cast
Message-ID: <aM-SHRBIwCI5LnXJ@kernel.org>
References: <202509191034.SM82Oaij-lkp@intel.com>
 <20250919140419.211ec45cae8a479d1e347453@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919140419.211ec45cae8a479d1e347453@linux-foundation.org>

On Fri, Sep 19, 2025 at 02:04:19PM -0700, Andrew Morton wrote:
> On Fri, 19 Sep 2025 10:37:27 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > head:   46735c0743fed990d0ed8722a131ef54006c45a3
> > commit: 5369505b204b3fc65f839f7558640b6ecd675461 [254/254] foo
> > config: x86_64-randconfig-071-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191034.SM82Oaij-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191034.SM82Oaij-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202509191034.SM82Oaij-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    kernel/kexec_handover.c: In function 'kho_restore_vmalloc':
> > >> kernel/kexec_handover.c:970:50: error: passing argument 1 of 'kho_restore_page' makes integer from pointer without a cast [-Wint-conversion]
> >      970 |                                 kho_restore_page(page, 0);
> >          |                                                  ^~~~
> >          |                                                  |
> >          |                                                  struct page *
> >    kernel/kexec_handover.c:229:50: note: expected 'phys_addr_t' {aka 'long long unsigned int'} but argument is of type 'struct page *'
> 
> Added by "kho: add support for preserving vmalloc allocations".
> 
> I wonder how this happened - was the correct version sent out?

There is a conflict between "kho: make sure page being restored is actually
from KHO" and KHO vmalloc series. 

I've sent v5 of KHO vmalloc on top of last week's mm-new, it takes care of
the conflict:

https://lore.kernel.org/linux-mm/20250921054458.4043761-1-rppt@kernel.org
 
> How about this?

This fixes the build but won't work :)
 
> --- a/kernel/kexec_handover.c~kho-add-support-for-preserving-vmalloc-allocations-fix
> +++ a/kernel/kexec_handover.c
> @@ -967,7 +967,7 @@ void *kho_restore_vmalloc(const struct k
>  
>  			for (int j = 0; j < (1 << order); j++) {
>  				page = phys_to_page(phys);
> -				kho_restore_page(page, 0);
> +				kho_restore_page(phys);
>  				pages[idx++] = page;
>  				phys += PAGE_SIZE;
>  			}
> @@ -975,7 +975,7 @@ void *kho_restore_vmalloc(const struct k
>  
>  		page = virt_to_page(chunk);
>  		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
> -		kho_restore_page(page, 0);
> +		kho_restore_page(page_to_phys(page));
>  		__free_page(page);
>  	}
>  
> _
> 

-- 
Sincerely yours,
Mike.
