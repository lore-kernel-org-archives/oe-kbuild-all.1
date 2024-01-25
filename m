Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AE31758F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706170237; cv=none; b=E1+AWG6yJLsSY6MK87CYU1eDAQqytolOusMle/0pvEGVfhnKKmc8vsj/U9RApCzui4nVgSyILGnw2TlcVzLOSRXNJNRIj6abyWwS9tEErenPx0FztAH+HjuRdOaGKkx2cOFZJS2UMbCtPmZSqfmeE+s4WXVWjjqlK6Ilu+SVOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706170237; c=relaxed/simple;
	bh=ElfwpE45UXfqIwd8TktuVe76bCCuUBsz0mNziqMlzIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsV9j7YJ7ASCT8l2hDmje5fLM1NckPtZgFWiYQskn1J2kgf7LaCiypXRc4eo74pqcQyPbMrCqG3xlQdZKL85tQO+z/zOB9lUV2KoIcPXnlqYsQIo9Z2p1nBPUL2Sguw9VqukxNkVblg8znIMAEEfMk188nigwSu356PojjNAZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gENxly4l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gENxly4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706170236; x=1737706236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ElfwpE45UXfqIwd8TktuVe76bCCuUBsz0mNziqMlzIM=;
  b=gENxly4lxS1z4XBgkeci2hfa2deuIXCTsolEZr1o+tm30KcmKxcfzgse
   6imJfmPETu1OdTXsKaPCKwdLKbyMqQ10hcL0OLT5wYaekaug4YzKpOvKm
   Xa4Wi09tX1Uu+QjEyBSZUUrDdcJXIoEbfOrcdNdfZgPcoqc/URVizQRaU
   9TbbkFe+muQh7bLDiDRqncZoFS16+3ncOl3dkP1vvBy91PISWPBfCeSMN
   JHWuvgu9D6d2QqgYzGQlBwN4DbD/n4EEcDYBCW/F233vwf7PBsM4YO9Ox
   m4iRzHBIK/AXs9/pCUdUKeQyG8TPqiGaITh2dSmbm8FO2uUERst6YXugP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1967922"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1967922"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 00:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="736242274"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736242274"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 00:10:31 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSuoe-0008rH-1x;
	Thu, 25 Jan 2024 08:10:28 +0000
Date: Thu, 25 Jan 2024 16:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/21569]
 drivers/scsi/huawei/hifc/hifc_module.c:9:46: error: positional
 initialization of field in 'struct' declared with 'designated_init'
 attribute
Message-ID: <202401251601.vlpK5QPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c147f19e06e08b90efa3dda49bc4dcaf06424518
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/21569] scsi/hifc: add hifc driver FC service module
config: x86_64-randconfig-015-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251601.vlpK5QPa-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251601.vlpK5QPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251601.vlpK5QPa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/huawei/hifc/hifc_module.c:9:46: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    struct unf_cm_handle_op_s hifc_cm_handle = { 0 };
                                                 ^
   drivers/scsi/huawei/hifc/hifc_module.c:9:46: note: (near initialization for 'hifc_cm_handle')
>> drivers/scsi/huawei/hifc/hifc_module.c:9:46: error: invalid initializer
   drivers/scsi/huawei/hifc/hifc_module.c:9:46: note: (near initialization for 'hifc_cm_handle.<anonymous>')
   cc1: some warnings being treated as errors


vim +9 drivers/scsi/huawei/hifc/hifc_module.c

c27fa1ef544cd5 Chenguangli 2020-11-16   8  
c27fa1ef544cd5 Chenguangli 2020-11-16  @9  struct unf_cm_handle_op_s hifc_cm_handle = { 0 };
c27fa1ef544cd5 Chenguangli 2020-11-16  10  unsigned int dif_sgl_mode;
c27fa1ef544cd5 Chenguangli 2020-11-16  11  unsigned int max_speed = HIFC_SPEED_32G;
c27fa1ef544cd5 Chenguangli 2020-11-16  12  unsigned int accum_db_num = 1;
c27fa1ef544cd5 Chenguangli 2020-11-16  13  unsigned int dif_type = 0x1;
c27fa1ef544cd5 Chenguangli 2020-11-16  14  unsigned int wqe_page_size = 4096;
c27fa1ef544cd5 Chenguangli 2020-11-16  15  unsigned int wqe_pre_load = 6;
c27fa1ef544cd5 Chenguangli 2020-11-16  16  unsigned int combo_length_kb = 8;
c27fa1ef544cd5 Chenguangli 2020-11-16  17  unsigned int cos_bit_map = 0x1f;
c27fa1ef544cd5 Chenguangli 2020-11-16  18  unsigned int hifc_dif_type;
c27fa1ef544cd5 Chenguangli 2020-11-16  19  unsigned int hifc_dif_enable;
c27fa1ef544cd5 Chenguangli 2020-11-16  20  unsigned char hifc_guard;
c27fa1ef544cd5 Chenguangli 2020-11-16  21  

:::::: The code at line 9 was first introduced by commit
:::::: c27fa1ef544cd563228c1e13f1a09a565cafc9d5 scsi/hifc: add hifc driver scsi module

:::::: TO: Chenguangli <chenguangli2@huawei.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
