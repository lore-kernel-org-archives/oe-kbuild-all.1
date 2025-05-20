Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA2268C6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734079; cv=none; b=Zu3onrvHp76bYPtPbobmqVcv356IjgcTXazEiEyyuh+VEeLgAN02sfDdI3ZXSRgyalktxoIRRksD/P9zjC5KBnsk+cnKsmMLWCbjJ7Si4Q3TWyRi5vLRZ7YS0D4il0goLhrLpDD/WPc9c9lVLmSHq4c27/1v5MzpzCcmVkbR7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734079; c=relaxed/simple;
	bh=MdGJp9kWFXVBty5Yck7O2ZXaKDAwNcwZwCccSB2tvnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWHwerVXOF5hMKcFnpWQbVW4ynBq3yHAEYpB5530/3uvaS714LcQemihSKGkJyRtrNO09a4V25iXEB0tR2FwpPNgmu7hD0UoCKiTL6x0LowaNaFk8uiYljuGCPA0z/hPzL1eO92I+QuNlkWBOfb72ddmZlI94Ag6jPOCMUWH8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njir/u9d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njir/u9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747734078; x=1779270078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdGJp9kWFXVBty5Yck7O2ZXaKDAwNcwZwCccSB2tvnE=;
  b=njir/u9d+8U3m/TFYEQAroAMzosGmhOTGRmkHo8v2GNhWMk5VwDHiVQB
   pxZlcl984fUUmbqieLSOt1qD34gVTBT3ovZFLkpYdK84JVyKZ+T4Xbi+H
   Lyh0JQiShmpGh3YPyrK422W+IKZ6h0J20puajA2ZJPApLYMmE+A9dZjs/
   1QVNsFPH/9NftII33gnwgX447w0K18jpe9KVudRd7NfQadlO0CqC8XKOf
   dSBC1yKgkv5M4msirJkcFBFsz7wRHLHv4Cgh+fxnAMObo79PxdIg3qMgg
   GyUZXdjpXbH1qoxcBBuplieU417jCLSVdxFOALvnn4gD27v/+yypVJ4xo
   w==;
X-CSE-ConnectionGUID: rfRsh3yQQkudGibEI0cMMA==
X-CSE-MsgGUID: pXptq3fkTnqb1xrzGcakFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49794210"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49794210"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 02:41:17 -0700
X-CSE-ConnectionGUID: UEKwGIUaQKmoYa/Z1ZGnrQ==
X-CSE-MsgGUID: C8m5IMciRoyM5FypdEm/oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139541649"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 May 2025 02:41:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHJTG-000MP0-1F;
	Tue, 20 May 2025 09:41:14 +0000
Date: Tue, 20 May 2025 17:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2257/2257]
 drivers/crypto/sedriver/wst_se_echip_driver.c:95:25: warning: no previous
 prototype for 'se_get_dma_buf'
Message-ID: <202505201757.qoTbv6a9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   07f584ce776b1da46ead9c90d16968739723d311
commit: 3fb87845837f13b19d7b20349801e75f2e303293 [2257/2257] crypto: loongson: add wst se chip support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250520/202505201757.qoTbv6a9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201757.qoTbv6a9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201757.qoTbv6a9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/sedriver/wst_se_echip_driver.c:95:25: warning: no previous prototype for 'se_get_dma_buf' [-Wmissing-prototypes]
      95 | struct tag_dma_buf_ctl *se_get_dma_buf(int ikernel)
         |                         ^~~~~~~~~~~~~~
>> drivers/crypto/sedriver/wst_se_echip_driver.c:114:5: warning: no previous prototype for 'se_free_dma_buf' [-Wmissing-prototypes]
     114 | int se_free_dma_buf(struct tag_dma_buf_ctl *pdmabufctl)
         |     ^~~~~~~~~~~~~~~
>> drivers/crypto/sedriver/wst_se_echip_driver.c:150:5: warning: no previous prototype for 'se_printk_hex' [-Wmissing-prototypes]
     150 | int se_printk_hex(unsigned char *buff, int length)
         |     ^~~~~~~~~~~~~
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1082:9: warning: no previous prototype for 'se_kernelwrite' [-Wmissing-prototypes]
    1082 | ssize_t se_kernelwrite(unsigned char *pInPtr, unsigned short usInlen,
         |         ^~~~~~~~~~~~~~
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1175:5: warning: no previous prototype for 'se_chip_load' [-Wmissing-prototypes]
    1175 | int se_chip_load(void)
         |     ^~~~~~~~~~~~
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1272:6: warning: no previous prototype for 'se_chip_unload' [-Wmissing-prototypes]
    1272 | void se_chip_unload(void)
         |      ^~~~~~~~~~~~~~


vim +/se_get_dma_buf +95 drivers/crypto/sedriver/wst_se_echip_driver.c

    94	
  > 95	struct tag_dma_buf_ctl *se_get_dma_buf(int ikernel)
    96	{
    97		struct tag_dma_buf_ctl *pbufctl = NULL;
    98		unsigned long ultimeout = 0;
    99	
   100		ultimeout = jiffies + 20 * HZ;
   101		while (1) {
   102			spin_lock(&g_getdmabuflock);
   103			pbufctl = (struct tag_dma_buf_ctl *)wst_Popfront_Que(
   104				&g_DmaBQueueContainer);
   105			spin_unlock(&g_getdmabuflock);
   106			if (pbufctl)
   107				return pbufctl;
   108			if (down_timeout(&g_dmabufsem, ultimeout))
   109				return NULL;
   110		}
   111		return pbufctl;
   112	}
   113	
 > 114	int se_free_dma_buf(struct tag_dma_buf_ctl *pdmabufctl)
   115	{
   116		spin_lock(&g_getdmabuflock);
   117		wst_Pushback_Que(&g_DmaBQueueContainer, pdmabufctl);
   118		spin_unlock(&g_getdmabuflock);
   119		if (g_dmabufsem.count <= 0)
   120			up(&g_dmabufsem);
   121	
   122		return 0;
   123	}
   124	
   125	static unsigned long bytes_align(struct device *pdev, unsigned long ulVirAddr)
   126	{
   127		unsigned char diff;
   128		unsigned long ulPhyAddr = (unsigned long)__pa((void *)ulVirAddr);
   129	
   130		if ((ulPhyAddr & 0x000000000000003f) == 0)
   131			return ulVirAddr;
   132		diff = ((long)ulPhyAddr & (~(0x000000000000003f))) + 64 - ulPhyAddr;
   133		ulVirAddr += diff;
   134	
   135		return ulVirAddr;
   136	}
   137	
   138	static unsigned long descri_bytes_align(unsigned long ulVirAddr)
   139	{
   140		unsigned char diff;
   141		unsigned long ulPhyAddr = ulVirAddr;
   142	
   143		if ((ulPhyAddr & (~0x00000000ffffffe0)) == 0)
   144			return ulVirAddr;
   145		diff = ((long)ulPhyAddr & 0x00000000ffffffe0) + 32 - ulPhyAddr;
   146		ulVirAddr += diff;
   147		return ulVirAddr;
   148	}
   149	
 > 150	int se_printk_hex(unsigned char *buff, int length)
   151	{
   152		unsigned char *string_tmp = buff;
   153		int i;
   154		int count = 0;
   155	
   156		for (i = 0; i < length; i++, count++) {
   157			if (count < 16)
   158				pr_info("%02x ", string_tmp[i]);
   159			else {
   160				count = 0;
   161				pr_info("\n%02x ", string_tmp[i]);
   162				continue;
   163			}
   164		}
   165		pr_info("\n");
   166		return 0;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
