Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1322E18636
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120785; x=1726656785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HbFb1sKowCtknrvidfm9Oh3r+xu/8WHNML90TxyJaCc=;
  b=gr8zp0GRV+J1Y9E6npxzIuDi0e5LmvkIb1W3K1/bNT6RvMM+yrrTpeBM
   QdsyQ/c/+SC/NnH+Sh7sS3k4u+s8WwT1nlGRQQIfsSQ724TrE1qIDPai1
   Atu+aI0KoySNNbSYfaXNcEJU3FY0KOZ1RcsyvzdWVHbXHac2YR1KujFCf
   L1XJOOhuASAsXM5MGUGM8R3+YDSe4123V1MhvyIFZcLMq6YtPOMPHebz7
   JDuIU7x0xKfWw+hWXFA57vFMvS437x7NansA6KG5q8oxv8Rsbd7sGhl1U
   cFTpm29r7LmGMePZJwI9ePq7mvzTrRFIibqtTsRgEh5ERGudcukdTFUUJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="443994296"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="443994296"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 03:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775505247"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="775505247"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Sep 2023 03:53:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiYLk-0007Es-3C;
	Tue, 19 Sep 2023 10:53:00 +0000
Date: Tue, 19 Sep 2023 18:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5187/6333] arch/alpha/include/asm/string.h:22:16:
 warning: '__builtin_memcpy' offset [0, 2] is out of the bounds [0, 0]
Message-ID: <202309191804.VDlimbHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: 0e2bdaccb10a440a7a451343e8347d29a874b58e [5187/6333] Bluetooth: hci_core: Fix build warnings
config: alpha-randconfig-r011-20220512 (https://download.01.org/0day-ci/archive/20230919/202309191804.VDlimbHj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191804.VDlimbHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191804.VDlimbHj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/poll.h:8,
                    from include/net/bluetooth/bluetooth.h:29,
                    from net/bluetooth/hci_event.c:30:
   In function 'hci_cc_read_class_of_dev',
       inlined from 'hci_cc_read_class_of_dev' at net/bluetooth/hci_event.c:511:11:
>> arch/alpha/include/asm/string.h:22:16: warning: '__builtin_memcpy' offset [0, 2] is out of the bounds [0, 0] [-Warray-bounds]
      22 | #define memcpy __builtin_memcpy
   net/bluetooth/hci_event.c:521:9: note: in expansion of macro 'memcpy'
     521 |         memcpy(hdev->dev_class, rp->dev_class, 3);
         |         ^~~~~~


vim +/__builtin_memcpy +22 arch/alpha/include/asm/string.h

^1da177e4c3f41 include/asm-alpha/string.h Linus Torvalds 2005-04-16  21  
^1da177e4c3f41 include/asm-alpha/string.h Linus Torvalds 2005-04-16 @22  #define memcpy __builtin_memcpy
^1da177e4c3f41 include/asm-alpha/string.h Linus Torvalds 2005-04-16  23  

:::::: The code at line 22 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
