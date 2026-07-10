Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E6425CFF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688516; cv=none; b=FHphx79pCD7FWkeJ9W0qrYU/1xDLKGBBGsjtcqFKcgmefDmYCANwJTEUjbrqSIAqRcNGhvuLa+DpqqXuRDMjVhbAmkA440Cwx3aVOgq7vnz3KHp3sJ0FQWFdoByunWgDNvycT+1chziK9PYfC/cVfZEDNMQ6fxTfeZbFVuPT260=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688516; c=relaxed/simple;
	bh=/vjAAtdWwgqzRRi2nD2qZx+CgqhC0NdXU8SCOJylFhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ovn+F8beJgjal+pngQOYYgfNwJ3kX/rsZneaGVMVwFdyNXTA+IR6s8Wrczbn9/L6Tw2j26ovIiCVgq6C93rMMqZK8T/F4zpQLhl8mOI6I3nW85b/hMCE49zRgjb9kYes/xxqUBmA7BxWb3u7qgFNNk6UFQnk7dmp84iYqHyLvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgdlrTnZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgdlrTnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783688515; x=1815224515;
  h=date:from:to:cc:subject:message-id;
  bh=/vjAAtdWwgqzRRi2nD2qZx+CgqhC0NdXU8SCOJylFhI=;
  b=AgdlrTnZ1rQzdvX8HoPLkINrFABV+Ac3qTrj11aZBH7crfH2icToJqb+
   TcTC28S49VmJyj+NjEssXCR00Eh9FRg7KeDouYkiNS03RJ3FLPEKM+Duh
   PtnyiQLLm/XF18HdGorzrydgPOjyUB94C7EX6jCS4NS8Gmz3qSnqL76jv
   Xl/QtLiWSn5kwRTKAJKx4Y/aEmKf8KCYBZb9dbuO95+1EUdIIO+o1URqy
   IiH5Zq2p4Z44fe9AIDeVhJIz/X6S8VObrbin2wb4KRzosUxnAugOU8BJ/
   QX7p8tBCxa2gpZq41ubnY2zmRA8Sq+A5gVBxyBHJmDmb/+WMUZ+Lio1GH
   A==;
X-CSE-ConnectionGUID: G7MHXgvsQzSOiCcme3bhQQ==
X-CSE-MsgGUID: yMGuSNKaQeKU5nw0xpFcQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95899781"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95899781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:01:55 -0700
X-CSE-ConnectionGUID: 9L4OKD8nQI2mPwHw+NM5Dg==
X-CSE-MsgGUID: UJr4CfS4QqKGnwapd41xGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256816461"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2026 06:01:52 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiArW-000000003A5-3kg3;
	Fri, 10 Jul 2026 13:01:50 +0000
Date: Fri, 10 Jul 2026 15:01:14 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:anfe_v1 4/5] drivers/pci/pcie/aer.c:1307:17: error: too
 few arguments to function call, expected 6, have 5
Message-ID: <202607101441.xJoFjopW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lukas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux anfe_v1
head:   f6644604bbe576e7631c5adf41f197f8e9cb5780
commit: 29e8cfead5a6747a5ad5f5846f1e286fe3ec7e86 [4/5] PCI/AER: Move retrieval of FEP and TLP Log into helper
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260710/202607101441.xJoFjopW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101441.xJoFjopW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101441.xJoFjopW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pcie/aer.c:1307:17: error: too few arguments to function call, expected 6, have 5
    1304 |                 pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
         |                 ~~~~~~~~~~~~~~~~~
    1305 |                                   aer + PCI_ERR_PREFIX_LOG,
    1306 |                                   aercc & PCI_ERR_CAP_TLP_LOG_FLIT,
    1307 |                                   &info->tlp);
         |                                             ^
   drivers/pci/pcie/../pci.h:864:5: note: 'pcie_read_tlp_log' declared here
     864 | int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
         |     ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     865 |                       unsigned int tlp_len, bool flit,
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     866 |                       struct pcie_tlp_log *log);
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1307 drivers/pci/pcie/aer.c

  1290	
  1291	static void aer_get_uncor_info(struct pci_dev *dev, struct aer_err_info *info,
  1292				       u32 status)
  1293	{
  1294		u16 aer = dev->aer_cap;
  1295		u32 aercc;
  1296	
  1297		/* Get First Error Pointer */
  1298		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
  1299		info->first_error = PCI_ERR_CAP_FEP(aercc);
  1300	
  1301		/* Get TLP Prefix/Header Log */
  1302		if (tlp_header_logged(status, aercc)) {
  1303			info->tlp_header_valid = 1;
  1304			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
  1305					  aer + PCI_ERR_PREFIX_LOG,
  1306					  aercc & PCI_ERR_CAP_TLP_LOG_FLIT,
> 1307					  &info->tlp);
  1308		}
  1309	}
  1310	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
