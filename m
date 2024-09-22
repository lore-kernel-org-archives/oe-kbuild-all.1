Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E5E1448ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726968856; cv=none; b=lj2dQLKZiHOSr2WrZhoOFu+zpQgN8nC69tlYwyDT79Y64i3Eb9AWxzhxx9Ok91quEksoHPOVPiI22WVeIH4RR2Pqoti8q1RCgX4IYRaw4RhwTegJW57jEWj8QyPhB0S9Z21qLoq8AReobUNxLw9K+THERXsBmmM5zPQ6oiBd+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726968856; c=relaxed/simple;
	bh=1t5xIcukI4qL4vyR5p6N0ZSgrR4EhK5whyvbzHWCS8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvPTLQk2b55XRGWI7I/byNgqpaAhs2F6vBgPLXz6N57QIIkWo+4JXEhc+4SgQWAjybLYQLxmHqAKGaI6WJX7t3ia/d82/lnqWEKH6pB80SPQmoEZ665rv2r7SZOjWvsXzDoBbUJ9emTZSX93R4iOUok5PpE57OVb4V1IISA9Cgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdsfXKhe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdsfXKhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726968854; x=1758504854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1t5xIcukI4qL4vyR5p6N0ZSgrR4EhK5whyvbzHWCS8A=;
  b=AdsfXKhepoMYmByIe2jLqM1r9qy67i9dvO4YB0/ohOK6fH+M7ewnXJr/
   JYUCKPz4/9AZG/Vx3zns9rNtLUnFrNUXORDLCkz3xbE3lEM+/yUBpewpr
   DasnpEqePCOc+JEKBqYWdqKfgPPtU4Qwc42ClkyGx4kknlHK9FVP0H+XS
   aRe4lSZeKsuw7E5AW4dNKU3R7/1NeFrFsHs9TJytkGqI+ZPhUu2jptZoy
   PmHneD0zBd9dfnFnVBIb0QeLyZE3ppjKrHnCbCt7aUSIGHPsUhPgXdWYs
   JuxH8FHdD4WPqujnQHHpR9hjU2Kxyls0TfXHQWPHWXU3fErWpUs4PxPeL
   g==;
X-CSE-ConnectionGUID: emYcZgCKRdyHSFLxNnsMWA==
X-CSE-MsgGUID: lwr5bvxCToi/+qa1Z6mAkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37077093"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="37077093"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 18:34:13 -0700
X-CSE-ConnectionGUID: qUyzuO91SWyEVAjHwmOm1A==
X-CSE-MsgGUID: ICBcp2MaRP+2fLKHJGjR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="74809217"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Sep 2024 18:34:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssBUH-000FwI-1J;
	Sun, 22 Sep 2024 01:34:09 +0000
Date: Sun, 22 Sep 2024 09:33:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 340/448] arch/powerpc/kernel/eeh.c:1837:1:
 error: expected expression before 'int'
Message-ID: <202409220918.FCQrhhsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   4eb81ae46886ce90863b6f10c4fe8cd45c6719cf
commit: bf1829f8d5007f42a872c311913cd97fce830f7b [340/448] powerpc/kernel: convert to read/write iterators
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240922/202409220918.FCQrhhsp-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220918.FCQrhhsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220918.FCQrhhsp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/eeh.c:1837:1: error: expected expression before 'int'
    1837 | int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
         | ^~~
>> arch/powerpc/kernel/eeh.c:1837:1: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
   arch/powerpc/kernel/eeh.c:1837:1: note: (near initialization for 'eeh_dev_break_fops')
>> arch/powerpc/kernel/eeh.c:1832:37: warning: 'eeh_dev_break_fops' defined but not used [-Wunused-const-variable=]
    1832 | static const struct file_operations eeh_dev_break_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/eeh.c:1715:37: warning: 'eeh_dev_check_fops' defined but not used [-Wunused-const-variable=]
    1715 | static const struct file_operations eeh_dev_check_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
>> arch/powerpc/kernel/eeh.c:1677:37: warning: 'eeh_force_recover_fops' defined but not used [-Wunused-const-variable=]
    1677 | static const struct file_operations eeh_force_recover_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/kernel/eeh.c:24:
>> arch/powerpc/kernel/eeh.c:1625:26: warning: 'eeh_enable_dbgfs_ops' defined but not used [-Wunused-const-variable=]
    1625 | DEFINE_DEBUGFS_ATTRIBUTE(eeh_enable_dbgfs_ops, eeh_enable_dbgfs_get,
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/debugfs.h:54:37: note: in definition of macro 'DEFINE_DEBUGFS_ATTRIBUTE_XSIGNED'
      54 | static const struct file_operations __fops = {                          \
         |                                     ^~~~~~
   arch/powerpc/kernel/eeh.c:1625:1: note: in expansion of macro 'DEFINE_DEBUGFS_ATTRIBUTE'
    1625 | DEFINE_DEBUGFS_ATTRIBUTE(eeh_enable_dbgfs_ops, eeh_enable_dbgfs_get,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/eeh.c:1549:12: warning: 'proc_eeh_show' defined but not used [-Wunused-function]
    1549 | static int proc_eeh_show(struct seq_file *m, void *v)
         |            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/int +1837 arch/powerpc/kernel/eeh.c

954bd99435b8ba Oliver O'Halloran 2019-02-15  1676  
954bd99435b8ba Oliver O'Halloran 2019-02-15 @1677  static const struct file_operations eeh_force_recover_fops = {
954bd99435b8ba Oliver O'Halloran 2019-02-15  1678  	.open	= simple_open,
bf1829f8d5007f Jens Axboe        2024-04-11  1679  	.write_iter = eeh_force_recover_write,
954bd99435b8ba Oliver O'Halloran 2019-02-15  1680  };
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1681  
bf1829f8d5007f Jens Axboe        2024-04-11  1682  static ssize_t eeh_debugfs_dev_usage(struct kiocb *iocb, struct iov_iter *to)
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1683  {
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1684  	static const char usage[] = "input format: <domain>:<bus>:<dev>.<fn>\n";
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1685  
bf1829f8d5007f Jens Axboe        2024-04-11  1686  	return simple_copy_to_iter(usage, &iocb->ki_pos, sizeof(usage) - 1, to);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1687  }
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1688  
bf1829f8d5007f Jens Axboe        2024-04-11  1689  static ssize_t eeh_dev_check_write(struct kiocb *iocb, struct iov_iter *from)
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1690  {
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1691  	struct pci_dev *pdev;
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1692  	struct eeh_dev *edev;
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1693  	int ret;
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1694  
bf1829f8d5007f Jens Axboe        2024-04-11  1695  	pdev = eeh_debug_lookup_pdev(iocb, from);
b5e904b83067bb Oliver O'Halloran 2020-11-03  1696  	if (IS_ERR(pdev))
b5e904b83067bb Oliver O'Halloran 2020-11-03  1697  		return PTR_ERR(pdev);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1698  
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1699  	edev = pci_dev_to_eeh_dev(pdev);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1700  	if (!edev) {
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1701  		pci_err(pdev, "No eeh_dev for this device!\n");
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1702  		pci_dev_put(pdev);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1703  		return -ENODEV;
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1704  	}
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1705  
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1706  	ret = eeh_dev_check_failure(edev);
b5e904b83067bb Oliver O'Halloran 2020-11-03  1707  	pci_info(pdev, "eeh_dev_check_failure(%s) = %d\n",
b5e904b83067bb Oliver O'Halloran 2020-11-03  1708  			pci_name(pdev), ret);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1709  
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1710  	pci_dev_put(pdev);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1711  
bf1829f8d5007f Jens Axboe        2024-04-11  1712  	return iov_iter_count(from);
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1713  }
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1714  
22cda7c1680c1d Oliver O'Halloran 2019-09-03 @1715  static const struct file_operations eeh_dev_check_fops = {
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1716  	.open	= simple_open,
bf1829f8d5007f Jens Axboe        2024-04-11  1717  	.write_iter = eeh_dev_check_write,
bf1829f8d5007f Jens Axboe        2024-04-11  1718  	.read_iter = eeh_debugfs_dev_usage,
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1719  };
22cda7c1680c1d Oliver O'Halloran 2019-09-03  1720  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1721  static int eeh_debugfs_break_device(struct pci_dev *pdev)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1722  {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1723  	struct resource *bar = NULL;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1724  	void __iomem *mapped;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1725  	u16 old, bit;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1726  	int i, pos;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1727  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1728  	/* Do we have an MMIO BAR to disable? */
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1729  	for (i = 0; i <= PCI_STD_RESOURCE_END; i++) {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1730  		struct resource *r = &pdev->resource[i];
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1731  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1732  		if (!r->flags || !r->start)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1733  			continue;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1734  		if (r->flags & IORESOURCE_IO)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1735  			continue;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1736  		if (r->flags & IORESOURCE_UNSET)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1737  			continue;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1738  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1739  		bar = r;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1740  		break;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1741  	}
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1742  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1743  	if (!bar) {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1744  		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1745  		return -ENXIO;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1746  	}
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1747  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1748  	pci_err(pdev, "Going to break: %pR\n", bar);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1749  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1750  	if (pdev->is_virtfn) {
253c892193ab58 Oliver O'Halloran 2019-09-26  1751  #ifndef CONFIG_PCI_IOV
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1752  		return -ENXIO;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1753  #else
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1754  		/*
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1755  		 * VFs don't have a per-function COMMAND register, so the best
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1756  		 * we can do is clear the Memory Space Enable bit in the PF's
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1757  		 * SRIOV control reg.
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1758  		 *
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1759  		 * Unfortunately, this requires that we have a PF (i.e doesn't
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1760  		 * work for a passed-through VF) and it has the potential side
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1761  		 * effect of also causing an EEH on every other VF under the
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1762  		 * PF. Oh well.
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1763  		 */
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1764  		pdev = pdev->physfn;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1765  		if (!pdev)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1766  			return -ENXIO; /* passed through VFs have no PF */
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1767  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1768  		pos  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1769  		pos += PCI_SRIOV_CTRL;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1770  		bit  = PCI_SRIOV_CTRL_MSE;
253c892193ab58 Oliver O'Halloran 2019-09-26  1771  #endif /* !CONFIG_PCI_IOV */
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1772  	} else {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1773  		bit = PCI_COMMAND_MEMORY;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1774  		pos = PCI_COMMAND;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1775  	}
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1776  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1777  	/*
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1778  	 * Process here is:
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1779  	 *
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1780  	 * 1. Disable Memory space.
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1781  	 *
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1782  	 * 2. Perform an MMIO to the device. This should result in an error
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1783  	 *    (CA  / UR) being raised by the device which results in an EEH
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1784  	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1785  	 *    so the freeze hook so the EEH Detection machinery won't be
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1786  	 *    triggered here. This is to match the usual behaviour of EEH
1fd02f6605b855 Julia Lawall      2022-04-30  1787  	 *    where the HW will asynchronously freeze a PE and it's up to
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1788  	 *    the kernel to notice and deal with it.
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1789  	 *
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1790  	 * 3. Turn Memory space back on. This is more important for VFs
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1791  	 *    since recovery will probably fail if we don't. For normal
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1792  	 *    the COMMAND register is reset as a part of re-initialising
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1793  	 *    the device.
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1794  	 *
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1795  	 * Breaking stuff is the point so who cares if it's racy ;)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1796  	 */
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1797  	pci_read_config_word(pdev, pos, &old);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1798  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1799  	mapped = ioremap(bar->start, PAGE_SIZE);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1800  	if (!mapped) {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1801  		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1802  		return -ENXIO;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1803  	}
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1804  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1805  	pci_write_config_word(pdev, pos, old & ~bit);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1806  	in_8(mapped);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1807  	pci_write_config_word(pdev, pos, old);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1808  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1809  	iounmap(mapped);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1810  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1811  	return 0;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1812  }
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1813  
bf1829f8d5007f Jens Axboe        2024-04-11  1814  static ssize_t eeh_dev_break_write(struct kiocb *iocb, struct iov_iter *from)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1815  {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1816  	struct pci_dev *pdev;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1817  	int ret;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1818  
bf1829f8d5007f Jens Axboe        2024-04-11  1819  	pdev = eeh_debug_lookup_pdev(iocb, from);
b5e904b83067bb Oliver O'Halloran 2020-11-03  1820  	if (IS_ERR(pdev))
b5e904b83067bb Oliver O'Halloran 2020-11-03  1821  		return PTR_ERR(pdev);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1822  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1823  	ret = eeh_debugfs_break_device(pdev);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1824  	pci_dev_put(pdev);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1825  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1826  	if (ret < 0)
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1827  		return ret;
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1828  
bf1829f8d5007f Jens Axboe        2024-04-11  1829  	return iov_iter_count(from);
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1830  }
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1831  
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03 @1832  static const struct file_operations eeh_dev_break_fops = {
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1833  	.open	= simple_open,
bf1829f8d5007f Jens Axboe        2024-04-11  1834  	.write_iter = eeh_dev_break_write,
bf1829f8d5007f Jens Axboe        2024-04-11  1835  	.read_iter = eeh_debugfs_dev_usage,
bd6461cc7b3c4f Oliver O'Halloran 2019-09-03  1836  
b0e2b828dfca64 Narayana Murty N  2024-09-09 @1837  int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
b0e2b828dfca64 Narayana Murty N  2024-09-09  1838  {
b0e2b828dfca64 Narayana Murty N  2024-09-09  1839  	return eeh_debugfs_break_device(pdev);
b0e2b828dfca64 Narayana Murty N  2024-09-09  1840  }
b0e2b828dfca64 Narayana Murty N  2024-09-09  1841  

:::::: The code at line 1837 was first introduced by commit
:::::: b0e2b828dfca645a228f8c89d12fbc2baecfb7ea powerpc/pseries/eeh: Fix pseries_eeh_err_inject

:::::: TO: Narayana Murty N <nnmlinux@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
