Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8321079B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707544931; cv=none; b=oP05tE2xBwtZKJfkqYKgcAgzlMQx06dBtXs52MQNHJomSrb64sydqK4K8jQ1ZVXad2w5Nzglk9zrkmDbglOGPbw+SX3jn8zzLmDWt2HTAIGhfEZEd04WZ3pq+5zN1Zr1eQ9Ua6mniBkGu1dE+iv9SNAZYVFzDsBRlrZ7NVhGbGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707544931; c=relaxed/simple;
	bh=gRI1P+qivEJr0GTzKtVj7RKaG+s1zC6I8i5SOJbjy7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=booLhbtvxQezv0KOlnUcd5HObg9Kfyfs6x92ee3/h+3DcwpqecZpzjA2CeKyAUf26u3TxmwO2OgGzA66PxM+4eWNJAVLL/fISFHXpLyw6byMdKFZMdnH/nDWDGivFyztC3u47h1vGr/beRGYFbYH7AgSagRINQIbVfTkXs4fQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWpTqe0M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWpTqe0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707544929; x=1739080929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRI1P+qivEJr0GTzKtVj7RKaG+s1zC6I8i5SOJbjy7A=;
  b=TWpTqe0MciLs7+AlmC2JScxE0DlJB/7FUKmOonePdxJoHvi8N3R8qJNA
   pNXEOxcjQ+woCLMeKZCnwq+7IsVyti5un01Aoq9OOej5z2oILMFWCG8Oo
   tgwZmLSTfmcjwCDVKCECHxW57QotSwaq2HDxhsL2zHN1IRKtjTWuzTVTW
   MscVufokVt5mG4xCbwSW2rH7dtOlqeM1Jo55Rx4+uYrXfgvf5nZfrhiqD
   weW8IXN5ZGOgqLfNPbrfFODYSqYvYVbd6JpNkzIara+T+nJxZQ/izwNf1
   1Z9XGK36a03ZrqpLFsxOuAXFkHW+QncseUbzJc/+MqC5LRhfOKTJNr4zy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1686939"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1686939"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 22:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2330689"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2024 22:02:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYgR8-0005Nw-1F;
	Sat, 10 Feb 2024 06:02:02 +0000
Date: Sat, 10 Feb 2024 14:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lokesh Gidra <lokeshgidra@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 289/292] mm/userfaultfd.c:1526: warning: Excess
 function parameter 'mm' description in 'move_pages'
Message-ID: <202402101302.UF7G8Rr8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   191d97734e41a5c9f90a2f6636fdd335ae1d435d
commit: 2812c4c704e875ed9047a756641ba10c032f6c9c [289/292] userfaultfd: use per-vma locks in userfaultfd operations
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240210/202402101302.UF7G8Rr8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101302.UF7G8Rr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101302.UF7G8Rr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/userfaultfd.c:1526: warning: Excess function parameter 'mm' description in 'move_pages'


vim +1526 mm/userfaultfd.c

adef440691bab8 Andrea Arcangeli 2023-12-06  1448  
adef440691bab8 Andrea Arcangeli 2023-12-06  1449  /**
adef440691bab8 Andrea Arcangeli 2023-12-06  1450   * move_pages - move arbitrary anonymous pages of an existing vma
adef440691bab8 Andrea Arcangeli 2023-12-06  1451   * @ctx: pointer to the userfaultfd context
adef440691bab8 Andrea Arcangeli 2023-12-06  1452   * @mm: the address space to move pages
adef440691bab8 Andrea Arcangeli 2023-12-06  1453   * @dst_start: start of the destination virtual memory range
adef440691bab8 Andrea Arcangeli 2023-12-06  1454   * @src_start: start of the source virtual memory range
adef440691bab8 Andrea Arcangeli 2023-12-06  1455   * @len: length of the virtual memory range
adef440691bab8 Andrea Arcangeli 2023-12-06  1456   * @mode: flags from uffdio_move.mode
adef440691bab8 Andrea Arcangeli 2023-12-06  1457   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1458   * move_pages() remaps arbitrary anonymous pages atomically in zero
adef440691bab8 Andrea Arcangeli 2023-12-06  1459   * copy. It only works on non shared anonymous pages because those can
adef440691bab8 Andrea Arcangeli 2023-12-06  1460   * be relocated without generating non linear anon_vmas in the rmap
adef440691bab8 Andrea Arcangeli 2023-12-06  1461   * code.
adef440691bab8 Andrea Arcangeli 2023-12-06  1462   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1463   * It provides a zero copy mechanism to handle userspace page faults.
adef440691bab8 Andrea Arcangeli 2023-12-06  1464   * The source vma pages should have mapcount == 1, which can be
adef440691bab8 Andrea Arcangeli 2023-12-06  1465   * enforced by using madvise(MADV_DONTFORK) on src vma.
adef440691bab8 Andrea Arcangeli 2023-12-06  1466   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1467   * The thread receiving the page during the userland page fault
adef440691bab8 Andrea Arcangeli 2023-12-06  1468   * will receive the faulting page in the source vma through the network,
adef440691bab8 Andrea Arcangeli 2023-12-06  1469   * storage or any other I/O device (MADV_DONTFORK in the source vma
adef440691bab8 Andrea Arcangeli 2023-12-06  1470   * avoids move_pages() to fail with -EBUSY if the process forks before
adef440691bab8 Andrea Arcangeli 2023-12-06  1471   * move_pages() is called), then it will call move_pages() to map the
adef440691bab8 Andrea Arcangeli 2023-12-06  1472   * page in the faulting address in the destination vma.
adef440691bab8 Andrea Arcangeli 2023-12-06  1473   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1474   * This userfaultfd command works purely via pagetables, so it's the
adef440691bab8 Andrea Arcangeli 2023-12-06  1475   * most efficient way to move physical non shared anonymous pages
adef440691bab8 Andrea Arcangeli 2023-12-06  1476   * across different virtual addresses. Unlike mremap()/mmap()/munmap()
adef440691bab8 Andrea Arcangeli 2023-12-06  1477   * it does not create any new vmas. The mapping in the destination
adef440691bab8 Andrea Arcangeli 2023-12-06  1478   * address is atomic.
adef440691bab8 Andrea Arcangeli 2023-12-06  1479   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1480   * It only works if the vma protection bits are identical from the
adef440691bab8 Andrea Arcangeli 2023-12-06  1481   * source and destination vma.
adef440691bab8 Andrea Arcangeli 2023-12-06  1482   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1483   * It can remap non shared anonymous pages within the same vma too.
adef440691bab8 Andrea Arcangeli 2023-12-06  1484   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1485   * If the source virtual memory range has any unmapped holes, or if
adef440691bab8 Andrea Arcangeli 2023-12-06  1486   * the destination virtual memory range is not a whole unmapped hole,
adef440691bab8 Andrea Arcangeli 2023-12-06  1487   * move_pages() will fail respectively with -ENOENT or -EEXIST. This
adef440691bab8 Andrea Arcangeli 2023-12-06  1488   * provides a very strict behavior to avoid any chance of memory
adef440691bab8 Andrea Arcangeli 2023-12-06  1489   * corruption going unnoticed if there are userland race conditions.
adef440691bab8 Andrea Arcangeli 2023-12-06  1490   * Only one thread should resolve the userland page fault at any given
adef440691bab8 Andrea Arcangeli 2023-12-06  1491   * time for any given faulting address. This means that if two threads
adef440691bab8 Andrea Arcangeli 2023-12-06  1492   * try to both call move_pages() on the same destination address at the
adef440691bab8 Andrea Arcangeli 2023-12-06  1493   * same time, the second thread will get an explicit error from this
adef440691bab8 Andrea Arcangeli 2023-12-06  1494   * command.
adef440691bab8 Andrea Arcangeli 2023-12-06  1495   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1496   * The command retval will return "len" is successful. The command
adef440691bab8 Andrea Arcangeli 2023-12-06  1497   * however can be interrupted by fatal signals or errors. If
adef440691bab8 Andrea Arcangeli 2023-12-06  1498   * interrupted it will return the number of bytes successfully
adef440691bab8 Andrea Arcangeli 2023-12-06  1499   * remapped before the interruption if any, or the negative error if
adef440691bab8 Andrea Arcangeli 2023-12-06  1500   * none. It will never return zero. Either it will return an error or
adef440691bab8 Andrea Arcangeli 2023-12-06  1501   * an amount of bytes successfully moved. If the retval reports a
adef440691bab8 Andrea Arcangeli 2023-12-06  1502   * "short" remap, the move_pages() command should be repeated by
adef440691bab8 Andrea Arcangeli 2023-12-06  1503   * userland with src+retval, dst+reval, len-retval if it wants to know
adef440691bab8 Andrea Arcangeli 2023-12-06  1504   * about the error that interrupted it.
adef440691bab8 Andrea Arcangeli 2023-12-06  1505   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1506   * The UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES flag can be specified to
adef440691bab8 Andrea Arcangeli 2023-12-06  1507   * prevent -ENOENT errors to materialize if there are holes in the
adef440691bab8 Andrea Arcangeli 2023-12-06  1508   * source virtual range that is being remapped. The holes will be
adef440691bab8 Andrea Arcangeli 2023-12-06  1509   * accounted as successfully remapped in the retval of the
adef440691bab8 Andrea Arcangeli 2023-12-06  1510   * command. This is mostly useful to remap hugepage naturally aligned
adef440691bab8 Andrea Arcangeli 2023-12-06  1511   * virtual regions without knowing if there are transparent hugepage
adef440691bab8 Andrea Arcangeli 2023-12-06  1512   * in the regions or not, but preventing the risk of having to split
adef440691bab8 Andrea Arcangeli 2023-12-06  1513   * the hugepmd during the remap.
adef440691bab8 Andrea Arcangeli 2023-12-06  1514   *
adef440691bab8 Andrea Arcangeli 2023-12-06  1515   * If there's any rmap walk that is taking the anon_vma locks without
adef440691bab8 Andrea Arcangeli 2023-12-06  1516   * first obtaining the folio lock (the only current instance is
adef440691bab8 Andrea Arcangeli 2023-12-06  1517   * folio_referenced), they will have to verify if the folio->mapping
adef440691bab8 Andrea Arcangeli 2023-12-06  1518   * has changed after taking the anon_vma lock. If it changed they
adef440691bab8 Andrea Arcangeli 2023-12-06  1519   * should release the lock and retry obtaining a new anon_vma, because
adef440691bab8 Andrea Arcangeli 2023-12-06  1520   * it means the anon_vma was changed by move_pages() before the lock
adef440691bab8 Andrea Arcangeli 2023-12-06  1521   * could be obtained. This is the only additional complexity added to
adef440691bab8 Andrea Arcangeli 2023-12-06  1522   * the rmap code to provide this anonymous page remapping functionality.
adef440691bab8 Andrea Arcangeli 2023-12-06  1523   */
2812c4c704e875 Lokesh Gidra     2024-02-08  1524  ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
2812c4c704e875 Lokesh Gidra     2024-02-08  1525  		   unsigned long src_start, unsigned long len, __u64 mode)
adef440691bab8 Andrea Arcangeli 2023-12-06 @1526  {
2812c4c704e875 Lokesh Gidra     2024-02-08  1527  	struct mm_struct *mm = ctx->mm;
adef440691bab8 Andrea Arcangeli 2023-12-06  1528  	struct vm_area_struct *src_vma, *dst_vma;
adef440691bab8 Andrea Arcangeli 2023-12-06  1529  	unsigned long src_addr, dst_addr;
adef440691bab8 Andrea Arcangeli 2023-12-06  1530  	pmd_t *src_pmd, *dst_pmd;
adef440691bab8 Andrea Arcangeli 2023-12-06  1531  	long err = -EINVAL;
adef440691bab8 Andrea Arcangeli 2023-12-06  1532  	ssize_t moved = 0;
adef440691bab8 Andrea Arcangeli 2023-12-06  1533  
adef440691bab8 Andrea Arcangeli 2023-12-06  1534  	/* Sanitize the command parameters. */
adef440691bab8 Andrea Arcangeli 2023-12-06  1535  	if (WARN_ON_ONCE(src_start & ~PAGE_MASK) ||
adef440691bab8 Andrea Arcangeli 2023-12-06  1536  	    WARN_ON_ONCE(dst_start & ~PAGE_MASK) ||
adef440691bab8 Andrea Arcangeli 2023-12-06  1537  	    WARN_ON_ONCE(len & ~PAGE_MASK))
adef440691bab8 Andrea Arcangeli 2023-12-06  1538  		goto out;
adef440691bab8 Andrea Arcangeli 2023-12-06  1539  
adef440691bab8 Andrea Arcangeli 2023-12-06  1540  	/* Does the address range wrap, or is the span zero-sized? */
adef440691bab8 Andrea Arcangeli 2023-12-06  1541  	if (WARN_ON_ONCE(src_start + len <= src_start) ||
adef440691bab8 Andrea Arcangeli 2023-12-06  1542  	    WARN_ON_ONCE(dst_start + len <= dst_start))
adef440691bab8 Andrea Arcangeli 2023-12-06  1543  		goto out;
adef440691bab8 Andrea Arcangeli 2023-12-06  1544  

:::::: The code at line 1526 was first introduced by commit
:::::: adef440691bab824e39c1b17382322d195e1fab0 userfaultfd: UFFDIO_MOVE uABI

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
