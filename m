Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F1C314D19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419924; cv=none; b=pwaYSubcmNLudMXxl7iRLvyF2m5HFl+l/BDDdINimVHAyNhyE3sCzLdu/PNC+vEYhhayD8/HPoD8tMkUEouVhblWoNEnPG08+Za20yHx/g+qyRlYNzLFYj1QACsM/rUf0nLusJsY3kGlJ7iTWLo2SnjdtWVvnfq1hhVnHyxlLDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419924; c=relaxed/simple;
	bh=ZsJ3ecwq9pLznx+VXyd4otowFYbw1bQJhRLNH/d6s+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REIKjASCjRneefp/i/KFVtRBqiZ+LY/CCGLJwDOjzbC3oouAPxQw2nwCN7aR47a3TEePQAtuGfujxia+8Wf54gIVwf1UIf4zFev90EyJkuvsJKPgq9rF8j7v73qXuxRER7m0Nnb5v5wD3XPTkp4omRYxZ4WCfssMKcqYBC2CCvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-18-697730ff2573
Date: Mon, 26 Jan 2026 18:16:42 +0900
From: Byungchul Park <byungchul@sk.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	kernel_team@skhynix.com
Subject: Re: [akpm-mm:mm-unstable /301] net/core/page_pool.c:713:71: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <20260126091642.GA62597@system.software.com>
References: <202601161606.8RuyUh2k-lkp@intel.com>
 <20260116151500.b56d0cc2525072123ad2d86d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116151500.b56d0cc2525072123ad2d86d@linux-foundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsXC9ZZnoe5/g/JMg8YTqhZz1q9hs5izahuj
	xfOtvxgt7q35z2rxqvkRm8WhlVeYLC4dfsTiwO6xc9Zddo/Fe14yeWxa1cnmsenTJHaPEzN+
	s3i82DyT0eP9vqtsAexRXDYpqTmZZalF+nYJXBmn7neyFlwUrvje28vewLhMoIuRk0NCwERi
	7q8Z7DD2vEMfmUBsFgFViSlLu8HibALqEjdu/GQGsUUEdCVWPd8FZHNxMAusYJLYv/svG4gj
	DDRO4sX+e0AOBwevgIXE7amhIA1CAkUSf95PYgGxeQUEJU7OfAJmMwtoSdz495IJpJxZQFpi
	+T8OEJNTwFviydJwkApRAWWJA9uOM4FMlxA4wCZx6PpcJog7JSUOrrjBMoFRYBaSqbOQTJ2F
	MHUBI/MqRqHMvLLcxMwcE72MyrzMCr3k/NxNjMCAX1b7J3oH46cLwYcYBTgYlXh4f5iVZQqx
	JpYVV+YeYpTgYFYS4eVfVpopxJuSWFmVWpQfX1Sak1p8iFGag0VJnNfoW3mKkEB6Yklqdmpq
	QWoRTJaJg1OqgdFiVs7t+1s+f/d/tsXi1yylrU2bJF+def/sSuFtqx2Tbe5rnY39z2wZwlUy
	q7eYpyFCWc7+x/N1osL3GKTZHh2fr7Dij/CP4JdvLMuznq588/+nf1biMr4vr3ct0la/cH6f
	zbf2lTeX7Q3R6vPhbXncIrF42qElE4R1EiceXO9ad2pOxQ2zw6t5lFiKMxINtZiLihMBMNsw
	nXQCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsXC5WfdrPvfoDzT4PgTcYs569ewWcxZtY3R
	4vnWX4wWh+eeZLW4t+Y/q8Wr5kdsFodWXmGyuHT4EYsDh8fOWXfZPRbvecnksWlVJ5vHpk+T
	2D1OzPjN4vFi80xGj/f7rrJ5LH7xgSmAI4rLJiU1J7MstUjfLoEr49T9TtaCi8IV33t72RsY
	lwl0MXJySAiYSMw79JEJxGYRUJWYsrSbHcRmE1CXuHHjJzOILSKgK7Hq+S4gm4uDWWAFk8T+
	3X/ZQBxhoBESL/bfA3I4OHgFLCRuTw0FaRASKJL4834SC4jNKyAocXLmEzCbWUBL4sa/l0wg
	5cwC0hLL/3GAmJwC3hJPloaDVIgKKEsc2HacaQIj7ywkzbOQNM9CaF7AyLyKUSQzryw3MTPH
	VK84O6MyL7NCLzk/dxMjMHyX1f6ZuIPxy2X3Q4wCHIxKPLwf9MsyhVgTy4orcw8xSnAwK4nw
	8i8rzRTiTUmsrEotyo8vKs1JLT7EKM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpg7Kj8
	lt1i+df/0wKF9/WOD/dKRu96aP1dNnHGup2XvJ9OW5Jeknrt+caDFxaHme8yzDoXUfKAp3rB
	seN9cjW2yw5dEOBdO6fvdJP0006xQnarzJB5yckKd2yeLzno6W/FvmLdqyoTjxNOmiZrIheG
	Fa7eW/+8TDIymnXSc+uvcsKGIveUn9zxV2Ipzkg01GIuKk4EAH1IdQxbAgAA
X-CFilter-Loop: Reflected

On Fri, Jan 16, 2026 at 03:15:00PM -0800, Andrew Morton wrote:
> On Fri, 16 Jan 2026 16:41:32 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   fe2c34b6ea5a0e1175c30d59bc1c28caafb02c62
> > commit: 7699fe82442a62ea29a3745b29dbb8ef8c42d8db [/301] mm: introduce a new page type for page pool in page type
> > config: x86_64-randconfig-122-20260115 (https://download.01.org/0day-ci/archive/20260116/202601161606.8RuyUh2k-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161606.8RuyUh2k-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601161606.8RuyUh2k-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> > >> net/core/page_pool.c:713:71: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
> >    net/core/page_pool.c:713:71: sparse:     expected restricted netmem_ref [usertype] netmem
> >    net/core/page_pool.c:713:71: sparse:     got unsigned long
> >    net/core/page_pool.c:734:73: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted netmem_ref [usertype] netmem @@     got unsigned long @@
> >    net/core/page_pool.c:734:73: sparse:     expected restricted netmem_ref [usertype] netmem
> >    net/core/page_pool.c:734:73: sparse:     got unsigned long
> 
> Oh, OK.
> 
> Byungchul, please remind me why I'm carrying a page-pool patch?  I
> applied it because email headers and because Suggested-by:David, but
> these things are usually carried in the networking tree.

Sorry for late reply.  This patch changes both mm and network, but I
aimed at mm tree since I thought it's more about mm - Jakub also think
so.  See the following link:

  https://lore.kernel.org/all/20250813075212.051b5178@kernel.org/

> And I never applied [patch 2/2]
> (https://lkml.kernel.org/r/20251215071001.78263-3-byungchul@sk.com)
> because "kernel test robot" reported a build error.
> 
> In fact, I'll drop the patch - please let's have a redo.

Okay.  I will retry.  Thanks.

	Byungchul
