Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E543E33C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680784974; x=1712320974;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jUItgVC6AUFGk8hbA3V7C1GJudn61USU0rsoahm/nKI=;
  b=XP1SQQ1zcY/cAhXgg93v2YhYUm5woQTDTS79jtFOZ9WaTfRi0EIeZaTV
   SQ7b8+O3ziAsmir4He8NVc1XLR37HK6FG3uJrhIgvF3DVXF10wul0/H0x
   QukfQtpiRLNv7pmxhbJIK5esZMeu/ab3GZN4Ptdfn62804norYZ+Jef0e
   FsXK17aaCr7lQv+afONv6GbBQGbllo565grIpTx39QI31iIQzBkreXhJK
   qsdBMyVrIcEFelsIIV9/XhdMLlYVr5iPLC8Tu1+MOA6V8GqOZlPs2MgIj
   mvizbOJYIdnYm3YtxWBanM4+HPtgKF5sbx6tl1zqHs0W0DCrSX/dIMGya
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="323099701"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="323099701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 05:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="1016853812"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="1016853812"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2023 05:42:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkOx0-000RN0-1d;
	Thu, 06 Apr 2023 12:42:50 +0000
Date: Thu, 6 Apr 2023 20:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/ata/pata_serverworks.c:443 serverworks_init_one() warn:
 inconsistent indenting
Message-ID: <202304062027.6Epjw4qc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Huacai,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   99ddf2254febae9eab7fb0bcc02c5322243f5c49
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   8 months ago
config: loongarch-randconfig-m041-20230406 (https://download.01.org/0day-ci/archive/20230406/202304062027.6Epjw4qc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062027.6Epjw4qc-lkp@intel.com/

smatch warnings:
drivers/ata/pata_serverworks.c:443 serverworks_init_one() warn: inconsistent indenting
drivers/ata/ata_piix.c:1382 piix_init_sata_map() error: buffer overflow 'map' 4 <= 4

vim +443 drivers/ata/pata_serverworks.c

669a5db411d85a Jeff Garzik               2006-08-29  385  
669a5db411d85a Jeff Garzik               2006-08-29  386  static int serverworks_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
669a5db411d85a Jeff Garzik               2006-08-29  387  {
1626aeb881236c Tejun Heo                 2007-05-04  388  	static const struct ata_port_info info[4] = {
669a5db411d85a Jeff Garzik               2006-08-29  389  		{ /* OSB4 */
1d2808fd3d2d5d Jeff Garzik               2007-05-28  390  			.flags = ATA_FLAG_SLAVE_POSS,
14bdef982caeda Erik Inge Bolsø           2009-03-14  391  			.pio_mask = ATA_PIO4,
14bdef982caeda Erik Inge Bolsø           2009-03-14  392  			.mwdma_mask = ATA_MWDMA2,
14bdef982caeda Erik Inge Bolsø           2009-03-14  393  			.udma_mask = ATA_UDMA2,
669a5db411d85a Jeff Garzik               2006-08-29  394  			.port_ops = &serverworks_osb4_port_ops
669a5db411d85a Jeff Garzik               2006-08-29  395  		}, { /* OSB4 no UDMA */
1d2808fd3d2d5d Jeff Garzik               2007-05-28  396  			.flags = ATA_FLAG_SLAVE_POSS,
14bdef982caeda Erik Inge Bolsø           2009-03-14  397  			.pio_mask = ATA_PIO4,
14bdef982caeda Erik Inge Bolsø           2009-03-14  398  			.mwdma_mask = ATA_MWDMA2,
14bdef982caeda Erik Inge Bolsø           2009-03-14  399  			/* No UDMA */
669a5db411d85a Jeff Garzik               2006-08-29  400  			.port_ops = &serverworks_osb4_port_ops
669a5db411d85a Jeff Garzik               2006-08-29  401  		}, { /* CSB5 */
1d2808fd3d2d5d Jeff Garzik               2007-05-28  402  			.flags = ATA_FLAG_SLAVE_POSS,
14bdef982caeda Erik Inge Bolsø           2009-03-14  403  			.pio_mask = ATA_PIO4,
14bdef982caeda Erik Inge Bolsø           2009-03-14  404  			.mwdma_mask = ATA_MWDMA2,
bf6263a853c9c1 Jeff Garzik               2007-07-09  405  			.udma_mask = ATA_UDMA4,
669a5db411d85a Jeff Garzik               2006-08-29  406  			.port_ops = &serverworks_csb_port_ops
669a5db411d85a Jeff Garzik               2006-08-29  407  		}, { /* CSB5 - later revisions*/
1d2808fd3d2d5d Jeff Garzik               2007-05-28  408  			.flags = ATA_FLAG_SLAVE_POSS,
14bdef982caeda Erik Inge Bolsø           2009-03-14  409  			.pio_mask = ATA_PIO4,
14bdef982caeda Erik Inge Bolsø           2009-03-14  410  			.mwdma_mask = ATA_MWDMA2,
bf6263a853c9c1 Jeff Garzik               2007-07-09  411  			.udma_mask = ATA_UDMA5,
669a5db411d85a Jeff Garzik               2006-08-29  412  			.port_ops = &serverworks_csb_port_ops
669a5db411d85a Jeff Garzik               2006-08-29  413  		}
669a5db411d85a Jeff Garzik               2006-08-29  414  	};
1626aeb881236c Tejun Heo                 2007-05-04  415  	const struct ata_port_info *ppi[] = { &info[id->driver_data], NULL };
37017ac6849e77 Scott Carter              2014-09-24  416  	struct scsi_host_template *sht = &serverworks_csb_sht;
f08048e94564d0 Tejun Heo                 2008-03-25  417  	int rc;
f08048e94564d0 Tejun Heo                 2008-03-25  418  
f08048e94564d0 Tejun Heo                 2008-03-25  419  	rc = pcim_enable_device(pdev);
f08048e94564d0 Tejun Heo                 2008-03-25  420  	if (rc)
f08048e94564d0 Tejun Heo                 2008-03-25  421  		return rc;
669a5db411d85a Jeff Garzik               2006-08-29  422  
d912be2f3b3353 Bartlomiej Zolnierkiewicz 2011-10-11  423  	rc = serverworks_fixup(pdev);
669a5db411d85a Jeff Garzik               2006-08-29  424  
669a5db411d85a Jeff Garzik               2006-08-29  425  	/* OSB4 : South Bridge and IDE */
669a5db411d85a Jeff Garzik               2006-08-29  426  	if (pdev->device == PCI_DEVICE_ID_SERVERWORKS_OSB4IDE) {
669a5db411d85a Jeff Garzik               2006-08-29  427  		/* Select non UDMA capable OSB4 if we can't do fixups */
d912be2f3b3353 Bartlomiej Zolnierkiewicz 2011-10-11  428  		if (rc < 0)
1626aeb881236c Tejun Heo                 2007-05-04  429  			ppi[0] = &info[1];
37017ac6849e77 Scott Carter              2014-09-24  430  		sht = &serverworks_osb4_sht;
669a5db411d85a Jeff Garzik               2006-08-29  431  	}
669a5db411d85a Jeff Garzik               2006-08-29  432  	/* setup CSB5/CSB6 : South Bridge and IDE option RAID */
669a5db411d85a Jeff Garzik               2006-08-29  433  	else if ((pdev->device == PCI_DEVICE_ID_SERVERWORKS_CSB5IDE) ||
669a5db411d85a Jeff Garzik               2006-08-29  434  		 (pdev->device == PCI_DEVICE_ID_SERVERWORKS_CSB6IDE) ||
669a5db411d85a Jeff Garzik               2006-08-29  435  		 (pdev->device == PCI_DEVICE_ID_SERVERWORKS_CSB6IDE2)) {
669a5db411d85a Jeff Garzik               2006-08-29  436  
669a5db411d85a Jeff Garzik               2006-08-29  437  		 /* If the returned btr is the newer revision then
669a5db411d85a Jeff Garzik               2006-08-29  438  		    select the right info block */
d912be2f3b3353 Bartlomiej Zolnierkiewicz 2011-10-11  439  		 if (rc == 3)
1626aeb881236c Tejun Heo                 2007-05-04  440  		 	ppi[0] = &info[3];
669a5db411d85a Jeff Garzik               2006-08-29  441  
669a5db411d85a Jeff Garzik               2006-08-29  442  		/* Is this the 3rd channel CSB6 IDE ? */
669a5db411d85a Jeff Garzik               2006-08-29 @443  		if (pdev->device == PCI_DEVICE_ID_SERVERWORKS_CSB6IDE2)
1626aeb881236c Tejun Heo                 2007-05-04  444  			ppi[1] = &ata_dummy_port_info;
669a5db411d85a Jeff Garzik               2006-08-29  445  	}
669a5db411d85a Jeff Garzik               2006-08-29  446  
37017ac6849e77 Scott Carter              2014-09-24  447  	return ata_pci_bmdma_init_one(pdev, ppi, sht, NULL, 0);
669a5db411d85a Jeff Garzik               2006-08-29  448  }
669a5db411d85a Jeff Garzik               2006-08-29  449  

:::::: The code at line 443 was first introduced by commit
:::::: 669a5db411d85a14f86cd92bc16bf7ab5b8aa235 [libata] Add a bunch of PATA drivers.

:::::: TO: Jeff Garzik <jeff@garzik.org>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
