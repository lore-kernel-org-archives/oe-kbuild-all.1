Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5492FC146
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687173575; x=1718709575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lCpW/RUKuMLIe9jPZIxOJIcnA3LJa/AXip5NDOIUFBc=;
  b=IHCEKXj0XVjeNe3samjZqdeTTA2uoRxvtk46qJ9TV33H2VT9Tfo8iWqx
   2BNDq0exql5EQL9akyfOZUzh3sbbSwc/bYfSBF8a8PL8cG1592fsf+d7I
   CTvoAqM1bST1GKs9vdsh2PVs8/ppnkKUKTQO07kEaXZNKMG1IYqyveqZu
   LUdDLxU+gmFQcsZZygKOibxQW59d+pbsR00X3JD+eOljZaKbceRA+UFlD
   OBHa1Xd3r7IHxtqsFafH7hUabwQfU2g/EMAseLyYt2jmR6RMm+MkIWEQ8
   h9LXD1NwsxrnO04CyKkQpWRLxEGhnkbUnzp95p5bPg1SldGoOL/5TaaWo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="358479225"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="358479225"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 04:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="716838109"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="716838109"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2023 04:19:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBCuq-0004fQ-1G;
	Mon, 19 Jun 2023 11:19:24 +0000
Date: Mon, 19 Jun 2023 19:18:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:sendpage-3-copy 2/18] net/core/skbuff.c:6794:9: sparse:
 sparse: dereference of noderef expression
Message-ID: <202306191952.jTtmskfN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git sendpage-3-copy
head:   67d95e01f1d8e20a32324170fb24f53d9c4bdaa3
commit: 587d03ccd09ae053a0d5d75de392e36b145ffd4c [2/18] net: Copy slab data for sendmsg(MSG_SPLICE_PAGES)
config: sparc-randconfig-s051-20230618 (https://download.01.org/0day-ci/archive/20230619/202306191952.jTtmskfN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191952.jTtmskfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191952.jTtmskfN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/skbuff.c:6794:9: sparse: sparse: dereference of noderef expression

vim +6794 net/core/skbuff.c

  6770	
  6771	static void *skb_splice_frag_alloc(size_t fragsz, gfp_t gfp)
  6772	{
  6773		struct skb_splice_frag_cache *cache;
  6774		struct folio *folio, *spare = NULL;
  6775		size_t offset, fsize;
  6776		void *p;
  6777	
  6778		if (WARN_ON_ONCE(fragsz == 0))
  6779			fragsz = 1;
  6780	
  6781		cache = get_cpu_ptr(&skb_splice_frag_cache);
  6782	reload:
  6783		folio = cache->folio;
  6784		offset = cache->offset;
  6785	try_again:
  6786		if (fragsz > offset)
  6787			goto insufficient_space;
  6788	
  6789		/* Make the allocation. */
  6790		cache->pagecnt_bias--;
  6791		offset = ALIGN_DOWN(offset - fragsz, SMP_CACHE_BYTES);
  6792		cache->offset = offset;
  6793		p = cache->virt + offset;
> 6794		put_cpu_ptr(skb_splice_frag_cache);
  6795		if (spare)
  6796			folio_put(spare);
  6797		return p;
  6798	
  6799	insufficient_space:
  6800		/* See if we can refurbish the current folio. */
  6801		if (!folio || !folio_ref_sub_and_test(folio, cache->pagecnt_bias))
  6802			goto get_new_folio;
  6803		if (unlikely(cache->pfmemalloc)) {
  6804			__folio_put(folio);
  6805			goto get_new_folio;
  6806		}
  6807	
  6808		fsize = folio_size(folio);
  6809		if (unlikely(fragsz > fsize))
  6810			goto frag_too_big;
  6811	
  6812		/* OK, page count is 0, we can safely set it */
  6813		folio_set_count(folio, PAGE_FRAG_CACHE_MAX_SIZE + 1);
  6814	
  6815		/* Reset page count bias and offset to start of new frag */
  6816		cache->pagecnt_bias = PAGE_FRAG_CACHE_MAX_SIZE + 1;
  6817		offset = fsize;
  6818		goto try_again;
  6819	
  6820	get_new_folio:
  6821		if (!spare) {
  6822			cache->folio = NULL;
  6823			put_cpu_ptr(&skb_splice_frag_cache);
  6824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
