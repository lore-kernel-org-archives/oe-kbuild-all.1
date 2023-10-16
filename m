Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2652E651
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpQAk4tB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697482875; x=1729018875;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XzFdFLh9e2c22z0Ama5m5K6YbR/rsAeuee/qUaT1GxA=;
  b=MpQAk4tBpUfWz/CAeZcyZ38lxdjOTQSuXSbGwRURUdLt9KrtjLY8cM2b
   TnXzg+WLh33GmvuCTfG+R7YL9SHNxNbaYvPk26DIIy3lFrIL+iHFklQgd
   r1TnyOlqulLuyVUgZUrQduuubUYdSpO6cuKH9mr6z2Akspy11cLqF2SqZ
   Ivo5gt9D2JIXmTLd+ZqY1zFWBFI/u4I63UMYrpEkaJImzAguVdeBAiek5
   b47X1aVw/mNbGZbp2T+r0FNt+IyibSLICTN4y+d27WaxlCIQceGJfMxYr
   tztX5lpDfy9rjJe0VfLwlyl37eV0VA++2hR9pr6ktzfydNH/wJul6B/f7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="370688830"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="370688830"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 12:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="846516084"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="846516084"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2023 12:01:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsSpw-0008br-30;
	Mon, 16 Oct 2023 19:01:08 +0000
Date: Tue, 17 Oct 2023 03:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [hare-scsi-devel:eh-rework.v6 18/26]
 drivers/scsi/megaraid/megaraid_mbox.c:2516: warning: Function parameter or
 member 'shost' not described in 'megaraid_reset_handler'
Message-ID: <202310170225.OwuXBHTX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v6
head:   1e93963cdc1f4d2671b12c37a09b861f40313768
commit: 189a3307c1e67ee20438433ad40f71fd7521726d [18/26] scsi: Use Scsi_Host as argument for eh_host_reset_handler
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310170225.OwuXBHTX-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170225.OwuXBHTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170225.OwuXBHTX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/megaraid/megaraid_mbox.c:2516: warning: Function parameter or member 'shost' not described in 'megaraid_reset_handler'
>> drivers/scsi/megaraid/megaraid_mbox.c:2516: warning: Excess function parameter 'scp' description in 'megaraid_reset_handler'


vim +2516 drivers/scsi/megaraid/megaraid_mbox.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  2503  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2504  /**
3948ff8bba6c09 Matthias Schid     2013-06-26  2505   * megaraid_reset_handler - device reset handler for mailbox based driver
^1da177e4c3f41 Linus Torvalds     2005-04-16  2506   * @scp		: reference command
^1da177e4c3f41 Linus Torvalds     2005-04-16  2507   *
^1da177e4c3f41 Linus Torvalds     2005-04-16  2508   * Reset handler for the mailbox based controller. First try to find out if
^1da177e4c3f41 Linus Torvalds     2005-04-16  2509   * the FW is still live, in which case the outstanding commands counter mut go
^1da177e4c3f41 Linus Torvalds     2005-04-16  2510   * down to 0. If that happens, also issue the reservation reset command to
^1da177e4c3f41 Linus Torvalds     2005-04-16  2511   * relinquish (possible) reservations on the logical drives connected to this
a69b74d39f50b3 Randy Dunlap       2007-01-05  2512   * host.
^1da177e4c3f41 Linus Torvalds     2005-04-16  2513   **/
^1da177e4c3f41 Linus Torvalds     2005-04-16  2514  static int
189a3307c1e67e Hannes Reinecke    2023-10-02  2515  megaraid_reset_handler(struct Scsi_Host *shost)
^1da177e4c3f41 Linus Torvalds     2005-04-16 @2516  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2517  	adapter_t	*adapter;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2518  	scb_t		*scb;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2519  	scb_t		*tmp;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2520  	mraid_device_t	*raid_dev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2521  	unsigned long	flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2522  	uint8_t		raw_mbox[sizeof(mbox_t)];
^1da177e4c3f41 Linus Torvalds     2005-04-16  2523  	int		rval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2524  	int		recovery_window;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2525  	int		i;
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2526  	uioc_t		*kioc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2527  
189a3307c1e67e Hannes Reinecke    2023-10-02  2528  	adapter		= (adapter_t *)SCSIHOST2ADAP(shost);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2529  	raid_dev	= ADAP2RAIDDEV(adapter);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2530  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2531  	// return failure if adapter is not responding
^1da177e4c3f41 Linus Torvalds     2005-04-16  2532  	if (raid_dev->hw_error) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2533  		con_log(CL_ANN, (KERN_NOTICE
^1da177e4c3f41 Linus Torvalds     2005-04-16  2534  			"megaraid: hw error, cannot reset\n"));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2535  		return FAILED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2536  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2537  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2538  	// Under exceptional conditions, FW can take up to 3 minutes to
^1da177e4c3f41 Linus Torvalds     2005-04-16  2539  	// complete command processing. Wait for additional 2 minutes for the
^1da177e4c3f41 Linus Torvalds     2005-04-16  2540  	// pending commands counter to go down to 0. If it doesn't, let the
^1da177e4c3f41 Linus Torvalds     2005-04-16  2541  	// controller be marked offline
^1da177e4c3f41 Linus Torvalds     2005-04-16  2542  	// Also, reset all the commands currently owned by the driver
^1da177e4c3f41 Linus Torvalds     2005-04-16  2543  	spin_lock_irqsave(PENDING_LIST_LOCK(adapter), flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2544  	list_for_each_entry_safe(scb, tmp, &adapter->pend_list, list) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2545  		list_del_init(&scb->list);	// from pending list
^1da177e4c3f41 Linus Torvalds     2005-04-16  2546  
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2547  		if (scb->sno >= MBOX_MAX_SCSI_CMDS) {
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2548  			con_log(CL_ANN, (KERN_WARNING
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2549  			"megaraid: IOCTL packet with %d[%d:%d] being reset\n",
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2550  			scb->sno, scb->dev_channel, scb->dev_target));
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2551  
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2552  			scb->status = -1;
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2553  
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2554  			kioc			= (uioc_t *)scb->gp;
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2555  			kioc->status		= -EFAULT;
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2556  
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2557  			megaraid_mbox_mm_done(adapter, scb);
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2558  		} else {
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2559  			con_log(CL_ANN, (KERN_WARNING
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2560  				"megaraid: IO packet with %d[%d:%d] being reset\n",
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2561  				scb->sno, scb->dev_channel, scb->dev_target));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2562  
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2563  			scb->scp->result = (DID_RESET << 16);
f1170b83dff9f9 Bart Van Assche    2021-10-07  2564  			scsi_done(scb->scp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2565  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2566  			megaraid_dealloc_scb(adapter, scb);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2567  		}
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2568  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2569  	spin_unlock_irqrestore(PENDING_LIST_LOCK(adapter), flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2570  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2571  	if (adapter->outstanding_cmds) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2572  		con_log(CL_ANN, (KERN_NOTICE
^1da177e4c3f41 Linus Torvalds     2005-04-16  2573  			"megaraid: %d outstanding commands. Max wait %d sec\n",
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2574  			adapter->outstanding_cmds,
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2575  			(MBOX_RESET_WAIT + MBOX_RESET_EXT_WAIT)));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2576  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2577  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2578  	recovery_window = MBOX_RESET_WAIT + MBOX_RESET_EXT_WAIT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2579  
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2580  	for (i = 0; i < recovery_window; i++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2581  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2582  		megaraid_ack_sequence(adapter);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2583  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2584  		// print a message once every 5 seconds only
^1da177e4c3f41 Linus Torvalds     2005-04-16  2585  		if (!(i % 5)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2586  			con_log(CL_ANN, (
^1da177e4c3f41 Linus Torvalds     2005-04-16  2587  			"megaraid mbox: Wait for %d commands to complete:%d\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  2588  				adapter->outstanding_cmds,
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2589  				(MBOX_RESET_WAIT + MBOX_RESET_EXT_WAIT) - i));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2590  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2591  
25985edcedea63 Lucas De Marchi    2011-03-30  2592  		// bailout if no recovery happened in reset time
c005fb4fb2d23b Ju, Seokmann       2006-04-27  2593  		if (adapter->outstanding_cmds == 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2594  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2595  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2596  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2597  		msleep(1000);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2598  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2599  
f2c8dc402b939d Christoph Hellwig  2005-10-31  2600  	spin_lock(&adapter->lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2601  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2602  	// If still outstanding commands, bail out
^1da177e4c3f41 Linus Torvalds     2005-04-16  2603  	if (adapter->outstanding_cmds) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2604  		con_log(CL_ANN, (KERN_WARNING
^1da177e4c3f41 Linus Torvalds     2005-04-16  2605  			"megaraid mbox: critical hardware error!\n"));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2606  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2607  		raid_dev->hw_error = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2608  
f2c8dc402b939d Christoph Hellwig  2005-10-31  2609  		rval = FAILED;
f2c8dc402b939d Christoph Hellwig  2005-10-31  2610  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2611  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2612  	else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2613  		con_log(CL_ANN, (KERN_NOTICE
af901ca181d92a André Goddard Rosa 2009-11-14  2614  		"megaraid mbox: reset sequence completed successfully\n"));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2615  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2616  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2617  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2618  	// If the controller supports clustering, reset reservations
f2c8dc402b939d Christoph Hellwig  2005-10-31  2619  	if (!adapter->ha) {
f2c8dc402b939d Christoph Hellwig  2005-10-31  2620  		rval = SUCCESS;
f2c8dc402b939d Christoph Hellwig  2005-10-31  2621  		goto out;
f2c8dc402b939d Christoph Hellwig  2005-10-31  2622  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2623  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2624  	// clear reservations if any
^1da177e4c3f41 Linus Torvalds     2005-04-16  2625  	raw_mbox[0] = CLUSTER_CMD;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2626  	raw_mbox[2] = RESET_RESERVATIONS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2627  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2628  	rval = SUCCESS;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2629  	if (mbox_post_sync_cmd_fast(adapter, raw_mbox) == 0) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2630  		con_log(CL_ANN,
^1da177e4c3f41 Linus Torvalds     2005-04-16  2631  			(KERN_INFO "megaraid: reservation reset\n"));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2632  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2633  	else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2634  		rval = FAILED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2635  		con_log(CL_ANN, (KERN_WARNING
^1da177e4c3f41 Linus Torvalds     2005-04-16  2636  				"megaraid: reservation reset failed\n"));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2637  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2638  
f2c8dc402b939d Christoph Hellwig  2005-10-31  2639   out:
6548b0e5b875a0 Dan Carpenter      2012-06-27  2640  	spin_unlock(&adapter->lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2641  	return rval;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2642  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  2643  

:::::: The code at line 2516 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
