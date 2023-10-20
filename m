Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1802FAF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ak+60hlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697791382; x=1729327382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOMQf1feLIC29prfQ8LH9VNuHBZkDf9/xOD2d48YYlE=;
  b=ak+60hlIz66pg1PrQATGF+QnJfuQtLKgmBPvzxiVcYPCNaEqw05wjYg4
   vrLVAkd0twxFAMFlybYh5MZaDTzfek4C0DAbo40LFNXUc3MfoZuEnl0iv
   0upV+O61r6cZ1qPLXnjSlaYaZu48EdxUUMdrF3ZA6LxsEfguT2NUtICpp
   TIZBxnxyly/86KORE7AN5CGXOQVr73vIbBQXdPfaIbLgiiUodpxFYCQCV
   b7JVafn/CtKPg2zxgDpWuTlCsTVvIH4rh+op5NmuVsNeYArFl7QW6j1SE
   m2w5kO3OtnqdJXMVK24sD6yjAsigY1840nLboo35+Byz7akRSds6bRova
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="376836851"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="376836851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750850258"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="750850258"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2023 01:42:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtl5s-0003HQ-1I;
	Fri, 20 Oct 2023 08:42:56 +0000
Date: Fri, 20 Oct 2023 16:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [hare-scsi-devel:eh-rework.v6 18/26] drivers/scsi/ppa.c:894:30:
 error: 'cmd' undeclared
Message-ID: <202310201629.Qr9RzrQC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git eh-rework.v6
head:   1e93963cdc1f4d2671b12c37a09b861f40313768
commit: 189a3307c1e67ee20438433ad40f71fd7521726d [18/26] scsi: Use Scsi_Host as argument for eh_host_reset_handler
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310201629.Qr9RzrQC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201629.Qr9RzrQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201629.Qr9RzrQC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/ppa.c: In function 'ppa_reset':
>> drivers/scsi/ppa.c:894:30: error: 'cmd' undeclared (first use in this function)
     894 |         if (ppa_scsi_pointer(cmd)->phase)
         |                              ^~~
   drivers/scsi/ppa.c:894:30: note: each undeclared identifier is reported only once for each function it appears in


vim +/cmd +894 drivers/scsi/ppa.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  889  
189a3307c1e67e Hannes Reinecke 2023-10-02  890  static int ppa_reset(struct Scsi_Host *host)
^1da177e4c3f41 Linus Torvalds  2005-04-16  891  {
189a3307c1e67e Hannes Reinecke 2023-10-02  892  	ppa_struct *dev = ppa_dev(host);
^1da177e4c3f41 Linus Torvalds  2005-04-16  893  
4a938517fbebcd Bart Van Assche 2022-02-18 @894  	if (ppa_scsi_pointer(cmd)->phase)
^1da177e4c3f41 Linus Torvalds  2005-04-16  895  		ppa_disconnect(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  896  	dev->cur_cmd = NULL;	/* Forget the problem */
^1da177e4c3f41 Linus Torvalds  2005-04-16  897  
^1da177e4c3f41 Linus Torvalds  2005-04-16  898  	ppa_connect(dev, CONNECT_NORMAL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  899  	ppa_reset_pulse(dev->base);
68b3aa7c9805ae Jeff Garzik     2005-05-28  900  	mdelay(1);		/* device settle delay */
^1da177e4c3f41 Linus Torvalds  2005-04-16  901  	ppa_disconnect(dev);
68b3aa7c9805ae Jeff Garzik     2005-05-28  902  	mdelay(1);		/* device settle delay */
^1da177e4c3f41 Linus Torvalds  2005-04-16  903  	return SUCCESS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  904  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  905  

:::::: The code at line 894 was first introduced by commit
:::::: 4a938517fbebcd64e602435ea459d41a74a87220 scsi: ppa: Move the SCSI pointer to private command data

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
