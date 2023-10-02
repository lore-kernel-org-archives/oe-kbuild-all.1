Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B7F1F195
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696274234; x=1727810234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwzVT6Ey/AgCkrkZmaW/sHUTeqCsaV+z6w2ibZ/ittE=;
  b=MRIXrBEddPls1EnlemTRPVx/c7ePAqa+IpU8wZSY7Di3ELHNeHUQSVec
   ODsUU8gX+eBjAA8Sl1Z5x8F3ZaGF4CIARDuOaoO9vH5zxrdn/wzqCX4gf
   XbXUSSQlztf7aYvxXY4Rz+E5zJRdfzVX9nX22Ri6kdgBqD8EXd/JsSMIZ
   huNePYOVHO7wNffmsO0qDDtJaBcMgnwNS2B5rNXnfwDV521quibH4VmIv
   xqEaW3PIajMyj8c+4WiaLZAzrt0pOE52CxwCYw9Ht+W4bq2cAXiKX/3qH
   l/uKhI34kpP8ZiYLiW+9/X4+LIinB+QtvLr5IKe3gmC8iQFrcZ467t186
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446866291"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="446866291"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 11:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700429140"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="700429140"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Oct 2023 11:45:29 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnNv3-0006HJ-1W;
	Mon, 02 Oct 2023 18:45:26 +0000
Date: Tue, 3 Oct 2023 02:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 34/40]
 drivers/scsi/ibmvscsi/ibmvscsi.c:1739: warning: Function parameter or member
 'shost' not described in 'ibmvscsi_eh_host_reset_handler'
Message-ID: <202310030202.Fd052ywX-lkp@intel.com>
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
commit: ba9aa6b27826de8ba176e40f9db4e9b941fbe0e9 [34/40] scsi: Use Scsi_Host as argument for eh_host_reset_handler
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231003/202310030202.Fd052ywX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030202.Fd052ywX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030202.Fd052ywX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/ibmvscsi/ibmvscsi.c:1043: warning: Excess function parameter 'done' description in 'ibmvscsi_queuecommand_lck'
>> drivers/scsi/ibmvscsi/ibmvscsi.c:1739: warning: Function parameter or member 'shost' not described in 'ibmvscsi_eh_host_reset_handler'
>> drivers/scsi/ibmvscsi/ibmvscsi.c:1739: warning: Excess function parameter 'cmd' description in 'ibmvscsi_eh_host_reset_handler'
--
>> drivers/scsi/ibmvscsi/ibmvfc.c:2991: warning: Function parameter or member 'shost' not described in 'ibmvfc_eh_host_reset_handler'
>> drivers/scsi/ibmvscsi/ibmvfc.c:2991: warning: Excess function parameter 'cmd' description in 'ibmvfc_eh_host_reset_handler'


vim +1739 drivers/scsi/ibmvscsi/ibmvscsi.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1733  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1734  /**
3d0e91f7ace124 Brian King      2007-06-13  1735   * ibmvscsi_eh_host_reset_handler - Reset the connection to the server
3d0e91f7ace124 Brian King      2007-06-13  1736   * @cmd:	struct scsi_cmnd having problems
^1da177e4c3f41 Linus Torvalds  2005-04-16  1737  */
ba9aa6b27826de Hannes Reinecke 2023-10-02  1738  static int ibmvscsi_eh_host_reset_handler(struct Scsi_Host *shost)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1739  {
3d0e91f7ace124 Brian King      2007-06-13  1740  	unsigned long wait_switch = 0;
ba9aa6b27826de Hannes Reinecke 2023-10-02  1741  	struct ibmvscsi_host_data *hostdata = shost_priv(shost);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1742  
3d0e91f7ace124 Brian King      2007-06-13  1743  	dev_err(hostdata->dev, "Resetting connection due to error recovery\n");
3d0e91f7ace124 Brian King      2007-06-13  1744  
3d0e91f7ace124 Brian King      2007-06-13  1745  	ibmvscsi_reset_host(hostdata);
3d0e91f7ace124 Brian King      2007-06-13  1746  
3d0e91f7ace124 Brian King      2007-06-13  1747  	for (wait_switch = jiffies + (init_timeout * HZ);
3d0e91f7ace124 Brian King      2007-06-13  1748  	     time_before(jiffies, wait_switch) &&
3d0e91f7ace124 Brian King      2007-06-13  1749  		     atomic_read(&hostdata->request_limit) < 2;) {
3d0e91f7ace124 Brian King      2007-06-13  1750  
3d0e91f7ace124 Brian King      2007-06-13  1751  		msleep(10);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1752  	}
3d0e91f7ace124 Brian King      2007-06-13  1753  
3d0e91f7ace124 Brian King      2007-06-13  1754  	if (atomic_read(&hostdata->request_limit) <= 0)
3d0e91f7ace124 Brian King      2007-06-13  1755  		return FAILED;
3d0e91f7ace124 Brian King      2007-06-13  1756  
3d0e91f7ace124 Brian King      2007-06-13  1757  	return SUCCESS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1758  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1759  

:::::: The code at line 1739 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
