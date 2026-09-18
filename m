Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7334B1A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692086; cv=none; b=P7Qcf5JgBsZqA2z4heRTHtVaJNe0VpGTpTVpCNx6wfLgd5TOfoCCpudlCBQfKSX/1tlTDS6hKJ3VCRoX2mSNbDEy/4nWB/Cgarr9S9qSpdKIQfKuhlV6Tm7ukPKwuzz6qGdwNpr3PqpSx0gAfEXubVaaOrYC/Z90VgnUD8iEG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692086; c=relaxed/simple;
	bh=SGwKg3DaPPDodzlgqpxFkyZRjS8r6Ag/JHw/IGvHKPs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BJmZdWY6Gh8ivXDlZD65kcKqyUBEC/vxmZpE2TIKvlfeL03l8z/NnOMZg+/yV6Rq0KRwzutXmu6JbuCLL91q35ygfQnwDzJzmUCCZiYutkU2H1b6/EFq/YRyFm52+VsVu/5H/+KPggyKmbFDgEovjib3lZFlFKGQPujtmZ4BP60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBlJ+UeL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBlJ+UeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789692084; x=1821228084;
  h=date:from:to:cc:subject:message-id;
  bh=SGwKg3DaPPDodzlgqpxFkyZRjS8r6Ag/JHw/IGvHKPs=;
  b=VBlJ+UeLDt4ltQY9vIrgBVfyQnl3iiVamNUT7fSITDrSk7wMSCyqlWiD
   TVCGQU7GJoexeEHb0jyBpHn8pM8c3Tq68PTliS30ZFqHrH9GnkugGGXxM
   CCcvjQ0j1fyhZPRie7xrQ/YUi9uLzx4v0MHNai884lhOHPDjtWh/es3VX
   fmA0eGXZn5ZfMen58MxtQSDE4zEob97nHqMib+DA6sIa3cmbqnEzhQxKY
   s0NWGnhLbYSYSqfFVvNPh8tn3mapf+/rkZlR20JadZjArSQI4z8qzyDue
   4vF6jt6bLBFpRv8w32Dsmj1gQHuVo+ltkdwE7JaVO+7A694Fu64pwx9A3
   g==;
X-CSE-ConnectionGUID: Xua99q3MShS5uDtefa88qg==
X-CSE-MsgGUID: 5H2eVsn6Rv+u4Lf9AFqL2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92677415"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92677415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 17:41:22 -0700
X-CSE-ConnectionGUID: BT19CYMnSWe3TcOLSLAXMg==
X-CSE-MsgGUID: EoHqP5mARb2ziZ+KoqQNCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269825988"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2026 17:41:21 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7MfH-000000000sO-10Mg;
	Fri, 18 Sep 2026 00:41:19 +0000
Date: Fri, 18 Sep 2026 02:40:26 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_baseline_v1 7/7] drivers/pci/pcie/aer.c:264:12:
 warning: 'pci_enable_pcie_error_reporting' defined but not used
Message-ID: <202609180212.Cd6d2J0F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux aer_baseline_v1
head:   c03892987cf6c02922172ccd72a517bd7790d3b1
commit: c03892987cf6c02922172ccd72a517bd7790d3b1 [7/7] PCI/AER: Enable baseline capability error reporting
config: arc-randconfig-r2103-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180212.Cd6d2J0F-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180212.Cd6d2J0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180212.Cd6d2J0F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pcie/aer.c: In function 'pci_aer_init':
   drivers/pci/pcie/aer.c:436:29: error: expected ')' before 'pcie_clear_device_status'
     if (pcie_aer_is_native(dev)
        ~                       ^
                                )
      pcie_clear_device_status(dev);
      ~~~~~~~~~~~~~~~~~~~~~~~~   
   drivers/pci/pcie/aer.c:443:1: error: expected expression before '}' token
    }
    ^
   At top level:
>> drivers/pci/pcie/aer.c:264:12: warning: 'pci_enable_pcie_error_reporting' defined but not used [-Wunused-function]
    static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pci_enable_pcie_error_reporting +264 drivers/pci/pcie/aer.c

fd3362cb73dee6 drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas              2018-06-08  263  
7ec4b34be42345 drivers/pci/pcie/aer.c        Bjorn Helgaas              2023-07-10 @264  static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
fd3362cb73dee6 drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas              2018-06-08  265  {
d20df83b66ccb9 drivers/pci/pcie/aer.c        Bolarinwa Olayemi Saheed   2020-06-15  266  	int rc;
d20df83b66ccb9 drivers/pci/pcie/aer.c        Bolarinwa Olayemi Saheed   2020-06-15  267  
708b2000362476 drivers/pci/pcie/aer.c        Kuppuswamy Sathyanarayanan 2020-05-26  268  	if (!pcie_aer_is_native(dev))
fd3362cb73dee6 drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas              2018-06-08  269  		return -EIO;
fd3362cb73dee6 drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas              2018-06-08  270  
d20df83b66ccb9 drivers/pci/pcie/aer.c        Bolarinwa Olayemi Saheed   2020-06-15  271  	rc = pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
d20df83b66ccb9 drivers/pci/pcie/aer.c        Bolarinwa Olayemi Saheed   2020-06-15  272  	return pcibios_err_to_errno(rc);
fd3362cb73dee6 drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas              2018-06-08  273  }
fd3362cb73dee6 drivers/pci/pcie/aer/aerdrv.c Bjorn Helgaas              2018-06-08  274  

:::::: The code at line 264 was first introduced by commit
:::::: 7ec4b34be4234599cf1241ef807cdb7c3636f6fe PCI/AER: Unexport pci_enable_pcie_error_reporting()

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
