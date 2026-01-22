Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E7F33CEB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117017; cv=none; b=XhZLc5pJGDR/kil2UCvfaYqsUEsh2N+RoW+1pCYDB+OSSq+7QX5voyCpsiHpTfkUuz45UBFlTNarTWOVrDbhWq/DkEu6NAIvpnFvfwaPt4CtwXL37SGpQ9KJZGVQUcAd/vx97Ihy2TImpv/Z1FLFZeRvSVt1Bq3f9MOdZjOLG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117017; c=relaxed/simple;
	bh=jSgY5ZwEr3TZ//h6VeSmcz6HoWxw5sGkQ/chQWBHjLw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CIa4ZDdygFdpHdxHqCQUf2Mz1JvHoujgbGRDzwobYMh568h4F2xRTUWTZQiW4r7a2V/PFy61kgxjsOqYo7pnaHnLXNToNvabgVxmQPWnwbexXCqv3/LyKFoO7eTLPxbGMP+f6qoeChw7e8filnm8dIxDLZY3vATxBj5O3PywQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YE6jrEPK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YE6jrEPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3E3C116C6;
	Thu, 22 Jan 2026 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769117016;
	bh=jSgY5ZwEr3TZ//h6VeSmcz6HoWxw5sGkQ/chQWBHjLw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YE6jrEPKl4RAL4TzmBlLqe2nKox5hw1ncpUW19Ztk+DhB2aI9E3axKvJSuT6Q5AGt
	 BMeKNElGJJR3OXX8C/S0vuZiCH8UtKO6YiCNFIuNyjFRJXBlBKYbTVCz/qr0LYNFXO
	 WRQ8N1GUu3n9TknQ7WQ6BndbHRZkTxHm+TDpxm7g=
Date: Thu, 22 Jan 2026 13:23:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 420/429] fs/romfs/mmap-nommu.c:66:42: sparse:
 sparse: dereference of noderef expression
Message-Id: <20260122132335.5f3160dd20dfdb68c57ede35@linux-foundation.org>
In-Reply-To: <202601221505.RxftadLx-lkp@intel.com>
References: <202601221505.RxftadLx-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 16:04:37 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Lorenzo,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   dc4fe40a11269aead253fa0beb098b00417b8694
> commit: 57a654376d4bb67119d436edc8c3c4c0ecb3c369 [420/429] mm: update all remaining mmap_prepare users to use vma_flags_t
> config: sh-randconfig-r122-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/config)

Has CONFIG_NOMMU=y

> compiler: sh4-linux-gcc (GCC) 13.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221505.RxftadLx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221505.RxftadLx-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> fs/romfs/mmap-nommu.c:66:42: sparse: sparse: dereference of noderef expression

fs/romfs/Makefile has

ifneq ($(CONFIG_MMU),y)
romfs-$(CONFIG_ROMFS_ON_MTD) += mmap-nommu.o
endif

so why is mmap-nommu.o being compiled in this testing??
