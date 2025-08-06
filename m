Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E21D47B4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754503399; cv=none; b=pca2UrNkubVKpZgNdnY2xEza5hoxLKar/f3dfB1wQh3n5fPwNHlscQksdlSaIFvpHtw9Z4TfFCG54GBH5NaerydwArsH4XVGRF4FwUTzATt/TzRd5GYVcekoJmkCZYVYBJU0h9jzg/0PYE8brkWuatIigUqDGae6OsoMkrIjjxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754503399; c=relaxed/simple;
	bh=SpqOxmQRVGGxRAkW1DHcRYnQfaCCvRJUfjsg4JeiXBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5obkByyPbsATDXcm4ixLaZxJYjWsMXvCreLPmyAODAaFzCfNmMTwVy7HImoQFg8F3Wk5MX/ILILSYUHsL5kekybk0+k7QUg5XHlzWRH3StE80GiqUz9e+rJaUk40vG9SRzQo2IqTW+kOjSeuvMyAuNxDsqwF3/V8TnlVOIvj0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECXi5AtJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECXi5AtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754503397; x=1786039397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpqOxmQRVGGxRAkW1DHcRYnQfaCCvRJUfjsg4JeiXBg=;
  b=ECXi5AtJugkR4F0CImmGR4yArfeyQ0nhFeWDfUtlTmmId95arxeLv0mK
   LSpk7cAGv0LXAWRdot9bqpVbx91TMJyf/cvn9gDKY82XIgJsJ8+aAiOO1
   IdFkypm0kgNYTgW9cmsvuLARgW+G/EcRdPLERx9EyCJaOGZvaooHUI4yB
   DWwTT9KnQ6EZfU5eOxW3gWtyopzn8XBiMYRZMEQuKZa+Dr2Fmt6ghlOa2
   /7m4okGGMoD0iPAnT/1x2bWfTtUPBrHKaWp71Ex5Ds7LrLvuMpMCe8WOO
   +BQv9eJFg8io13N4BN5dEFWklVU2lHhrhJz7+jl+Kd1Sc/4O3/1q9yZKf
   w==;
X-CSE-ConnectionGUID: p+NCGfSPTdKTo8YNNip6+Q==
X-CSE-MsgGUID: /n7aMm+cQ76PHEklkKwsMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60640730"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60640730"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 11:03:16 -0700
X-CSE-ConnectionGUID: YkI8Zsr2Tie6mB3oIAGSMg==
X-CSE-MsgGUID: MA47uZssSEOo/i6uyZIAmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="195676090"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2025 11:03:15 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujiTp-0002EV-0N;
	Wed, 06 Aug 2025 18:03:13 +0000
Date: Wed, 6 Aug 2025 20:02:28 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2658/2658]
 drivers/crypto/sedriver/wst_se_echip_driver.c:95:25: warning: no previous
 prototype for function 'se_get_dma_buf'
Message-ID: <202508062010.itDDl07H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8551213150db5f8eebd27273dae93f6fe258d63a
commit: 3fb87845837f13b19d7b20349801e75f2e303293 [2658/2658] crypto: loongson: add wst se chip support
config: loongarch-randconfig-2005-20250806 (https://download.01.org/0day-ci/archive/20250806/202508062010.itDDl07H-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508062010.itDDl07H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508062010.itDDl07H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/sedriver/wst_se_echip_driver.c:95:25: warning: no previous prototype for function 'se_get_dma_buf' [-Wmissing-prototypes]
      95 | struct tag_dma_buf_ctl *se_get_dma_buf(int ikernel)
         |                         ^
   drivers/crypto/sedriver/wst_se_echip_driver.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | struct tag_dma_buf_ctl *se_get_dma_buf(int ikernel)
         | ^
         | static 
>> drivers/crypto/sedriver/wst_se_echip_driver.c:114:5: warning: no previous prototype for function 'se_free_dma_buf' [-Wmissing-prototypes]
     114 | int se_free_dma_buf(struct tag_dma_buf_ctl *pdmabufctl)
         |     ^
   drivers/crypto/sedriver/wst_se_echip_driver.c:114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     114 | int se_free_dma_buf(struct tag_dma_buf_ctl *pdmabufctl)
         | ^
         | static 
>> drivers/crypto/sedriver/wst_se_echip_driver.c:150:5: warning: no previous prototype for function 'se_printk_hex' [-Wmissing-prototypes]
     150 | int se_printk_hex(unsigned char *buff, int length)
         |     ^
   drivers/crypto/sedriver/wst_se_echip_driver.c:150:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     150 | int se_printk_hex(unsigned char *buff, int length)
         | ^
         | static 
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1082:9: warning: no previous prototype for function 'se_kernelwrite' [-Wmissing-prototypes]
    1082 | ssize_t se_kernelwrite(unsigned char *pInPtr, unsigned short usInlen,
         |         ^
   drivers/crypto/sedriver/wst_se_echip_driver.c:1082:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1082 | ssize_t se_kernelwrite(unsigned char *pInPtr, unsigned short usInlen,
         | ^
         | static 
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1175:5: warning: no previous prototype for function 'se_chip_load' [-Wmissing-prototypes]
    1175 | int se_chip_load(void)
         |     ^
   drivers/crypto/sedriver/wst_se_echip_driver.c:1175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1175 | int se_chip_load(void)
         | ^
         | static 
>> drivers/crypto/sedriver/wst_se_echip_driver.c:1272:6: warning: no previous prototype for function 'se_chip_unload' [-Wmissing-prototypes]
    1272 | void se_chip_unload(void)
         |      ^
   drivers/crypto/sedriver/wst_se_echip_driver.c:1272:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1272 | void se_chip_unload(void)
         | ^
         | static 
   6 warnings generated.


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
