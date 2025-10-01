Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7031547CC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Oct 2025 03:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759288694; cv=none; b=StJrOTD63Wbyfq8QrOtFfT5lJhbb882e7z1rEdHB9DGXoU3RiWBzYQb/m64z15dnJFRtpmXJWghKHu4Cl7fscU4btwQ/4ptgqdy7LUF4vR51rQ/tfUGzu+RBqMvhwuVulZfIgpaJ4i43X15df9Nv6JlO4CeWWl0DAtSiiNaWOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759288694; c=relaxed/simple;
	bh=z87O7UI1sLlJwbEPsZ7tbs1nE4bCDBsgwBJkoB3nFjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQY8NSJ2NxdBMpLd3Zp4c3XRBvEiBI9oUVH2tZ5alCKAuv3dpNOy+WIBhCOg+Tx8FWLOmnX/4lmwFLig59Q+5E74x6J7UHlTvordKzYk3HtG12nVSC9l0PUR7IzVPtOgPXxFXBNjAdvUr5AWG1gBDO9ezNpmERBxdZ9nOK599rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4v0GwOn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4v0GwOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759288692; x=1790824692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z87O7UI1sLlJwbEPsZ7tbs1nE4bCDBsgwBJkoB3nFjo=;
  b=N4v0GwOnageB9c2jYI1J0o+y+qUJNvEumi9A0sWw/4wwpeZLpuRbCCnm
   FNmW3ZcCN19WOV/gXBqebW7r2JzIrui/4G8fDAJ3clarbBxjs9/nKnZIo
   JI6EP3VXY5Gz/oWdzD7OEXi+GudjA8jItH6bJdjzCuefegag/mFJoy9AR
   P/C2NTNpiaOqy3Qq8HiToXaxRX5Prq3GRAMGb50eNdFjKGlM165fy+b4i
   cl5ODnZZ7hrsGLAYFPcYeNiP5pBuAdIMvDYI1/b6CDV1dohkMUXHMr0gD
   N0urALkV6IfV0E0GKtk6Q0coiNAMWzC5aL7jQ4Ayb926aopJFwaTKnnDR
   A==;
X-CSE-ConnectionGUID: g90ehQRMTDSORRFuuxczGQ==
X-CSE-MsgGUID: ktiv7Jm8QsiXGer70as2ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60770127"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="60770127"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 20:18:11 -0700
X-CSE-ConnectionGUID: 9uVJMRjQS1CwyVpDlPx9ag==
X-CSE-MsgGUID: q+P4Voa2RHaggmZyR+Y2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; 
   d="scan'208";a="178276754"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2025 20:18:10 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3nLz-0002fn-34;
	Wed, 01 Oct 2025 03:18:07 +0000
Date: Wed, 1 Oct 2025 11:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/migrate.c:1539:5: warning: no
 previous prototype for function 'migrate_pages_batch'
Message-ID: <202510011148.cTfndznq-lkp@intel.com>
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
head:   6e46858a22077fce652e4757d5624bf5816c6639
commit: ac79f033ce6b175a45cdce5a554f1fc1719602a3 [2/2] migrate_pages: restrict number of pages to migrate in batch
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251001/202510011148.cTfndznq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011148.cTfndznq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011148.cTfndznq-lkp@intel.com/

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
