Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45555168C8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A21cfYJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699139417; x=1730675417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/0P6luFeg3u/F1hC21NNzFbuCiAsPiD6Id7vs9QGd+A=;
  b=A21cfYJq83A9tNvLBDCWgukHOgRudlu3xp+O4uT6dvm2dCwsO657KwcT
   fYV8YyUIFp6whpEcHsP8gACBlNbUzJmqwnWIH/SIj0bZGbPDdW4kvggX/
   u5agBGYR+wdpa3zx0Ojkpg7GLJu5luYcIXFnLrppQdkM0a3k8cptXMChU
   KZ+jg1Rt4+0tdzNyj0TZYC/31V3fj3brM9VsDkkcdrBZ1lcfZzj3Y9bp9
   30lvDiNSabmiD7hntzIvbAsdbrstNqIDRDgicoyWacx3sFdcQvYB9adBl
   OLqjQipEGAwomevIXqWdqYl6pEHbA1288rd6ufv/MC7DIxKKVttAI7sSy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="2014960"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="2014960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 16:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="852613353"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="852613353"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2023 16:10:13 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzPmN-0004ma-10;
	Sat, 04 Nov 2023 23:10:11 +0000
Date: Sun, 5 Nov 2023 07:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 2/31] drivers/scsi/vhba/vhba.c:886:6: warning: no
 previous prototype for 'vhba_ctl_compat_ioctl'
Message-ID: <202311050641.7kv83uNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   f0d1b5037d24ee5b94bb79b790597ecf6897c447
commit: 98c9b99c3d9351380be5a9660f7d64c3cd9aec38 [2/31] ZEN: Add VHBA driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311050641.7kv83uNo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050641.7kv83uNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050641.7kv83uNo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c:145:6: warning: no previous prototype for 'devnum_to_bus_and_id' [-Wmissing-prototypes]
     145 | void devnum_to_bus_and_id(unsigned int devnum, unsigned int *bus, unsigned int *id)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:151:14: warning: no previous prototype for 'bus_and_id_to_devnum' [-Wmissing-prototypes]
     151 | unsigned int bus_and_id_to_devnum(unsigned int bus, unsigned int id)
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:156:21: warning: no previous prototype for 'vhba_device_alloc' [-Wmissing-prototypes]
     156 | struct vhba_device *vhba_device_alloc (void)
         |                     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:176:6: warning: no previous prototype for 'vhba_device_put' [-Wmissing-prototypes]
     176 | void vhba_device_put (struct vhba_device *vdev)
         |      ^~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:183:21: warning: no previous prototype for 'vhba_device_get' [-Wmissing-prototypes]
     183 | struct vhba_device *vhba_device_get (struct vhba_device *vdev)
         |                     ^~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:190:5: warning: no previous prototype for 'vhba_device_queue' [-Wmissing-prototypes]
     190 | int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
   drivers/scsi/vhba/vhba.c: At top level:
   drivers/scsi/vhba/vhba.c:219:5: warning: no previous prototype for 'vhba_device_dequeue' [-Wmissing-prototypes]
     219 | int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:274:6: warning: no previous prototype for 'vhba_scan_devices_add' [-Wmissing-prototypes]
     274 | void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:287:6: warning: no previous prototype for 'vhba_scan_devices_remove' [-Wmissing-prototypes]
     287 | void vhba_scan_devices_remove (struct vhba_host *vhost, int bus, int id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:300:6: warning: no previous prototype for 'vhba_scan_devices' [-Wmissing-prototypes]
     300 | void vhba_scan_devices (struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:348:5: warning: no previous prototype for 'vhba_add_device' [-Wmissing-prototypes]
     348 | int vhba_add_device (struct vhba_device *vdev)
         |     ^~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:382:5: warning: no previous prototype for 'vhba_remove_device' [-Wmissing-prototypes]
     382 | int vhba_remove_device (struct vhba_device *vdev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:403:21: warning: no previous prototype for 'vhba_lookup_device' [-Wmissing-prototypes]
     403 | struct vhba_device *vhba_lookup_device (int devnum)
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:474:5: warning: no previous prototype for 'vhba_queuecommand' [-Wmissing-prototypes]
     474 | int vhba_queuecommand (struct Scsi_Host *shost, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:508:5: warning: no previous prototype for 'vhba_abort' [-Wmissing-prototypes]
     508 | int vhba_abort (struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~
   drivers/scsi/vhba/vhba.c:551:9: warning: no previous prototype for 'do_request' [-Wmissing-prototypes]
     551 | ssize_t do_request (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, char __user *buf, size_t buf_len)
         |         ^~~~~~~~~~
   drivers/scsi/vhba/vhba.c:617:9: warning: no previous prototype for 'do_response' [-Wmissing-prototypes]
     617 | ssize_t do_response (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, const char __user *buf, size_t buf_len, struct vhba_response *res)
         |         ^~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:693:22: warning: no previous prototype for 'next_command' [-Wmissing-prototypes]
     693 | struct vhba_command *next_command (struct vhba_device *vdev)
         |                      ^~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:710:22: warning: no previous prototype for 'match_command' [-Wmissing-prototypes]
     710 | struct vhba_command *match_command (struct vhba_device *vdev, __u32 metatag)
         |                      ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:727:22: warning: no previous prototype for 'wait_command' [-Wmissing-prototypes]
     727 | struct vhba_command *wait_command (struct vhba_device *vdev, unsigned long flags)
         |                      ^~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:754:9: warning: no previous prototype for 'vhba_ctl_read' [-Wmissing-prototypes]
     754 | ssize_t vhba_ctl_read (struct file *file, char __user *buf, size_t buf_len, loff_t *offset)
         |         ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:799:9: warning: no previous prototype for 'vhba_ctl_write' [-Wmissing-prototypes]
     799 | ssize_t vhba_ctl_write (struct file *file, const char __user *buf, size_t buf_len, loff_t *offset)
         |         ^~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:852:6: warning: no previous prototype for 'vhba_ctl_ioctl' [-Wmissing-prototypes]
     852 | long vhba_ctl_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
         |      ^~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:886:6: warning: no previous prototype for 'vhba_ctl_compat_ioctl' [-Wmissing-prototypes]
     886 | long vhba_ctl_compat_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:893:14: warning: no previous prototype for 'vhba_ctl_poll' [-Wmissing-prototypes]
     893 | unsigned int vhba_ctl_poll (struct file *file, poll_table *wait)
         |              ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:910:5: warning: no previous prototype for 'vhba_ctl_open' [-Wmissing-prototypes]
     910 | int vhba_ctl_open (struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:942:5: warning: no previous prototype for 'vhba_ctl_release' [-Wmissing-prototypes]
     942 | int vhba_ctl_release (struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:998:5: warning: no previous prototype for 'vhba_probe' [-Wmissing-prototypes]
     998 | int vhba_probe (struct platform_device *pdev)
         |     ^~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1052:5: warning: no previous prototype for 'vhba_remove' [-Wmissing-prototypes]
    1052 | int vhba_remove (struct platform_device *pdev)
         |     ^~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1068:6: warning: no previous prototype for 'vhba_release' [-Wmissing-prototypes]
    1068 | void vhba_release (struct device * dev)
         |      ^~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1090:12: warning: no previous prototype for 'vhba_init' [-Wmissing-prototypes]
    1090 | int __init vhba_init (void)
         |            ^~~~~~~~~
   drivers/scsi/vhba/vhba.c:1115:13: warning: no previous prototype for 'vhba_exit' [-Wmissing-prototypes]
    1115 | void __exit vhba_exit(void)
         |             ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +/vhba_ctl_compat_ioctl +886 drivers/scsi/vhba/vhba.c

   884	
   885	#ifdef CONFIG_COMPAT
 > 886	long vhba_ctl_compat_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
   887	{
   888	    unsigned long compat_arg = (unsigned long)compat_ptr(arg);
   889	    return vhba_ctl_ioctl(file, cmd, compat_arg);
   890	}
   891	#endif
   892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
