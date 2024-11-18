Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E671E570B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731959855; cv=none; b=utiQrzQ0x+rjOAx3B6VW5Wf0EVeQlvphFPrR+mLfBQ6+7hUD38RfmAIhbjFU5sdWLJ1uYm0+c1aeABw6kZGkcP0b2nDyepLgrllAgCQ+G0x6teAFZ5wegfz0dJX5eHC5ywhntcpaZorsNQaXznGCEZmDwYjQjUaVnqi45lWRGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731959855; c=relaxed/simple;
	bh=U0mgOFZ/Jpq/n0ZxH58NcJg8SHsAEJ+NPFA192HmUK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXvtsmG2/4cAOdtDfFo4qIOu9e9qw3MfYrNhNXi9k6Hv3i/8QwvbUktsOwTgqkqLNnkzKKRYQiktKNONh8jl2ZRXLHreOPOIu0j32+4dFSxHEnZFWKQqEiYT3hU7OSEX8cmmhz9BNEaeSWmRGod5FS0vZDAT2COH8JX9SkdiW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMAWth+E; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMAWth+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731959853; x=1763495853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U0mgOFZ/Jpq/n0ZxH58NcJg8SHsAEJ+NPFA192HmUK8=;
  b=jMAWth+EOPrcboilVqluR+4xd+4hy5qJVRhlu3+qn0vPgEbFFm1cuIF5
   En6NWtIsjk3B94b0dRAs6xo41GAyBMgqpXEWnPz1rsSzltmAu52yum/AF
   hT575ThrSwtqoa3QcGss03cQl0f5cWuBB5Xyn5KkBm0ArPY9fLo8+scjs
   HPctRggOTk3wLjZf897+oCzru/FjPBlu578EU598d7DNrOstogz+2LII3
   /xD8DKLArublDAbYuR9SYtvlPQfW4CHeNkUrUz4NTOt8NYZWe9Pj1Cdmj
   2vegkp9ZXHvc6UB+HFkTIEz9ZvzYQ6Ayrg/lrxDA2ZNBkPmIPYBCgzyCh
   Q==;
X-CSE-ConnectionGUID: yZZe5WTvQKuxYF6OSMN0Rg==
X-CSE-MsgGUID: cMva7NPSRxOzqOFNIyIBIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42574876"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="42574876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:57:31 -0800
X-CSE-ConnectionGUID: i95WUlZcSxGRq1iNKYFmAg==
X-CSE-MsgGUID: bdfRgmArSk+j0aeKAT71ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89731633"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2024 11:57:18 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7s2-0002cX-2Y;
	Mon, 18 Nov 2024 19:57:14 +0000
Date: Tue, 19 Nov 2024 03:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 48/48]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1918:26: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202411190318.4SsyPQMT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   bae8b9b1d3b8c3fc9e9e35e1b0656cc5bcdae6ec
commit: bae8b9b1d3b8c3fc9e9e35e1b0656cc5bcdae6ec [48/48] fixup! wifi: brcmfmac: Add support for firmware signatures
config: riscv-randconfig-r113-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190318.4SsyPQMT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241119/202411190318.4SsyPQMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190318.4SsyPQMT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1918:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] type @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1918:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1918:26: sparse:     got unsigned int [usertype] type
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1932:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned int [assigned] [usertype] length @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1932:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1932:31: sparse:     got unsigned int [assigned] [usertype] length
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1934:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1934:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1934:31: sparse:     got unsigned int

vim +1918 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

9e37f045d5e7f3 drivers/net/wireless/brcm80211/brcmfmac/pcie.c          Hante Meuleman 2014-07-30  1909  
3de6af5d47ce46 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1910  static int brcmf_alloc_rtlv(struct brcmf_pciedev_info *devinfo, u32 *address, u32 type, u32 length)
316f790ebcf94b drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Duoming Zhou   2024-03-06  1911  {
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1912  	struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
3de6af5d47ce46 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1913  	u32 fw_top = devinfo->ci->rambase + devinfo->fw_size;
3de6af5d47ce46 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1914  	u32 ram_start = ALIGN(fw_top + BRCMF_BL_HEAP_START_GAP, 4);
3de6af5d47ce46 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1915  	u32 ram_end = ram_start + BRCMF_BL_HEAP_SIZE;
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1916  	u32 start_addr;
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1917  	struct brcmf_rtlv_footer footer = {
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03 @1918  		.magic = type,
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1919  	};
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1920  
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1921  	length = ALIGN(length, 4);
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1922  	start_addr = *address - length - sizeof(struct brcmf_rtlv_footer);
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1923  
3de6af5d47ce46 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1924  	if (length > 0xffff || start_addr > *address || start_addr < ram_end) {
3de6af5d47ce46 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Daniel Berlin  2023-10-24  1925  		brcmf_err(bus, "failed to allocate 0x%x bytes for rTLV type 0x%x\n",
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1926  			  length, type);
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1927  		return -ENOMEM;
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1928  	}
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1929  
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1930  	/* Random seed does not use the length check code */
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1931  	if (type == BRCMF_RANDOM_SEED_MAGIC)
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03 @1932  		footer.length = length;
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1933  	else
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03 @1934  		footer.length = length | ((length ^ 0xffff) << 16);
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1935  
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1936  	memcpy_toio(devinfo->tcm + *address - sizeof(struct brcmf_rtlv_footer),
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1937  		    &footer, sizeof(struct brcmf_rtlv_footer));
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1938  
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1939  	*address = start_addr;
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1940  
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1941  	return 0;
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1942  }
ee746f4d98b1d0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c Hector Martin  2023-10-03  1943  

:::::: The code at line 1918 was first introduced by commit
:::::: ee746f4d98b1d0a23cf050e15084f6dd03a743e2 wifi: brcmfmac: Add support for firmware signatures

:::::: TO: Hector Martin <marcan@marcan.st>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
