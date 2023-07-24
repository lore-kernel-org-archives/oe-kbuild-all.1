Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619711188
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690233699; x=1721769699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Pl9JYGB9n0IbMKWWYW0SDr/ooXVj+vwqvGrjRQiyUg=;
  b=Nb/g4l76XINEfOoFZ8FWbu4Jojw5GdKeO5FsP+bT6M/sS5TsiB0JdtTZ
   0v9tyhBSPAeU6xv2HdQdmn31YTv49PhBEHyYFuAxU0QsBeRomUWvCj/si
   ZkV9mKMedKgUMhwuifodn58CGMFdMl9C41hHpoiGp+4AsQMMPS+3qR0/8
   kSS6A9ZfC1pkHTR/bxjOXoBRbgSC7w+mWLrbFzLdGjJj3KJQ5cESh6H54
   X+vt6vgppavw4DQ2+xB5WARDEQXsqQ5Da4JdTwmaIdhjh/rEE/XL83OnJ
   w/22ggWchgEGhQ1t/4bzppAWlkGXIQGDXvVFyKojdkj7Nr+RezMCq1qKZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347831256"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="347831256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 14:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719816803"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="719816803"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 14:21:37 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO2zn-000A2u-2j;
	Mon, 24 Jul 2023 21:21:35 +0000
Date: Tue, 25 Jul 2023 05:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 17/20] mm/filemap.c:1530:1: error:
 unsupported size for integer register
Message-ID: <202307250519.IFMGMV9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   3e76f43b5e4fb0d96f4f9d2e8ab10c73189a2d79
commit: 0f0627148bd1cd7d10d7f40a7dce680916453248 [17/20] mm: Add folio_end_read()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230725/202307250519.IFMGMV9a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250519.IFMGMV9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250519.IFMGMV9a-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/filemap.c: In function 'folio_end_read':
>> mm/filemap.c:1530:1: error: unsupported size for integer register
    1530 | }
         | ^


vim +1530 mm/filemap.c

  1502	
  1503	/**
  1504	 * folio_end_read - End read on a folio.
  1505	 * @folio: The folio.
  1506	 * @success: True if all reads completed successfully.
  1507	 *
  1508	 * When all reads against a folio have completed, filesystems should
  1509	 * call this function to let the pagecache know that no more reads
  1510	 * are outstanding.  This will unlock the folio and wake up any thread
  1511	 * sleeping on the lock.  The folio will also be marked uptodate if all
  1512	 * reads succeeded.
  1513	 *
  1514	 * Context: May be called from interrupt or process context.  May not be
  1515	 * called from NMI context.
  1516	 */
  1517	void folio_end_read(struct folio *folio, bool success)
  1518	{
  1519		unsigned long mask = 1 << PG_locked;
  1520	
  1521		/* Must be in bottom byte for x86 to work */
  1522		BUILD_BUG_ON(PG_uptodate > 7);
  1523		VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
  1524		VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
  1525	
  1526		if (success)
  1527			mask |= 1 << PG_uptodate;
  1528		if (folio_xor_flags_has_waiters(folio, mask))
  1529			folio_wake_bit(folio, PG_locked);
> 1530	}
  1531	EXPORT_SYMBOL(folio_end_read);
  1532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
