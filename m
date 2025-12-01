Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F6D23B63F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764573321; cv=none; b=XW4X56AT3PiMRt62pS6VcwH07QIW5BHmkUB7mNkjpzkBUNXDna7yJAx+fJzPBVbRhtf52mQXEKC1zZOwrM6bqNF19kYpxokEi6o+MyynwaLrWpCoNoQhj2NcRQbvCjApi64FJw57lnfIA/3WKtHEG1WBRVNjOWuxgOG1DPtV2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764573321; c=relaxed/simple;
	bh=l3K8ORg4/34QcNMMJD1liD2MU/TZYHC3aFNQ0SxZiko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pMcOYxQGKZOAIVJoF9vRO6pX+ur0Z+rTwY3JQi5tkqwP3xFUx2kNwuzCC4k0bql9LFi/kEbjWLN4gQkK3IkJ34P5O92iqKW29ms+CEf4yr5KK62X1HNK4GKCU2nJpqyfd2X6v/rULdKnGpJXxY4I5gcZhdq/8oURrSf7T/6N7fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3J+uCwC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3J+uCwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764573319; x=1796109319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3K8ORg4/34QcNMMJD1liD2MU/TZYHC3aFNQ0SxZiko=;
  b=d3J+uCwCwwqH41Z3MoJ+vLS16DV0TSK6ddudr7/pnrMD068Evwejwf7O
   Ui+jWfFzpQEBZN45MHRY/WwkuGsY7/MzTCn4jJ9LZiObKD+0rUKmm9Sct
   4Cz77XHljzUm4hnCVuZl4yp5/KsUva/p69cN8+xABeq0XDDI8MfqDUd93
   u2Ie1rA599sNKjVr3Na6Vy2FHCb2jUE5/2mOAOZEJJaB6wm3kaVT1zFNe
   yeG/0VWIbjJI4C7YONe9YcgXZEEkPeZE3FG7MpjYFiS5Bw6W2rNBuL4eu
   75M93Sr5uvM1iwB7Eei20Vv5jys6yxGZ/gmuAJ81QMwkOifWPk6ofcs4j
   A==;
X-CSE-ConnectionGUID: SG8U3bWgTUiz3Dwnqd3fCg==
X-CSE-MsgGUID: WV1C0/tcSZWbJ5SFwgzyNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="69096362"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="69096362"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 23:15:18 -0800
X-CSE-ConnectionGUID: nAw6e9RZTA6DeknLfgRYqw==
X-CSE-MsgGUID: faAbw21OT3KuIEJlsX18qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="198334699"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Nov 2025 23:15:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPy7v-000000008Nd-0OFF;
	Mon, 01 Dec 2025 07:15:15 +0000
Date: Mon, 1 Dec 2025 15:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 902/1051]
 fs/bcachefs/alloc/foreground.c:367:1: warning: the frame size of 1360 bytes
 is larger than 1280 bytes
Message-ID: <202512011552.PK5QdJo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   452d7a3f10e48aec6c00c91b122b0a12f7726d59
commit: 906e2e30b6d9cc3e4e8293f8d758e9ff8dc3d8aa [902/1051] bcachefs: fix __bch2_trans_iter_init() ip parameter
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251201/202512011552.PK5QdJo6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011552.PK5QdJo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011552.PK5QdJo6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/foreground.c: In function 'bch2_bucket_alloc_early':
>> fs/bcachefs/alloc/foreground.c:367:1: warning: the frame size of 1360 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     367 | }
         | ^
--
   fs/bcachefs/fs/dirent.c: In function 'bch2_fsck_remove_dirent':
>> fs/bcachefs/fs/dirent.c:688:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     688 | }
         | ^
--
   fs/bcachefs/snapshots/subvolume.c: In function 'check_subvol':
>> fs/bcachefs/snapshots/subvolume.c:165:1: warning: the frame size of 1472 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     165 | }
         | ^


vim +367 fs/bcachefs/alloc/foreground.c

f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  280  
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  281  /*
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  282   * This path is for before the freespace btree is initialized:
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  283   */
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  284  static noinline struct open_bucket *
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  285  bch2_bucket_alloc_early(struct btree_trans *trans,
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  286  			struct alloc_request *req,
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  287  			struct closure *cl)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  288  {
fbd152bf946987 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-12-06  289  	struct bch_fs *c = trans->c;
e038213658f09b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  290  	struct bch_dev *ca = req->ca;
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  291  	struct bkey_s_c k;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  292  	struct open_bucket *ob = NULL;
828552ca74a458 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-11-24  293  	u64 first_bucket = ca->mi.first_bucket;
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  294  	u64 *dev_alloc_cursor = &ca->alloc_cursor[req->btree_bitmap];
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  295  	u64 alloc_start = max(first_bucket, *dev_alloc_cursor);
e0fb0dccfd6fd8 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  296  	u64 alloc_cursor = alloc_start;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  297  	int ret;
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  298  
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  299  	/*
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  300  	 * Scan with an uncached iterator to avoid polluting the key cache. An
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  301  	 * uncached iter will return a cached key if one exists, but if not
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  302  	 * there is no other underlying protection for the associated key cache
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  303  	 * slot. To avoid racing bucket allocations, look up the cached key slot
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  304  	 * of any likely allocation candidate before attempting to proceed with
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  305  	 * the allocation. This provides proper exclusion on the associated
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  306  	 * bucket.
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  307  	 */
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  308  again:
db346e7120a6de fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-07-17  309  	for_each_btree_key_norestart(trans, iter, BTREE_ID_alloc, POS(ca->dev_idx, alloc_cursor),
5dd8c60e1e0448 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-07  310  			   BTREE_ITER_slots, k, ret) {
f6ecd9850b5e0b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  311  		u64 bucket = alloc_cursor = k.k->p.offset;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  312  
e88a75ebe86c1d fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-11-24  313  		if (bkey_ge(k.k->p, POS(ca->dev_idx, ca->mi.nbuckets)))
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  314  			break;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  315  
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  316  		if (req->btree_bitmap != BTREE_BITMAP_ANY &&
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  317  		    req->btree_bitmap != bch2_dev_btree_bitmap_marked_sectors(ca,
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  318  				bucket_to_sector(ca, bucket), ca->mi.bucket_size)) {
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  319  			if (req->btree_bitmap == BTREE_BITMAP_YES &&
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  320  			    bucket_to_sector(ca, bucket) > 64ULL << ca->mi.btree_bitmap_shift)
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  321  				break;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  322  
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  323  			bucket = sector_to_bucket(ca,
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  324  					round_up(bucket_to_sector(ca, bucket) + 1,
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  325  						 1ULL << ca->mi.btree_bitmap_shift));
7c84dc243819ab fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  326  			bch2_btree_iter_set_pos(&iter, POS(ca->dev_idx, bucket));
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  327  			req->counters.buckets_seen++;
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  328  			req->counters.skipped_mi_btree_bitmap++;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  329  			continue;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  330  		}
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  331  
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  332  		struct bch_alloc_v4 a_convert;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  333  		const struct bch_alloc_v4 *a = bch2_alloc_to_v4(k, &a_convert);
19a614d2e4beed fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-30  334  		if (a->data_type != BCH_DATA_free)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  335  			continue;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  336  
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  337  		/* now check the cached key to serialize concurrent allocs of the bucket */
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  338  		CLASS(btree_iter, citer)(trans, BTREE_ID_alloc, k.k->p, BTREE_ITER_cached|BTREE_ITER_nopreserve);
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  339  		struct bkey_s_c ck = bch2_btree_iter_peek_slot(&citer);
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  340  		ret = bkey_err(ck);
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  341  		if (ret)
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  342  			break;
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  343  
385a82f62a9b46 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  344  		a = bch2_alloc_to_v4(ck, &a_convert);
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  345  		if (a->data_type == BCH_DATA_free) {
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  346  			req->counters.buckets_seen++;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  347  
7f65d1cf5c30cf fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  348  			ob = may_alloc_bucket(c, req, k.k->p)
e038213658f09b fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-03-31  349  				? __try_alloc_bucket(c, req, k.k->p.offset, a->gen, cl)
fbd152bf946987 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-12-06  350  				: NULL;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  351  			if (ob)
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  352  				break;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  353  		}
4a80745da868ac fs/bcachefs/alloc_foreground.c Kent Overstreet 2025-07-30  354  	}
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  355  
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  356  	if (!ob && ret)
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  357  		ob = ERR_PTR(ret);
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  358  
e0fb0dccfd6fd8 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  359  	if (!ob && alloc_start > first_bucket) {
e0fb0dccfd6fd8 fs/bcachefs/alloc_foreground.c Brian Foster    2023-11-01  360  		alloc_cursor = alloc_start = first_bucket;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  361  		goto again;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  362  	}
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  363  
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  364  	*dev_alloc_cursor = alloc_cursor;
c6705091342c06 fs/bcachefs/alloc_foreground.c Kent Overstreet 2024-04-20  365  
db36c1477d1753 fs/bcachefs/alloc_foreground.c Kent Overstreet 2023-01-23  366  	return ob;
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09 @367  }
f25d8215f49941 fs/bcachefs/alloc_foreground.c Kent Overstreet 2022-01-09  368  

:::::: The code at line 367 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
