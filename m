Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63C2868B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394345; cv=none; b=FWp0JDowPP4IN1yc+EtU090fEmFmHV4Cl5tHGMdaCUHbGe+mDbm/YfzyOJ1WNH8s9nCFB1rzEfJkcHg76iNTHsXEnLN34zdFb/DQkpxPJPwhJSudUodjZ7ZgZ+T80a/Gf3e7qdgl4UL7mT+hBPm/T1v8B2mb4/VOfTj56dW2nZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394345; c=relaxed/simple;
	bh=tj/kdr8wlxOfWSKm75R1BNNXJbnbmo771IOdR00jaco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9osVXDFdyHJ1xizCJqe2t7fitvZjgCeydU+C1PMAKwzyfSiTu393xkYTynopMyKPYolwbtMyC198ze14pq4BAqGnjy7fOPmknEy5Q7YvAoYp4item1Zt2FcV6TzI+ZR6mLKcotcp94kJopCe8gZ34lbvgSrw6cjsPoLj3j/YRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLnlna23; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLnlna23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E4EC19423;
	Mon, 17 Nov 2025 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763394345;
	bh=tj/kdr8wlxOfWSKm75R1BNNXJbnbmo771IOdR00jaco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLnlna23QmguzEOWiKyg2KqCqmDk+FtWeTCjEBhwlAkH3Yc57igyJLWRG8xWPb45z
	 eOyyfDa6qENLdeCm1yl4vzvFN3/cdATdy5dHYOovQrW0L2NJIdjqVthayQJSQzJeJq
	 b41Ca1Ua+IPapZBX4+v2nhAeBiXnt50QBvs66gYFswEzI4e2jXubzR7OUurh7Fi3Df
	 +FuL7KEgh2j9lUl39isgKIM3Bnb0jRRaL987kSydNoRHRC5/MMlFGAILA8n+TN0e6h
	 N1rhIjIsATNbSkjUsphnZd/x8kSEVUBK7aEoewAssjF6X9FSLi4jj7AXcB57C7oDhM
	 OwQ2lySAGspVg==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8868/9360] arch/m68k/include/asm/page.h:20:27: error: lvalue required as unary '&' operand
Date: Mon, 17 Nov 2025 07:45:35 -0800
Message-ID: <20251117154536.11143-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202511172257.CjElDcRX-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Nov 2025 22:29:37 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0c1c7a6a83feaf2cf182c52983ffe330ffb50280
> commit: f54f0efb9d91fa2eee95a7eb29d0051f2176df47 [8868/9360] mm/damon/vaddr: cleanup using pmd_trans_huge_lock()
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251117/202511172257.CjElDcRX-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511172257.CjElDcRX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511172257.CjElDcRX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/m68k/include/asm/thread_info.h:6,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/m68k/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/wait.h:9,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:7,
>                     from include/linux/highmem.h:5,
>                     from mm/damon/vaddr.c:10:
>    mm/damon/vaddr.c: In function 'damon_mkold_pmd_entry':
> >> arch/m68k/include/asm/page.h:20:27: error: lvalue required as unary '&' operand
>       20 | #define pmd_val(x)      ((&x)->pmd)
>          |                           ^
>    arch/m68k/include/asm/motorola_pgtable.h:116:34: note: in expansion of macro 'pmd_val'
>      116 | #define pmd_present(pmd)        (pmd_val(pmd) & _PAGE_TABLE)
>          |                                  ^~~~~~~
>    mm/damon/vaddr.c:314:21: note: in expansion of macro 'pmd_present'
>      314 |                 if (pmd_present(pmdp_get(pmd)))
>          |                     ^~~~~~~~~~~

Thank you for the report!  I just sent a fix:
https://lore.kernel.org/20251117154415.11041-1-sj@kernel.org


Thanks,
SJ

[...]
