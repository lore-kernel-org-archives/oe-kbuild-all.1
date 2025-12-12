Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DBA30E828
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530646; cv=none; b=rOBl26dtasQ632qq2+ytJSotN0yPKgZo4RQN82yfA0rRZBbOhGhJSd8zK088AlogcYAm/hVuxW9Q67VKgqmiNdnyiIZtZVK0fOkGdg/Bo+26CrI6zae7o9FXMt1+JZdrrl20JmodT8mBMyaiaGKTZbNdCG1ZuS8BtsQzIUPYylQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530646; c=relaxed/simple;
	bh=YX4knrw3Nkpu4mOSA5vDrHZS4iwBYAatqBW/4j7jzfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=McYyr4WcmV8XQ533ukAUEhD8/SBcWKbffzbWJGrP0yRk6EGXVRVwoom8o2+6rNUVC5O6hCd6/IoISbT4ruBkUYrZEwx8kDt7Q63lBq4gLNcaX237AIbUjrrKmmqHLeM/QIMAgZv+kbv7lnRscJ3YP286Br4NRS6qYWep+ipb25I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqRhU/rx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqRhU/rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765530644; x=1797066644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YX4knrw3Nkpu4mOSA5vDrHZS4iwBYAatqBW/4j7jzfE=;
  b=KqRhU/rxwY0snyuZGrAU+wmLdD5lQVTwqt/Ewy/60DSGfCysKn7BIbjR
   ui39dfxUqB3jTWWBXQmIa+Zn15/6BdZVvdIsLxQ7A3ohIIsj1fSLnEv/+
   7mGRXfvZQ/goxCexDAOrv5n/u8nE4o6DJJFdTf+GEhwOuIfjBg1sPIBN8
   5N+uuOOQmFZS/As1a3bJrgxcwOtBDqEEhnk5im1RghHWLfjfUFHm0iSBi
   rZfkcT45k8psEMr7lcSSxy6VDcmKbeOg7QythgH9TsA2JvKqw/dUjkx/w
   7hlhMfTrzL0tBw1YdyLo9wdZfUKKNb3r9Dh3GWMOjenYgjM+oM+KiJTMZ
   Q==;
X-CSE-ConnectionGUID: y6MEPb4aTPeh5hoYqmd8Ig==
X-CSE-MsgGUID: sBqyXQrUSyKyzSriW7X4iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78143442"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78143442"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:10:43 -0800
X-CSE-ConnectionGUID: 6Ua+kkZfSayWtC7khPSJCw==
X-CSE-MsgGUID: Va96mZZMRA+NvGJWQ300EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="202116603"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Dec 2025 01:10:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzAe-000000005qQ-0juR;
	Fri, 12 Dec 2025 09:10:40 +0000
Date: Fri, 12 Dec 2025 17:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 0/11]
 drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member
 'tx_xfer' not described in 'spi_engine_message_state'
Message-ID: <202512121709.8qpJ2f52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   691fd54204b78715418b027529c23d3a9eca9456
commit: 3915124910c5ef8ce0c61ba58f837896b76636af [0/11] spi: axi-spi-engine: move msg state to new struct
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512121709.8qpJ2f52-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121709.8qpJ2f52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121709.8qpJ2f52-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'p' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'cmd_length' not described in 'spi_engine_message_state'
   drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'cmd_buf' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'tx_xfer' not described in 'spi_engine_message_state'
>> drivers/spi/spi-axi-spi-engine.c:106: warning: Function parameter or member 'tx_length' not described in 'spi_engine_message_state'
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
