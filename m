Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10918B1A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727446348; cv=none; b=esj8lhC3G8rOaU8r3tymJ4qMI0lZ/+IPm4RLH0vvhnHgFmq1D45/UeZkU67Dpd9Kaojp2a/fjy6H11OKd0UJRkBAxW/JtM5/tjknbqOod2tqN+rbZlQG+lFil5o+MVU4cL83qPEVSLrl7eyvyL9lajpiFZ3DPFh96Wk2rdZ9XPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727446348; c=relaxed/simple;
	bh=cS/X9HbJeahR6m2m4hEoUg2jMr+eMBvhxxMjmSN2EYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjAXmyQLIUX14hr6Wrv3nO9G85JAEmOVqMFObiGC0CxRrtJmhLzaBziKOIOfCZEvzve6QQE3XLUJ3htLNgPmQl6vGlQmCZxkw/9yz/Yus7gSC4c++upHSMFqF83zOFLV+TU9FexGpWRlUjtUNHPX7KixYMHXgLFrxbMIOnZkN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzYEqH3v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzYEqH3v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727446346; x=1758982346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cS/X9HbJeahR6m2m4hEoUg2jMr+eMBvhxxMjmSN2EYs=;
  b=TzYEqH3vFNi8UrAqm9z+by45P6x5d92HSNpurpJnv3lsztTKBat3kXic
   MtzgWV8K2HZqRXcsEZWt9hJF4Q0SpjWXuJSXN4ajPFZEkSn49IMrizn5m
   UcZ9lXamxjqXceFRqF8J89iCbo0sBC2Jl+HJqBhfuERNybTvNJAxqi8Sb
   Nnb5ugtccEleNZUxv/W2L3NgMQbTmskOTJHlFUAGLxbutf9AW9++ap+0m
   1pGppaqiGM5v1KIAC/wSSdjUlALnXGuTflsARmLljpH9vGhwIq05IMRvW
   wLjNJBL3gOY1p78ZWjq+ovs+rW75+nXlc0LdzqeXAIrIuUI5vS8wZ9wZI
   A==;
X-CSE-ConnectionGUID: 2v+RLAg8Tre0kn4Y5hOrUA==
X-CSE-MsgGUID: fPNulaakQRyPBlIRXCmfLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37262994"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37262994"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:12:26 -0700
X-CSE-ConnectionGUID: qlAsfQI9SLy138wFZPZvbQ==
X-CSE-MsgGUID: YksVsyNmRXe8h9fEg9bHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72128083"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Sep 2024 07:12:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBhm-000MDP-2x;
	Fri, 27 Sep 2024 14:12:22 +0000
Date: Fri, 27 Sep 2024 22:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 13/25] drivers/cxl/core/mbox.c:808:23: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202409272258.lF4LcOwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: 5a0496c19151d83cd0d926f8a1488eeaab27509b [13/25] cxl: Add Get Supported Features command for kernel usage
config: sparc64-randconfig-r133-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272258.lF4LcOwS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409272258.lF4LcOwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272258.lF4LcOwS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/mbox.c:808:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got unsigned long @@
   drivers/cxl/core/mbox.c:808:23: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:808:23: sparse:     got unsigned long
   drivers/cxl/core/mbox.c:886:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [usertype] count @@     got int [assigned] alloc_size @@
   drivers/cxl/core/mbox.c:886:31: sparse:     expected restricted __le32 [addressable] [usertype] count
   drivers/cxl/core/mbox.c:886:31: sparse:     got int [assigned] alloc_size
   drivers/cxl/core/mbox.c:887:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] start_idx @@     got int [assigned] start @@
   drivers/cxl/core/mbox.c:887:35: sparse:     expected restricted __le16 [addressable] [usertype] start_idx
   drivers/cxl/core/mbox.c:887:35: sparse:     got int [assigned] start
   drivers/cxl/core/mbox.c:920:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:931:54: sparse: sparse: restricted __le16 degrades to integer
   drivers/cxl/core/mbox.c:932:23: sparse: sparse: invalid assignment: +=
   drivers/cxl/core/mbox.c:932:23: sparse:    left side has type int
   drivers/cxl/core/mbox.c:932:23: sparse:    right side has type restricted __le16
   drivers/cxl/core/mbox.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +808 drivers/cxl/core/mbox.c

   798	
   799	static int cxl_get_supported_features_count(struct cxl_dev_state *cxlds)
   800	{
   801		struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
   802		struct cxl_mbox_get_sup_feats_out mbox_out;
   803		struct cxl_mbox_get_sup_feats_in mbox_in;
   804		struct cxl_mbox_cmd mbox_cmd;
   805		int rc;
   806	
   807		memset(&mbox_in, 0, sizeof(mbox_in));
 > 808		mbox_in.count = sizeof(mbox_out);
   809		memset(&mbox_out, 0, sizeof(mbox_out));
   810		mbox_cmd = (struct cxl_mbox_cmd) {
   811			.opcode = CXL_MBOX_OP_GET_SUPPORTED_FEATURES,
   812			.size_in = sizeof(mbox_in),
   813			.payload_in = &mbox_in,
   814			.size_out = sizeof(mbox_out),
   815			.payload_out = &mbox_out,
   816			.min_out = sizeof(mbox_out),
   817		};
   818		rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
   819		if (rc < 0)
   820			return rc;
   821	
   822		cxl_mbox->num_features = le16_to_cpu(mbox_out.supported_feats);
   823	
   824		return 0;
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
