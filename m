Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A020E36EAAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703697; cv=none; b=J2v23oGlto5oEUKElQL/7HsVw2eRlUNqQ1O+j33dRD+C+hk7LEjvP63zHkux/rjeoipQdllwOzNACuaOLcMWgeYBvboYKjp3w6JnfJ/rpdqUvv+9RJhmNvWaPHgwrBqS25gPe105ByyFlfdFilOLpOKihBkAu62q5eZS/vaddak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703697; c=relaxed/simple;
	bh=G2Um9OxP7k1+j96+55KUbOuC99sIt+xphTIOI5G7A+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tGjoyfJMGqZ62dENb/XY7E4mSj419cLSAj/BOjpHxQdF1cERSQ9Zujj/JnR8QjKhhfGO+gBAW+KCD394A/M59nyIkrN6g7RUzxKEJPprtPy13USflTeqdIR1hwUU6/cVAq/eu76BDrNDmwD8LzhBic5O5bSNmBqvU6NNgkNXrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6eB3PZA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6eB3PZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783703695; x=1815239695;
  h=date:from:to:cc:subject:message-id;
  bh=G2Um9OxP7k1+j96+55KUbOuC99sIt+xphTIOI5G7A+k=;
  b=n6eB3PZADZBwcMybXVGdGvShXkhh3yvp1obudH3re/E/AvZmn7YsRSms
   Zz35nH/9oOIEiAowMrox0YluJEyrqTYBFcbuuTVaNGrYHNLVHE0J5/x8Z
   jGGIBzvlKQL4GxFwPivQSv4XgyJDF11uOiF/15Nk90JmdIk+h+cY98rb/
   zm5oZMWivCIMzWohCJuEqGeCJ6mjwsZfFaZrOx/KGUJpKaR2wy/zN0BUL
   WyptQw82QK5+9MgAIE6ncHbwmx4NCvtzdcWk6wAAUQsILJr8dKR88GFze
   ttVQumcsUrCrlirGV/1b0+oBj0QsxUHOdAUnH93BdpmgQGO5mnIIoJmO7
   A==;
X-CSE-ConnectionGUID: AG8OYYZnTT6VkodwmfzpDA==
X-CSE-MsgGUID: 6bkMrXanRJqNO+Wc0T092w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101956406"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101956406"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:14:55 -0700
X-CSE-ConnectionGUID: EU07YymkRtOxfxbUGxPZrQ==
X-CSE-MsgGUID: eNyf3Uy8TM6qlzGxnlrfgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248565281"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jul 2026 10:14:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiEoN-00000000J9x-24N7;
	Fri, 10 Jul 2026 17:14:51 +0000
Date: Sat, 11 Jul 2026 01:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:anfe_v1 /5] drivers/pci/pcie/aer.c:1307:17: error: too
 few arguments to function call, expected 6, have 5
Message-ID: <202607110138.TRmMYqFO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lukas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/l1k/linux anfe_v1
head:   f15ae58edfcc50e3200b605a83bf295e556532bb
commit: 29e8cfead5a6747a5ad5f5846f1e286fe3ec7e86 [/5] PCI/AER: Move retrieval of FEP and TLP Log into helper
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260711/202607110138.TRmMYqFO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110138.TRmMYqFO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110138.TRmMYqFO-lkp@intel.com/

Note: the l1k/anfe_v1 HEAD f15ae58edfcc50e3200b605a83bf295e556532bb builds fine.
      It only hurts bisectability.

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
