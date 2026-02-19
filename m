Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD223EAB2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 04:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771474345; cv=none; b=m5/BdOjNz7sJ8/DvUWpUesUhFCODsS1OWlN1liBXgstVEug59ka+fkS3tEZjh82oBMCyguiemqDxvZZkQwydgeuOqWcGeawwQfXqrSjRfOCV++C5OGcxt5bQytGeuIw3M5XWM0AxM+KBNwxMlJP/K+j8tjwnssHNOjGisibTqmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771474345; c=relaxed/simple;
	bh=oNvPpql3zpNilsIyjQIOOnQEDaaeRLDjwCZw12S7yus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S5NIjQN2OwjQivWI+HoAgmaL1ps+tZZ7QdwS8TwDNLduqlB85r5RC9m8FdkWhK3ksHXV17KAZhXt5ssYwCMnHVkeQzCGDsKuHiGa2LPoKOO8prdZzOTxk8lF9SARURSeCQmhmrSV9ATPWErYHr0/YeEyKjifcs2D/UZTepj1oCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YweCXjel; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YweCXjel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771474342; x=1803010342;
  h=date:from:to:cc:subject:message-id;
  bh=oNvPpql3zpNilsIyjQIOOnQEDaaeRLDjwCZw12S7yus=;
  b=YweCXjel2tjNUTbAw6uDAVRDlPM951QdPIv99sNQcxU58/TDrw008Og6
   ncaRpV6xhHkR4U9FpZPVKA6eno06lzH5K2BFKE7Ai9qliJSRGAfOOBEaL
   5tcdSX8Ru+iZDn1K5m0e+pfT0bpLXjh9XSG6u1PQKlC1R+D6jyQVRUvrR
   DucckHXUbn4cbnrL+Cj9n2q3mKzkKfgyC6TnHqYOjnR1yUT/OKw+FlToX
   ab95U+njAvWnGHdt4kEaGCUH4D9iKu4wVwS/u8TvV74574awovwB2jidq
   o+PgkS05xqB1+iwknurJAcmZL6oWrF3DuB7jDTDLQbGgLbQHP7Bj9QATl
   A==;
X-CSE-ConnectionGUID: 3S0QhzfvTQmdXdi+PRSNGw==
X-CSE-MsgGUID: 8oeY3cB3SU2kb7OBoVNaFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="89967163"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="89967163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 20:12:22 -0800
X-CSE-ConnectionGUID: 8ocqCZrMQImK2Y1jyFZXcA==
X-CSE-MsgGUID: r3ywu210QxmTxTsDyEoqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218921879"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2026 20:12:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsvOj-000000012we-2n5H;
	Thu, 19 Feb 2026 04:12:17 +0000
Date: Thu, 19 Feb 2026 12:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 404/405]
 fs/bcachefs/alloc/background.c:810:33: warning: format '%u' expects argument
 of type 'unsigned int', but argument 6 has type '__u64' {aka 'long long
 unsigned int'}
Message-ID: <202602191232.c1dCtezV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3d8e2e3e57fe808ecc7fd11e9bbe1d2894116cf9
commit: 85cde1245a273a5b44dbb108f98d51c77468d730 [404/405] bcachefs: alloc trigger: convert BUG_ON to fsck_err for bucket going empty while not open
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260219/202602191232.c1dCtezV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602191232.c1dCtezV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602191232.c1dCtezV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/alloc/backpointers.h:13,
                    from fs/bcachefs/alloc/background.c:6:
   fs/bcachefs/alloc/background.c: In function 'bch2_trigger_alloc':
>> fs/bcachefs/alloc/background.c:810:33: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type '__u64' {aka 'long long unsigned int'} [-Wformat=]
     810 |                                 "bucket %u:%llu going empty but not open\n%s",
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     811 |                                 new.k->p.inode, new.k->p.offset,
         |                                 ~~~~~~~~~~~~~~
         |                                         |
         |                                         __u64 {aka long long unsigned int}
   fs/bcachefs/init/error.h:100:20: note: in definition of macro 'fsck_err_wrap'
     100 |         int _ret = _do;                                                 \
         |                    ^~~
   fs/bcachefs/init/error.h:110:47: note: in expansion of macro 'bch2_fsck_err'
     110 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                               ^~~~~~~~~~~~~
   fs/bcachefs/init/error.h:139:9: note: in expansion of macro '__fsck_err'
     139 |         __fsck_err(c, FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^~~~~~~~~~
   fs/bcachefs/init/error.h:145:17: note: in expansion of macro 'log_fsck_err'
     145 |                 log_fsck_err(__VA_ARGS__);                              \
         |                 ^~~~~~~~~~~~
   fs/bcachefs/alloc/background.c:808:25: note: in expansion of macro 'log_fsck_err_on'
     808 |                         log_fsck_err_on(true, trans,
         |                         ^~~~~~~~~~~~~~~
   fs/bcachefs/alloc/background.c:810:42: note: format string is defined here
     810 |                                 "bucket %u:%llu going empty but not open\n%s",
         |                                         ~^
         |                                          |
         |                                          unsigned int
         |                                         %llu


vim +810 fs/bcachefs/alloc/background.c

   770	
   771	int bch2_trigger_alloc(struct btree_trans *trans,
   772			       enum btree_id btree, unsigned level,
   773			       struct bkey_s_c old, struct bkey_s new,
   774			       enum btree_iter_update_trigger_flags flags)
   775	{
   776		struct bch_fs *c = trans->c;
   777		int ret = 0;
   778	
   779		CLASS(bch2_dev_bucket_tryget, ca)(c, new.k->p);
   780		if (!ca)
   781			return bch_err_throw(c, trigger_alloc);
   782	
   783		struct bch_alloc_v4 old_a_convert;
   784		const struct bch_alloc_v4 *old_a = bch2_alloc_to_v4(old, &old_a_convert);
   785	
   786		struct bch_alloc_v4 *new_a;
   787		if (likely(new.k->type == KEY_TYPE_alloc_v4)) {
   788			new_a = bkey_s_to_alloc_v4(new).v;
   789		} else {
   790			BUG_ON(!(flags & (BTREE_TRIGGER_gc|BTREE_TRIGGER_check_repair)));
   791	
   792			struct bkey_i_alloc_v4 *new_ka =
   793				errptr_try(bch2_alloc_to_v4_mut_inlined(trans, new.s_c));
   794			new_a = &new_ka->v;
   795		}
   796	
   797		if (flags & BTREE_TRIGGER_transactional) {
   798			alloc_data_type_set(new_a, new_a->data_type);
   799	
   800			int is_empty_delta = (int) data_type_is_empty(new_a->data_type) -
   801					     (int) data_type_is_empty(old_a->data_type);
   802	
   803			if (is_empty_delta < 0 &&
   804			    (new_a->data_type != BCH_DATA_sb &&
   805			     new_a->data_type != BCH_DATA_journal) &&
   806			    !bch2_bucket_is_open_safe(c, new.k->p.inode, new.k->p.offset)) {
   807				CLASS(printbuf, buf)();
   808				log_fsck_err_on(true, trans,
   809					alloc_key_bucket_nonempty_to_empty_not_open,
 > 810					"bucket %u:%llu going empty but not open\n%s",
   811					new.k->p.inode, new.k->p.offset,
   812					(bch2_bkey_val_to_text(&buf, c, new.s_c), buf.buf));
   813			}
   814	
   815			if (is_empty_delta < 0) {
   816				new_a->io_time[READ] = bch2_current_io_time(c, READ);
   817				new_a->io_time[WRITE]= bch2_current_io_time(c, WRITE);
   818				SET_BCH_ALLOC_V4_NEED_INC_GEN(new_a, true);
   819				SET_BCH_ALLOC_V4_NEED_DISCARD(new_a, true);
   820			}
   821	
   822			if (data_type_is_empty(new_a->data_type) &&
   823			    BCH_ALLOC_V4_NEED_INC_GEN(new_a) &&
   824			    !bch2_bucket_is_open_safe(c, new.k->p.inode, new.k->p.offset)) {
   825				if (new_a->oldest_gen == new_a->gen &&
   826				    !bch2_bucket_sectors_total(*new_a))
   827					new_a->oldest_gen++;
   828				new_a->gen++;
   829				SET_BCH_ALLOC_V4_NEED_INC_GEN(new_a, false);
   830				alloc_data_type_set(new_a, new_a->data_type);
   831			}
   832	
   833			if (old_a->data_type != new_a->data_type ||
   834			    (new_a->data_type == BCH_DATA_free &&
   835			     alloc_freespace_genbits(*old_a) != alloc_freespace_genbits(*new_a))) {
   836				try(bch2_bucket_do_index(trans, ca, old, old_a, false));
   837				try(bch2_bucket_do_index(trans, ca, new.s_c, new_a, true));
   838			}
   839	
   840			if (new_a->data_type == BCH_DATA_cached &&
   841			    !new_a->io_time[READ])
   842				new_a->io_time[READ] = bch2_current_io_time(c, READ);
   843	
   844			try(bch2_lru_change(trans, new.k->p.inode,
   845					    bucket_to_u64(new.k->p),
   846					    alloc_lru_idx_read(*old_a),
   847					    alloc_lru_idx_read(*new_a)));
   848	
   849			try(bch2_lru_change(trans,
   850					    BCH_LRU_BUCKET_FRAGMENTATION,
   851					    bucket_to_u64(new.k->p),
   852					    alloc_lru_idx_fragmentation(*old_a, ca),
   853					    alloc_lru_idx_fragmentation(*new_a, ca)));
   854	
   855			if (old_a->gen != new_a->gen)
   856				try(bch2_bucket_gen_update(trans, new.k->p, new_a->gen));
   857	
   858			try(bch2_alloc_key_to_dev_counters(trans, ca, old_a, new_a, flags));
   859		}
   860	
   861		if ((flags & BTREE_TRIGGER_atomic) && (flags & BTREE_TRIGGER_insert)) {
   862			u64 transaction_seq = trans->journal_res.seq;
   863			BUG_ON(!transaction_seq);
   864	
   865			CLASS(printbuf, buf)();
   866			if (log_fsck_err_on(transaction_seq && new_a->journal_seq_nonempty > transaction_seq,
   867					    trans, alloc_key_journal_seq_in_future,
   868					    "bucket journal seq in future (currently at %llu)\n%s",
   869					    journal_cur_seq(&c->journal),
   870					    (bch2_bkey_val_to_text(&buf, c, new.s_c), buf.buf)))
   871				new_a->journal_seq_nonempty = transaction_seq;
   872	
   873			int is_empty_delta = (int) data_type_is_empty(new_a->data_type) -
   874					     (int) data_type_is_empty(old_a->data_type);
   875	
   876			/*
   877			 * Record journal sequence number of empty -> nonempty transition:
   878			 * Note that there may be multiple empty -> nonempty
   879			 * transitions, data in a bucket may be overwritten while we're
   880			 * still writing to it - so be careful to only record the first:
   881			 * */
   882			if (is_empty_delta < 0 &&
   883			    new_a->journal_seq_empty <= c->journal.flushed_seq_ondisk) {
   884				new_a->journal_seq_nonempty	= transaction_seq;
   885				new_a->journal_seq_empty	= 0;
   886			}
   887	
   888			/*
   889			 * Bucket becomes empty: mark it as waiting for a journal flush,
   890			 * unless updates since empty -> nonempty transition were never
   891			 * flushed - we may need to ask the journal not to flush
   892			 * intermediate sequence numbers:
   893			 */
   894			if (is_empty_delta > 0) {
   895				if (new_a->journal_seq_nonempty == transaction_seq ||
   896				    bch2_journal_noflush_seq(&c->journal,
   897							     new_a->journal_seq_nonempty,
   898							     transaction_seq)) {
   899					new_a->journal_seq_nonempty = new_a->journal_seq_empty = 0;
   900				} else {
   901					new_a->journal_seq_empty = transaction_seq;
   902	
   903					ret = bch2_set_bucket_needs_journal_commit(&c->buckets_waiting_for_journal,
   904										   c->journal.flushed_seq_ondisk,
   905										   new.k->p.inode, new.k->p.offset,
   906										   transaction_seq);
   907					if (bch2_fs_fatal_err_on(ret, c,
   908							"setting bucket_needs_journal_commit: %s",
   909							bch2_err_str(ret)))
   910						return ret;
   911				}
   912			}
   913	
   914			if (new_a->gen != old_a->gen) {
   915				guard(rcu)();
   916				u8 *gen = bucket_gen(ca, new.k->p.offset);
   917				if (unlikely(!gen))
   918					return inval_bucket_key(trans, new.s_c);
   919				*gen = new_a->gen;
   920			}
   921	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
