Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203822DAFBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793165; cv=none; b=S4lWrWlB/InvFNpuAb32VXn+SkZhbUPj1xMYQg5GYMxqBooYNUrPxGEYRRP/W/X+K+q1tPwnKiHdKfJSTARryayNh0IOS+gV2QQuPjw21bG2xcFlYSfIRBPgrBAYSl2jpMSRfCeJkwwF2m7dJhURQ0asgzTLVBOW37DMnTRGGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793165; c=relaxed/simple;
	bh=1QmruyZo3DKu0eWoZjVlLIS1lofS9SNdP9MW4v2BJPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AoH30HieqWSvNiR4aAxi2SrhiSdEZdFDEwZwPnUY/TlXWicFkOyjrfdTPdHYJqXAQOXj1sb8KoYGaXZCqLsB8gwWnZWktIk2H6UV4QQB0QAqNxJeY3vfBuwXAWgk2VCWSzeRp/twRmjVSPVXz8yJn+fl6Sb9ITEDEJ0mu61X1FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiZDOg5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiZDOg5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5423C4CEEB;
	Thu, 21 Aug 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755793164;
	bh=1QmruyZo3DKu0eWoZjVlLIS1lofS9SNdP9MW4v2BJPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OiZDOg5DCZOotIQ1qrB3ymxLpRQ1nTSlEa0a7kwnwwtcvUtivowpB6GodOP8XymS7
	 4oxf7aFl2oTTi9wKxzHLmjXeQGpYi0fJ6xQ8OyA1aTHo98gTUmG8UGdG0tPxS9zhqg
	 7sStSsp96QotS1iDrZlV3rGiTzyr4pY5GbE6o41XPG7k0LnTniZ4EVZvpYdwPYlOCR
	 m74IZP/AaqkgNDfpysFhPIiNrecTEQz28Uea0lqUOBccTT5CtjGa21wQ+7iE4NZpCK
	 cG9ZRhRUbm5HGpp8OG3QPCZyz3YvMlPk3kIjX+0DKCo4sBP3xYjcy2yBBCgeHwemtY
	 nMBy0IGZvuarw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3382/3950] mm/zswap.c:48:15: sparse: sparse: symbol 'zswap_stored_incompressible_pages' was not declared. Should it be static?
Date: Thu, 21 Aug 2025 09:19:22 -0700
Message-Id: <20250821161922.78301-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <202508211706.DnJPQQMn-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 21 Aug 2025 17:43:16 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
> commit: 6d522abd7b4fc78d51934e6c9a53d8e2349f5d3e [3382/3950] mm/zswap: store <PAGE_SIZE compression failed page as-is
> config: arc-randconfig-r123-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211706.DnJPQQMn-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 13.4.0
> reproduce: (https://download.01.org/0day-ci/archive/20250821/202508211706.DnJPQQMn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508211706.DnJPQQMn-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    mm/zswap.c: note: in included file (through arch/arc/include/asm/cacheflush.h, include/linux/cacheflush.h, include/linux/highmem.h):
>    include/linux/mm.h:80:9: sparse: sparse: preprocessor token PAGES_TO_MB redefined
>    mm/zswap.c: note: in included file (through arch/arc/include/asm/irqflags-compact.h, arch/arc/include/asm/irqflags.h, include/linux/irqflags.h, ...):
>    arch/arc/include/asm/arcregs.h:155:9: sparse: this was the original definition
> >> mm/zswap.c:48:15: sparse: sparse: symbol 'zswap_stored_incompressible_pages' was not declared. Should it be static?
>    mm/zswap.c:1250:23: sparse: sparse: context imbalance in 'shrink_memcg_cb' - unexpected unlock
> 
> vim +/zswap_stored_incompressible_pages +48 mm/zswap.c
> 
>     41	
>     42	/*********************************
>     43	* statistics
>     44	**********************************/
>     45	/* The number of pages currently stored in zswap */
>     46	atomic_long_t zswap_stored_pages = ATOMIC_LONG_INIT(0);
>     47	/* The number of incompressible pages currently stored in zswap */
>   > 48	atomic_long_t zswap_stored_incompressible_pages = ATOMIC_LONG_INIT(0);
>     49	

Thank you for this report!  I just sent a fixup patch:
https://lore.kernel.org/20250821161750.78192-1-sj@kernel.org


Thanks,
SJ

[...]
