Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377BA22EF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 04:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753158487; cv=none; b=oaOL8Z81IpqzHeMfZwwF7X6uPHQUgNTvY1N9lv8ndtE55TsAIiwjlL83WvLAew9A+yPS1wzqlD8bQsO5+ROKQ5P2kSyEu1zAI5FZucX2nLbsSuHBidDffKWmTR14AYS2zacXX5UErMu6TAakCmrD5CvOjq1Q4sw74RMmrMGqen4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753158487; c=relaxed/simple;
	bh=WtjTkIm0BXtoaa0/ymcsoQN3VIiUP7UbVkcKo5Sp4cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sm785Iylbpip5wN4NoQ1RXNaRzK5y45oYrMACcW+Kt2wJyH7V969r4KlbW3yz9A+OExNkyLHGt7AjTx35YVJYtZ3VrZk6nI37qGW/9017+dS63APXwy8UmFuSAowTrVJT/D8eqCtMTrAV/+zhAj3aLqJZ/j/T3uuCKMcTgS+0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cpz2tHBJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cpz2tHBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753158486; x=1784694486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtjTkIm0BXtoaa0/ymcsoQN3VIiUP7UbVkcKo5Sp4cM=;
  b=Cpz2tHBJF7Q/PGNJ40nBwi+o+x5qaYNOtzPFHw/i2J2wGj+/fmjkUcUf
   BidjK0VXaRMSDQevOMsFGrFSl1jT+EJrA1pWxIEaxcnryQ0fqh8jnJRNo
   GDjc5nXv9Mv8sgW6FHykAfN7gGC+GRTy155sGJIhxq7HfHm60/cgKM/lx
   Lm7HAL2qZLGv21/aVWUOVwyLklis8ibtWDqKgIGQ3j2P6IfdpLk2Aohr5
   gyz+DVnHFyYSk66fc5oE8Tevcm/HD9LTb/njKTlKnhik2nTBvMN+KwCaS
   jTLWphyUFSU0PsPXdCFSwBbOqOYDdJdsK9rSzIzEIpZ7jsBP2c+NhcQbH
   w==;
X-CSE-ConnectionGUID: ZEUpuiP3RU6tr0r5GXKMUQ==
X-CSE-MsgGUID: HmIUhHQyRheHphJjo7ZXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59188205"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="59188205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 21:28:05 -0700
X-CSE-ConnectionGUID: 2wJAgDEQRnW6Ar38v3PynQ==
X-CSE-MsgGUID: NRjQ/D0uQI2u4LFqi+FEuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="189970647"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2025 21:28:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue4bh-000HRd-1U;
	Tue, 22 Jul 2025 04:28:01 +0000
Date: Tue, 22 Jul 2025 12:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/migrate.c:1539:5: warning: no
 previous prototype for 'migrate_pages_batch'
Message-ID: <202507221247.Wup4rkB7-lkp@intel.com>
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
head:   98170019bf7a4069eb0c41aba1bad66e55c20835
commit: ac79f033ce6b175a45cdce5a554f1fc1719602a3 [9/9] migrate_pages: restrict number of pages to migrate in batch
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250722/202507221247.Wup4rkB7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221247.Wup4rkB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221247.Wup4rkB7-lkp@intel.com/

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
