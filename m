Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE125937
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690317577; x=1721853577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WlIW/oTeapfPvbsKCAbvPU2GvPWsajVxolhhWz338I=;
  b=Md8kSy/vwvgu4NNAibOUS7W4KgQzNnTVvE5VcoIRyUAq1kQ3Qm5nwvbu
   cNFYsdur1Kp/8bNGtAmokO6wWNhe3s14UHr+b5DRzm+95QbCLFlpjWbMX
   JYVOcqLARj/mEDu7I+1ixExHWT0e7+zzP2FY4VUetQeOck2ex0y7wkna5
   zEW92lkIpPhiBiVoiD6XLWgCkkNTwxax/uJcNK8ysmbVb3L+eqMXYt0az
   HYDyeCGM2hHsdQiIoeT6oQQxa+iyoIJqDC2ve0RwTpnMZX6y03YsJAZzo
   PW3153vBBukOYA/kkCMZ1gnQfa2ierX4Jvhks1v7dRVTqmo3AvoyvJEZX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370514362"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="370514362"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 13:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796272239"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="796272239"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 13:39:16 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOOoN-0000Jz-1Q;
	Tue, 25 Jul 2023 20:39:15 +0000
Date: Wed, 26 Jul 2023 04:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/renesas/sh_eth.c:899:37: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202307260440.vx0TwVE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   12 months ago
config: openrisc-randconfig-r073-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260440.vx0TwVE5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260440.vx0TwVE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260440.vx0TwVE5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   drivers/net/ethernet/renesas/sh_eth.c:1244:43: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1249:17: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1254:25: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1262:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1262:32: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/renesas/sh_eth.c:1262:32: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1264:40: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/renesas/sh_eth.c:1264:40: sparse:    left side has type unsigned int
   drivers/net/ethernet/renesas/sh_eth.c:1264:40: sparse:    right side has type restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1268:49: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1285:33: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1361:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] len @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:1361:29: sparse:     expected unsigned int [usertype] len
   drivers/net/ethernet/renesas/sh_eth.c:1361:29: sparse:     got restricted __le32 [usertype]
   drivers/net/ethernet/renesas/sh_eth.c:1362:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] addr @@     got restricted __le32 [usertype] @@
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
   drivers/net/ethernet/renesas/sh_eth.c:1607:31: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1607:31: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1607:31: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1607:31: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1607:31: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1608:27: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1646:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1646:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1646:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1646:36: sparse: sparse: cast to restricted __le32
   drivers/net/ethernet/renesas/sh_eth.c:1646:36: sparse: sparse: cast to restricted __le32
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
   drivers/net/ethernet/renesas/sh_eth.c:2475:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] status @@     got restricted __le32 [usertype] @@
   drivers/net/ethernet/renesas/sh_eth.c:2475:32: sparse:     expected unsigned int [usertype] status
   drivers/net/ethernet/renesas/sh_eth.c:2475:32: sparse:     got restricted __le32 [usertype]

vim +899 drivers/net/ethernet/renesas/sh_eth.c

65ac8851490ec97 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2009-05-24  888  
e403d295817cf9f drivers/net/ethernet/renesas/sh_eth.c David S. Miller    2013-06-07  889  #define SH_GIGA_ETH_BASE	0xfee00000UL
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  890  #define GIGA_MALR(port)		(SH_GIGA_ETH_BASE + 0x800 * (port) + 0x05c8)
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  891  #define GIGA_MAHR(port)		(SH_GIGA_ETH_BASE + 0x800 * (port) + 0x05c0)
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  892  static void sh_eth_chip_reset_giga(struct net_device *ndev)
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  893  {
0799c2d6f42db2b drivers/net/ethernet/renesas/sh_eth.c Geert Uytterhoeven 2015-01-15  894  	u32 mahr[2], malr[2];
7927092253da598 drivers/net/ethernet/renesas/sh_eth.c Sergei Shtylyov    2016-05-08  895  	int i;
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  896  
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  897  	/* save MAHR and MALR */
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  898  	for (i = 0; i < 2; i++) {
ae70644df780c0e drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27 @899  		malr[i] = ioread32((void *)GIGA_MALR(i));
ae70644df780c0e drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27 @900  		mahr[i] = ioread32((void *)GIGA_MAHR(i));
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  901  	}
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  902  
c66b2581123cd15 drivers/net/ethernet/renesas/sh_eth.c Sergei Shtylyov    2016-05-07  903  	sh_eth_chip_reset(ndev);
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  904  
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  905  	/* restore MAHR and MALR */
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  906  	for (i = 0; i < 2; i++) {
ae70644df780c0e drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27 @907  		iowrite32(malr[i], (void *)GIGA_MALR(i));
ae70644df780c0e drivers/net/ethernet/renesas/sh_eth.c Yoshihiro Shimoda  2011-09-27  908  		iowrite32(mahr[i], (void *)GIGA_MAHR(i));
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  909  	}
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  910  }
8fcd496151b4354 drivers/net/sh_eth.c                  Yoshihiro Shimoda  2011-03-07  911  

:::::: The code at line 899 was first introduced by commit
:::::: ae70644df780c0e87f1705fda932e7cb1bdb2074 net: sh_eth: use ioremap()

:::::: TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
