Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5823A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 07:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682668708; x=1714204708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EDBACI6iTnc/hVZtfTTDffTFZkupaZy4iPBlCGyCH24=;
  b=RVEWSySde8bez2ylvoxW0XtGXXzqBU+pwKVLKc4JNe78uKSIwvxtU8wn
   CJeu5KTagpoWT3+fVg2ek2mmGNiZqoWWYOm+oH+d0jxoMyKe8ZzzDKFAo
   84RPRCzETxMVRLWtQdfTN3dmvogzhqfGQC1rASwjqoZJGO03+jke8FrZQ
   QEArAQuDtqwhY5GKkG1lRhPD/g3lbCBo4FhE7aZ6iqlg6J4jWNHLUDnRh
   v7ZXPriZyYk7IX04dtHMyel+aDoAldlQzBPTG7pTGKVBoWfwkbQWn6njp
   svZc0eMrTQcH9ANjN8GAmKq/4yqq/Omchc3dbDQn3bX25zQcLXvLN1C5u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410767821"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="410767821"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 00:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="869077828"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="869077828"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 00:58:26 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psIzq-0000I5-0F;
	Fri, 28 Apr 2023 07:58:26 +0000
Date: Fri, 28 Apr 2023 15:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/zen-sauce 2/28] drivers/scsi/vhba/vhba.c:886:6: error: no
 previous prototype for 'vhba_ctl_compat_ioctl'
Message-ID: <202304281509.Rg9ByX7l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.2/zen-sauce
head:   0d4f21bee5ebe76954a08163ec8eba12153566f2
commit: 89468834ac3be8c6d12c90bc2e760f1b7bc86995 [2/28] ZEN: Add VHBA driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304281509.Rg9ByX7l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/89468834ac3be8c6d12c90bc2e760f1b7bc86995
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/zen-sauce
        git checkout 89468834ac3be8c6d12c90bc2e760f1b7bc86995
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281509.Rg9ByX7l-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/vhba/vhba.c:145:6: error: no previous prototype for 'devnum_to_bus_and_id' [-Werror=missing-prototypes]
     145 | void devnum_to_bus_and_id(unsigned int devnum, unsigned int *bus, unsigned int *id)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:151:14: error: no previous prototype for 'bus_and_id_to_devnum' [-Werror=missing-prototypes]
     151 | unsigned int bus_and_id_to_devnum(unsigned int bus, unsigned int id)
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:156:21: error: no previous prototype for 'vhba_device_alloc' [-Werror=missing-prototypes]
     156 | struct vhba_device *vhba_device_alloc (void)
         |                     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:176:6: error: no previous prototype for 'vhba_device_put' [-Werror=missing-prototypes]
     176 | void vhba_device_put (struct vhba_device *vdev)
         |      ^~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:183:21: error: no previous prototype for 'vhba_device_get' [-Werror=missing-prototypes]
     183 | struct vhba_device *vhba_device_get (struct vhba_device *vdev)
         |                     ^~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:190:5: error: no previous prototype for 'vhba_device_queue' [-Werror=missing-prototypes]
     190 | int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
   drivers/scsi/vhba/vhba.c: At top level:
   drivers/scsi/vhba/vhba.c:219:5: error: no previous prototype for 'vhba_device_dequeue' [-Werror=missing-prototypes]
     219 | int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:274:6: error: no previous prototype for 'vhba_scan_devices_add' [-Werror=missing-prototypes]
     274 | void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:287:6: error: no previous prototype for 'vhba_scan_devices_remove' [-Werror=missing-prototypes]
     287 | void vhba_scan_devices_remove (struct vhba_host *vhost, int bus, int id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:300:6: error: no previous prototype for 'vhba_scan_devices' [-Werror=missing-prototypes]
     300 | void vhba_scan_devices (struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:348:5: error: no previous prototype for 'vhba_add_device' [-Werror=missing-prototypes]
     348 | int vhba_add_device (struct vhba_device *vdev)
         |     ^~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:382:5: error: no previous prototype for 'vhba_remove_device' [-Werror=missing-prototypes]
     382 | int vhba_remove_device (struct vhba_device *vdev)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:403:21: error: no previous prototype for 'vhba_lookup_device' [-Werror=missing-prototypes]
     403 | struct vhba_device *vhba_lookup_device (int devnum)
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:474:5: error: no previous prototype for 'vhba_queuecommand' [-Werror=missing-prototypes]
     474 | int vhba_queuecommand (struct Scsi_Host *shost, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:508:5: error: no previous prototype for 'vhba_abort' [-Werror=missing-prototypes]
     508 | int vhba_abort (struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~
   drivers/scsi/vhba/vhba.c:551:9: error: no previous prototype for 'do_request' [-Werror=missing-prototypes]
     551 | ssize_t do_request (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, char __user *buf, size_t buf_len)
         |         ^~~~~~~~~~
   drivers/scsi/vhba/vhba.c:617:9: error: no previous prototype for 'do_response' [-Werror=missing-prototypes]
     617 | ssize_t do_response (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, const char __user *buf, size_t buf_len, struct vhba_response *res)
         |         ^~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:693:22: error: no previous prototype for 'next_command' [-Werror=missing-prototypes]
     693 | struct vhba_command *next_command (struct vhba_device *vdev)
         |                      ^~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:710:22: error: no previous prototype for 'match_command' [-Werror=missing-prototypes]
     710 | struct vhba_command *match_command (struct vhba_device *vdev, __u32 metatag)
         |                      ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:727:22: error: no previous prototype for 'wait_command' [-Werror=missing-prototypes]
     727 | struct vhba_command *wait_command (struct vhba_device *vdev, unsigned long flags)
         |                      ^~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:754:9: error: no previous prototype for 'vhba_ctl_read' [-Werror=missing-prototypes]
     754 | ssize_t vhba_ctl_read (struct file *file, char __user *buf, size_t buf_len, loff_t *offset)
         |         ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:799:9: error: no previous prototype for 'vhba_ctl_write' [-Werror=missing-prototypes]
     799 | ssize_t vhba_ctl_write (struct file *file, const char __user *buf, size_t buf_len, loff_t *offset)
         |         ^~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:852:6: error: no previous prototype for 'vhba_ctl_ioctl' [-Werror=missing-prototypes]
     852 | long vhba_ctl_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
         |      ^~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:886:6: error: no previous prototype for 'vhba_ctl_compat_ioctl' [-Werror=missing-prototypes]
     886 | long vhba_ctl_compat_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:893:14: error: no previous prototype for 'vhba_ctl_poll' [-Werror=missing-prototypes]
     893 | unsigned int vhba_ctl_poll (struct file *file, poll_table *wait)
         |              ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:910:5: error: no previous prototype for 'vhba_ctl_open' [-Werror=missing-prototypes]
     910 | int vhba_ctl_open (struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:942:5: error: no previous prototype for 'vhba_ctl_release' [-Werror=missing-prototypes]
     942 | int vhba_ctl_release (struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:998:5: error: no previous prototype for 'vhba_probe' [-Werror=missing-prototypes]
     998 | int vhba_probe (struct platform_device *pdev)
         |     ^~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1052:5: error: no previous prototype for 'vhba_remove' [-Werror=missing-prototypes]
    1052 | int vhba_remove (struct platform_device *pdev)
         |     ^~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1068:6: error: no previous prototype for 'vhba_release' [-Werror=missing-prototypes]
    1068 | void vhba_release (struct device * dev)
         |      ^~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c:1090:12: error: no previous prototype for 'vhba_init' [-Werror=missing-prototypes]
    1090 | int __init vhba_init (void)
         |            ^~~~~~~~~
   drivers/scsi/vhba/vhba.c:1115:13: error: no previous prototype for 'vhba_exit' [-Werror=missing-prototypes]
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
https://github.com/intel/lkp-tests
