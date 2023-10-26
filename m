Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543FB13AF8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgLXKxPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698325655; x=1729861655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVx+YU1xT3OPg9jWM8EUEYk9KuexAe05fUIifhNOGYs=;
  b=HgLXKxPT2I1jT4JCIIduw/iPhVsccCSJ2qQ1Q5nk7yw/BEXva8W9LtD1
   5wXZZsYIy/usL5i0zYxMDtwNiRoQI810cvUAq442xV5Q+eQwo69tRSahu
   KH4xJof7YjJnmLPw8NMFYtBaTOUvK41bGTbR9a6cnA1Cz+Zb2nlu5cA6J
   0mgjOhrAED99IQbr0vQE5bfKBNGSoKCGypcg8Yrus+UGVFBnnMQWwT9to
   fwfj2BPhm+Y9H/hjKYcNf+7VTCRLIgTUXsQXVSXtzdw2SSe0OlZwWs3RY
   rW2PGlgmhXhrdCLu7Ad974bhMk7rE/TE+OW3qWYQRU70dtzBkrRPWpti8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="349925"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="349925"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 06:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="759184343"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="759184343"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Oct 2023 06:06:22 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw043-0009o2-2G;
	Thu, 26 Oct 2023 13:06:19 +0000
Date: Thu, 26 Oct 2023 21:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 13/32]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1844:26: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202310262009.vjUdzAJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   2fac67e22f6cf7c8b1261e1bc9a33de738859b89
commit: 9ec7838a91c508bba18a68f0f524379549d33db5 [13/32] wifi: brcmfmac: Add support for firmware signatures
config: i386-randconfig-063-20231026 (https://download.01.org/0day-ci/archive/20231026/202310262009.vjUdzAJW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262009.vjUdzAJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262009.vjUdzAJW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1844:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] type @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1844:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1844:26: sparse:     got unsigned int [usertype] type
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1858:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned int [assigned] [usertype] length @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1858:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1858:31: sparse:     got unsigned int [assigned] [usertype] length
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1860:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned int @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1860:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1860:31: sparse:     got unsigned int

vim +1844 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

  1836	
  1837	static int brcmf_alloc_rtlv(struct brcmf_pciedev_info *devinfo, u32 *address, u32 type, size_t length)
  1838	{
  1839		struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
  1840		u32 boundary = devinfo->ci->rambase + devinfo->fw_size +
  1841			BRCMF_BL_HEAP_START_GAP + BRCMF_BL_HEAP_SIZE;
  1842		u32 start_addr;
  1843		struct brcmf_rtlv_footer footer = {
> 1844			.magic = type,
  1845		};
  1846	
  1847		length = ALIGN(length, 4);
  1848		start_addr = *address - length - sizeof(struct brcmf_rtlv_footer);
  1849	
  1850		if (length > 0xffff || start_addr > *address || start_addr < boundary) {
  1851			brcmf_err(bus, "failed to allocate 0x%zx bytes for rTLV type 0x%x\n",
  1852				  length, type);
  1853			return -ENOMEM;
  1854		}
  1855	
  1856		/* Random seed does not use the length check code */
  1857		if (type == BRCMF_RANDOM_SEED_MAGIC)
> 1858			footer.length = length;
  1859		else
> 1860			footer.length = length | ((length ^ 0xffff) << 16);
  1861	
  1862		memcpy_toio(devinfo->tcm + *address - sizeof(struct brcmf_rtlv_footer),
  1863			    &footer, sizeof(struct brcmf_rtlv_footer));
  1864	
  1865		*address = start_addr;
  1866	
  1867		return 0;
  1868	}
  1869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
