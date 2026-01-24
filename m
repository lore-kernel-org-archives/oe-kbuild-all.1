Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0757B199920
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 01:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769219321; cv=none; b=FJBVARxkM5ZhbA+siasja87HO0zmVJ+eQtiOaDSc66ExvzYq9MAGYaT4lnocnQpEKuWJxVaF9yi/aRj60k2bW9JAo1YgYJaMfUuaxvz1LVTH2h/DudOEa59W2CyR6UDXEf3lq4TddSWsomnnITNjlJDe1MKcJ39dCgf0kS/TZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769219321; c=relaxed/simple;
	bh=V3nyLtphVfg3N5nwJVecZUSLXvGyG9wxZ+ReIMY5twE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TAjRXK1UyH04uW2VhGdOjdsKWWTg/YzSmTBNuUlZe7Ot4S61WMHUvzxJ3FHU8gXzues2dS+CS0vsKEm1QRr4CUej0B4NCdXt/BvuAfijy148ccEj+/CYcERGGnMQx/v+VfTFcZeQAMpJlpS8d5A9minHRkrqlq7+cRByw+y+wpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y0t3pJmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y0t3pJmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533D3C4CEF1;
	Sat, 24 Jan 2026 01:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769219320;
	bh=V3nyLtphVfg3N5nwJVecZUSLXvGyG9wxZ+ReIMY5twE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y0t3pJmWFIHF7VLWFwRLcrt6lGQL3U+GzNT51l0sQBkCP90h23udunLzMez0AdOi0
	 KOri+eIZc5MnXYXT0cPvLVqtLSfQpglJBXJk6dZjz6N08fotkc5XHJF6VWB+rma2eW
	 mCVoCxgEGYgKE4MDXBfHo9LGq1C7Lfvo8qdILMq8=
Date: Fri, 23 Jan 2026 17:48:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Raghavendra K T
 <raghavendra.kt@amd.com>
Subject: Re: [linux-next:master 7919/9290]
 include/linux/compiler_types.h:631:38: error: call to
 '__compiletime_assert_639' declared with attribute error: clamp() low limit
 pg.start greater than high limit pg.end
Message-Id: <20260123174839.334fa31ce9ee6633d471aecb@linux-foundation.org>
In-Reply-To: <87y0lnewjn.fsf@oracle.com>
References: <202601240453.QCjgGdJa-lkp@intel.com>
	<87y0lnewjn.fsf@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Jan 2026 15:31:08 -0800 Ankur Arora <ankur.a.arora@oracle.com> wrote:

> 
> kernel test robot <lkp@intel.com> writes:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > commit: 93552c9a3350fff06543da18e4c80d3e804191ca [7919/9290] mm: folio_zero_user: cache neighbouring pages
> > config: riscv-randconfig-002-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240453.QCjgGdJa-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240453.QCjgGdJa-lkp@intel.com/reproduce)
> 
> Oddly enough I'm unable to reproduce this with:
>    ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- make O=build_dir/ W=1 mm/

I couldn't.  gcc-15.2.0.

> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601240453.QCjgGdJa-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/mm.h:18,
> >                     from arch/riscv/include/asm/sections.h:9,
> >                     from include/linux/interrupt.h:22,
> >                     from include/linux/kernel_stat.h:8,
> >                     from mm/memory.c:42:
> >    mm/memory.c: In function 'folio_zero_user':
> >>> include/linux/compiler_types.h:631:38: error: call to '__compiletime_assert_639' declared with attribute error: clamp() low limit pg.start greater than high limit pg.end
> 
> I'm a bit puzzled by this assert.
> 
> folio_zero_user():
>    {
> 	const unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
> 	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
> 	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
> 	const int radius = FOLIO_ZERO_LOCALITY_RADIUS;
> 	struct range r[3];
> 	int i;
> 
> 	/*
> 	 * Faulting page and its immediate neighbourhood. Will be cleared at the
> 	 * end to keep its cachelines hot.
> 	 */
> 	r[2] = DEFINE_RANGE(clamp_t(s64, fault_idx - radius, pg.start, pg.end),
> 			    clamp_t(s64, fault_idx + radius, pg.start, pg.end));

This line expands to 2846 bytes of C.  The clamp()y functions are asking a lot
of the compiler - their development was drama-filled.

If we want to work around this (and I guess we should) then simply
open-coding these operations would be a good approach?
