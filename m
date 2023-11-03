Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E42E10F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 00:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaSuhzIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698972384; x=1730508384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3/iF7Hu2vDl5BawjSBQc1ldjl26B8Okea5fm85SEWU=;
  b=ZaSuhzImdKwvx5aYFSiTQrsD0AY6HNEuD8bV7sYHMMBKNkmqoDM4GtzU
   LyAGA4ZyuQNDnS3ny1+Ms/jQB9aldkDfQ/BGaGUynFwR7RwIGQ06iVGlN
   HFHUZrB1+NZEF8+bk18bwUDCe/ud0L4A4jY9jhIaqUhMHfV084VxHPIc3
   RUIk0p0mRzwEtj4xlrhBRH1GRHSoy0PaV1dSB0Xr/5GFaz3kKj3C5oqit
   K6aCbaFdBgp4JLdroPQb7OQk3bAUN/qjnUwhojFexK5olFHxGRkQQdvFL
   DlMI9QZ4QcKxkZon2ehrlTUB0MJyM3K8lNLNPW+09CPVLUqqA6Be7F7b3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="419958317"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="419958317"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="9194722"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2023 17:46:22 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyiKI-00023k-23;
	Fri, 03 Nov 2023 00:46:18 +0000
Date: Fri, 3 Nov 2023 08:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:125:50: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 8
Message-ID: <202311030809.CjufIFaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: 353d5c241e83c4de04ca5ec0d7922bfb0809aa25 dmaengine: dw-edma: Add HDMA DebugFS support
date:   5 months ago
config: parisc-randconfig-001-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030809.CjufIFaP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030809.CjufIFaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030809.CjufIFaP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c: In function 'dw_hdma_v0_debugfs_on':
>> drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:125:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
     125 |                 snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
         |                                                  ^~
   In function 'dw_hdma_debugfs_regs_wr',
       inlined from 'dw_hdma_debugfs_regs' at drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:156:2,
       inlined from 'dw_hdma_v0_debugfs_on' at drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:169:2:
   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:125:46: note: directive argument in the range [-2147483641, 65534]
     125 |                 snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
         |                                              ^~~~~~~
   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:125:17: note: 'snprintf' output between 10 and 20 bytes into a destination of size 16
     125 |                 snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c: In function 'dw_hdma_v0_debugfs_on':
   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:142:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
     142 |                 snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
         |                                                  ^~
   In function 'dw_hdma_debugfs_regs_rd',
       inlined from 'dw_hdma_debugfs_regs' at drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:157:2,
       inlined from 'dw_hdma_v0_debugfs_on' at drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:169:2:
   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:142:46: note: directive argument in the range [-2147483641, 65534]
     142 |                 snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
         |                                              ^~~~~~~
   drivers/dma/dw-edma/dw-hdma-v0-debugfs.c:142:17: note: 'snprintf' output between 10 and 20 bytes into a destination of size 16
     142 |                 snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +125 drivers/dma/dw-edma/dw-hdma-v0-debugfs.c

   115	
   116	static void dw_hdma_debugfs_regs_wr(struct dw_edma *dw, struct dentry *dent)
   117	{
   118		struct dentry *regs_dent, *ch_dent;
   119		char name[16];
   120		int i;
   121	
   122		regs_dent = debugfs_create_dir(WRITE_STR, dent);
   123	
   124		for (i = 0; i < dw->wr_ch_cnt; i++) {
 > 125			snprintf(name, sizeof(name), "%s:%d", CHANNEL_STR, i);
   126	
   127			ch_dent = debugfs_create_dir(name, regs_dent);
   128	
   129			dw_hdma_debugfs_regs_ch(dw, EDMA_DIR_WRITE, i, ch_dent);
   130		}
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
