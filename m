Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA50E22F1C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 19:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518377; cv=none; b=Nb1On7HIN2vJwWvk6dmWkyaNQxgw5QB8QHmAzZ6Yss2pwK9hm21DXNGl5WiMibHFIknKIqG2u5u8dDQw+7E6AjSVZCkAKe9+jm9niVNsD4dzkflwJGNXRRGMJsDit3JOLk7OnJdBhWdUdpuiuTPkDSRMIYKobEDdrlp91ZZgbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518377; c=relaxed/simple;
	bh=3z165P0PXQq8QGPP1ffXeo3HZ7sQi3bxyPW8nz/fd7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjOFo14GHmzZWNz3DSVZ45OfaVD6tWLO/1/Ge9srbjhAGO98IyvLZUFbQnVG1SqLYFNQhJy7GgEHAibEePLMSzovzOpxVJQGQftDM6qHSP8SxxnPFCM1WvHamvcbZx6egeyGZpuGrBQFz/fxKrfzOoq3iX87FWAX2l3qQOzhweg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPbF9Upu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPbF9Upu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719518376; x=1751054376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3z165P0PXQq8QGPP1ffXeo3HZ7sQi3bxyPW8nz/fd7g=;
  b=iPbF9UpuVnoRqYz0E0ZRu/S+EKzO6uINXnYY2l1sgdVfW2n/k0SHqnTo
   MigKQ3s4q6VadP/VegD291MtW7aeIbZo4J2JnrfpE86wPibhmaCXepzM1
   +Gv092ymCTaYNIS9UreL0tVfxhd+P+a2iedvClLUOGI1D/ocOwNTgQo0M
   TSd9gVPdfe/yUwsCvfGIVraBQRkKSAxBR7SwhJPyHHOm+8mTF8DF2Vni+
   0P4F2ZcwR8f8FTtW7mNiJqR7OfmYu57ru+sw4CNSbPGYPoeFJSTTPb6QN
   uDXR4uth+iKJRDNFA/YV+O4ZaErnB9cj/4IjjyQmUP1DcsXc0KRMZZQ1W
   A==;
X-CSE-ConnectionGUID: +xNSbUF/RcykOKnl/xTwyw==
X-CSE-MsgGUID: D3M2q6YgQC6GUicodyTQsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16498171"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16498171"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 12:59:36 -0700
X-CSE-ConnectionGUID: bvoQ2NTiQuC1WXL9mUacPQ==
X-CSE-MsgGUID: FSNI026cTPSECSKwoi+KBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="75699645"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2024 12:59:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMvHF-000GUu-0E;
	Thu, 27 Jun 2024 19:59:29 +0000
Date: Fri, 28 Jun 2024 03:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Wilcox <willy@infradead.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Shakeel Butt <shakeelb@google.com>, Nhat Pham <nphamcs@gmail.com>,
	Michal Hocko <mhocko@suse.com>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>, Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@intel.com>,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH 7/7] mm/list_lru: Simplify the list_lru walk callback
 function
Message-ID: <202406280355.Qwjjjiug-lkp@intel.com>
References: <20240624175313.47329-8-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624175313.47329-8-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on staging/staging-testing staging/staging-next staging/staging-linus xfs-linux/for-next linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-workingset-make-anon-workingset-nodes-memcg-aware/20240625-231015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240624175313.47329-8-ryncsn%40gmail.com
patch subject: [PATCH 7/7] mm/list_lru: Simplify the list_lru walk callback function
config: i386-buildonly-randconfig-001-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280355.Qwjjjiug-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280355.Qwjjjiug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280355.Qwjjjiug-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder_alloc.c:1060: warning: Function parameter or struct member 'lru' not described in 'binder_alloc_free_page'
>> drivers/android/binder_alloc.c:1060: warning: Excess function parameter 'lock' description in 'binder_alloc_free_page'


vim +1060 drivers/android/binder_alloc.c

0c972a05cde66e Todd Kjos         2017-06-29  1046  
f2517eb76f1f2f Sherry Yang       2017-08-23  1047  /**
f2517eb76f1f2f Sherry Yang       2017-08-23  1048   * binder_alloc_free_page() - shrinker callback to free pages
f2517eb76f1f2f Sherry Yang       2017-08-23  1049   * @item:   item to free
f2517eb76f1f2f Sherry Yang       2017-08-23  1050   * @lock:   lock protecting the item
f2517eb76f1f2f Sherry Yang       2017-08-23  1051   * @cb_arg: callback argument
f2517eb76f1f2f Sherry Yang       2017-08-23  1052   *
f2517eb76f1f2f Sherry Yang       2017-08-23  1053   * Called from list_lru_walk() in binder_shrink_scan() to free
f2517eb76f1f2f Sherry Yang       2017-08-23  1054   * up pages when the system is under memory pressure.
f2517eb76f1f2f Sherry Yang       2017-08-23  1055   */
f2517eb76f1f2f Sherry Yang       2017-08-23  1056  enum lru_status binder_alloc_free_page(struct list_head *item,
f2517eb76f1f2f Sherry Yang       2017-08-23  1057  				       struct list_lru_one *lru,
f2517eb76f1f2f Sherry Yang       2017-08-23  1058  				       void *cb_arg)
5672291f7d5dc5 Kairui Song       2024-06-25  1059  	__must_hold(&lru->lock)
f2517eb76f1f2f Sherry Yang       2017-08-23 @1060  {
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1061  	struct binder_lru_page *page = container_of(item, typeof(*page), lru);
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1062  	struct binder_alloc *alloc = page->alloc;
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1063  	struct mm_struct *mm = alloc->mm;
a1b2289cef92ef Sherry Yang       2017-10-03  1064  	struct vm_area_struct *vma;
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1065  	struct page *page_to_free;
df9aabead791d7 Carlos Llamas     2023-12-01  1066  	unsigned long page_addr;
f2517eb76f1f2f Sherry Yang       2017-08-23  1067  	size_t index;
f2517eb76f1f2f Sherry Yang       2017-08-23  1068  
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1069  	if (!mmget_not_zero(mm))
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1070  		goto err_mmget;
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1071  	if (!mmap_read_trylock(mm))
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1072  		goto err_mmap_read_lock_failed;
7710e2cca32e7f Carlos Llamas     2023-12-01  1073  	if (!spin_trylock(&alloc->lock))
7710e2cca32e7f Carlos Llamas     2023-12-01  1074  		goto err_get_alloc_lock_failed;
f2517eb76f1f2f Sherry Yang       2017-08-23  1075  	if (!page->page_ptr)
f2517eb76f1f2f Sherry Yang       2017-08-23  1076  		goto err_page_already_freed;
f2517eb76f1f2f Sherry Yang       2017-08-23  1077  
f2517eb76f1f2f Sherry Yang       2017-08-23  1078  	index = page - alloc->pages;
df9aabead791d7 Carlos Llamas     2023-12-01  1079  	page_addr = alloc->buffer + index * PAGE_SIZE;
5cec2d2e5839f9 Todd Kjos         2019-03-01  1080  
3f489c2067c582 Carlos Llamas     2023-12-01  1081  	vma = vma_lookup(mm, page_addr);
3f489c2067c582 Carlos Llamas     2023-12-01  1082  	if (vma && vma != binder_alloc_get_vma(alloc))
3f489c2067c582 Carlos Llamas     2023-12-01  1083  		goto err_invalid_vma;
a1b2289cef92ef Sherry Yang       2017-10-03  1084  
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1085  	trace_binder_unmap_kernel_start(alloc, index);
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1086  
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1087  	page_to_free = page->page_ptr;
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1088  	page->page_ptr = NULL;
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1089  
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1090  	trace_binder_unmap_kernel_end(alloc, index);
a1b2289cef92ef Sherry Yang       2017-10-03  1091  
a1b2289cef92ef Sherry Yang       2017-10-03  1092  	list_lru_isolate(lru, item);
7710e2cca32e7f Carlos Llamas     2023-12-01  1093  	spin_unlock(&alloc->lock);
5672291f7d5dc5 Kairui Song       2024-06-25  1094  	spin_unlock(&lru->lock);
f2517eb76f1f2f Sherry Yang       2017-08-23  1095  
a1b2289cef92ef Sherry Yang       2017-10-03  1096  	if (vma) {
e41e164c3cdff6 Sherry Yang       2017-08-23  1097  		trace_binder_unmap_user_start(alloc, index);
e41e164c3cdff6 Sherry Yang       2017-08-23  1098  
e9adcfecf572fc Mike Kravetz      2023-01-03  1099  		zap_page_range_single(vma, page_addr, PAGE_SIZE, NULL);
f2517eb76f1f2f Sherry Yang       2017-08-23  1100  
e41e164c3cdff6 Sherry Yang       2017-08-23  1101  		trace_binder_unmap_user_end(alloc, index);
f2517eb76f1f2f Sherry Yang       2017-08-23  1102  	}
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1103  
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  1104  	mmap_read_unlock(mm);
f867c771f98891 Tetsuo Handa      2020-07-17  1105  	mmput_async(mm);
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1106  	__free_page(page_to_free);
e41e164c3cdff6 Sherry Yang       2017-08-23  1107  
a1b2289cef92ef Sherry Yang       2017-10-03  1108  	return LRU_REMOVED_RETRY;
f2517eb76f1f2f Sherry Yang       2017-08-23  1109  
3f489c2067c582 Carlos Llamas     2023-12-01  1110  err_invalid_vma:
e50f4e6cc9bfac Carlos Llamas     2023-12-01  1111  err_page_already_freed:
7710e2cca32e7f Carlos Llamas     2023-12-01  1112  	spin_unlock(&alloc->lock);
7710e2cca32e7f Carlos Llamas     2023-12-01  1113  err_get_alloc_lock_failed:
3f489c2067c582 Carlos Llamas     2023-12-01  1114  	mmap_read_unlock(mm);
3e4e28c5a8f01e Michel Lespinasse 2020-06-08  1115  err_mmap_read_lock_failed:
a1b2289cef92ef Sherry Yang       2017-10-03  1116  	mmput_async(mm);
a0c2baaf81bd53 Sherry Yang       2017-10-20  1117  err_mmget:
f2517eb76f1f2f Sherry Yang       2017-08-23  1118  	return LRU_SKIP;
f2517eb76f1f2f Sherry Yang       2017-08-23  1119  }
f2517eb76f1f2f Sherry Yang       2017-08-23  1120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
