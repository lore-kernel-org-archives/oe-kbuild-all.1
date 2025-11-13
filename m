Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF6C302769
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009606; cv=none; b=kwLzW4bkmsmIGBPw9Sco/eeazm7HwVqHDu6yoMPkA6g+o4NNxHy1iWC6nJGkA6X31k/zncj4GXyApR0G6QLB2xCNzTbK3LKJsDa6WOZGjS8EopQk6Dwyzfx+eTzgQQVO8FLQhINJjVOJFHBNaP7sx+JFWLTQDYQ+7Xe6R5ZPIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009606; c=relaxed/simple;
	bh=Sgk4sNsoPmm9DQzn3ceYNqEReekm5CzcVM4xwpOkc0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ohzmT4Lo8JwLkon3jVuU6dnrh6GHpFoc5MFd5f/nEIQ7WN+IQroDgT4kc3yaV4dfRutd4cjIFFbFCegXTWhQAdz/GMY1toAcqotC54Corko9rcFCMmKfEYc3O+nLvmql59zYEVUFAMBvLxrMdVQVJKD2gxA9/Py4L/CueFQTtvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6Rsr8U4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6Rsr8U4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009605; x=1794545605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sgk4sNsoPmm9DQzn3ceYNqEReekm5CzcVM4xwpOkc0o=;
  b=X6Rsr8U4Ci1zfjWTN+idxcMA+moVJHNkNJ4yY185qvF+RIdm8dqKwOP4
   kJwtr5Wg+JzhTHJ2m+vVcCh5DJZwhZMeDuY5ThQ+0Y4AcFePiME2jwrVI
   mF964hRT9EO9q7tDqiJ80IYVfwN7aeAI58v3ckfr+R2A60buKDHQ++Lno
   PNXN8+REmD/c+sfmX6xnvXSpFAOFn5TmrdZy0Rm1I8veiOHiugEh0dHaB
   Xa2SimfCtgztHqgNM8vBq8POj2tAouORc0I7VxAMkG2ljSMLfEkJKrCEA
   FdoCPqlsUgsgd3aY7hPL/yS1fdNVlV2P6IMdO6XAkxMb0N6PQ8rsQxsE+
   g==;
X-CSE-ConnectionGUID: Fhlv0CZzQdq6rNWpNZE4ww==
X-CSE-MsgGUID: 17RzABRcTZy32wnq0t84pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480069"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480069"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:23 -0800
X-CSE-ConnectionGUID: ABE8EZQ2SUax+nD615gsTw==
X-CSE-MsgGUID: E/QqV3EQSUSu8ZNfMYlAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415464"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004uL-1o;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [pci:for-linus 6/6] drivers/pci/quirks.c:2528:56: error:
 'quirk_disable_aspm_l0s_l1_cap' undeclared here (not in a function); did you
 mean 'quirk_disable_aspm_l0s_l1'?
Message-ID: <202511131022.oNFNddSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
head:   c478e1774359af6039f586f0a49280cfe180a21b
commit: c478e1774359af6039f586f0a49280cfe180a21b [6/6] PCI/ASPM: Avoid L0s and L1 on Hi1105 [19e5:1105] Wi-Fi
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131022.oNFNddSz-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131022.oNFNddSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131022.oNFNddSz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/quirks.c:21:
>> drivers/pci/quirks.c:2528:56: error: 'quirk_disable_aspm_l0s_l1_cap' undeclared here (not in a function); did you mean 'quirk_disable_aspm_l0s_l1'?
    2528 | DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HUAWEI, 0x1105, quirk_disable_aspm_l0s_l1_cap);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:2321:57: note: in definition of macro 'DECLARE_PCI_FIXUP_SECTION'
    2321 |                 = { vendor, device, class, class_shift, hook };
         |                                                         ^~~~
   drivers/pci/quirks.c:2528:1: note: in expansion of macro 'DECLARE_PCI_FIXUP_HEADER'
    2528 | DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HUAWEI, 0x1105, quirk_disable_aspm_l0s_l1_cap);
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +2528 drivers/pci/quirks.c

  2519	
  2520	/*
  2521	 * ASM1083/1085 PCIe-PCI bridge devices cause AER timeout errors on the
  2522	 * upstream PCIe root port when ASPM is enabled. At least L0s mode is affected;
  2523	 * disable both L0s and L1 for now to be safe.
  2524	 */
  2525	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
  2526	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
  2527	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PASEMI, 0xa002, quirk_disable_aspm_l0s_l1);
> 2528	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HUAWEI, 0x1105, quirk_disable_aspm_l0s_l1_cap);
  2529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
