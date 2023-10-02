Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A81DDC3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 21:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696281592; x=1727817592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQTm+Aq/4/rH0PZdAl7kOoZYvlz71GceGmf/H9atHLU=;
  b=DzFJpd4WoTJdv4bPgzt6fJ8XJv/4HFbDKSB/GJUbP5d5EE46RWWDG4Kr
   6LkNt9RwiYF37K+SYO5Gi2PjbhUHDKSV4t69OnM+yaoVVRu+yFq95y52S
   MPL4WKxEvJ84SbGlXTzzJ9SFRzMZEwqn/Yhe5cifqMleDCpKpGI6LzqET
   CeCaOReYSCsheVYOggjcHjhYeXHqRe/9ZhuBa5WKqIpCiGiaC3osjTU6D
   V+tuSPTTzNaN1/9w+o8N2cZYdaYkEzlecV/b9izm9wKZgz5MeaHtUFyif
   CfZ/UDhL6vZJ2pjpvXPU1/ZbX5oc9F+XR8bl3cxdz8ccagHJ76QlkIOXb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367790046"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="367790046"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 14:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="785888522"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="785888522"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Oct 2023 14:19:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnQKR-0006O5-29;
	Mon, 02 Oct 2023 21:19:47 +0000
Date: Tue, 3 Oct 2023 05:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 20/40]
 drivers/scsi/bfa/bfad_im.c:374:30: warning: variable 'itnim' set but not
 used
Message-ID: <202310030518.a5TzJHLE-lkp@intel.com>
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
commit: 1602a64ff5a701c7b3efd43f5667d75fbb61764d [20/40] bfa: Do not use scsi command to signal TMF status
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030518.a5TzJHLE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030518.a5TzJHLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030518.a5TzJHLE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/bfa/bfad_im.c: In function 'bfad_im_reset_target_handler':
>> drivers/scsi/bfa/bfad_im.c:374:30: warning: variable 'itnim' set but not used [-Wunused-but-set-variable]
     374 |         struct bfad_itnim_s *itnim;
         |                              ^~~~~


vim +/itnim +374 drivers/scsi/bfa/bfad_im.c

7725ccfda59715 Jing Huang      2009-09-23  360  
5fbe25c7a66460 Jing Huang      2010-10-18  361  /*
1b7092f35e0928 Hannes Reinecke 2017-08-25  362   * Scsi_Host template entry, resets the target and abort all commands.
7725ccfda59715 Jing Huang      2009-09-23  363   */
7725ccfda59715 Jing Huang      2009-09-23  364  static int
1b7092f35e0928 Hannes Reinecke 2017-08-25  365  bfad_im_reset_target_handler(struct scsi_cmnd *cmnd)
7725ccfda59715 Jing Huang      2009-09-23  366  {
7725ccfda59715 Jing Huang      2009-09-23  367  	struct Scsi_Host *shost = cmnd->device->host;
1b7092f35e0928 Hannes Reinecke 2017-08-25  368  	struct scsi_target *starget = scsi_target(cmnd->device);
1602a64ff5a701 Hannes Reinecke 2023-10-02  369  	struct fc_rport *rport = starget_to_rport(starget);
7725ccfda59715 Jing Huang      2009-09-23  370  	struct bfad_im_port_s *im_port =
7725ccfda59715 Jing Huang      2009-09-23  371  				(struct bfad_im_port_s *) shost->hostdata[0];
7725ccfda59715 Jing Huang      2009-09-23  372  	struct bfad_s *bfad = im_port->bfad;
1602a64ff5a701 Hannes Reinecke 2023-10-02  373  	struct bfad_itnim_data_s *itnim_data;
7725ccfda59715 Jing Huang      2009-09-23 @374  	struct bfad_itnim_s *itnim;
7725ccfda59715 Jing Huang      2009-09-23  375  	unsigned long flags;
1b7092f35e0928 Hannes Reinecke 2017-08-25  376  	u32 rc, rtn = FAILED;
6d154db6b3fc3c Yong Zhang      2010-08-10  377  	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(wq);
7725ccfda59715 Jing Huang      2009-09-23  378  	enum bfi_tskim_status task_status;
7725ccfda59715 Jing Huang      2009-09-23  379  
7725ccfda59715 Jing Huang      2009-09-23  380  	spin_lock_irqsave(&bfad->bfad_lock, flags);
1602a64ff5a701 Hannes Reinecke 2023-10-02  381  	if (!rport->dd_data) {
1602a64ff5a701 Hannes Reinecke 2023-10-02  382  		spin_unlock_irqrestore(&bfad->bfad_lock, flags);
1602a64ff5a701 Hannes Reinecke 2023-10-02  383  		return rtn;
1602a64ff5a701 Hannes Reinecke 2023-10-02  384  	}
1602a64ff5a701 Hannes Reinecke 2023-10-02  385  	itnim_data = rport->dd_data;
1602a64ff5a701 Hannes Reinecke 2023-10-02  386  	if (itnim_data->tmf_wq) {
1602a64ff5a701 Hannes Reinecke 2023-10-02  387  		BFA_LOG(KERN_ERR, bfad, bfa_log_level,
1602a64ff5a701 Hannes Reinecke 2023-10-02  388  			"target reset failed, TMF already active");
1602a64ff5a701 Hannes Reinecke 2023-10-02  389  		spin_unlock_irqrestore(&bfad->bfad_lock, flags);
1602a64ff5a701 Hannes Reinecke 2023-10-02  390  		return rtn;
1602a64ff5a701 Hannes Reinecke 2023-10-02  391  	}
1602a64ff5a701 Hannes Reinecke 2023-10-02  392  	itnim = itnim_data->itnim;
1602a64ff5a701 Hannes Reinecke 2023-10-02  393  	itnim_data->tmf_wq = &wq;
1602a64ff5a701 Hannes Reinecke 2023-10-02  394  	itnim_data->tmf_status = 0;
1602a64ff5a701 Hannes Reinecke 2023-10-02  395  	rc = bfad_im_target_reset_send(bfad, itnim_data);
1b7092f35e0928 Hannes Reinecke 2017-08-25  396  	if (rc == BFA_STATUS_OK) {
7725ccfda59715 Jing Huang      2009-09-23  397  		/* wait target reset to complete */
7725ccfda59715 Jing Huang      2009-09-23  398  		spin_unlock_irqrestore(&bfad->bfad_lock, flags);
7725ccfda59715 Jing Huang      2009-09-23  399  		wait_event(wq, test_bit(IO_DONE_BIT,
1602a64ff5a701 Hannes Reinecke 2023-10-02  400  					&itnim_data->tmf_status));
7725ccfda59715 Jing Huang      2009-09-23  401  		spin_lock_irqsave(&bfad->bfad_lock, flags);
7725ccfda59715 Jing Huang      2009-09-23  402  
1602a64ff5a701 Hannes Reinecke 2023-10-02  403  		task_status = itnim_data->tmf_status >> 1;
1b7092f35e0928 Hannes Reinecke 2017-08-25  404  		if (task_status != BFI_TSKIM_STS_OK)
8816624222b12e Jing Huang      2010-12-09  405  			BFA_LOG(KERN_ERR, bfad, bfa_log_level,
7725ccfda59715 Jing Huang      2009-09-23  406  				"target reset failure,"
7725ccfda59715 Jing Huang      2009-09-23  407  				" status: %d\n", task_status);
1b7092f35e0928 Hannes Reinecke 2017-08-25  408  		else
1b7092f35e0928 Hannes Reinecke 2017-08-25  409  			rtn = SUCCESS;
7725ccfda59715 Jing Huang      2009-09-23  410  	}
7725ccfda59715 Jing Huang      2009-09-23  411  	spin_unlock_irqrestore(&bfad->bfad_lock, flags);
7725ccfda59715 Jing Huang      2009-09-23  412  
1b7092f35e0928 Hannes Reinecke 2017-08-25  413  	return rtn;
7725ccfda59715 Jing Huang      2009-09-23  414  }
7725ccfda59715 Jing Huang      2009-09-23  415  

:::::: The code at line 374 was first introduced by commit
:::::: 7725ccfda59715ecf8f99e3b520a0b84cc2ea79e [SCSI] bfa: Brocade BFA FC SCSI driver

:::::: TO: Jing Huang <huangj@brocade.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
