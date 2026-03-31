Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325AD3E9F8B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946987; cv=none; b=F3+e+y5aFB25n7S9WPE6ZGTQ/2SzRTfz/Az96IXK/xdN+osqgS/ylzdH/27/ulAeaDSapFSt97qPArWzmZpQl/hCCPgBb1zjiZs1WQjbA8H9G1t1Glm9RGTjSTk20ME2MAkCzWGA7O7SoPNRqbgU/01WwpdEK8m3zkYuAx8EcQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946987; c=relaxed/simple;
	bh=RUfjO2HGvlW/ipK9lfju7SLDWBnyMJE2wNqvku9mcBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggv6/UvEBLdHgkK4w5gUw9RahM5SXacjXQzPvJynuLY/eiaF9Xh92H6EfJY92tdIdoU5JybAxUuNBXUhlgux4OyK9468xA3YWja9LL75W4d/pnUb0vA8hbGWCIq5Qwbu8A6KqXZP459X80zQmtWTVvO6JnjgST7OUDAF9Mjshkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZZk/NHNk; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZZk/NHNk"
Message-ID: <f1973455-6af0-448f-b657-274bbf64146b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774946983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ylwj5m6FghjB84mXTKNcHoRC2MN8ceAn6QL5hBDySUA=;
	b=ZZk/NHNk047P/vzjYveNrefMrYGdRud2b9vPCbkuxQN3D9DrSIjFOUUbzBTRsDW+pVUQlS
	prWk41QkBO89u5vWeoIKpNJfWcbuqivwxHTYn7KLlOk4VTNVpExSEx4hKTh45WaO8x27rf
	3b/j4t9xeVn1G08coiCsGW7ief9H56A=
Date: Tue, 31 Mar 2026 16:48:58 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [akpm-mm:mm-new 193/194] lib/alloc_tag.c:815:25: sparse: sparse:
 cast removes address space '__rcu' of expression
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202603291211.YhY0R0se-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <202603291211.YhY0R0se-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi


On 2026/3/29 12:36, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   df2267b6380964f1305128001f05bc043ddf1f37
> commit: 8bee7b4b574f880ff2c7491212e2ef01cd82f2fd [193/194] mm/alloc_tag: clear codetag for pages allocated before page_ext initialization
> config: openrisc-randconfig-r121-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291211.YhY0R0se-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 10.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291211.YhY0R0se-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603291211.YhY0R0se-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> lib/alloc_tag.c:815:25: sparse: sparse: cast removes address space '__rcu' of expression
>>> lib/alloc_tag.c:815:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     lib/alloc_tag.c:815:25: sparse:    void ( [noderef] __rcu * )( ... )
>     lib/alloc_tag.c:815:25: sparse:    void ( * )( ... )
>     lib/alloc_tag.c:828:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     lib/alloc_tag.c:828:9: sparse:    void ( [noderef] __rcu * )( ... )
>     lib/alloc_tag.c:828:9: sparse:    void ( * )( ... )
>
> vim +/__rcu +815 lib/alloc_tag.c
>
>     802	
>     803	typedef void (*alloc_tag_add_func)(unsigned long pfn);
>     804	static alloc_tag_add_func __rcu alloc_tag_add_early_pfn_ptr __refdata =
>     805			__alloc_tag_add_early_pfn;
>     806	
>     807	void alloc_tag_add_early_pfn(unsigned long pfn)
>     808	{
>     809		alloc_tag_add_func alloc_tag_add;
>     810	
>     811		if (static_key_enabled(&mem_profiling_compressed))
>     812			return;
>     813	
>     814		rcu_read_lock();
>   > 815		alloc_tag_add = rcu_dereference(alloc_tag_add_early_pfn_ptr);
>     816		if (alloc_tag_add)
>     817			alloc_tag_add(pfn);
>     818		rcu_read_unlock();
>     819	}
>     820	
>
Thanks.

The v4 patch I've just posted has fixed the issue. Thanks for your report.


Thanks

Hao


