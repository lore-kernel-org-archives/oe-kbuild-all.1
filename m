Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A593D962
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 21:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711314843; cv=none; b=btZVS9vMVpK6bQc6Ntp5ka3olqg9zk2STdedIks3NWrrfINf+o9YcDuWGwXzjdHGoZdDM0tSlFYeXrm5kVdYP0GI1grljP1Ns1dUEinm9Y1U/HjvaTuOqrzeIuNnbHP876swulUjF3RHwKPTfOF/h7VJd+sfJaQPJpXJT5kd3Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711314843; c=relaxed/simple;
	bh=A2X9FlvfGIguo+7NKvvszHfW1opR/952LYe1aNpk6ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1c/i1vcf7y96yZb8rP9XCy1mj6KhB11pnoBtLV5sq4IbZkEw1wSe/tEBxU0GYgK1tfZwMSt6URLnP1nfS8hM5NS02oYfyQ9rlPtBGpVZQbCC80CA7mzbLQu1Nwm/oPKTJOKwmogvSQfrarLw+sISbdl5A+tqLPdA0zBRk0a4sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpBGdpxR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpBGdpxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711314840; x=1742850840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2X9FlvfGIguo+7NKvvszHfW1opR/952LYe1aNpk6ik=;
  b=DpBGdpxREt79hXDxUrr+VVS1OcyoU7vXO4692+EeWBLnBaKCQ//+6d0f
   Vjxx9zAiwpKlQO9jsXLRibarOVA1rym+8s3FEpHHPiIoow9yq/6tXDPMD
   JQanLBSiYSZSSvZTgGxz90eukLgDZTEMmG4qVSUqvAjpahKMT7Adz3jW9
   2OnutCsWxCC7tzCHHcLvQ2D4u6UXZboCyTbrtiadtDhB9f8gbYrcMAyDn
   /FGK6flyX1c00yQ5G/rx77CY1cm/TGTO8leGXR48r5fwxRw++osdqNArq
   Pf6eejKFCaf87NHMMH5GHq+O8tY8hlE1tQhG+hCrQ5bNfo3DAbAwG+KD5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10096727"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="10096727"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 14:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="20090334"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2024 14:13:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roVAB-000M1j-2z;
	Sun, 24 Mar 2024 21:13:55 +0000
Date: Mon, 25 Mar 2024 05:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/zen-sauce 2/32] drivers/scsi/vhba/vhba.c:192:23: error:
 variable 'vhost' set but not used
Message-ID: <202403250509.l7DFIv8k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   7cf7be28a2b0655918b7533205012566b4e8ed80
commit: 5442bc6cb8f83242249c741205276ef3b1545e37 [2/32] ZEN: Add VHBA driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240325/202403250509.l7DFIv8k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403250509.l7DFIv8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403250509.l7DFIv8k-lkp@intel.com/

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
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
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


vim +/vhost +192 drivers/scsi/vhba/vhba.c

   189	
   190	int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
   191	{
 > 192	    struct vhba_host *vhost;
   193	    struct vhba_command *vcmd;
   194	    unsigned long flags;
   195	
   196	    vhost = platform_get_drvdata(&vhba_platform_device);
   197	
   198	    vcmd = vhba_alloc_command();
   199	    if (!vcmd) {
   200	        return SCSI_MLQUEUE_HOST_BUSY;
   201	    }
   202	
   203	    vcmd->cmd = cmd;
   204	
   205	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   206	#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
   207	    vcmd->metatag = scsi_cmd_to_rq(vcmd->cmd)->tag;
   208	#else
   209	    vcmd->metatag = vcmd->cmd->request->tag;
   210	#endif
   211	    list_add_tail(&vcmd->entry, &vdev->cmd_list);
   212	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   213	
   214	    wake_up_interruptible(&vdev->cmd_wq);
   215	
   216	    return 0;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
