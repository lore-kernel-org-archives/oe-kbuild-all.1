Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FEC36894F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777059480; cv=none; b=IBdTlNLsYhH9LyRkH/CA5U44Qkl8X3DtnU5XIj4byJgiaj1d9E98AY0d9fRFKsNCahKOUMo7SS90keRHOB7c7/2a/kEmrf7xinUl0wvp0gksqyo76EuE4zEg2rUxKnoUzM9/SUV0nHFYNnCV4+TwesIv7L602PAjNAGCn2gt7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777059480; c=relaxed/simple;
	bh=shTr/OhFopxcm1LwOdcD9YKD91tzLEGviOrvTk7U2IE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TwmMWrKoANehzB4qNYz8Mt4Q0aLKlmDhe+niYTrx46EyVKJvOy/pjLvDfqT+C4CP1Uk2MAx9xzB0rWvt6nH8oLkGZyBFfXe/Pj5IkmQ/EjIkw/c/4HMUlS5CF+NKKYxuKCJPeF8cb2hmqQyaObZcf6tFetZc1aTgcGqRJMvxGpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFDzHqec; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFDzHqec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777059478; x=1808595478;
  h=date:from:to:cc:subject:message-id;
  bh=shTr/OhFopxcm1LwOdcD9YKD91tzLEGviOrvTk7U2IE=;
  b=RFDzHqecf3FKrcXG+TO45ci299ekv5seyEs0PvuEaxckv0IxWW5+Vdy3
   CcWU7kzVd92WCzKtJTDZ5rw4y8zCqxRXSxquc7XFmcGfiHUG6XO44c/Zi
   AXANPDYlYsOn5AiwleEpAiJW8sB0WES0Ns8JImbWHHVKKqA8+XeIGbzS+
   +J98bwv4Enh4kToU1XBjKxIQrqYXcKKEAhvpk7v12S85ZVzmmCWAolSwX
   d84VzANoeMBqnaC7acbqcYxsNxKzF4laSeDXE0oZQMhOpVJqgLmq3u8Mw
   6jbdCS9MVXi9iq9rQ2HgZC8G0E8MorlxnFAaBzKP49/Jwqje/lJS5z6pc
   g==;
X-CSE-ConnectionGUID: SBNzdv3+RlaeRR44M9s8hg==
X-CSE-MsgGUID: 9FHWIx3rTRug1IEsvKc3HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="81900635"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="81900635"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:37:43 -0700
X-CSE-ConnectionGUID: MFvidGUdRiaUFE1tQ7avWA==
X-CSE-MsgGUID: hVZGX8oqTHWFe1lp1KUDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="263432499"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Apr 2026 12:37:40 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGMLK-0000000062z-2Lqh;
	Fri, 24 Apr 2026 19:37:38 +0000
Date: Sat, 25 Apr 2026 03:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 35/40]
 fs/bcachefs/alloc/foreground.c:560:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202604250359.wvhzkMqB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   b67fa5d1991810358f32532ca8c2003854fae054
commit: ca284ad06b139fe4dc8f053ada179473c1b71bb1 [35/40] bcachefs: alloc: filter spurious freelist_wait wakes on the waiter side
config: arc-randconfig-001-20260425 (https://download.01.org/0day-ci/archive/20260425/202604250359.wvhzkMqB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604250359.wvhzkMqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604250359.wvhzkMqB-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/alloc/foreground.c: In function 'bch2_bucket_alloc_trans':
>> fs/bcachefs/alloc/foreground.c:560:2: error: a label can only be part of a statement and a declaration is not a statement
     u32 wake_counter_snapshot = atomic_read(&ca->alloc_wake_counter);
     ^~~


vim +560 fs/bcachefs/alloc/foreground.c

   540	
   541	/**
   542	 * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
   543	 * @trans:	transaction object
   544	 * @req:	state for the entire allocation
   545	 *
   546	 * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
   547	 */
   548	static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
   549							   struct alloc_request *req)
   550	{
   551		struct bch_fs *c = trans->c;
   552		struct bch_dev *ca = req->ca;
   553		struct open_bucket *ob = NULL;
   554		bool freespace = READ_ONCE(ca->mi.freespace_initialized);
   555		bool waiting = false;
   556	
   557		req->btree_bitmap = req->data_type == BCH_DATA_btree;
   558		memset(&req->counters, 0, sizeof(req->counters));
   559	again:
 > 560		u32 wake_counter_snapshot = atomic_read(&ca->alloc_wake_counter);
   561		bch2_dev_usage_read_fast(ca, &req->usage);
   562		u64 avail = __dev_buckets_free(ca, req->usage, req->watermark);
   563	
   564		if (req->usage.buckets[BCH_DATA_need_discard] >
   565		    min(avail, ca->mi.nbuckets >> 7))
   566			bch2_do_discards_async(c);
   567	
   568		if (req->usage.buckets[BCH_DATA_need_gc_gens] > avail)
   569			bch2_gc_gens_async(c);
   570	
   571		if (should_invalidate_buckets(ca, req->usage))
   572			bch2_dev_do_invalidates(ca);
   573	
   574		if (!avail) {
   575			if (req->watermark > BCH_WATERMARK_normal &&
   576			    c->recovery.pass_done < BCH_RECOVERY_PASS_check_allocations)
   577				goto alloc;
   578	
   579			if (bch2_copygc_can_make_progress(ca)) {
   580				req->copygc_can_make_progress = true;
   581				bch2_copygc_wakeup(c);
   582			}
   583	
   584			track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
   585	
   586			if (req->cl &&
   587			    !(req->flags & BCH_WRITE_alloc_nowait) &&
   588			    !req->will_retry_target_devices &&
   589			    !req->will_retry_all_devices &&
   590			    !req->will_retry_set_devices) {
   591				if ((!req->copygc_can_make_progress ||
   592				     req->watermark == BCH_WATERMARK_copygc) &&
   593				    (req->nr_effective || (req->devs_have && req->devs_have->nr))) {
   594					ob = ERR_PTR(bch_err_throw(c, bucket_alloc_no_progress));
   595				} else if (!waiting) {
   596					closure_wait(&c->allocator.freelist_wait, req->cl);
   597					waiting = true;
   598					goto again;
   599				} else {
   600					ob = ERR_PTR(bch_err_throw(c, bucket_alloc_blocked));
   601				}
   602			} else {
   603				ob = ERR_PTR(bch_err_throw(c, freelist_empty));
   604			}
   605	
   606			goto err;
   607		}
   608	
   609		if (waiting)
   610			bch2_alloc_wake_dev(ca);
   611	alloc:
   612		ob = likely(freespace)
   613			? bch2_bucket_alloc_freelist(trans, req)
   614			: bch2_bucket_alloc_early(trans, req);
   615	
   616		if (!ob && req->btree_bitmap != BTREE_BITMAP_ANY) {
   617			req->btree_bitmap = BTREE_BITMAP_ANY;
   618			goto alloc;
   619		}
   620	
   621		if (!ob && freespace && c->recovery.pass_done < BCH_RECOVERY_PASS_check_alloc_info) {
   622			freespace = false;
   623			goto alloc;
   624		}
   625	err:
   626		if (!ob)
   627			ob = ERR_PTR(bch_err_throw(c, no_buckets_found));
   628	
   629		int ret = PTR_ERR_OR_ZERO(ob);
   630	
   631		if (!ret) {
   632			ob->data_type = req->data_type;
   633	
   634			event_inc_trace(c, bucket_alloc, buf,
   635				bucket_alloc_to_text(&buf, c, req, ob));
   636		} else if (bch2_err_matches(ret, BCH_ERR_open_buckets_empty) ||
   637			   bch2_err_matches(ret, BCH_ERR_open_bucket_alloc_blocked)) {
   638			event_inc_trace(c, open_bucket_alloc_fail, buf,
   639				bch2_fs_open_buckets_to_text(&buf, c));
   640		} else if (!bch2_err_matches(ret, BCH_ERR_transaction_restart) &&
   641			   !req->will_retry_target_devices &&
   642			   !req->will_retry_all_devices &&
   643			   !req->will_retry_set_devices)
   644			event_inc_trace(c, bucket_alloc_fail, buf,
   645				bucket_alloc_to_text(&buf, c, req, ob));
   646	
   647		alloc_trace_add(req, ca->dev_idx, ret, wake_counter_snapshot);
   648	
   649		return ob;
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
