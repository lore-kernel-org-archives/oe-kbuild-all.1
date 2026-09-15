Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2A2414A11
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469225; cv=none; b=hipAmKUAVU31iOVilkjia2CCCGfpNAOVISHxdi1FnDiohJuqejwkWHdNBAzN+Z/LdnoXhB7XtL/y3SRJXgpnA98JLZSx+jA5x6u5t2Yf4F+I0P8FPoDwzdxeUjvaglCR+SgpjGo3M7z+KOvzV8ZGoMIXfmkCOSSahLQOXGDX0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469225; c=relaxed/simple;
	bh=o+CzpqGsYsUB2D3JWVKNy2hvC7d47xKuRzpXkYkF0s4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kcitTgJ7CJoRGMoTZdj34o9tMDWR+nDEVqbivawgu7jYvhaKxx7M9WtxJoVr6WJYy3Xxq9/tyhJlDwno1bWMDKE9CZiHMW2MF+IpKhtKW8a1DKAArN5bSsD75oGbfvibfISNmXITeU7NtY78SZ4kJVeRxSbSkbvWa3t2xcw7GP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DE2D0kXQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DE2D0kXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789469222; x=1821005222;
  h=date:from:to:cc:subject:message-id;
  bh=o+CzpqGsYsUB2D3JWVKNy2hvC7d47xKuRzpXkYkF0s4=;
  b=DE2D0kXQMucwDHsZNzRyMtiqBodG8GANjkgsj9Q8zg7UV1AXn2SMbU3U
   VmZM29SZkLIPVvv2Hz3Flt1ylbWrhsX2zj6IGnNaoFpPHXSJ8aMJbatLU
   Ji2QyVmzK0ZEoKITedmEOVi6wzpj0Thuuef/E0SjhMJyKVUD9vtUYh4ra
   2OXdxpcpD5t+mpP2IpK6bmirwAio1qaQgMoR9Cbe+JEpEaZ69pVEzjCmh
   v/fKvnoVmWK5tKJUaVhl5QfYBUpo9sewi4DaodXP1aGlGo9Qvx2AGksZ/
   elfnz34MlalI062h7nLR7IXC7gCHa1M31IJx8LjPMwGfhQSUpXBEVSxC6
   w==;
X-CSE-ConnectionGUID: iTiDCEYoQJetl8jLHxAbIw==
X-CSE-MsgGUID: etWEM9FTSR6QGgxei24JzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100492325"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100492325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:47:01 -0700
X-CSE-ConnectionGUID: 2MFCJfRySDegqTgPlyT8Jg==
X-CSE-MsgGUID: vMf9scUGStugIe0wWFZHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272943765"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Sep 2026 03:47:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6Qgj-000000004QH-1xxY;
	Tue, 15 Sep 2026 10:46:57 +0000
Date: Tue, 15 Sep 2026 18:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 12/46]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1850:26: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202609151828.yif5ULxO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   423344419b5ba83783b44e2531fe2b32de9e4f42
commit: fdbc756a8088c6478bd20f35925a99ad6737e93e [12/46] wifi: brcmfmac: Add support for firmware signatures
config: x86_64-randconfig-123-20260915 (https://download.01.org/0day-ci/archive/20260915/202609151828.yif5ULxO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151828.yif5ULxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151828.yif5ULxO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1850:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] type @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1850:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1850:26: sparse:     got unsigned int [usertype] type
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1864:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned long [assigned] [usertype] length @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1864:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1864:31: sparse:     got unsigned long [assigned] [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1866:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned long @@
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1866:31: sparse:     expected restricted __le32 [usertype] length
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c:1866:31: sparse:     got unsigned long

vim +1850 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c

  1842	
  1843	static int brcmf_alloc_rtlv(struct brcmf_pciedev_info *devinfo, u32 *address, u32 type, size_t length)
  1844	{
  1845		struct brcmf_bus *bus = dev_get_drvdata(&devinfo->pdev->dev);
  1846		u32 boundary = devinfo->ci->rambase + devinfo->fw_size +
  1847			BRCMF_BL_HEAP_START_GAP + BRCMF_BL_HEAP_SIZE;
  1848		u32 start_addr;
  1849		struct brcmf_rtlv_footer footer = {
> 1850			.magic = type,
  1851		};
  1852	
  1853		length = ALIGN(length, 4);
  1854		start_addr = *address - length - sizeof(struct brcmf_rtlv_footer);
  1855	
  1856		if (length > 0xffff || start_addr > *address || start_addr < boundary) {
  1857			brcmf_err(bus, "failed to allocate 0x%zx bytes for rTLV type 0x%x\n",
  1858				  length, type);
  1859			return -ENOMEM;
  1860		}
  1861	
  1862		/* Random seed does not use the length check code */
  1863		if (type == BRCMF_RANDOM_SEED_MAGIC)
  1864			footer.length = length;
  1865		else
  1866			footer.length = length | ((length ^ 0xffff) << 16);
  1867	
  1868		memcpy_toio(devinfo->tcm + *address - sizeof(struct brcmf_rtlv_footer),
  1869			    &footer, sizeof(struct brcmf_rtlv_footer));
  1870	
  1871		*address = start_addr;
  1872	
  1873		return 0;
  1874	}
  1875	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
