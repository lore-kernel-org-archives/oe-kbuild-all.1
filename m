Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6890A17545
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712286570; cv=none; b=DVQZ+JO7pvQabMHrsKEiaI+ILcbUuN9FS5Px8ULH61DuNpOs13mofqMEp7yCnk5KBXadVlOq9JJBedKcwL9zLhK36t1ReEdPEhRx0racLRadXoI6YMx5cY1Jy+5VsIDDVRc6eW0gExbt3TtyiJMa+FzyAIkAs+hiuMp76RG73zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712286570; c=relaxed/simple;
	bh=rsT6fr0AlnImf5NNABKpAE83sTyOqx9E96e0osVlZi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q18SXsPxw06SfyXosNVstAxrJv9TBaaOkRL9rUiND4HlGzgtGY+eECzIBXlBAvntNLJioeUJgWt1mnuDbKzQb665gE/lhlNW1JhculLUqjCnEujkj90EFSGRpx32k8PpIi4Q3Zbmx9NkS8OZ5Aj+p/Lwj9LEj0VfywAmlFmjiL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUCZa1h8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUCZa1h8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712286568; x=1743822568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsT6fr0AlnImf5NNABKpAE83sTyOqx9E96e0osVlZi4=;
  b=ZUCZa1h8yDohY/SHXNBgAwq0xvUfN9TT/OPtKwOCGgGT4n3Gq0zoa/Jy
   9iqakzi1G1WRX2lNTR1RSTdQ80P0FR/lGHIkvYWa7Jh/8As1wn2EFf0NC
   4DIKSBWNTJnLCjttfZkxJBcrHTNzCtw6up+FdhsOrViQ4HqsDjWEiRx/v
   PpNjzYUuIPhrwBK1/Wr6MfecNHWXTUmIVqxVsdRFzhqmSvZykqMrYseyq
   TKC9qRM9EhLwTlek2QoaaNA63Vwp3jzEiZvYanGrdom1X3zziXpwAzVSo
   C4QinpuNzPHFVIj2oiCE3hklqZ4eV2i9uIOjcIpo6TxLivj8tRCDe9Fxl
   g==;
X-CSE-ConnectionGUID: wwtUILl1SU+QCg68JDmbQQ==
X-CSE-MsgGUID: tqA+wdQsS8qZ+nAwIvXgyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7447167"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7447167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 20:09:27 -0700
X-CSE-ConnectionGUID: 7YVFpEH2Qi2+cSILRhCVqA==
X-CSE-MsgGUID: bNRejEqOS66VOHzv56VTEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19108891"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Apr 2024 20:09:25 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsZxB-0001ow-1h;
	Fri, 05 Apr 2024 03:09:21 +0000
Date: Fri, 5 Apr 2024 11:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 29/37] drivers/xen/xenfs/xenstored.c:52:17:
 warning: initialization of 'long unsigned int' from 'ssize_t (*)(struct file
 *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *,
 long unsigned int,  long long int *)'} makes integer from pointer wi...
Message-ID: <202404051138.Oh3lH2s2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: 34a49de340a534b0cb222309e73d1ef215ff4db6 [29/37] WIP
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240405/202404051138.Oh3lH2s2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051138.Oh3lH2s2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051138.Oh3lH2s2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3888:10: error: 'const struct file_operations' has no member named 'write'
    3888 |         .write = &debugfs_trigger_dump_v3_hw_write,
         |          ^~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3888:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    3888 |         .write = &debugfs_trigger_dump_v3_hw_write,
         |                  ^
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3888:18: note: (near initialization for 'debugfs_trigger_dump_v3_hw_fops')
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3888:18: error: initialization of 'struct module *' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3888:18: note: (near initialization for 'debugfs_trigger_dump_v3_hw_fops.owner')
   In file included from arch/arm64/include/asm/alternative.h:9,
                    from arch/arm64/include/asm/lse.h:14,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:6:
   include/linux/init.h:182:21: warning: initialized field overwritten [-Woverride-init]
     182 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3889:18: note: in expansion of macro 'THIS_MODULE'
    3889 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   include/linux/init.h:182:21: note: (near initialization for 'debugfs_trigger_dump_v3_hw_fops.owner')
     182 | #define THIS_MODULE ((struct module *)0)
         |                     ^
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3889:18: note: in expansion of macro 'THIS_MODULE'
    3889 |         .owner = THIS_MODULE,
         |                  ^~~~~~~~~~~
   In file included from include/linux/rtc.h:38,
                    from include/linux/efi.h:20,
                    from arch/arm64/include/asm/acpi.h:13,
                    from include/acpi/acpi_io.h:7,
                    from include/linux/acpi.h:39,
                    from drivers/scsi/hisi_sas/hisi_sas.h:10,
                    from drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:7:
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3962:29: error: 'debugfs_bist_linkrate_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_bist_linkrate_v3_hw_write'?
    3962 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_bist_linkrate_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4037:29: error: 'debugfs_bist_code_mode_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_bist_code_mode_v3_hw_write'?
    4037 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_bist_code_mode_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4071:29: error: 'debugfs_bist_phy_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_bist_phy_v3_hw_write'?
    4071 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_bist_phy_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4104:29: error: 'debugfs_bist_cnt_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_bist_cnt_v3_hw_write'?
    4104 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_bist_cnt_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4168:29: error: 'debugfs_bist_mode_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_bist_mode_v3_hw_write'?
    4168 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_bist_mode_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4206:29: error: 'debugfs_bist_enable_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_bist_enable_v3_hw_write'?
    4206 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_bist_enable_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4244:29: error: 'debugfs_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_v3_hw_write'?
    4244 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_v3_hw);
         |                             ^~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4275:29: error: 'debugfs_phy_down_cnt_v3_hw_write_iter' undeclared here (not in a function); did you mean 'debugfs_phy_down_cnt_v3_hw_write'?
    4275 | DEFINE_SHOW_STORE_ATTRIBUTE(debugfs_phy_down_cnt_v3_hw);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:220:27: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     220 |         .write_iter     = __name ## _write_iter,                        \
         |                           ^~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4397:10: error: 'const struct file_operations' has no member named 'write'
    4397 |         .write = debugfs_fifo_update_cfg_v3_hw_write,
         |          ^~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4397:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    4397 |         .write = debugfs_fifo_update_cfg_v3_hw_write,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4397:18: note: (near initialization for 'debugfs_fifo_update_cfg_v3_hw_fops')
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4397:18: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, const char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, const char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4397:18: note: (near initialization for 'debugfs_fifo_update_cfg_v3_hw_fops.flush')
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4246:16: warning: 'debugfs_phy_down_cnt_v3_hw_write' defined but not used [-Wunused-function]
    4246 | static ssize_t debugfs_phy_down_cnt_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4221:16: warning: 'debugfs_v3_hw_write' defined but not used [-Wunused-function]
    4221 | static ssize_t debugfs_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4170:16: warning: 'debugfs_bist_enable_v3_hw_write' defined but not used [-Wunused-function]
    4170 | static ssize_t debugfs_bist_enable_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4133:16: warning: 'debugfs_bist_mode_v3_hw_write' defined but not used [-Wunused-function]
    4133 | static ssize_t debugfs_bist_mode_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4073:16: warning: 'debugfs_bist_cnt_v3_hw_write' defined but not used [-Wunused-function]
    4073 | static ssize_t debugfs_bist_cnt_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4039:16: warning: 'debugfs_bist_phy_v3_hw_write' defined but not used [-Wunused-function]
    4039 | static ssize_t debugfs_bist_phy_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:4000:16: warning: 'debugfs_bist_code_mode_v3_hw_write' defined but not used [-Wunused-function]
    4000 | static ssize_t debugfs_bist_code_mode_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/hisi_sas/hisi_sas_v3_hw.c:3926:16: warning: 'debugfs_bist_linkrate_v3_hw_write' defined but not used [-Wunused-function]
    3926 | static ssize_t debugfs_bist_linkrate_v3_hw_write(struct file *filp,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/xen/xenfs/xenstored.c:52:10: error: 'const struct file_operations' has no member named 'read'
      52 |         .read = xsd_read,
         |          ^~~~
   drivers/xen/xenfs/xenstored.c:52:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      52 |         .read = xsd_read,
         |                 ^~~~~~~~
   drivers/xen/xenfs/xenstored.c:52:17: note: (near initialization for 'xsd_kva_file_ops')
>> drivers/xen/xenfs/xenstored.c:52:17: warning: initialization of 'long unsigned int' from 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} makes integer from pointer without a cast [-Wint-conversion]
   drivers/xen/xenfs/xenstored.c:52:17: note: (near initialization for 'xsd_kva_file_ops.mmap_supported_flags')
   drivers/xen/xenfs/xenstored.c:67:10: error: 'const struct file_operations' has no member named 'read'
      67 |         .read = xsd_read,
         |          ^~~~
   drivers/xen/xenfs/xenstored.c:67:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      67 |         .read = xsd_read,
         |                 ^~~~~~~~
   drivers/xen/xenfs/xenstored.c:67:17: note: (near initialization for 'xsd_port_file_ops')
   drivers/xen/xenfs/xenstored.c:67:17: error: initialization of 'int (*)(struct file *, void *)' from incompatible pointer type 'ssize_t (*)(struct file *, char *, size_t,  loff_t *)' {aka 'long int (*)(struct file *, char *, long unsigned int,  long long int *)'} [-Werror=incompatible-pointer-types]
   drivers/xen/xenfs/xenstored.c:67:17: note: (near initialization for 'xsd_port_file_ops.flush')
   cc1: some warnings being treated as errors


vim +52 drivers/xen/xenfs/xenstored.c

655d406a7c80bf Ian Campbell 2009-02-06  48  
655d406a7c80bf Ian Campbell 2009-02-06  49  const struct file_operations xsd_kva_file_ops = {
655d406a7c80bf Ian Campbell 2009-02-06  50  	.open = xsd_kva_open,
655d406a7c80bf Ian Campbell 2009-02-06  51  	.mmap = xsd_kva_mmap,
655d406a7c80bf Ian Campbell 2009-02-06 @52  	.read = xsd_read,
655d406a7c80bf Ian Campbell 2009-02-06  53  	.release = xsd_release,
655d406a7c80bf Ian Campbell 2009-02-06  54  };
655d406a7c80bf Ian Campbell 2009-02-06  55  

:::::: The code at line 52 was first introduced by commit
:::::: 655d406a7c80bffc03263d071b6ba1e0fcf548f9 xen: add /proc/xen/xsd_{kva,port} to xenfs

:::::: TO: Ian Campbell <ian.campbell@citrix.com>
:::::: CC: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
