Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3331844
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 04:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695356570; x=1726892570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJox61dMYPxGJ1qARpjwejWaV8zokEi23zMB4ALsIYc=;
  b=IYyTZ28LSfk19GOM4uDl/AM6tCVysY8I/iungiPap/OS1Oeug+a7CEjx
   enGXTqtV2dC9nG49zG6L7OFs+frudMUry2HCQ3nzrDfg++Zwo4/5KBIB3
   +FqSQiTGu73PWYxZ45K67bu4QsRwA9xYRvsfZqf0getx9omOI1JpenG9x
   4tXRbAo8Yp5NKPvC93icBWSt4MtfEqKgCbUihIv7CD7L3GS8/Pt0GzUq1
   0IwM4He7iKA/jEUAZkBl/LJgDeOW7PvrlXKnexlNLqT3xEz6XOYtoWJZa
   U2ibtViXWudGIqgFwvLI7ieoq47Qng1rvODHb1KXGRE4cDMr5/ppO7jEO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411675857"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411675857"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 21:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="994391415"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="994391415"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Sep 2023 21:22:43 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjXgf-00003B-1G;
	Fri, 22 Sep 2023 04:22:41 +0000
Date: Fri, 22 Sep 2023 12:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: oe-kbuild-all@lists.linux.dev, "jingyang.wang" <wjy7717@126.com>
Subject: [nbd168-wireless:pr/4 1/1] include/linux/pci_ids.h:3134: warning:
 "PCI_VENDOR_ID_ITTIM" redefined
Message-ID: <202309221201.5TTvOK2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless pr/4
head:   ca4db2945103cfd433731260f3d6fbf582913e68
commit: ca4db2945103cfd433731260f3d6fbf582913e68 [1/1] Merge branch 'mt76' into mt76
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309221201.5TTvOK2B-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221201.5TTvOK2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221201.5TTvOK2B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pci.h:44,
                    from drivers/net/wireless/cisco/airo.c:47:
>> include/linux/pci_ids.h:3134: warning: "PCI_VENDOR_ID_ITTIM" redefined
    3134 | #define PCI_VENDOR_ID_ITTIM             0x0B48
         | 
   include/linux/pci_ids.h:183: note: this is the location of the previous definition
     183 | #define PCI_VENDOR_ID_ITTIM             0x0b48
         | 


vim +/PCI_VENDOR_ID_ITTIM +3134 include/linux/pci_ids.h

9fd0e09a4e8649 Anthony Wong  2018-08-31  3133  
db0b72509eef7f Jingyang Wang 2023-09-06 @3134  #define PCI_VENDOR_ID_ITTIM		0x0B48
db0b72509eef7f Jingyang Wang 2023-09-06  3135  

:::::: The code at line 3134 was first introduced by commit
:::::: db0b72509eef7fdb59313890e42c225279247770 wifi: mt76: mt7922: Add support ITTIM PE50-M75C

:::::: TO: Jingyang Wang <wjy7717@126.com>
:::::: CC: Jingyang Wang <wjy7717@126.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
