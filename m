Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6311D63DF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 06:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737701465; cv=none; b=cyk3XIxNxpklPqmLBFuAet6fqArmzejguc0/l8jGyxe+vpGm1iN+L4613VUm6YU50Xygaz5gVT1mk9lDzUNY5hBeobIqsJkIc08Fhn3g2iLbqmzVRFBU3fmZadLXfZPyvpz/gZRa6TCxEqLKy2fi3VxH+USm7rmMzCjBRxlI62M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737701465; c=relaxed/simple;
	bh=+DKQPnQYjREYilHG65ZecGmzsrLmj8qRNOLEquXH1Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIgpfMRZ7rHBCEsdt4opc7addZpG1t8LnMofRnqAWWJEVwsDS8W5tJPtBwOjk84BysATsgiX3G5RUFw9lVpp+jGJgIf9IixttvZ5QBq48BBts1G7gVgMJNlVtItdOV3y9Dco6jdjf+D1sHg7XKEDhwGqnSNoTpYZOGXt0kjecAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPnE2/tN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPnE2/tN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737701463; x=1769237463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+DKQPnQYjREYilHG65ZecGmzsrLmj8qRNOLEquXH1Eg=;
  b=FPnE2/tNK855kRGi003iVCnQ2iql4h4ZGhhEIQdLkF5tzbU/dvR7U7KO
   GwRExncJLNkQrYvavDrrntZdHqcdSS9TVopZw6qjnQWRbk5qxqyFLMJe+
   WQnuerU/MZ5ouYEBI+kxFykQ+dXACndNlcXgpmjzSsqDSyqR42s0gHL3W
   LvJIfI7R3Oj/Ed+wym7j5d4QzV0EYxTf+kqQ4lqxLWVwYb5ZAsOlIEJ9v
   S9yMcgS9Ub9O1itx64JAgC8Tc8r6MXh3301jB2ordw/Q5bSxdE37Ih3Xy
   9Hfr7b4L4t+Zbz7ex6VHeTg3P0jVC4uHSPFnCZHsecGgJosBvFmrwvDOI
   w==;
X-CSE-ConnectionGUID: OXN5q8cvSLeBr6pDy9WSVQ==
X-CSE-MsgGUID: mUgp/68OReW/5QC2cs3eEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="42155573"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="42155573"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 22:51:02 -0800
X-CSE-ConnectionGUID: 82lCoGzMTOmwLyUgsqIOpA==
X-CSE-MsgGUID: EjKKRNNATdCzup/sP8VQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="112703253"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2025 22:51:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbDWs-000cIp-0z;
	Fri, 24 Jan 2025 06:50:58 +0000
Date: Fri, 24 Jan 2025 14:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/tlb 1/1] mm/vmscan.c:1490:31: error: call to undeclared
 function 'folio_test_young'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202501241435.qZqQH9W3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/tlb
head:   eacae6d88bcc8a925124f97b7788bb2bfac8b267
commit: eacae6d88bcc8a925124f97b7788bb2bfac8b267 [1/1] mm: Optimize TLB flushes during page reclaim
config: i386-buildonly-randconfig-001-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241435.qZqQH9W3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241435.qZqQH9W3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241435.qZqQH9W3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmscan.c:15:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:402:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     402 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/vmscan.c:1490:31: error: call to undeclared function 'folio_test_young'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1490 |                            (folio_mapped(folio) && folio_test_young(folio)))
         |                                                    ^
>> mm/vmscan.c:1494:63: error: too few arguments to function call, expected 4, have 3
    1494 |                        pageout_t pageout_res = pageout(folio, mapping, &plug);
         |                                                ~~~~~~~                      ^
   mm/vmscan.c:631:18: note: 'pageout' declared here
     631 | static pageout_t pageout(struct folio *folio, struct address_space *mapping,
         |                  ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     632 |                          struct swap_iocb **plug, struct list_head *folio_list)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:1758:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1758 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2263:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2263 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2264:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2264 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
   mm/vmscan.c:4465:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4465 |                         __count_zid_vm_events(PGSCAN_SKIP, zone, skipped_zone);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:6284:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6284 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings and 2 errors generated.


vim +/folio_test_young +1490 mm/vmscan.c

  1038	
  1039	/*
  1040	 * shrink_folio_list() returns the number of reclaimed pages
  1041	 */
  1042	static unsigned int shrink_folio_list(struct list_head *folio_list,
  1043			struct pglist_data *pgdat, struct scan_control *sc,
  1044			struct reclaim_stat *stat, bool ignore_references)
  1045	{
  1046		struct folio_batch free_folios;
  1047		LIST_HEAD(ret_folios);
  1048		LIST_HEAD(demote_folios);
  1049		LIST_HEAD(pageout_list);
  1050		unsigned int nr_reclaimed = 0;
  1051		unsigned int pgactivate = 0;
  1052		bool do_demote_pass;
  1053		struct swap_iocb *plug = NULL;
  1054	
  1055		folio_batch_init(&free_folios);
  1056		memset(stat, 0, sizeof(*stat));
  1057		cond_resched();
  1058		do_demote_pass = can_demote(pgdat->node_id, sc);
  1059	
  1060	retry:
  1061		while (!list_empty(folio_list)) {
  1062			struct address_space *mapping;
  1063			struct folio *folio;
  1064			enum folio_references references = FOLIOREF_RECLAIM;
  1065			bool dirty, writeback;
  1066			unsigned int nr_pages;
  1067	
  1068			cond_resched();
  1069	
  1070			folio = lru_to_folio(folio_list);
  1071			list_del(&folio->lru);
  1072	
  1073			if (!folio_trylock(folio))
  1074				goto keep;
  1075	
  1076			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1077	
  1078			nr_pages = folio_nr_pages(folio);
  1079	
  1080			/* Account the number of base pages */
  1081			sc->nr_scanned += nr_pages;
  1082	
  1083			if (unlikely(!folio_evictable(folio)))
  1084				goto activate_locked;
  1085	
  1086			if (!sc->may_unmap && folio_mapped(folio))
  1087				goto keep_locked;
  1088	
  1089			/* folio_update_gen() tried to promote this page? */
  1090			if (lru_gen_enabled() && !ignore_references &&
  1091			    folio_mapped(folio) && folio_test_referenced(folio))
  1092				goto keep_locked;
  1093	
  1094			/*
  1095			 * The number of dirty pages determines if a node is marked
  1096			 * reclaim_congested. kswapd will stall and start writing
  1097			 * folios if the tail of the LRU is all dirty unqueued folios.
  1098			 */
  1099			folio_check_dirty_writeback(folio, &dirty, &writeback);
  1100			if (dirty || writeback)
  1101				stat->nr_dirty += nr_pages;
  1102	
  1103			if (dirty && !writeback)
  1104				stat->nr_unqueued_dirty += nr_pages;
  1105	
  1106			/*
  1107			 * Treat this folio as congested if folios are cycling
  1108			 * through the LRU so quickly that the folios marked
  1109			 * for immediate reclaim are making it to the end of
  1110			 * the LRU a second time.
  1111			 */
  1112			if (writeback && folio_test_reclaim(folio))
  1113				stat->nr_congested += nr_pages;
  1114	
  1115			/*
  1116			 * If a folio at the tail of the LRU is under writeback, there
  1117			 * are three cases to consider.
  1118			 *
  1119			 * 1) If reclaim is encountering an excessive number
  1120			 *    of folios under writeback and this folio has both
  1121			 *    the writeback and reclaim flags set, then it
  1122			 *    indicates that folios are being queued for I/O but
  1123			 *    are being recycled through the LRU before the I/O
  1124			 *    can complete. Waiting on the folio itself risks an
  1125			 *    indefinite stall if it is impossible to writeback
  1126			 *    the folio due to I/O error or disconnected storage
  1127			 *    so instead note that the LRU is being scanned too
  1128			 *    quickly and the caller can stall after the folio
  1129			 *    list has been processed.
  1130			 *
  1131			 * 2) Global or new memcg reclaim encounters a folio that is
  1132			 *    not marked for immediate reclaim, or the caller does not
  1133			 *    have __GFP_FS (or __GFP_IO if it's simply going to swap,
  1134			 *    not to fs). In this case mark the folio for immediate
  1135			 *    reclaim and continue scanning.
  1136			 *
  1137			 *    Require may_enter_fs() because we would wait on fs, which
  1138			 *    may not have submitted I/O yet. And the loop driver might
  1139			 *    enter reclaim, and deadlock if it waits on a folio for
  1140			 *    which it is needed to do the write (loop masks off
  1141			 *    __GFP_IO|__GFP_FS for this reason); but more thought
  1142			 *    would probably show more reasons.
  1143			 *
  1144			 * 3) Legacy memcg encounters a folio that already has the
  1145			 *    reclaim flag set. memcg does not have any dirty folio
  1146			 *    throttling so we could easily OOM just because too many
  1147			 *    folios are in writeback and there is nothing else to
  1148			 *    reclaim. Wait for the writeback to complete.
  1149			 *
  1150			 * In cases 1) and 2) we activate the folios to get them out of
  1151			 * the way while we continue scanning for clean folios on the
  1152			 * inactive list and refilling from the active list. The
  1153			 * observation here is that waiting for disk writes is more
  1154			 * expensive than potentially causing reloads down the line.
  1155			 * Since they're marked for immediate reclaim, they won't put
  1156			 * memory pressure on the cache working set any longer than it
  1157			 * takes to write them to disk.
  1158			 */
  1159			if (folio_test_writeback(folio)) {
  1160				/* Case 1 above */
  1161				if (current_is_kswapd() &&
  1162				    folio_test_reclaim(folio) &&
  1163				    test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {
  1164					stat->nr_immediate += nr_pages;
  1165					goto activate_locked;
  1166	
  1167				/* Case 2 above */
  1168				} else if (writeback_throttling_sane(sc) ||
  1169				    !folio_test_reclaim(folio) ||
  1170				    !may_enter_fs(folio, sc->gfp_mask)) {
  1171					/*
  1172					 * This is slightly racy -
  1173					 * folio_end_writeback() might have
  1174					 * just cleared the reclaim flag, then
  1175					 * setting the reclaim flag here ends up
  1176					 * interpreted as the readahead flag - but
  1177					 * that does not matter enough to care.
  1178					 * What we do want is for this folio to
  1179					 * have the reclaim flag set next time
  1180					 * memcg reclaim reaches the tests above,
  1181					 * so it will then wait for writeback to
  1182					 * avoid OOM; and it's also appropriate
  1183					 * in global reclaim.
  1184					 */
  1185					folio_set_reclaim(folio);
  1186					stat->nr_writeback += nr_pages;
  1187					goto activate_locked;
  1188	
  1189				/* Case 3 above */
  1190				} else {
  1191					folio_unlock(folio);
  1192					folio_wait_writeback(folio);
  1193					/* then go back and try same folio again */
  1194					list_add_tail(&folio->lru, folio_list);
  1195					continue;
  1196				}
  1197			}
  1198	
  1199			if (!ignore_references)
  1200				references = folio_check_references(folio, sc);
  1201	
  1202			switch (references) {
  1203			case FOLIOREF_ACTIVATE:
  1204				goto activate_locked;
  1205			case FOLIOREF_KEEP:
  1206				stat->nr_ref_keep += nr_pages;
  1207				goto keep_locked;
  1208			case FOLIOREF_RECLAIM:
  1209			case FOLIOREF_RECLAIM_CLEAN:
  1210				; /* try to reclaim the folio below */
  1211			}
  1212	
  1213			/*
  1214			 * Before reclaiming the folio, try to relocate
  1215			 * its contents to another node.
  1216			 */
  1217			if (do_demote_pass &&
  1218			    (thp_migration_supported() || !folio_test_large(folio))) {
  1219				list_add(&folio->lru, &demote_folios);
  1220				folio_unlock(folio);
  1221				continue;
  1222			}
  1223	
  1224			/*
  1225			 * Anonymous process memory has backing store?
  1226			 * Try to allocate it some swap space here.
  1227			 * Lazyfree folio could be freed directly
  1228			 */
  1229			if (folio_test_anon(folio) && folio_test_swapbacked(folio)) {
  1230				if (!folio_test_swapcache(folio)) {
  1231					if (!(sc->gfp_mask & __GFP_IO))
  1232						goto keep_locked;
  1233					if (folio_maybe_dma_pinned(folio))
  1234						goto keep_locked;
  1235					if (folio_test_large(folio)) {
  1236						/* cannot split folio, skip it */
  1237						if (!can_split_folio(folio, 1, NULL))
  1238							goto activate_locked;
  1239						/*
  1240						 * Split partially mapped folios right away.
  1241						 * We can free the unmapped pages without IO.
  1242						 */
  1243						if (data_race(!list_empty(&folio->_deferred_list) &&
  1244						    folio_test_partially_mapped(folio)) &&
  1245						    split_folio_to_list(folio, folio_list))
  1246							goto activate_locked;
  1247					}
  1248					if (!add_to_swap(folio)) {
  1249						int __maybe_unused order = folio_order(folio);
  1250	
  1251						if (!folio_test_large(folio))
  1252							goto activate_locked_split;
  1253						/* Fallback to swap normal pages */
  1254						if (split_folio_to_list(folio, folio_list))
  1255							goto activate_locked;
  1256	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1257						if (nr_pages >= HPAGE_PMD_NR) {
  1258							count_memcg_folio_events(folio,
  1259								THP_SWPOUT_FALLBACK, 1);
  1260							count_vm_event(THP_SWPOUT_FALLBACK);
  1261						}
  1262						count_mthp_stat(order, MTHP_STAT_SWPOUT_FALLBACK);
  1263	#endif
  1264						if (!add_to_swap(folio))
  1265							goto activate_locked_split;
  1266					}
  1267				}
  1268			}
  1269	
  1270			/*
  1271			 * If the folio was split above, the tail pages will make
  1272			 * their own pass through this function and be accounted
  1273			 * then.
  1274			 */
  1275			if ((nr_pages > 1) && !folio_test_large(folio)) {
  1276				sc->nr_scanned -= (nr_pages - 1);
  1277				nr_pages = 1;
  1278			}
  1279	
  1280			/*
  1281			 * The folio is mapped into the page tables of one or more
  1282			 * processes. Try to unmap it here.
  1283			 */
  1284			if (folio_mapped(folio)) {
  1285				enum ttu_flags flags = TTU_BATCH_FLUSH;
  1286				bool was_swapbacked = folio_test_swapbacked(folio);
  1287	
  1288				if (folio_test_pmd_mappable(folio))
  1289					flags |= TTU_SPLIT_HUGE_PMD;
  1290				/*
  1291				 * Without TTU_SYNC, try_to_unmap will only begin to
  1292				 * hold PTL from the first present PTE within a large
  1293				 * folio. Some initial PTEs might be skipped due to
  1294				 * races with parallel PTE writes in which PTEs can be
  1295				 * cleared temporarily before being written new present
  1296				 * values. This will lead to a large folio is still
  1297				 * mapped while some subpages have been partially
  1298				 * unmapped after try_to_unmap; TTU_SYNC helps
  1299				 * try_to_unmap acquire PTL from the first PTE,
  1300				 * eliminating the influence of temporary PTE values.
  1301				 */
  1302				if (folio_test_large(folio))
  1303					flags |= TTU_SYNC;
  1304	
  1305				try_to_unmap(folio, flags);
  1306				if (folio_mapped(folio)) {
  1307					stat->nr_unmap_fail += nr_pages;
  1308					if (!was_swapbacked &&
  1309					    folio_test_swapbacked(folio))
  1310						stat->nr_lazyfree_fail += nr_pages;
  1311					goto activate_locked;
  1312				}
  1313			}
  1314	
  1315			/*
  1316			 * Folio is unmapped now so it cannot be newly pinned anymore.
  1317			 * No point in trying to reclaim folio if it is pinned.
  1318			 * Furthermore we don't want to reclaim underlying fs metadata
  1319			 * if the folio is pinned and thus potentially modified by the
  1320			 * pinning process as that may upset the filesystem.
  1321			 */
  1322			if (folio_maybe_dma_pinned(folio))
  1323				goto activate_locked;
  1324	
  1325			mapping = folio_mapping(folio);
  1326			if (folio_test_dirty(folio)) {
  1327				/*
  1328				 * Only kswapd can writeback filesystem folios
  1329				 * to avoid risk of stack overflow. But avoid
  1330				 * injecting inefficient single-folio I/O into
  1331				 * flusher writeback as much as possible: only
  1332				 * write folios when we've encountered many
  1333				 * dirty folios, and when we've already scanned
  1334				 * the rest of the LRU for clean folios and see
  1335				 * the same dirty folios again (with the reclaim
  1336				 * flag set).
  1337				 */
  1338				if (folio_is_file_lru(folio) &&
  1339				    (!current_is_kswapd() ||
  1340				     !folio_test_reclaim(folio) ||
  1341				     !test_bit(PGDAT_DIRTY, &pgdat->flags))) {
  1342					/*
  1343					 * Immediately reclaim when written back.
  1344					 * Similar in principle to folio_deactivate()
  1345					 * except we already have the folio isolated
  1346					 * and know it's dirty
  1347					 */
  1348					node_stat_mod_folio(folio, NR_VMSCAN_IMMEDIATE,
  1349							nr_pages);
  1350					folio_set_reclaim(folio);
  1351	
  1352					goto activate_locked;
  1353				}
  1354	
  1355				if (references == FOLIOREF_RECLAIM_CLEAN)
  1356					goto keep_locked;
  1357				if (!may_enter_fs(folio, sc->gfp_mask))
  1358					goto keep_locked;
  1359				if (!sc->may_writepage)
  1360					goto keep_locked;
  1361	
  1362				/* Add to pageout list for defered bio submissions */
  1363				list_add(&folio->lru, &pageout_list);
  1364				continue;
  1365			}
  1366	
  1367			/*
  1368			 * If the folio has buffers, try to free the buffer
  1369			 * mappings associated with this folio. If we succeed
  1370			 * we try to free the folio as well.
  1371			 *
  1372			 * We do this even if the folio is dirty.
  1373			 * filemap_release_folio() does not perform I/O, but it
  1374			 * is possible for a folio to have the dirty flag set,
  1375			 * but it is actually clean (all its buffers are clean).
  1376			 * This happens if the buffers were written out directly,
  1377			 * with submit_bh(). ext3 will do this, as well as
  1378			 * the blockdev mapping.  filemap_release_folio() will
  1379			 * discover that cleanness and will drop the buffers
  1380			 * and mark the folio clean - it can be freed.
  1381			 *
  1382			 * Rarely, folios can have buffers and no ->mapping.
  1383			 * These are the folios which were not successfully
  1384			 * invalidated in truncate_cleanup_folio().  We try to
  1385			 * drop those buffers here and if that worked, and the
  1386			 * folio is no longer mapped into process address space
  1387			 * (refcount == 1) it can be freed.  Otherwise, leave
  1388			 * the folio on the LRU so it is swappable.
  1389			 */
  1390			if (folio_needs_release(folio)) {
  1391				if (!filemap_release_folio(folio, sc->gfp_mask))
  1392					goto activate_locked;
  1393				if (!mapping && folio_ref_count(folio) == 1) {
  1394					folio_unlock(folio);
  1395					if (folio_put_testzero(folio))
  1396						goto free_it;
  1397					else {
  1398						/*
  1399						 * rare race with speculative reference.
  1400						 * the speculative reference will free
  1401						 * this folio shortly, so we may
  1402						 * increment nr_reclaimed here (and
  1403						 * leave it off the LRU).
  1404						 */
  1405						nr_reclaimed += nr_pages;
  1406						continue;
  1407					}
  1408				}
  1409			}
  1410	
  1411			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
  1412				/* follow __remove_mapping for reference */
  1413				if (!folio_ref_freeze(folio, 1))
  1414					goto keep_locked;
  1415				/*
  1416				 * The folio has only one reference left, which is
  1417				 * from the isolation. After the caller puts the
  1418				 * folio back on the lru and drops the reference, the
  1419				 * folio will be freed anyway. It doesn't matter
  1420				 * which lru it goes on. So we don't bother checking
  1421				 * the dirty flag here.
  1422				 */
  1423				count_vm_events(PGLAZYFREED, nr_pages);
  1424				count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
  1425			} else if (!mapping || !__remove_mapping(mapping, folio, true,
  1426								 sc->target_mem_cgroup))
  1427				goto keep_locked;
  1428	
  1429			folio_unlock(folio);
  1430	free_it:
  1431			/*
  1432			 * Folio may get swapped out as a whole, need to account
  1433			 * all pages in it.
  1434			 */
  1435			nr_reclaimed += nr_pages;
  1436	
  1437			folio_unqueue_deferred_split(folio);
  1438			if (folio_batch_add(&free_folios, folio) == 0) {
  1439				mem_cgroup_uncharge_folios(&free_folios);
  1440				try_to_unmap_flush();
  1441				free_unref_folios(&free_folios);
  1442			}
  1443			continue;
  1444	
  1445	activate_locked_split:
  1446			/*
  1447			 * The tail pages that are failed to add into swap cache
  1448			 * reach here.  Fixup nr_scanned and nr_pages.
  1449			 */
  1450			if (nr_pages > 1) {
  1451				sc->nr_scanned -= (nr_pages - 1);
  1452				nr_pages = 1;
  1453			}
  1454	activate_locked:
  1455			/* Not a candidate for swapping, so reclaim swap space. */
  1456			if (folio_test_swapcache(folio) &&
  1457			    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
  1458				folio_free_swap(folio);
  1459			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1460			if (!folio_test_mlocked(folio)) {
  1461				int type = folio_is_file_lru(folio);
  1462				folio_set_active(folio);
  1463				stat->nr_activate[type] += nr_pages;
  1464				count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
  1465			}
  1466	keep_locked:
  1467			folio_unlock(folio);
  1468	keep:
  1469			list_add(&folio->lru, &ret_folios);
  1470			VM_BUG_ON_FOLIO(folio_test_lru(folio) ||
  1471					folio_test_unevictable(folio), folio);
  1472		}
  1473		/* 'folio_list' is always empty here */
  1474	
  1475	       if (!list_empty(&pageout_list)) {
  1476		       /*
  1477		       * Batch TLB flushes by flushing once before processing all dirty pages.
  1478		       * Since we operate on one PMD at a time, this batches TLB flushes at
  1479		       * PMD granularity rather than per-page, reducing IPIs.
  1480		       */
  1481		       struct address_space *mapping;
  1482		       try_to_unmap_flush_dirty();
  1483	
  1484		       while (!list_empty(&pageout_list)) {
  1485			       struct folio *folio = lru_to_folio(&pageout_list);
  1486			       list_del(&folio->lru);
  1487	
  1488			       /* Recheck if page got reactivated */
  1489			       if (folio_test_active(folio) ||
> 1490				   (folio_mapped(folio) && folio_test_young(folio)))
  1491				       goto skip_pageout_locked;
  1492	
  1493			       mapping = folio_mapping(folio);
> 1494			       pageout_t pageout_res = pageout(folio, mapping, &plug);
  1495			       switch (pageout_res) {
  1496			       case PAGE_KEEP:
  1497				       goto skip_pageout_locked;
  1498			       case PAGE_ACTIVATE:
  1499				       goto skip_pageout_locked;
  1500			       case PAGE_SUCCESS:
  1501				       stat->nr_pageout += folio_nr_pages(folio);
  1502	
  1503				       if (folio_test_writeback(folio) ||
  1504					   folio_test_dirty(folio))
  1505					       goto skip_pageout;
  1506	
  1507				       /*
  1508					* A synchronous write - probably a ramdisk.  Go
  1509					* ahead and try to reclaim the folio.
  1510					*/
  1511				       if (!folio_trylock(folio))
  1512					       goto skip_pageout;
  1513				       if (folio_test_dirty(folio) ||
  1514					   folio_test_writeback(folio))
  1515					       goto skip_pageout_locked;
  1516	
  1517				       // Try to free the page
  1518				       if (!mapping ||
  1519					   !__remove_mapping(mapping, folio, true,
  1520							   sc->target_mem_cgroup))
  1521					       goto skip_pageout_locked;
  1522	
  1523				       nr_reclaimed += folio_nr_pages(folio);
  1524				       folio_unlock(folio);
  1525				       continue;
  1526	
  1527			       case PAGE_CLEAN:
  1528				       if (!mapping ||
  1529					   !__remove_mapping(mapping, folio, true,
  1530							   sc->target_mem_cgroup))
  1531					       goto skip_pageout_locked;
  1532	
  1533				       nr_reclaimed += folio_nr_pages(folio);
  1534				       folio_unlock(folio);
  1535				       continue;
  1536			       }
  1537	
  1538	skip_pageout_locked:
  1539			       folio_unlock(folio);
  1540	skip_pageout:
  1541			       list_add(&folio->lru, &ret_folios);
  1542		       }
  1543	       }
  1544	
  1545		/* Migrate folios selected for demotion */
  1546		stat->nr_demoted = demote_folio_list(&demote_folios, pgdat);
  1547		nr_reclaimed += stat->nr_demoted;
  1548		/* Folios that could not be demoted are still in @demote_folios */
  1549		if (!list_empty(&demote_folios)) {
  1550			/* Folios which weren't demoted go back on @folio_list */
  1551			list_splice_init(&demote_folios, folio_list);
  1552	
  1553			/*
  1554			 * goto retry to reclaim the undemoted folios in folio_list if
  1555			 * desired.
  1556			 *
  1557			 * Reclaiming directly from top tier nodes is not often desired
  1558			 * due to it breaking the LRU ordering: in general memory
  1559			 * should be reclaimed from lower tier nodes and demoted from
  1560			 * top tier nodes.
  1561			 *
  1562			 * However, disabling reclaim from top tier nodes entirely
  1563			 * would cause ooms in edge scenarios where lower tier memory
  1564			 * is unreclaimable for whatever reason, eg memory being
  1565			 * mlocked or too hot to reclaim. We can disable reclaim
  1566			 * from top tier nodes in proactive reclaim though as that is
  1567			 * not real memory pressure.
  1568			 */
  1569			if (!sc->proactive) {
  1570				do_demote_pass = false;
  1571				goto retry;
  1572			}
  1573		}
  1574	
  1575		pgactivate = stat->nr_activate[0] + stat->nr_activate[1];
  1576	
  1577		mem_cgroup_uncharge_folios(&free_folios);
  1578		try_to_unmap_flush();
  1579		free_unref_folios(&free_folios);
  1580	
  1581		list_splice(&ret_folios, folio_list);
  1582		count_vm_events(PGACTIVATE, pgactivate);
  1583	
  1584		if (plug)
  1585			swap_write_unplug(plug);
  1586		return nr_reclaimed;
  1587	}
  1588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
