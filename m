Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DCA15BD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696274852; x=1727810852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qYfzBmrJ925ndcy18yqL9x/lL0tL4XgU1uaTQ7c5iqg=;
  b=if7WwUNCYfpGAccrG0Vo2jyd7mjeapkUt2kTe5bZopSuCUEAutrPmgbk
   SvPe9Pqtx7XEB293AZJ9MYkGziiZJJ1Hg9TNtQF86BJ20uq3VBczjuDqk
   XOF706lcIwhCtkBTNF71GzpOfCpZMPeGPIYvtPfK2syAiC6zyjGTG3awu
   0M/cf/C+9qBVemTGfdPy6S6KGyN/OEcENxtstunyGyj6P6KQ0I6uy+T1f
   Iuq1C1nUN5LNkT0w5MsOJuxEvvLUWHgCQJEiW9iqc6goiVPKtW5u9HJzm
   Qr2n40CgjfbGHGrmhVNy7co255sjf2oep1l762eSvIjGL79tX5IBHTNXh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381596780"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381596780"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 12:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700432719"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="700432719"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Oct 2023 12:05:34 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnOEW-0006IH-1V;
	Mon, 02 Oct 2023 19:05:32 +0000
Date: Tue, 3 Oct 2023 03:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Subject: [hare-scsi-devel:eh-rework.v5 26/40] drivers/scsi/libiscsi.c:2604:
 warning: Function parameter or member 'cls_session' not described in
 'iscsi_eh_session_reset'
Message-ID: <202310030259.zR0AbxGG-lkp@intel.com>
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
commit: 0fb9f5c6c5a83bff6e55471b7462809867ccd9b8 [26/40] libiscsi: use cls_session as argument for target and session reset
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030259.zR0AbxGG-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030259.zR0AbxGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030259.zR0AbxGG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/libiscsi.c:2604: warning: Function parameter or member 'cls_session' not described in 'iscsi_eh_session_reset'
>> drivers/scsi/libiscsi.c:2604: warning: Excess function parameter 'sc' description in 'iscsi_eh_session_reset'
>> drivers/scsi/libiscsi.c:2670: warning: Function parameter or member 'cls_session' not described in 'iscsi_eh_target_reset'
>> drivers/scsi/libiscsi.c:2670: warning: Excess function parameter 'sc' description in 'iscsi_eh_target_reset'


vim +2604 drivers/scsi/libiscsi.c

3fe5ae8b4c4d3a Mike Christie       2009-11-11  2595  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2596  /**
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2597   * iscsi_eh_session_reset - drop session and attempt relogin
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2598   * @sc: scsi command
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2599   *
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2600   * This function will wait for a relogin, session termination from
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2601   * userspace, or a recovery/replacement timeout.
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2602   */
0fb9f5c6c5a83b Hannes Reinecke     2023-10-02  2603  int iscsi_eh_session_reset(struct iscsi_cls_session *cls_session)
3fe5ae8b4c4d3a Mike Christie       2009-11-11 @2604  {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2605  	struct iscsi_session *session;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2606  	struct iscsi_conn *conn;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2607  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2608  	session = cls_session->dd_data;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2609  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2610  	mutex_lock(&session->eh_mutex);
659743b02c4110 Shlomo Pongratz     2014-02-07  2611  	spin_lock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2612  	if (session->state == ISCSI_STATE_TERMINATE) {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2613  failed:
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2614  		ISCSI_DBG_EH(session,
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2615  			     "failing session reset: Could not log back into "
5db6dd14b31397 Fred Herard         2018-11-20  2616  			     "%s [age %d]\n", session->targetname,
5db6dd14b31397 Fred Herard         2018-11-20  2617  			     session->age);
659743b02c4110 Shlomo Pongratz     2014-02-07  2618  		spin_unlock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2619  		mutex_unlock(&session->eh_mutex);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2620  		return FAILED;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2621  	}
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2622  
fda290c5ae98b5 Mike Christie       2021-05-25  2623  	conn = session->leadconn;
fda290c5ae98b5 Mike Christie       2021-05-25  2624  	iscsi_get_conn(conn->cls_conn);
fda290c5ae98b5 Mike Christie       2021-05-25  2625  
659743b02c4110 Shlomo Pongratz     2014-02-07  2626  	spin_unlock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2627  	mutex_unlock(&session->eh_mutex);
fda290c5ae98b5 Mike Christie       2021-05-25  2628  
df4da5cdfca05b Mike Christie       2010-12-31  2629  	iscsi_conn_failure(conn, ISCSI_ERR_SCSI_EH_SESSION_RST);
fda290c5ae98b5 Mike Christie       2021-05-25  2630  	iscsi_put_conn(conn->cls_conn);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2631  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2632  	ISCSI_DBG_EH(session, "wait for relogin\n");
ec29d0ac29be36 Mike Christie       2021-05-25  2633  	wait_event_interruptible(session->ehwait,
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2634  				 session->state == ISCSI_STATE_TERMINATE ||
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2635  				 session->state == ISCSI_STATE_LOGGED_IN ||
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2636  				 session->state == ISCSI_STATE_RECOVERY_FAILED);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2637  	if (signal_pending(current))
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2638  		flush_signals(current);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2639  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2640  	mutex_lock(&session->eh_mutex);
659743b02c4110 Shlomo Pongratz     2014-02-07  2641  	spin_lock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2642  	if (session->state == ISCSI_STATE_LOGGED_IN) {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2643  		ISCSI_DBG_EH(session,
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2644  			     "session reset succeeded for %s,%s\n",
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2645  			     session->targetname, conn->persistent_address);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2646  	} else
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2647  		goto failed;
659743b02c4110 Shlomo Pongratz     2014-02-07  2648  	spin_unlock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2649  	mutex_unlock(&session->eh_mutex);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2650  	return SUCCESS;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2651  }
309ce156aa27f2 Jayamohan Kallickal 2010-02-20  2652  EXPORT_SYMBOL_GPL(iscsi_eh_session_reset);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2653  
0fb9f5c6c5a83b Hannes Reinecke     2023-10-02  2654  static void iscsi_prep_tgt_reset_pdu(struct iscsi_tm *hdr)
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2655  {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2656  	memset(hdr, 0, sizeof(*hdr));
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2657  	hdr->opcode = ISCSI_OP_SCSI_TMFUNC | ISCSI_OP_IMMEDIATE;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2658  	hdr->flags = ISCSI_TM_FUNC_TARGET_WARM_RESET & ISCSI_FLAG_TM_FUNC_MASK;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2659  	hdr->flags |= ISCSI_FLAG_CMD_FINAL;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2660  	hdr->rtt = RESERVED_ITT;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2661  }
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2662  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2663  /**
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2664   * iscsi_eh_target_reset - reset target
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2665   * @sc: scsi command
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2666   *
309ce156aa27f2 Jayamohan Kallickal 2010-02-20  2667   * This will attempt to send a warm target reset.
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2668   */
0fb9f5c6c5a83b Hannes Reinecke     2023-10-02  2669  static int iscsi_eh_target_reset(struct iscsi_cls_session *cls_session)
3fe5ae8b4c4d3a Mike Christie       2009-11-11 @2670  {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2671  	struct iscsi_session *session;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2672  	struct iscsi_conn *conn;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2673  	struct iscsi_tm *hdr;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2674  	int rc = FAILED;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2675  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2676  	session = cls_session->dd_data;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2677  
0fb9f5c6c5a83b Hannes Reinecke     2023-10-02  2678  	ISCSI_DBG_EH(session, "tgt Reset [tgt %s]\n", session->targetname);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2679  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2680  	mutex_lock(&session->eh_mutex);
659743b02c4110 Shlomo Pongratz     2014-02-07  2681  	spin_lock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2682  	/*
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2683  	 * Just check if we are not logged in. We cannot check for
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2684  	 * the phase because the reset could come from a ioctl.
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2685  	 */
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2686  	if (!session->leadconn || session->state != ISCSI_STATE_LOGGED_IN)
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2687  		goto unlock;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2688  	conn = session->leadconn;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2689  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2690  	/* only have one tmf outstanding at a time */
ec29d0ac29be36 Mike Christie       2021-05-25  2691  	if (session->tmf_state != TMF_INITIAL)
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2692  		goto unlock;
ec29d0ac29be36 Mike Christie       2021-05-25  2693  	session->tmf_state = TMF_QUEUED;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2694  
ec29d0ac29be36 Mike Christie       2021-05-25  2695  	hdr = &session->tmhdr;
0fb9f5c6c5a83b Hannes Reinecke     2023-10-02  2696  	iscsi_prep_tgt_reset_pdu(hdr);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2697  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2698  	if (iscsi_exec_task_mgmt_fn(conn, hdr, session->age,
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2699  				    session->tgt_reset_timeout)) {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2700  		rc = FAILED;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2701  		goto unlock;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2702  	}
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2703  
ec29d0ac29be36 Mike Christie       2021-05-25  2704  	switch (session->tmf_state) {
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2705  	case TMF_SUCCESS:
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2706  		break;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2707  	case TMF_TIMEDOUT:
659743b02c4110 Shlomo Pongratz     2014-02-07  2708  		spin_unlock_bh(&session->frwd_lock);
df4da5cdfca05b Mike Christie       2010-12-31  2709  		iscsi_conn_failure(conn, ISCSI_ERR_SCSI_EH_SESSION_RST);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2710  		goto done;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2711  	default:
ec29d0ac29be36 Mike Christie       2021-05-25  2712  		session->tmf_state = TMF_INITIAL;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2713  		goto unlock;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2714  	}
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2715  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2716  	rc = SUCCESS;
659743b02c4110 Shlomo Pongratz     2014-02-07  2717  	spin_unlock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2718  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2719  	iscsi_suspend_tx(conn);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2720  
659743b02c4110 Shlomo Pongratz     2014-02-07  2721  	spin_lock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2722  	memset(hdr, 0, sizeof(*hdr));
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2723  	fail_scsi_tasks(conn, -1, DID_ERROR);
ec29d0ac29be36 Mike Christie       2021-05-25  2724  	session->tmf_state = TMF_INITIAL;
659743b02c4110 Shlomo Pongratz     2014-02-07  2725  	spin_unlock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2726  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2727  	iscsi_start_tx(conn);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2728  	goto done;
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2729  
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2730  unlock:
659743b02c4110 Shlomo Pongratz     2014-02-07  2731  	spin_unlock_bh(&session->frwd_lock);
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2732  done:
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2733  	ISCSI_DBG_EH(session, "tgt %s reset result = %s\n", session->targetname,
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2734  		     rc == SUCCESS ? "SUCCESS" : "FAILED");
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2735  	mutex_unlock(&session->eh_mutex);
309ce156aa27f2 Jayamohan Kallickal 2010-02-20  2736  	return rc;
309ce156aa27f2 Jayamohan Kallickal 2010-02-20  2737  }
3fe5ae8b4c4d3a Mike Christie       2009-11-11  2738  

:::::: The code at line 2604 was first introduced by commit
:::::: 3fe5ae8b4c4d3a82c755074878da7ddb9dde381e [SCSI] libiscsi: add warm target reset tmf support

:::::: TO: Mike Christie <michaelc@cs.wisc.edu>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
