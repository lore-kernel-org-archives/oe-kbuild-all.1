Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF414E2DF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712842776; cv=none; b=mdcV1U22PFcdNF4wL1U7VfedSUrywdmEb+elQVqPgbxtsrf/HcXl9GIVoCixK4lC+EShSWp4wHVAbt8fan6Z/XzTZqz2je9wfSXYFnQHy9Rt2fyPnP12kNyEUgzS/lnFcHpwaeDIu1TdfzTBAJkMfSid7tDrgdtjw1ppY2Ht+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712842776; c=relaxed/simple;
	bh=Eb0PshIN7yN77QJD88FWYfzcEZWo5s4Byld0D8xMIWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=faj1BvzIUzVgFKeaEQPrkPyYyblPOfac18K9AR8fGDvXlrUUFJ4wCbeDAn6ME77kIYkrl4P/L4d7wjvREf6tTbOjcjlBcesFMR+F2uolFSQfjAxztG5bALCj3lXFZJs5hOlRzccVywPjzcBCCpa6Z8wH9mH3VMzNz4/ANMfGP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPpHUuch; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPpHUuch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712842774; x=1744378774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eb0PshIN7yN77QJD88FWYfzcEZWo5s4Byld0D8xMIWo=;
  b=mPpHUucheBRXHYjBkDwIdTFtNn4rgE8R1dVdfqdSCbQ6HyKNbDI1OWnu
   5VrWYE0OVfDNMwQFJ1IyKfFEOshfPMG7Z/+iqh/IJWpmGBFt4olfLx0hz
   NJ3JxNSa+vpGAm10jUd5/nu/6NtcHjBzLXIv5q0x1olysA22eTWSRggrf
   lNXGwyyqYs/MwYPkH0RWt/1kbcVhhtT3vr+QPYQOeJN5qth2GIkkSzXPi
   NCxa4Ecn0bNZTvxBDUbMbH3lZBe1FaqsyMGs45OexsrZB6UlBLsYcPglj
   8BKgMI8UzE1f6qasi4gbx+BZ5h6paelm30PjIOMhR8nA0CJz3ZnLqSN5T
   Q==;
X-CSE-ConnectionGUID: OzQLyCL4S3WoHBRM2a94BQ==
X-CSE-MsgGUID: TsdTn1s/Sbm6TfzchnBgJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25763373"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25763373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:39:33 -0700
X-CSE-ConnectionGUID: gZ2P+/yXQvymHGV0wLJGiQ==
X-CSE-MsgGUID: ASlV58xARz2C3U/8j15Bnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21489736"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2024 06:39:32 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruueH-0008f9-3B;
	Thu, 11 Apr 2024 13:39:29 +0000
Date: Thu, 11 Apr 2024 21:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 320/415] arch/powerpc/kernel/eeh.c:1648:42:
 warning: passing argument 2 of 'simple_copy_from_iter' makes pointer from
 integer without a cast
Message-ID: <202404112124.5wfSEuZx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 52abe881eae0de6596cb23c29af0a6040c34aa76 [320/415] arch/powerpc: convert to read/write iterators
config: powerpc64-randconfig-002-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112124.5wfSEuZx-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112124.5wfSEuZx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112124.5wfSEuZx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/kernel/eeh.c: In function 'eeh_force_recover_write':
>> arch/powerpc/kernel/eeh.c:1648:42: warning: passing argument 2 of 'simple_copy_from_iter' makes pointer from integer without a cast [-Wint-conversion]
    1648 |         ret = simple_copy_from_iter(buf, sizeof(buf), &iocb->ki_pos, from);
         |                                          ^~~~~~~~~~~
         |                                          |
         |                                          long unsigned int
   In file included from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1114,
                    from arch/powerpc/include/asm/io.h:24,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from arch/powerpc/kernel/eeh.c:15:
   include/linux/fs.h:3361:49: note: expected 'loff_t *' {aka 'long long int *'} but argument is of type 'long unsigned int'
    3361 | ssize_t simple_copy_from_iter(void *to, loff_t *ppos, size_t count,
         |                                         ~~~~~~~~^~~~
>> arch/powerpc/kernel/eeh.c:1648:55: warning: passing argument 3 of 'simple_copy_from_iter' makes integer from pointer without a cast [-Wint-conversion]
    1648 |         ret = simple_copy_from_iter(buf, sizeof(buf), &iocb->ki_pos, from);
         |                                                       ^~~~~~~~~~~~~
         |                                                       |
         |                                                       loff_t * {aka long long int *}
   include/linux/fs.h:3361:62: note: expected 'size_t' {aka 'long unsigned int'} but argument is of type 'loff_t *' {aka 'long long int *'}
    3361 | ssize_t simple_copy_from_iter(void *to, loff_t *ppos, size_t count,
         |                                                       ~~~~~~~^~~~~


vim +/simple_copy_from_iter +1648 arch/powerpc/kernel/eeh.c

  1635	
  1636	DEFINE_DEBUGFS_ATTRIBUTE(eeh_enable_dbgfs_ops, eeh_enable_dbgfs_get,
  1637				 eeh_enable_dbgfs_set, "0x%llx\n");
  1638	
  1639	static ssize_t eeh_force_recover_write(struct kiocb *iocb, struct iov_iter *from)
  1640	{
  1641		size_t count = iov_iter_count(from);
  1642		struct pci_controller *hose;
  1643		uint32_t phbid, pe_no;
  1644		struct eeh_pe *pe;
  1645		char buf[20];
  1646		int ret;
  1647	
> 1648		ret = simple_copy_from_iter(buf, sizeof(buf), &iocb->ki_pos, from);
  1649		if (!ret)
  1650			return -EFAULT;
  1651	
  1652		/*
  1653		 * When PE is NULL the event is a "special" event. Rather than
  1654		 * recovering a specific PE it forces the EEH core to scan for failed
  1655		 * PHBs and recovers each. This needs to be done before any device
  1656		 * recoveries can occur.
  1657		 */
  1658		if (!strncmp(buf, "hwcheck", 7)) {
  1659			__eeh_send_failure_event(NULL);
  1660			return count;
  1661		}
  1662	
  1663		ret = sscanf(buf, "%x:%x", &phbid, &pe_no);
  1664		if (ret != 2)
  1665			return -EINVAL;
  1666	
  1667		hose = pci_find_controller_for_domain(phbid);
  1668		if (!hose)
  1669			return -ENODEV;
  1670	
  1671		/* Retrieve PE */
  1672		pe = eeh_pe_get(hose, pe_no);
  1673		if (!pe)
  1674			return -ENODEV;
  1675	
  1676		/*
  1677		 * We don't do any state checking here since the detection
  1678		 * process is async to the recovery process. The recovery
  1679		 * thread *should* not break even if we schedule a recovery
  1680		 * from an odd state (e.g. PE removed, or recovery of a
  1681		 * non-isolated PE)
  1682		 */
  1683		__eeh_send_failure_event(pe);
  1684	
  1685		return ret < 0 ? ret : count;
  1686	}
  1687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
