Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808312FB15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215728; cv=none; b=VebQRqFynjaXdWbEE82LS2lb7yIvC+8nvt9Ub6+pvw5oTjUW19pYJpqoKcMB/374alPRSOQijBfhoN2yTdtfaW/Qq55/VFh4lTq4cN1TlILlDsSCw7+R4TU0Tb9UttFlYrox2X0qTS5AX1ZAxljzMQgc4fDSJRtofeFvDj9vj8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215728; c=relaxed/simple;
	bh=xztLJJsrN7uAxjMp4wpjotG8FNfhYCyv4pmBy3UxhZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1O6w7Wmfl7j8x/WNmGoTS/5Wq9Bh4dtCnFbynj/wgW//DB77/xsy0+J6hVJpz3BDC9kQPu95whaGcRgjpMCNtpiTsu/BX1eB0ewD/V2I7Lx+raHNagDMs+EL+dDcWVK5Gd/J7KjAkYA3ZoYPBDsknZ+hnHQaHiJmZc8AlRiGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODL5Dkj8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODL5Dkj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215727; x=1740751727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xztLJJsrN7uAxjMp4wpjotG8FNfhYCyv4pmBy3UxhZU=;
  b=ODL5Dkj8MsFHLsvdi7dCZ8uqV0wpnnoh7XNA83GgorENLAtROWObHVZX
   kVERnA+/5+qgJobszosCp01/t1RhLZyu4d1W5O8+xqvshYB+gB2NwEizv
   QfGPE1WBJMelu/9xTPoRcNUZymnCDeiE8CgIvIK+JRY6p5DUjftPMupwH
   BIVVFbKLml8vHjrRbySYZQ4++NDGW4JB3e7PnvrgMNFzDrMUD5vBZOhAU
   dm/69TsMvitniHnjNPTEn0vsec4yJqtbpePsc/m3MWjcbQ7bFOZz+2Xgl
   +Y4qByPFknrmTSm6sIoIlLLZT9zvx1EfrRjFu7JLIMxk0AaPKOoBHtANK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3851587"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3851587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="31025179"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Feb 2024 06:08:44 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfh5U-000Czb-2f;
	Thu, 29 Feb 2024 14:08:41 +0000
Date: Thu, 29 Feb 2024 22:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jiri Kosina <jikos@kernel.org>
Subject: [linux-next:master 10109/11156]
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:34: error: 'struct
 system_cpuinfo_parisc' has no member named 'x86'
Message-ID: <202402292155.zoVOEsFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 6296562f30b1caf4b5f44e0c89c8f5cbfdb14b4a [10109/11156] HID: amd_sfh: Extend MP2 register access to SFH
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240229/202402292155.zoVOEsFz-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402292155.zoVOEsFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402292155.zoVOEsFz-lkp@intel.com/

Note: the linux-next/master HEAD f303a3e2bcfba900efb5aee55236d17030e9f882 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c: In function 'amd_mp2_pci_probe':
>> drivers/hid/amd-sfh-hid/amd_sfh_pcie.c:413:34: error: 'struct system_cpuinfo_parisc' has no member named 'x86'
     413 |                 if (boot_cpu_data.x86 >= 0x1A)
         |                                  ^


vim +413 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c

   374	
   375	static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
   376	{
   377		struct amd_mp2_dev *privdata;
   378		int rc;
   379	
   380		if (dmi_first_match(dmi_nodevs))
   381			return -ENODEV;
   382	
   383		dmi_check_system(dmi_sfh_table);
   384	
   385		privdata = devm_kzalloc(&pdev->dev, sizeof(*privdata), GFP_KERNEL);
   386		if (!privdata)
   387			return -ENOMEM;
   388	
   389		privdata->pdev = pdev;
   390		dev_set_drvdata(&pdev->dev, privdata);
   391		rc = pcim_enable_device(pdev);
   392		if (rc)
   393			return rc;
   394	
   395		rc = pcim_iomap_regions(pdev, BIT(2), DRIVER_NAME);
   396		if (rc)
   397			return rc;
   398	
   399		privdata->mmio = pcim_iomap_table(pdev)[2];
   400		pci_set_master(pdev);
   401		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
   402		if (rc) {
   403			dev_err(&pdev->dev, "failed to set DMA mask\n");
   404			return rc;
   405		}
   406	
   407		privdata->cl_data = devm_kzalloc(&pdev->dev, sizeof(struct amdtp_cl_data), GFP_KERNEL);
   408		if (!privdata->cl_data)
   409			return -ENOMEM;
   410	
   411		privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
   412		if (privdata->sfh1_1_ops) {
 > 413			if (boot_cpu_data.x86 >= 0x1A)
   414				privdata->rver = 1;
   415	
   416			rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh1_1_init_work);
   417			if (rc)
   418				return rc;
   419	
   420			schedule_work(&privdata->work);
   421			return 0;
   422		}
   423	
   424		mp2_select_ops(privdata);
   425	
   426		rc = amd_sfh_irq_init(privdata);
   427		if (rc) {
   428			dev_err(&pdev->dev, "amd_sfh_irq_init failed\n");
   429			return rc;
   430		}
   431	
   432		rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh_init_work);
   433		if (rc) {
   434			amd_sfh_clear_intr(privdata);
   435			return rc;
   436		}
   437	
   438		schedule_work(&privdata->work);
   439		return 0;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
