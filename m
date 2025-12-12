Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2B526E175
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765548002; cv=none; b=Mw0JSmfUQUahR2WpYuK/KFM2ldQBS1WnWbDGFjWjPvvws+qJRT50580zwaF5fRnes1uqlO8G6SDXEXZ3EnPspNM2MgSC14yb3OKa6pL6/QmdCJaCd9qFBstVJdpB8HCWF/egoeLSzq4XE7AOQkcK60OWLAXvrKOBkVTSbhm5qEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765548002; c=relaxed/simple;
	bh=con2GjBqptRVNMMAfCksxW/2bgr1v2FylFA6UXskhfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fwm4eProN3axpRgxMxVd7dvrPV5Rw4cWqUReofBPE09yPIS9Gh24ie4/G7qt0EFwcnlDrWteLrhGdn+AP6XWgkqDJKC4if/CUkIgOSfP3MfA/Gm+ITzKf0MMJi1+cFsL+rbK8gm2UhQgrF/oh+fkBofmY2odFCMGE9eTGLFmCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXt/YmNg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXt/YmNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765548001; x=1797084001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=con2GjBqptRVNMMAfCksxW/2bgr1v2FylFA6UXskhfg=;
  b=gXt/YmNgYH/xpDFuKUPUwNrlV+eZYT84O32QKusHCiK5JKyD5f492Xy8
   rcbwcCVsNPclsBXoV/c5Lv9RIEW94P0Mw6oUN3QLyRT1NYgSZKGUVIPOx
   IcrU536QvDe7P7j27qR5pmV6azA4mKLFAWzNfTb5whn7eNOZo97oNqHDe
   ykUTnkDZ4m7CeNV7DYjkexMFdlDBJUDJ5AL7Fu+0uCXDQ0ww12OGnwUlJ
   gGr6Im38XQ5eToTz9E1OTwViH87NEkazPKmezNFfJiZKdokWS64F9w5kB
   Awm/PQ2VpZlWUYptOa7vKjggrMVN/Z2eFDbOxDQKQfnbR3eSghOcQExkD
   Q==;
X-CSE-ConnectionGUID: opTDa46ZSuuVMKQg4yATyw==
X-CSE-MsgGUID: HplBhLGNS8eSPFDy9LZM9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67492187"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67492187"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:00:00 -0800
X-CSE-ConnectionGUID: m3g+EnEkRWmpUgECitQd1g==
X-CSE-MsgGUID: 92NDYF87QRicfXy1WT5Bsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201277307"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 05:59:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3ga-0000000068D-1gBm;
	Fri, 12 Dec 2025 13:59:56 +0000
Date: Fri, 12 Dec 2025 21:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, ZhangPeng <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/spi/spi-axi-spi-engine.c:106:
 warning: Function parameter or member 'p' not described in
 'spi_engine_message_state'
Message-ID: <202512122109.Sy1IvzI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 4325464fcaf04913a8aa4ffb106f7fdd7ec94c22 [3541/3541] spi: axi-spi-engine: move msg state to new struct
config: x86_64-randconfig-073-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122109.Sy1IvzI5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122109.Sy1IvzI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122109.Sy1IvzI5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'p' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'cmd_length' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'cmd_buf' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'tx_xfer' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'tx_length' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'tx_buf' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'rx_xfer' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'rx_length' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'rx_buf' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'sync_id' not described in 'spi_engine_message_state'


vim +106 drivers/spi/spi-axi-spi-engine.c

    81	
    82	/**
    83	 * struct spi_engine_message_state - SPI engine per-message state
    84	 */
    85	struct spi_engine_message_state {
    86		/** Instructions for executing this message. */
    87		struct spi_engine_program *p;
    88		/** Number of elements in cmd_buf array. */
    89		unsigned cmd_length;
    90		/** Array of commands not yet written to CMD FIFO. */
    91		const uint16_t *cmd_buf;
    92		/** Next xfer with tx_buf not yet fully written to TX FIFO. */
    93		struct spi_transfer *tx_xfer;
    94		/** Size of tx_buf in bytes. */
    95		unsigned int tx_length;
    96		/** Bytes not yet written to TX FIFO. */
    97		const uint8_t *tx_buf;
    98		/** Next xfer with rx_buf not yet fully written to RX FIFO. */
    99		struct spi_transfer *rx_xfer;
   100		/** Size of tx_buf in bytes. */
   101		unsigned int rx_length;
   102		/** Bytes not yet written to the RX FIFO. */
   103		uint8_t *rx_buf;
   104		/** ID to correlate SYNC interrupts with this message. */
   105		u8 sync_id;
 > 106	};
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
