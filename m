Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FABB38425B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711465; cv=none; b=Eauef24irf3J88DH8rXAN/Nlvmmgkum/OrgAvUDeRV0K9XxO+B1Q1ihkV22T+7ejGq8+A2ftzWjFzgOPYsv6ss4g6mxX0eak4HMGvXT3A4k6Wq0hQKwXmlXY1njpUh3L0iiTTYwJNmud4zCu038gKndTpY7jWzU71jIp0abBvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711465; c=relaxed/simple;
	bh=XtyzYb+L64y5Ib5zuueFAmXD/dDyy4TdPwACetDeBvU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JfCJaPdqvdP0wDZP9FZCVnm0/9k59FDR5XavQjwe9XfFVC6kIJ565IABD5hEvrNrSNricMmEVUFiGz9t6DTHtGWImFVugVnWYj8he4260fkcXFlETTZHXkC+nsh3kgBqO4b81EJbrWSQg1aoPkmJDJ+I9bYXx6lpO+wp26Yv9jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gid/F1tw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gid/F1tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783711462; x=1815247462;
  h=date:from:to:cc:subject:message-id;
  bh=XtyzYb+L64y5Ib5zuueFAmXD/dDyy4TdPwACetDeBvU=;
  b=Gid/F1twgtL1rfPOtIOO/cFQXlZhdhOwK21jUasmh6VjRdVR7k3DOdzu
   E2U8lyAiI3Mv/8sUYRibNuuAEiJD23mdnXOxtvbCRr7EGg1aN3HLZVfmV
   sIoF/dG/j4S3o4M5dMVVAqY8xDwHfLfd/r+rfsJEQCt+TotClfEatnTGW
   zeWIpLp2WPDlIPlh5LRCRlLZpUE4BTAF+9+3hTi5Lf/BHsKo9mRstULob
   P0vOzMtAqEyqqZJ+rIzoz5YcKY0A6IUbNV6LnupvL69/LaI0UopVii82K
   qrSn4eRt98nz6Yt9lFHBqYTFPqNKeD4RW/bk5BnU2meByqAMsFNyv/z2o
   Q==;
X-CSE-ConnectionGUID: qXDH/V6JQZC6F+eMG9TqxA==
X-CSE-MsgGUID: vrAVHcORSNSH2KDWP2bNDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71936509"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71936509"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 12:24:21 -0700
X-CSE-ConnectionGUID: 9EiBFX58THeo07EvniNmzQ==
X-CSE-MsgGUID: FWuek4+KSTOecEhQxfSBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252326482"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2026 12:24:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiGpd-00000000JIH-23Tm;
	Fri, 10 Jul 2026 19:24:17 +0000
Date: Sat, 11 Jul 2026 03:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 1/1]
 drivers/mmc/host/atmel-mci.c:238: warning: Function parameter or member
 'dma_filter' not described in 'mci_platform_data'
Message-ID: <202607110316.sSHTf8Co-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Balamanikandan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   47e6185fd1e45b2b66f61327fe679d788e4c4161
commit: d2c6d518c21d73d96616e08a19eccd4642f4bafa [1/1] mmc: atmel-mci: move atmel MCI header file
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260711/202607110316.sSHTf8Co-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110316.sSHTf8Co-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d2c6d518c21d ("mmc: atmel-mci: move atmel MCI header file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110316.sSHTf8Co-lkp@intel.com/

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
