Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70261FDB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 05:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZE0uymk"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696484031; x=1728020031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAjaQ9z5BCrNVOxWXzpRnqpEJlU+vuDT36Q90x0aeOE=;
  b=DZE0uymkKUAulbUnRA69hYuCCCBKz2CsdEm6yIigXNPAILuc4Bcuir/k
   gjCjv+h2Uy8kew9XwlZPNpvEnwHfcQ8G+SHb62VTTP1EQ2SBU7JxjWTz7
   ZUFB7PavBRJ6HRndE2nmCauNz8YUdQECEIy8GnZsiS/fpdR28zP/WnQTh
   +QF5cwQgG3v9eUTZRjKJdAZLHSet4kJV7pPNUTZD3Ug1aI4VQOHwtLBWc
   egOxtfGBFRRu6H9N+1TtMCiHkamyx+Ryph4BR7scGacNEsXCJSIa+dBor
   GZ7t5+zM08GCCKF4zqXZ78Y9izp3H14IfyY6whCIeHmrRHDVzShoj3lyY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="469677643"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="469677643"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 22:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728313957"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728313957"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Oct 2023 22:33:48 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoGzZ-000L40-2Z;
	Thu, 05 Oct 2023 05:33:45 +0000
Date: Thu, 5 Oct 2023 13:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjan Kumar <ranjan.kumar@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Subject: drivers/scsi/mpi3mr/mpi3mr_transport.c:2365
 mpi3mr_report_tgtdev_to_sas_transport() warn: inconsistent indenting
Message-ID: <202310051319.KRYast5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3006adf3be79cde4d14b1800b963b82b6e5572e0
commit: 8e45183978d64699df639e795235433a60f35047 scsi: mpi3mr: Bad drive in topology results kernel crash
date:   7 months ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051319.KRYast5J-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051319.KRYast5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310051319.KRYast5J-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_transport.c:2365 mpi3mr_report_tgtdev_to_sas_transport() warn: inconsistent indenting

Old smatch warnings:
drivers/scsi/mpi3mr/mpi3mr_transport.c:2064 mpi3mr_expander_add() warn: returning -1 instead of -ENOMEM is sloppy

vim +2365 drivers/scsi/mpi3mr/mpi3mr_transport.c

7f56c791969e0c Sreekanth Reddy 2022-08-04  2304  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2305  /**
7f56c791969e0c Sreekanth Reddy 2022-08-04  2306   * mpi3mr_report_tgtdev_to_sas_transport - expose dev to SAS TL
7f56c791969e0c Sreekanth Reddy 2022-08-04  2307   * @mrioc: Adapter instance reference
7f56c791969e0c Sreekanth Reddy 2022-08-04  2308   * @tgtdev: Target device
7f56c791969e0c Sreekanth Reddy 2022-08-04  2309   *
7f56c791969e0c Sreekanth Reddy 2022-08-04  2310   * This function exposes the target device after
7f56c791969e0c Sreekanth Reddy 2022-08-04  2311   * preparing host_phy, setting up link rate etc.
7f56c791969e0c Sreekanth Reddy 2022-08-04  2312   *
7f56c791969e0c Sreekanth Reddy 2022-08-04  2313   * Return: 0 on success, non-zero for failure.
7f56c791969e0c Sreekanth Reddy 2022-08-04  2314   */
7f56c791969e0c Sreekanth Reddy 2022-08-04  2315  int mpi3mr_report_tgtdev_to_sas_transport(struct mpi3mr_ioc *mrioc,
7f56c791969e0c Sreekanth Reddy 2022-08-04  2316  	struct mpi3mr_tgt_dev *tgtdev)
7f56c791969e0c Sreekanth Reddy 2022-08-04  2317  {
7f56c791969e0c Sreekanth Reddy 2022-08-04  2318  	int retval = 0;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2319  	u8 link_rate, parent_phy_number;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2320  	u64 sas_address_parent, sas_address;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2321  	struct mpi3mr_hba_port *hba_port;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2322  	u8 port_id;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2323  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2324  	if ((tgtdev->dev_type != MPI3_DEVICE_DEVFORM_SAS_SATA) ||
7f56c791969e0c Sreekanth Reddy 2022-08-04  2325  	    !mrioc->sas_transport_enabled)
7f56c791969e0c Sreekanth Reddy 2022-08-04  2326  		return -1;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2327  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2328  	sas_address = tgtdev->dev_spec.sas_sata_inf.sas_address;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2329  	if (!mrioc->sas_hba.num_phys)
7f56c791969e0c Sreekanth Reddy 2022-08-04  2330  		mpi3mr_sas_host_add(mrioc);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2331  	else
7f56c791969e0c Sreekanth Reddy 2022-08-04  2332  		mpi3mr_sas_host_refresh(mrioc);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2333  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2334  	if (mpi3mr_get_sas_address(mrioc, tgtdev->parent_handle,
7f56c791969e0c Sreekanth Reddy 2022-08-04  2335  	    &sas_address_parent) != 0) {
7f56c791969e0c Sreekanth Reddy 2022-08-04  2336  		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
7f56c791969e0c Sreekanth Reddy 2022-08-04  2337  		    __FILE__, __LINE__, __func__);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2338  		return -1;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2339  	}
7f56c791969e0c Sreekanth Reddy 2022-08-04  2340  	tgtdev->dev_spec.sas_sata_inf.sas_address_parent = sas_address_parent;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2341  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2342  	parent_phy_number = tgtdev->dev_spec.sas_sata_inf.phy_id;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2343  	port_id = tgtdev->io_unit_port;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2344  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2345  	hba_port = mpi3mr_get_hba_port_by_id(mrioc, port_id);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2346  	if (!hba_port) {
7f56c791969e0c Sreekanth Reddy 2022-08-04  2347  		ioc_err(mrioc, "failure at %s:%d/%s()!\n",
7f56c791969e0c Sreekanth Reddy 2022-08-04  2348  		    __FILE__, __LINE__, __func__);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2349  		return -1;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2350  	}
7f56c791969e0c Sreekanth Reddy 2022-08-04  2351  	tgtdev->dev_spec.sas_sata_inf.hba_port = hba_port;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2352  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2353  	link_rate = mpi3mr_get_sas_negotiated_logical_linkrate(mrioc, tgtdev);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2354  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2355  	mpi3mr_update_links(mrioc, sas_address_parent, tgtdev->dev_handle,
7f56c791969e0c Sreekanth Reddy 2022-08-04  2356  	    parent_phy_number, link_rate, hba_port);
7f56c791969e0c Sreekanth Reddy 2022-08-04  2357  
7f56c791969e0c Sreekanth Reddy 2022-08-04  2358  	tgtdev->host_exposed = 1;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2359  	if (!mpi3mr_sas_port_add(mrioc, tgtdev->dev_handle,
7f56c791969e0c Sreekanth Reddy 2022-08-04  2360  	    sas_address_parent, hba_port)) {
7f56c791969e0c Sreekanth Reddy 2022-08-04  2361  		retval = -1;
8e45183978d646 Ranjan Kumar    2023-02-28  2362  		} else if ((!tgtdev->starget) && (!mrioc->is_driver_loading)) {
7f56c791969e0c Sreekanth Reddy 2022-08-04  2363  			mpi3mr_sas_port_remove(mrioc, sas_address,
7f56c791969e0c Sreekanth Reddy 2022-08-04  2364  			    sas_address_parent, hba_port);
7f56c791969e0c Sreekanth Reddy 2022-08-04 @2365  		retval = -1;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2366  	}
8e45183978d646 Ranjan Kumar    2023-02-28  2367  	if (retval) {
8e45183978d646 Ranjan Kumar    2023-02-28  2368  		tgtdev->dev_spec.sas_sata_inf.hba_port = NULL;
8e45183978d646 Ranjan Kumar    2023-02-28  2369  		tgtdev->host_exposed = 0;
8e45183978d646 Ranjan Kumar    2023-02-28  2370  	}
7f56c791969e0c Sreekanth Reddy 2022-08-04  2371  	return retval;
7f56c791969e0c Sreekanth Reddy 2022-08-04  2372  }
7f56c791969e0c Sreekanth Reddy 2022-08-04  2373  

:::::: The code at line 2365 was first introduced by commit
:::::: 7f56c791969e0c19b8b5ee12058b636bf173eb90 scsi: mpi3mr: Add SAS SATA end devices to STL

:::::: TO: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
