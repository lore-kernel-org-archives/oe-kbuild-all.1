Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25712156F45
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770007469; cv=none; b=GpotsnCgNkm5PnH195nARxbHK2QQoE+XibbgWidLsnUgRzsBbGXWYdN7x/7BFVC3CLuis6JNeOG8mo8zn13Xq0UHqfc2i9WFUsOWdTCijlqsg2bMtFS+6ZAuDzkcj6TOCxoiHD3ZDE8AqvHH+383QWzfqvTeZDk3jDiqUfLiOYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770007469; c=relaxed/simple;
	bh=wUHY84hZcBG/VlIMhvJDVxPwfDngXL9lpd9T/wQwpQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbNGaX7P/PtJ41jQ+OrxYfTIKaiOTOy/LVDyH8JUOWdewhcMv/nAATzPil/f05WGjrzWut314LUZMV9TiqCMT1WaLNBEoIPGbrBbEcHqmF7CGPSzCwV+ii6+eyW2grIuXYtV1BqTtpCmq+3WBTd4HXLoRnH0TbcTez+/lriciOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1IqmmmY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1IqmmmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770007466; x=1801543466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wUHY84hZcBG/VlIMhvJDVxPwfDngXL9lpd9T/wQwpQ0=;
  b=j1IqmmmYBAdybIm9PFFQFJyBLPvs922YUlbPiFwJbeNADG7laUjUvO4i
   NWhwLvb+nIudeGKK3yubdfMM6+QWRrbGdiOTY3q3QbKqUOhD+HHfKuvQL
   L4SsHmFO5xHXtljyphcsaFaICL19QzQmwmUzR+JCcn3vKuAdPlrDI/kAx
   8/ItVgFhe2W0cTsiJltKPU9LN8oPNdsBN9PUdKxN8ucKfO+MpPOZ7/eKU
   58GmVagPXvabMv5mfMQ4fLotYswsYWrkmd7relsZz9V0aG3AjsWEYxkeR
   AmBy11Eg2GI6pwX2f3Gw/gVy/Cyds3+2vtgWIan/+lN1vXhmsBlp2CmNW
   g==;
X-CSE-ConnectionGUID: w4Y1LPCTSdmlZ+sFCOZCjw==
X-CSE-MsgGUID: RnxXUYB6RKeDLvkuhvA6+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71246615"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="71246615"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 20:44:25 -0800
X-CSE-ConnectionGUID: y103CyBwS4OJ2Tboi/4q5A==
X-CSE-MsgGUID: Ll7QYtNkQiKtYJkw5YjjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="209718312"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Feb 2026 20:44:24 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmlnR-00000000fEm-2lPO;
	Mon, 02 Feb 2026 04:44:21 +0000
Date: Mon, 2 Feb 2026 12:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 05/12] mm: thp: add reclaim and migration support for PUD
 THP
Message-ID: <202602021257.pz4igUG7-lkp@intel.com>
References: <20260202005451.774496-6-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202005451.774496-6-usamaarif642@gmail.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-PUD-THP-ptdesc-and-rmap-support/20260202-085725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260202005451.774496-6-usamaarif642%40gmail.com
patch subject: [RFC 05/12] mm: thp: add reclaim and migration support for PUD THP
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260202/202602021257.pz4igUG7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021257.pz4igUG7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021257.pz4igUG7-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'shrink_folio_list':
>> mm/vmscan.c:1358:29: error: implicit declaration of function 'folio_test_pud_mappable'; did you mean 'folio_test_pmd_mappable'? [-Werror=implicit-function-declaration]
    1358 |                         if (folio_test_pud_mappable(folio))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
         |                             folio_test_pmd_mappable
   cc1: some warnings being treated as errors


vim +1358 mm/vmscan.c

  1079	
  1080	/*
  1081	 * shrink_folio_list() returns the number of reclaimed pages
  1082	 */
  1083	static unsigned int shrink_folio_list(struct list_head *folio_list,
  1084			struct pglist_data *pgdat, struct scan_control *sc,
  1085			struct reclaim_stat *stat, bool ignore_references,
  1086			struct mem_cgroup *memcg)
  1087	{
  1088		struct folio_batch free_folios;
  1089		LIST_HEAD(ret_folios);
  1090		LIST_HEAD(demote_folios);
  1091		unsigned int nr_reclaimed = 0, nr_demoted = 0;
  1092		unsigned int pgactivate = 0;
  1093		bool do_demote_pass;
  1094		struct swap_iocb *plug = NULL;
  1095	
  1096		folio_batch_init(&free_folios);
  1097		memset(stat, 0, sizeof(*stat));
  1098		cond_resched();
  1099		do_demote_pass = can_demote(pgdat->node_id, sc, memcg);
  1100	
  1101	retry:
  1102		while (!list_empty(folio_list)) {
  1103			struct address_space *mapping;
  1104			struct folio *folio;
  1105			enum folio_references references = FOLIOREF_RECLAIM;
  1106			bool dirty, writeback;
  1107			unsigned int nr_pages;
  1108	
  1109			cond_resched();
  1110	
  1111			folio = lru_to_folio(folio_list);
  1112			list_del(&folio->lru);
  1113	
  1114			if (!folio_trylock(folio))
  1115				goto keep;
  1116	
  1117			if (folio_contain_hwpoisoned_page(folio)) {
  1118				/*
  1119				 * unmap_poisoned_folio() can't handle large
  1120				 * folio, just skip it. memory_failure() will
  1121				 * handle it if the UCE is triggered again.
  1122				 */
  1123				if (folio_test_large(folio))
  1124					goto keep_locked;
  1125	
  1126				unmap_poisoned_folio(folio, folio_pfn(folio), false);
  1127				folio_unlock(folio);
  1128				folio_put(folio);
  1129				continue;
  1130			}
  1131	
  1132			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1133	
  1134			nr_pages = folio_nr_pages(folio);
  1135	
  1136			/* Account the number of base pages */
  1137			sc->nr_scanned += nr_pages;
  1138	
  1139			if (unlikely(!folio_evictable(folio)))
  1140				goto activate_locked;
  1141	
  1142			if (!sc->may_unmap && folio_mapped(folio))
  1143				goto keep_locked;
  1144	
  1145			/*
  1146			 * The number of dirty pages determines if a node is marked
  1147			 * reclaim_congested. kswapd will stall and start writing
  1148			 * folios if the tail of the LRU is all dirty unqueued folios.
  1149			 */
  1150			folio_check_dirty_writeback(folio, &dirty, &writeback);
  1151			if (dirty || writeback)
  1152				stat->nr_dirty += nr_pages;
  1153	
  1154			if (dirty && !writeback)
  1155				stat->nr_unqueued_dirty += nr_pages;
  1156	
  1157			/*
  1158			 * Treat this folio as congested if folios are cycling
  1159			 * through the LRU so quickly that the folios marked
  1160			 * for immediate reclaim are making it to the end of
  1161			 * the LRU a second time.
  1162			 */
  1163			if (writeback && folio_test_reclaim(folio))
  1164				stat->nr_congested += nr_pages;
  1165	
  1166			/*
  1167			 * If a folio at the tail of the LRU is under writeback, there
  1168			 * are three cases to consider.
  1169			 *
  1170			 * 1) If reclaim is encountering an excessive number
  1171			 *    of folios under writeback and this folio has both
  1172			 *    the writeback and reclaim flags set, then it
  1173			 *    indicates that folios are being queued for I/O but
  1174			 *    are being recycled through the LRU before the I/O
  1175			 *    can complete. Waiting on the folio itself risks an
  1176			 *    indefinite stall if it is impossible to writeback
  1177			 *    the folio due to I/O error or disconnected storage
  1178			 *    so instead note that the LRU is being scanned too
  1179			 *    quickly and the caller can stall after the folio
  1180			 *    list has been processed.
  1181			 *
  1182			 * 2) Global or new memcg reclaim encounters a folio that is
  1183			 *    not marked for immediate reclaim, or the caller does not
  1184			 *    have __GFP_FS (or __GFP_IO if it's simply going to swap,
  1185			 *    not to fs), or the folio belongs to a mapping where
  1186			 *    waiting on writeback during reclaim may lead to a deadlock.
  1187			 *    In this case mark the folio for immediate reclaim and
  1188			 *    continue scanning.
  1189			 *
  1190			 *    Require may_enter_fs() because we would wait on fs, which
  1191			 *    may not have submitted I/O yet. And the loop driver might
  1192			 *    enter reclaim, and deadlock if it waits on a folio for
  1193			 *    which it is needed to do the write (loop masks off
  1194			 *    __GFP_IO|__GFP_FS for this reason); but more thought
  1195			 *    would probably show more reasons.
  1196			 *
  1197			 * 3) Legacy memcg encounters a folio that already has the
  1198			 *    reclaim flag set. memcg does not have any dirty folio
  1199			 *    throttling so we could easily OOM just because too many
  1200			 *    folios are in writeback and there is nothing else to
  1201			 *    reclaim. Wait for the writeback to complete.
  1202			 *
  1203			 * In cases 1) and 2) we activate the folios to get them out of
  1204			 * the way while we continue scanning for clean folios on the
  1205			 * inactive list and refilling from the active list. The
  1206			 * observation here is that waiting for disk writes is more
  1207			 * expensive than potentially causing reloads down the line.
  1208			 * Since they're marked for immediate reclaim, they won't put
  1209			 * memory pressure on the cache working set any longer than it
  1210			 * takes to write them to disk.
  1211			 */
  1212			if (folio_test_writeback(folio)) {
  1213				mapping = folio_mapping(folio);
  1214	
  1215				/* Case 1 above */
  1216				if (current_is_kswapd() &&
  1217				    folio_test_reclaim(folio) &&
  1218				    test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {
  1219					stat->nr_immediate += nr_pages;
  1220					goto activate_locked;
  1221	
  1222				/* Case 2 above */
  1223				} else if (writeback_throttling_sane(sc) ||
  1224				    !folio_test_reclaim(folio) ||
  1225				    !may_enter_fs(folio, sc->gfp_mask) ||
  1226				    (mapping &&
  1227				     mapping_writeback_may_deadlock_on_reclaim(mapping))) {
  1228					/*
  1229					 * This is slightly racy -
  1230					 * folio_end_writeback() might have
  1231					 * just cleared the reclaim flag, then
  1232					 * setting the reclaim flag here ends up
  1233					 * interpreted as the readahead flag - but
  1234					 * that does not matter enough to care.
  1235					 * What we do want is for this folio to
  1236					 * have the reclaim flag set next time
  1237					 * memcg reclaim reaches the tests above,
  1238					 * so it will then wait for writeback to
  1239					 * avoid OOM; and it's also appropriate
  1240					 * in global reclaim.
  1241					 */
  1242					folio_set_reclaim(folio);
  1243					stat->nr_writeback += nr_pages;
  1244					goto activate_locked;
  1245	
  1246				/* Case 3 above */
  1247				} else {
  1248					folio_unlock(folio);
  1249					folio_wait_writeback(folio);
  1250					/* then go back and try same folio again */
  1251					list_add_tail(&folio->lru, folio_list);
  1252					continue;
  1253				}
  1254			}
  1255	
  1256			if (!ignore_references)
  1257				references = folio_check_references(folio, sc);
  1258	
  1259			switch (references) {
  1260			case FOLIOREF_ACTIVATE:
  1261				goto activate_locked;
  1262			case FOLIOREF_KEEP:
  1263				stat->nr_ref_keep += nr_pages;
  1264				goto keep_locked;
  1265			case FOLIOREF_RECLAIM:
  1266			case FOLIOREF_RECLAIM_CLEAN:
  1267				; /* try to reclaim the folio below */
  1268			}
  1269	
  1270			/*
  1271			 * Before reclaiming the folio, try to relocate
  1272			 * its contents to another node.
  1273			 */
  1274			if (do_demote_pass &&
  1275			    (thp_migration_supported() || !folio_test_large(folio))) {
  1276				list_add(&folio->lru, &demote_folios);
  1277				folio_unlock(folio);
  1278				continue;
  1279			}
  1280	
  1281			/*
  1282			 * Anonymous process memory has backing store?
  1283			 * Try to allocate it some swap space here.
  1284			 * Lazyfree folio could be freed directly
  1285			 */
  1286			if (folio_test_anon(folio) && folio_test_swapbacked(folio) &&
  1287					!folio_test_swapcache(folio)) {
  1288				if (!(sc->gfp_mask & __GFP_IO))
  1289					goto keep_locked;
  1290				if (folio_maybe_dma_pinned(folio))
  1291					goto keep_locked;
  1292				if (folio_test_large(folio)) {
  1293					/* cannot split folio, skip it */
  1294					if (folio_expected_ref_count(folio) !=
  1295					    folio_ref_count(folio) - 1)
  1296						goto activate_locked;
  1297					/*
  1298					 * Split partially mapped folios right away.
  1299					 * We can free the unmapped pages without IO.
  1300					 */
  1301					if (data_race(!list_empty(&folio->_deferred_list) &&
  1302					    folio_test_partially_mapped(folio)) &&
  1303					    split_folio_to_list(folio, folio_list))
  1304						goto activate_locked;
  1305				}
  1306				if (folio_alloc_swap(folio)) {
  1307					int __maybe_unused order = folio_order(folio);
  1308	
  1309					if (!folio_test_large(folio))
  1310						goto activate_locked_split;
  1311					/* Fallback to swap normal pages */
  1312					if (split_folio_to_list(folio, folio_list))
  1313						goto activate_locked;
  1314	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1315					if (nr_pages >= HPAGE_PMD_NR) {
  1316						count_memcg_folio_events(folio,
  1317							THP_SWPOUT_FALLBACK, 1);
  1318						count_vm_event(THP_SWPOUT_FALLBACK);
  1319					}
  1320	#endif
  1321					count_mthp_stat(order, MTHP_STAT_SWPOUT_FALLBACK);
  1322					if (folio_alloc_swap(folio))
  1323						goto activate_locked_split;
  1324				}
  1325				/*
  1326				 * Normally the folio will be dirtied in unmap because
  1327				 * its pte should be dirty. A special case is MADV_FREE
  1328				 * page. The page's pte could have dirty bit cleared but
  1329				 * the folio's SwapBacked flag is still set because
  1330				 * clearing the dirty bit and SwapBacked flag has no
  1331				 * lock protected. For such folio, unmap will not set
  1332				 * dirty bit for it, so folio reclaim will not write the
  1333				 * folio out. This can cause data corruption when the
  1334				 * folio is swapped in later. Always setting the dirty
  1335				 * flag for the folio solves the problem.
  1336				 */
  1337				folio_mark_dirty(folio);
  1338			}
  1339	
  1340			/*
  1341			 * If the folio was split above, the tail pages will make
  1342			 * their own pass through this function and be accounted
  1343			 * then.
  1344			 */
  1345			if ((nr_pages > 1) && !folio_test_large(folio)) {
  1346				sc->nr_scanned -= (nr_pages - 1);
  1347				nr_pages = 1;
  1348			}
  1349	
  1350			/*
  1351			 * The folio is mapped into the page tables of one or more
  1352			 * processes. Try to unmap it here.
  1353			 */
  1354			if (folio_mapped(folio)) {
  1355				enum ttu_flags flags = TTU_BATCH_FLUSH;
  1356				bool was_swapbacked = folio_test_swapbacked(folio);
  1357	
> 1358				if (folio_test_pud_mappable(folio))
  1359					flags |= TTU_SPLIT_HUGE_PUD;
  1360				if (folio_test_pmd_mappable(folio))
  1361					flags |= TTU_SPLIT_HUGE_PMD;
  1362				/*
  1363				 * Without TTU_SYNC, try_to_unmap will only begin to
  1364				 * hold PTL from the first present PTE within a large
  1365				 * folio. Some initial PTEs might be skipped due to
  1366				 * races with parallel PTE writes in which PTEs can be
  1367				 * cleared temporarily before being written new present
  1368				 * values. This will lead to a large folio is still
  1369				 * mapped while some subpages have been partially
  1370				 * unmapped after try_to_unmap; TTU_SYNC helps
  1371				 * try_to_unmap acquire PTL from the first PTE,
  1372				 * eliminating the influence of temporary PTE values.
  1373				 */
  1374				if (folio_test_large(folio))
  1375					flags |= TTU_SYNC;
  1376	
  1377				try_to_unmap(folio, flags);
  1378				if (folio_mapped(folio)) {
  1379					stat->nr_unmap_fail += nr_pages;
  1380					if (!was_swapbacked &&
  1381					    folio_test_swapbacked(folio))
  1382						stat->nr_lazyfree_fail += nr_pages;
  1383					goto activate_locked;
  1384				}
  1385			}
  1386	
  1387			/*
  1388			 * Folio is unmapped now so it cannot be newly pinned anymore.
  1389			 * No point in trying to reclaim folio if it is pinned.
  1390			 * Furthermore we don't want to reclaim underlying fs metadata
  1391			 * if the folio is pinned and thus potentially modified by the
  1392			 * pinning process as that may upset the filesystem.
  1393			 */
  1394			if (folio_maybe_dma_pinned(folio))
  1395				goto activate_locked;
  1396	
  1397			mapping = folio_mapping(folio);
  1398			if (folio_test_dirty(folio)) {
  1399				if (folio_is_file_lru(folio)) {
  1400					/*
  1401					 * Immediately reclaim when written back.
  1402					 * Similar in principle to folio_deactivate()
  1403					 * except we already have the folio isolated
  1404					 * and know it's dirty
  1405					 */
  1406					node_stat_mod_folio(folio, NR_VMSCAN_IMMEDIATE,
  1407							nr_pages);
  1408					if (!folio_test_reclaim(folio))
  1409						folio_set_reclaim(folio);
  1410	
  1411					goto activate_locked;
  1412				}
  1413	
  1414				if (references == FOLIOREF_RECLAIM_CLEAN)
  1415					goto keep_locked;
  1416				if (!may_enter_fs(folio, sc->gfp_mask))
  1417					goto keep_locked;
  1418				if (!sc->may_writepage)
  1419					goto keep_locked;
  1420	
  1421				/*
  1422				 * Folio is dirty. Flush the TLB if a writable entry
  1423				 * potentially exists to avoid CPU writes after I/O
  1424				 * starts and then write it out here.
  1425				 */
  1426				try_to_unmap_flush_dirty();
  1427				switch (pageout(folio, mapping, &plug, folio_list)) {
  1428				case PAGE_KEEP:
  1429					goto keep_locked;
  1430				case PAGE_ACTIVATE:
  1431					/*
  1432					 * If shmem folio is split when writeback to swap,
  1433					 * the tail pages will make their own pass through
  1434					 * this function and be accounted then.
  1435					 */
  1436					if (nr_pages > 1 && !folio_test_large(folio)) {
  1437						sc->nr_scanned -= (nr_pages - 1);
  1438						nr_pages = 1;
  1439					}
  1440					goto activate_locked;
  1441				case PAGE_SUCCESS:
  1442					if (nr_pages > 1 && !folio_test_large(folio)) {
  1443						sc->nr_scanned -= (nr_pages - 1);
  1444						nr_pages = 1;
  1445					}
  1446					stat->nr_pageout += nr_pages;
  1447	
  1448					if (folio_test_writeback(folio))
  1449						goto keep;
  1450					if (folio_test_dirty(folio))
  1451						goto keep;
  1452	
  1453					/*
  1454					 * A synchronous write - probably a ramdisk.  Go
  1455					 * ahead and try to reclaim the folio.
  1456					 */
  1457					if (!folio_trylock(folio))
  1458						goto keep;
  1459					if (folio_test_dirty(folio) ||
  1460					    folio_test_writeback(folio))
  1461						goto keep_locked;
  1462					mapping = folio_mapping(folio);
  1463					fallthrough;
  1464				case PAGE_CLEAN:
  1465					; /* try to free the folio below */
  1466				}
  1467			}
  1468	
  1469			/*
  1470			 * If the folio has buffers, try to free the buffer
  1471			 * mappings associated with this folio. If we succeed
  1472			 * we try to free the folio as well.
  1473			 *
  1474			 * We do this even if the folio is dirty.
  1475			 * filemap_release_folio() does not perform I/O, but it
  1476			 * is possible for a folio to have the dirty flag set,
  1477			 * but it is actually clean (all its buffers are clean).
  1478			 * This happens if the buffers were written out directly,
  1479			 * with submit_bh(). ext3 will do this, as well as
  1480			 * the blockdev mapping.  filemap_release_folio() will
  1481			 * discover that cleanness and will drop the buffers
  1482			 * and mark the folio clean - it can be freed.
  1483			 *
  1484			 * Rarely, folios can have buffers and no ->mapping.
  1485			 * These are the folios which were not successfully
  1486			 * invalidated in truncate_cleanup_folio().  We try to
  1487			 * drop those buffers here and if that worked, and the
  1488			 * folio is no longer mapped into process address space
  1489			 * (refcount == 1) it can be freed.  Otherwise, leave
  1490			 * the folio on the LRU so it is swappable.
  1491			 */
  1492			if (folio_needs_release(folio)) {
  1493				if (!filemap_release_folio(folio, sc->gfp_mask))
  1494					goto activate_locked;
  1495				if (!mapping && folio_ref_count(folio) == 1) {
  1496					folio_unlock(folio);
  1497					if (folio_put_testzero(folio))
  1498						goto free_it;
  1499					else {
  1500						/*
  1501						 * rare race with speculative reference.
  1502						 * the speculative reference will free
  1503						 * this folio shortly, so we may
  1504						 * increment nr_reclaimed here (and
  1505						 * leave it off the LRU).
  1506						 */
  1507						nr_reclaimed += nr_pages;
  1508						continue;
  1509					}
  1510				}
  1511			}
  1512	
  1513			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
  1514				/* follow __remove_mapping for reference */
  1515				if (!folio_ref_freeze(folio, 1))
  1516					goto keep_locked;
  1517				/*
  1518				 * The folio has only one reference left, which is
  1519				 * from the isolation. After the caller puts the
  1520				 * folio back on the lru and drops the reference, the
  1521				 * folio will be freed anyway. It doesn't matter
  1522				 * which lru it goes on. So we don't bother checking
  1523				 * the dirty flag here.
  1524				 */
  1525				count_vm_events(PGLAZYFREED, nr_pages);
  1526				count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
  1527			} else if (!mapping || !__remove_mapping(mapping, folio, true,
  1528								 sc->target_mem_cgroup))
  1529				goto keep_locked;
  1530	
  1531			folio_unlock(folio);
  1532	free_it:
  1533			/*
  1534			 * Folio may get swapped out as a whole, need to account
  1535			 * all pages in it.
  1536			 */
  1537			nr_reclaimed += nr_pages;
  1538	
  1539			folio_unqueue_deferred_split(folio);
  1540			if (folio_batch_add(&free_folios, folio) == 0) {
  1541				mem_cgroup_uncharge_folios(&free_folios);
  1542				try_to_unmap_flush();
  1543				free_unref_folios(&free_folios);
  1544			}
  1545			continue;
  1546	
  1547	activate_locked_split:
  1548			/*
  1549			 * The tail pages that are failed to add into swap cache
  1550			 * reach here.  Fixup nr_scanned and nr_pages.
  1551			 */
  1552			if (nr_pages > 1) {
  1553				sc->nr_scanned -= (nr_pages - 1);
  1554				nr_pages = 1;
  1555			}
  1556	activate_locked:
  1557			/* Not a candidate for swapping, so reclaim swap space. */
  1558			if (folio_test_swapcache(folio) &&
  1559			    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
  1560				folio_free_swap(folio);
  1561			VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
  1562			if (!folio_test_mlocked(folio)) {
  1563				int type = folio_is_file_lru(folio);
  1564				folio_set_active(folio);
  1565				stat->nr_activate[type] += nr_pages;
  1566				count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
  1567			}
  1568	keep_locked:
  1569			folio_unlock(folio);
  1570	keep:
  1571			list_add(&folio->lru, &ret_folios);
  1572			VM_BUG_ON_FOLIO(folio_test_lru(folio) ||
  1573					folio_test_unevictable(folio), folio);
  1574		}
  1575		/* 'folio_list' is always empty here */
  1576	
  1577		/* Migrate folios selected for demotion */
  1578		nr_demoted = demote_folio_list(&demote_folios, pgdat, memcg);
  1579		nr_reclaimed += nr_demoted;
  1580		stat->nr_demoted += nr_demoted;
  1581		/* Folios that could not be demoted are still in @demote_folios */
  1582		if (!list_empty(&demote_folios)) {
  1583			/* Folios which weren't demoted go back on @folio_list */
  1584			list_splice_init(&demote_folios, folio_list);
  1585	
  1586			/*
  1587			 * goto retry to reclaim the undemoted folios in folio_list if
  1588			 * desired.
  1589			 *
  1590			 * Reclaiming directly from top tier nodes is not often desired
  1591			 * due to it breaking the LRU ordering: in general memory
  1592			 * should be reclaimed from lower tier nodes and demoted from
  1593			 * top tier nodes.
  1594			 *
  1595			 * However, disabling reclaim from top tier nodes entirely
  1596			 * would cause ooms in edge scenarios where lower tier memory
  1597			 * is unreclaimable for whatever reason, eg memory being
  1598			 * mlocked or too hot to reclaim. We can disable reclaim
  1599			 * from top tier nodes in proactive reclaim though as that is
  1600			 * not real memory pressure.
  1601			 */
  1602			if (!sc->proactive) {
  1603				do_demote_pass = false;
  1604				goto retry;
  1605			}
  1606		}
  1607	
  1608		pgactivate = stat->nr_activate[0] + stat->nr_activate[1];
  1609	
  1610		mem_cgroup_uncharge_folios(&free_folios);
  1611		try_to_unmap_flush();
  1612		free_unref_folios(&free_folios);
  1613	
  1614		list_splice(&ret_folios, folio_list);
  1615		count_vm_events(PGACTIVATE, pgactivate);
  1616	
  1617		if (plug)
  1618			swap_write_unplug(plug);
  1619		return nr_reclaimed;
  1620	}
  1621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
