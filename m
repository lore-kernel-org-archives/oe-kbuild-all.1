Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421C52309B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732162663; cv=none; b=LgAhZ3ZlbzwuGdPxGR4rM+ttBVSIkISOl0jvMTfrMVURVVNrFxKMCwbafJrm9nFeS9edw75RHgCNzR07zLur1dgyu4DGyEk4Lp8g3yd+AFcVROI8W7KYzvQXD3eK0TMIlJ4ZTFVh72rOn6+PI26bUdgeIstyY8GCRfW2TQFYFy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732162663; c=relaxed/simple;
	bh=/TOFAldb8PdDcPeLqLUzcZTSper6ZCCq8HjoHdYyvNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fB7i9//TJzkqoxtm4igf/tdAGkc4m+ikHWjpNWbXbbAdF4/HYS8TLJAuj1K6arBsD2jkCyrTWSam9fSmO9k7hbYLAlTKOj7tCusqGiKf1CVBkHst+0FuF/xle+PLsv4OCsHIjBMoyNY2+nELqHIwAthOXrqyBSrYhjhj4sHgb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOH3AAqF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOH3AAqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732162661; x=1763698661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TOFAldb8PdDcPeLqLUzcZTSper6ZCCq8HjoHdYyvNs=;
  b=dOH3AAqF7GMuSrTAEdfaxzPLayh5ePsSAay2JBAdEbni/MtcmRggsrAM
   ZItx2TBu9JMXMokthN4f1JSYDDALpjdYG8cVxmDTrG07tgH4gfRFUcmks
   sr7WVrg4w++1N/vqtwu7Vc04PkdtQIHY2umd3KBcVqj8OwZnWsrqUTPUW
   0byGSWzvVRuUX58EYOUOK+twpNAhlzPZyOBVTc0UJiKkCtOEE3K8swTEz
   I3oYqNibMqGsOQ74Sb12o0TL/VYeoKSAmRKYY534qy1nohsRFeBakWTWx
   KqMY4oMiIFmYW+4vu38zPP77t4CunZXj2ShoCpundl41uTtImNK1cQCI6
   A==;
X-CSE-ConnectionGUID: nmrQuxiITjaamjOz0qQB6w==
X-CSE-MsgGUID: O6AW/O5fT0We78SqvnaUpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32179995"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="32179995"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 20:17:41 -0800
X-CSE-ConnectionGUID: PMRw8uiJST200i3PfRNpHw==
X-CSE-MsgGUID: 01ILbdXLT521gTFeIxqZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="89931090"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2024 20:17:39 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDydN-0001mD-1N;
	Thu, 21 Nov 2024 04:17:37 +0000
Date: Thu, 21 Nov 2024 12:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] drivers/cxl/core/mbox.c:1073:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411211216.n5qciY56-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: cd685083320fbb36fbe7973406d5001962699335 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: i386-randconfig-063-20241121 (https://download.01.org/0day-ci/archive/20241121/202411211216.n5qciY56-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211216.n5qciY56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211216.n5qciY56-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:1073:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got unsigned int @@
   drivers/cxl/core/mbox.c:1073:23: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:1073:23: sparse:     got unsigned int
   drivers/cxl/core/mbox.c:1153:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got int [assigned] alloc_size @@
   drivers/cxl/core/mbox.c:1153:31: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:1153:31: sparse:     got int [assigned] alloc_size
   drivers/cxl/core/mbox.c:1154:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] start_idx @@     got int [assigned] start @@
   drivers/cxl/core/mbox.c:1154:35: sparse:     expected restricted __le16 [addressable] [usertype] start_idx
   drivers/cxl/core/mbox.c:1154:35: sparse:     got int [assigned] start
   drivers/cxl/core/mbox.c:1187:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:1198:54: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:1199:23: sparse: sparse: invalid assignment: +=
   drivers/cxl/core/mbox.c:1199:23: sparse:    left side has type int
   drivers/cxl/core/mbox.c:1199:23: sparse:    right side has type restricted __le16

vim +1073 drivers/cxl/core/mbox.c

69f846d7538bdd Dave Jiang 2024-07-18  1064  
69f846d7538bdd Dave Jiang 2024-07-18  1065  static int cxl_get_supported_features_count(struct cxl_mailbox *cxl_mbox)
69f846d7538bdd Dave Jiang 2024-07-18  1066  {
69f846d7538bdd Dave Jiang 2024-07-18  1067  	struct cxl_mbox_get_sup_feats_out mbox_out;
69f846d7538bdd Dave Jiang 2024-07-18  1068  	struct cxl_mbox_get_sup_feats_in mbox_in;
69f846d7538bdd Dave Jiang 2024-07-18  1069  	struct cxl_mbox_cmd mbox_cmd;
69f846d7538bdd Dave Jiang 2024-07-18  1070  	int rc;
69f846d7538bdd Dave Jiang 2024-07-18  1071  
69f846d7538bdd Dave Jiang 2024-07-18  1072  	memset(&mbox_in, 0, sizeof(mbox_in));
69f846d7538bdd Dave Jiang 2024-07-18 @1073  	mbox_in.count = sizeof(mbox_out);
69f846d7538bdd Dave Jiang 2024-07-18  1074  	memset(&mbox_out, 0, sizeof(mbox_out));
69f846d7538bdd Dave Jiang 2024-07-18  1075  	mbox_cmd = (struct cxl_mbox_cmd) {
69f846d7538bdd Dave Jiang 2024-07-18  1076  		.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
69f846d7538bdd Dave Jiang 2024-07-18  1077  		.size_in = sizeof(mbox_in),
69f846d7538bdd Dave Jiang 2024-07-18  1078  		.payload_in = &mbox_in,
69f846d7538bdd Dave Jiang 2024-07-18  1079  		.size_out = sizeof(mbox_out),
69f846d7538bdd Dave Jiang 2024-07-18  1080  		.payload_out = &mbox_out,
69f846d7538bdd Dave Jiang 2024-07-18  1081  		.min_out = sizeof(mbox_out),
69f846d7538bdd Dave Jiang 2024-07-18  1082  	};
69f846d7538bdd Dave Jiang 2024-07-18  1083  	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
69f846d7538bdd Dave Jiang 2024-07-18  1084  	if (rc < 0)
69f846d7538bdd Dave Jiang 2024-07-18  1085  		return rc;
69f846d7538bdd Dave Jiang 2024-07-18  1086  
69f846d7538bdd Dave Jiang 2024-07-18  1087  	cxl_mbox->num_features = le16_to_cpu(mbox_out.supported_feats);
69f846d7538bdd Dave Jiang 2024-07-18  1088  	if (!cxl_mbox->num_features)
69f846d7538bdd Dave Jiang 2024-07-18  1089  		return -ENOENT;
69f846d7538bdd Dave Jiang 2024-07-18  1090  
69f846d7538bdd Dave Jiang 2024-07-18  1091  	return 0;
69f846d7538bdd Dave Jiang 2024-07-18  1092  }
69f846d7538bdd Dave Jiang 2024-07-18  1093  

:::::: The code at line 1073 was first introduced by commit
:::::: 69f846d7538bddd185b14560ab1c7c1292932cca cxl: Add Get Supported Features command for kernel usage

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
