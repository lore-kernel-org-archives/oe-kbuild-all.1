Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0350E186284
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 00:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761437018; cv=none; b=If8ozdRaYIhv373LmgsKrsu+5EjWisjTgrNG2WPaVXSjuPx4H+pU6k1nduu9dN3qbSX3apiFHiGbyCDVfLl5H1rCGhMgB8pmtcBrFIGEG2Z39fI+S2Ro0It9kDqnsU6ay/HPZEsd/AlsqB8n/4CYKcpyKiJeSZcRbNsK5LLitCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761437018; c=relaxed/simple;
	bh=qjil+McBNRBHW+rdqa2Qf2obUOow2o73ABEpawIdCfA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bhnGP2TLuZRrwSVTEwc6s2YhfFG/4AtYXhZf2wF8FRx1vzeMRvhtHyUEf3mWE/I03z7D5Am0TLOHERz2l/9T7Jwx8q73UYsYpHNRydAvAg5kJFbbKD7Cx8TmqHjpwAF3944V+tlByIJipNcJL1VoKk7Hs8lXJ8C10ulRN9GSnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZftjGyc5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZftjGyc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4814BC4CEFF;
	Sun, 26 Oct 2025 00:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1761437017;
	bh=qjil+McBNRBHW+rdqa2Qf2obUOow2o73ABEpawIdCfA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZftjGyc5odtP0LBCbfeSJaCAejLYaDXvXvS8tjaQj9xywRPs4q/0c/GdiOV/pbcFD
	 XOTTvoqP0N/CyxCXZ3nOYbySCbI3fAoIarjIjZon+GG4zMoRGpyu4fUqYLia2JRjQa
	 k4BRa0LR2A12REokbNGlxx260I6QYeoxRAsJ7UFE=
Date: Sat, 25 Oct 2025 17:03:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Nico Pache <npache@redhat.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 173/182] mm/khugepaged.c:113:25: error:
 variably modified 'mthp_bitmap' at file scope
Message-Id: <20251025170336.f0c72983aa63f58c66e2aa2e@linux-foundation.org>
In-Reply-To: <202510251530.eJulmicR-lkp@intel.com>
References: <202510251530.eJulmicR-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Oct 2025 15:14:10 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   752c460b5865d87117095c915addcce7a68296f2
> commit: 8387af7962dd62a2a2cdb741e702b476da440ff0 [173/182] khugepaged: introduce mTHP collapse support
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251025/202510251530.eJulmicR-lkp@intel.com/config)

Yes, this config is troublesome.

> compiler: powerpc64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251530.eJulmicR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510251530.eJulmicR-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/kasan-checks.h:5,
>                     from include/asm-generic/rwonce.h:26,
>                     from ./arch/powerpc/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:382,
>                     from include/asm-generic/bug.h:5,
>                     from arch/powerpc/include/asm/bug.h:116,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:6,
>                     from mm/khugepaged.c:4:
> >> mm/khugepaged.c:113:25: error: variably modified 'mthp_bitmap' at file scope
>      113 |          DECLARE_BITMAP(mthp_bitmap, HPAGE_PMD_NR);

And "khugepaged: introduce collapse_max_ptes_none helper function"
causes this:

: In file included from <command-line>:
: In function 'collapse_max_ptes_none',
:     inlined from '__collapse_huge_page_isolate' at mm/khugepaged.c:582:22:
: ././include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_784' declared with attribute error: min(khugepaged_max_ptes_none, (1<<((16 + __pte_index_size)-16))/2 - 1) signedness error
:   597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
:       |                                             ^
: ././include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
:   578 |                         prefix ## suffix();                             \
:       |                         ^~~~~~
: ././include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
:   597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
:       |         ^~~~~~~~~~~~~~~~~~~
: ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
:    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
:       |                                     ^~~~~~~~~~~~~~~~~~
: ./include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
:    93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
:       |         ^~~~~~~~~~~~~~~~
: ./include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
:    98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
:       |         ^~~~~~~~~~~~~~~~~~
: ./include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
:   105 | #define min(x, y)       __careful_cmp(min, x, y)
:       |                         ^~~~~~~~~~~~~
: mm/khugepaged.c:489:25: note: in expansion of macro 'min'
:   489 |         max_ptes_none = min(khugepaged_max_ptes_none, HPAGE_PMD_NR/2 - 1);
:       |                         ^~~

I'll remove the v12 series from mm-new.  Nico, TODOs for v13 please.
