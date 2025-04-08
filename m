Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1E1CAA7D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744082721; cv=none; b=gwgHlvqAjikHLn1fEmpcLYM7Jbb81eVMRD7Pa3agXB+qTFj4Qu5fnLXsZk2fb/PZ4y3vORoFPIkfa9/jP20eL6F7nbdxmoJzm6qypJDE5wY3MNHMZpXtEXKKgqnEDNnILlliFef+9//GiXTBIgBoJqKWrm1V8ajjbwR7hPHMalQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744082721; c=relaxed/simple;
	bh=vrhEo7p3+IDrSOvnNQ4Ac49PQW0nZmPc7lqTl+p+zUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpMU5ouXr9DP8rX07Awme0aOg+vmuitIqLUMx2Yqh+CWcaWYaNoGdxMKZbA418yYZDLD2l62sdZHe1XdeGY1ab2JJ3PrCQsLsZZLmJbWYAxYXYmoSxCwjaWoeW92WVuoq7PA5ss+axZmfWoLkonCkRHs21XeAjtcnyj6pdD9oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqKHs3Ql; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqKHs3Ql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744082719; x=1775618719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrhEo7p3+IDrSOvnNQ4Ac49PQW0nZmPc7lqTl+p+zUo=;
  b=AqKHs3Qlc5bLrgaklPKyypUHgRN9EP6Ud4w/E1r+hf31JmgQLb4Hyo+U
   U7T9PnR+P+pWSjzAnxQLhqecp7WTn0fYryo7zJKNZebqz6SYyLohk7xfF
   kjVSXG6B8bn6m5bRYTXBmrZJG5uZyo8LkMGSniY8FtT8bFumrCKaUvYyB
   sEz5ZKoSYgFW4TxtjO87e0VSBC3PjinYGUYwdUNxoFI8nkhxWESFJfomL
   JSXf1XS6KSI6cyMRkQGEOfUsFJAptTh1HIeVnQA7hHmZjMbOnhzEXc4At
   8TWuupAdST4HL2X9xP9mD12ck/Nsg2pIseC6cNmofqw27sseUOQF8O8ng
   w==;
X-CSE-ConnectionGUID: 5tfvXdv9SOSPRUOmulLXqA==
X-CSE-MsgGUID: hL4/ed+pRfieW4kmbWggWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44745365"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="44745365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:25:18 -0700
X-CSE-ConnectionGUID: qkb8BIh7QaSLEFAbtkZPrQ==
X-CSE-MsgGUID: pNOz4xdoTL2oH175q2Y2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128472225"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2025 20:25:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1zaM-00044R-25;
	Tue, 08 Apr 2025 03:25:14 +0000
Date: Tue, 8 Apr 2025 11:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/migrate.c:1539:5: warning: no
 previous prototype for 'migrate_pages_batch'
Message-ID: <202504081143.k5CCOimv-lkp@intel.com>
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
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: ac79f033ce6b175a45cdce5a554f1fc1719602a3 [9/9] migrate_pages: restrict number of pages to migrate in batch
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250408/202504081143.k5CCOimv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081143.k5CCOimv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081143.k5CCOimv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:1539:5: warning: no previous prototype for 'migrate_pages_batch' [-Wmissing-prototypes]
    1539 | int migrate_pages_batch(struct list_head *from, new_page_t get_new_page,
         |     ^~~~~~~~~~~~~~~~~~~


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
