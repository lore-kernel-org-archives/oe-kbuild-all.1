Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750924AEBF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475445; cv=none; b=idxIiUalJfl5Y5tpdSWYPPeQNi/zbm4LAM1oyJel7PNPMmNX2cmf2IufjFD4t3nCtXhkSU02CbI2Xhm8XKOVN0m+IQVuzqamw5+3FH2JO6k61sI2cXTvt49voc2EvMAZAMtMUksZxr0Pj6dn28MSRbuWbnFJVKbhT7a384+2fKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475445; c=relaxed/simple;
	bh=BDL8TACKPxO8BjzCdT2GYfFjghlkml/sY4ktl6IasZc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JX85/nfc9my9IiCQjcQTD19kgaWj69eujQK8Wa8xzNM0B2XsI1lKvbt/ueF29OCZSejjxSi91o4OyAmR0ljyI1Ex83es5FvEj6U1xmw6hDEma5bD+DobCU5HK89Hxwb7Qqxf9IH9mTliIAn31b7utaVsVUJVcMcpUYyTpLcQYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f40NWoDl; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f40NWoDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789475442; x=1821011442;
  h=date:from:to:cc:subject:message-id;
  bh=BDL8TACKPxO8BjzCdT2GYfFjghlkml/sY4ktl6IasZc=;
  b=f40NWoDljofyRZCKDGLBtAjTGSkjAeBdmbHe8c9AHdUYP8hEDYJq0hY8
   KQxdY2f6OA6Uc1xTs4oIyf8k6r8mRxAnqn2zSmGA/xrOhbfJjyC3reVzE
   9eMRhhSARD+uEHD9lYtd4jjIiPONqHhUqlkiSVBrJjUyEdMWYsWjor4+W
   b9n6uuwiKAIaRSNVzVxFx8CVuSzPvPB/SIFwiMdoiJElLvNLKNy8jY1MG
   8dLbnbgshWyqpAzdE4/IknJPbraUVujMAld3C3OqCeCQAemhlA1CoBRSz
   ZkIXVeDOYW7e6BC8xijNA9FGVmuZaonnRK8k65GE/toGAvmBNH2RL2CuU
   Q==;
X-CSE-ConnectionGUID: iwl6KkH7QDCbGiWZ+UHvhQ==
X-CSE-MsgGUID: UY3l2F5eTC2xdxXn1i0zMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88774304"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88774304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 05:30:42 -0700
X-CSE-ConnectionGUID: 7LB5WXVbTmmQx8KvWB0rjQ==
X-CSE-MsgGUID: X6CylTopQQm+BV/ePufoLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273535112"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2026 05:30:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6SJ4-000000004Vx-00EU;
	Tue, 15 Sep 2026 12:30:38 +0000
Date: Tue, 15 Sep 2026 20:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 27/46]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1943:31: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202609152028.q1oQtDLT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   423344419b5ba83783b44e2531fe2b32de9e4f42
commit: 87e5b19fce33244883f60e501657c17d6a8bbba5 [27/46] [brcmfmac] Finish firmware mem map, fix heap start calculation bug.
config: x86_64-randconfig-123-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152028.q1oQtDLT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152028.q1oQtDLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152028.q1oQtDLT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1929:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] type @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1929:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1929:26: sparse:     got unsigned int [usertype] type
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1943:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned int [assigned] [usertype] length @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1943:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1943:31: sparse:     got unsigned int [assigned] [usertype] length
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1945:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1945:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1945:31: sparse:     got unsigned int

vim +1943 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1920  
87e5b19fce3324 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1921  static int brcmf_alloc_rtlv(struct brcmf_pciedev_info *devinfo, u32 *address, u32 type, u32 length)
316f790ebcf94b drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Duoming Zhou   2024-03-06  1922  {
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1923  	struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
87e5b19fce3324 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1924  	u32 fw_top = devinfo->ci->rambase + devinfo->fw_size;
87e5b19fce3324 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1925  	u32 ram_start = ALIGN(fw_top + BRCMF_BL_HEAP_START_GAP, 4);
87e5b19fce3324 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1926  	u32 ram_end = ram_start + BRCMF_BL_HEAP_SIZE;
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1927  	u32 start_addr;
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1928  	struct brcmf_rtlv_footer footer = {
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1929  		.magic = type,
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1930  	};
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1931  
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1932  	length = ALIGN(length, 4);
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1933  	start_addr = *address - length - sizeof(struct brcmf_rtlv_footer);
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1934  
87e5b19fce3324 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1935  	if (length > 0xffff || start_addr > *address || start_addr < ram_end) {
87e5b19fce3324 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1936  		brcmf_err(bus, "failed to allocate 0x%x bytes for rTLV type 0x%x\n",
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1937  			  length, type);
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1938  		return -ENOMEM;
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1939  	}
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1940  
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1941  	/* Random seed does not use the length check code */
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1942  	if (type == BRCMF_RANDOM_SEED_MAGIC)
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03 @1943  		footer.length = length;
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1944  	else
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03 @1945  		footer.length = length | ((length ^ 0xffff) << 16);
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1946  
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1947  	memcpy_toio(devinfo->tcm + *address - sizeof(struct brcmf_rtlv_footer),
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1948  		    &footer, sizeof(struct brcmf_rtlv_footer));
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1949  
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1950  	*address = start_addr;
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1951  
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1952  	return 0;
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1953  }
fdbc756a8088c6 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1954  

:::::: The code at line 1943 was first introduced by commit
:::::: fdbc756a8088c6478bd20f35925a99ad6737e93e wifi: brcmfmac: Add support for firmware signatures

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
