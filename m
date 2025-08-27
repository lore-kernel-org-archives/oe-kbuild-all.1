Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DB285C9A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312376; cv=none; b=MPtxgLOTgId0IDNdkTh44Veg9HbhKkKS3IS1+YJzT+5IqXkgTPorJ05vXpUuSpvakcQbVuq76BF3LdLKN2wStzzEM5xwFtPLUDm6DM/P2xsFgVOn1pldmeLMzPHfG3K79+LRnp6utIWU6Rt7NE5lS/PL3sXtRRdBWtFuWBjLcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312376; c=relaxed/simple;
	bh=BDECb9Mn0xh8CaWEwn9E3xBhqqPpZWLU4tBk1bL8pMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBHn/XhYCrORUKy3NPuSyF6ndmsQLagYlGSDe1r42Ru+olXMJUJ7CesqqUDokYmNIk4jzAO0mG3NrTwHL+4eOkagGjVvz9nfp+TsztYt9naH/WoeraMYOXMe5FI2RP6MArgKV15iKfMBh6N+RuahxBIfRjLqhSTKrTgtGv5lo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VymhfpKR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VymhfpKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756312374; x=1787848374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BDECb9Mn0xh8CaWEwn9E3xBhqqPpZWLU4tBk1bL8pMw=;
  b=VymhfpKR0GLsfh80zG+/dGfgcGg68YptGlS23/WHWjSzuZ5t9neouVAl
   7Dsr9HlTF5QK7hW8MP+4lY3k2BRPitoJTfTde2VT3Q3vXvFhM+pIc856b
   YbuuUoNrpoh4SuDCSO/Yq9bixpUQeq3h919r9yKLIFFhwzyTlmOwTZoMW
   FADdVp3fwN4JuAGrrPQPC+JKSeEdM03/QeR+HURAoSCNTqM1EfwRYTb6y
   8VkvlQgYckaIjBevsK0j54VKh+sUDtcumJcAur8t0wPCYasZdV4qLWEb1
   NB4unqr4FBz3dxeHG1OyKootrYjEErk8UiKuIlEa0G1GEKdzoBvccBw6x
   w==;
X-CSE-ConnectionGUID: LKArt0abSpunMAqtb2JRHA==
X-CSE-MsgGUID: IftRQAD+RhmK02PYftaqaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="83975562"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="83975562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 09:32:53 -0700
X-CSE-ConnectionGUID: BteRF0EDT9CTvQ8zj21iAg==
X-CSE-MsgGUID: QvzpxzUDTQ6OkO0hxvHsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174271424"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Aug 2025 09:32:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJ4r-000T4P-0V;
	Wed, 27 Aug 2025 16:32:49 +0000
Date: Thu, 28 Aug 2025 00:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 9/14] drivers/dma/ioat/init.c:1278:18-24: Unneeded
 variable: "result". Return "PCI_ERS_RESULT_RECOVERED" on line 1288
Message-ID: <202508280024.VfRQ47dq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux aer_reset_v1
head:   7ffeac25e04804ae87fa1385f755fbedbb72a3b2
commit: b55d146e808f4e7fe226dc5b8ba32ec643ed23de [9/14] dmaengine: ioat: Fix enable_cnt imbalance on PCIe error recovery
config: x86_64-randconfig-103-20250827 (https://download.01.org/0day-ci/archive/20250828/202508280024.VfRQ47dq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280024.VfRQ47dq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/ioat/init.c:1278:18-24: Unneeded variable: "result". Return "PCI_ERS_RESULT_RECOVERED" on line 1288

vim +1278 drivers/dma/ioat/init.c

4222a9074339fc Dave Jiang   2015-08-26  1275  
4222a9074339fc Dave Jiang   2015-08-26  1276  static pci_ers_result_t ioat_pcie_error_slot_reset(struct pci_dev *pdev)
4222a9074339fc Dave Jiang   2015-08-26  1277  {
4222a9074339fc Dave Jiang   2015-08-26 @1278  	pci_ers_result_t result = PCI_ERS_RESULT_RECOVERED;
4222a9074339fc Dave Jiang   2015-08-26  1279  
4222a9074339fc Dave Jiang   2015-08-26  1280  	dev_dbg(&pdev->dev, "%s post reset handling\n", DRV_NAME);
4222a9074339fc Dave Jiang   2015-08-26  1281  
b55d146e808f4e Lukas Wunner 2025-08-04  1282  	pdev->current_state = PCI_D0;
4222a9074339fc Dave Jiang   2015-08-26  1283  	pci_set_master(pdev);
4222a9074339fc Dave Jiang   2015-08-26  1284  	pci_restore_state(pdev);
4222a9074339fc Dave Jiang   2015-08-26  1285  	pci_save_state(pdev);
4222a9074339fc Dave Jiang   2015-08-26  1286  	pci_wake_from_d3(pdev, false);
4222a9074339fc Dave Jiang   2015-08-26  1287  
4222a9074339fc Dave Jiang   2015-08-26 @1288  	return result;
4222a9074339fc Dave Jiang   2015-08-26  1289  }
4222a9074339fc Dave Jiang   2015-08-26  1290  

:::::: The code at line 1278 was first introduced by commit
:::::: 4222a9074339fccc59526cbf30d8d2ec41468574 dmaengine: ioatdma: add PCIe AER handlers

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
