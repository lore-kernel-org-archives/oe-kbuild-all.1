Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635B534678C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782929616; cv=none; b=qHnkZfqaYL8Mf9chOOEMO4JVJjFIp2EvN/yeLg7XGqzx4C4qMVmmfhf5nF74Splpq5Yerze0+9jcI5zJJOhUBlW/D+94PH7oduo+22cZNv2Dk/yyUdG5peBCwWUxILnCM64OrbqSFerLMAFMkTnX/F6xnUqhnt8U6bts1sTZkYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782929616; c=relaxed/simple;
	bh=kENG33NCYqRFtgGpxbyhnxfvmNcyJVkM6TQdLSzIq0s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O/r6YlbMxcyjDZfXGRatTjKsA5wVg/bN/uTkxSVglb5cNCQEi0Rdyla3YZmTlHowT3QsuI25KWQ1XFE4IfrKggVKY/zhzrtKk1hTPmVGuk2WYeHNiqLNHbitgX26jYD+XpMHw8hxbX1FuleUC5HPMSbwHIqzU5jEe7sNOEtFAWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zLLKqDIY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zLLKqDIY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE741F000E9;
	Wed,  1 Jul 2026 18:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782929614;
	bh=6dBPtCiZj++yQEUojIUaLLBbVlYTIXmcVSA7FgHeDUU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=zLLKqDIYXDyxhXphbCPWUqPhrV5BydL5HTFgSOGyh7g8SLlRFYJL5mf+3yTtyfhPG
	 DyGWkLQZs23gukUMBv3spfBiis3KFHMGySk/dpcPL666nCVS/fTWRKoMKvDJS93Fn3
	 9WMsiWgVI1qJfpP4YaJIVR+PKnzrvIF2qtryPaSs=
Date: Wed, 1 Jul 2026 11:13:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1977/2307] mm/hugetlb.c:3095:4: warning:
 array subscript -1 is below array bounds of 'struct list_head[1]'
Message-Id: <20260701111334.ea3759a839d3ada05e042b19@linux-foundation.org>
In-Reply-To: <CAMZfGtUtS_dqh4wNX9sAM01VaqCUMRDTxg+NgWYsRwrjp=CBWw@mail.gmail.com>
References: <202607010945.6lDjBFTU-lkp@intel.com>
	<CAMZfGtUtS_dqh4wNX9sAM01VaqCUMRDTxg+NgWYsRwrjp=CBWw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 1 Jul 2026 22:53:28 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> On Wed, Jul 1, 2026 at 9:37 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
> > commit: f48ee682d55e3602fcc194cb93b8398f2546e53f [1977/2307] mm/hugetlb: free cross-zone bootmem gigantic pages after allocation
> > config: sparc-randconfig-r131-20260701 (https://download.01.org/0day-ci/archive/20260701/202607010945.6lDjBFTU-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 8.5.0

Old compiler.

> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010945.6lDjBFTU-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607010945.6lDjBFTU-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
> > >> mm/hugetlb.c:3095:4: warning: array subscript -1 is below array bounds of 'struct list_head[1]' [-Warray-bounds]
> >        list_add(&m->list, &huge_boot_pages[nid_request]);
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> 
> It seems like a false positive?

I can't reproduce this with sparc gcc-15.2.0


