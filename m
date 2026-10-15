Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766E36B92D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 02:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030493; cv=none; b=tgh/gv5+npWawNfZkR6yYptz/j6+f2MXGqR+pSzx4kz3UArera12PibSqepaZ6Mm+CIIo8Pt7YzekxojqKSmoAuQ/Cpqp0BgpoBpKvrxQOSzP8a1jC+YAeDv00ULxPFN07EqVHGyLlBu5PWPYe/27psMaeHbERoGCBXhXq6NzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030493; c=relaxed/simple;
	bh=8xS+7CmyT3U0LFrcuaxu/YuVSurv6whW23weaa9hS6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJLYTjQXBeZAPS6IwWFq5FzR6lTQz2u+YsFTn8IsxBXBXScX1VpLg6Yf8LDhGOyzoEQ9AEPQP2sAb1oIqFMlztmcyUVVJJ17fiUl9NPsGP+4dptzdXqG1RdlpPsWsD9zH3hawkyXIKwJl9trGX1KV+k363emnUaW8qt+8h0nOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OOS8120N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOS8120N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792030492; x=1823566492;
  h=date:from:to:cc:subject:message-id;
  bh=8xS+7CmyT3U0LFrcuaxu/YuVSurv6whW23weaa9hS6w=;
  b=OOS8120NOubr+Vh0rNEighqifHACTrznWWXbRZXTv4IOHzRJvI4Lt8vN
   zc1iD4YVv66ZxJ1EfTkqz7gZG22tGyJ8cm7lmOr4+HdCwBiEy9iPf8EAJ
   fRDCmJExznNyWxzFIxrvxwJKIx4kpdHLU729qTZiyU1N4c/iOnL4sO6Uf
   8pYNwzcBmKeQUd+/3b+gaJUEWUZmr7w8BEfboQvP1qS/x2s4yIaxa68nP
   Zx6bnvPyK22gGXw3ejzCDtL10KTg0rz91NHAL+vxZHtCVweJDrnshu777
   rM63Wh22SO61QZiilggnUZfeW8BLW4KU+JcUm3pjbjOjEcYC7gvLHDbpn
   g==;
X-CSE-ConnectionGUID: eOcPWn5RThi+R+5bRZ7EUQ==
X-CSE-MsgGUID: +umifC8LQICIsfLgE20bMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="820335"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="820335"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 19:14:51 -0700
X-CSE-ConnectionGUID: Kx23lC/vQ9KFVF1PQEn3Qw==
X-CSE-MsgGUID: Nq+jQMXdR6isRNs01MEkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1480664"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2026 19:14:50 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHAzX-00000000BYZ-3EWH;
	Thu, 15 Oct 2026 02:14:47 +0000
Date: Thu, 15 Oct 2026 04:14:41 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next-3 12/13]
 lib/tests/kunit_bvecq.c:190:undefined reference to `bvecq_put'
Message-ID: <202610150437.fT140VhX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   d43a7f2a38d9f9e2d1db0b79681d6b4bfe766738
commit: 56e1580c38e2bb8b44a40513f3756e78e2823d41 [12/13] iov_iter: Add a bvecq kunit test
config: sparc-randconfig-2000-20261015 (https://download.01.org/0day-ci/archive/20261015/202610150437.fT140VhX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150437.fT140VhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150437.fT140VhX-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: lib/tests/kunit_bvecq.o: in function `bvecq_kunit_bvecq_put':
>> lib/tests/kunit_bvecq.c:190:(.text+0x28): undefined reference to `bvecq_put'
   sparc64-linux-ld: lib/tests/kunit_bvecq.o: in function `bvecq_kunit_load_chain':
>> lib/tests/kunit_bvecq.c:297:(.init.text+0xb0): undefined reference to `bvecq_alloc_one'


vim +190 lib/tests/kunit_bvecq.c

   187	
   188	static void bvecq_kunit_bvecq_put(void *data)
   189	{
 > 190		bvecq_put(data);
   191	}
   192	
   193	/*
   194	 * Calculate the fill pattern, for a particular byte of a particular subpage of
   195	 * a particular folio.
   196	 */
   197	static inline u8 bvecq_kunit_pattern(unsigned int folio, int subpage, int offset)
   198	{
   199		int fill_step = bvecq_kunit_fills[folio];
   200	
   201		return (subpage + offset * fill_step) & 0xff;
   202	}
   203	
   204	/*
   205	 * Calculate the fill pattern, given the 'byte position' in the bvecq chain.
   206	 * This looks up the folio, subpage and offset from a table generated whilst
   207	 * the bvecq is being assembled.
   208	 */
   209	static inline u8 bvecq_kunit_predict(struct kunit *test, size_t pos)
   210	{
   211		size_t last_pos = 0;
   212	
   213		for (int i = 0; i < bvecq_kunit_pagemap_nr; i++) {
   214			if (pos < bvecq_kunit_pagemap[i].pos)
   215				return bvecq_kunit_pattern(bvecq_kunit_pagemap[i].folio,
   216							   bvecq_kunit_pagemap[i].subpage,
   217							   bvecq_kunit_pagemap[i].offset + (pos - last_pos));
   218			last_pos = bvecq_kunit_pagemap[i].pos;
   219		}
   220	
   221		KUNIT_FAIL(test, "Overran pagemap pos=%zx\n", pos);
   222		return 0;
   223	}
   224	
   225	/*
   226	 * Determine which page we're looking at, taking all the folios to be split
   227	 * into pages.  This can be used to determine what iov_iter_npages() will say.
   228	 */
   229	static inline int bvecq_kunit_pos2page(struct kunit *test, size_t pos)
   230	{
   231		for (int i = 0; i < bvecq_kunit_pagemap_nr; i++)
   232			if (pos < bvecq_kunit_pagemap[i].pos)
   233				return i;
   234	
   235		if (pos > bvecq_kunit_pagemap[bvecq_kunit_pagemap_nr - 1].pos)
   236			KUNIT_FAIL(test, "Overran pagemap pos=%zx\n", pos);
   237		return bvecq_kunit_pagemap_nr;
   238	}
   239	
   240	/*
   241	 * Allocate a variety of folios of different orders and fill them with the
   242	 * pattern set for each folio.
   243	 */
   244	static void __init iov_bvecq_alloc_folios(struct kunit *test)
   245	{
   246		struct folio *folio, **folios = bvecq_kunit_folios;
   247		const int nr = ARRAY_SIZE(bvecq_kunit_folios);
   248	
   249		bvecq_kunit_pagemap_nr = 0;
   250		memset(bvecq_kunit_pagemap, 0, sizeof(bvecq_kunit_pagemap));
   251		memset(bvecq_kunit_folios, 0, sizeof(bvecq_kunit_folios));
   252	
   253		for (int i = 0; i < nr; i++) {
   254			folio = folio_alloc(GFP_KERNEL, bvecq_kunit_orders[i]);
   255			KUNIT_ASSERT_NOT_NULL(test, folio);
   256			folios[i] = folio;
   257	
   258			/* Fill each subpage with a different but predictable pattern. */
   259			for (int j = 0; j < folio_nr_pages(folio); j++) {
   260				u8 *p = kmap_local_folio(folio, PAGE_SIZE * j);
   261	
   262				for (int k = 0; k < PAGE_SIZE; k++)
   263					p[k] = bvecq_kunit_pattern(i, j, k);
   264				kunmap_local(p);
   265			}
   266		}
   267	
   268		kunit_add_action_or_reset(test, bvecq_kunit_release_folios, folios);
   269	}
   270	
   271	/*
   272	 * Follow the specified recipe to allocate a bvecq chain and stick the folios
   273	 * and empty gaps into it.  Further, the offset into and length of each folio
   274	 * is adjusted from the partials list.  Each ALLOC command will append a new
   275	 * bvecq to the chain and move to filling that.
   276	 */
   277	static struct bvecq *__init bvecq_kunit_load_chain(struct kunit *test,
   278							   const struct bvecq_test_recipe *rec,
   279							   const struct bvecq_test_partials *parts,
   280							   size_t *size)
   281	{
   282		struct bvecq *head = NULL, *bq = NULL, *p;
   283		size_t pos = 0;
   284		int folio_index = 0;
   285	
   286		*size = 0;
   287	
   288		for (; rec->cmd != BVECQ_KUNIT_STOP; rec++) {
   289			if (!head)
   290				KUNIT_ASSERT_EQ(test, rec->cmd, BVECQ_KUNIT_ALLOC);
   291	
   292			switch (rec->cmd) {
   293			case BVECQ_KUNIT_STOP:
   294				break;
   295	
   296			case BVECQ_KUNIT_ALLOC:
 > 297				p = bvecq_alloc_one(rec->count, GFP_KERNEL, false);
   298				KUNIT_ASSERT_NOT_NULL(test, p);
   299	
   300				if (!head) {
   301					head = p;
   302					kunit_add_action_or_reset(test, bvecq_kunit_bvecq_put, head);
   303					bq = p;
   304				} else {
   305					bvecq_append(bq, p);
   306					bq = p;
   307				}
   308				break;
   309	
   310			case BVECQ_KUNIT_LOAD:
   311				KUNIT_ASSERT_LE(test, folio_index + rec->count, ARRAY_SIZE(bvecq_kunit_orders));
   312				KUNIT_ASSERT_LE(test, bq->nr_slots + rec->count, bq->max_slots);
   313				for (int i = 0; i < rec->count; i++) {
   314					struct folio *folio = bvecq_kunit_folios[folio_index];
   315					size_t flen = PAGE_SIZE << bvecq_kunit_orders[folio_index];
   316					size_t foff = 0;
   317	
   318					KUNIT_ASSERT_LE(test,
   319							parts[folio_index].add_start +
   320							parts[folio_index].sub_end,
   321							flen);
   322	
   323					foff += parts[folio_index].add_start;
   324					flen -= parts[folio_index].add_start;
   325					flen -= parts[folio_index].sub_end;
   326	
   327					bvec_set_page(&bq->bv[bq->nr_slots + i], folio_page(folio, 0), flen, foff);
   328					*size += flen;
   329	
   330					for (int j = 0; j < folio_nr_pages(folio); j++) {
   331						size_t part;
   332	
   333						if (foff >= PAGE_SIZE) {
   334							foff -= PAGE_SIZE;
   335							continue;
   336						}
   337						part = min(flen, PAGE_SIZE - foff);
   338						pos += part;
   339						bvecq_kunit_pagemap[bvecq_kunit_pagemap_nr].pos = pos;
   340						bvecq_kunit_pagemap[bvecq_kunit_pagemap_nr].folio = folio_index;
   341						bvecq_kunit_pagemap[bvecq_kunit_pagemap_nr].subpage = j;
   342						bvecq_kunit_pagemap[bvecq_kunit_pagemap_nr].offset = foff;
   343						bvecq_kunit_pagemap_nr++;
   344						flen -= part;
   345						if (!flen)
   346							break;
   347						foff = 0;
   348					}
   349	
   350					folio_index++;
   351				}
   352				bvecq_filled_to(bq, bq->nr_slots + rec->count);
   353				break;
   354	
   355			case BVECQ_KUNIT_EMPTY:
   356				KUNIT_ASSERT_LE(test, bq->nr_slots + rec->count, bq->max_slots);
   357				for (int i = 0; i < rec->count; i++) {
   358					bq->bv[bq->nr_slots + i].bv_page = ERR_PTR(-EIO);
   359					bq->bv[bq->nr_slots + i].bv_offset = 0;
   360					bq->bv[bq->nr_slots + i].bv_len = 0;
   361				}
   362				bvecq_filled_to(bq, bq->nr_slots + rec->count);
   363				break;
   364			}
   365		}
   366	
   367		return head;
   368	}
   369	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
