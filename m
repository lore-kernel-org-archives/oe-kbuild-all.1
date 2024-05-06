Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FCB1DA3A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 06:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977061; cv=none; b=dtXaZNFt4nlDSPqgLQ0DZICoSyeiVpYL2SFknKxiJF29k8gppEUJe3MUR1dIGz4gWcS9ixNi4+7MODz4SBBlDBd11Qzr7KJVe7G14VMnG8JVb0znjUvfDaY1qHvRwCo7zC+KiCLA8dsljIXE7nEyRS+H20oKKOa84l85+KX+ThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977061; c=relaxed/simple;
	bh=Pbj9OTCcYhyjQVDlPTVnxW1Kw3JnegvuiuQ9XbD3Vb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYJS8+qhBG4Vkh0L/uxCcGlX3tbI8UMbhtjvbTBUpVr5C+Hlkfk9xm9WiKXTWkU6sTnq1Kocu5ea+dj7g4Rzpzl9Cs+LKG3wpKazLinWOj7W+fFZtSrGN4p3TpxwRLaxbI1/Dw4DKTLqtZMZRvY6oD6nOs1KXSnsXfbj5lopnc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CO37DFLf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CO37DFLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714977061; x=1746513061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pbj9OTCcYhyjQVDlPTVnxW1Kw3JnegvuiuQ9XbD3Vb0=;
  b=CO37DFLfmOhzDUQ5x7Le4Po4RPpb6g+xMt5mUTMYMrEfJdMcApc55CZE
   IP174Cz1Jl+8yEGkEv++bp+VxeEguHXFSpn80Qb9uPVxUzFBhMxPmNb8P
   80zrCyaKOXxqj0++zEx3iDoDPDTQP6rCrOHfEkCAAenoVk4iqjPstHWU4
   ca4BFvyM8kvSEomzJ1lpFOZk7uuvGzTsz0G3vBeAk6gaUJzr6Oxk5oHSy
   Lz/v9qinethEsInKQHeyNfDLbOG28hkkHdQ1Wy8pc9wd1leL1QZ8EX2wJ
   gfn/znSHFRa272CUhr1wgNvpWoPWgEhhoDK3Cz9jDp2RJb/UvmsPaFVsu
   w==;
X-CSE-ConnectionGUID: u8bjxYYhTAGePTxZujRQhA==
X-CSE-MsgGUID: NielEj8qTkW4l0qJ+N6R5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21264145"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="21264145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 23:31:00 -0700
X-CSE-ConnectionGUID: VGveWpWZSLqorsGqroifSw==
X-CSE-MsgGUID: 4g/xDwLqTrCVSp/TtPxQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="32577367"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2024 23:30:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3rsG-0000Vt-2Q;
	Mon, 06 May 2024 06:30:56 +0000
Date: Mon, 6 May 2024 14:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 11733/30000] ld.lld: error: undefined
 symbol: rtl8366rb_variant
Message-ID: <202405061400.0BOitWJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: b8ddf8c31ea1e949da35486b6ac498d0a6bd58d2 [11733/30000] net: dsa: realtek: convert subdrivers into modules
config: riscv-randconfig-001-20240505 (https://download.01.org/0day-ci/archive/20240506/202405061400.0BOitWJj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061400.0BOitWJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061400.0BOitWJj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rtl8366rb_variant
   >>> referenced by realtek-smi.c
   >>>               net/dsa/realtek/realtek-smi.o:(realtek_smi_of_match) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
