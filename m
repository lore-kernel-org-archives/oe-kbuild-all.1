Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0481F95C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696276012; x=1727812012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvtvOv8gwoqsCKHeC23lVHRSbKqRkFRRT+Fl5/48rlM=;
  b=GcMi12zpiDdp8mgyACta83p3o3aU65EIJ2ZBAKMaZaRruob5RatLIul4
   EbEuWyaJBDMwbDseDls1CRK6cR823pcIfcFSnBx448ytsLtkD+G2+1ikE
   Rug92WLDfPO0Y07fh4BAQTaF3/a01ld1RgCmx4bDphFYEasW9MMR2q6Yq
   nTEgxEqiZfeQ78XMmt+Sm6pUajzN+PgqBh1vQ4Jo/u8dgMTGxd/+7tL+k
   Q2w0zJzIoxqp+QatdozBKaDwfCFmr/sOZt6ARAFEQd4OMBjbMZGwDgxbA
   NyKWJy5GBRtUKc+8OiulsRuhX04AG66zs+WBw5hQoeKMWRWOp7sBsp1z9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446880471"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="446880471"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 12:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="780048922"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="780048922"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Oct 2023 12:46:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnOsN-0006Jj-1T;
	Mon, 02 Oct 2023 19:46:43 +0000
Date: Tue, 3 Oct 2023 03:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Subject: [hare-scsi-devel:eh-rework.v5 16/40] drivers/scsi/pmcraid.c:2697:
 warning: Function parameter or member 'scsi_dev' not described in
 'pmcraid_reset_device'
Message-ID: <202310030321.bjJOeQso-lkp@intel.com>
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
commit: 51d10be076da178ea0e124933b100abc1b100f3d [16/40] pmcraid: Select device in pmcraid_eh_bus_reset_handler()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030321.bjJOeQso-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030321.bjJOeQso-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030321.bjJOeQso-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/pmcraid.c:2697: warning: Function parameter or member 'scsi_dev' not described in 'pmcraid_reset_device'
>> drivers/scsi/pmcraid.c:2697: warning: Excess function parameter 'scsi_cmd' description in 'pmcraid_reset_device'


vim +2697 drivers/scsi/pmcraid.c

89a36810415077 Anil Ravindranath 2009-08-25  2678  
89a36810415077 Anil Ravindranath 2009-08-25  2679  /**
89a36810415077 Anil Ravindranath 2009-08-25  2680   * pmcraid_reset_device - device reset handler functions
89a36810415077 Anil Ravindranath 2009-08-25  2681   *
89a36810415077 Anil Ravindranath 2009-08-25  2682   * @scsi_cmd: scsi command struct
3673b7b0007b81 Lee Jones         2021-03-17  2683   * @timeout: command timeout
89a36810415077 Anil Ravindranath 2009-08-25  2684   * @modifier: reset modifier indicating the reset sequence to be performed
89a36810415077 Anil Ravindranath 2009-08-25  2685   *
89a36810415077 Anil Ravindranath 2009-08-25  2686   * This function issues a device reset to the affected device.
89a36810415077 Anil Ravindranath 2009-08-25  2687   * A LUN reset will be sent to the device first. If that does
89a36810415077 Anil Ravindranath 2009-08-25  2688   * not work, a target reset will be sent.
89a36810415077 Anil Ravindranath 2009-08-25  2689   *
89a36810415077 Anil Ravindranath 2009-08-25  2690   * Return value:
89a36810415077 Anil Ravindranath 2009-08-25  2691   *	SUCCESS / FAILED
89a36810415077 Anil Ravindranath 2009-08-25  2692   */
89a36810415077 Anil Ravindranath 2009-08-25  2693  static int pmcraid_reset_device(
51d10be076da17 Hannes Reinecke   2023-10-02  2694  	struct scsi_device *scsi_dev,
89a36810415077 Anil Ravindranath 2009-08-25  2695  	unsigned long timeout,
3673b7b0007b81 Lee Jones         2021-03-17  2696  	u8 modifier)
89a36810415077 Anil Ravindranath 2009-08-25 @2697  {
89a36810415077 Anil Ravindranath 2009-08-25  2698  	struct pmcraid_cmd *cmd;
89a36810415077 Anil Ravindranath 2009-08-25  2699  	struct pmcraid_instance *pinstance;
89a36810415077 Anil Ravindranath 2009-08-25  2700  	struct pmcraid_resource_entry *res;
89a36810415077 Anil Ravindranath 2009-08-25  2701  	struct pmcraid_ioarcb *ioarcb;
89a36810415077 Anil Ravindranath 2009-08-25  2702  	unsigned long lock_flags;
89a36810415077 Anil Ravindranath 2009-08-25  2703  	u32 ioasc;
89a36810415077 Anil Ravindranath 2009-08-25  2704  
89a36810415077 Anil Ravindranath 2009-08-25  2705  	pinstance =
51d10be076da17 Hannes Reinecke   2023-10-02  2706  		(struct pmcraid_instance *)scsi_dev->host->hostdata;
51d10be076da17 Hannes Reinecke   2023-10-02  2707  	res = scsi_dev->hostdata;
89a36810415077 Anil Ravindranath 2009-08-25  2708  
89a36810415077 Anil Ravindranath 2009-08-25  2709  	if (!res) {
51d10be076da17 Hannes Reinecke   2023-10-02  2710  		sdev_printk(KERN_ERR, scsi_dev,
348764024f1cd6 Anil Ravindranath 2009-09-09  2711  			    "reset_device: NULL resource pointer\n");
89a36810415077 Anil Ravindranath 2009-08-25  2712  		return FAILED;
89a36810415077 Anil Ravindranath 2009-08-25  2713  	}
89a36810415077 Anil Ravindranath 2009-08-25  2714  
89a36810415077 Anil Ravindranath 2009-08-25  2715  	/* If adapter is currently going through reset/reload, return failed.
89a36810415077 Anil Ravindranath 2009-08-25  2716  	 * This will force the mid-layer to call _eh_bus/host reset, which
89a36810415077 Anil Ravindranath 2009-08-25  2717  	 * will then go to sleep and wait for the reset to complete
89a36810415077 Anil Ravindranath 2009-08-25  2718  	 */
89a36810415077 Anil Ravindranath 2009-08-25  2719  	spin_lock_irqsave(pinstance->host->host_lock, lock_flags);
89a36810415077 Anil Ravindranath 2009-08-25  2720  	if (pinstance->ioa_reset_in_progress ||
89a36810415077 Anil Ravindranath 2009-08-25  2721  	    pinstance->ioa_state == IOA_STATE_DEAD) {
89a36810415077 Anil Ravindranath 2009-08-25  2722  		spin_unlock_irqrestore(pinstance->host->host_lock, lock_flags);
89a36810415077 Anil Ravindranath 2009-08-25  2723  		return FAILED;
89a36810415077 Anil Ravindranath 2009-08-25  2724  	}
89a36810415077 Anil Ravindranath 2009-08-25  2725  
89a36810415077 Anil Ravindranath 2009-08-25  2726  	res->reset_progress = 1;
89a36810415077 Anil Ravindranath 2009-08-25  2727  	pmcraid_info("Resetting %s resource with addr %x\n",
89a36810415077 Anil Ravindranath 2009-08-25  2728  		     ((modifier & RESET_DEVICE_LUN) ? "LUN" :
89a36810415077 Anil Ravindranath 2009-08-25  2729  		     ((modifier & RESET_DEVICE_TARGET) ? "TARGET" : "BUS")),
89a36810415077 Anil Ravindranath 2009-08-25  2730  		     le32_to_cpu(res->cfg_entry.resource_address));
89a36810415077 Anil Ravindranath 2009-08-25  2731  
89a36810415077 Anil Ravindranath 2009-08-25  2732  	/* get a free cmd block */
89a36810415077 Anil Ravindranath 2009-08-25  2733  	cmd = pmcraid_get_free_cmd(pinstance);
89a36810415077 Anil Ravindranath 2009-08-25  2734  
89a36810415077 Anil Ravindranath 2009-08-25  2735  	if (cmd == NULL) {
89a36810415077 Anil Ravindranath 2009-08-25  2736  		spin_unlock_irqrestore(pinstance->host->host_lock, lock_flags);
89a36810415077 Anil Ravindranath 2009-08-25  2737  		pmcraid_err("%s: no cmd blocks are available\n", __func__);
89a36810415077 Anil Ravindranath 2009-08-25  2738  		return FAILED;
89a36810415077 Anil Ravindranath 2009-08-25  2739  	}
89a36810415077 Anil Ravindranath 2009-08-25  2740  
89a36810415077 Anil Ravindranath 2009-08-25  2741  	ioarcb = &cmd->ioa_cb->ioarcb;
89a36810415077 Anil Ravindranath 2009-08-25  2742  	ioarcb->resource_handle = res->cfg_entry.resource_handle;
89a36810415077 Anil Ravindranath 2009-08-25  2743  	ioarcb->request_type = REQ_TYPE_IOACMD;
89a36810415077 Anil Ravindranath 2009-08-25  2744  	ioarcb->cdb[0] = PMCRAID_RESET_DEVICE;
89a36810415077 Anil Ravindranath 2009-08-25  2745  
89a36810415077 Anil Ravindranath 2009-08-25  2746  	/* Initialize reset modifier bits */
89a36810415077 Anil Ravindranath 2009-08-25  2747  	if (modifier)
89a36810415077 Anil Ravindranath 2009-08-25  2748  		modifier = ENABLE_RESET_MODIFIER | modifier;
89a36810415077 Anil Ravindranath 2009-08-25  2749  
89a36810415077 Anil Ravindranath 2009-08-25  2750  	ioarcb->cdb[1] = modifier;
89a36810415077 Anil Ravindranath 2009-08-25  2751  
89a36810415077 Anil Ravindranath 2009-08-25  2752  	init_completion(&cmd->wait_for_completion);
89a36810415077 Anil Ravindranath 2009-08-25  2753  	cmd->completion_req = 1;
89a36810415077 Anil Ravindranath 2009-08-25  2754  
89a36810415077 Anil Ravindranath 2009-08-25  2755  	pmcraid_info("cmd(CDB[0] = %x) for %x with index = %d\n",
89a36810415077 Anil Ravindranath 2009-08-25  2756  		     cmd->ioa_cb->ioarcb.cdb[0],
89a36810415077 Anil Ravindranath 2009-08-25  2757  		     le32_to_cpu(cmd->ioa_cb->ioarcb.resource_handle),
89a36810415077 Anil Ravindranath 2009-08-25  2758  		     le32_to_cpu(cmd->ioa_cb->ioarcb.response_handle) >> 2);
89a36810415077 Anil Ravindranath 2009-08-25  2759  
89a36810415077 Anil Ravindranath 2009-08-25  2760  	pmcraid_send_cmd(cmd,
89a36810415077 Anil Ravindranath 2009-08-25  2761  			 pmcraid_internal_done,
89a36810415077 Anil Ravindranath 2009-08-25  2762  			 timeout,
89a36810415077 Anil Ravindranath 2009-08-25  2763  			 pmcraid_timeout_handler);
89a36810415077 Anil Ravindranath 2009-08-25  2764  
89a36810415077 Anil Ravindranath 2009-08-25  2765  	spin_unlock_irqrestore(pinstance->host->host_lock, lock_flags);
89a36810415077 Anil Ravindranath 2009-08-25  2766  
89a36810415077 Anil Ravindranath 2009-08-25  2767  	/* RESET_DEVICE command completes after all pending IOARCBs are
89a36810415077 Anil Ravindranath 2009-08-25  2768  	 * completed. Once this command is completed, pmcraind_internal_done
89a36810415077 Anil Ravindranath 2009-08-25  2769  	 * will wake up the 'completion' queue.
89a36810415077 Anil Ravindranath 2009-08-25  2770  	 */
89a36810415077 Anil Ravindranath 2009-08-25  2771  	wait_for_completion(&cmd->wait_for_completion);
89a36810415077 Anil Ravindranath 2009-08-25  2772  
89a36810415077 Anil Ravindranath 2009-08-25  2773  	/* complete the command here itself and return the command block
89a36810415077 Anil Ravindranath 2009-08-25  2774  	 * to free list
89a36810415077 Anil Ravindranath 2009-08-25  2775  	 */
89a36810415077 Anil Ravindranath 2009-08-25  2776  	pmcraid_return_cmd(cmd);
89a36810415077 Anil Ravindranath 2009-08-25  2777  	res->reset_progress = 0;
89a36810415077 Anil Ravindranath 2009-08-25  2778  	ioasc = le32_to_cpu(cmd->ioa_cb->ioasa.ioasc);
89a36810415077 Anil Ravindranath 2009-08-25  2779  
89a36810415077 Anil Ravindranath 2009-08-25  2780  	/* set the return value based on the returned ioasc */
89a36810415077 Anil Ravindranath 2009-08-25  2781  	return PMCRAID_IOASC_SENSE_KEY(ioasc) ? FAILED : SUCCESS;
89a36810415077 Anil Ravindranath 2009-08-25  2782  }
89a36810415077 Anil Ravindranath 2009-08-25  2783  

:::::: The code at line 2697 was first introduced by commit
:::::: 89a3681041507773dfee1b88c1c90c8a811a79d3 [SCSI] pmcraid: PMC-Sierra MaxRAID driver to support 6Gb/s SAS RAID controller

:::::: TO: Anil Ravindranath <anil_ravindranath@pmc-sierra.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
