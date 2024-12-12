Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0974F13AA20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970207; cv=none; b=DO3sORt338iQbdSErsiPg5wcaJduQGtNcxesLviS4ITf8gauEVNgNNsEYzsCPb5yD1c/x5WUgvXx/CG9JTWBBphEzun5wPfdMC1bccvQfG4Ic72o6qCrDnSPMNJPkCLhWGmScd6S248kOePXn0usb29pj2CZp9OeAXJ2nt6aGLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970207; c=relaxed/simple;
	bh=pv7XFaPCkr86mLoprfmRja/s5C2ZHxNd0l9UsrPsVGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/Gu9/HoY9IKKmW9HdMk57B0CFguvCZZVs33Em+n2borAtNN7rJHUcCHP59vIyVZZktv2XnV4gTtOK1LIhy5sdZsN/Z0va2BwoSC50li6t2DcvThYDdiLQeR0lrQy1x40z1miN7PdIzb+Pd21GW8PIQos1BnAV+VDZG/QK4pseQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qQ6XQZku; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qQ6XQZku"
Message-ID: <4069a4f1-41cd-7911-0996-db29357acdbc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733970200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GERvYWNxD6skZwQyuz6rGPA8mYQ6Q2SelCnBg87m34s=;
	b=qQ6XQZkuYTaknVzyB5O3igvIQFQlaiUzlhaX5+/MA39EXMAKrA2gGmPlWmWbLKvd9uolrJ
	0tkdp6YjFJORQcvZpb8C3k9xYAOHVz6i7kI+Ce6cNaPgc500C+ghu9D1H87JfTlDQr/16O
	jlq6s9UKAj410m4cH+xnWh2t4bdL/Ns=
Date: Thu, 12 Dec 2024 10:23:14 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3] mm/alloc_tag: Fix panic when CONFIG_KASAN enabled and
 CONFIG_KASAN_VMALLOC not enabled
To: kernel test robot <lkp@intel.com>, surenb@google.com,
 kent.overstreet@linux.dev, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hao Ge <gehao@kylinos.cn>,
 Ben Greear <greearb@candelatech.com>
References: <20241211025755.56173-1-hao.ge@linux.dev>
 <202412120143.l3g6vx8b-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <202412120143.l3g6vx8b-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi


Thanks for you report.

This version has been deprecated, and a new V4 version has been released.


On 12/12/24 01:18, kernel test robot wrote:
> Hi Hao,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Ge/mm-alloc_tag-Fix-panic-when-CONFIG_KASAN-enabled-and-CONFIG_KASAN_VMALLOC-not-enabled/20241211-110206
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20241211025755.56173-1-hao.ge%40linux.dev
> patch subject: [PATCH v3] mm/alloc_tag: Fix panic when CONFIG_KASAN enabled and CONFIG_KASAN_VMALLOC not enabled
> config: i386-buildonly-randconfig-005-20241211 (https://download.01.org/0day-ci/archive/20241212/202412120143.l3g6vx8b-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120143.l3g6vx8b-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412120143.l3g6vx8b-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     lib/alloc_tag.c: In function 'vm_module_tags_populate':
>>> lib/alloc_tag.c:409:40: error: 'KASAN_SHADOW_SCALE_SHIFT' undeclared (first use in this function)
>       409 |                                  (2 << KASAN_SHADOW_SCALE_SHIFT) - 1) >> KASAN_SHADOW_SCALE_SHIFT;
>           |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
>     lib/alloc_tag.c:409:40: note: each undeclared identifier is reported only once for each function it appears in
>
>
> vim +/KASAN_SHADOW_SCALE_SHIFT +409 lib/alloc_tag.c
>
>     402	
>     403	static int vm_module_tags_populate(void)
>     404	{
>     405		unsigned long phys_end = ALIGN_DOWN(module_tags.start_addr, PAGE_SIZE) +
>     406					 (vm_module_tags->nr_pages << PAGE_SHIFT);
>     407		unsigned long new_end = module_tags.start_addr + module_tags.size;
>     408		unsigned long phys_idx = (vm_module_tags->nr_pages +
>   > 409					 (2 << KASAN_SHADOW_SCALE_SHIFT) - 1) >> KASAN_SHADOW_SCALE_SHIFT;
>     410		unsigned long new_idx = 0;
>     411	
>     412		if (phys_end < new_end) {
>     413			struct page **next_page = vm_module_tags->pages + vm_module_tags->nr_pages;
>     414			unsigned long more_pages;
>     415			unsigned long nr;
>     416	
>     417			more_pages = ALIGN(new_end - phys_end, PAGE_SIZE) >> PAGE_SHIFT;
>     418			nr = alloc_pages_bulk_array_node(GFP_KERNEL | __GFP_NOWARN,
>     419							 NUMA_NO_NODE, more_pages, next_page);
>     420			if (nr < more_pages ||
>     421			    vmap_pages_range(phys_end, phys_end + (nr << PAGE_SHIFT), PAGE_KERNEL,
>     422					     next_page, PAGE_SHIFT) < 0) {
>     423				/* Clean up and error out */
>     424				for (int i = 0; i < nr; i++)
>     425					__free_page(next_page[i]);
>     426				return -ENOMEM;
>     427			}
>     428	
>     429			vm_module_tags->nr_pages += nr;
>     430	
>     431			new_idx = (vm_module_tags->nr_pages +
>     432				  (2 << KASAN_SHADOW_SCALE_SHIFT) - 1) >> KASAN_SHADOW_SCALE_SHIFT;
>     433	
>     434			/*
>     435			 * Kasan allocates 1 byte of shadow for every 8 bytes of data.
>     436			 * When kasan_alloc_module_shadow allocates shadow memory,
>     437			 * its unit of allocation is a page.
>     438			 * Therefore, here we need to align to MODULE_ALIGN.
>     439			 *
>     440			 * For every KASAN_SHADOW_SCALE_SHIFT, a shadow page is allocated.
>     441			 * So, we determine whether to allocate based on whether the
>     442			 * number of pages falls within the scope of the same KASAN_SHADOW_SCALE_SHIFT.
>     443			 */
>     444			if (phys_idx != new_idx)
>     445				kasan_alloc_module_shadow((void *)round_up(phys_end, MODULE_ALIGN),
>     446							  (new_idx - phys_idx) * MODULE_ALIGN,
>     447							  GFP_KERNEL);
>     448		}
>     449	
>     450		/*
>     451		 * Mark the pages as accessible, now that they are mapped.
>     452		 * With hardware tag-based KASAN, marking is skipped for
>     453		 * non-VM_ALLOC mappings, see __kasan_unpoison_vmalloc().
>     454		 */
>     455		kasan_unpoison_vmalloc((void *)module_tags.start_addr,
>     456					new_end - module_tags.start_addr,
>     457					KASAN_VMALLOC_PROT_NORMAL);
>     458	
>     459		return 0;
>     460	}
>     461	
>
