Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA76E1FDD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 00:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757808389; cv=none; b=s7KQn5s8pti2UJAgOkUvJbjQcw3utmihMF5Cwulruy2W7qEHGU2zHbLIYdORZ0p1TKMOADkXYApo6YYW05R1+kVSerXOHh3T5XVnNxxnEZRPyMI2e+PAcq1uUP3e5y4bbhPo5uGnJMcVPlLWmlH2v8jNGnCeAJUDXGfDmtWyzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757808389; c=relaxed/simple;
	bh=ouYjPInHOlfRxlwFI4BxmFmkWpQ2zHtUxhVB1TGP/10=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Goti463Ob3wZwYPUOj9KIWLFe0RmTOU5291of2+Aa+a5lOYMGefQI2NnNJJXyzEuPpws9Ci/zraByBWSWD5FEE5d5JC6iy6B6sQZfXofJZo1CIEvcjCigdc62LD7BKN7ULfBvGkWoXz3twKNQGE22xD2+jUmowuM/THse3IUiC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ANijnlqb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ANijnlqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16588C4CEEB;
	Sun, 14 Sep 2025 00:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757808389;
	bh=ouYjPInHOlfRxlwFI4BxmFmkWpQ2zHtUxhVB1TGP/10=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ANijnlqbF3kZ216A80p19N3GXncBRxeswY6ZgfMqOOs851s6H67Fkxcp7oLM1aO6H
	 uJ+qCk4CD19qDimwFNH3qyyum/QOZsGd0u0qBGW2GmJ9O2WTxtpc4lrRETYYYuyr1h
	 kAhi18OCxD+k4pdF4xazg4t+I5sgimC5ADY+Q1qM=
Date: Sat, 13 Sep 2025 17:06:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 39/428] include/linux/pgtable.h:235:36:
 error: expected expression before 'do'
Message-Id: <20250913170628.e76ed73413b58aef022aba3c@linux-foundation.org>
In-Reply-To: <b96ea27d-6e8a-40d9-8fa6-677cd8134363@nvidia.com>
References: <202509131255.x9EfvIGt-lkp@intel.com>
	<20250912230313.117341d5491a3145e7bcf311@linux-foundation.org>
	<b96ea27d-6e8a-40d9-8fa6-677cd8134363@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 14 Sep 2025 08:57:29 +1000 Balbir Singh <balbirs@nvidia.com> wrote:

> On 9/13/25 16:03, Andrew Morton wrote:
> > On Sat, 13 Sep 2025 12:53:27 +0800 kernel test robot <lkp@intel.com> wrote:
> > 
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> >> head:   8ded915c4409a5190b1c9c57c172d62ab5534274
> >> commit: f6748cc302fdca7c486c6098f315bd4174f5c614 [39/428] kasan: Fix warnings caused by use of arch_enter_lazy_mmu_mode()
> >> config: s390-randconfig-002-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/config)
> >> compiler: s390-linux-gcc (GCC) 8.5.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131255.x9EfvIGt-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202509131255.x9EfvIGt-lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    In file included from include/linux/kasan.h:37,
> >>                     from mm/kasan/shadow.c:14:
> >>    mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
> >>>> include/linux/pgtable.h:235:36: error: expected expression before 'do'
> >>     #define arch_enter_lazy_mmu_mode() do {} while (0)
> >>                                        ^~
> >>    mm/kasan/shadow.c:322:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
> >>      (void)arch_enter_lazy_mmu_mode();
> >>            ^~~~~~~~~~~~~~~~~~~~~~~~
> >>    mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
> >>>> include/linux/pgtable.h:235:36: error: expected expression before 'do'
> >>     #define arch_enter_lazy_mmu_mode() do {} while (0)
> >>                                     ^~
> > 
> > Huh, thanks.  Another reason why static inlines are better than macros.
> > 
> >>    mm/kasan/shadow.c:497:8: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
> >>      (void)arch_enter_lazy_mmu_mode();
> >>            ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > You can't do that with them!
> > 
> 
> [...]
> 
> AFAICT, The issue I saw and fixed only occurs on top of 
> 
> commit 116191f326bce79aefa0ed540caade5a55fbd33f
> Author: Kevin Brodsky <kevin.brodsky@arm.com>
> Date:   Mon Sep 8 08:39:26 2025 +0100
> 
>     mm: introduce local state for lazy_mmu sections
> 
> Which changes the definition of arch_*_lazy_mmu_mode
> 
> -#define arch_enter_lazy_mmu_mode()     do {} while (0)
> -#define arch_leave_lazy_mmu_mode()     do {} while (0)
> +typedef int lazy_mmu_state_t;
> +
> +#define arch_enter_lazy_mmu_mode()     (LAZY_MMU_DEFAULT)
> +#define arch_leave_lazy_mmu_mode(state)        ((void)(state))
> 

No, this error happens on maainline + this-patch


#define arch_enter_lazy_mmu_mode()	do {} while (0)

plus

	(void)arch_enter_lazy_mmu_mode();

expands to

	(void)do {} while (0)

which is nonsensical.



In fact let's do this:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: include/linux/pgtable.h: convert arch_enter_lazy_mmu_mode() and friends to static inlines
Date: Sat Sep 13 05:03:39 PM PDT 2025

For all the usual reasons, plus a new one.  Calling

	(void)arch_enter_lazy_mmu_mode();

deservedly blows up.

Cc: Balbir Singh <balbirs@nvidia.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/pgtable.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/include/linux/pgtable.h~include-linux-pgtableh-convert-arch_enter_lazy_mmu_mode-and-friends-to-static-inlines
+++ a/include/linux/pgtable.h
@@ -232,9 +232,9 @@ static inline int pmd_dirty(pmd_t pmd)
  * and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-#define arch_enter_lazy_mmu_mode()	do {} while (0)
-#define arch_leave_lazy_mmu_mode()	do {} while (0)
-#define arch_flush_lazy_mmu_mode()	do {} while (0)
+static inline void arch_enter_lazy_mmu_mode(void) {}
+static inline void arch_leave_lazy_mmu_mode(void) {}
+static inline void arch_flush_lazy_mmu_mode(void) {}
 #endif
 
 #ifndef pte_batch_hint
_

