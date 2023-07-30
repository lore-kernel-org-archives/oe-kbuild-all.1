Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7970810
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690705121; x=1722241121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aIx+GNa+gKcpWPhERigtzlxNoXVezamSXRV0BO6kDPw=;
  b=LJqlVdbNAr06w8nHlpjTM7izJTkdC5ihxb+j0w5Lgb/PDKbufo4Gnazt
   VVLIRFMx4d3pkLwwBH5bMhZrvw6rQZpARj/n1kp+RE8Wi5ddgoOQnWivE
   Xjk1RTQ8GnwSo97yUBLLw5dUF9ae9J9AW+kpYxDMSb0FYS2nt1qZrPBEN
   E3pEoCm8rKe1maB47VJcFbH/i0r31H1UM4gTzL6JS/ZSZ9My5wSrc/ZA4
   cP0FGjEbdM99qI9LGlTIimaNUrzWZiTzHIPxsx3F1FO6piA4o24d7sgIk
   Rn7PPARR20V0a4vNtZvzmuINjiosGv5+WCRct2nTRhB1VuDn94V1GtcdW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348429514"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="348429514"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 01:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="677973943"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="677973943"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Jul 2023 01:18:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ1dO-0004Vv-2m;
	Sun, 30 Jul 2023 08:18:38 +0000
Date: Sun, 30 Jul 2023 16:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 13/20] mm/filemap.c:1537:1: error:
 unsupported size for integer register
Message-ID: <202307301600.Ub2MGFzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   774f053908406ce7cd979599d901df9481fd49b7
commit: 2e98846023463db3283a27bf9be74f08df47700f [13/20] mm: Add folio_xor_flags_has_waiters()
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230730/202307301600.Ub2MGFzp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301600.Ub2MGFzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301600.Ub2MGFzp-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/filemap.c: In function 'folio_end_read':
>> mm/filemap.c:1537:1: error: unsupported size for integer register
    1537 | }
         | ^


vim +1537 mm/filemap.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1509  
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1510) /**
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1511)  * folio_end_read - End read on a folio.
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1512)  * @folio: The folio.
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1513)  * @success: True if all reads completed successfully.
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1514)  *
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1515)  * When all reads against a folio have completed, filesystems should
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1516)  * call this function to let the pagecache know that no more reads
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1517)  * are outstanding.  This will unlock the folio and wake up any thread
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1518)  * sleeping on the lock.  The folio will also be marked uptodate if all
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1519)  * reads succeeded.
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1520)  *
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1521)  * Context: May be called from interrupt or process context.  May not be
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1522)  * called from NMI context.
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1523)  */
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1524) void folio_end_read(struct folio *folio, bool success)
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1525) {
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1526) 	unsigned long mask = 1 << PG_locked;
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1527) 
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1528) 	/* Must be in bottom byte for x86 to work */
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1529) 	BUILD_BUG_ON(PG_uptodate > 7);
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1530) 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1531) 	VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1532) 
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1533) 	if (success)
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1534) 		mask |= 1 << PG_uptodate;
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1535) 	if (folio_xor_flags_has_waiters(folio, mask))
2e98846023463d Matthew Wilcox (Oracle  2023-07-18  1536) 		folio_wake_bit(folio, PG_locked);
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29 @1537) }
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1538) EXPORT_SYMBOL(folio_end_read);
ccb471088f1c90 Matthew Wilcox (Oracle  2023-07-29  1539) 

:::::: The code at line 1537 was first introduced by commit
:::::: ccb471088f1c901c7ac0a6f497353aa785cc2c59 mm: Add folio_end_read()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
