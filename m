Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE3249505F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 23:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059407; cv=none; b=Rha6hf2sbA45Dm4Mk+4y0+phW/OVYvGU+G/CC+0F3IcNS7DcGaAD8o2vy4IYI4/jwe155PWl0vzYqlex6695CQbmek5KyyEBN9zKvPxykd1NXeIqNQzd7lWMXYH1OxOQv3p8/mpVUUWC+4jZpztKMNwK8No8Qfl2Wkx4vBsTN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059407; c=relaxed/simple;
	bh=fD18s15brJd1C5jY08Kh3V6vxzwHfG7cBevGXTarszc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=WLv/UGhRPSQOpENv0mpEgFtG+JcQZrXDl038ARFA/9HFCF2/6kbNuB1wB7Kkwq4uykSEInSTPh0rM78ISLX8qSb2k38iqnS+i/IL4z9R6zo6hWGUMPFn3pizgyNJaZukWUGIY/FdW2TjU6rJ9HFqxvThYXetjmK3hPeWv25iXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mVvpszWi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mVvpszWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA8B1F01804;
	Thu,  6 Aug 2026 23:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786059404;
	bh=Xlao5rltnHCuX1s/4rsdC//1xkwI2J9Cedg4lygq0PU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mVvpszWigeAi3bm0gcCUV4dYWqqNbFHd8AH0g2PLIc72WYfOgfRWHftKmLt3TCETl
	 0KP7OuKSyk6vjAkI5SkaCSRJzlNPgkrOM0/ERoDMazZhsgcSV98zsEcKo23+1YxA0m
	 HGm+mOT/kO/wBFjzT4yrEbOSaNRgZgtjbKeKwCn8=
Date: Thu, 6 Aug 2026 16:36:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Muchun Song <songmuchun@bytedance.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 8777/13479] mm/hugetlb.c:3095:39: warning:
 array subscript 4294967295 is above array bounds of 'struct list_head[1]'
Message-Id: <20260806163644.20229f5ab7cbf176edbf2613@linux-foundation.org>
In-Reply-To: <202608070433.x3vNSfjt-lkp@intel.com>
References: <202608070433.x3vNSfjt-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 07 Aug 2026 05:01:04 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ea2bff00da89d7767d677bb68470130ba96f4928
> commit: 20549ccf4da49ff6dcb35ffc741f92aa92e07aeb [8777/13479] mm/hugetlb: free cross-zone bootmem gigantic pages after allocation
> config: parisc-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 8.5.0

Such an old compiler.

> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608070433.x3vNSfjt-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
> >> mm/hugetlb.c:3095:39: warning: array subscript 4294967295 is above array bounds of 'struct list_head[1]' [-Warray-bounds]
>        list_add(&m->list, &huge_boot_pages[nid_request]);
>                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>    In file included from mm/hugetlb.c:6:
> >> include/linux/list.h:163:12: warning: array subscript -1 is below array bounds of 'struct list_head[1]' [-Warray-bounds]
>      new->prev = prev;
>      ~~~~~~~~~~^~~~~~

Well crap, that patch has been in there since June 12.

I can't reproduce it with the provided config and hppa-linux gcc-16.1.0.

Muchun, I'd be inclined to pretend we never saw this.  But if you want
to address it, please do a patch against mm-stable with

Fixes: 20549ccf4da4 ("mm/hugetlb: free cross-zone bootmem gigantic pages after allocation")

