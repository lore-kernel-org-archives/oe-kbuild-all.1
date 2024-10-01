Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084A1CCB5E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727809901; cv=none; b=RxAs4yTNR2Yvep7keVxl9T/VNoe+gfKTVQn15zScanuuvLUHS8oUQRABF61fbbjmuWx0EBCJt3I8d8MqJ5D/Abb2WZQo1ti3rVGUd53ZxVioUCUz4iNaIwTdLGZ8SLYJfAcuoLkdLEAmTLN/4kOlp5CauVPz4UjFjT8HeBtz7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727809901; c=relaxed/simple;
	bh=sd8ncYzEfj0DpDYWR/3PJ8zV+XhjWBt8niBMbI5YkkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvicjhD5U4IC3RIQlXNL47Z+92vMQT7Mvc+gBNB4Z+UgSfnKy1Pd1zdILUmC8Q2nhsMt83PBEVk4vjBeA+Sp0UkVEthD6ZvZ/1Ds1onjll7f39Zno3tCQaXDKfnoNx3PBjETz4fRKb59HBn/6UR4ZSxxtONvBF4HMU6eL2My7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZKLxcjx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZKLxcjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727809899; x=1759345899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sd8ncYzEfj0DpDYWR/3PJ8zV+XhjWBt8niBMbI5YkkQ=;
  b=mZKLxcjxMydyRR84uIWJHDpMOCtv6jZY1dkWbQYBAp8Q0SPAMgfQLsJj
   PV+eKi6ELhBDSZvw03mnyATPDcakvpY1In3mNK0Cy28/z8RrcrfogpnY4
   2bf2gv+tQVrnIwipR+rXCrqx2thyjYowyXKwuFbMxFrM2WYepolwQlUzs
   HnRvBZXQasxJYPwu4UjqVHZVwV5jdYM65Tl8jzzJJvpq9XXHgEJC3Plk2
   F2avMSvzGI3vcSnDIM92L7147s9kiR2+fYNlcY9ORFfnOIqNhmogytaIC
   gNN1qPYji4/kXmwMx9jfmArd/0YiPDx3pJ18MtQfvGX/9UF/C9xg33msk
   w==;
X-CSE-ConnectionGUID: iGFP/Np0Qkicpyg9bLiSrw==
X-CSE-MsgGUID: vsRdOaNLQq+fzWYh23c99Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30849579"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="30849579"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 12:11:38 -0700
X-CSE-ConnectionGUID: nLmspA88QSWBr8Euh6UmtA==
X-CSE-MsgGUID: dzg8iMdARWKz14tIywlenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="78740079"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2024 12:11:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sviHV-000R4r-2o;
	Tue, 01 Oct 2024 19:11:33 +0000
Date: Wed, 2 Oct 2024 03:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-remove-slave-configure 4/15]
 drivers/scsi/wd33c93.c:1468:17: error: implicit declaration of function
 'sgiwd93_reset'
Message-ID: <202410020328.sVejroOm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-remove-slave-configure
head:   d1ded0cf1b583f21a9d2843f2d04dc28681c1b74
commit: 173f2083d9c40f1c636aa2921f6fa775d89e7451 [4/15] mips-jazz: Move a function declaration
config: mips-ip22_defconfig (https://download.01.org/0day-ci/archive/20241002/202410020328.sVejroOm-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020328.sVejroOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020328.sVejroOm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/wd33c93.c: In function 'reset_wd33c93':
>> drivers/scsi/wd33c93.c:1468:17: error: implicit declaration of function 'sgiwd93_reset' [-Werror=implicit-function-declaration]
    1468 |                 sgiwd93_reset(instance->base); /* yeah, give it the hard one */
         |                 ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sgiwd93_reset +1468 drivers/scsi/wd33c93.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1443  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1444  static void
^1da177e4c3f41 Linus Torvalds  2005-04-16  1445  reset_wd33c93(struct Scsi_Host *instance)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1446  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1447  	struct WD33C93_hostdata *hostdata =
^1da177e4c3f41 Linus Torvalds  2005-04-16  1448  	    (struct WD33C93_hostdata *) instance->hostdata;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1449  	const wd33c93_regs regs = hostdata->regs;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1450  	uchar sr;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1451  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1452  #ifdef CONFIG_SGI_IP22
^1da177e4c3f41 Linus Torvalds  2005-04-16  1453  	{
^1da177e4c3f41 Linus Torvalds  2005-04-16  1454  		int busycount = 0;
173f2083d9c40f Bart Van Assche 2024-09-25  1455  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1456  		/* wait 'til the chip gets some time for us */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1457  		while ((read_aux_stat(regs) & ASR_BSY) && busycount++ < 100)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1458  			udelay (10);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1459  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  1460   	 * there are scsi devices out there, which manage to lock up
^1da177e4c3f41 Linus Torvalds  2005-04-16  1461  	 * the wd33c93 in a busy condition. In this state it won't
^1da177e4c3f41 Linus Torvalds  2005-04-16  1462  	 * accept the reset command. The only way to solve this is to
^1da177e4c3f41 Linus Torvalds  2005-04-16  1463   	 * give the chip a hardware reset (if possible). The code below
^1da177e4c3f41 Linus Torvalds  2005-04-16  1464  	 * does this for the SGI Indy, where this is possible
^1da177e4c3f41 Linus Torvalds  2005-04-16  1465  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1466  	/* still busy ? */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1467  	if (read_aux_stat(regs) & ASR_BSY)
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1468  		sgiwd93_reset(instance->base); /* yeah, give it the hard one */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1469  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1470  #endif
^1da177e4c3f41 Linus Torvalds  2005-04-16  1471  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1472  	write_wd33c93(regs, WD_OWN_ID, OWNID_EAF | OWNID_RAF |
^1da177e4c3f41 Linus Torvalds  2005-04-16  1473  		      instance->this_id | hostdata->clock_freq);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1474  	write_wd33c93(regs, WD_CONTROL, CTRL_IDI | CTRL_EDI | CTRL_POLLED);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1475  	write_wd33c93(regs, WD_SYNCHRONOUS_TRANSFER,
^1da177e4c3f41 Linus Torvalds  2005-04-16  1476  		      calc_sync_xfer(hostdata->default_sx_per / 4,
a5d8421b2f03e4 peter fuerst    2007-02-12  1477  				     DEFAULT_SX_OFF, 0, hostdata->sx_table));
^1da177e4c3f41 Linus Torvalds  2005-04-16  1478  	write_wd33c93(regs, WD_COMMAND, WD_CMD_RESET);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1479  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1480  

:::::: The code at line 1468 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
