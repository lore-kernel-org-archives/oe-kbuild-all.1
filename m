Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601C372070
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783704363; cv=none; b=NsljwxXpNOKX7+s7eDdFuMesD2k0BAFzFhNU3Hnd7Amm/hbjrBh5Tw/A8FuTP2NgZXPfL3yWt+c4jdBRNqCSHOuM7My8GSwkjiLw3LkyQjwaS07jrgdJ0Vq6Kx/LcKJrvY/HOuyI1b6OUteNqIr30hax4sldq0HCy+2fZOS/kDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783704363; c=relaxed/simple;
	bh=OPdG3Zk+vqHTP2DNXMqVIDgMpNYiXw7/iyII2yokS3w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5DcpaazLP6LbOlFFGUjuqCQZAV7G8e4EGG0ONWmGIz67gTQW3K92Z8N2B+VL8qqcsybtaIoFMeb/WYSbOR6ly7PvJiws5p/tO+4oBIaFYr+boJdgR/KbBrw1FtLmzabjth3O5xqM0is5u5xubJbdqSNYEUQ3sKfEXeMWZgxrjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpSNIVPQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpSNIVPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783704359; x=1815240359;
  h=date:from:to:cc:subject:message-id;
  bh=OPdG3Zk+vqHTP2DNXMqVIDgMpNYiXw7/iyII2yokS3w=;
  b=HpSNIVPQLdRrLGtjyYNXEq81YJJksnuCLS6jpQLUnO0ZkbapFQ5/hAIS
   jVGJIyhSZ3kSmtyWSezB4RVS1LPpg+urAy+HEPnMMirZAfHy4xyphuXEJ
   vNsZ+D6rr6sAOWRAvmHTwFsYUuvYi1jjvyngzXdh2d4HXUUvKaEO3NqxM
   Zbco8s98guYbOD1Y5TneGH186dCddehJ2Drg/cf8fNoudYwP4+OCJDT9z
   fJe2z2wko6r6sGv3uplw7ODr9NoWHTDhPCv+n4gMYUw15kBmRVybqSkyj
   UQFyoxkeRqARUI5HRnyjKREHxtiXaKNAotRr0ozp1VdK7jqETw8Lb2iOw
   g==;
X-CSE-ConnectionGUID: gxe89FKsTUOFJHSNUDrVew==
X-CSE-MsgGUID: kBIo1BtBRriviVCkk26N5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83386406"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83386406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:25:55 -0700
X-CSE-ConnectionGUID: 40vrg3QFSfGrOFQGDDpAzA==
X-CSE-MsgGUID: T3i1yCa/R2qT7wKD8BfxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253204448"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 10 Jul 2026 10:25:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiEz2-00000000JBB-096s;
	Fri, 10 Jul 2026 17:25:52 +0000
Date: Sat, 11 Jul 2026 01:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:anfe_v1 /5] drivers/pci/pcie/aer.c:1304:3: error: too
 few arguments to function 'pcie_read_tlp_log'
Message-ID: <202607110118.5mw5tbB3-lkp@intel.com>
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
config: sparc-randconfig-r073-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110118.5mw5tbB3-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110118.5mw5tbB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110118.5mw5tbB3-lkp@intel.com/

Note: the l1k/anfe_v1 HEAD f15ae58edfcc50e3200b605a83bf295e556532bb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/pci/pcie/aer.c: In function 'aer_get_uncor_info':
>> drivers/pci/pcie/aer.c:1304:3: error: too few arguments to function 'pcie_read_tlp_log'
      pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
      ^~~~~~~~~~~~~~~~~
   In file included from drivers/pci/pcie/aer.c:38:
   drivers/pci/pcie/../pci.h:864:5: note: declared here
    int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
        ^~~~~~~~~~~~~~~~~


vim +/pcie_read_tlp_log +1304 drivers/pci/pcie/aer.c

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
> 1304			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG,
  1305					  aer + PCI_ERR_PREFIX_LOG,
  1306					  aercc & PCI_ERR_CAP_TLP_LOG_FLIT,
  1307					  &info->tlp);
  1308		}
  1309	}
  1310	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
