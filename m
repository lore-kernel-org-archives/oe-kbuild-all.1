Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1624B27452
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728110042; cv=none; b=l3lMSJhf5vUJi8MY/ay3ZugY7vuJEm6HGqy5mIXowkNI3pZhBSrIL9oBJ+iaUHczkPWd7xjwGqB+YzKMqOV/wFI2idzam4oeysRvP68qY0A3F1xZNfgoib4xxyq5P1SWDHYbVwcochfWVS3q4BEMCsyd7KO4DISY/BbC/fc8ZRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728110042; c=relaxed/simple;
	bh=89lb1oJpiZefl++wERPOxGUGgdMNZoVAO1HGr/A0vAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPVi5lD8S7dz0LKDDiceO+6Wjyr4hP97H/zmI1CwzRLVKsqgkX8ToStAG42IhEJWcf354QSzmYWN3sXRRsx20JQ3exxBIIcEsVHmUfAYHaJ2rfiCIyjRsWmfp2iIW3goISdIKtEBUC8IumuybWC0Dzhl+DUI44YnKLJ0MZWKunA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxfaFj5j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxfaFj5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728110041; x=1759646041;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=89lb1oJpiZefl++wERPOxGUGgdMNZoVAO1HGr/A0vAc=;
  b=cxfaFj5jnbZNEksDLM+133VOaHUfUoD0n79N2nTz+PJdBciJP2Oo8wTj
   y3EcRJ2poI2hVpqt5sGqhDqTQKZzNYXAAglP9MexrcweiXGJEmuLATq64
   NxvONn9PuPeS1JGEOrMHxpIIwXm7MiQtiixKDLQaFRk3nfZPWJqjYQO9E
   MpvqWQI9HqaiOv3RpF5peMeCVHm4MmpjfGJvjCH7S3eIRLDKUDNCXvDNy
   eAUaTnAiPmg5xx/fn8Ud3NyT62ayF5QvQ8TslEdy8rZUVOzQcot3CUGNL
   3RYI3pXLGCQZh2ITp88BEiRz7KeHLuY1ems/PzeqV6w64kyEcZWOls9Pc
   Q==;
X-CSE-ConnectionGUID: wjDik9RtTn2R+1L3tWtkkQ==
X-CSE-MsgGUID: r3lEOCyHTMei5SOXmFav2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37900029"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="37900029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 23:34:00 -0700
X-CSE-ConnectionGUID: MsWQa4XMQC2R2lgai608Og==
X-CSE-MsgGUID: H30k6QP2Qha1Pwsc9aTByw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="105680304"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2024 23:33:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swyMW-0002en-0Y;
	Sat, 05 Oct 2024 06:33:56 +0000
Date: Sat, 5 Oct 2024 14:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 11/447]
 drivers/platform/x86/intel/pmc/core.c:541:29: error:
 'pmc_core_ltr_ignore_write_iter' undeclared here (not in a function); did
 you mean 'pmc_core_ltr_ignore_write'?
Message-ID: <202410051420.WpTNrxYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   072b44165bc3d4d6e6de6962a9b00c5d0256a555
commit: 4ab4d5b30b2338778770677923b6e48ef809228d [11/447] seq_file: switch to using ->read_iter()
config: x86_64-randconfig-122-20241004 (https://download.01.org/0day-ci/archive/20241005/202410051420.WpTNrxYl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051420.WpTNrxYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051420.WpTNrxYl-lkp@intel.com/

Note: the axboe-block/rw_iter HEAD 072b44165bc3d4d6e6de6962a9b00c5d0256a555 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/platform/x86/intel/pmc/core.c:16:
>> drivers/platform/x86/intel/pmc/core.c:541:29: error: 'pmc_core_ltr_ignore_write_iter' undeclared here (not in a function); did you mean 'pmc_core_ltr_ignore_write'?
     541 | DEFINE_SHOW_STORE_ATTRIBUTE(pmc_core_ltr_ignore);
         |                             ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
>> drivers/platform/x86/intel/pmc/core.c:557:29: error: 'pmc_core_ltr_restore_write_iter' undeclared here (not in a function); did you mean 'pmc_core_ltr_restore_write'?
     557 | DEFINE_SHOW_STORE_ATTRIBUTE(pmc_core_ltr_restore);
         |                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
>> drivers/platform/x86/intel/pmc/core.c:543:16: warning: 'pmc_core_ltr_restore_write' defined but not used [-Wunused-function]
     543 | static ssize_t pmc_core_ltr_restore_write(struct file *file,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/intel/pmc/core.c:527:16: warning: 'pmc_core_ltr_ignore_write' defined but not used [-Wunused-function]
     527 | static ssize_t pmc_core_ltr_ignore_write(struct file *file,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/cgroup.h:18,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from include/linux/i2c.h:19,
                    from include/drm/display/drm_dp_helper.h:27,
                    from drivers/gpu/drm/i915/display/intel_dp_link_training.c:24:
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:1784:29: error: 'i915_dp_force_link_rate_write_iter' undeclared here (not in a function); did you mean 'i915_dp_force_link_rate_write'?
    1784 | DEFINE_SHOW_STORE_ATTRIBUTE(i915_dp_force_link_rate);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:1886:29: error: 'i915_dp_force_lane_count_write_iter' undeclared here (not in a function); did you mean 'i915_dp_force_lane_count_write'?
    1886 | DEFINE_SHOW_STORE_ATTRIBUTE(i915_dp_force_lane_count);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     230 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:1858:16: error: 'i915_dp_force_lane_count_write' defined but not used [-Werror=unused-function]
    1858 | static ssize_t i915_dp_force_lane_count_write(struct file *file,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:1756:16: error: 'i915_dp_force_link_rate_write' defined but not used [-Werror=unused-function]
    1756 | static ssize_t i915_dp_force_link_rate_write(struct file *file,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +541 drivers/platform/x86/intel/pmc/core.c

9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  526  
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24 @527  static ssize_t pmc_core_ltr_ignore_write(struct file *file,
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  528  					 const char __user *userbuf,
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  529  					 size_t count, loff_t *ppos)
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  530  {
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  531  	struct seq_file *s = file->private_data;
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  532  	struct pmc_dev *pmcdev = s->private;
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  533  
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  534  	return pmc_core_ltr_write(pmcdev, userbuf, count, 1);
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  535  }
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  536  
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  537  static int pmc_core_ltr_ignore_show(struct seq_file *s, void *unused)
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  538  {
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  539  	return 0;
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  540  }
590a87fe36f1aa drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24 @541  DEFINE_SHOW_STORE_ATTRIBUTE(pmc_core_ltr_ignore);
9c2ee19987ef02 drivers/platform/x86/intel_pmc_core.c Rajneesh Bhardwaj 2016-10-07  542  
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24 @543  static ssize_t pmc_core_ltr_restore_write(struct file *file,
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  544  					  const char __user *userbuf,
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  545  					  size_t count, loff_t *ppos)
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  546  {
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  547  	struct seq_file *s = file->private_data;
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  548  	struct pmc_dev *pmcdev = s->private;
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  549  
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  550  	return pmc_core_ltr_write(pmcdev, userbuf, count, 0);
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  551  }
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  552  
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  553  static int pmc_core_ltr_restore_show(struct seq_file *s, void *unused)
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  554  {
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  555  	return 0;
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  556  }
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24 @557  DEFINE_SHOW_STORE_ATTRIBUTE(pmc_core_ltr_restore);
4dea807fa7e752 drivers/platform/x86/intel/pmc/core.c Xi Pardee         2024-06-24  558  

:::::: The code at line 541 was first introduced by commit
:::::: 590a87fe36f1aa43e2d145a0b16d223f2f374899 platform/x86:intel/pmc: Use DEFINE_SHOW_STORE_ATTRIBUTE macro

:::::: TO: Xi Pardee <xi.pardee@linux.intel.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
