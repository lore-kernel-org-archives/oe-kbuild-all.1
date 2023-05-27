Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE353FF4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 09:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685179919; x=1716715919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lkJYowJ/kmIMYp/nqN2uFtbYMD1f2eyGILOJrefKGic=;
  b=leNaeN7O32la6e3xjKeIRL9ynrrQZFjm45qkp+D/jtUAKyGjl8EoNVJS
   vtrPqgInBCNzfwDWXoeEz/bjjFcFttQsXg1RpcCFUCvNtB8LJjXWJitvR
   9cy8hV4Fghh2GM0bTb11F3xaSWdlquh6Onm7T9YDUJswWp9101B8LDhTW
   NQvPEeHTkqZL74gwYOa+J42B2QzXgR7ngHyILyaP7IhW3AARaDBgoVG4m
   LQMoZKXNleCg2hsq6wCiJlwGYDuXLlzWWG8Uc85vkF6aDo/hZZV8m7a3o
   6Y4D8b/EKBilcODAtosXzCaeiFPm7sIwIwBUfGA2CKj+MCcB5aqZoBwjr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334739669"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="334739669"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 02:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795352112"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="795352112"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 May 2023 02:31:58 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2qHF-000Jss-1W;
	Sat, 27 May 2023 09:31:57 +0000
Date: Sat, 27 May 2023 17:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/zen-sauce 2/30] drivers/scsi/vhba/vhba.c:886:6: error: no
 previous prototype for 'vhba_ctl_compat_ioctl'
Message-ID: <202305271734.TaMYMzTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.3/zen-sauce
head:   c25bf38649c4d20ae29994b1dadd4e87c3e67bf9
commit: b5f9c7665e1aea91a1ac7c9a48419373e1c921fa [2/30] ZEN: Add VHBA driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230527/202305271734.TaMYMzTj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/b5f9c7665e1aea91a1ac7c9a48419373e1c921fa
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.3/zen-sauce
        git checkout b5f9c7665e1aea91a1ac7c9a48419373e1c921fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271734.TaMYMzTj-lkp@intel.com/

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

   753	
 > 754	ssize_t vhba_ctl_read (struct file *file, char __user *buf, size_t buf_len, loff_t *offset)
   755	{
   756	    struct vhba_device *vdev;
   757	    struct vhba_command *vcmd;
   758	    ssize_t ret;
   759	    unsigned long flags;
   760	
   761	    vdev = file->private_data;
   762	
   763	    /* Get next command */
   764	    if (file->f_flags & O_NONBLOCK) {
   765	        /* Non-blocking variant */
   766	        spin_lock_irqsave(&vdev->cmd_lock, flags);
   767	        vcmd = next_command(vdev);
   768	        spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   769	
   770	        if (!vcmd) {
   771	            return -EWOULDBLOCK;
   772	        }
   773	    } else {
   774	        /* Blocking variant */
   775	        spin_lock_irqsave(&vdev->cmd_lock, flags);
   776	        vcmd = wait_command(vdev, flags);
   777	        spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   778	
   779	        if (!vcmd) {
   780	            return -ERESTARTSYS;
   781	        }
   782	    }
   783	
   784	    ret = do_request(vdev, vcmd->metatag, vcmd->cmd, buf, buf_len);
   785	
   786	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   787	    if (ret >= 0) {
   788	        vcmd->status = VHBA_REQ_SENT;
   789	        *offset += ret;
   790	    } else {
   791	        vcmd->status = VHBA_REQ_PENDING;
   792	    }
   793	
   794	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   795	
   796	    return ret;
   797	}
   798	
   799	ssize_t vhba_ctl_write (struct file *file, const char __user *buf, size_t buf_len, loff_t *offset)
   800	{
   801	    struct vhba_device *vdev;
   802	    struct vhba_command *vcmd;
   803	    struct vhba_response res;
   804	    ssize_t ret;
   805	    unsigned long flags;
   806	
   807	    if (buf_len < sizeof(res)) {
   808	        return -EIO;
   809	    }
   810	
   811	    if (copy_from_user(&res, buf, sizeof(res))) {
   812	        return -EFAULT;
   813	    }
   814	
   815	    vdev = file->private_data;
   816	
   817	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   818	    vcmd = match_command(vdev, res.metatag);
   819	    if (!vcmd || vcmd->status != VHBA_REQ_SENT) {
   820	        spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   821	        pr_debug("ctl dev #%u not expecting response\n", vdev->num);
   822	        return -EIO;
   823	    }
   824	    vcmd->status = VHBA_REQ_WRITING;
   825	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   826	
   827	    ret = do_response(vdev, vcmd->metatag, vcmd->cmd, buf + sizeof(res), buf_len - sizeof(res), &res);
   828	
   829	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   830	    if (ret >= 0) {
   831	#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 16, 0)
   832	        scsi_done(vcmd->cmd);
   833	#else
   834	        vcmd->cmd->scsi_done(vcmd->cmd);
   835	#endif
   836	        ret += sizeof(res);
   837	
   838	        /* don't compete with vhba_device_dequeue */
   839	        if (!list_empty(&vcmd->entry)) {
   840	            list_del_init(&vcmd->entry);
   841	            vhba_free_command(vcmd);
   842	        }
   843	    } else {
   844	        vcmd->status = VHBA_REQ_SENT;
   845	    }
   846	
   847	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   848	
   849	    return ret;
   850	}
   851	
   852	long vhba_ctl_ioctl (struct file *file, unsigned int cmd, unsigned long arg)
   853	{
   854	    struct vhba_device *vdev = file->private_data;
   855	    struct vhba_host *vhost = platform_get_drvdata(&vhba_platform_device);
   856	
   857	    switch (cmd) {
   858	        case 0xBEEF001: {
   859	            unsigned int ident[4]; /* host, channel, id, lun */
   860	
   861	            ident[0] = vhost->shost->host_no;
   862	            devnum_to_bus_and_id(vdev->num, &ident[1], &ident[2]);
   863	            ident[3] = 0; /* lun */
   864	
   865	            if (copy_to_user((void *) arg, ident, sizeof(ident))) {
   866	                return -EFAULT;
   867	            }
   868	
   869	            return 0;
   870	        }
   871	        case 0xBEEF002: {
   872	            unsigned int devnum = vdev->num;
   873	
   874	            if (copy_to_user((void *) arg, &devnum, sizeof(devnum))) {
   875	                return -EFAULT;
   876	            }
   877	
   878	            return 0;
   879	        }
   880	    }
   881	
   882	    return -ENOTTY;
   883	}
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
