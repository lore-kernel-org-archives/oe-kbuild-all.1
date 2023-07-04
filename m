Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF91C08
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 07:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688456750; x=1719992750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfSrBKh+iPU4DmcVt7zcsRZ9kpnYfmTzGlkSI+3zXUg=;
  b=mN4HUg0BRXH+PRxqEW1GmejOQHkvPgRoQySNQFA2pMxrZhqoqcGdKLIj
   F20HW3CTamRbmSQtos7CnbguGycashfv28kBfCCZYhFu6PKE3WeS0tEEI
   IYAv5tF/gibKBDB/mLarlLLNWMgkp0nr33EGxPe/gMdvIjpv72+Wo1t7r
   QgYhCTx9JIV6yhiOX4oH3eqKxTqjkQ3JaGTIXbCv1vn+IsK2WXWOEweBw
   UZF55/90Qo9vJmHtXDMtVQfwFQlIfUHMaBqJoTj4PULiHNGgNgxRppD5y
   fJcMZ/eKd7e9UigK4jSaWG9U3jZnBe+PxL/29xHAnh3ABOTg+BNNGrUIA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429098729"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="429098729"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 00:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="965425404"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="965425404"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 00:45:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGajF-000I4x-14;
	Tue, 04 Jul 2023 07:45:41 +0000
Date: Tue, 4 Jul 2023 15:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: drivers/net/ethernet/renesas/sh_eth.c:899:37: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202307041507.JTZAsNP1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24be4d0b46bb0c3c1dc7bacd30957d6144a70dfc
commit: 8292493c22c8e28b6e67a01e0f5c6db1cf231eb1 riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
date:   8 months ago
config: riscv-randconfig-r091-20230704 (https://download.01.org/0day-ci/archive/20230704/202307041507.JTZAsNP1-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041507.JTZAsNP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041507.JTZAsNP1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zicbom_zihintpause'
>> drivers/net/ethernet/renesas/sh_eth.c:899:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/renesas/sh_eth.c:899:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:899:37: sparse:     got void *
   drivers/net/ethernet/renesas/sh_eth.c:900:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/renesas/sh_eth.c:900:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:900:37: sparse:     got void *
>> drivers/net/ethernet/renesas/sh_eth.c:907:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/renesas/sh_eth.c:907:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:907:37: sparse:     got void *
   drivers/net/ethernet/renesas/sh_eth.c:908:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/renesas/sh_eth.c:908:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:908:37: sparse:     got void *
>> drivers/net/ethernet/renesas/sh_eth.c:1186:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *addr @@
   drivers/net/ethernet/renesas/sh_eth.c:1186:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:1186:31: sparse:     got void *addr
>> drivers/net/ethernet/renesas/sh_eth.c:1191:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *addr @@
   drivers/net/ethernet/renesas/sh_eth.c:1191:31: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:1191:31: sparse:     got void *addr
   drivers/net/ethernet/renesas/sh_eth.c:1214:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *addr @@
   drivers/net/ethernet/renesas/sh_eth.c:1214:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/renesas/sh_eth.c:1214:33: sparse:     got void *addr
>> drivers/net/ethernet/renesas/sh_eth.c:1244:43: sparse: sparse: restricted __le32 degrades to integer
>> drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
>> drivers/net/ethernet/renesas/sh_eth.c:1262:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1262:32: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/renesas/sh_eth.c:1262:32: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/renesas/sh_eth.c:1264:40: sparse: sparse: invalid assignment: |=
>> drivers/net/ethernet/renesas/sh_eth.c:1264:40: sparse:    left side has type unsigned int
>> drivers/net/ethernet/renesas/sh_eth.c:1264:40: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
>> drivers/net/ethernet/renesas/sh_eth.c:1361:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1361:29: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/renesas/sh_eth.c:1361:29: sparse:     got restricted __le32 [usertype]
>> drivers/net/ethernet/renesas/sh_eth.c:1362:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1362:30: sparse:     expected unsigned int [usertype] addr
   drivers/net/ethernet/renesas/sh_eth.c:1362:30: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1363:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1363:32: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/renesas/sh_eth.c:1363:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1377:32: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:1377:32: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:1377:32: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1385:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1385:32: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/renesas/sh_eth.c:1385:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1386:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1386:29: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/renesas/sh_eth.c:1386:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1395:24: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:1395:24: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:1395:24: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1547:40: sparse: sparse: invalid assignment: &=
   drivers/net/ethernet/renesas/sh_eth.c:1547:40: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:1547:40: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1604:35: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/renesas/sh_eth.c:1607:31: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1646:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1677:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1677:29: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/renesas/sh_eth.c:1677:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1693:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1693:38: sparse:     expected unsigned int [usertype] addr
   drivers/net/ethernet/renesas/sh_eth.c:1693:38: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1697:40: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:1697:40: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:1697:40: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1700:40: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:1700:40: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:1700:40: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:2477:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:2477:32: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/renesas/sh_eth.c:2477:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:2478:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:2478:30: sparse:     expected unsigned int [usertype] addr
   drivers/net/ethernet/renesas/sh_eth.c:2478:30: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:2529:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:2529:22: sparse:     expected unsigned int [usertype] addr
   drivers/net/ethernet/renesas/sh_eth.c:2529:22: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:2530:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:2530:22: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/renesas/sh_eth.c:2530:22: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:2534:32: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:2534:32: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:2534:32: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:2536:32: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:2536:32: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:2536:32: sparse:    right side has type restricted __le32
>> drivers/net/ethernet/renesas/sh_eth.c:3084:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/net/ethernet/renesas/sh_eth.c:3084:23: sparse:     expected void *addr
   drivers/net/ethernet/renesas/sh_eth.c:3084:23: sparse:     got void [noderef] __iomem *

vim +899 drivers/net/ethernet/renesas/sh_eth.c

65ac8851490ec9 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2009-05-24  888  
e403d295817cf9 drivers/net/ethernet/renesas/sh_eth.c David S. Miller    2013-06-07  889  #define SH_GIGA_ETH_BASE	0xfee00000UL
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  890  #define GIGA_MALR(port)		(SH_GIGA_ETH_BASE + 0x800 * (port) + 0x05c8)
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  891  #define GIGA_MAHR(port)		(SH_GIGA_ETH_BASE + 0x800 * (port) + 0x05c0)
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  892  static void sh_eth_chip_reset_giga(struct net_device *ndev)
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  893  {
0799c2d6f42db2 drivers/net/ethernet/renesas/sh_eth.c Geert Uytterhoeven 2015-01-15  894  	u32 mahr[2], malr[2];
7927092253da59 drivers/net/ethernet/renesas/sh_eth.c Sergei Shtylyov    2016-05-08  895  	int i;
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  896  
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  897  	/* save MAHR and MALR */
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  898  	for (i = 0; i < 2; i++) {
ae70644df780c0 drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27 @899  		malr[i] = ioread32((void *)GIGA_MALR(i));
ae70644df780c0 drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27  900  		mahr[i] = ioread32((void *)GIGA_MAHR(i));
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  901  	}
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  902  
c66b2581123cd1 drivers/net/ethernet/renesas/sh_eth.c Sergei Shtylyov    2016-05-07  903  	sh_eth_chip_reset(ndev);
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  904  
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  905  	/* restore MAHR and MALR */
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  906  	for (i = 0; i < 2; i++) {
ae70644df780c0 drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27 @907  		iowrite32(malr[i], (void *)GIGA_MALR(i));
ae70644df780c0 drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27  908  		iowrite32(mahr[i], (void *)GIGA_MAHR(i));
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  909  	}
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  910  }
8fcd496151b435 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  911  

:::::: The code at line 899 was first introduced by commit
:::::: ae70644df780c0e87f1705fda932e7cb1bdb2074 net: sh_eth: use ioremap()

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
