Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AE317C9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 05:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZpGSM50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704086176; x=1735622176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TE562zbMzo6bNUhhweOmG60c/LEE8/bLBPi6tFUW3KA=;
  b=PZpGSM50CS1vtumSjq7aGTN0yqcD24zpDBDu7a+T3DvMb33vUkxGXlL1
   JxDJMEojDjx5Qafg0ef49W/QSPlTtpraE+QClXFukQZgwEp90N+enhNKf
   rpGyaNaYn780/Iv3kc8zxTS1s/+6zGLGFy6lpNy7t9u+98OK4m7mXIZO6
   yClSxPc/r8d+vjpFqRrfSpj92s2vUyBCVh+hqVUmrnCdSCNzS1ZTUp6V9
   zz4dUipgd8AGohoHPegXbeUiE0tO7DlTb5PLdVD9s+xZfx+Kiy7ZmROB4
   4QhcieKHX49+o7qZQljom+b7LgqNuycxjowIKih/pJCURp85Wo6t1O0IB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="461085612"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="461085612"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 21:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="772502372"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="772502372"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 31 Dec 2023 21:16:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKAep-000K0h-2v;
	Mon, 01 Jan 2024 05:16:11 +0000
Date: Mon, 1 Jan 2024 13:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 199/215] fs/bcachefs/recovery.c:809:67:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202401011345.94sFrSIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   35efd7618f12d4190bae8559a81ca3aa9db05bb7
commit: a52795f32d4669489b1b409a4df5f51b038f9c64 [199/215] bcachefs: bch_sb_field_downgrade
config: i386-randconfig-062-20231231 (https://download.01.org/0day-ci/archive/20240101/202401011345.94sFrSIe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401011345.94sFrSIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401011345.94sFrSIe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/recovery.c: note: in included file:
   fs/bcachefs/bcachefs.h:1021:9: sparse: sparse: array of flexible structures
   fs/bcachefs/recovery.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1621:38: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:2300:38: sparse: sparse: array of flexible structures
>> fs/bcachefs/recovery.c:809:67: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] passes @@     got restricted __le64 @@
   fs/bcachefs/recovery.c:809:67: sparse:     expected unsigned long long [usertype] passes
   fs/bcachefs/recovery.c:809:67: sparse:     got restricted __le64
>> fs/bcachefs/recovery.c:813:63: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/recovery.c:816:33: sparse: sparse: cast to restricted __le64

vim +809 fs/bcachefs/recovery.c

   737	
   738	int bch2_fs_recovery(struct bch_fs *c)
   739	{
   740		struct bch_sb_field_clean *clean = NULL;
   741		struct jset *last_journal_entry = NULL;
   742		u64 last_seq = 0, blacklist_seq, journal_seq;
   743		int ret = 0;
   744	
   745		if (c->sb.clean) {
   746			clean = bch2_read_superblock_clean(c);
   747			ret = PTR_ERR_OR_ZERO(clean);
   748			if (ret)
   749				goto err;
   750	
   751			bch_info(c, "recovering from clean shutdown, journal seq %llu",
   752				 le64_to_cpu(clean->journal_seq));
   753		} else {
   754			bch_info(c, "recovering from unclean shutdown");
   755		}
   756	
   757		if (!(c->sb.features & (1ULL << BCH_FEATURE_new_extent_overwrite))) {
   758			bch_err(c, "feature new_extent_overwrite not set, filesystem no longer supported");
   759			ret = -EINVAL;
   760			goto err;
   761		}
   762	
   763		if (!c->sb.clean &&
   764		    !(c->sb.features & (1ULL << BCH_FEATURE_extents_above_btree_updates))) {
   765			bch_err(c, "filesystem needs recovery from older version; run fsck from older bcachefs-tools to fix");
   766			ret = -EINVAL;
   767			goto err;
   768		}
   769	
   770		if (c->opts.fsck && c->opts.norecovery) {
   771			bch_err(c, "cannot select both norecovery and fsck");
   772			ret = -EINVAL;
   773			goto err;
   774		}
   775	
   776		if (!(c->opts.nochanges && c->opts.norecovery)) {
   777			mutex_lock(&c->sb_lock);
   778			bool write_sb = false;
   779	
   780			struct bch_sb_field_ext *ext =
   781				bch2_sb_field_get_minsize(&c->disk_sb, ext, sizeof(*ext) / sizeof(u64));
   782			if (!ext) {
   783				ret = -BCH_ERR_ENOSPC_sb;
   784				mutex_unlock(&c->sb_lock);
   785				goto err;
   786			}
   787	
   788			if (BCH_SB_HAS_TOPOLOGY_ERRORS(c->disk_sb.sb)) {
   789				ext->recovery_passes_required[0] |=
   790					cpu_to_le64(bch2_recovery_passes_to_stable(BIT_ULL(BCH_RECOVERY_PASS_check_topology)));
   791				write_sb = true;
   792			}
   793	
   794			u64 sb_passes = bch2_recovery_passes_from_stable(le64_to_cpu(ext->recovery_passes_required[0]));
   795			if (sb_passes) {
   796				struct printbuf buf = PRINTBUF;
   797				prt_str(&buf, "superblock requires following recovery passes to be run:\n  ");
   798				prt_bitflags(&buf, bch2_recovery_passes, sb_passes);
   799				bch_info(c, "%s", buf.buf);
   800				printbuf_exit(&buf);
   801				c->recovery_passes_explicit |= sb_passes;
   802			}
   803	
   804			if (bch2_check_version_downgrade(c)) {
   805				struct printbuf buf = PRINTBUF;
   806	
   807				prt_str(&buf, "Version downgrade required:\n");
   808	
 > 809				u64 passes = ext->recovery_passes_required[0];
   810				bch2_sb_set_downgrade(c,
   811						BCH_VERSION_MINOR(bcachefs_metadata_version_current),
   812						BCH_VERSION_MINOR(c->sb.version));
 > 813				passes = ext->recovery_passes_required[0] & ~passes;
   814				if (passes) {
   815					prt_str(&buf, "  running recovery passes: ");
 > 816					prt_bitflags(&buf, bch2_recovery_passes,
   817						     bch2_recovery_passes_from_stable(le64_to_cpu(passes)));
   818				}
   819	
   820				bch_info(c, "%s", buf.buf);
   821				printbuf_exit(&buf);
   822				write_sb = true;
   823			}
   824	
   825			if (check_version_upgrade(c))
   826				write_sb = true;
   827	
   828			if (write_sb)
   829				bch2_write_super(c);
   830	
   831			c->recovery_passes_explicit |= bch2_recovery_passes_from_stable(le64_to_cpu(ext->recovery_passes_required[0]));
   832			mutex_unlock(&c->sb_lock);
   833		}
   834	
   835		if (c->opts.fsck && IS_ENABLED(CONFIG_BCACHEFS_DEBUG))
   836			c->recovery_passes_explicit |= BIT_ULL(BCH_RECOVERY_PASS_check_topology);
   837	
   838		ret = bch2_blacklist_table_initialize(c);
   839		if (ret) {
   840			bch_err(c, "error initializing blacklist table");
   841			goto err;
   842		}
   843	
   844		if (!c->sb.clean || c->opts.fsck || c->opts.keep_journal) {
   845			struct genradix_iter iter;
   846			struct journal_replay **i;
   847	
   848			bch_verbose(c, "starting journal read");
   849			ret = bch2_journal_read(c, &last_seq, &blacklist_seq, &journal_seq);
   850			if (ret)
   851				goto err;
   852	
   853			/*
   854			 * note: cmd_list_journal needs the blacklist table fully up to date so
   855			 * it can asterisk ignored journal entries:
   856			 */
   857			if (c->opts.read_journal_only)
   858				goto out;
   859	
   860			genradix_for_each_reverse(&c->journal_entries, iter, i)
   861				if (*i && !(*i)->ignore) {
   862					last_journal_entry = &(*i)->j;
   863					break;
   864				}
   865	
   866			if (mustfix_fsck_err_on(c->sb.clean &&
   867						last_journal_entry &&
   868						!journal_entry_empty(last_journal_entry), c,
   869					clean_but_journal_not_empty,
   870					"filesystem marked clean but journal not empty")) {
   871				c->sb.compat &= ~(1ULL << BCH_COMPAT_alloc_info);
   872				SET_BCH_SB_CLEAN(c->disk_sb.sb, false);
   873				c->sb.clean = false;
   874			}
   875	
   876			if (!last_journal_entry) {
   877				fsck_err_on(!c->sb.clean, c,
   878					    dirty_but_no_journal_entries,
   879					    "no journal entries found");
   880				if (clean)
   881					goto use_clean;
   882	
   883				genradix_for_each_reverse(&c->journal_entries, iter, i)
   884					if (*i) {
   885						last_journal_entry = &(*i)->j;
   886						(*i)->ignore = false;
   887						/*
   888						 * This was probably a NO_FLUSH entry,
   889						 * so last_seq was garbage - but we know
   890						 * we're only using a single journal
   891						 * entry, set it here:
   892						 */
   893						(*i)->j.last_seq = (*i)->j.seq;
   894						break;
   895					}
   896			}
   897	
   898			ret = bch2_journal_keys_sort(c);
   899			if (ret)
   900				goto err;
   901	
   902			if (c->sb.clean && last_journal_entry) {
   903				ret = bch2_verify_superblock_clean(c, &clean,
   904							      last_journal_entry);
   905				if (ret)
   906					goto err;
   907			}
   908		} else {
   909	use_clean:
   910			if (!clean) {
   911				bch_err(c, "no superblock clean section found");
   912				ret = -BCH_ERR_fsck_repair_impossible;
   913				goto err;
   914	
   915			}
   916			blacklist_seq = journal_seq = le64_to_cpu(clean->journal_seq) + 1;
   917		}
   918	
   919		c->journal_replay_seq_start	= last_seq;
   920		c->journal_replay_seq_end	= blacklist_seq - 1;
   921	
   922		if (c->opts.reconstruct_alloc) {
   923			c->sb.compat &= ~(1ULL << BCH_COMPAT_alloc_info);
   924			drop_alloc_keys(&c->journal_keys);
   925		}
   926	
   927		zero_out_btree_mem_ptr(&c->journal_keys);
   928	
   929		ret = journal_replay_early(c, clean);
   930		if (ret)
   931			goto err;
   932	
   933		/*
   934		 * After an unclean shutdown, skip then next few journal sequence
   935		 * numbers as they may have been referenced by btree writes that
   936		 * happened before their corresponding journal writes - those btree
   937		 * writes need to be ignored, by skipping and blacklisting the next few
   938		 * journal sequence numbers:
   939		 */
   940		if (!c->sb.clean)
   941			journal_seq += 8;
   942	
   943		if (blacklist_seq != journal_seq) {
   944			ret =   bch2_journal_log_msg(c, "blacklisting entries %llu-%llu",
   945						     blacklist_seq, journal_seq) ?:
   946				bch2_journal_seq_blacklist_add(c,
   947						blacklist_seq, journal_seq);
   948			if (ret) {
   949				bch_err(c, "error creating new journal seq blacklist entry");
   950				goto err;
   951			}
   952		}
   953	
   954		ret =   bch2_journal_log_msg(c, "starting journal at entry %llu, replaying %llu-%llu",
   955					     journal_seq, last_seq, blacklist_seq - 1) ?:
   956			bch2_fs_journal_start(&c->journal, journal_seq);
   957		if (ret)
   958			goto err;
   959	
   960		if (c->opts.reconstruct_alloc)
   961			bch2_journal_log_msg(c, "dropping alloc info");
   962	
   963		/*
   964		 * Skip past versions that might have possibly been used (as nonces),
   965		 * but hadn't had their pointers written:
   966		 */
   967		if (c->sb.encryption_type && !c->sb.clean)
   968			atomic64_add(1 << 16, &c->key_version);
   969	
   970		ret = read_btree_roots(c);
   971		if (ret)
   972			goto err;
   973	
   974		ret = bch2_run_recovery_passes(c);
   975		if (ret)
   976			goto err;
   977	
   978		/* If we fixed errors, verify that fs is actually clean now: */
   979		if (IS_ENABLED(CONFIG_BCACHEFS_DEBUG) &&
   980		    test_bit(BCH_FS_errors_fixed, &c->flags) &&
   981		    !test_bit(BCH_FS_errors_not_fixed, &c->flags) &&
   982		    !test_bit(BCH_FS_error, &c->flags)) {
   983			bch2_flush_fsck_errs(c);
   984	
   985			bch_info(c, "Fixed errors, running fsck a second time to verify fs is clean");
   986			clear_bit(BCH_FS_errors_fixed, &c->flags);
   987	
   988			c->curr_recovery_pass = BCH_RECOVERY_PASS_check_alloc_info;
   989	
   990			ret = bch2_run_recovery_passes(c);
   991			if (ret)
   992				goto err;
   993	
   994			if (test_bit(BCH_FS_errors_fixed, &c->flags) ||
   995			    test_bit(BCH_FS_errors_not_fixed, &c->flags)) {
   996				bch_err(c, "Second fsck run was not clean");
   997				set_bit(BCH_FS_errors_not_fixed, &c->flags);
   998			}
   999	
  1000			set_bit(BCH_FS_errors_fixed, &c->flags);
  1001		}
  1002	
  1003		if (enabled_qtypes(c)) {
  1004			bch_verbose(c, "reading quotas");
  1005			ret = bch2_fs_quota_read(c);
  1006			if (ret)
  1007				goto err;
  1008			bch_verbose(c, "quotas done");
  1009		}
  1010	
  1011		mutex_lock(&c->sb_lock);
  1012		bool write_sb = false;
  1013	
  1014		if (BCH_SB_VERSION_UPGRADE_COMPLETE(c->disk_sb.sb) != le16_to_cpu(c->disk_sb.sb->version)) {
  1015			SET_BCH_SB_VERSION_UPGRADE_COMPLETE(c->disk_sb.sb, le16_to_cpu(c->disk_sb.sb->version));
  1016			write_sb = true;
  1017		}
  1018	
  1019		if (!test_bit(BCH_FS_error, &c->flags) &&
  1020		    !(c->disk_sb.sb->compat[0] & cpu_to_le64(1ULL << BCH_COMPAT_alloc_info))) {
  1021			c->disk_sb.sb->compat[0] |= cpu_to_le64(1ULL << BCH_COMPAT_alloc_info);
  1022			write_sb = true;
  1023		}
  1024	
  1025		if (!test_bit(BCH_FS_error, &c->flags)) {
  1026			struct bch_sb_field_ext *ext = bch2_sb_field_get(c->disk_sb.sb, ext);
  1027			if (ext &&
  1028			    (!bch2_is_zero(ext->recovery_passes_required, sizeof(ext->recovery_passes_required)) ||
  1029			     !bch2_is_zero(ext->errors_silent, sizeof(ext->errors_silent)))) {
  1030				memset(ext->recovery_passes_required, 0, sizeof(ext->recovery_passes_required));
  1031				memset(ext->errors_silent, 0, sizeof(ext->errors_silent));
  1032				write_sb = true;
  1033			}
  1034		}
  1035	
  1036		if (c->opts.fsck &&
  1037		    !test_bit(BCH_FS_error, &c->flags) &&
  1038		    !test_bit(BCH_FS_errors_not_fixed, &c->flags)) {
  1039			SET_BCH_SB_HAS_ERRORS(c->disk_sb.sb, 0);
  1040			SET_BCH_SB_HAS_TOPOLOGY_ERRORS(c->disk_sb.sb, 0);
  1041			write_sb = true;
  1042		}
  1043	
  1044		if (write_sb)
  1045			bch2_write_super(c);
  1046		mutex_unlock(&c->sb_lock);
  1047	
  1048		if (!(c->sb.compat & (1ULL << BCH_COMPAT_extents_above_btree_updates_done)) ||
  1049		    c->sb.version_min < bcachefs_metadata_version_btree_ptr_sectors_written) {
  1050			struct bch_move_stats stats;
  1051	
  1052			bch2_move_stats_init(&stats, "recovery");
  1053	
  1054			struct printbuf buf = PRINTBUF;
  1055			bch2_version_to_text(&buf, c->sb.version_min);
  1056			bch_info(c, "scanning for old btree nodes: min_version %s", buf.buf);
  1057			printbuf_exit(&buf);
  1058	
  1059			ret =   bch2_fs_read_write_early(c) ?:
  1060				bch2_scan_old_btree_nodes(c, &stats);
  1061			if (ret)
  1062				goto err;
  1063			bch_info(c, "scanning for old btree nodes done");
  1064		}
  1065	
  1066		if (c->journal_seq_blacklist_table &&
  1067		    c->journal_seq_blacklist_table->nr > 128)
  1068			queue_work(system_long_wq, &c->journal_seq_blacklist_gc_work);
  1069	
  1070		ret = 0;
  1071	out:
  1072		set_bit(BCH_FS_fsck_done, &c->flags);
  1073		bch2_flush_fsck_errs(c);
  1074	
  1075		if (!c->opts.keep_journal &&
  1076		    test_bit(JOURNAL_REPLAY_DONE, &c->journal.flags))
  1077			bch2_journal_keys_put_initial(c);
  1078		kfree(clean);
  1079	
  1080		if (!ret &&
  1081		    test_bit(BCH_FS_need_delete_dead_snapshots, &c->flags) &&
  1082		    !c->opts.nochanges) {
  1083			bch2_fs_read_write_early(c);
  1084			bch2_delete_dead_snapshots_async(c);
  1085		}
  1086	
  1087		bch_err_fn(c, ret);
  1088		return ret;
  1089	err:
  1090	fsck_err:
  1091		bch2_fs_emergency_read_only(c);
  1092		goto out;
  1093	}
  1094	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
