Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747DF505
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696340355; x=1727876355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3d1MLq266/R9YwYsqx83Hkdi/O/k5L+d39LmgvIbUZo=;
  b=Edk4Im8N/o7pnQXQCYC2qZPm/XpsPJUY2sQeEGlijf8X1Vf3wUf3ZLH3
   ubAwQmjcW500WhIs0EgQaiGGDITeuKQWZ+of997VcCBZDal7OH3Moq18I
   6RpplRiDGwuPBIKlRWebkODIaTCL66chx02mCARVUF85qi42W2xvdhYMu
   cEaqAwovCga31Pabv3DR1HDyrAEYDCxASUwF2+RRBgB1ZMxD9UDvQlkcf
   WHOyTr8A5rqaRibH1JesKHmor7efV43QiSYYkKsl7miml3Ungj/NJQR7/
   lFTh2ROn+h7LUF15P/XHKHkjQzLl4OVW6pGfr4GQr6f5PCI0JQniKQtsb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="447033719"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="447033719"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 06:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="998038585"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="998038585"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2023 06:39:13 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnfcE-00079m-2H;
	Tue, 03 Oct 2023 13:39:10 +0000
Date: Tue, 3 Oct 2023 21:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Lee, Chun-Yi" <jlee@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 9226/9381]
 include/net/bluetooth/bluetooth.h:364:16: warning: 'memcmp' specified bound
 6 exceeds source size 0
Message-ID: <202310032158.OvfQjd58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c9f2baaa18b5ea8f006a2b3a616da9597c71d15e
commit: d70e44fef8621aeae895e1cbc62059df9e31836b [9226/9381] Bluetooth: Reject connection with the device which has same BD_ADDR
config: arm64-randconfig-r002-20230421 (https://download.01.org/0day-ci/archive/20231003/202310032158.OvfQjd58-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310032158.OvfQjd58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310032158.OvfQjd58-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/bluetooth/hci_event.c: In function 'hci_cc_read_class_of_dev':
   net/bluetooth/hci_event.c:522:9: warning: 'memcpy' writing 3 bytes into a region of size 0 overflows the destination [-Wstringop-overflow=]
     522 |         memcpy(hdev->dev_class, rp->dev_class, 3);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: note: destination object is likely at address zero
   In file included from net/bluetooth/hci_event.c:30:
   In function 'bacmp',
       inlined from 'hci_conn_request_evt' at net/bluetooth/hci_event.c:3274:7:
>> include/net/bluetooth/bluetooth.h:364:16: warning: 'memcmp' specified bound 6 exceeds source size 0 [-Wstringop-overread]
     364 |         return memcmp(ba1, ba2, sizeof(bdaddr_t));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcmp +364 include/net/bluetooth/bluetooth.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  360  
^1da177e4c3f41 Linus Torvalds   2005-04-16  361  /* Copy, swap, convert BD Address */
f53c20e93612f7 David Rheinsberg 2013-04-06  362  static inline int bacmp(const bdaddr_t *ba1, const bdaddr_t *ba2)
^1da177e4c3f41 Linus Torvalds   2005-04-16  363  {
^1da177e4c3f41 Linus Torvalds   2005-04-16 @364  	return memcmp(ba1, ba2, sizeof(bdaddr_t));
^1da177e4c3f41 Linus Torvalds   2005-04-16  365  }
f53c20e93612f7 David Rheinsberg 2013-04-06  366  static inline void bacpy(bdaddr_t *dst, const bdaddr_t *src)
^1da177e4c3f41 Linus Torvalds   2005-04-16  367  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  368  	memcpy(dst, src, sizeof(bdaddr_t));
^1da177e4c3f41 Linus Torvalds   2005-04-16  369  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  370  

:::::: The code at line 364 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
