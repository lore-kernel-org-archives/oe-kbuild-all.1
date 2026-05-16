Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29B2175A7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778910863; cv=none; b=cj3yCPj6xGzq7XWUzqCIDJf8fHpuvQtHeJOysyyZq0YvYyXOing0D01DXfe7HiR2C4bERlMN5Vhagq3wwgsYpq6CTLWZyWN9eejHNA8SpMVImNyhizjKHLDRbkwWICMeG8xzXiS5S5ljUBEKIyTescR6Usl3YhTYl0fJ8twHRiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778910863; c=relaxed/simple;
	bh=A8ftc/VU0A5lq/KmOp4TphGXVGQsp5OMzguZ/hvOVVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T7kEIug22vL7Ce8YGex8Q1jvUfe916I75Os8cWDrzS2BGa+bZJpHfWpXzW2qzxfHz/7TsPouzcZoR4UY6Jo8iFAApBMRN+dRJk6h3COo+0QQlaHUlmhob3+MbQDt1L6L/QnXgJgTTtGpjMVe0UkfoDq5RgMwbuPxrz2Bod8LTXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbEPDJ8n; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbEPDJ8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778910862; x=1810446862;
  h=date:from:to:cc:subject:message-id;
  bh=A8ftc/VU0A5lq/KmOp4TphGXVGQsp5OMzguZ/hvOVVQ=;
  b=gbEPDJ8nIFOJe92kR7CKcAwyzoJLlbzfdQGVX4JX5iepHz3C344RUlSC
   6QBV0iTieqAu5Ch4/O6fN2Trw1swfbftyprrE8h7mk/VdhiXYEsdOtcEI
   rNLbehhhWysbe9Lfjj2Wh3YECz2Ghz3GQTYcvPJ0WPHZWRx4XwYwtbWiV
   f3EudJPv8iKmtkSc9nMwRm0Uvwd6SDg1xY33OtqNqwy1fmBN/DgHf3qrJ
   Zx1HUpZsEuojZxRwe8gu8pp1x4D5+hOTOTa38siIBoBMOVi2sX1LMd/Q1
   erC1a11K4kVzvduLsuNLZzCd5E68HtnLWcCDVL82i03voPFfGzxV1Qmzm
   Q==;
X-CSE-ConnectionGUID: +gl6zf5CQkuLRb07PhjQMg==
X-CSE-MsgGUID: /2XiiXVhQmWOjOPqaf/ExA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="90437462"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="90437462"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 22:54:22 -0700
X-CSE-ConnectionGUID: o3H4RQ2QRfeEsaHxNx9J6g==
X-CSE-MsgGUID: Vwk8VrYbSGumvzVXkqb39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="239150048"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 May 2026 22:54:20 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO7yb-000000000Yb-24Wj;
	Sat, 16 May 2026 05:54:17 +0000
Date: Sat, 16 May 2026 13:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 9/36] fs/bcachefs/journal/init.c:39:23:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202605161321.9VwUugni-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 58011a0b7dcdc464295e858e93d9f2504a268e7c [9/36] bcachefs: bch2_set_nr_journal_buckets_iter() uses bch2_bucket_alloc_trans()
config: sh-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260516/202605161321.9VwUugni-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161321.9VwUugni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161321.9VwUugni-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/journal/init.c:39:23: sparse: sparse: Using plain integer as NULL pointer
   fs/bcachefs/journal/init.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1736:38: sparse: sparse: array of flexible structures
   fs/bcachefs/journal/init.c:308:13: sparse: sparse: context imbalance in 'bch2_journal_writing_to_device' - wrong count at exit
   fs/bcachefs/journal/init.c:480:6: sparse: sparse: context imbalance in 'bch2_journal_set_replay_done' - wrong count at exit

vim +39 fs/bcachefs/journal/init.c

    17	
    18	static int bch2_set_nr_journal_buckets_iter(struct bch_dev *ca, unsigned nr,
    19						    bool new_fs, enum bch_watermark watermark,
    20						    struct closure *cl)
    21	{
    22		struct bch_fs *c = ca->fs;
    23		struct journal_device *ja = &ca->journal;
    24		unsigned i, pos, nr_got = 0, nr_want = nr - ja->nr;
    25		int ret = 0;
    26	
    27		BUG_ON(nr <= ja->nr);
    28	
    29		long *bu __free(kfree)			= kcalloc(nr_want, sizeof(*bu), GFP_KERNEL);
    30		struct open_bucket **ob __free(kfree)	= kcalloc(nr_want, sizeof(*ob), GFP_KERNEL);
    31		u64 *new_buckets __free(kfree)		= kcalloc(nr, sizeof(u64), GFP_KERNEL);
    32		u64 *new_bucket_seq __free(kfree)	= kcalloc(nr, sizeof(u64), GFP_KERNEL);
    33		if (!bu || !ob || !new_buckets || !new_bucket_seq)
    34			return bch_err_throw(c, ENOMEM_set_nr_journal_buckets);
    35	
    36		for (nr_got = 0; nr_got < nr_want; nr_got++) {
    37			CLASS(btree_trans, trans)(c);
    38	
  > 39			ret = lockrestart_do(trans, ({
    40				struct alloc_request *req __free(alloc_request_put) =
    41					alloc_request_get(trans,
    42							  0, false, NULL, 1, 0, watermark, 0,
    43							  !nr_got ? cl : 0);
    44				int ret2 = PTR_ERR_OR_ZERO(req) ?:
    45				(req->ca = ca,
    46				 PTR_ERR_OR_ZERO(ob[nr_got] = bch2_bucket_alloc_trans(trans, req)));
    47	
    48				if (bch2_err_matches(ret2, BCH_ERR_operation_blocked)) {
    49					bch2_wait_on_allocator(trans, c, req, ret2, cl);
    50					ret2 = bch_err_throw(c, transaction_restart_nested);
    51				}
    52	
    53				ret2;
    54			}));
    55			if (ret)
    56				break;
    57	
    58			ret = bch2_trans_mark_metadata_bucket(trans, ca,
    59						ob[nr_got]->bucket, BCH_DATA_journal,
    60						ca->mi.bucket_size, BTREE_TRIGGER_transactional);
    61			if (ret) {
    62				bch2_open_bucket_put(c, ob[nr_got]);
    63				bch_err_msg(c, ret, "marking new journal buckets");
    64				break;
    65			}
    66	
    67			bu[nr_got] = ob[nr_got]->bucket;
    68		}
    69	
    70		if (!nr_got)
    71			return ret;
    72	
    73		/* Don't return an error if we successfully allocated some buckets: */
    74		ret = 0;
    75	
    76		scoped_guard(journal_block, &c->journal) {
    77			guard(memalloc_flags)(PF_MEMALLOC_NOFS);
    78			guard(mutex)(&c->sb_lock);
    79	
    80			memcpy(new_buckets,	ja->buckets,	ja->nr * sizeof(u64));
    81			memcpy(new_bucket_seq,	ja->bucket_seq,	ja->nr * sizeof(u64));
    82	
    83			BUG_ON(ja->discard_idx > ja->nr);
    84	
    85			pos = ja->discard_idx ?: ja->nr;
    86	
    87			memmove(new_buckets + pos + nr_got,
    88				new_buckets + pos,
    89				sizeof(new_buckets[0]) * (ja->nr - pos));
    90			memmove(new_bucket_seq + pos + nr_got,
    91				new_bucket_seq + pos,
    92				sizeof(new_bucket_seq[0]) * (ja->nr - pos));
    93	
    94			for (i = 0; i < nr_got; i++) {
    95				new_buckets[pos + i] = bu[i];
    96				new_bucket_seq[pos + i] = 0;
    97			}
    98	
    99			nr = ja->nr + nr_got;
   100	
   101			ret = bch2_journal_buckets_to_sb(c, ca, new_buckets, nr);
   102			if (ret)
   103				goto err_unblock;
   104	
   105			bch2_write_super(c);
   106	
   107			/* Commit: */
   108			scoped_guard(spinlock, &c->journal.lock) {
   109				swap(new_buckets,	ja->buckets);
   110				swap(new_bucket_seq,	ja->bucket_seq);
   111				ja->nr = nr;
   112	
   113				if (pos <= ja->discard_idx)
   114					ja->discard_idx = (ja->discard_idx + nr_got) % ja->nr;
   115				if (pos <= ja->dirty_idx_ondisk)
   116					ja->dirty_idx_ondisk = (ja->dirty_idx_ondisk + nr_got) % ja->nr;
   117				if (pos <= ja->dirty_idx)
   118					ja->dirty_idx = (ja->dirty_idx + nr_got) % ja->nr;
   119				if (pos <= ja->cur_idx)
   120					ja->cur_idx = (ja->cur_idx + nr_got) % ja->nr;
   121			}
   122		}
   123	err_unblock:
   124	
   125		if (ret) {
   126			CLASS(btree_trans, trans)(c);
   127			for (i = 0; i < nr_got; i++)
   128				bch2_trans_mark_metadata_bucket(trans, ca,
   129							bu[i], BCH_DATA_free, 0,
   130							BTREE_TRIGGER_transactional);
   131		}
   132	
   133		for (i = 0; i < nr_got; i++)
   134			bch2_open_bucket_put(c, ob[i]);
   135	
   136		return ret;
   137	}
   138	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
