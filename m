Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D16B1E5702
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781809; cv=none; b=i+ZnNSO/T/d8kbKZ+ZKFvyeQekyzUteYDlJF2xaeCXdlDDNrPIRIARY0M8clm7hbHqNFZzwlTyzsJIOXNnjlie4hW3iSG5XyDRnB5aLsGhbu3Vw3gcIALmRk+FopF4Vtj2S9dB0RZ5w2NG/SB5VR5CD9J0ESv0E/rghBBXLeQig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781809; c=relaxed/simple;
	bh=PJodrQOpE5/a/5sX2bVmxpbxhWuXcwe7z5HNMAG80cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETKmNwQKf2z9DFo+HHdGYl7e9SKkQbzNUKLauYl445e30AIUcaalW2jhuXwgKl7KTO63KizxXzRKbK4qCR81YPEvuH2sI8l+hF9A/tye6oxWj/VHfyFmGE3upRkfRmBwvCzkuFAFRxMB2cjTtV91HA1RmOjyZhPgqdOMV0rG9oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GcfrbbL6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GcfrbbL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747781806; x=1779317806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJodrQOpE5/a/5sX2bVmxpbxhWuXcwe7z5HNMAG80cM=;
  b=GcfrbbL6J3GnykTltDDdJAsCW1VGvo26O0UKMWkziIqHHmJ0PxFVg4QY
   prg5DKwYqcpy9JEuenIbOcnoHVo2F42W1D8HWcale5YkFWfUFA/ApVAwF
   +mTg/djAEZfNHsKtMjey0GhCv0sshz3QmNksP2XXfceG6HnvfPBALy5UG
   o1LS4DKOWwse1QKmwMuxDZc4C9eD5xOPDZ5WsR4OQ/8o7Nh45gMg1Twqc
   vCJsEaMUjRSh39ePFiTA0ydKLo/jViKCqmRVdOOqZoiRCAZwrHDeXkxql
   AHF8KAlG51+STvrutFzsjwBmo0IlVWbWt5wn4HYIMccCsY6YCjGE+tw7f
   A==;
X-CSE-ConnectionGUID: hrbI0owGSE2Tcj6R5GR0Zw==
X-CSE-MsgGUID: xNjdzqQLSYqtE4+uk7GCbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49722388"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49722388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 15:56:44 -0700
X-CSE-ConnectionGUID: PO8qrmmPTXGapA02Yc+16Q==
X-CSE-MsgGUID: lAVSJM9fRtSgsyy6FI/B7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="176980000"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2025 15:56:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHVt3-000NeW-0t;
	Tue, 20 May 2025 22:56:41 +0000
Date: Wed, 21 May 2025 06:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/5] mm/madvise: add PMADV_SET_FORK_EXEC_DEFAULT
 process_madvise() flag
Message-ID: <202505210606.4l09LWrJ-lkp@intel.com>
References: <617413860ff194dfb1afedb175b2d84a457e449d.1747686021.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <617413860ff194dfb1afedb175b2d84a457e449d.1747686021.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on next-20250516]
[cannot apply to linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-madvise-refactor-madvise_populate/20250520-045528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/617413860ff194dfb1afedb175b2d84a457e449d.1747686021.git.lorenzo.stoakes%40oracle.com
patch subject: [RFC PATCH 4/5] mm/madvise: add PMADV_SET_FORK_EXEC_DEFAULT process_madvise() flag
config: parisc-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210606.4l09LWrJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210606.4l09LWrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210606.4l09LWrJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'madvise_populate':
   mm/madvise.c:969:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
     969 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c:969:48: note: each undeclared identifier is reported only once for each function it appears in
   mm/madvise.c: In function 'madvise_vma_behavior':
   mm/madvise.c:1374:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1374 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'madvise_inject_error':
   mm/madvise.c:1393:48: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1393 |         bool can_skip = madv_behavior->flags & PMADV_SKIP_ERRORS;
         |                                                ^~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'madvise_do_behavior':
   mm/madvise.c:1755:57: error: 'PMADV_NO_ERROR_ON_UNMAPPED' undeclared (first use in this function)
    1755 |         bool err_on_unmapped = !(madv_behavior->flags & PMADV_NO_ERROR_ON_UNMAPPED);
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'vector_madvise':
   mm/madvise.c:1918:33: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1918 |         bool can_skip = flags & PMADV_SKIP_ERRORS;
         |                                 ^~~~~~~~~~~~~~~~~
>> mm/madvise.c:1919:36: error: 'PMADV_SET_FORK_EXEC_DEFAULT' undeclared (first use in this function)
    1919 |         bool set_default = flags & PMADV_SET_FORK_EXEC_DEFAULT;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/madvise.c: In function 'check_process_madvise_flags':
   mm/madvise.c:1994:29: error: 'PMADV_SKIP_ERRORS' undeclared (first use in this function)
    1994 |         unsigned int mask = PMADV_SKIP_ERRORS | PMADV_NO_ERROR_ON_UNMAPPED |
         |                             ^~~~~~~~~~~~~~~~~
   mm/madvise.c:1994:49: error: 'PMADV_NO_ERROR_ON_UNMAPPED' undeclared (first use in this function)
    1994 |         unsigned int mask = PMADV_SKIP_ERRORS | PMADV_NO_ERROR_ON_UNMAPPED |
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/madvise.c:1995:17: error: 'PMADV_SET_FORK_EXEC_DEFAULT' undeclared (first use in this function)
    1995 |                 PMADV_SET_FORK_EXEC_DEFAULT;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/PMADV_SET_FORK_EXEC_DEFAULT +1919 mm/madvise.c

  1746	
  1747	static int madvise_do_behavior(struct mm_struct *mm,
  1748			unsigned long start, size_t len_in,
  1749			struct madvise_behavior *madv_behavior)
  1750	{
  1751		int behavior = madv_behavior->behavior;
  1752		struct blk_plug plug;
  1753		unsigned long end;
  1754		int error;
> 1755		bool err_on_unmapped = !(madv_behavior->flags & PMADV_NO_ERROR_ON_UNMAPPED);
  1756	
  1757		if (is_memory_failure(behavior))
  1758			return madvise_inject_error(madv_behavior, start,
  1759						    start + len_in);
  1760		start = untagged_addr_remote(mm, start);
  1761		end = start + PAGE_ALIGN(len_in);
  1762	
  1763		blk_start_plug(&plug);
  1764		if (is_madvise_populate(behavior))
  1765			error = madvise_populate(mm, start, end, madv_behavior);
  1766		else
  1767			error = madvise_walk_vmas(mm, start, end, err_on_unmapped,
  1768						  madv_behavior, madvise_vma_behavior);
  1769		blk_finish_plug(&plug);
  1770		return error;
  1771	}
  1772	
  1773	/*
  1774	 * The madvise(2) system call.
  1775	 *
  1776	 * Applications can use madvise() to advise the kernel how it should
  1777	 * handle paging I/O in this VM area.  The idea is to help the kernel
  1778	 * use appropriate read-ahead and caching techniques.  The information
  1779	 * provided is advisory only, and can be safely disregarded by the
  1780	 * kernel without affecting the correct operation of the application.
  1781	 *
  1782	 * behavior values:
  1783	 *  MADV_NORMAL - the default behavior is to read clusters.  This
  1784	 *		results in some read-ahead and read-behind.
  1785	 *  MADV_RANDOM - the system should read the minimum amount of data
  1786	 *		on any access, since it is unlikely that the appli-
  1787	 *		cation will need more than what it asks for.
  1788	 *  MADV_SEQUENTIAL - pages in the given range will probably be accessed
  1789	 *		once, so they can be aggressively read ahead, and
  1790	 *		can be freed soon after they are accessed.
  1791	 *  MADV_WILLNEED - the application is notifying the system to read
  1792	 *		some pages ahead.
  1793	 *  MADV_DONTNEED - the application is finished with the given range,
  1794	 *		so the kernel can free resources associated with it.
  1795	 *  MADV_FREE - the application marks pages in the given range as lazy free,
  1796	 *		where actual purges are postponed until memory pressure happens.
  1797	 *  MADV_REMOVE - the application wants to free up the given range of
  1798	 *		pages and associated backing store.
  1799	 *  MADV_DONTFORK - omit this area from child's address space when forking:
  1800	 *		typically, to avoid COWing pages pinned by get_user_pages().
  1801	 *  MADV_DOFORK - cancel MADV_DONTFORK: no longer omit this area when forking.
  1802	 *  MADV_WIPEONFORK - present the child process with zero-filled memory in this
  1803	 *              range after a fork.
  1804	 *  MADV_KEEPONFORK - undo the effect of MADV_WIPEONFORK
  1805	 *  MADV_HWPOISON - trigger memory error handler as if the given memory range
  1806	 *		were corrupted by unrecoverable hardware memory failure.
  1807	 *  MADV_SOFT_OFFLINE - try to soft-offline the given range of memory.
  1808	 *  MADV_MERGEABLE - the application recommends that KSM try to merge pages in
  1809	 *		this area with pages of identical content from other such areas.
  1810	 *  MADV_UNMERGEABLE- cancel MADV_MERGEABLE: no longer merge pages with others.
  1811	 *  MADV_HUGEPAGE - the application wants to back the given range by transparent
  1812	 *		huge pages in the future. Existing pages might be coalesced and
  1813	 *		new pages might be allocated as THP.
  1814	 *  MADV_NOHUGEPAGE - mark the given range as not worth being backed by
  1815	 *		transparent huge pages so the existing pages will not be
  1816	 *		coalesced into THP and new pages will not be allocated as THP.
  1817	 *  MADV_COLLAPSE - synchronously coalesce pages into new THP.
  1818	 *  MADV_DONTDUMP - the application wants to prevent pages in the given range
  1819	 *		from being included in its core dump.
  1820	 *  MADV_DODUMP - cancel MADV_DONTDUMP: no longer exclude from core dump.
  1821	 *  MADV_COLD - the application is not expected to use this memory soon,
  1822	 *		deactivate pages in this range so that they can be reclaimed
  1823	 *		easily if memory pressure happens.
  1824	 *  MADV_PAGEOUT - the application is not expected to use this memory soon,
  1825	 *		page out the pages in this range immediately.
  1826	 *  MADV_POPULATE_READ - populate (prefault) page tables readable by
  1827	 *		triggering read faults if required
  1828	 *  MADV_POPULATE_WRITE - populate (prefault) page tables writable by
  1829	 *		triggering write faults if required
  1830	 *
  1831	 * return values:
  1832	 *  zero    - success
  1833	 *  -EINVAL - start + len < 0, start is not page-aligned,
  1834	 *		"behavior" is not a valid value, or application
  1835	 *		is attempting to release locked or shared pages,
  1836	 *		or the specified address range includes file, Huge TLB,
  1837	 *		MAP_SHARED or VMPFNMAP range.
  1838	 *  -ENOMEM - addresses in the specified range are not currently
  1839	 *		mapped, or are outside the AS of the process.
  1840	 *  -EIO    - an I/O error occurred while paging in data.
  1841	 *  -EBADF  - map exists, but area maps something that isn't a file.
  1842	 *  -EAGAIN - a kernel resource was temporarily unavailable.
  1843	 *  -EPERM  - memory is sealed.
  1844	 */
  1845	int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int behavior)
  1846	{
  1847		int error;
  1848		struct mmu_gather tlb;
  1849		struct madvise_behavior madv_behavior = {
  1850			.behavior = behavior,
  1851			.tlb = &tlb,
  1852		};
  1853	
  1854		if (madvise_should_skip(start, len_in, behavior, &error))
  1855			return error;
  1856		error = madvise_lock(mm, behavior);
  1857		if (error)
  1858			return error;
  1859		madvise_init_tlb(&madv_behavior, mm);
  1860		error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
  1861		madvise_finish_tlb(&madv_behavior);
  1862		madvise_unlock(mm, behavior);
  1863	
  1864		return error;
  1865	}
  1866	
  1867	SYSCALL_DEFINE3(madvise, unsigned long, start, size_t, len_in, int, behavior)
  1868	{
  1869		return do_madvise(current->mm, start, len_in, behavior);
  1870	}
  1871	
  1872	/*
  1873	 * Are we permitted to set an madvise() behavior by default across the virtual
  1874	 * address space, surviving fork/exec?
  1875	 */
  1876	static bool can_set_default_behavior(int behavior)
  1877	{
  1878		switch (behavior) {
  1879	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  1880		case MADV_HUGEPAGE:
  1881		case MADV_NOHUGEPAGE:
  1882			return true;
  1883	#endif
  1884		default:
  1885			return false;
  1886		}
  1887	}
  1888	
  1889	static void set_default_behavior(struct mm_struct *mm, int behavior)
  1890	{
  1891		switch (behavior) {
  1892		case MADV_HUGEPAGE:
  1893			mm->def_flags &= ~VM_NOHUGEPAGE;
  1894			mm->def_flags |= VM_HUGEPAGE;
  1895			break;
  1896		case MADV_NOHUGEPAGE:
  1897			mm->def_flags &= ~VM_HUGEPAGE;
  1898			mm->def_flags |= VM_NOHUGEPAGE;
  1899			break;
  1900		default:
  1901			WARN_ON(1);
  1902			break;
  1903		}
  1904	}
  1905	
  1906	/* Perform an madvise operation over a vector of addresses and lengths. */
  1907	static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
  1908				      int behavior, int flags)
  1909	{
  1910		ssize_t ret = 0;
  1911		size_t total_len;
  1912		struct mmu_gather tlb;
  1913		struct madvise_behavior madv_behavior = {
  1914			.behavior = behavior,
  1915			.tlb = &tlb,
  1916			.flags = flags,
  1917		};
  1918		bool can_skip = flags & PMADV_SKIP_ERRORS;
> 1919		bool set_default = flags & PMADV_SET_FORK_EXEC_DEFAULT;
  1920		size_t skipped = 0;
  1921	
  1922		if (set_default && !can_set_default_behavior(behavior))
  1923			return -EINVAL;
  1924	
  1925		total_len = iov_iter_count(iter);
  1926	
  1927		ret = madvise_lock(mm, behavior);
  1928		if (ret)
  1929			return ret;
  1930		madvise_init_tlb(&madv_behavior, mm);
  1931	
  1932		while (iov_iter_count(iter)) {
  1933			unsigned long start = (unsigned long)iter_iov_addr(iter);
  1934			size_t len_in = iter_iov_len(iter);
  1935			int error;
  1936	
  1937			if (madvise_should_skip(start, len_in, behavior, &error))
  1938				ret = error;
  1939			else
  1940				ret = madvise_do_behavior(mm, start, len_in,
  1941						&madv_behavior);
  1942			/*
  1943			 * An madvise operation is attempting to restart the syscall,
  1944			 * but we cannot proceed as it would not be correct to repeat
  1945			 * the operation in aggregate, and would be surprising to the
  1946			 * user.
  1947			 *
  1948			 * We drop and reacquire locks so it is safe to just loop and
  1949			 * try again. We check for fatal signals in case we need exit
  1950			 * early anyway.
  1951			 */
  1952			if (ret == -ERESTARTNOINTR) {
  1953				if (fatal_signal_pending(current)) {
  1954					ret = -EINTR;
  1955					break;
  1956				}
  1957	
  1958				/* Drop and reacquire lock to unwind race. */
  1959				madvise_finish_tlb(&madv_behavior);
  1960				madvise_unlock(mm, behavior);
  1961				madvise_lock(mm, behavior);
  1962				madvise_init_tlb(&madv_behavior, mm);
  1963				continue;
  1964			}
  1965			if (ret < 0 && !can_skip)
  1966				break;
  1967	
  1968			/* All skip cases will return 0. */
  1969			if (can_skip && madv_behavior.saw_error) {
  1970				skipped++;
  1971				madv_behavior.saw_error = false;
  1972			} else if (set_default) {
  1973				set_default_behavior(mm, behavior);
  1974			}
  1975	
  1976			iov_iter_advance(iter, iter_iov_len(iter));
  1977		}
  1978		madvise_finish_tlb(&madv_behavior);
  1979		madvise_unlock(mm, behavior);
  1980	
  1981		/*
  1982		 * Since we ignore errors in this case, simply report the number of
  1983		 * entries in the iovec which were totally successful.
  1984		 */
  1985		if (can_skip)
  1986			return total_len - skipped;
  1987	
  1988		ret = (total_len - iov_iter_count(iter)) ? : ret;
  1989		return ret;
  1990	}
  1991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
