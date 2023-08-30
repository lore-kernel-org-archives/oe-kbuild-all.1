Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137AE8BE2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 22:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693436251; x=1724972251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Bauu+IAPSg002CH0nDTCyIn/8gAaz26G8JZ6QWKH0A=;
  b=REcUxfQ/fAQl+ms/ac6w8ig7z8xEao1gUa7x26zcxzCTDqL2E1yyJGDb
   Tbj1t8x8+kSr8vRSyeaUgsx6U0zsV0SIoWxDpOoKXVWR/+4Ma8o/cdupo
   anGVfK007jb/l05BSv72OpMVoR89OOQ+MwOCDt2GDfN4fDpyDHr3DRskQ
   yoFOdgGpkiKrFEe8VghkW6KbiJqgQ6asRacDdYTn48kJakxJKG+xbmKRW
   zEdMTYzYAlcgT7KGwyMwBlcSMMDYqs+fum/HN8HsAYJ6l5LgBWWyUiYTQ
   s7Q10/LjseiSurDIXV68R1S3oGRNOTAmFkDgpHWEdnoisKMxh1ep6NMKY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373167783"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="373167783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="732819857"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="732819857"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Aug 2023 15:57:28 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbU7s-000AIp-0P;
	Wed, 30 Aug 2023 22:57:28 +0000
Date: Thu, 31 Aug 2023 06:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 19/29] drivers/pci/ide.c:415: warning: expecting
 prototype for is_ide_stream_secure(). Prototype was for
 ide_stream_is_secure() instead
Message-ID: <202308310636.rWiPHHud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   f242c278cff9a9ea2b5a4f2e2063145c1e40dfac
commit: 86e2b34912e9a7f5ac67a27350eee546e0b899b0 [19/29] pci: ide: Add support for IDE stream allocation
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20230831/202308310636.rWiPHHud-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310636.rWiPHHud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310636.rWiPHHud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/ide.c:415: warning: expecting prototype for is_ide_stream_secure(). Prototype was for ide_stream_is_secure() instead


vim +415 drivers/pci/ide.c

   406	
   407	/**
   408	 * is_ide_stream_secure - Check IDE stream status
   409	 * @pdev: the downstream PCI device for the IDE stream
   410	 * @wait: set true to wait 10ms for key to start
   411	 *
   412	 * Return true if link is secure or false if unsecure or error
   413	 */
   414	bool ide_stream_is_secure(struct pci_dev *pdev, bool wait)
 > 415	{
   416		int pos_id, pos;
   417		u32 reg;
   418	
   419		if (pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM ||
   420		    pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT)
   421			return false;
   422	
   423		pos_id = pdev->ide.pdev2_stream_pos_id;
   424		pos = pci_ide_get_reg_block_pos(pdev, pos_id);
   425		if (pos < 0)
   426			return false;
   427	
   428		/*
   429		 * PCIe base spec r6.0.1 6.33.3
   430		 * Transmission of stream must start not more than 10ms after K_SET_GO
   431		 */
   432		if (wait)
   433			msleep(10);
   434	
   435		if (ide_stream_type(pdev, pos_id) == PCI_IDE_STREAM_TYPE_LINK)
   436			pci_read_config_dword(pdev, pos + PCI_IDE_LNK_STATUS, &reg);
   437		else
   438			pci_read_config_dword(pdev, pos + PCI_IDE_SEL_STATUS, &reg);
   439	
   440		return FIELD_GET(PCI_IDE_STM_STATUS_MASK, reg) == PCI_IDE_STM_STATUS_SECURE;
   441	}
   442	EXPORT_SYMBOL_GPL(ide_stream_is_secure);
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
