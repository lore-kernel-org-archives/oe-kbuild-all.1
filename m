Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE86339BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pz6ZJThQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697751574; x=1729287574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+v12MIGQpHL3K4hVVD9PLrCDNlQ5Usmqm3r4xtFMYE=;
  b=Pz6ZJThQDTStODU9JwLZh+KvDK/fvXz1A1jvHu4F4qio/UtZMjpVocx8
   b+lNBiYwX7LDrN8BnMXO7R27FZyNi9Ss1VSHplN5jPF9GV4Qw1ohKShbn
   jv6bEomC9SrvAZAjGO2Y5Qgjz8d9qR6dB1LHVIQRk4K1m0/dnuUuSF40A
   dPuiKcMEoNRGbugv8K++Kt8rtSB0CHb3+3xB7E6zTIaXGWihz0718Dlnb
   w6/QTCzTe4/MD5PWXk0zjRVuDQqPBoxVFUpfoAXT5uGEjOKZxqLqtCQQb
   PZTzkC/8oIFAZ45HWDvjSqSHpcKcRYbgxJVwgI/OJTTwWKeqmzy2rWXn/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="4981843"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="4981843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 14:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757214166"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="757214166"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 14:39:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtajp-0002ci-1Y;
	Thu, 19 Oct 2023 21:39:29 +0000
Date: Fri, 20 Oct 2023 05:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [hare-scsi-devel:eh-rework.v6 18/26] drivers/scsi/imm.c:1005:30:
 error: 'cmd' undeclared; did you mean 'cma'?
Message-ID: <202310200535.5rvoO5AO-lkp@intel.com>
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
config: i386-buildonly-randconfig-005-20231020 (https://download.01.org/0day-ci/archive/20231020/202310200535.5rvoO5AO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200535.5rvoO5AO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200535.5rvoO5AO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/imm.c: In function 'imm_reset':
>> drivers/scsi/imm.c:1005:30: error: 'cmd' undeclared (first use in this function); did you mean 'cma'?
    1005 |         if (imm_scsi_pointer(cmd)->phase)
         |                              ^~~
         |                              cma
   drivers/scsi/imm.c:1005:30: note: each undeclared identifier is reported only once for each function it appears in


vim +1005 drivers/scsi/imm.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1000  
189a3307c1e67e Hannes Reinecke 2023-10-02  1001  static int imm_reset(struct Scsi_Host *host)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1002  {
189a3307c1e67e Hannes Reinecke 2023-10-02  1003  	imm_struct *dev = imm_dev(host);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1004  
6b66f09c46a8e7 Bart Van Assche 2022-02-18 @1005  	if (imm_scsi_pointer(cmd)->phase)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1006  		imm_disconnect(dev);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1007  	dev->cur_cmd = NULL;	/* Forget the problem */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1008  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1009  	imm_connect(dev, CONNECT_NORMAL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1010  	imm_reset_pulse(dev->base);
68b3aa7c9805ae Jeff Garzik     2005-05-28  1011  	mdelay(1);		/* device settle delay */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1012  	imm_disconnect(dev);
68b3aa7c9805ae Jeff Garzik     2005-05-28  1013  	mdelay(1);		/* device settle delay */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1014  	return SUCCESS;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1015  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1016  

:::::: The code at line 1005 was first introduced by commit
:::::: 6b66f09c46a8e7f2cfcfcdbc9e45103263b12683 scsi: imm: Move the SCSI pointer to private command data

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
