Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787448468
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691785373; x=1723321373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPZfxktq47DaQiwoGa08JespUOJprhV8Fgrm908158E=;
  b=R/0swfg675JyoIyEwNkw51rJ9+bQEpTYWl2GSVzqPjJpYKglhb9N6bsu
   gHf+ooD45kEaWSDaAdm4Pu7Ir1uFV6XwrAZaJ+3W8dpzKEQfgXd97yavm
   zZrvv7i2qvVlsbSjYz+9YOEyacorO+JhXsBobzJ/IWyrLtB1SlUwonXW4
   QM9BY1Lo1bVxCzx4IvA5i1yyyC+87Iugue/cFDeYkbjSeE8EWc0aMzBex
   hja/EAzZnnhBMSkJXLbRA12mdD3AgZ/x5XYMhULg7R/hl6aZMA4qrNcyK
   RFFJ+0uEtRcFCMsinDsWq69vZEpY33VSjrSWltEKPWAWZs8LUdfdYj+M2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371764664"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="371764664"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 13:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="798151835"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="798151835"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2023 13:22:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUYeo-00080i-32;
	Fri, 11 Aug 2023 20:22:50 +0000
Date: Sat, 12 Aug 2023 04:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 21/24] drivers/acpi/x86/keyp.c:89:13: error:
 'struct pci_dev' has no member named 'ide'
Message-ID: <202308120411.VWz0fLnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ee3a63e65f46140bcb484e3d0052d641abceb9da
commit: c4ac61d5d895b22169ec35fd66d0105407693bfa [21/24] acpi: Add KEYP key configuration unit parsing
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230812/202308120411.VWz0fLnk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120411.VWz0fLnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120411.VWz0fLnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/x86/keyp.c: In function 'keyp_setup_pcie_ide_stream':
>> drivers/acpi/x86/keyp.c:89:13: error: 'struct pci_dev' has no member named 'ide'
      89 |         pdev->ide.stream_min = kcu->stream_id_claimed;
         |             ^~
   drivers/acpi/x86/keyp.c:90:13: error: 'struct pci_dev' has no member named 'ide'
      90 |         pdev->ide.stream_max = kcu->stream_id_claimed + max_rp_streams - 1;
         |             ^~


vim +89 drivers/acpi/x86/keyp.c

    70	
    71	void keyp_setup_pcie_ide_stream(struct pci_dev *pdev)
    72	{
    73		u16 segment = pci_domain_nr(pdev->bus);
    74		u32 index = construct_xa_key(segment, pdev->bus->number, pdev->devfn);
    75		struct keyp_config_unit *kcu;
    76		int max_rp_streams;
    77	
    78		kcu = xa_load(&keyp_xa, index);
    79		if (!kcu)
    80			return;
    81	
    82		/*
    83		 * PCIe base spec r6.0.1, 7.9.26.4 and 7.9.26.5
    84		 * Stream ID is an 8bit field so only 256 IDs are available per root port.
    85		 * However, for the KEYP config unit the stream IDs must be unique. A single
    86		 * KEYP config unit may have multiple root ports
    87		 */
    88		max_rp_streams = 256 / kcu->rp_count;
  > 89		pdev->ide.stream_min = kcu->stream_id_claimed;
    90		pdev->ide.stream_max = kcu->stream_id_claimed + max_rp_streams - 1;
    91		kcu->stream_id_claimed += max_rp_streams;
    92	}
    93	EXPORT_SYMBOL_GPL(keyp_setup_pcie_ide_stream);
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
