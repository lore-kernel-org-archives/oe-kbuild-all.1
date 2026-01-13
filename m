Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6C73806AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299324; cv=none; b=HYgfupwsgorFQIqGN45U2R5QB0MI3nCfP2KFG+n3UtoXKcA4F86vHQV8hDhjYLQou1xbKnfZHvwkttorpf7/YGXAewLkg0Q/JfrBHgRELghIkG6LPydXRetqayBDv3iOZLhEPrONfJ/CvrCZug+hq/2HEvxy4cs62UXzlu1mQmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299324; c=relaxed/simple;
	bh=vSI78dm6bXdpvrs1636aUhelTbgIfxOHrF/rWK16mOQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Psj5JYZr/htJiDXDxQTUdBAo2Wy4WlJ/j+WnMGbSXpW4NLsSkrQsG2Nza4P6/ED7mgrz+B44jy1XsNtppxzh5/ild5KwPQxQBeZeCARM+OvYBGw6RXlzBOLTWjDM9VLII3zCp66ND5iGBiux+VnXMYUxi0f2xsIPFrPUM9C7dsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GChGUDcN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GChGUDcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768299323; x=1799835323;
  h=date:from:to:cc:subject:message-id;
  bh=vSI78dm6bXdpvrs1636aUhelTbgIfxOHrF/rWK16mOQ=;
  b=GChGUDcN3e9lVEwA+nL2tIv3AOGElpgrBsM9RkhRLEa4vUCQooXYH1z7
   z+fEUbUZjsK6Z0AxYhPDSEzhYLtKpzJMsMtulRTJPO0mSdcMNeONdIq2/
   W7wjSpN/gicT2TI9HXcRGpsc7LCfBnL3Qk2sjkfhgOUYXAi+HGRQUc4m4
   GM1H8j09DLgCdHWMpVJULNtNvjFfav09MNRWKaWo8pbaHFpWmtuG54d74
   rsymzrVPkzvS1J7sF6lK3Ml00SPVSudM2w4bMfgMeUToFD2KlihlW+HL1
   yYbj0Xn1H/sUqmjgTHi4KVqm2v8+UO70hgrktMy7V/8IkPaPEXreY1bRK
   Q==;
X-CSE-ConnectionGUID: 4nvqQNmiSOCGDXXcH+tCEQ==
X-CSE-MsgGUID: sAcQEWOpSC27nEbfOZd5SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72162932"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72162932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 02:15:22 -0800
X-CSE-ConnectionGUID: wB6H8PEkQeS/QcFVkD3kcw==
X-CSE-MsgGUID: 8Ia2s1A+S/6TXCyuVaZdEQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 02:14:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfbQJ-00000000Eae-15NZ;
	Tue, 13 Jan 2026 10:14:51 +0000
Date: Tue, 13 Jan 2026 18:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rcec 3/3] drivers/pci/pcie/rcec.c:27:22: warning:
 unused variable 'devn'
Message-ID: <202601131801.oMOuU91E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux rcec
head:   472c2e1704b7228a2f359885d64127f5500be4e6
commit: 472c2e1704b7228a2f359885d64127f5500be4e6 [3/3] PCI/RCEC: Speed up checking of Association Bitmap for RCiEPs
config: openrisc-randconfig-r072-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131801.oMOuU91E-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131801.oMOuU91E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131801.oMOuU91E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pcie/rcec.c: In function 'rcec_assoc_rciep':
>> drivers/pci/pcie/rcec.c:27:22: warning: unused variable 'devn' [-Wunused-variable]
      27 |         unsigned int devn;
         |                      ^~~~


vim +/devn +27 drivers/pci/pcie/rcec.c

507b460f814458 Sean V Kelley 2020-11-20  23  
507b460f814458 Sean V Kelley 2020-11-20  24  static bool rcec_assoc_rciep(struct pci_dev *rcec, struct pci_dev *rciep)
507b460f814458 Sean V Kelley 2020-11-20  25  {
507b460f814458 Sean V Kelley 2020-11-20  26  	unsigned long bitmap = rcec->rcec_ea->bitmap;
507b460f814458 Sean V Kelley 2020-11-20 @27  	unsigned int devn;
507b460f814458 Sean V Kelley 2020-11-20  28  
507b460f814458 Sean V Kelley 2020-11-20  29  	/* An RCiEP found on a different bus in range */
507b460f814458 Sean V Kelley 2020-11-20  30  	if (rcec->bus->number != rciep->bus->number)
507b460f814458 Sean V Kelley 2020-11-20  31  		return true;
507b460f814458 Sean V Kelley 2020-11-20  32  
507b460f814458 Sean V Kelley 2020-11-20  33  	/* Same bus, so check bitmap */
472c2e1704b722 Lukas Wunner  2026-01-13  34  	if (test_bit(PCI_SLOT(rciep->devfn), &bitmap))
507b460f814458 Sean V Kelley 2020-11-20  35  		return true;
507b460f814458 Sean V Kelley 2020-11-20  36  
507b460f814458 Sean V Kelley 2020-11-20  37  	return false;
507b460f814458 Sean V Kelley 2020-11-20  38  }
507b460f814458 Sean V Kelley 2020-11-20  39  

:::::: The code at line 27 was first introduced by commit
:::::: 507b460f814458605c47b0ed03c11e49a712fc08 PCI/ERR: Add pcie_link_rcec() to associate RCiEPs

:::::: TO: Sean V Kelley <sean.v.kelley@intel.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
