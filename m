Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9635C21B8E1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737722325; cv=none; b=KdmPvAIv4Y/6S3rTrBipYCgaVgj3oZwLKl1zWtuxfgez2pXq8+OHs/VEI9bCpdFnDEj10cFZ9DQ4zPZIMhpzzEQHvio78Y7Y+xIUW0I7FJnVeYjdrY/eBu2pMHqIuF7ytNIt5YAD8o0nXwqyX0kXaZQCQ3xPpYga4oXaiPCh4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737722325; c=relaxed/simple;
	bh=kndtozOs4r+8gQi0kJ0zUCWR01yvebx+RGcHQWKRLfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4Zm3b74hok66TU7BxwjTttKG+qJtMSbGy/YajbHNd3s5pIzbJ18R9JeT3CSshq1Nk7+gy10yL69cuC9DJlphNUbxWalse8/+O8e3xxXFVu7OTtxSNKCBzabMqkXf1sKSw9VWCxKBUqhSQVHK8KsVNQqibAZwE8PgFI2cKICcVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lc0o+ALp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lc0o+ALp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737722324; x=1769258324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kndtozOs4r+8gQi0kJ0zUCWR01yvebx+RGcHQWKRLfs=;
  b=Lc0o+ALpCqhGDhSBJsOck2B03AbV2Hyr/p1bippSnUqoZYNI48DKvbDC
   M2mJSI5kyBh3Nd0WIFCskxPcGuemgOYZGwhw6KtAbkz/KjSWG7/uOmk6Q
   RwaguXg2SR31WXBM7lj0civJIkiOSFLxG7VbpwxuU0moVHFf9+K/WqteB
   YN4agVjA1ZgD4OlHWkqWbw+S7hPLOGxkNv799pNlDNKSsDZ9l5Q0jfApI
   qdBIeTBM7UR8G74BLUgvnMlqDXIMXP0ejcmM4Xf13G3a0C8SCSf57MdXc
   bTeDlhpOC6aNMiP+JkJZ/oKmbZ4lHJv2uTXEeyrX4Y/HGuQNNC8hz7DYV
   w==;
X-CSE-ConnectionGUID: cfYmvgGpRoG+j8WP0GFYXw==
X-CSE-MsgGUID: t1iHT9OUQSqUyF2AdRCHKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49675369"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49675369"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:38:40 -0800
X-CSE-ConnectionGUID: F5PZRrrdTC6iMF9aY2u32Q==
X-CSE-MsgGUID: aMpxlabXQCa42bypZjBOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="138629516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2025 04:38:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbIxI-000cfn-2V;
	Fri, 24 Jan 2025 12:38:36 +0000
Date: Fri, 24 Jan 2025 20:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/tlb 1/1] mm/vmscan.c:1497:31: error: implicit declaration
 of function 'folio_test_young' is invalid in C99
Message-ID: <202501242056.pz6U54Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/tlb
head:   c9dda55c5e6834c384a63d5974f894c62bc2f6be
commit: c9dda55c5e6834c384a63d5974f894c62bc2f6be [1/1] mm: Optimize TLB flushes during page reclaim
config: hexagon-randconfig-002-20250124 (https://download.01.org/0day-ci/archive/20250124/202501242056.pz6U54Ja-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501242056.pz6U54Ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501242056.pz6U54Ja-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:1497:31: error: implicit declaration of function 'folio_test_young' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                              (folio_mapped(folio) && folio_test_young(folio)))
                                                      ^
   mm/vmscan.c:1501:63: error: too few arguments to function call, expected 4, have 3
                          pageout_t pageout_res = pageout(folio, mapping, &plug);
                                                  ~~~~~~~                      ^
   mm/vmscan.c:638:18: note: 'pageout' declared here
   static pageout_t pageout(struct folio *folio, struct address_space *mapping,
                    ^
   2 errors generated.


vim +/folio_test_young +1497 mm/vmscan.c

  1045	
  1046	/*
  1047	 * shrink_folio_list() returns the number of reclaimed pages
  1048	 */
  1049	static unsigned int shrink_folio_list(struct list_head *folio_list,
  1050			struct pglist_data *pgdat, struct scan_control *sc,
  1051			struct reclaim_stat *stat, bool ignore_references)
  1052	{
  1053		struct folio_batch free_folios;
  1054		LIST_HEAD(ret_folios);
  1055		LIST_HEAD(demote_folios);
  1056		LIST_HEAD(pageout_list);
  1057		unsigned int nr_reclaimed = 0;
  1058		unsigned int pgactivate = 0;
  1059		bool do_demote_pass;
  1060		struct swap_iocb *plug = NULL;
  1061	
  1062		folio_batch_init(&free_folios);
  1063		memset(stat, 0, sizeof(*stat));
  1064		cond_resched();
  1065		do_demote_pass = can_demote(pgdat->node_id, sc);
  1066	
  1067	retry:
  1068		while (!list_empty(folio_list)) {
  1069			struct address_space *mapping;
  1070			struct folio *folio;
  1071			enum folio_references references = FOLIOREF_RECLAIM;
  1072			bool dirty, writeback;
  1073			unsigned int nr_pages;
  1074	
  1075			cond_resched();
  1076	
  1077			folio = lru_to_folio(folio_list);
  1078			list_del(&folio->lru);
  1079	
  1080			if (!folio_trylock(folio))
  1081				goto keep;
  1082	
  1083			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1084	
  1085			nr_pages = folio_nr_pages(folio);
  1086	
  1087			/* Account the number of base pages */
  1088			sc->nr_scanned += nr_pages;
  1089	
  1090			if (unlikely(!folio_evictable(folio)))
  1091				goto activate_locked;
  1092	
  1093			if (!sc->may_unmap && folio_mapped(folio))
  1094				goto keep_locked;
  1095	
  1096			/* folio_update_gen() tried to promote this page? */
  1097			if (lru_gen_enabled() && !ignore_references &&
  1098			    folio_mapped(folio) && folio_test_referenced(folio))
  1099				goto keep_locked;
  1100	
  1101			/*
  1102			 * The number of dirty pages determines if a node is marked
  1103			 * reclaim_congested. kswapd will stall and start writing
  1104			 * folios if the tail of the LRU is all dirty unqueued folios.
  1105			 */
  1106			folio_check_dirty_writeback(folio, &dirty, &writeback);
  1107			if (dirty || writeback)
  1108				stat->nr_dirty += nr_pages;
  1109	
  1110			if (dirty && !writeback)
  1111				stat->nr_unqueued_dirty += nr_pages;
  1112	
  1113			/*
  1114			 * Treat this folio as congested if folios are cycling
  1115			 * through the LRU so quickly that the folios marked
  1116			 * for immediate reclaim are making it to the end of
  1117			 * the LRU a second time.
  1118			 */
  1119			if (writeback && folio_test_reclaim(folio))
  1120				stat->nr_congested += nr_pages;
  1121	
  1122			/*
  1123			 * If a folio at the tail of the LRU is under writeback, there
  1124			 * are three cases to consider.
  1125			 *
  1126			 * 1) If reclaim is encountering an excessive number
  1127			 *    of folios under writeback and this folio has both
  1128			 *    the writeback and reclaim flags set, then it
  1129			 *    indicates that folios are being queued for I/O but
  1130			 *    are being recycled through the LRU before the I/O
  1131			 *    can complete. Waiting on the folio itself risks an
  1132			 *    indefinite stall if it is impossible to writeback
  1133			 *    the folio due to I/O error or disconnected storage
  1134			 *    so instead note that the LRU is being scanned too
  1135			 *    quickly and the caller can stall after the folio
  1136			 *    list has been processed.
  1137			 *
  1138			 * 2) Global or new memcg reclaim encounters a folio that is
  1139			 *    not marked for immediate reclaim, or the caller does not
  1140			 *    have __GFP_FS (or __GFP_IO if it's simply going to swap,
  1141			 *    not to fs). In this case mark the folio for immediate
  1142			 *    reclaim and continue scanning.
  1143			 *
  1144			 *    Require may_enter_fs() because we would wait on fs, which
  1145			 *    may not have submitted I/O yet. And the loop driver might
  1146			 *    enter reclaim, and deadlock if it waits on a folio for
  1147			 *    which it is needed to do the write (loop masks off
  1148			 *    __GFP_IO|__GFP_FS for this reason); but more thought
  1149			 *    would probably show more reasons.
  1150			 *
  1151			 * 3) Legacy memcg encounters a folio that already has the
  1152			 *    reclaim flag set. memcg does not have any dirty folio
  1153			 *    throttling so we could easily OOM just because too many
  1154			 *    folios are in writeback and there is nothing else to
  1155			 *    reclaim. Wait for the writeback to complete.
  1156			 *
  1157			 * In cases 1) and 2) we activate the folios to get them out of
  1158			 * the way while we continue scanning for clean folios on the
  1159			 * inactive list and refilling from the active list. The
  1160			 * observation here is that waiting for disk writes is more
  1161			 * expensive than potentially causing reloads down the line.
  1162			 * Since they're marked for immediate reclaim, they won't put
  1163			 * memory pressure on the cache working set any longer than it
  1164			 * takes to write them to disk.
  1165			 */
  1166			if (folio_test_writeback(folio)) {
  1167				/* Case 1 above */
  1168				if (current_is_kswapd() &&
  1169				    folio_test_reclaim(folio) &&
  1170				    test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {
  1171					stat->nr_immediate += nr_pages;
  1172					goto activate_locked;
  1173	
  1174				/* Case 2 above */
  1175				} else if (writeback_throttling_sane(sc) ||
  1176				    !folio_test_reclaim(folio) ||
  1177				    !may_enter_fs(folio, sc->gfp_mask)) {
  1178					/*
  1179					 * This is slightly racy -
  1180					 * folio_end_writeback() might have
  1181					 * just cleared the reclaim flag, then
  1182					 * setting the reclaim flag here ends up
  1183					 * interpreted as the readahead flag - but
  1184					 * that does not matter enough to care.
  1185					 * What we do want is for this folio to
  1186					 * have the reclaim flag set next time
  1187					 * memcg reclaim reaches the tests above,
  1188					 * so it will then wait for writeback to
  1189					 * avoid OOM; and it's also appropriate
  1190					 * in global reclaim.
  1191					 */
  1192					folio_set_reclaim(folio);
  1193					stat->nr_writeback += nr_pages;
  1194					goto activate_locked;
  1195	
  1196				/* Case 3 above */
  1197				} else {
  1198					folio_unlock(folio);
  1199					folio_wait_writeback(folio);
  1200					/* then go back and try same folio again */
  1201					list_add_tail(&folio->lru, folio_list);
  1202					continue;
  1203				}
  1204			}
  1205	
  1206			if (!ignore_references)
  1207				references = folio_check_references(folio, sc);
  1208	
  1209			switch (references) {
  1210			case FOLIOREF_ACTIVATE:
  1211				goto activate_locked;
  1212			case FOLIOREF_KEEP:
  1213				stat->nr_ref_keep += nr_pages;
  1214				goto keep_locked;
  1215			case FOLIOREF_RECLAIM:
  1216			case FOLIOREF_RECLAIM_CLEAN:
  1217				; /* try to reclaim the folio below */
  1218			}
  1219	
  1220			/*
  1221			 * Before reclaiming the folio, try to relocate
  1222			 * its contents to another node.
  1223			 */
  1224			if (do_demote_pass &&
  1225			    (thp_migration_supported() || !folio_test_large(folio))) {
  1226				list_add(&folio->lru, &demote_folios);
  1227				folio_unlock(folio);
  1228				continue;
  1229			}
  1230	
  1231			/*
  1232			 * Anonymous process memory has backing store?
  1233			 * Try to allocate it some swap space here.
  1234			 * Lazyfree folio could be freed directly
  1235			 */
  1236			if (folio_test_anon(folio) && folio_test_swapbacked(folio)) {
  1237				if (!folio_test_swapcache(folio)) {
  1238					if (!(sc->gfp_mask & __GFP_IO))
  1239						goto keep_locked;
  1240					if (folio_maybe_dma_pinned(folio))
  1241						goto keep_locked;
  1242					if (folio_test_large(folio)) {
  1243						/* cannot split folio, skip it */
  1244						if (!can_split_folio(folio, 1, NULL))
  1245							goto activate_locked;
  1246						/*
  1247						 * Split partially mapped folios right away.
  1248						 * We can free the unmapped pages without IO.
  1249						 */
  1250						if (data_race(!list_empty(&folio->_deferred_list) &&
  1251						    folio_test_partially_mapped(folio)) &&
  1252						    split_folio_to_list(folio, folio_list))
  1253							goto activate_locked;
  1254					}
  1255					if (!add_to_swap(folio)) {
  1256						int __maybe_unused order = folio_order(folio);
  1257	
  1258						if (!folio_test_large(folio))
  1259							goto activate_locked_split;
  1260						/* Fallback to swap normal pages */
  1261						if (split_folio_to_list(folio, folio_list))
  1262							goto activate_locked;
  1263	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1264						if (nr_pages >= HPAGE_PMD_NR) {
  1265							count_memcg_folio_events(folio,
  1266								THP_SWPOUT_FALLBACK, 1);
  1267							count_vm_event(THP_SWPOUT_FALLBACK);
  1268						}
  1269	#endif
  1270						count_mthp_stat(order, MTHP_STAT_SWPOUT_FALLBACK);
  1271						if (!add_to_swap(folio))
  1272							goto activate_locked_split;
  1273					}
  1274				}
  1275			}
  1276	
  1277			/*
  1278			 * If the folio was split above, the tail pages will make
  1279			 * their own pass through this function and be accounted
  1280			 * then.
  1281			 */
  1282			if ((nr_pages > 1) && !folio_test_large(folio)) {
  1283				sc->nr_scanned -= (nr_pages - 1);
  1284				nr_pages = 1;
  1285			}
  1286	
  1287			/*
  1288			 * The folio is mapped into the page tables of one or more
  1289			 * processes. Try to unmap it here.
  1290			 */
  1291			if (folio_mapped(folio)) {
  1292				enum ttu_flags flags = TTU_BATCH_FLUSH;
  1293				bool was_swapbacked = folio_test_swapbacked(folio);
  1294	
  1295				if (folio_test_pmd_mappable(folio))
  1296					flags |= TTU_SPLIT_HUGE_PMD;
  1297				/*
  1298				 * Without TTU_SYNC, try_to_unmap will only begin to
  1299				 * hold PTL from the first present PTE within a large
  1300				 * folio. Some initial PTEs might be skipped due to
  1301				 * races with parallel PTE writes in which PTEs can be
  1302				 * cleared temporarily before being written new present
  1303				 * values. This will lead to a large folio is still
  1304				 * mapped while some subpages have been partially
  1305				 * unmapped after try_to_unmap; TTU_SYNC helps
  1306				 * try_to_unmap acquire PTL from the first PTE,
  1307				 * eliminating the influence of temporary PTE values.
  1308				 */
  1309				if (folio_test_large(folio))
  1310					flags |= TTU_SYNC;
  1311	
  1312				try_to_unmap(folio, flags);
  1313				if (folio_mapped(folio)) {
  1314					stat->nr_unmap_fail += nr_pages;
  1315					if (!was_swapbacked &&
  1316					    folio_test_swapbacked(folio))
  1317						stat->nr_lazyfree_fail += nr_pages;
  1318					goto activate_locked;
  1319				}
  1320			}
  1321	
  1322			/*
  1323			 * Folio is unmapped now so it cannot be newly pinned anymore.
  1324			 * No point in trying to reclaim folio if it is pinned.
  1325			 * Furthermore we don't want to reclaim underlying fs metadata
  1326			 * if the folio is pinned and thus potentially modified by the
  1327			 * pinning process as that may upset the filesystem.
  1328			 */
  1329			if (folio_maybe_dma_pinned(folio))
  1330				goto activate_locked;
  1331	
  1332			mapping = folio_mapping(folio);
  1333			if (folio_test_dirty(folio)) {
  1334				/*
  1335				 * Only kswapd can writeback filesystem folios
  1336				 * to avoid risk of stack overflow. But avoid
  1337				 * injecting inefficient single-folio I/O into
  1338				 * flusher writeback as much as possible: only
  1339				 * write folios when we've encountered many
  1340				 * dirty folios, and when we've already scanned
  1341				 * the rest of the LRU for clean folios and see
  1342				 * the same dirty folios again (with the reclaim
  1343				 * flag set).
  1344				 */
  1345				if (folio_is_file_lru(folio) &&
  1346				    (!current_is_kswapd() ||
  1347				     !folio_test_reclaim(folio) ||
  1348				     !test_bit(PGDAT_DIRTY, &pgdat->flags))) {
  1349					/*
  1350					 * Immediately reclaim when written back.
  1351					 * Similar in principle to folio_deactivate()
  1352					 * except we already have the folio isolated
  1353					 * and know it's dirty
  1354					 */
  1355					node_stat_mod_folio(folio, NR_VMSCAN_IMMEDIATE,
  1356							nr_pages);
  1357					folio_set_reclaim(folio);
  1358	
  1359					goto activate_locked;
  1360				}
  1361	
  1362				if (references == FOLIOREF_RECLAIM_CLEAN)
  1363					goto keep_locked;
  1364				if (!may_enter_fs(folio, sc->gfp_mask))
  1365					goto keep_locked;
  1366				if (!sc->may_writepage)
  1367					goto keep_locked;
  1368	
  1369				/* Add to pageout list for defered bio submissions */
  1370				list_add(&folio->lru, &pageout_list);
  1371				continue;
  1372			}
  1373	
  1374			/*
  1375			 * If the folio has buffers, try to free the buffer
  1376			 * mappings associated with this folio. If we succeed
  1377			 * we try to free the folio as well.
  1378			 *
  1379			 * We do this even if the folio is dirty.
  1380			 * filemap_release_folio() does not perform I/O, but it
  1381			 * is possible for a folio to have the dirty flag set,
  1382			 * but it is actually clean (all its buffers are clean).
  1383			 * This happens if the buffers were written out directly,
  1384			 * with submit_bh(). ext3 will do this, as well as
  1385			 * the blockdev mapping.  filemap_release_folio() will
  1386			 * discover that cleanness and will drop the buffers
  1387			 * and mark the folio clean - it can be freed.
  1388			 *
  1389			 * Rarely, folios can have buffers and no ->mapping.
  1390			 * These are the folios which were not successfully
  1391			 * invalidated in truncate_cleanup_folio().  We try to
  1392			 * drop those buffers here and if that worked, and the
  1393			 * folio is no longer mapped into process address space
  1394			 * (refcount == 1) it can be freed.  Otherwise, leave
  1395			 * the folio on the LRU so it is swappable.
  1396			 */
  1397			if (folio_needs_release(folio)) {
  1398				if (!filemap_release_folio(folio, sc->gfp_mask))
  1399					goto activate_locked;
  1400				if (!mapping && folio_ref_count(folio) == 1) {
  1401					folio_unlock(folio);
  1402					if (folio_put_testzero(folio))
  1403						goto free_it;
  1404					else {
  1405						/*
  1406						 * rare race with speculative reference.
  1407						 * the speculative reference will free
  1408						 * this folio shortly, so we may
  1409						 * increment nr_reclaimed here (and
  1410						 * leave it off the LRU).
  1411						 */
  1412						nr_reclaimed += nr_pages;
  1413						continue;
  1414					}
  1415				}
  1416			}
  1417	
  1418			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
  1419				/* follow __remove_mapping for reference */
  1420				if (!folio_ref_freeze(folio, 1))
  1421					goto keep_locked;
  1422				/*
  1423				 * The folio has only one reference left, which is
  1424				 * from the isolation. After the caller puts the
  1425				 * folio back on the lru and drops the reference, the
  1426				 * folio will be freed anyway. It doesn't matter
  1427				 * which lru it goes on. So we don't bother checking
  1428				 * the dirty flag here.
  1429				 */
  1430				count_vm_events(PGLAZYFREED, nr_pages);
  1431				count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
  1432			} else if (!mapping || !__remove_mapping(mapping, folio, true,
  1433								 sc->target_mem_cgroup))
  1434				goto keep_locked;
  1435	
  1436			folio_unlock(folio);
  1437	free_it:
  1438			/*
  1439			 * Folio may get swapped out as a whole, need to account
  1440			 * all pages in it.
  1441			 */
  1442			nr_reclaimed += nr_pages;
  1443	
  1444			folio_unqueue_deferred_split(folio);
  1445			if (folio_batch_add(&free_folios, folio) == 0) {
  1446				mem_cgroup_uncharge_folios(&free_folios);
  1447				try_to_unmap_flush();
  1448				free_unref_folios(&free_folios);
  1449			}
  1450			continue;
  1451	
  1452	activate_locked_split:
  1453			/*
  1454			 * The tail pages that are failed to add into swap cache
  1455			 * reach here.  Fixup nr_scanned and nr_pages.
  1456			 */
  1457			if (nr_pages > 1) {
  1458				sc->nr_scanned -= (nr_pages - 1);
  1459				nr_pages = 1;
  1460			}
  1461	activate_locked:
  1462			/* Not a candidate for swapping, so reclaim swap space. */
  1463			if (folio_test_swapcache(folio) &&
  1464			    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
  1465				folio_free_swap(folio);
  1466			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1467			if (!folio_test_mlocked(folio)) {
  1468				int type = folio_is_file_lru(folio);
  1469				folio_set_active(folio);
  1470				stat->nr_activate[type] += nr_pages;
  1471				count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
  1472			}
  1473	keep_locked:
  1474			folio_unlock(folio);
  1475	keep:
  1476			list_add(&folio->lru, &ret_folios);
  1477			VM_BUG_ON_FOLIO(folio_test_lru(folio) ||
  1478					folio_test_unevictable(folio), folio);
  1479		}
  1480		/* 'folio_list' is always empty here */
  1481	
  1482	       if (!list_empty(&pageout_list)) {
  1483		       /*
  1484		       * Batch TLB flushes by flushing once before processing all dirty pages.
  1485		       * Since we operate on one PMD at a time, this batches TLB flushes at
  1486		       * PMD granularity rather than per-page, reducing IPIs.
  1487		       */
  1488		       struct address_space *mapping;
  1489		       try_to_unmap_flush_dirty();
  1490	
  1491		       while (!list_empty(&pageout_list)) {
  1492			       struct folio *folio = lru_to_folio(&pageout_list);
  1493			       list_del(&folio->lru);
  1494	
  1495			       /* Recheck if page got reactivated */
  1496			       if (folio_test_active(folio) ||
> 1497				   (folio_mapped(folio) && folio_test_young(folio)))
  1498				       goto skip_pageout_locked;
  1499	
  1500			       mapping = folio_mapping(folio);
  1501			       pageout_t pageout_res = pageout(folio, mapping, &plug);
  1502			       switch (pageout_res) {
  1503			       case PAGE_KEEP:
  1504				       goto skip_pageout_locked;
  1505			       case PAGE_ACTIVATE:
  1506				       goto skip_pageout_locked;
  1507			       case PAGE_SUCCESS:
  1508				       stat->nr_pageout += folio_nr_pages(folio);
  1509	
  1510				       if (folio_test_writeback(folio) ||
  1511					   folio_test_dirty(folio))
  1512					       goto skip_pageout;
  1513	
  1514				       /*
  1515					* A synchronous write - probably a ramdisk.  Go
  1516					* ahead and try to reclaim the folio.
  1517					*/
  1518				       if (!folio_trylock(folio))
  1519					       goto skip_pageout;
  1520				       if (folio_test_dirty(folio) ||
  1521					   folio_test_writeback(folio))
  1522					       goto skip_pageout_locked;
  1523	
  1524				       // Try to free the page
  1525				       if (!mapping ||
  1526					   !__remove_mapping(mapping, folio, true,
  1527							   sc->target_mem_cgroup))
  1528					       goto skip_pageout_locked;
  1529	
  1530				       nr_reclaimed += folio_nr_pages(folio);
  1531				       folio_unlock(folio);
  1532				       continue;
  1533	
  1534			       case PAGE_CLEAN:
  1535				       if (!mapping ||
  1536					   !__remove_mapping(mapping, folio, true,
  1537							   sc->target_mem_cgroup))
  1538					       goto skip_pageout_locked;
  1539	
  1540				       nr_reclaimed += folio_nr_pages(folio);
  1541				       folio_unlock(folio);
  1542				       continue;
  1543			       }
  1544	
  1545	skip_pageout_locked:
  1546			       folio_unlock(folio);
  1547	skip_pageout:
  1548			       list_add(&folio->lru, &ret_folios);
  1549		       }
  1550	       }
  1551	
  1552		/* Migrate folios selected for demotion */
  1553		stat->nr_demoted = demote_folio_list(&demote_folios, pgdat);
  1554		nr_reclaimed += stat->nr_demoted;
  1555		/* Folios that could not be demoted are still in @demote_folios */
  1556		if (!list_empty(&demote_folios)) {
  1557			/* Folios which weren't demoted go back on @folio_list */
  1558			list_splice_init(&demote_folios, folio_list);
  1559	
  1560			/*
  1561			 * goto retry to reclaim the undemoted folios in folio_list if
  1562			 * desired.
  1563			 *
  1564			 * Reclaiming directly from top tier nodes is not often desired
  1565			 * due to it breaking the LRU ordering: in general memory
  1566			 * should be reclaimed from lower tier nodes and demoted from
  1567			 * top tier nodes.
  1568			 *
  1569			 * However, disabling reclaim from top tier nodes entirely
  1570			 * would cause ooms in edge scenarios where lower tier memory
  1571			 * is unreclaimable for whatever reason, eg memory being
  1572			 * mlocked or too hot to reclaim. We can disable reclaim
  1573			 * from top tier nodes in proactive reclaim though as that is
  1574			 * not real memory pressure.
  1575			 */
  1576			if (!sc->proactive) {
  1577				do_demote_pass = false;
  1578				goto retry;
  1579			}
  1580		}
  1581	
  1582		pgactivate = stat->nr_activate[0] + stat->nr_activate[1];
  1583	
  1584		mem_cgroup_uncharge_folios(&free_folios);
  1585		try_to_unmap_flush();
  1586		free_unref_folios(&free_folios);
  1587	
  1588		list_splice(&ret_folios, folio_list);
  1589		count_vm_events(PGACTIVATE, pgactivate);
  1590	
  1591		if (plug)
  1592			swap_write_unplug(plug);
  1593		return nr_reclaimed;
  1594	}
  1595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
