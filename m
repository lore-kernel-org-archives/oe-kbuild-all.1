Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7AF9C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742608854; cv=none; b=dBhL7QJWOfBWAeuYdCmNxXll1MPLxeOcGnjjjcxNWiAeXz2Ng59c03MbE2in4OE6CSvGrfwjAnFzKfDtjCdqPw0rWtPn+O16QkPY5TngN5nzl2/hwSeXJM9U+AvbGR7l1tSNfIsehEQ/apynRfX/uVA84kWe+k77MAZmfnKG9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742608854; c=relaxed/simple;
	bh=JZQadwrseoEljFFjs4ozi79JK4DY4Py/rYrJDcxrlMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dv/Ta3PS+2exRulEXaReo1185lCLLXTg4U5qUvQij/WRgjN9H/X+1gy1Yk8LLF5BeITN/dmpgSF4kQLDZcnnoRP0VvVYuUXmwI4yp0mOjmpDgIH8856AEnPl6umgPTtgOZbKLGZX8uQHcAg1rz3HgYOzKnLXd89y/nXyYduWiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTIUxoO2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTIUxoO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742608852; x=1774144852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZQadwrseoEljFFjs4ozi79JK4DY4Py/rYrJDcxrlMQ=;
  b=mTIUxoO2YC44htZGs2IaTj/EP2joQlRcuKbr6mRG06htUXJIX8v7/aFl
   P+53mkMnxavwVk0mYRJrsuHgA21ds4U8Gs6jpaI1UoQNu6t1jhBvi+55K
   c9Rd5HmHiK/VNg7v8U4KwQPGrV0bg7V2b+wgUchBGvSZs/HAz72uYrV6G
   SFBQz7e4Rj0BZ43gvcJfXzScjJFYtpV0h3vQoM3Rub98A7MxdxPATsnqs
   wCM0OyJzE3P+MMyeu+POHxPb9wG3VrlhJ91bU+CYCCaMwIrbMzOozcoOI
   cbc9aRhZ3UKxKV3A7sjnsuIb0RGnioEgJhpTukgOpFhyGa26BNgwKcoU6
   Q==;
X-CSE-ConnectionGUID: psox3uDwTi+ZmTvnHvpvrQ==
X-CSE-MsgGUID: XeP5KeyQQpiM08OOt86M3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47542270"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="47542270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 19:00:51 -0700
X-CSE-ConnectionGUID: oj9RDOK1QmybJ78oZLbcgw==
X-CSE-MsgGUID: C3F7ZxHOTYC0bvdsgbEcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123505755"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Mar 2025 19:00:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvoAJ-0001qZ-1R;
	Sat, 22 Mar 2025 02:00:47 +0000
Date: Sat, 22 Mar 2025 10:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 188/192]
 fs/bcachefs/btree_iter.c:2331: warning: Function parameter or struct member
 'trans' not described in 'bch2_btree_iter_peek_max'
Message-ID: <202503220928.hoq4rl3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a4cb6dcf0a1d7fedcf5f179422af82f092892b8a
commit: 6dce3998b958bfc09e5dda7888fe44f76c438277 [188/192] bcachefs: Kill btree_iter.trans
config: i386-buildonly-randconfig-003-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220928.hoq4rl3e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220928.hoq4rl3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220928.hoq4rl3e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_iter.c:2331: warning: Function parameter or struct member 'trans' not described in 'bch2_btree_iter_peek_max'
>> fs/bcachefs/btree_iter.c:2491: warning: Function parameter or struct member 'trans' not described in 'bch2_btree_iter_next'
>> fs/bcachefs/btree_iter.c:2583: warning: Function parameter or struct member 'trans' not described in 'bch2_btree_iter_peek_prev_min'
>> fs/bcachefs/btree_iter.c:2726: warning: Function parameter or struct member 'trans' not described in 'bch2_btree_iter_prev'


vim +2331 fs/bcachefs/btree_iter.c

a1e82d35f89793 Kent Overstreet 2022-01-09  2320  
a1e82d35f89793 Kent Overstreet 2022-01-09  2321  /**
000fe8d573c4f2 Kent Overstreet 2024-10-24  2322   * bch2_btree_iter_peek_max() - returns first key greater than or equal to
96dea3d599dbc3 Kent Overstreet 2023-09-12  2323   * iterator's current position
96dea3d599dbc3 Kent Overstreet 2023-09-12  2324   * @iter:	iterator to peek from
96dea3d599dbc3 Kent Overstreet 2023-09-12  2325   * @end:	search limit: returns keys less than or equal to @end
96dea3d599dbc3 Kent Overstreet 2023-09-12  2326   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  2327   * Returns:	key if found, or an error extractable with bkey_err().
a1e82d35f89793 Kent Overstreet 2022-01-09  2328   */
6dce3998b958bf Kent Overstreet 2025-03-21  2329  struct bkey_s_c bch2_btree_iter_peek_max(struct btree_trans *trans, struct btree_iter *iter,
6dce3998b958bf Kent Overstreet 2025-03-21  2330  					 struct bpos end)
a1e82d35f89793 Kent Overstreet 2022-01-09 @2331  {
a1e82d35f89793 Kent Overstreet 2022-01-09  2332  	struct bpos search_key = btree_iter_search_key(iter);
a1e82d35f89793 Kent Overstreet 2022-01-09  2333  	struct bkey_s_c k;
db6e584b851455 Kent Overstreet 2024-10-25  2334  	struct bpos iter_pos = iter->pos;
a1e82d35f89793 Kent Overstreet 2022-01-09  2335  	int ret;
a1e82d35f89793 Kent Overstreet 2022-01-09  2336  
b318882022a8ab Kent Overstreet 2024-10-27  2337  	bch2_trans_verify_not_unlocked_or_in_restart(trans);
db6e584b851455 Kent Overstreet 2024-10-25  2338  	bch2_btree_iter_verify_entry_exit(iter);
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2339  	EBUG_ON((iter->flags & BTREE_ITER_filter_snapshots) && bkey_eq(end, POS_MAX));
b0babf2a34233c Kent Overstreet 2022-04-12  2340  
9cf6b84b71adb9 Kent Overstreet 2024-09-23  2341  	ret = trans_maybe_inject_restart(trans, _RET_IP_);
9cf6b84b71adb9 Kent Overstreet 2024-09-23  2342  	if (unlikely(ret)) {
9cf6b84b71adb9 Kent Overstreet 2024-09-23  2343  		k = bkey_s_c_err(ret);
9cf6b84b71adb9 Kent Overstreet 2024-09-23  2344  		goto out_no_locked;
9cf6b84b71adb9 Kent Overstreet 2024-09-23  2345  	}
9cf6b84b71adb9 Kent Overstreet 2024-09-23  2346  
1f2d9192502917 Kent Overstreet 2022-01-08  2347  	if (iter->update_path) {
07f383c71fadc9 Kent Overstreet 2023-12-04  2348  		bch2_path_put_nokeep(trans, iter->update_path,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2349  				     iter->flags & BTREE_ITER_intent);
07f383c71fadc9 Kent Overstreet 2023-12-04  2350  		iter->update_path = 0;
1f2d9192502917 Kent Overstreet 2022-01-08  2351  	}
1f2d9192502917 Kent Overstreet 2022-01-08  2352  
a1e82d35f89793 Kent Overstreet 2022-01-09  2353  	while (1) {
6dce3998b958bf Kent Overstreet 2025-03-21  2354  		k = __bch2_btree_iter_peek(trans, iter, search_key);
c72f687a1ff180 Kent Overstreet 2022-10-11  2355  		if (unlikely(!k.k))
c72f687a1ff180 Kent Overstreet 2022-10-11  2356  			goto end;
c72f687a1ff180 Kent Overstreet 2022-10-11  2357  		if (unlikely(bkey_err(k)))
fd211bc71c9b40 Kent Overstreet 2022-08-10  2358  			goto out_no_locked;
a1e82d35f89793 Kent Overstreet 2022-01-09  2359  
db6e584b851455 Kent Overstreet 2024-10-25  2360  		if (iter->flags & BTREE_ITER_filter_snapshots) {
85d8cf161f9899 Kent Overstreet 2022-03-11  2361  			/*
fa014953f9409e Kent Overstreet 2023-12-29  2362  			 * We need to check against @end before FILTER_SNAPSHOTS because
fa014953f9409e Kent Overstreet 2023-12-29  2363  			 * if we get to a different inode that requested we might be
fa014953f9409e Kent Overstreet 2023-12-29  2364  			 * seeing keys for a different snapshot tree that will all be
fa014953f9409e Kent Overstreet 2023-12-29  2365  			 * filtered out.
fa014953f9409e Kent Overstreet 2023-12-29  2366  			 *
fa014953f9409e Kent Overstreet 2023-12-29  2367  			 * But we can't do the full check here, because bkey_start_pos()
fa014953f9409e Kent Overstreet 2023-12-29  2368  			 * isn't monotonically increasing before FILTER_SNAPSHOTS, and
fa014953f9409e Kent Overstreet 2023-12-29  2369  			 * that's what we check against in extents mode:
85d8cf161f9899 Kent Overstreet 2022-03-11  2370  			 */
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2371  			if (unlikely(!(iter->flags & BTREE_ITER_is_extents)
204f45140faa07 Kent Overstreet 2024-02-24  2372  				     ? bkey_gt(k.k->p, end)
204f45140faa07 Kent Overstreet 2024-02-24  2373  				     : k.k->p.inode > end.inode))
c72f687a1ff180 Kent Overstreet 2022-10-11  2374  				goto end;
85d8cf161f9899 Kent Overstreet 2022-03-11  2375  
1f2d9192502917 Kent Overstreet 2022-01-08  2376  			if (iter->update_path &&
07f383c71fadc9 Kent Overstreet 2023-12-04  2377  			    !bkey_eq(trans->paths[iter->update_path].pos, k.k->p)) {
07f383c71fadc9 Kent Overstreet 2023-12-04  2378  				bch2_path_put_nokeep(trans, iter->update_path,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2379  						     iter->flags & BTREE_ITER_intent);
07f383c71fadc9 Kent Overstreet 2023-12-04  2380  				iter->update_path = 0;
1f2d9192502917 Kent Overstreet 2022-01-08  2381  			}
1f2d9192502917 Kent Overstreet 2022-01-08  2382  
db6e584b851455 Kent Overstreet 2024-10-25  2383  			if ((iter->flags & BTREE_ITER_intent) &&
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2384  			    !(iter->flags & BTREE_ITER_is_extents) &&
1f2d9192502917 Kent Overstreet 2022-01-08  2385  			    !iter->update_path) {
1f2d9192502917 Kent Overstreet 2022-01-08  2386  				struct bpos pos = k.k->p;
1f2d9192502917 Kent Overstreet 2022-01-08  2387  
1f2d9192502917 Kent Overstreet 2022-01-08  2388  				if (pos.snapshot < iter->snapshot) {
1f2d9192502917 Kent Overstreet 2022-01-08  2389  					search_key = bpos_successor(k.k->p);
1f2d9192502917 Kent Overstreet 2022-01-08  2390  					continue;
1f2d9192502917 Kent Overstreet 2022-01-08  2391  				}
1f2d9192502917 Kent Overstreet 2022-01-08  2392  
1f2d9192502917 Kent Overstreet 2022-01-08  2393  				pos.snapshot = iter->snapshot;
1f2d9192502917 Kent Overstreet 2022-01-08  2394  
1f2d9192502917 Kent Overstreet 2022-01-08  2395  				/*
1f2d9192502917 Kent Overstreet 2022-01-08  2396  				 * advance, same as on exit for iter->path, but only up
1f2d9192502917 Kent Overstreet 2022-01-08  2397  				 * to snapshot
1f2d9192502917 Kent Overstreet 2022-01-08  2398  				 */
abbfc4db50e27a Kent Overstreet 2024-07-16  2399  				__btree_path_get(trans, trans->paths + iter->path, iter->flags & BTREE_ITER_intent);
1f2d9192502917 Kent Overstreet 2022-01-08  2400  				iter->update_path = iter->path;
1f2d9192502917 Kent Overstreet 2022-01-08  2401  
07f383c71fadc9 Kent Overstreet 2023-12-04  2402  				iter->update_path = bch2_btree_path_set_pos(trans,
07f383c71fadc9 Kent Overstreet 2023-12-04  2403  							iter->update_path, pos,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2404  							iter->flags & BTREE_ITER_intent,
ee2c6ea7760ece Kent Overstreet 2023-01-09  2405  							_THIS_IP_);
07f383c71fadc9 Kent Overstreet 2023-12-04  2406  				ret = bch2_btree_path_traverse(trans, iter->update_path, iter->flags);
ef0732861a3af5 Kent Overstreet 2022-12-09  2407  				if (unlikely(ret)) {
ef0732861a3af5 Kent Overstreet 2022-12-09  2408  					k = bkey_s_c_err(ret);
ef0732861a3af5 Kent Overstreet 2022-12-09  2409  					goto out_no_locked;
ef0732861a3af5 Kent Overstreet 2022-12-09  2410  				}
1f2d9192502917 Kent Overstreet 2022-01-08  2411  			}
1f2d9192502917 Kent Overstreet 2022-01-08  2412  
c075ff700ff397 Kent Overstreet 2021-03-04  2413  			/*
c075ff700ff397 Kent Overstreet 2021-03-04  2414  			 * We can never have a key in a leaf node at POS_MAX, so
c075ff700ff397 Kent Overstreet 2021-03-04  2415  			 * we don't have to check these successor() calls:
c075ff700ff397 Kent Overstreet 2021-03-04  2416  			 */
db6e584b851455 Kent Overstreet 2024-10-25  2417  			if (!bch2_snapshot_is_ancestor(trans->c,
c075ff700ff397 Kent Overstreet 2021-03-04  2418  						       iter->snapshot,
c075ff700ff397 Kent Overstreet 2021-03-04  2419  						       k.k->p.snapshot)) {
c075ff700ff397 Kent Overstreet 2021-03-04  2420  				search_key = bpos_successor(k.k->p);
c075ff700ff397 Kent Overstreet 2021-03-04  2421  				continue;
c075ff700ff397 Kent Overstreet 2021-03-04  2422  			}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2423  
b9a37144da8d5c Kent Overstreet 2024-12-13  2424  			if (bkey_whiteout(k.k) &&
b9a37144da8d5c Kent Overstreet 2024-12-13  2425  			    !(iter->flags & BTREE_ITER_key_cache_fill)) {
e6e024e9bf250e Kent Overstreet 2021-08-24  2426  				search_key = bkey_successor(iter, k.k->p);
c075ff700ff397 Kent Overstreet 2021-03-04  2427  				continue;
c075ff700ff397 Kent Overstreet 2021-03-04  2428  			}
db6e584b851455 Kent Overstreet 2024-10-25  2429  		}
c075ff700ff397 Kent Overstreet 2021-03-04  2430  
fa014953f9409e Kent Overstreet 2023-12-29  2431  		/*
fa014953f9409e Kent Overstreet 2023-12-29  2432  		 * iter->pos should be mononotically increasing, and always be
fa014953f9409e Kent Overstreet 2023-12-29  2433  		 * equal to the key we just returned - except extents can
fa014953f9409e Kent Overstreet 2023-12-29  2434  		 * straddle iter->pos:
fa014953f9409e Kent Overstreet 2023-12-29  2435  		 */
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2436  		if (!(iter->flags & BTREE_ITER_is_extents))
fa014953f9409e Kent Overstreet 2023-12-29  2437  			iter_pos = k.k->p;
fa014953f9409e Kent Overstreet 2023-12-29  2438  		else
fa014953f9409e Kent Overstreet 2023-12-29  2439  			iter_pos = bkey_max(iter->pos, bkey_start_pos(k.k));
fa014953f9409e Kent Overstreet 2023-12-29  2440  
12f286085bf592 Kent Overstreet 2024-10-04  2441  		if (unlikely(iter->flags & BTREE_ITER_all_snapshots	? bpos_gt(iter_pos, end) :
12f286085bf592 Kent Overstreet 2024-10-04  2442  			     iter->flags & BTREE_ITER_is_extents	? bkey_ge(iter_pos, end) :
12f286085bf592 Kent Overstreet 2024-10-04  2443  									  bkey_gt(iter_pos, end)))
fa014953f9409e Kent Overstreet 2023-12-29  2444  			goto end;
fa014953f9409e Kent Overstreet 2023-12-29  2445  
c075ff700ff397 Kent Overstreet 2021-03-04  2446  		break;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2447  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2448  
85d8cf161f9899 Kent Overstreet 2022-03-11  2449  	iter->pos = iter_pos;
1f2d9192502917 Kent Overstreet 2022-01-08  2450  
07f383c71fadc9 Kent Overstreet 2023-12-04  2451  	iter->path = bch2_btree_path_set_pos(trans, iter->path, k.k->p,
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2452  				iter->flags & BTREE_ITER_intent,
ee2c6ea7760ece Kent Overstreet 2023-01-09  2453  				btree_iter_ip_allocated(iter));
fd211bc71c9b40 Kent Overstreet 2022-08-10  2454  
32ed4a620c5405 Kent Overstreet 2022-08-10  2455  	btree_path_set_should_be_locked(trans, btree_iter_path(trans, iter));
fd211bc71c9b40 Kent Overstreet 2022-08-10  2456  out_no_locked:
1f2d9192502917 Kent Overstreet 2022-01-08  2457  	if (iter->update_path) {
07f383c71fadc9 Kent Overstreet 2023-12-04  2458  		ret = bch2_btree_path_relock(trans, trans->paths + iter->update_path, _THIS_IP_);
fd211bc71c9b40 Kent Overstreet 2022-08-10  2459  		if (unlikely(ret))
549d173c1bd9b5 Kent Overstreet 2022-07-17  2460  			k = bkey_s_c_err(ret);
fd211bc71c9b40 Kent Overstreet 2022-08-10  2461  		else
32ed4a620c5405 Kent Overstreet 2022-08-10  2462  			btree_path_set_should_be_locked(trans, trans->paths + iter->update_path);
d4d24a6509548a Kent Overstreet 2022-03-10  2463  	}
1f2d9192502917 Kent Overstreet 2022-01-08  2464  
5dd8c60e1e0448 Kent Overstreet 2024-04-07  2465  	if (!(iter->flags & BTREE_ITER_all_snapshots))
c075ff700ff397 Kent Overstreet 2021-03-04  2466  		iter->pos.snapshot = iter->snapshot;
c075ff700ff397 Kent Overstreet 2021-03-04  2467  
6dce3998b958bf Kent Overstreet 2025-03-21  2468  	ret = bch2_btree_iter_verify_ret(trans, iter, k);
a1e82d35f89793 Kent Overstreet 2022-01-09  2469  	if (unlikely(ret)) {
6dce3998b958bf Kent Overstreet 2025-03-21  2470  		bch2_btree_iter_set_pos(trans, iter, iter->pos);
a1e82d35f89793 Kent Overstreet 2022-01-09  2471  		k = bkey_s_c_err(ret);
a1e82d35f89793 Kent Overstreet 2022-01-09  2472  	}
67e0dd8f0d8b4b Kent Overstreet 2021-08-30  2473  
7e1a3aa9dfcb9c Kent Overstreet 2021-02-11  2474  	bch2_btree_iter_verify_entry_exit(iter);
c075ff700ff397 Kent Overstreet 2021-03-04  2475  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2476  	return k;
c72f687a1ff180 Kent Overstreet 2022-10-11  2477  end:
6dce3998b958bf Kent Overstreet 2025-03-21  2478  	bch2_btree_iter_set_pos(trans, iter, end);
c72f687a1ff180 Kent Overstreet 2022-10-11  2479  	k = bkey_s_c_null;
c72f687a1ff180 Kent Overstreet 2022-10-11  2480  	goto out_no_locked;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2481  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2482  
f4b613410ccf9e Kent Overstreet 2019-09-07  2483  /**
96dea3d599dbc3 Kent Overstreet 2023-09-12  2484   * bch2_btree_iter_next() - returns first key greater than iterator's current
f4b613410ccf9e Kent Overstreet 2019-09-07  2485   * position
96dea3d599dbc3 Kent Overstreet 2023-09-12  2486   * @iter:	iterator to peek from
96dea3d599dbc3 Kent Overstreet 2023-09-12  2487   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  2488   * Returns:	key if found, or an error extractable with bkey_err().
f4b613410ccf9e Kent Overstreet 2019-09-07  2489   */
6dce3998b958bf Kent Overstreet 2025-03-21  2490  struct bkey_s_c bch2_btree_iter_next(struct btree_trans *trans, struct btree_iter *iter)
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @2491  {
6dce3998b958bf Kent Overstreet 2025-03-21  2492  	if (!bch2_btree_iter_advance(trans, iter))
2e70ce56343281 Kent Overstreet 2020-02-18  2493  		return bkey_s_c_null;
0e6dd8fba04499 Kent Overstreet 2019-05-15  2494  
6dce3998b958bf Kent Overstreet 2025-03-21  2495  	return bch2_btree_iter_peek(trans, iter);
14989d547ee308 Kent Overstreet 2019-10-09  2496  }
14989d547ee308 Kent Overstreet 2019-10-09  2497  

:::::: The code at line 2331 was first introduced by commit
:::::: a1e82d35f89793f6347945ab48d799ce1802df87 bcachefs: Refactor bch2_btree_iter()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
