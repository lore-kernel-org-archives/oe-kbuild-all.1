Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0A286D7D;
	Sat, 11 Apr 2026 23:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775950631; cv=none; b=i8Dee+iNCZiGkD5wtTpmlxxELZMvPjrIGexhlZwTDBxdFpX1jTX+Waraax0dKP4l+DAloPBbA3SBnpseNa/rWx9cn0azWwbf5yBKjFNr4p0EGdC2E7IAQkV8C/5WEF+nA6P3NlXaoncsfAF74Ove2sc9ux0iZfMiCPaPL24cuPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775950631; c=relaxed/simple;
	bh=nVczTSsN/22a28ZgYVxVpViA5PatvMEOe+CWY5jZnYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMwUvFA62IhrlkQNKtKpuw7JWWDe2ygiu+Lb+l4A7jj6uDX/zprGVQL8RxVIUJ60TB5pK2nu2eeTjMgjEvcle7eHlQLeIjZWLxKbB9kLRgJBpYOu9S3acE+2Ul3KopmtFWPG8OkuQe79sDlBFHzM6H8vbZMMSaUZE2glvbBWATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Sg4VpRv1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Sg4VpRv1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jiJiQQBziS3d2HhMyYgZrgdeGQO+fTDyGzxTqqDYNGU=; b=Sg4VpRv1n72iEneLXUBZ//+ukB
	ratDaxEZoXyXjWCg2Mm0Pd7ZwSFaUthJrem1ZavrDbH3vOAgLOJ3P3seoYTO4pBVZHf4fSAHMMf69
	DgZ+nv6MQxHXDHD/oKQyfhn0FMuUsFw6g1HD+OBLtoKZMAvcs1nS/7VJsvdd4ubkq4y1+7swjbsXr
	DRUU7MTLbKhzu9rczSVJVcrl/fGdO9ekafxOmUX+dHop1oUyXmxjxFYwWYv/r8b5oyNaUTE6oXMcy
	bKytxXALF1yk9Y5kFSvE1YW40ztifnfd5SP7HMeZQ9AV10PeFDx53AsHEGcbW7dEfri02NoYTnQku
	+sqX+Apg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhsy-0000000Dt2Y-47HU;
	Sat, 11 Apr 2026 23:37:09 +0000
Message-ID: <ade1ca53-3137-4441-8389-145ba77ab765@infradead.org>
Date: Sat, 11 Apr 2026 16:37:08 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bvanassche:thread-safety 95/95] htmldocs:
 Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error
 in declarator or parameters
To: kernel test robot <lkp@intel.com>, Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202604120025.jtlnpWff-lkp@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202604120025.jtlnpWff-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/11/26 3:24 PM, kernel test robot wrote:
> tree:   https://github.com/bvanassche/linux thread-safety
> head:   834588da5a3bc2696586cdc98024dcebec97aeed
> commit: 834588da5a3bc2696586cdc98024dcebec97aeed [95/95] treewide: Build fixes
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260412/202604120025.jtlnpWff-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604120025.jtlnpWff-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Runtime Survivability
>    ===================== [docutils]
>    WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
>    WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
>>> Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error in declarator or parameters
>    Invalid C declaration: Expecting "," or ")" in parameters, got "_". [error at 55]
>    void clear_user_pages (void *addr, unsigned long vaddr __maybe_unused, struct page *page, unsigned int npages)
>    -------------------------------------------------------^
>    Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.
> 

Patch for allowing __maybe_unused is here:
https://lore.kernel.org/linux-doc/20260411233526.3909303-1-rdunlap@infradead.org/T/#u

-- 
~Randy

