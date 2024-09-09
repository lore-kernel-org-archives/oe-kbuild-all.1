Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66895125A9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725897692; cv=none; b=buXslCrrO9whISBgu24I3124YxR73bbJ7GT0cJMj1LC/dswiFzRTmnuIU3t5gyNuhK5IvQiKLxa/qk4U+DyvJD0BVAlELFtspPiB7w9LYDVE7hJohcoP9kT8G/B/byc0c2nhgY5NSj/xDNvrJfLtlWYWvTP8KeLRbDTG1x/2jSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725897692; c=relaxed/simple;
	bh=P7wnM+uyMXb8c82sKUcpv4VkiuN8a/daUI90eDYSALQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8bo5XwMNdZkUe4HvAzNtAf56RqzdhAPX2pWxyNrg/uVHY44sK5k+cVagVjpwjrJEamCp6Hnnd4PV7+DnVsKdLhFx2ZD5TYY9AClcaujST52otgwA2TukxUc54gJvfo9DGdA8B6dpA3Hz8odY35ELvNmGUrjUFzTZ9mHFzkPby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsjJHh2i; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsjJHh2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725897690; x=1757433690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7wnM+uyMXb8c82sKUcpv4VkiuN8a/daUI90eDYSALQ=;
  b=LsjJHh2i1POZdMjFnVJd5EYQrwl32TdEdMMQyOhRaeYC5LNk+dC41SBV
   U99/4f86mo+y41SiAvL3ueMVZ8L3UWMYMG6H95Yd9UOc1CXNowfXHf6S+
   r5DEvHGo0jQRHP8JtZ9+ADr/iHn15kocFogK96jlOHreysujvNOKRk6zX
   RfnReTyGj6VKxFxg0zlR3ktsUVXFKSXx8l1RiFs7lAcqxCQYSL65je0CP
   FnYMiUcNG8SeTqRvFBGhqc5Z8EO7VIhvxFTInCFSf2+bLWj0yPPZlZwAw
   +VfbVIf9n8XQUcpqinQ+iU6xvnIxH/xcbv4Gmo0WnxOcS9/tAm9YATQkj
   Q==;
X-CSE-ConnectionGUID: +t79J7PmQ7qo1o1Zr6yEGw==
X-CSE-MsgGUID: NP+6rXehT/O29yFubwyusg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42112705"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="42112705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:01:29 -0700
X-CSE-ConnectionGUID: 9TnlCdEgT2GNg58Oyq8Cqw==
X-CSE-MsgGUID: DVdaaoo4Ssu1F1AvqGmEXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="90001747"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2024 09:01:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sngpS-000Euw-14;
	Mon, 09 Sep 2024 16:01:26 +0000
Date: Tue, 10 Sep 2024 00:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 249/258] mm/jitalloc.c:46:35:
 error: initialization of 'void *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202409100005.1q6ceW6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 0dc0c36d5a2a19098aba0639a99b1574aec0f286 [249/258] bcachefs: switch to jitalloc
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240910/202409100005.1q6ceW6d-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100005.1q6ceW6d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100005.1q6ceW6d-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/jitalloc.c: In function 'jit_slab_alloc':
   mm/jitalloc.c:46:35: error: implicit declaration of function 'module_alloc' [-Wimplicit-function-declaration]
      46 |         void *executably_mapped = module_alloc(PAGE_SIZE);
         |                                   ^~~~~~~~~~~~
>> mm/jitalloc.c:46:35: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   mm/jitalloc.c: In function 'jit_update':
>> mm/jitalloc.c:106:9: error: implicit declaration of function 'text_poke_copy'; did you mean 'text_poke_sync'? [-Wimplicit-function-declaration]
     106 |         text_poke_copy(buf, new_buf, len);
         |         ^~~~~~~~~~~~~~
         |         text_poke_sync
   mm/jitalloc.c: In function 'jit_alloc':
>> mm/jitalloc.c:162:19: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     162 |                 p = module_alloc(len);
         |                   ^


vim +46 mm/jitalloc.c

7a091cbeb2d972e Kent Overstreet 2023-05-17   35  
7a091cbeb2d972e Kent Overstreet 2023-05-17   36  #define folio_jit_slab(folio)		(_Generic((folio),			\
7a091cbeb2d972e Kent Overstreet 2023-05-17   37  	const struct folio *:		(const struct jit_slab *)(folio),	\
7a091cbeb2d972e Kent Overstreet 2023-05-17   38  	struct folio *:			(struct jit_slab *)(folio)))
7a091cbeb2d972e Kent Overstreet 2023-05-17   39  
7a091cbeb2d972e Kent Overstreet 2023-05-17   40  #define jit_slab_folio(s)		(_Generic((s),				\
7a091cbeb2d972e Kent Overstreet 2023-05-17   41  	const struct jit_slab *:	(const struct folio *)s,		\
7a091cbeb2d972e Kent Overstreet 2023-05-17   42  	struct jit_slab *:		(struct folio *)s))
7a091cbeb2d972e Kent Overstreet 2023-05-17   43  
7a091cbeb2d972e Kent Overstreet 2023-05-17   44  static struct jit_slab *jit_slab_alloc(struct jit_cache *cache)
7a091cbeb2d972e Kent Overstreet 2023-05-17   45  {
7a091cbeb2d972e Kent Overstreet 2023-05-17  @46  	void *executably_mapped = module_alloc(PAGE_SIZE);
7a091cbeb2d972e Kent Overstreet 2023-05-17   47  	struct page *page;
7a091cbeb2d972e Kent Overstreet 2023-05-17   48  	struct folio *folio;
7a091cbeb2d972e Kent Overstreet 2023-05-17   49  	struct jit_slab *slab;
7a091cbeb2d972e Kent Overstreet 2023-05-17   50  	unsigned long *objs_allocated;
7a091cbeb2d972e Kent Overstreet 2023-05-17   51  
7a091cbeb2d972e Kent Overstreet 2023-05-17   52  	if (!executably_mapped)
7a091cbeb2d972e Kent Overstreet 2023-05-17   53  		return NULL;
7a091cbeb2d972e Kent Overstreet 2023-05-17   54  
7a091cbeb2d972e Kent Overstreet 2023-05-17   55  	objs_allocated = kcalloc(BITS_TO_LONGS(cache->objs_per_slab), sizeof(unsigned long), GFP_KERNEL);
7a091cbeb2d972e Kent Overstreet 2023-05-17   56  	if (!objs_allocated ) {
7a091cbeb2d972e Kent Overstreet 2023-05-17   57  		vfree(executably_mapped);
7a091cbeb2d972e Kent Overstreet 2023-05-17   58  		return NULL;
7a091cbeb2d972e Kent Overstreet 2023-05-17   59  	}
7a091cbeb2d972e Kent Overstreet 2023-05-17   60  
7a091cbeb2d972e Kent Overstreet 2023-05-17   61  	set_vm_flush_reset_perms(executably_mapped);
7a091cbeb2d972e Kent Overstreet 2023-05-17   62  	set_memory_rox((unsigned long) executably_mapped, 1);
7a091cbeb2d972e Kent Overstreet 2023-05-17   63  
7a091cbeb2d972e Kent Overstreet 2023-05-17   64  	page = vmalloc_to_page(executably_mapped);
7a091cbeb2d972e Kent Overstreet 2023-05-17   65  	folio = page_folio(page);
7a091cbeb2d972e Kent Overstreet 2023-05-17   66  
7a091cbeb2d972e Kent Overstreet 2023-05-17   67  	__folio_set_slab(folio);
7a091cbeb2d972e Kent Overstreet 2023-05-17   68  	slab			= folio_jit_slab(folio);
7a091cbeb2d972e Kent Overstreet 2023-05-17   69  	slab->cache		= cache;
7a091cbeb2d972e Kent Overstreet 2023-05-17   70  	slab->executably_mapped	= executably_mapped;
7a091cbeb2d972e Kent Overstreet 2023-05-17   71  	slab->objs_allocated = objs_allocated;
7a091cbeb2d972e Kent Overstreet 2023-05-17   72  	INIT_LIST_HEAD(&slab->list);
7a091cbeb2d972e Kent Overstreet 2023-05-17   73  
7a091cbeb2d972e Kent Overstreet 2023-05-17   74  	return slab;
7a091cbeb2d972e Kent Overstreet 2023-05-17   75  }
7a091cbeb2d972e Kent Overstreet 2023-05-17   76  
7a091cbeb2d972e Kent Overstreet 2023-05-17   77  static void *jit_cache_alloc(void *buf, size_t len, struct jit_cache *cache)
7a091cbeb2d972e Kent Overstreet 2023-05-17   78  {
7a091cbeb2d972e Kent Overstreet 2023-05-17   79  	struct jit_slab *s =
7a091cbeb2d972e Kent Overstreet 2023-05-17   80  		list_first_entry_or_null(&cache->partial, struct jit_slab, list) ?:
7a091cbeb2d972e Kent Overstreet 2023-05-17   81  		jit_slab_alloc(cache);
7a091cbeb2d972e Kent Overstreet 2023-05-17   82  	unsigned obj_idx, nr_allocated;
7a091cbeb2d972e Kent Overstreet 2023-05-17   83  
7a091cbeb2d972e Kent Overstreet 2023-05-17   84  	if (!s)
7a091cbeb2d972e Kent Overstreet 2023-05-17   85  		return NULL;
7a091cbeb2d972e Kent Overstreet 2023-05-17   86  
7a091cbeb2d972e Kent Overstreet 2023-05-17   87  	obj_idx = find_first_zero_bit(s->objs_allocated, cache->objs_per_slab);
7a091cbeb2d972e Kent Overstreet 2023-05-17   88  
7a091cbeb2d972e Kent Overstreet 2023-05-17   89  	BUG_ON(obj_idx >= cache->objs_per_slab);
7a091cbeb2d972e Kent Overstreet 2023-05-17   90  	__set_bit(obj_idx, s->objs_allocated);
7a091cbeb2d972e Kent Overstreet 2023-05-17   91  
7a091cbeb2d972e Kent Overstreet 2023-05-17   92  	nr_allocated = bitmap_weight(s->objs_allocated, s->cache->objs_per_slab);
7a091cbeb2d972e Kent Overstreet 2023-05-17   93  
7a091cbeb2d972e Kent Overstreet 2023-05-17   94  	if (nr_allocated == s->cache->objs_per_slab) {
7a091cbeb2d972e Kent Overstreet 2023-05-17   95  		list_del_init(&s->list);
7a091cbeb2d972e Kent Overstreet 2023-05-17   96  	} else if (nr_allocated == 1) {
7a091cbeb2d972e Kent Overstreet 2023-05-17   97  		list_del(&s->list);
7a091cbeb2d972e Kent Overstreet 2023-05-17   98  		list_add(&s->list, &s->cache->partial);
7a091cbeb2d972e Kent Overstreet 2023-05-17   99  	}
7a091cbeb2d972e Kent Overstreet 2023-05-17  100  
7a091cbeb2d972e Kent Overstreet 2023-05-17  101  	return s->executably_mapped + (obj_idx << cache->obj_size_bits);
7a091cbeb2d972e Kent Overstreet 2023-05-17  102  }
7a091cbeb2d972e Kent Overstreet 2023-05-17  103  
7a091cbeb2d972e Kent Overstreet 2023-05-17  104  void jit_update(void *buf, void *new_buf, size_t len)
7a091cbeb2d972e Kent Overstreet 2023-05-17  105  {
7a091cbeb2d972e Kent Overstreet 2023-05-17 @106  	text_poke_copy(buf, new_buf, len);
7a091cbeb2d972e Kent Overstreet 2023-05-17  107  }
7a091cbeb2d972e Kent Overstreet 2023-05-17  108  EXPORT_SYMBOL_GPL(jit_update);
7a091cbeb2d972e Kent Overstreet 2023-05-17  109  
7a091cbeb2d972e Kent Overstreet 2023-05-17  110  void jit_free(void *buf)
7a091cbeb2d972e Kent Overstreet 2023-05-17  111  {
7a091cbeb2d972e Kent Overstreet 2023-05-17  112  	struct page *page;
7a091cbeb2d972e Kent Overstreet 2023-05-17  113  	struct folio *folio;
7a091cbeb2d972e Kent Overstreet 2023-05-17  114  	struct jit_slab *s;
7a091cbeb2d972e Kent Overstreet 2023-05-17  115  	unsigned obj_idx, nr_allocated;
7a091cbeb2d972e Kent Overstreet 2023-05-17  116  	size_t offset;
7a091cbeb2d972e Kent Overstreet 2023-05-17  117  
7a091cbeb2d972e Kent Overstreet 2023-05-17  118  	if (!buf)
7a091cbeb2d972e Kent Overstreet 2023-05-17  119  		return;
7a091cbeb2d972e Kent Overstreet 2023-05-17  120  
7a091cbeb2d972e Kent Overstreet 2023-05-17  121  	page	= vmalloc_to_page(buf);
7a091cbeb2d972e Kent Overstreet 2023-05-17  122  	folio	= page_folio(page);
7a091cbeb2d972e Kent Overstreet 2023-05-17  123  	offset	= offset_in_folio(folio, buf);
7a091cbeb2d972e Kent Overstreet 2023-05-17  124  
7a091cbeb2d972e Kent Overstreet 2023-05-17  125  	if (!folio_test_slab(folio)) {
7a091cbeb2d972e Kent Overstreet 2023-05-17  126  		vfree(buf);
7a091cbeb2d972e Kent Overstreet 2023-05-17  127  		return;
7a091cbeb2d972e Kent Overstreet 2023-05-17  128  	}
7a091cbeb2d972e Kent Overstreet 2023-05-17  129  
7a091cbeb2d972e Kent Overstreet 2023-05-17  130  	s = folio_jit_slab(folio);
7a091cbeb2d972e Kent Overstreet 2023-05-17  131  
7a091cbeb2d972e Kent Overstreet 2023-05-17  132  	mutex_lock(&jit_alloc_lock);
7a091cbeb2d972e Kent Overstreet 2023-05-17  133  	obj_idx = offset >> s->cache->obj_size_bits;
7a091cbeb2d972e Kent Overstreet 2023-05-17  134  
7a091cbeb2d972e Kent Overstreet 2023-05-17  135  	__clear_bit(obj_idx, s->objs_allocated);
7a091cbeb2d972e Kent Overstreet 2023-05-17  136  
7a091cbeb2d972e Kent Overstreet 2023-05-17  137  	nr_allocated = bitmap_weight(s->objs_allocated, s->cache->objs_per_slab);
7a091cbeb2d972e Kent Overstreet 2023-05-17  138  
7a091cbeb2d972e Kent Overstreet 2023-05-17  139  	if (nr_allocated == 0) {
7a091cbeb2d972e Kent Overstreet 2023-05-17  140  		list_del(&s->list);
7a091cbeb2d972e Kent Overstreet 2023-05-17  141  		kfree(s->objs_allocated);
7a091cbeb2d972e Kent Overstreet 2023-05-17  142  		folio_put(folio);
7a091cbeb2d972e Kent Overstreet 2023-05-17  143  	} else if (nr_allocated + 1 == s->cache->objs_per_slab) {
7a091cbeb2d972e Kent Overstreet 2023-05-17  144  		list_del(&s->list);
7a091cbeb2d972e Kent Overstreet 2023-05-17  145  		list_add(&s->list, &s->cache->partial);
7a091cbeb2d972e Kent Overstreet 2023-05-17  146  	}
7a091cbeb2d972e Kent Overstreet 2023-05-17  147  
7a091cbeb2d972e Kent Overstreet 2023-05-17  148  	mutex_unlock(&jit_alloc_lock);
7a091cbeb2d972e Kent Overstreet 2023-05-17  149  }
7a091cbeb2d972e Kent Overstreet 2023-05-17  150  EXPORT_SYMBOL_GPL(jit_free);
7a091cbeb2d972e Kent Overstreet 2023-05-17  151  
7a091cbeb2d972e Kent Overstreet 2023-05-17  152  void *jit_alloc(void *buf, size_t len)
7a091cbeb2d972e Kent Overstreet 2023-05-17  153  {
7a091cbeb2d972e Kent Overstreet 2023-05-17  154  	unsigned jit_cache_idx = ilog2(roundup_pow_of_two(len) / 16);
7a091cbeb2d972e Kent Overstreet 2023-05-17  155  	void *p;
7a091cbeb2d972e Kent Overstreet 2023-05-17  156  
7a091cbeb2d972e Kent Overstreet 2023-05-17  157  	if (jit_cache_idx < NR_JIT_CACHES) {
7a091cbeb2d972e Kent Overstreet 2023-05-17  158  		mutex_lock(&jit_alloc_lock);
7a091cbeb2d972e Kent Overstreet 2023-05-17  159  		p = jit_cache_alloc(buf, len, &jit_caches[jit_cache_idx]);
7a091cbeb2d972e Kent Overstreet 2023-05-17  160  		mutex_unlock(&jit_alloc_lock);
7a091cbeb2d972e Kent Overstreet 2023-05-17  161  	} else {
7a091cbeb2d972e Kent Overstreet 2023-05-17 @162  		p = module_alloc(len);
7a091cbeb2d972e Kent Overstreet 2023-05-17  163  		if (p) {
7a091cbeb2d972e Kent Overstreet 2023-05-17  164  			set_vm_flush_reset_perms(p);
7a091cbeb2d972e Kent Overstreet 2023-05-17  165  			set_memory_rox((unsigned long) p, DIV_ROUND_UP(len, PAGE_SIZE));
7a091cbeb2d972e Kent Overstreet 2023-05-17  166  		}
7a091cbeb2d972e Kent Overstreet 2023-05-17  167  	}
7a091cbeb2d972e Kent Overstreet 2023-05-17  168  
7a091cbeb2d972e Kent Overstreet 2023-05-17  169  	if (p && buf)
7a091cbeb2d972e Kent Overstreet 2023-05-17  170  		jit_update(p, buf, len);
7a091cbeb2d972e Kent Overstreet 2023-05-17  171  
7a091cbeb2d972e Kent Overstreet 2023-05-17  172  	return p;
7a091cbeb2d972e Kent Overstreet 2023-05-17  173  }
7a091cbeb2d972e Kent Overstreet 2023-05-17  174  EXPORT_SYMBOL_GPL(jit_alloc);
7a091cbeb2d972e Kent Overstreet 2023-05-17  175  

:::::: The code at line 46 was first introduced by commit
:::::: 7a091cbeb2d972e3dc4d44f00ab2828b7abbbcce mm: jit/text allocator

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
