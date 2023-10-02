Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65A1E521
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696289459; x=1727825459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rO0/GE+pFT85/ZIKcWOrNRxuOQY4DWPV6Fm6KsUTWDM=;
  b=Am1B2U4UIHP81NSwe2scNQBdty2HFwQf8bMPZqtdkHQT2Vlmlb15V2Wa
   GuYmlpzYBUMZ98asslcTNNvMTY2uVM5dgZiEo/UikuUPy41oschIUIJfs
   OroKlNX9Y721kcv8jW7gr+ql5XT9r9yp4shcJcF2oJYjKStQAzTDcDF/P
   OwMsGbSyyrBODoug3gtm1Lp/zSFmChhKWSI7+6c0VsBKF0J7OhVQItIOe
   kgp91pwoNpQ0Ry+b0q9GsEchFIWlQGLOqbgqtfm7GbgIKBZR5fJb4eD32
   wp/NaatEecfWsYcp9asVXFVo7Um/gthEfsHBwGYz3+S/gChBCdxBiGuCL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="382671060"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="382671060"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 16:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="924435950"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="924435950"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Oct 2023 16:30:56 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnSNK-0006Vt-1k;
	Mon, 02 Oct 2023 23:30:54 +0000
Date: Tue, 3 Oct 2023 07:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 22/40] drivers/scsi/a100u2w.c:596:
 warning: Function parameter or member 'sdev' not described in
 'orc_device_reset'
Message-ID: <202310030743.jFW8UxC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v5
head:   2b7934b02ad769f5384351ef79c4d6b0cde694e3
commit: 707cf66e3c86687733a69cff42a001878b856829 [22/40] a1000u2w: do not rely on the command for inia100_device_reset()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030743.jFW8UxC9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030743.jFW8UxC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030743.jFW8UxC9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/a100u2w.c:596: warning: Function parameter or member 'sdev' not described in 'orc_device_reset'
>> drivers/scsi/a100u2w.c:596: warning: Excess function parameter 'cmd' description in 'orc_device_reset'
>> drivers/scsi/a100u2w.c:596: warning: Excess function parameter 'target' description in 'orc_device_reset'


vim +596 drivers/scsi/a100u2w.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  584  
4023c4747861e8 Alan Cox        2007-06-15  585  /**
4023c4747861e8 Alan Cox        2007-06-15  586   *	orc_device_reset	-	device reset handler
4023c4747861e8 Alan Cox        2007-06-15  587   *	@host: host to reset
4023c4747861e8 Alan Cox        2007-06-15  588   *	@cmd: command causing the reset
c548a625062785 Lee Jones       2021-03-17  589   *	@target: target device
4023c4747861e8 Alan Cox        2007-06-15  590   *
4023c4747861e8 Alan Cox        2007-06-15  591   *	Reset registers, reset a hanging bus and kill active and disconnected
4023c4747861e8 Alan Cox        2007-06-15  592   *	commands for target w/o soft reset
4023c4747861e8 Alan Cox        2007-06-15  593   */
4023c4747861e8 Alan Cox        2007-06-15  594  
707cf66e3c8668 Hannes Reinecke 2023-10-02  595  static int orc_device_reset(struct orc_host * host, struct scsi_device *sdev)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @596  {				/* I need Host Control Block Information */
4023c4747861e8 Alan Cox        2007-06-15  597  	struct orc_scb *scb;
4023c4747861e8 Alan Cox        2007-06-15  598  	struct orc_extended_scb *escb;
4023c4747861e8 Alan Cox        2007-06-15  599  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds  2005-04-16  600  
4023c4747861e8 Alan Cox        2007-06-15  601  	spin_lock_irqsave(&(host->allocation_lock), flags);
4023c4747861e8 Alan Cox        2007-06-15  602  	scb = (struct orc_scb *) NULL;
4023c4747861e8 Alan Cox        2007-06-15  603  	escb = (struct orc_extended_scb *) NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  604  
4023c4747861e8 Alan Cox        2007-06-15  605  	/* FIXME: is this safe if we then fail to issue the reset or race
4023c4747861e8 Alan Cox        2007-06-15  606  	   a completion ? */
4023c4747861e8 Alan Cox        2007-06-15  607  	init_alloc_map(host);
4023c4747861e8 Alan Cox        2007-06-15  608  
4023c4747861e8 Alan Cox        2007-06-15  609  	/* Allocate a new SCB for the reset command to the firmware */
4023c4747861e8 Alan Cox        2007-06-15  610  	if ((scb = __orc_alloc_scb(host)) == NULL) {
4023c4747861e8 Alan Cox        2007-06-15  611  		/* Can't happen.. */
4023c4747861e8 Alan Cox        2007-06-15  612  		spin_unlock_irqrestore(&(host->allocation_lock), flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  613  		return FAILED;
^1da177e4c3f41 Linus Torvalds  2005-04-16  614  	}
4023c4747861e8 Alan Cox        2007-06-15  615  
89546deb912ca9 Nick Andrew     2009-01-03  616  	/* Reset device is handled by the firmware, we fill in an SCB and
4023c4747861e8 Alan Cox        2007-06-15  617  	   fire it at the controller, it does the rest */
4023c4747861e8 Alan Cox        2007-06-15  618  	scb->opcode = ORC_BUSDEVRST;
707cf66e3c8668 Hannes Reinecke 2023-10-02  619  	scb->target = sdev->id;
4023c4747861e8 Alan Cox        2007-06-15  620  	scb->hastat = 0;
4023c4747861e8 Alan Cox        2007-06-15  621  	scb->tastat = 0;
4023c4747861e8 Alan Cox        2007-06-15  622  	scb->status = 0x0;
4023c4747861e8 Alan Cox        2007-06-15  623  	scb->link = 0xFF;
4023c4747861e8 Alan Cox        2007-06-15  624  	scb->reserved0 = 0;
4023c4747861e8 Alan Cox        2007-06-15  625  	scb->reserved1 = 0;
987ff954cda2a2 Mikulas Patocka 2008-07-15  626  	scb->xferlen = cpu_to_le32(0);
987ff954cda2a2 Mikulas Patocka 2008-07-15  627  	scb->sg_len = cpu_to_le32(0);
4023c4747861e8 Alan Cox        2007-06-15  628  
707cf66e3c8668 Hannes Reinecke 2023-10-02  629  	escb = scb->escb;
4023c4747861e8 Alan Cox        2007-06-15  630  	escb->srb = NULL;
4023c4747861e8 Alan Cox        2007-06-15  631  	orc_exec_scb(host, scb);	/* Start execute SCB            */
4023c4747861e8 Alan Cox        2007-06-15  632  	spin_unlock_irqrestore(&host->allocation_lock, flags);
^1da177e4c3f41 Linus Torvalds  2005-04-16  633  	return SUCCESS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  634  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  635  

:::::: The code at line 596 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
