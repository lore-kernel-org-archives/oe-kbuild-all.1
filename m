Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38478179B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 19:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695670068; x=1727206068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A3sAmeA9292bh0iXBSq3MZRnFSFlKwFmnHPJzzhYKQA=;
  b=IZCxXxZYKlxVeigiln69tq5DWOexX+Kliu0r3vKKUsQOTnQxHk48OpX8
   ZFVQ6SlfXRxq9+L35Im5JQr5c0BDB/C7/xQCVgd89TRb7N62bmwf2XPwg
   sCDYBrWZjm3u8km6s8dlziHwkyDpnYmTV1uPXiD8ow29QNX2gBxZmrFLs
   KNhk/sJ4uOoEvbf580jSqkVOHjx6I/uW4ZNfgE8bfuNqA5+YdGTkT4BfP
   UEwT5LtgyyMhSVRkY5iB64T0JsyUSN1QroC5qKIo/LzdeJWTNhBCkQSzn
   WlBmsZ1xwzonNQ5F8CkeJI4eIXxWM13tE61WbySQPCPkkgONjIA0P2NaS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380225520"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="380225520"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 12:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751853009"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="751853009"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 12:27:46 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkrFA-0001xV-0I;
	Mon, 25 Sep 2023 19:27:44 +0000
Date: Tue, 26 Sep 2023 03:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: drivers/net/wireless/atmel/atmel.c:2654:17: warning: 'strncpy'
 output may be truncated copying 31 bytes from a string of length 31
Message-ID: <202309260305.LRL7ALTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6465e260f48790807eef06b583b38ca9789b6072
commit: 5aa4ac64e6add3e40d5049e31275b2822daf885d LoongArch: Add KASAN (Kernel Address Sanitizer) support
date:   3 weeks ago
config: loongarch-randconfig-002-20230926 (https://download.01.org/0day-ci/archive/20230926/202309260305.LRL7ALTy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260305.LRL7ALTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260305.LRL7ALTy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/atmel/atmel.c: In function 'atmel_ioctl':
>> drivers/net/wireless/atmel/atmel.c:2654:17: warning: 'strncpy' output may be truncated copying 31 bytes from a string of length 31 [-Wstringop-truncation]
    2654 |                 strncpy(priv->firmware_id, com.id, 31);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +2654 drivers/net/wireless/atmel/atmel.c

^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2618  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2619  static int atmel_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2620  {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2621  	int i, rc = 0;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2622  	struct atmel_private *priv = netdev_priv(dev);
f0db82a5775d1c drivers/net/wireless/atmel.c       Himangi Saraogi  2014-08-09  2623  	struct atmel_priv_ioctl com;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2624  	struct iwreq *wrq = (struct iwreq *) rq;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2625  	unsigned char *new_firmware;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2626  	char domain[REGDOMAINSZ + 1];
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2627  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2628  	switch (cmd) {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2629  	case ATMELIDIFC:
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2630  		wrq->u.param.value = ATMELMAGIC;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2631  		break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2632  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2633  	case ATMELFWL:
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2634  		if (copy_from_user(&com, rq->ifr_data, sizeof(com))) {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2635  			rc = -EFAULT;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2636  			break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2637  		}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2638  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2639  		if (!capable(CAP_NET_ADMIN)) {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2640  			rc = -EPERM;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2641  			break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2642  		}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2643  
8668f9a57c8c55 drivers/net/wireless/atmel/atmel.c YueHaibing       2018-06-04  2644  		new_firmware = memdup_user(com.data, com.len);
8668f9a57c8c55 drivers/net/wireless/atmel/atmel.c YueHaibing       2018-06-04  2645  		if (IS_ERR(new_firmware)) {
8668f9a57c8c55 drivers/net/wireless/atmel/atmel.c YueHaibing       2018-06-04  2646  			rc = PTR_ERR(new_firmware);
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2647  			break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2648  		}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2649  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2650  		kfree(priv->firmware);
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2651  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2652  		priv->firmware = new_firmware;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2653  		priv->firmware_length = com.len;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16 @2654  		strncpy(priv->firmware_id, com.id, 31);
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2655  		priv->firmware_id[31] = '\0';
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2656  		break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2657  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2658  	case ATMELRD:
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2659  		if (copy_from_user(domain, rq->ifr_data, REGDOMAINSZ)) {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2660  			rc = -EFAULT;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2661  			break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2662  		}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2663  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2664  		if (!capable(CAP_NET_ADMIN)) {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2665  			rc = -EPERM;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2666  			break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2667  		}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2668  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2669  		domain[REGDOMAINSZ] = 0;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2670  		rc = -EINVAL;
b4341135794fda drivers/net/wireless/atmel.c       Dmitry Torokhov  2006-10-08  2671  		for (i = 0; i < ARRAY_SIZE(channel_table); i++) {
908414af255ea9 drivers/net/wireless/atmel.c       Rasmus Villemoes 2015-01-21  2672  			if (!strcasecmp(channel_table[i].name, domain)) {
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2673  				priv->config_reg_domain = channel_table[i].reg_domain;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2674  				rc = 0;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2675  			}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2676  		}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2677  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2678  		if (rc == 0 &&  priv->station_state != STATION_STATE_DOWN)
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2679  			rc = atmel_open(dev);
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2680  		break;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2681  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2682  	default:
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2683  		rc = -EOPNOTSUPP;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2684  	}
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2685  
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2686  	return rc;
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2687  }
^1da177e4c3f41 drivers/net/wireless/atmel.c       Linus Torvalds   2005-04-16  2688  

:::::: The code at line 2654 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
