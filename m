Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC311ACE0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726680937; cv=none; b=P1q735r+sSvf47dL4MGCoClL64khfTu3j0ecoM+QSW6wL+mBLQxaG/HQlBCxYAdLCxBuiIqqrrY0HoNdscme4BYr7N9+teXSo0/U4aoKaBN8ylNqEh3FxjR4/8lszLn2qCv+yXNUuvQroXTSVuj+B4EQhkDs5Od9iLQ7r1FDdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726680937; c=relaxed/simple;
	bh=dLYOe3kD8W5eGXmFVGxJyuaxG0Hsca2eqZ+JYwm27YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCn02Tn0g+5bPzhsB7zmnzsFAfk/+bA/nksrUs3Q7f4DS1qDKR+Pz2kHJrzydD6iMuURyCJv+Lg155ztZ4OrJt5nSPjkvCJ+QgPh8i+8DtuFRD3ijNMV7n/+dgLGDiGZPwFIpfRMkzRIF6PRXuKIKdl8YFh9eSZY3BLOMiciiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kayozxfN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kayozxfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726680935; x=1758216935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dLYOe3kD8W5eGXmFVGxJyuaxG0Hsca2eqZ+JYwm27YA=;
  b=kayozxfNl7m8l3A/gm5LRePFHwKDSGUjytVENXNexpyJsJ7xFqav+18/
   XQwndHAaq68SJQbpbEU7iTrs9CTss0zjI6NPhKqVgftyg4J1eoreK3CMZ
   99NSuKji6RoQvZli3B2KM6mqBV4azWHmboPmuAkKyysrNxX498P4BTRVT
   3T5Lilq540e87Vq3PkQzeHc7ZV1b4gDEsSaw2E+MmAKJKMDqXjWqYTyxg
   XkXNvopaR/6qBJruZLC0DuTv6cpklqB7mRbtKSlGpcGvGqS/TpoxU6W9R
   DXA9LyPJPUL1ZjHFrMd+We5rQLLopMbTWgmrOPOH2L+ApfT7vEQLldlmo
   w==;
X-CSE-ConnectionGUID: ShoranYES3ivpUxtP1GyDA==
X-CSE-MsgGUID: UtuUCHJlR2OHd9PU3p2oIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43126851"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="43126851"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 10:35:35 -0700
X-CSE-ConnectionGUID: 7R5Z7doTTh+cTsk7c8MwLw==
X-CSE-MsgGUID: FPqs97/pR16cDiVPAjwUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="92949933"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Sep 2024 10:35:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqyaR-000CT0-2h;
	Wed, 18 Sep 2024 17:35:31 +0000
Date: Thu, 19 Sep 2024 01:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/19] drivers/cxl/core/mbox.c:840: warning:
 Function parameter or struct member 'cxl_mbox' not described in
 'handle_mailbox_cmd_from_fwctl'
Message-ID: <202409190138.cArTsZ9z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   3175f4c0e49e730b73cd11048737516e461acf09
commit: 0490d2063eae6efc3c0ae64c562489926e4876e1 [17/19] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240919/202409190138.cArTsZ9z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190138.cArTsZ9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190138.cArTsZ9z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/mbox.c:580: warning: Function parameter or struct member 'cxl_mbox' not described in 'cxl_validate_cmd_from_user'
   drivers/cxl/core/mbox.c:580: warning: Excess function parameter 'mds' description in 'cxl_validate_cmd_from_user'
   drivers/cxl/core/mbox.c:765: warning: Function parameter or struct member 'cxl_mbox' not described in 'handle_mailbox_cmd_from_user'
   drivers/cxl/core/mbox.c:765: warning: Excess function parameter 'mailbox' description in 'handle_mailbox_cmd_from_user'
>> drivers/cxl/core/mbox.c:840: warning: Function parameter or struct member 'cxl_mbox' not described in 'handle_mailbox_cmd_from_fwctl'
>> drivers/cxl/core/mbox.c:840: warning: Excess function parameter 'mailbox' description in 'handle_mailbox_cmd_from_fwctl'


vim +840 drivers/cxl/core/mbox.c

cd0c76bee95e9c Jason Gunthorpe 2024-08-20  819  
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  820  /**
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  821   * handle_mailbox_cmd_from_fwctl() - Dispatch a mailbox command for userspace.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  822   * @mailbox: The mailbox context for the operation.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  823   * @mbox_cmd: The validated mailbox command.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  824   *
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  825   * Return:
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  826   *  * %0	- Mailbox transaction succeeded. This implies the mailbox
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  827   *		  protocol completed successfully not that the operation itself
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  828   *		  was successful.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  829   *  * %-ENOMEM  - Couldn't allocate a bounce buffer.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  830   *  * %-EINTR	- Mailbox acquisition interrupted.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  831   *  * %-EXXX	- Transaction level failures.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  832   *
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  833   * Dispatches a mailbox command on behalf of a userspace request.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  834   * The output payload is copied to userspace by fwctl.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  835   *
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  836   * See cxl_send_cmd().
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  837   */
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  838  static int handle_mailbox_cmd_from_fwctl(struct cxl_mailbox *cxl_mbox,
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  839  					 struct cxl_mbox_cmd *mbox_cmd)
cd0c76bee95e9c Jason Gunthorpe 2024-08-20 @840  {
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  841  	struct device *dev = cxl_mbox->host;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  842  	struct fwctl_rpc_cxl_out *orig_out;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  843  	int rc;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  844  
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  845  	/*
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  846  	 * Save the payload_out pointer and move it to where hardware output
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  847  	 * can be copied to.
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  848  	 */
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  849  	orig_out = mbox_cmd->payload_out;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  850  	mbox_cmd->payload_out = (void *)orig_out + sizeof(*orig_out);
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  851  
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  852  	dev_dbg(dev,
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  853  		"Submitting %s command for user\n"
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  854  		"\topcode: %x\n"
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  855  		"\tsize: %zx\n",
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  856  		cxl_mem_opcode_to_name(mbox_cmd->opcode),
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  857  		mbox_cmd->opcode, mbox_cmd->size_in);
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  858  
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  859  	rc = cxl_mbox->mbox_send(cxl_mbox, mbox_cmd);
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  860  	if (rc)
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  861  		return rc;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  862  
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  863  	orig_out->retval = mbox_cmd->return_code;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  864  	mbox_cmd->payload_out = (void *)orig_out;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  865  
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  866  	return 0;
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  867  }
cd0c76bee95e9c Jason Gunthorpe 2024-08-20  868  

:::::: The code at line 840 was first introduced by commit
:::::: cd0c76bee95e9c2092418523599439d2c8dbff7e cxl: Infrastructure for fwctl

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
