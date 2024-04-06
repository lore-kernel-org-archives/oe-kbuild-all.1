Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CC2B9B8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712408797; cv=none; b=hX7sJFLMlzF27anGQP17qcmneR33YeVKneLyuGyhePs4ex2n9q7uS3NbG+JDHFFsNOA1vy8yVkQ7Udy6Um1OW8D3h23rNuq28NYwlk+G0ALyX3Oc449vXElQBlnNaK8F01JRsdEkfKy3fFCVJP0KzTd3GtmsgH2ps6xZMx0bSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712408797; c=relaxed/simple;
	bh=gUvqz4vOsV5Y95zFJN71Lo15R22O/VS9/uXsxphFOLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzLt1WYGWUDkywDJ8VTL+WNwFrwLCtUXTUEOTfN+/p6opGT37oZ7KcGJmXiXdcsg4O7TTGQoKHNZNLcrac57jCOMAIkY7B4E7oneVtSb75cvB9s/1y5cfQ66D98V3Tm3yBUt5zY0yJX7ay/hYTsm3u9LW+8r9GPF3WptVXsX3HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNFphDaG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNFphDaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712408796; x=1743944796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gUvqz4vOsV5Y95zFJN71Lo15R22O/VS9/uXsxphFOLg=;
  b=eNFphDaG0Nei8VJczk3nBqpKoN6uVNIFSkA6KMV+tYRri2mtakKoQWyY
   d+/SE3r6wA8RaTgfXDH+eEKS9eWUXrGeVl+1xO48ZAuttOvq7sRw2yhmf
   IvO5OtaqWKO3UXYFr+9GbdYQE38q1Sk+3XlFKJhr265C1uDdW19sHtmEj
   L/xvbcwJJ1JAqe409NFbu3vorr9TknD4Tg5y7oBrkzOwxT3ry6bndBnNo
   GIOkmWJskZNp59QSLnc7dSsSFjpQw6KuYoa87JSCvt45pGZMFDT71r0kv
   FSDgmsQK3744uS7zG8X0WeX1fh3qhVEovIjij8x7YDgYhuhGm2giuXYAs
   w==;
X-CSE-ConnectionGUID: Cn123xYKQUWjg8wQviRI/A==
X-CSE-MsgGUID: pC/QeTjIQ66truoNBTxcrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="19095914"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="19095914"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 06:06:35 -0700
X-CSE-ConnectionGUID: 1XUVw0/IQ+C/bOOzhyWJeg==
X-CSE-MsgGUID: KuUCy3UAS9CFoMg5RHCBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="56909110"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Apr 2024 06:06:35 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rt5kd-0003Ue-2f;
	Sat, 06 Apr 2024 13:06:31 +0000
Date: Sat, 6 Apr 2024 21:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 105/105] drivers/hwmon/pt5161l.c:516:17: error:
 invalid initializer
Message-ID: <202404062017.6mWG70xe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   bb4803260393a54d3b254c2abfe121ab89cce776
commit: bb4803260393a54d3b254c2abfe121ab89cce776 [105/105] REMOVE ->read() and ->write()
config: i386-randconfig-063-20240406 (https://download.01.org/0day-ci/archive/20240406/202404062017.6mWG70xe-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404062017.6mWG70xe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404062017.6mWG70xe-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pt5161l.c:516:10: error: 'const struct file_operations' has no member named 'read'
     516 |         .read = pt5161l_debugfs_read_fw_ver,
         |          ^~~~
   drivers/hwmon/pt5161l.c:516:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     516 |         .read = pt5161l_debugfs_read_fw_ver,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pt5161l.c:516:17: note: (near initialization for 'pt5161l_debugfs_ops_fw_ver')
>> drivers/hwmon/pt5161l.c:516:17: error: invalid initializer
   drivers/hwmon/pt5161l.c:516:17: note: (near initialization for 'pt5161l_debugfs_ops_fw_ver.<anonymous>')
   drivers/hwmon/pt5161l.c:542:10: error: 'const struct file_operations' has no member named 'read'
     542 |         .read = pt5161l_debugfs_read_fw_load_sts,
         |          ^~~~
   drivers/hwmon/pt5161l.c:542:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     542 |         .read = pt5161l_debugfs_read_fw_load_sts,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pt5161l.c:542:17: note: (near initialization for 'pt5161l_debugfs_ops_fw_load_sts')
   drivers/hwmon/pt5161l.c:542:17: error: invalid initializer
   drivers/hwmon/pt5161l.c:542:17: note: (near initialization for 'pt5161l_debugfs_ops_fw_load_sts.<anonymous>')
   drivers/hwmon/pt5161l.c:567:10: error: 'const struct file_operations' has no member named 'read'
     567 |         .read = pt5161l_debugfs_read_hb_sts,
         |          ^~~~
   drivers/hwmon/pt5161l.c:567:17: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     567 |         .read = pt5161l_debugfs_read_hb_sts,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/pt5161l.c:567:17: note: (near initialization for 'pt5161l_debugfs_ops_hb_sts')
   drivers/hwmon/pt5161l.c:567:17: error: invalid initializer
   drivers/hwmon/pt5161l.c:567:17: note: (near initialization for 'pt5161l_debugfs_ops_hb_sts.<anonymous>')
   cc1: some warnings being treated as errors
--
   drivers/iio/industrialio-event.c:185:10: error: 'const struct file_operations' has no member named 'read'
     185 |         .read =  iio_event_chrdev_read,
         |          ^~~~
   drivers/iio/industrialio-event.c:185:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     185 |         .read =  iio_event_chrdev_read,
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/industrialio-event.c:185:18: note: (near initialization for 'iio_event_chrdev_fileops')
>> drivers/iio/industrialio-event.c:185:18: error: invalid initializer
   drivers/iio/industrialio-event.c:185:18: note: (near initialization for 'iio_event_chrdev_fileops.<anonymous>')
   cc1: some warnings being treated as errors
--
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1279:10: error: 'const struct file_operations' has no member named 'write'
    1279 |         .write = pseudo_lock_measure_trigger,
         |          ^~~~~
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1279:18: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1279 |         .write = pseudo_lock_measure_trigger,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1279:18: note: (near initialization for 'pseudo_measure_fops')
>> arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1279:18: error: invalid initializer
   arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1279:18: note: (near initialization for 'pseudo_measure_fops.<anonymous>')
   cc1: some warnings being treated as errors


vim +516 drivers/hwmon/pt5161l.c

1b2ca93cd0592b Cosmo Chou 2024-02-06  514  
1b2ca93cd0592b Cosmo Chou 2024-02-06  515  static const struct file_operations pt5161l_debugfs_ops_fw_ver = {
1b2ca93cd0592b Cosmo Chou 2024-02-06 @516  	.read = pt5161l_debugfs_read_fw_ver,
1b2ca93cd0592b Cosmo Chou 2024-02-06  517  	.open = simple_open,
1b2ca93cd0592b Cosmo Chou 2024-02-06  518  };
1b2ca93cd0592b Cosmo Chou 2024-02-06  519  

:::::: The code at line 516 was first introduced by commit
:::::: 1b2ca93cd0592b1fcbc6f8b64e02552bc15f4bb4 hwmon: Add driver for Astera Labs PT5161L retimer

:::::: TO: Cosmo Chou <chou.cosmo@gmail.com>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
