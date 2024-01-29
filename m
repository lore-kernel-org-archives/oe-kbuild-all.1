Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096A155A22
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706545433; cv=none; b=n3dpuhIqcW7YgTR6T5wR/uKZQ28N0F7ildWmFQDuJ0RQfyHThG/hEmD4JYYfqmEcbwf8Q15ojsBnJa45k9yX3Yy8L7z9VJxpX0IB5dZvgSXB63rCb2Ga3xVbiuJwkb3unTcMt9uy7pTFo1pL/Zs7vPSsM6gdKUBL9wYTsxiPHXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706545433; c=relaxed/simple;
	bh=NihuY89J9vebfqvwR7fL82EifY1pwoPJmT0a76RrLCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vj5HaB42qNCjlp4UhD3qAzz/ut1OryXiues1Nq1jlv4kI/8mwpSRyaE7WsgtCdnmN7Va2Osy9GaRV743JUfjixnvSrkR3EO5SwmkjuBIgfZV1JdpzpiSbRkWX1r5y0eTM7MhVo4bRV+TfVLM08I+PIXCyZiAm/Ucck/Pdit6NnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rl7CZ0nh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rl7CZ0nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706545432; x=1738081432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NihuY89J9vebfqvwR7fL82EifY1pwoPJmT0a76RrLCY=;
  b=Rl7CZ0nhy+qWUbl9DqCPzIuglOfx1EnW9TJLqw38ft3Q1aWrx/V9QjHd
   VcE+jaiqdadP8JkLd8HG32c0hiHoT2PHLCH00hoCiGzOu1mO4ZcLgfQD+
   MqSh0XToLbnE73iPemadHFZiiRA5M1oDvbJu/A2l7faJLDnw880rtsRop
   995SZAYJFX8nWgL8rnDisMqHXKodo5JcXOwtU5rtb2uXDxeHqXOV7KI2V
   u2f85sSqUv7N85CJ6EmgN4u28EJkqZtbtshraPkGt0UxX9peA6YtmSKS7
   DYJzmBzpDNB+W5EJxwyF2z/wyP8BBnMFx17wW0OcTiy+er5g6N2djkzbf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2860395"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2860395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 08:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3502904"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jan 2024 08:23:50 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUUQF-0004Qs-0v;
	Mon, 29 Jan 2024 16:23:47 +0000
Date: Tue, 30 Jan 2024 00:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1538/26476]
 drivers/net/wireless/mediatek/mt76_new/mt7622/regs.h:29:18: warning:
 'mt7622_mmio_regs_base' defined but not used
Message-ID: <202401300017.C6j64l2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: b3e9f59721bd975ec4acd596fafb962a67a983a8 [1538/26476] mt76: some fixes
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401300017.C6j64l2E-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300017.C6j64l2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300017.C6j64l2E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76_new/mt7622/mt7622.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/mt7622/main.c:13:
>> drivers/net/wireless/mediatek/mt76_new/mt7622/regs.h:29:18: warning: 'mt7622_mmio_regs_base' defined but not used [-Wunused-const-variable=]
      29 | static const u32 mt7622_mmio_regs_base[] = {
         |                  ^~~~~~~~~~~~~~~~~~~~~


vim +/mt7622_mmio_regs_base +29 drivers/net/wireless/mediatek/mt76_new/mt7622/regs.h

bdfab89b8dada9 Frank Wunderlich 2019-11-22  28  
bdfab89b8dada9 Frank Wunderlich 2019-11-22 @29  static const u32 mt7622_mmio_regs_base[] = {
bdfab89b8dada9 Frank Wunderlich 2019-11-22  30  	[MCU_BASE] =			0x2000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  31  	[PDMA_BASE] =			0x4000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  32  	[DMASHDL_BASE] =		0x5000a000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  33  	[DMASHDL_REMAP_BASE] =  0x2504,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  34  	[DMASHDL_OFS_BASE] =	0x80000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  35  	[CSR_BASE] =			0x7000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  36  	[WF_PHY_BASE] =			0x10000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  37  	[WF_CFG_BASE] =			0x20200,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  38  	[WF_AGG_BASE] =			0x20a00,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  39  	[WF_TMAC_BASE] =		0x21000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  40  	[WF_RMAC_BASE] =		0x21200,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  41  	[WF_DMA_BASE] =			0x21800,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  42  	[WTBL_ON_BASE] =		0x23000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  43  	[WTBL_OFF_BASE] =		0x23400,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  44  	[LPON_BASE] =			0x24200,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  45  	[WF_MIB_BASE] =			0x24800,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  46  	[WTBL_BASE] =			0x30000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  47  	[TOPCFG_BASE] =			0x00000,
bdfab89b8dada9 Frank Wunderlich 2019-11-22  48  };
bdfab89b8dada9 Frank Wunderlich 2019-11-22  49  

:::::: The code at line 29 was first introduced by commit
:::::: bdfab89b8dada94f63f56210817f1376c7fd5dca mt76: update driver from openwrt to include mt7622 wifi

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
