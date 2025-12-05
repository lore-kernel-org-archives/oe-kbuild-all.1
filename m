Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087A1314A7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764938879; cv=none; b=ein4tJZw9VX+kR6nf3IKdoHpZT2tQijA/CS9+Dlpx/JyCTBP0gPBpKFNMMQk76U6DnODvDXtOctNbjjxC8kohrR3Ta1Ra0aM+H4UW7qY0y0ocbjQIRBDUcue6Me7V1kygA9f+uR7H0Q/LPyWvgjU2b5oEFWgzTAWfUep2vvO6pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764938879; c=relaxed/simple;
	bh=z2xlSN6OUcBX5G9Oiunc+0cYyUsL9fvz3niWChWx80E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OpIR+d+WWahefyXwjT54gudXf17FfmEM+LJA8VWg7JpLRMmUa8bM9Y1yHPQ4AigrOBNoEdRzrmtkdR7J2XVAuCfm3PaULH3GAcX06u+BnpTma46ePfYX4n/pzEqvQR+bP5Oe4lLeA/2rbyW3Qby5YHDwMk4NPug34Te0i/1AY0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDzP+xrX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDzP+xrX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764938872; x=1796474872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2xlSN6OUcBX5G9Oiunc+0cYyUsL9fvz3niWChWx80E=;
  b=NDzP+xrXgSNM4haU2ke9uPZYGh+/Gm3dqklwx8n/HOzkMHnLiCEMNPoR
   DNJX0Kyz8QODwOYEDSXcza5ThNB5XLP/tXt57EoEBSI4l4PsotEbnT83O
   ZF+WTOt9pq0jshmwSWze29/lsBI1tvR/DOoVVv323aUmn1SCJJC0NgKgv
   nyZcGoTBFbV3Wf6s6b0lfs1TLDy666QZlVwmxSemFf75+jBmE2hkIk+Tt
   ELoqhEejv5Kznv+B5+ggxQ8b+xBw3NkQslgKNd2oiTe3Mb8sTBXhLrxo6
   NQcppqa/LTsI62eZspEsWEqo2y4cAqiPofo7uAgMGGKXjdGnrPhyWcDsL
   A==;
X-CSE-ConnectionGUID: SYvRHQy5QE2cGGoxk0k2IA==
X-CSE-MsgGUID: +Q0zxpFhTZmBFerFgBxPEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77295786"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="77295786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 04:47:48 -0800
X-CSE-ConnectionGUID: PbCTSdYfRBe+iPWZVM7IPw==
X-CSE-MsgGUID: JWbugLFhQIaaXF/VbxNzLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="196081600"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Dec 2025 04:47:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRVDs-00000000EzN-3K6c;
	Fri, 05 Dec 2025 12:47:44 +0000
Date: Fri, 5 Dec 2025 20:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/migrate.c:1539:5: warning: no
 previous prototype for function 'migrate_pages_batch'
Message-ID: <202512052059.xrEUGaKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31b356d59497695e1135b4c6ea07b6d0bd148e07
commit: ac79f033ce6b175a45cdce5a554f1fc1719602a3 [2/2] migrate_pages: restrict number of pages to migrate in batch
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251205/202512052059.xrEUGaKq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052059.xrEUGaKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052059.xrEUGaKq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:1539:5: warning: no previous prototype for function 'migrate_pages_batch' [-Wmissing-prototypes]
    1539 | int migrate_pages_batch(struct list_head *from, new_page_t get_new_page,
         |     ^
   mm/migrate.c:1539:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1539 | int migrate_pages_batch(struct list_head *from, new_page_t get_new_page,
         | ^
         | static 
   mm/migrate.c:2956:16: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
    2956 |         unsigned long addr, i, restore = 0;
         |                       ^
   2 warnings generated.


vim +/migrate_pages_batch +1539 mm/migrate.c

  1538	
> 1539	int migrate_pages_batch(struct list_head *from, new_page_t get_new_page,
  1540			free_page_t put_new_page, unsigned long private,
  1541			enum migrate_mode mode, int reason, struct list_head *ret_pages,
  1542			struct migrate_pages_stats *stats)
  1543	{
  1544		int retry = 1;
  1545		int thp_retry = 1;
  1546		int nr_failed = 0;
  1547		int nr_retry_pages = 0;
  1548		int pass = 0;
  1549		bool is_thp = false;
  1550		struct page *page, *page2;
  1551		int rc, nr_pages;
  1552		LIST_HEAD(thp_split_pages);
  1553		bool nosplit = (reason == MR_NUMA_MISPLACED);
  1554		bool no_subpage_counting = false;
  1555	
  1556	thp_subpage_migration:
  1557		for (pass = 0;
  1558		     pass < NR_MAX_MIGRATE_PAGES_RETRY && (retry || thp_retry);
  1559		     pass++) {
  1560			retry = 0;
  1561			thp_retry = 0;
  1562			nr_retry_pages = 0;
  1563	
  1564			list_for_each_entry_safe(page, page2, from, lru) {
  1565				/*
  1566				 * THP statistics is based on the source huge page.
  1567				 * Capture required information that might get lost
  1568				 * during migration.
  1569				 */
  1570				is_thp = PageTransHuge(page) && !PageHuge(page);
  1571				nr_pages = compound_nr(page);
  1572				cond_resched();
  1573	
  1574				rc = unmap_and_move(get_new_page, put_new_page,
  1575						    private, page, pass > 2, mode,
  1576						    reason, ret_pages);
  1577				/*
  1578				 * The rules are:
  1579				 *	Success: page will be freed
  1580				 *	-EAGAIN: stay on the from list
  1581				 *	-ENOMEM: stay on the from list
  1582				 *	-ENOSYS: stay on the from list
  1583				 *	Other errno: put on ret_pages list
  1584				 */
  1585				switch(rc) {
  1586				/*
  1587				 * THP migration might be unsupported or the
  1588				 * allocation could've failed so we should
  1589				 * retry on the same page with the THP split
  1590				 * to base pages.
  1591				 *
  1592				 * Sub-pages are put in thp_split_pages, and
  1593				 * we will migrate them after the rest of the
  1594				 * list is processed.
  1595				 */
  1596				case -ENOSYS:
  1597					/* THP migration is unsupported */
  1598					if (is_thp) {
  1599						stats->nr_thp_failed++;
  1600						if (!try_split_thp(page, &thp_split_pages)) {
  1601							stats->nr_thp_split++;
  1602							break;
  1603						}
  1604					/* Hugetlb migration is unsupported */
  1605					} else if (!no_subpage_counting) {
  1606						nr_failed++;
  1607					}
  1608	
  1609					stats->nr_failed_pages += nr_pages;
  1610					list_move_tail(&page->lru, ret_pages);
  1611					break;
  1612				case -ENOMEM:
  1613					/*
  1614					 * When memory is low, don't bother to try to migrate
  1615					 * other pages, just exit.
  1616					 */
  1617					if (is_thp) {
  1618						stats->nr_thp_failed++;
  1619						/* THP NUMA faulting doesn't split THP to retry. */
  1620						if (!nosplit && !try_split_thp(page, &thp_split_pages)) {
  1621							stats->nr_thp_split++;
  1622							break;
  1623						}
  1624					} else if (!no_subpage_counting) {
  1625						nr_failed++;
  1626					}
  1627	
  1628					stats->nr_failed_pages += nr_pages + nr_retry_pages;
  1629					/*
  1630					 * There might be some subpages of fail-to-migrate THPs
  1631					 * left in thp_split_pages list. Move them back to migration
  1632					 * list so that they could be put back to the right list by
  1633					 * the caller otherwise the page refcnt will be leaked.
  1634					 */
  1635					list_splice_init(&thp_split_pages, ret_pages);
  1636					/* nr_failed isn't updated for not used */
  1637					stats->nr_thp_failed += thp_retry;
  1638					goto out;
  1639				case -EAGAIN:
  1640					if (is_thp)
  1641						thp_retry++;
  1642					else if (!no_subpage_counting)
  1643						retry++;
  1644					nr_retry_pages += nr_pages;
  1645					break;
  1646				case MIGRATEPAGE_SUCCESS:
  1647					stats->nr_succeeded += nr_pages;
  1648					if (is_thp)
  1649						stats->nr_thp_succeeded++;
  1650					break;
  1651				default:
  1652					/*
  1653					 * Permanent failure (-EBUSY, etc.):
  1654					 * unlike -EAGAIN case, the failed page is
  1655					 * removed from migration page list and not
  1656					 * retried in the next outer loop.
  1657					 */
  1658					if (is_thp)
  1659						stats->nr_thp_failed++;
  1660					else if (!no_subpage_counting)
  1661						nr_failed++;
  1662	
  1663					stats->nr_failed_pages += nr_pages;
  1664					break;
  1665				}
  1666			}
  1667		}
  1668		nr_failed += retry;
  1669		stats->nr_thp_failed += thp_retry;
  1670		stats->nr_failed_pages += nr_retry_pages;
  1671		/*
  1672		 * Try to migrate subpages of fail-to-migrate THPs, no nr_failed
  1673		 * counting in this round, since all subpages of a THP is counted
  1674		 * as 1 failure in the first round.
  1675		 */
  1676		if (!list_empty(&thp_split_pages)) {
  1677			/*
  1678			 * Move non-migrated pages (after NR_MAX_MIGRATE_PAGES_RETRY
  1679			 * retries) to ret_pages to avoid migrating them again.
  1680			 */
  1681			list_splice_init(from, ret_pages);
  1682			list_splice_init(&thp_split_pages, from);
  1683			no_subpage_counting = true;
  1684			retry = 1;
  1685			goto thp_subpage_migration;
  1686		}
  1687	
  1688		rc = nr_failed + stats->nr_thp_failed;
  1689	out:
  1690		return rc;
  1691	}
  1692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
