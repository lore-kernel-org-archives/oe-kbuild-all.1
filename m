Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996212A144
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711565360; cv=none; b=ZBUnHbIvrD7R/ANg91YZ2CbpaulgY1Cdm7uIbc8I0eS3I30xvpGP90fb06eWcqVJ9rTdtWEjVq1XVQt1QGOFvyVvgx7MxiGko7YlLcTlkS8DC8TQpeod0yF9hTNXHwvDlMhDC4OuvQ3Eqx8eAytYcOp3Eqvr31aF07uD2OKbuPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711565360; c=relaxed/simple;
	bh=6s2tquqUoJyNrRsmTHLJ9A48EiGn92QjGjd4o1hQ1d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G21PyLS5v3o1vsnh/8EeAsnyjyFBhTC4l8LKq1+ib1WKXXZNozpJRD8pPeasybGmO+AfAwgKS9ucDipw3k6+WwmAUJ5hkqN2Y2arYfGm1j2sRHnn9R8kSOKkl2y5J+Pq3g8EpbHg2MxsFNhgkdxD11PAkMAKfNloE/Ix0vZVbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=m96KfBO8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="m96KfBO8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I5rjtzcDRpyOmKqlEWfmNps8v+bzbaS6zBGRmLDCmv0=; b=m96KfBO8iLj6Ch71jQq+jeZO+u
	JUF5rVjM2sJoQlQ2lWgNJy07R/T5lgNPhXV2pIks7/ldO2WIk9kbdajVp8IMSpqwwqVytESGB0g9d
	Y9oXBApuspOhJ/3QFosEaQ1JZivU7a4C5yQnS5HhveEmRIGI+dBiJcJLKKtRQ2FSKORLauuytd9ob
	vcZqqFhRe6tVL6gIiLlo7xMEQf10ZgBAeYh7MphxZS4KOjE86ajFVxtrFcy8TtBUj8Jh8fZULdO98
	V08o7oMHe8UHCfuET7pk991lKkXfO9dw267dcP/GlbMCM8cFGDYr/hVk0PpRPl+eFh/HtOeI+wqr5
	WqgmeSQA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpYKq-00000004V86-10SD;
	Wed, 27 Mar 2024 18:49:16 +0000
Date: Wed, 27 Mar 2024 18:49:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 01/10] sh: Remove use of PG_arch_1 on individual pages
Message-ID: <ZgRqLDP7yVCT2dnh@casper.infradead.org>
References: <20240326171045.410737-2-willy@infradead.org>
 <202403280209.6eW34UZ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403280209.6eW34UZ5-lkp@intel.com>

On Thu, Mar 28, 2024 at 02:45:40AM +0800, kernel test robot wrote:
> Hi Matthew,
> 
> kernel test robot noticed the following build errors:

Guess who doesn't actually build for sh4 because it's a dead
architecture?

Andrew, please include this fixup:

diff --git a/arch/sh/mm/cache-sh4.c b/arch/sh/mm/cache-sh4.c
index cea8f1693908..9a1e581cd192 100644
--- a/arch/sh/mm/cache-sh4.c
+++ b/arch/sh/mm/cache-sh4.c
@@ -247,7 +247,7 @@ static void sh4_flush_cache_page(void *args)
 		 * another ASID than the current one.
 		 */
 		map_coherent = (current_cpu_data.dcache.n_aliases &&
-			test_bit(PG_dcache_clean, folio_flags(folio)) &&
+			test_bit(PG_dcache_clean, folio_flags(folio, 0)) &&
 			page_mapped(page));
 		if (map_coherent)
 			vaddr = kmap_coherent(page, address);
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 5001d1b6c46d..1a17d03b2fa5 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -836,7 +836,7 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 #define is_hugepage_only_range is_hugepage_only_range
 #endif
 
-#ifndef arch_clear_hugepage_flags
+#ifndef arch_clear_hugetlb_flags
 static inline void arch_clear_hugetlb_flags(struct folio *folio) { }
 #define arch_clear_hugetlb_flags arch_clear_hugetlb_flags
 #endif
