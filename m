Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A6364031
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584564; cv=none; b=PVv1rQvxg+nzPEd3EPfpfCsNN5IuOAuejZJJTwZ7cFk3f1B7+AVokoYXdbU1hmB6tUJcQX+CGqAkBqA1wJOb5FiauTRzMvAaFOoR9k6FIXjayEzM1HWZIq+ymlF2+Bd4mV4J3gf1rWE0e6rMSHgkHyla5RvYNDKIYqfs294+61s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584564; c=relaxed/simple;
	bh=letkaNW+KsRJwNhsLzDo/L/trj/ItODkbszkkt/x870=;
	h=Date:From:To:Cc:Subject:Message-ID; b=akin4Oq0h0bmg0m5S7I690tzWYOJTCN5TXbBMEa7RxCv8r7MGeZNv5TY71O9HOoXWKgNHfinoN47LGhno4E9ZXoA3nuV/jKu0vvAGekJ48zfDcnQKOyFr0hCHoggDIPB+DOjd4SqMYp0D800J+sfx8KKth3G1e8SGUtM4pU8ZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NernkZCo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NernkZCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766584562; x=1798120562;
  h=date:from:to:cc:subject:message-id;
  bh=letkaNW+KsRJwNhsLzDo/L/trj/ItODkbszkkt/x870=;
  b=NernkZCoEntpczRYJPja3QeIZ9giiPer584ccBLfbTXlE18C4NpRx03M
   5iOwAUDR/EctO7q0UUA01qZR2Ayx0zOr5twRM4GnwLsJ/T21SwRH3pGlu
   XQ7smlCfShqliRXmh6qygFRdIsuQkXjP0O8Eo/Ro77ONf9s2jRFbUG7Jb
   07VPcsBstYbOJVX0edrDLmF+P+vpN8llQ83/Ra1LrdoXwgcWGEYjzjv0S
   rItCFXE0aSCoPRMO5uId83dZzN6+TKBaJdx29hhZBUXfgOE8P8s4QE6dr
   AZ4nVB3Ps1ke6xzlxjcaR1Cn5pt2uEm5g1lajzYJfc/CWSzIuomAL1mwp
   g==;
X-CSE-ConnectionGUID: PM1lk3KAQ1+UWCTfr+abQQ==
X-CSE-MsgGUID: +pkml5ZBR2q3tXdRixbclg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79541248"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79541248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 05:56:01 -0800
X-CSE-ConnectionGUID: jHAQ//KoSJugTlRIcksBNg==
X-CSE-MsgGUID: Ewx4bi33SjGFBo/jTeY9bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="223508452"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2025 05:56:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYPLK-00000000383-0L18;
	Wed, 24 Dec 2025 13:55:58 +0000
Date: Wed, 24 Dec 2025 21:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 476/799]
 fs/bcachefs/init/fs.c:1177:25: warning: result of comparison of constant
 262144 with expression of type 'u16' (aka 'unsigned short') is always false
Message-ID: <202512242140.AVTUlyqU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: bf25974be5b42c0341a7f17cb7e6e835d80b41e6 [476/799] bcachefs: split out init/dev.c
config: hexagon-randconfig-r051-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242140.AVTUlyqU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242140.AVTUlyqU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242140.AVTUlyqU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/init/fs.c:1177:25: warning: result of comparison of constant 262144 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
    1177 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   1 warning generated.


vim +1177 fs/bcachefs/init/fs.c

ab69169ea6ba22 fs/bcachefs/super.c Kent Overstreet 2025-08-02  1060  
a349868b5e2503 fs/bcachefs/super.c Kent Overstreet 2025-04-28  1061  static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts *opts,
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1062  				    bch_sb_handles *sbs)
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1063  {
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1064  	struct bch_fs *c;
ecf37a4a80ec02 fs/bcachefs/super.c Kent Overstreet 2019-02-14  1065  	unsigned i, iter_size;
72ff55535c3ac4 fs/bcachefs/super.c Kent Overstreet 2025-07-14  1066  	CLASS(printbuf, name)();
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1067  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1068  
cb6fc943b650c4 fs/bcachefs/super.c Kent Overstreet 2024-02-01  1069  	c = kvmalloc(sizeof(struct bch_fs), GFP_KERNEL|__GFP_ZERO);
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1070  	if (!c) {
65d48e35250fe4 fs/bcachefs/super.c Kent Overstreet 2023-03-14  1071  		c = ERR_PTR(-BCH_ERR_ENOMEM_fs_alloc);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1072  		goto out;
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1073  	}
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1074  
a349868b5e2503 fs/bcachefs/super.c Kent Overstreet 2025-04-28  1075  	c->stdio = (void *)(unsigned long) opts->stdio;
2b41226d7f4b3b fs/bcachefs/super.c Kent Overstreet 2023-12-04  1076  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1077  	__module_get(THIS_MODULE);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1078  
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1079  	closure_init(&c->cl, NULL);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1080  
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1081  	c->kobj.kset = bcachefs_kset;
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1082  	kobject_init(&c->kobj, &bch2_fs_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1083  	kobject_init(&c->internal, &bch2_fs_internal_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1084  	kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1085  	kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
104c69745fdf7e fs/bcachefs/super.c Daniel Hill     2022-03-15  1086  	kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
505b7a4c2844d8 fs/bcachefs/super.c Kent Overstreet 2020-10-15  1087  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1088  	c->minor		= -1;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1089  	c->disk_sb.fs_sb	= true;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1090  
1ada160618d66b fs/bcachefs/super.c Kent Overstreet 2020-06-15  1091  	init_rwsem(&c->state_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1092  	mutex_init(&c->sb_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1093  	mutex_init(&c->replicas_gc_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1094  	mutex_init(&c->btree_root_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1095  	INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1096  
63508b756443cb fs/bcachefs/super.c Kent Overstreet 2023-12-06  1097  	refcount_set(&c->ro_ref, 1);
63508b756443cb fs/bcachefs/super.c Kent Overstreet 2023-12-06  1098  	init_waitqueue_head(&c->ro_ref_wait);
63508b756443cb fs/bcachefs/super.c Kent Overstreet 2023-12-06  1099  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1100  	for (i = 0; i < BCH_TIME_STAT_NR; i++)
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1101  		bch2_time_stats_init(&c->times[i]);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1102  
b092dadd55fb24 fs/bcachefs/super.c Kent Overstreet 2018-11-04  1103  	bch2_fs_allocator_background_init(c);
b092dadd55fb24 fs/bcachefs/super.c Kent Overstreet 2018-11-04  1104  	bch2_fs_allocator_foreground_init(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1105  	bch2_fs_btree_cache_init_early(&c->btree_cache);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1106  	bch2_fs_btree_gc_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1107  	bch2_fs_btree_interior_update_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1108  	bch2_fs_btree_iter_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1109  	bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1110  	bch2_fs_btree_write_buffer_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1111  	bch2_fs_copygc_init(c);
84c72755b9aab3 fs/bcachefs/super.c Kent Overstreet 2022-04-09  1112  	bch2_fs_ec_init_early(c);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1113  	bch2_fs_journal_init_early(&c->journal);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1114  	bch2_fs_journal_keys_init(c);
b9fa375bab2786 fs/bcachefs/super.c Kent Overstreet 2023-03-11  1115  	bch2_fs_move_init(c);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1116  	bch2_fs_nocow_locking_init_early(c);
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1117  	bch2_fs_quota_init(c);
001c1d146f3862 fs/bcachefs/super.c Kent Overstreet 2025-05-09  1118  	bch2_fs_recovery_passes_init(c);
f5d26fa31ed2e2 fs/bcachefs/super.c Kent Overstreet 2023-10-25  1119  	bch2_fs_sb_errors_init_early(c);
15dbd0d8146356 fs/bcachefs/super.c Kent Overstreet 2025-05-01  1120  	bch2_fs_snapshots_init_early(c);
a17e985be9831b fs/bcachefs/super.c Kent Overstreet 2025-04-05  1121  	bch2_fs_subvolumes_init_early(c);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1122  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1123  	INIT_LIST_HEAD(&c->list);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1124  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1125  	mutex_init(&c->bio_bounce_pages_lock);
14b393ee768e83 fs/bcachefs/super.c Kent Overstreet 2021-03-16  1126  	mutex_init(&c->snapshot_table_lock);
37fad9497f5d37 fs/bcachefs/super.c Kent Overstreet 2023-09-29  1127  	init_rwsem(&c->snapshot_create_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1128  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1129  	spin_lock_init(&c->btree_write_error_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1130  
5b593ee172bd53 fs/bcachefs/super.c Kent Overstreet 2021-01-26  1131  	INIT_LIST_HEAD(&c->journal_iters);
f1d786a0dbc448 fs/bcachefs/super.c Kent Overstreet 2020-03-25  1132  
f5d26fa31ed2e2 fs/bcachefs/super.c Kent Overstreet 2023-10-25  1133  	INIT_LIST_HEAD(&c->fsck_error_msgs);
f5d26fa31ed2e2 fs/bcachefs/super.c Kent Overstreet 2023-10-25  1134  	mutex_init(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1135  
5e82a9a1f4f82e fs/bcachefs/super.c Kent Overstreet 2019-02-10  1136  	seqcount_init(&c->usage_lock);
5e82a9a1f4f82e fs/bcachefs/super.c Kent Overstreet 2019-02-10  1137  
ef1b20924b0f58 fs/bcachefs/super.c Kent Overstreet 2021-05-18  1138  	sema_init(&c->io_in_flight, 128);
ef1b20924b0f58 fs/bcachefs/super.c Kent Overstreet 2021-05-18  1139  
9edbcc72f6987b fs/bcachefs/super.c Kent Overstreet 2023-03-15  1140  	INIT_LIST_HEAD(&c->vfs_inodes_list);
9edbcc72f6987b fs/bcachefs/super.c Kent Overstreet 2023-03-15  1141  	mutex_init(&c->vfs_inodes_lock);
9edbcc72f6987b fs/bcachefs/super.c Kent Overstreet 2023-03-15  1142  
991ba021129088 fs/bcachefs/super.c Kent Overstreet 2021-12-10  1143  	c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
991ba021129088 fs/bcachefs/super.c Kent Overstreet 2021-12-10  1144  	c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1145  	c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1146  
fca1223ccfac2a fs/bcachefs/super.c Kent Overstreet 2020-12-03  1147  	mutex_init(&c->sectors_available_lock);
fca1223ccfac2a fs/bcachefs/super.c Kent Overstreet 2020-12-03  1148  
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1149  	ret = percpu_init_rwsem(&c->mark_lock);
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1150  	if (ret)
73e6ab95640a7d fs/bcachefs/super.c Kent Overstreet 2018-12-01  1151  		goto err;
73e6ab95640a7d fs/bcachefs/super.c Kent Overstreet 2018-12-01  1152  
72ff55535c3ac4 fs/bcachefs/super.c Kent Overstreet 2025-07-14  1153  	scoped_guard(mutex, &c->sb_lock)
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1154  		ret = bch2_sb_to_fs(c, sb);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1155  
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1156  	if (ret)
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1157  		goto err;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1158  
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1159  	/* Compat: */
73bd774d28d2b2 fs/bcachefs/super.c Kent Overstreet 2023-07-06  1160  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1161  	    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1162  		SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1163  
73bd774d28d2b2 fs/bcachefs/super.c Kent Overstreet 2023-07-06  1164  	if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1165  	    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1166  		SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
2430e72f42778a fs/bcachefs/super.c Kent Overstreet 2021-12-04  1167  
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1168  	c->opts = bch2_opts_default;
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1169  	ret = bch2_opts_from_sb(&c->opts, sb);
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1170  	if (ret)
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1171  		goto err;
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1172  
a349868b5e2503 fs/bcachefs/super.c Kent Overstreet 2025-04-28  1173  	bch2_opts_apply(&c->opts, *opts);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1174  
91d10435564f9f fs/bcachefs/super.c Kent Overstreet 2025-09-06  1175  #ifdef __KERNEL__
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1176  	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23 @1177  	    c->opts.block_size > PAGE_SIZE) {
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1178  		bch_err(c, "cannot mount bs > ps filesystem without CONFIG_TRANSPARENT_HUGEPAGE");
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1179  		ret = -EINVAL;
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1180  		goto err;
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1181  	}
91d10435564f9f fs/bcachefs/super.c Kent Overstreet 2025-09-06  1182  #endif
9caea9208fc3fb fs/bcachefs/super.c Kent Overstreet 2025-05-23  1183  
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1184  	c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1185  	if (c->opts.inodes_use_key_cache)
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1186  		c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
aaad530ac6b1c8 fs/bcachefs/super.c Kent Overstreet 2023-08-27  1187  	c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
7c8f6f980dc85f fs/bcachefs/super.c Kent Overstreet 2022-01-12  1188  
8244f3209b5b49 fs/bcachefs/super.c Kent Overstreet 2021-12-14  1189  	c->block_bits		= ilog2(block_sectors(c));
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1190  	c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1191  
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1192  	if (bch2_fs_init_fault("fs_alloc")) {
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1193  		bch_err(c, "fs_alloc fault injected");
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1194  		ret = -EFAULT;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1195  		goto err;
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1196  	}
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1197  
c02e5b57283ad6 fs/bcachefs/super.c Kent Overstreet 2025-04-02  1198  	if (c->sb.multi_device)
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1199  		pr_uuid(&name, c->sb.user_uuid.b);
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1200  	else
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1201  		prt_bdevname(&name, sbs->data[0].bdev);
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1202  
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1203  	ret = name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0;
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1204  	if (ret)
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1205  		goto err;
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1206  
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1207  	strscpy(c->name, name.buf, sizeof(c->name));
58c36e6710d3b3 fs/bcachefs/super.c Kent Overstreet 2025-04-03  1208  
ae2f17d5ad02bc fs/bcachefs/super.c Kent Overstreet 2019-12-14  1209  	iter_size = sizeof(struct sort_iter) +
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1210  		(btree_blocks(c) + 1) * 2 *
ae2f17d5ad02bc fs/bcachefs/super.c Kent Overstreet 2019-12-14  1211  		sizeof(struct sort_iter_set);
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1212  
d4d71b58e5139a fs/bcachefs/super.c Kent Overstreet 2025-04-05  1213  	if (!(c->btree_read_complete_wq = alloc_workqueue("bcachefs_btree_read_complete",
6b83aee8a41b12 fs/bcachefs/super.c Kent Overstreet 2024-01-22  1214  				WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 512)) ||
c9b1d94a2196fc fs/bcachefs/super.c Kent Overstreet 2025-04-18  1215  	    enumerated_ref_init(&c->writes, BCH_WRITE_REF_NR,
c9b1d94a2196fc fs/bcachefs/super.c Kent Overstreet 2025-04-18  1216  				bch2_writes_disabled) ||
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1217  	    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1218  	    bioset_init(&c->btree_bio, 1,
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1219  			max(offsetof(struct btree_read_bio, bio),
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1220  			    offsetof(struct btree_write_bio, wbio.bio)),
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1221  			BIOSET_NEED_BVECS) ||
5663a4152138fd fs/bcachefs/super.c Kent Overstreet 2018-11-27  1222  	    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
8bb8d683a4013f fs/bcachefs/super.c Kent Overstreet 2023-12-27  1223  	    !(c->usage = alloc_percpu(struct bch_fs_usage_base)) ||
5e82a9a1f4f82e fs/bcachefs/super.c Kent Overstreet 2019-02-10  1224  	    !(c->online_reserved = alloc_percpu(u64)) ||
cb6fc943b650c4 fs/bcachefs/super.c Kent Overstreet 2024-02-01  1225  	    mempool_init_kvmalloc_pool(&c->btree_bounce_pool, 1,
ec4edd7b9d2038 fs/bcachefs/super.c Kent Overstreet 2024-01-16  1226  				       c->opts.btree_node_size) ||
df448ca355ce84 fs/bcachefs/super.c Kent Overstreet 2024-12-01  1227  	    mempool_init_kmalloc_pool(&c->large_bkey_pool, 1, 2048)) {
09b9c72bd4b77a fs/bcachefs/super.c Kent Overstreet 2025-05-28  1228  		ret = bch_err_throw(c, ENOMEM_fs_other_alloc);
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1229  		goto err;
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1230  	}
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1231  
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1232  	ret =
0499a82b18b5dd fs/bcachefs/super.c Kent Overstreet 2025-04-21  1233  	    bch2_fs_async_obj_init(c) ?:
ab69169ea6ba22 fs/bcachefs/super.c Kent Overstreet 2025-08-02  1234  	    bch2_blacklist_table_initialize(c) ?:
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1235  	    bch2_fs_btree_cache_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1236  	    bch2_fs_btree_iter_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1237  	    bch2_fs_btree_key_cache_init(&c->btree_key_cache) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1238  	    bch2_fs_buckets_waiting_for_journal_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1239  	    bch2_io_clock_init(&c->io_clock[READ]) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1240  	    bch2_io_clock_init(&c->io_clock[WRITE]) ?:
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1241  	    bch2_fs_compress_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1242  	    bch2_fs_counters_init(c) ?:
e2b605601ad569 fs/bcachefs/super.c Kent Overstreet 2021-11-05  1243  	    bch2_fs_ec_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1244  	    bch2_fs_encryption_init(c) ?:
dbbfca9f41e869 fs/bcachefs/super.c Kent Overstreet 2023-08-03  1245  	    bch2_fs_fsio_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1246  	    bch2_fs_fs_io_direct_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1247  	    bch2_fs_io_read_init(c) ?:
96fc7d8adb7881 fs/bcachefs/super.c Kent Overstreet 2025-05-05  1248  	    bch2_fs_rebalance_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1249  	    bch2_fs_sb_errors_init(c) ?:
31813dcf379d7f fs/bcachefs/super.c Kent Overstreet 2025-04-05  1250  	    bch2_fs_vfs_init(c);
7be9ab637fb9c5 fs/bcachefs/super.c Chris Webb      2021-11-04  1251  	if (ret)
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1252  		goto err;
1c6fdbd8f2465d fs/bcachefs/super.c Kent Overstreet 2017-03-16  1253  
b9a97fb8bf353f fs/bcachefs/super.c Kent Overstreet 2025-09-05  1254  	/*
b9a97fb8bf353f fs/bcachefs/super.c Kent Overstreet 2025-09-05  1255  	 * just make sure this is always allocated if we might need it - mount
b9a97fb8bf353f fs/bcachefs/super.c Kent Overstreet 2025-09-05  1256  	 * failing due to kthread_create() failing is _very_ annoying
b9a97fb8bf353f fs/bcachefs/super.c Kent Overstreet 2025-09-05  1257  	 */
b9a97fb8bf353f fs/bcachefs/super.c Kent Overstreet 2025-09-05  1258  	if (!(c->sb.features & BIT_ULL(BCH_FEATURE_no_alloc_info)) ||
b9a97fb8bf353f fs/bcachefs/super.c Kent Overstreet 2025-09-05  1259  	    go_rw_in_recovery(c)) {
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1260  		/*
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1261  		 * start workqueues/kworkers early - kthread creation checks for
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1262  		 * pending signals, which is _very_ annoying
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1263  		 */
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1264  		ret = bch2_fs_init_rw(c);
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1265  		if (ret)
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1266  			goto err;
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1267  	}
1cddad0fcbccc7 fs/bcachefs/super.c Kent Overstreet 2025-06-15  1268  

:::::: The code at line 1177 was first introduced by commit
:::::: 9caea9208fc3fbdbd4a41a2de8c6a0c969b030f9 bcachefs: Don't mount bs > ps without TRANSPARENT_HUGEPAGE

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
