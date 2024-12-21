Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E42A59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734802271; cv=none; b=MPUP7Fici8Fm8iKebVHuiaUgikWVViDblZObd+4poqo2Ja3/GCqA7vIxJ33IyPDfXoFyfVG2i+2Mv1MqblME2PGx1rBOU9KH3kK4GrA25XHDpEkyMzrNcN5W3tPZS18PGhhwYxqiXc7DoqJmlEmBzouWQGTkyNF2wHGB7SZy4Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734802271; c=relaxed/simple;
	bh=1ZNUGOOm2CmubW3DDxrWwmCB4xJH7hjCs1SHmAuVpbk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b90AlQF17Gse9oGREnffyw3k5MpV5c/U0hg7WUJBsX4urmz9P8hWtyve7hpQVSc0yQmrD9uEhl//OdbLE3wHsy2LEN6WWMdSHALwymdPpW6+I3MQI9/WVJfiyqL1hC9sgVHFVZ7oqJKNjsTbnRxx3U5Es6bzNDv/nb0wNOeynZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RcHPGuB1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RcHPGuB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734802269; x=1766338269;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1ZNUGOOm2CmubW3DDxrWwmCB4xJH7hjCs1SHmAuVpbk=;
  b=RcHPGuB1m4HDfJoISxTdeT4O7bkNUBoUhCSmrlZfVIU4I5aS6fb6dXRt
   IuNFnuCZJ6oV/2qiZECVg5aFz3kNi1SfORZQGN++5+xJ7DelySpD9yom4
   2CpExX4IM3DRSSKUDVSUA9MbaalM/28j/z4GhFvjpnH80bsHdD5I6kmp8
   6e+/x8EWIHfrk7Y7dpU1mwqjmH54T9+BnKXDPDE59jLWZNPld5JaWYd/c
   9De+nSALXvaZcjONHIS7VU2BWQw1oq900OWYetPJ/b1EzRQ0P7Xxt2pdb
   wOj676491F2SbzQGTTf8wbAI6LvujM9Rl7X/R7dv5N1mfW0mYyA4vHD0x
   g==;
X-CSE-ConnectionGUID: 6xhhPndwTp+8I5+v/hTY3Q==
X-CSE-MsgGUID: 7YZgv6bfT9CDa3tE7h92Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="57796914"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="57796914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 09:31:08 -0800
X-CSE-ConnectionGUID: lBamMNmRSkqxRhKFhIkXlw==
X-CSE-MsgGUID: huO+aaWsTzWVToZugOKDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122092748"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 09:31:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP3Jg-0002LX-2J;
	Sat, 21 Dec 2024 17:31:04 +0000
Date: Sun, 22 Dec 2024 01:30:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.12/linux 1/9]
 drivers/bus/mhi/host/pci_generic.c:435:38: warning: 'mhi_foxconn_sdx55_info'
 defined but not used
Message-ID: <202412220156.JZXjR3Br-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: 4ee10246e0dd22818f20b3812c5ca74b3f0a1148 [1/9] Revert "bus: mhi: host: pci_generic: add support for sc8280xp-crd SDX55 variant"
config: x86_64-buildonly-randconfig-005-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220156.JZXjR3Br-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220156.JZXjR3Br-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220156.JZXjR3Br-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pci_generic.c:435:38: warning: 'mhi_foxconn_sdx55_info' defined but not used [-Wunused-const-variable=]
     435 | static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~


vim +/mhi_foxconn_sdx55_info +435 drivers/bus/mhi/host/pci_generic.c

bf30a75e6e0001c Slark Xiao            2024-07-01  434  
f08d4bdad612dcf Manivannan Sadhasivam 2024-06-26 @435  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
f08d4bdad612dcf Manivannan Sadhasivam 2024-06-26  436  	.name = "foxconn-sdx55",
a7bc66fe8093b48 Slark Xiao            2024-07-25  437  	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
84a5ae5b23ba632 Slark Xiao            2024-07-25  438  	.edl_trigger = true,
c2dbd34f6a9558b Slark Xiao            2023-03-29  439  	.config = &modem_foxconn_sdx55_config,
c2dbd34f6a9558b Slark Xiao            2023-03-29  440  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
c2dbd34f6a9558b Slark Xiao            2023-03-29  441  	.dma_data_width = 32,
c2dbd34f6a9558b Slark Xiao            2023-03-29  442  	.mru_default = 32768,
c2dbd34f6a9558b Slark Xiao            2023-03-29  443  	.sideband_wake = false,
c2dbd34f6a9558b Slark Xiao            2023-03-29  444  };
c2dbd34f6a9558b Slark Xiao            2023-03-29  445  

:::::: The code at line 435 was first introduced by commit
:::::: f08d4bdad612dcff6827f8cd2b20f13413c392d3 bus: mhi: host: pci_generic: Use unique 'mhi_pci_dev_info' for product families

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
