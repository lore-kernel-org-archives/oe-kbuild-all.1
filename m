Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAE2EEAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765604225; cv=none; b=uJ/YRSuoqnVEtVsKa3Dh15KqCAr7zOsT8ODKmKyWdOrRVlz5HHnPJWQXK3rAXO61STbdFnuB760Au1I8qpjAx/lUZae/eHsexPAl2y2Qn3UYxriDqt+TMv5ADqmrkASlXelk+u8eeJwEMTpuDCCDr3/Sslh6i206VQx1FqH6qFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765604225; c=relaxed/simple;
	bh=qFI65CIoI1MWdfQoqnZ9zI3uv/MLS6Bed7zfn+jW6zE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TwFVegmtRjJw3B7yM4wBr5khBrmXzpDOBs4rUwiBrhNiZW2YSQp/knOiSqpiurn3RnT8k/N7o8utW1PW8gkAAOH6pqgge+aVkHtqffAOX2l/ifua/i9McTm9xTN0KtLT+g/lfSS/92YPcfVIJJsCSafIUDxBRaqhJfiqf6Jk7wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWIteZ1X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWIteZ1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765604225; x=1797140225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFI65CIoI1MWdfQoqnZ9zI3uv/MLS6Bed7zfn+jW6zE=;
  b=BWIteZ1XKUWjdbx7SxpeEr1wmTg4BwvKGdQQVJnPSTEu3tBAj/GWxx7o
   wVTb0H8EwGxGLVEMeyWQz0otzNHp85l61pHL/QhK0H0rjbbErMhWQdlF+
   H8y0jXvRBEpqEzJ84P2EEDi40YsSOnA0H/MLLLwqJc8Uo184NWIhn0nrJ
   ZvbLskS/2Bgk7AWA07BmDQ5g2VltuaCPBqwsIykOUMmLN4gmJ1RmuGfSC
   MnHtfXff/ezU9ZzhCs5LHG98sHWKNxtDLX4yYSQ6sw0qfVveAJHY1dJ7N
   TnrO6M2+jYcPF60qfAD1ipfwN6HKsCTKwdFMEAMuy1OvYuJ6hd0cZZs2R
   w==;
X-CSE-ConnectionGUID: fni2H4BPRsyaabjf7KNCvg==
X-CSE-MsgGUID: C9SF17jeTZKqAswWVWeaKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85009116"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85009116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 21:37:04 -0800
X-CSE-ConnectionGUID: 2g2/lya+TFaf6G8YMzXC1w==
X-CSE-MsgGUID: 7gLtkOW/Rhy1+AXDqRtW6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201677486"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 21:37:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIJQ-0000000077B-2XLJ;
	Sat, 13 Dec 2025 05:37:00 +0000
Date: Sat, 13 Dec 2025 13:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] drivers/mmc/host/atmel-mci.c:238:
 warning: Function parameter or member 'dma_filter' not described in
 'mci_platform_data'
Message-ID: <202512131314.b7cxnfFt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Balamanikandan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: d2c6d518c21d73d96616e08a19eccd4642f4bafa [2/2] mmc: atmel-mci: move atmel MCI header file
config: arm-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131314.b7cxnfFt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131314.b7cxnfFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131314.b7cxnfFt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/atmel-mci.c:238: warning: Function parameter or member 'dma_filter' not described in 'mci_platform_data'


vim +238 drivers/mmc/host/atmel-mci.c

   228	
   229	/**
   230	 * struct mci_platform_data - board-specific MMC/SDcard configuration
   231	 * @dma_slave: DMA slave interface to use in data transfers.
   232	 * @slot: Per-slot configuration data.
   233	 */
   234	struct mci_platform_data {
   235		void			*dma_slave;
   236		dma_filter_fn		dma_filter;
   237		struct mci_slot_pdata	slot[ATMCI_MAX_NR_SLOTS];
 > 238	};
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
