Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A818AD2F1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692260276; x=1723796276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ER+vPI4lDQFaR/UT3asH0oLGVkhxE58YGH7Um+/Pxaw=;
  b=nEtm37dUeXCLaPzhDebi18t41OlCePvrceWNovRZKlyayk0pKqDCVFPv
   rj4VAVLn1BdyJOw3qJ0nsh2u1MK8SXYlxQjELJXyAlI3efwVaMjUzVDG8
   NK5URDyxNxVOLy79u9eFCIV+Wdqxw5VceqEwBHxIDO3QVkSvpHZa+XvW9
   HtZuI5GQbG47Vh1drYqKx0YHPIff9HlS1aCjRYogrRb/PzB5S//h1ft95
   L137Lg95o4RSWV7o6iMbh69rmaELpxwN1YGjVesjPxl2kbWo9ERub06j1
   GN1vGdVD5FsR3Vcf0TV8QsRoWysSsE/tO0+90EvyrlEgs2m0Grb2+q6jA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353063408"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="353063408"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 01:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769524778"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="769524778"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 01:17:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWYCU-0000wT-1L;
	Thu, 17 Aug 2023 08:17:50 +0000
Date: Thu, 17 Aug 2023 16:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_transport.c:695: warning: Function
 parameter or member 'port_id' not described in 'mpi3mr_get_hba_port_by_id'
Message-ID: <202308171606.rcBEycYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 125ad1e6b445e8538e50d77d9c82ec811e98895e scsi: mpi3mr: Add helper functions to retrieve device objects
date:   12 months ago
config: microblaze-randconfig-r032-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171606.rcBEycYE-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171606.rcBEycYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171606.rcBEycYE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpi3mr/mpi3mr_transport.c:695: warning: Function parameter or member 'port_id' not described in 'mpi3mr_get_hba_port_by_id'


vim +695 drivers/scsi/mpi3mr/mpi3mr_transport.c

   684	
   685	/**
   686	 * mpi3mr_get_hba_port_by_id - find hba port by id
   687	 * @mrioc: Adapter instance reference
   688	 * @port_id - Port ID to search
   689	 *
   690	 * Return: mpi3mr_hba_port reference for the matched port
   691	 */
   692	
   693	struct mpi3mr_hba_port *mpi3mr_get_hba_port_by_id(struct mpi3mr_ioc *mrioc,
   694		u8 port_id)
 > 695	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
