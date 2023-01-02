Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081284430
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jan 2023 14:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bD4y8bf80A638y4hJRoS4kuUlmIk2huGo61VnT4vhJQ=; b=LJl1/BaQAz62q/ZEt1OX2ARjtZ
	qUGwD5fgIzMN250+wS8PAqCNfYwN67dURszJGdoxk7wOyojoIFzLOom99wRTM7wSBvnx56VzMEIf8
	eAAcIRUxd6pYeHPK9BTN52djehot8W58VViY9HPmf86HNRpdpALcF0lirpNj9EHaEBoMzlY54bZXZ
	IT0GH7UHYl00c9Qi9ITwVqapOKQLPqqom6s6r1kWysRHUXoXTQQderLMhb2mVv1xy6OheZ65myog/
	ext8byf2P/6nlhAagsPQBcgDYxUtlh2YR43sCcekRevJY04hV0+fMo6A2QyE5yIycCIE+JDcQV9B4
	k2jiXHDQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCMET-00DF2b-Fs; Mon, 02 Jan 2023 14:56:09 +0000
Date: Mon, 2 Jan 2023 14:56:09 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Josh Triplett <josh@joshtriplett.org>
Subject: Re: [lkp] [+132 bytes kernel size regression] [i386-tinyconfig]
 [522fc24c0c] mm: Convert page_remove_rmap() to use a folio internally
Message-ID: <Y7Lwibh29S6uUPTs@casper.infradead.org>
References: <20221231214610.2800682-6-willy@infradead.org>
 <Y7DgZtOPrmNMS0oR@42f7f79a36c2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7DgZtOPrmNMS0oR@42f7f79a36c2>

On Sun, Jan 01, 2023 at 09:22:46AM +0800, kernel test robot wrote:
> FYI, we noticed a +132 bytes kernel size regression due to commit:

I feared this might happen, based on the comment.

OK, I'm going to make this change for v2:

-       } else if (folio_test_large(folio)) {
+       } else if (folio_test_pmd_mappable(folio)) {

and keep noodling on how to handle mapcounts for folios which are
neither PMD nor PTE sized.  It won't change anything today; we still
assume that folios mapped with a PMD are exactly PMD-sized and that
PTEs can map a page in a folio of any size.

> +-----------------------+----------+----------+-------+
> |        symbol         | 0c14feef | 522fc24c | delta |
> +-----------------------+----------+----------+-------+
> | bzImage               | 495744   | 495904   | 160   |
> | nm.T.page_remove_rmap | 117      | 249      | 132   |
> +-----------------------+----------+----------+-------+

I get slightly different sizes, 403 bytes without the
folio_test_pmd_mappable change, down to 121 bytes with it.
But we're clearly in the right area.


I'm not going to send v2 (with this change, its corresponding change
in other functions, and the kernel-doc fix) until people have had a
chance to respond to the naming changes.
