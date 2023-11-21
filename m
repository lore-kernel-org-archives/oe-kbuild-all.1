Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47B2D60C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvMS2M+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700558127; x=1732094127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctb89/DHmfpjX4VccFpTj38fnlCWleZuMsgV3lfv0Cc=;
  b=HvMS2M+pMdLXwiaZ1RikoR4shXElvQ5rz702Shu6blpFAX6YTteLRqXB
   k2SoiXAwLketdRzh3pXuPluPwzcfbA9MilKv67BiHHzxuVW0DUz/f7Fhw
   mRB+2nX1zEN6XV0CiOTQcghTnNLSbrbuvqowrdFuo00XFtKw2ugz6c8Yd
   D70RUoYognIulwovTDMVaHcdR5l/9DWuJQCfHFNJFxJQzY2kWiINcM8Cd
   hY0T48pqonCvUDTtBPyTpC5wpSNv5DPo3xAUvPXs1IbQPWcoGwG20Ao7p
   UtqC0FDZ8TfGtXYyjjWXKhHbWAGFlLHEpmdr49rYYJTrFJ6VE9+2Sp2O6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422897991"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422897991"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:15:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766581380"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766581380"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 01:15:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Mqd-0007dg-1e;
	Tue, 21 Nov 2023 09:15:17 +0000
Date: Tue, 21 Nov 2023 17:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1705/2217]
 fs/bcachefs/btree_write_buffer.c:216:25: error: implicit declaration of
 function 'prefetch'
Message-ID: <202311211650.4gRNvqfL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07b677953b9dca02928be323e2db853511305fa9
commit: 9e5a6c7797b240f138b9bdd75d85d8f7c6f0e06d [1705/2217] bcachefs: btree write buffer now slurps keys from journal
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311211650.4gRNvqfL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211650.4gRNvqfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211650.4gRNvqfL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs.h:206,
                    from fs/bcachefs/btree_write_buffer.c:3:
   fs/bcachefs/bcachefs_format.h:215:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     215 |         struct bpos     p;
         |                         ^
   fs/bcachefs/bcachefs_format.h:217:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
     217 |         struct bversion version;
         |                         ^~~~~~~
   In file included from fs/bcachefs/bcachefs.h:421:
   fs/bcachefs/btree_write_buffer_types.h:23:9: warning: alignment 1 of 'struct <anonymous>' is less than 4 [-Wpacked-not-aligned]
      23 |         } __packed;
         |         ^
   fs/bcachefs/btree_write_buffer_types.h:20:49: warning: 'pos' offset 1 in 'struct <anonymous>' isn't aligned to 4 [-Wpacked-not-aligned]
      20 |                 struct bpos                     pos;
         |                                                 ^~~
   In file included from fs/bcachefs/btree_write_buffer.c:8:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~
   fs/bcachefs/btree_write_buffer.c: In function 'bch2_btree_write_buffer_flush_locked':
>> fs/bcachefs/btree_write_buffer.c:216:25: error: implicit declaration of function 'prefetch' [-Werror=implicit-function-declaration]
     216 |                         prefetch(&wb->flushing.keys.data[n->idx]);
         |                         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/prefetch +216 fs/bcachefs/btree_write_buffer.c

   168	
   169	static int bch2_btree_write_buffer_flush_locked(struct btree_trans *trans)
   170	{
   171		struct bch_fs *c = trans->c;
   172		struct journal *j = &c->journal;
   173		struct btree_write_buffer *wb = &c->btree_write_buffer;
   174		struct wb_key_ref *i;
   175		struct btree_iter iter = { NULL };
   176		size_t skipped = 0, fast = 0, slowpath = 0;
   177		bool write_locked = false;
   178		int ret = 0;
   179	
   180		bch2_trans_unlock(trans);
   181		bch2_trans_begin(trans);
   182	
   183		mutex_lock(&wb->inc.lock);
   184		move_keys_from_inc_to_flushing(wb);
   185		mutex_unlock(&wb->inc.lock);
   186	
   187		for (size_t i = 0; i < wb->flushing.keys.nr; i++) {
   188			wb->sorted.data[i].idx = i;
   189			wb->sorted.data[i].btree = wb->flushing.keys.data[i].btree;
   190			wb->sorted.data[i].pos = wb->flushing.keys.data[i].k.k.p;
   191		}
   192		wb->sorted.nr = wb->flushing.keys.nr;
   193	
   194		/*
   195		 * We first sort so that we can detect and skip redundant updates, and
   196		 * then we attempt to flush in sorted btree order, as this is most
   197		 * efficient.
   198		 *
   199		 * However, since we're not flushing in the order they appear in the
   200		 * journal we won't be able to drop our journal pin until everything is
   201		 * flushed - which means this could deadlock the journal if we weren't
   202		 * passing BCH_TRANS_COMMIT_journal_reclaim. This causes the update to fail
   203		 * if it would block taking a journal reservation.
   204		 *
   205		 * If that happens, simply skip the key so we can optimistically insert
   206		 * as many keys as possible in the fast path.
   207		 */
   208		sort(wb->sorted.data, wb->sorted.nr,
   209		     sizeof(wb->sorted.data[0]),
   210		     wb_key_cmp, NULL);
   211	
   212		darray_for_each(wb->sorted, i) {
   213			struct btree_write_buffered_key *k = &wb->flushing.keys.data[i->idx];
   214	
   215			for (struct wb_key_ref *n = i + 1; n < min(i + 4, &darray_top(wb->sorted)); n++)
 > 216				prefetch(&wb->flushing.keys.data[n->idx]);
   217	
   218			BUG_ON(!k->journal_seq);
   219	
   220			if (i + 1 < &darray_top(wb->sorted) &&
   221			    i[0].btree == i[1].btree &&
   222			    bpos_eq(i[0].pos, i[1].pos)) {
   223				struct btree_write_buffered_key *n = &wb->flushing.keys.data[i[1].idx];
   224	
   225				skipped++;
   226				n->journal_seq = min_t(u64, n->journal_seq, k->journal_seq);;
   227				k->journal_seq = 0;
   228				continue;
   229			}
   230	
   231			if (write_locked &&
   232			    (iter.path->btree_id != k->btree ||
   233			     bpos_gt(k->k.k.p, iter.path->l[0].b->key.k.p))) {
   234				bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
   235				write_locked = false;
   236			}
   237	
   238			if (!iter.path || iter.path->btree_id != k->btree) {
   239				bch2_trans_iter_exit(trans, &iter);
   240				bch2_trans_iter_init(trans, &iter, k->btree, k->k.k.p,
   241						     BTREE_ITER_INTENT|BTREE_ITER_ALL_SNAPSHOTS);
   242			}
   243	
   244			bch2_btree_iter_set_pos(&iter, k->k.k.p);
   245			iter.path->preserve = false;
   246	
   247			do {
   248				if (race_fault()) {
   249					ret = -BCH_ERR_journal_reclaim_would_deadlock;
   250					break;
   251				}
   252	
   253				ret = wb_flush_one(trans, &iter, k, &write_locked, &fast);
   254				if (!write_locked)
   255					bch2_trans_begin(trans);
   256			} while (bch2_err_matches(ret, BCH_ERR_transaction_restart));
   257	
   258			if (!ret) {
   259				k->journal_seq = 0;
   260			} else if (ret == -BCH_ERR_journal_reclaim_would_deadlock) {
   261				slowpath++;
   262				ret = 0;
   263			} else
   264				break;
   265		}
   266	
   267		if (write_locked)
   268			bch2_btree_node_unlock_write(trans, iter.path, iter.path->l[0].b);
   269		bch2_trans_iter_exit(trans, &iter);
   270	
   271		if (ret)
   272			goto err;
   273	
   274		if (slowpath) {
   275			/*
   276			 * Flush in the order they were present in the journal, so that
   277			 * we can release journal pins:
   278			 * The fastpath zapped the seq of keys that were successfully flushed so
   279			 * we can skip those here.
   280			 */
   281			trace_write_buffer_flush_slowpath(trans, slowpath, wb->flushing.keys.nr);
   282	
   283			struct btree_write_buffered_key *i;
   284			darray_for_each(wb->flushing.keys, i) {
   285				if (!i->journal_seq)
   286					continue;
   287	
   288				bch2_journal_pin_update(j, i->journal_seq, &wb->flushing.pin,
   289							bch2_btree_write_buffer_journal_flush);
   290	
   291				bch2_trans_begin(trans);
   292	
   293				ret = commit_do(trans, NULL, NULL,
   294						BCH_WATERMARK_reclaim|
   295						BCH_TRANS_COMMIT_no_check_rw|
   296						BCH_TRANS_COMMIT_no_enospc|
   297						BCH_TRANS_COMMIT_no_journal_res|
   298						BCH_TRANS_COMMIT_journal_reclaim,
   299						btree_write_buffered_insert(trans, i));
   300				if (ret)
   301					goto err;
   302			}
   303		}
   304	err:
   305		bch2_fs_fatal_err_on(ret, c, "%s: insert error %s", __func__, bch2_err_str(ret));
   306		trace_write_buffer_flush(trans, wb->flushing.keys.nr, skipped, fast, 0);
   307		bch2_journal_pin_drop(j, &wb->flushing.pin);
   308		wb->flushing.keys.nr = 0;
   309		return ret;
   310	}
   311	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
