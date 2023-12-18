Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A517B1D15D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo39T741"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702905021; x=1734441021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBNn8Nv8saNBOgcg1Vyt+QoNDFJHW/50hdm4eRouN4Y=;
  b=Yo39T741ThdMq4BhbZuw6hqJ5ycFyvq0q6Ge9We1pA2C3bIioLSWzpj0
   RmRhMwPXvJLdCwmy/GmQ1Dr0EUSOnM9C0FFiEDEVtd40NxhsblvhsbZax
   de9XEWm8FX8TNhmaYnuCmO3+rnsRMenWk138RWl0F6SY0A+W5uabxUwYM
   fo7txshz+Kr1zJphVb4Hp4+F9Q3aQxyzhbs1pEqo/e202FLMeHoFWf/0k
   1Fs9djU3gJrfJemJWF+bV2i5vtNh63KdkhGt6uEKoiqAHwdtZ2LAt6vN5
   QOshs4Res3z4CYEQT5lZhlRAgDKJcV7SbXEXyxjGporb6IDjzGBEpyGPh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="395237365"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="395237365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:10:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845946201"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="845946201"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Dec 2023 05:10:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFDNS-00046T-34;
	Mon, 18 Dec 2023 13:10:16 +0000
Date: Mon, 18 Dec 2023 21:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 1595/9113] drivers/spi/spi-axi-spi-engine.c:106:
 warning: Function parameter or struct member 'p' not described in
 'spi_engine_message_state'
Message-ID: <202312182101.QOWovo29-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
commit: 7f970ecb77b6759d37ee743fc36fc0daba960e75 [1595/9113] spi: axi-spi-engine: move msg state to new struct
config: m68k-randconfig-r036-20220907 (https://download.01.org/0day-ci/archive/20231218/202312182101.QOWovo29-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312182101.QOWovo29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312182101.QOWovo29-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'p' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'cmd_length' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'cmd_buf' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'tx_xfer' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'tx_length' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'tx_buf' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'rx_xfer' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'rx_length' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'rx_buf' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or struct member 'sync_id' not described in 'spi_engine_message_state'


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
