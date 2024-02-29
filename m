Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4325F16FF47
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709246990; cv=none; b=kYK7zW/aod5Ua5vayyTaOwzloHQXuQmeAlIbcKDSj8L0ZebZcFOxCNFDiK/6CyoKhdDq3AtiJcqDHuovpm/8IUnVaEz0XkwrKIZIy8bWibx7FJoyaps9KwLnt4XeCzp/JmI8NCmuV9ML7ezSKJoeSFxannkwBy85LZA9LO/6lV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709246990; c=relaxed/simple;
	bh=wKh4WJDuu+cHiftZVTrqopfOEHL1ES286MfTNzKpego=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvoJrw6u4FKeAkkPQdZ2ul6A73OGRnC20GZTmyqtiGhZVTm7QFex8v0egg+m4mp0oRp9cpbzGhcCYNcXM/DrRW6xwf/DcCaMwzEpI/l59QUWNU59yLLeZ+1vjlrtl97e09TogxqZ7e22nErZfT1rugZdgkUrDgyg7aJtyLPDjkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QHBkBQ6K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QHBkBQ6K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tvxx0XOl167OXKPfhPr4+olP60H4CwQ7OYSe4HZ4wsQ=; b=QHBkBQ6Ks/cdK25nZcmlB66hVU
	g+kIgbw24PsRfQJVqTEL/OgGvEM9l0X8pTe3XQ9DVZ7WBULwEq9VCIRpG0pqX99/agSqapxnuKxLD
	HaTnntfOgVJfbU6DdmiXYIbCncsZdTPOdvDT8EGvCxgNv55XwCL4t3NMEdkIWJGTiK0iKl55k2yQk
	Ec5WlW5UOrfUg7naJGozPS2+ql4XmrnQqQfPrcEiZLi9CALg7x9Su9SL4Ahlllwu9TozrdRQz/Exm
	FKrnEj1S7egYxOo/8cRDviSP7qteVZYkPxyD6HU9WrH3YHpD9z9lGWAHwiGdapKLZu8SsRRXMt1or
	ID+TT4Ow==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpDk-00000009FiU-24k9;
	Thu, 29 Feb 2024 22:49:44 +0000
Date: Thu, 29 Feb 2024 22:49:44 +0000
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 10835/11156]
 include/asm-generic/pgtable-nop4d.h:11:33: error: 'PGDIR_SHIFT' undeclared;
 did you mean 'PUD_SHIFT'?
Message-ID: <ZeEKCIcqiFaOuXgQ@casper.infradead.org>
References: <202403010621.qsTLLsab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403010621.qsTLLsab-lkp@intel.com>

On Fri, Mar 01, 2024 at 06:46:29AM +0800, kernel test robot wrote:
>    mm/debug.c: In function '__dump_page':
> >> include/asm-generic/pgtable-nop4d.h:11:33: error: 'PGDIR_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
>       11 | #define P4D_SHIFT               PGDIR_SHIFT
>          |                                 ^~~~~~~~~~~

Thanks; already reported, fixed and merged.  Try tomorrow's linux-next.
