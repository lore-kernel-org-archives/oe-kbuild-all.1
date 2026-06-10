Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1945474E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 03:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061513; cv=none; b=PHv0Q+x7fvzl5b8uQ0ZSdJ+SdQTJ4OQAANE1Q2mhR5+QLO0Yu7eD1ORzZx2O9s3+LGpcK7Vg/+xxPyXCd7ID9d03vQ/wFUsvPXVjNHMuxA25pTU/zA/0ffNaQM10klqA7EiBmTmyAJGAH8Bp75zC9yMUp5O8Lnt3kcycyPUKVqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061513; c=relaxed/simple;
	bh=hRZkQJMrqd17Tq99N3hTNr7EzVAMerxVSC1Y3bSaG/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NEmhiZYrB0JkHygM7Gqgu5hg86R1sKGJYNP+LNLRXpwfJT4L+19D90dzwBFDTEigoBvFeGTeZMLAk89KzAin3czL+jK0SI+W/Uuu4fBof+n4plvUPcPX/5RzqmXqN8yA4iF1AHHtP8yCoeliiUCvMh0XCIakHzeCkfcexJDhrDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxV5qRwL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxV5qRwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781061510; x=1812597510;
  h=date:from:to:cc:subject:message-id;
  bh=hRZkQJMrqd17Tq99N3hTNr7EzVAMerxVSC1Y3bSaG/w=;
  b=IxV5qRwLAt61XL2te2KaSOlGUUmETdK5vTbztuXO/ULTGj17tEiEnwy6
   8NWLXNqL2F6KFti4yJMKEWZavMqxDlPjQqYO1FoYbOImY54s8NWGAdiwH
   KgXOXk2gV01w7B3MKEes39jsHDppRThB6BZqCLJzHto27K7GPVj2g0kQv
   MnZq5Cy7oWAiAQR5TcL3xhyd+IWB1bJ3G/hG/2szpo2r7IVqf8AzwuqBn
   xhrp6yIL0xXK/EtR1XsrmCvHrMNnAf5U2aP1pwjG8ZCNZYS9dhnghZ2dJ
   Z0abZbOWliuya1YcxT7CKzBD5MIgWyzWUSoq52GoFlqsLFgQsGBJbvveC
   A==;
X-CSE-ConnectionGUID: xK5un0CNSsexxtY1HxJ9YQ==
X-CSE-MsgGUID: b2H1YC7dRbSRC95KG6EmKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93333106"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="93333106"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:18:30 -0700
X-CSE-ConnectionGUID: BqSCBMBxT2avkU8RNhWKhA==
X-CSE-MsgGUID: tFMV8ADtReKLHdk4dTPp5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245905007"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2026 20:18:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX9SU-000000003bZ-1r1k;
	Wed, 10 Jun 2026 03:18:26 +0000
Date: Wed, 10 Jun 2026 05:17:52 +0200
From: kernel test robot <lkp@intel.com>
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/ata/libata-scsi.c:4619:25: error: too few arguments
 to function 'scsi_host_alloc'
Message-ID: <202606100503.rU4zKI8G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sumit-Saxena/scsi-scan-allocate-sdev-and-starget-on-the-NUMA-node-of-the-host-adapter/20260609-195849
head:   1a119c6869ad0a915e9c86e65a8a3d0b0c4b21d2
commit: 7479f1902d058cd6e51b1f7f9b23241d8fd588cd scsi: host: allocate struct Scsi_Host on the NUMA node of the host adapter
date:   15 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260610/202606100503.rU4zKI8G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100503.rU4zKI8G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100503.rU4zKI8G-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ata/libata-scsi.c: In function 'ata_scsi_add_hosts':
>> drivers/ata/libata-scsi.c:4619:25: error: too few arguments to function 'scsi_host_alloc'
    4619 |                 shost = scsi_host_alloc(sht, sizeof(struct ata_port *));
         |                         ^~~~~~~~~~~~~~~
   In file included from drivers/ata/libata-scsi.c:23:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/message/fusion/mptspi.c: In function 'mptspi_probe':
>> drivers/message/fusion/mptspi.c:1408:14: error: too few arguments to function 'scsi_host_alloc'
    1408 |         sh = scsi_host_alloc(&mptspi_driver_template, sizeof(MPT_SCSI_HOST));
         |              ^~~~~~~~~~~~~~~
   In file included from drivers/message/fusion/mptspi.c:63:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/message/fusion/mptsas.c: In function 'mptsas_issue_tm':
   drivers/message/fusion/mptsas.c:4790:26: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    4790 |         unsigned long    timeleft;
         |                          ^~~~~~~~
   drivers/message/fusion/mptsas.c: In function 'mptsas_probe':
>> drivers/message/fusion/mptsas.c:5207:14: error: too few arguments to function 'scsi_host_alloc'
    5207 |         sh = scsi_host_alloc(&mptsas_driver_template, sizeof(MPT_SCSI_HOST));
         |              ^~~~~~~~~~~~~~~
   In file included from drivers/message/fusion/mptsas.c:58:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/usb/image/microtek.c: In function 'mts_usb_probe':
>> drivers/usb/image/microtek.c:723:26: error: too few arguments to function 'scsi_host_alloc'
     723 |         new_desc->host = scsi_host_alloc(&mts_scsi_host_template,
         |                          ^~~~~~~~~~~~~~~
   In file included from drivers/usb/image/microtek.c:139:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/target/loopback/tcm_loop.c: In function 'tcm_loop_driver_probe':
>> drivers/target/loopback/tcm_loop.c:298:14: error: too few arguments to function 'scsi_host_alloc'
     298 |         sh = scsi_host_alloc(&tcm_loop_driver_template,
         |              ^~~~~~~~~~~~~~~
   In file included from include/scsi/scsi_tcq.h:8,
                    from drivers/target/loopback/tcm_loop.c:31:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/usb/storage/uas.c: In function 'uas_probe':
>> drivers/usb/storage/uas.c:1021:17: error: too few arguments to function 'scsi_host_alloc'
    1021 |         shost = scsi_host_alloc(&uas_host_template,
         |                 ^~~~~~~~~~~~~~~
   In file included from drivers/usb/storage/uas.c:27:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/usb/storage/usb.c: In function 'usb_stor_probe1':
>> drivers/usb/storage/usb.c:1034:16: error: too few arguments to function 'scsi_host_alloc'
    1034 |         host = scsi_host_alloc(sht, sizeof(*us));
         |                ^~~~~~~~~~~~~~~
   In file included from drivers/usb/storage/usb.h:36,
                    from drivers/usb/storage/usb.c:49:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~
--
   drivers/scsi/megaraid/megaraid_mbox.c: In function 'megaraid_io_attach':
>> drivers/scsi/megaraid/megaraid_mbox.c:623:58: error: 'pdev' undeclared (first use in this function); did you mean 'cdev'?
     623 |         host = scsi_host_alloc(&megaraid_template_g, 8, &pdev->dev);
         |                                                          ^~~~
         |                                                          cdev
   drivers/scsi/megaraid/megaraid_mbox.c:623:58: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/scsi/qla2xxx/qla_mid.c: In function 'qla24xx_create_vhost':
>> drivers/scsi/qla2xxx/qla_mid.c:505:21: warning: too many arguments for format [-Wformat-extra-args]
     505 |                     "scsi_host_alloc() failed for vport.\n", NULL);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/infiniband/ulp/srp/ib_srp.c: In function 'add_target_store':
>> drivers/infiniband/ulp/srp/ib_srp.c:3699:23: error: too few arguments to function 'scsi_host_alloc'
    3699 |         target_host = scsi_host_alloc(&srp_template,
         |                       ^~~~~~~~~~~~~~~
   In file included from include/scsi/scsi_tcq.h:8,
                    from drivers/infiniband/ulp/srp/ib_srp.c:54:
   include/scsi/scsi_host.h:799:26: note: declared here
     799 | extern struct Scsi_Host *scsi_host_alloc(const struct scsi_host_template *sht,
         |                          ^~~~~~~~~~~~~~~


vim +/scsi_host_alloc +4619 drivers/ata/libata-scsi.c

^1da177e4c3f415 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  4609  
25df73d93323e20 drivers/ata/libata-scsi.c  Bart Van Assche 2023-03-22  4610  int ata_scsi_add_hosts(struct ata_host *host, const struct scsi_host_template *sht)
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4611  {
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4612  	int i, rc;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4613  
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4614  	for (i = 0; i < host->n_ports; i++) {
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4615  		struct ata_port *ap = host->ports[i];
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4616  		struct Scsi_Host *shost;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4617  
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4618  		rc = -ENOMEM;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17 @4619  		shost = scsi_host_alloc(sht, sizeof(struct ata_port *));
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4620  		if (!shost)
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4621  			goto err_alloc;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4622  
9ee4f3933930abf drivers/ata/libata-scsi.c  Lin Ming        2011-12-05  4623  		shost->eh_noresume = 1;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4624  		*(struct ata_port **)&shost->hostdata[0] = ap;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4625  		ap->scsi_host = shost;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4626  
7bf6ddc3345663b drivers/ata/libata-scsi.c  Heiner Kallweit 2026-04-02  4627  		shost->transportt = &ata_scsi_transportt;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4628  		shost->unique_id = ap->print_id;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4629  		shost->max_id = 16;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4630  		shost->max_lun = 1;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4631  		shost->max_channel = 1;
b1ffbf854e0887e drivers/ata/libata-scsi.c  Minwoo Im       2017-06-24  4632  		shost->max_cmd_len = 32;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4633  
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4634  		/* Schedule policy is determined by ->qc_defer()
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4635  		 * callback and it needs to see every deferred qc.
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4636  		 * Set host_blocked to 1 to prevent SCSI midlayer from
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4637  		 * automatically deferring requests.
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4638  		 */
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4639  		shost->max_host_blocked = 1;
31cc23b34913bc1 drivers/ata/libata-scsi.c  Tejun Heo       2007-09-23  4640  
1d72f7aec359524 drivers/ata/libata-scsi.c  John Garry      2020-02-28  4641  		rc = scsi_add_host_with_dma(shost, &ap->tdev, ap->host->dev);
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4642  		if (rc)
1d72f7aec359524 drivers/ata/libata-scsi.c  John Garry      2020-02-28  4643  			goto err_alloc;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4644  	}
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4645  
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4646  	return 0;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4647  
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4648   err_alloc:
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4649  	while (--i >= 0) {
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4650  		struct Scsi_Host *shost = host->ports[i]->scsi_host;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4651  
1d72f7aec359524 drivers/ata/libata-scsi.c  John Garry      2020-02-28  4652  		/* scsi_host_put() is in ata_devres_release() */
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4653  		scsi_remove_host(shost);
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4654  	}
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4655  	return rc;
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4656  }
f31871951b38daf drivers/ata/libata-scsi.c  Tejun Heo       2007-04-17  4657  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
