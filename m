Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDA3125B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 13:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6hTb3iM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697291197; x=1728827197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HVkoYsaKiLlnLoFnmsJN+MQt/kmy04rWyd9Hn11FS4w=;
  b=f6hTb3iMZ5w7LozRexQEi+O+WGFGqH89tSkoyYZeP33mhC8+zfbtn9vQ
   hiToG0DHgMRu9fwpPHh2OXVvq2IZMPZrK+RT919mhONmqt/gZ+DyY9uva
   +YAdW74oZERcN7NwJf5S2Fpk3D0yyMGaZOidKZoW42YZjKEzdhs+0wy+y
   tUhvCBgeJQDTOJQmsymSVhh/EaRf2MpIgzeZJbR6yGKwzMJTZh6J148TA
   2wvmhu03kEmXy8Op9wMe5Y8Jn7BMcq/0zwRvPnT+jLbIIGKvmtBWoxe5P
   BVaLMAKsKz46paSwMDxCG3eaiNxC6pBsA6UT9JjiNciop3gMO+UmeH6Al
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6888778"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6888778"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 06:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755039660"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="755039660"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2023 06:46:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qreyO-0006Cp-0g;
	Sat, 14 Oct 2023 13:46:32 +0000
Date: Sat, 14 Oct 2023 21:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:eh-rework.v5 37/40] drivers/scsi/ipr.c:5097:48:
 error: 'cmd' undeclared; did you mean 'cma'?
Message-ID: <202310142117.BZxJWMWa-lkp@intel.com>
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
commit: 14d6e82a8650383a8699e4ed5c8588bf9a07a582 [37/40] scsi: Use scsi_device as argument to eh_device_reset_handler()
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310142117.BZxJWMWa-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142117.BZxJWMWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142117.BZxJWMWa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/ipr.c: In function 'ipr_eh_dev_reset':
>> drivers/scsi/ipr.c:5097:48: error: 'cmd' undeclared (first use in this function); did you mean 'cma'?
    5097 |                 rc = ipr_wait_for_ops(ioa_cfg, cmd->device, ipr_match_lun);
         |                                                ^~~
         |                                                cma
   drivers/scsi/ipr.c:5097:48: note: each undeclared identifier is reported only once for each function it appears in


vim +5097 drivers/scsi/ipr.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  5079  
14d6e82a865038 Hannes Reinecke 2023-10-02  5080  static int ipr_eh_dev_reset(struct scsi_device *sdev)
94d0e7b805961c Jeff Garzik     2005-05-28  5081  {
94d0e7b805961c Jeff Garzik     2005-05-28  5082  	int rc;
6cdb08172bc89f Brian King      2014-10-30  5083  	struct ipr_ioa_cfg *ioa_cfg;
ef97d8ae12eb20 Brian King      2017-03-15  5084  	struct ipr_resource_entry *res;
6cdb08172bc89f Brian King      2014-10-30  5085  
14d6e82a865038 Hannes Reinecke 2023-10-02  5086  	ioa_cfg = (struct ipr_ioa_cfg *) sdev->host->hostdata;
14d6e82a865038 Hannes Reinecke 2023-10-02  5087  	res = sdev->hostdata;
ef97d8ae12eb20 Brian King      2017-03-15  5088  
ef97d8ae12eb20 Brian King      2017-03-15  5089  	if (!res)
ef97d8ae12eb20 Brian King      2017-03-15  5090  		return FAILED;
94d0e7b805961c Jeff Garzik     2005-05-28  5091  
14d6e82a865038 Hannes Reinecke 2023-10-02  5092  	spin_lock_irq(sdev->host->host_lock);
14d6e82a865038 Hannes Reinecke 2023-10-02  5093  	rc = __ipr_eh_dev_reset(sdev);
14d6e82a865038 Hannes Reinecke 2023-10-02  5094  	spin_unlock_irq(sdev->host->host_lock);
94d0e7b805961c Jeff Garzik     2005-05-28  5095  
65a15d6560dff0 Brian King      2023-04-12  5096  	if (rc == SUCCESS)
6cdb08172bc89f Brian King      2014-10-30 @5097  		rc = ipr_wait_for_ops(ioa_cfg, cmd->device, ipr_match_lun);
6cdb08172bc89f Brian King      2014-10-30  5098  
94d0e7b805961c Jeff Garzik     2005-05-28  5099  	return rc;
94d0e7b805961c Jeff Garzik     2005-05-28  5100  }
94d0e7b805961c Jeff Garzik     2005-05-28  5101  

:::::: The code at line 5097 was first introduced by commit
:::::: 6cdb08172bc89f0a39e1643c5e7eab362692fd1b ipr: wait for aborted command responses

:::::: TO: Brian King <brking@linux.vnet.ibm.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
