Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B82A9EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 23:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685142948; x=1716678948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXZBKa/3R9/adLiVgPu9DuH93fcbb68kmpgMdrjYS7s=;
  b=K4zxbyPQ/AakjNPYFnQO+Q/5UtHaYdWzNrFciAHv4/9kUFwyBLR4mdWG
   CMqVCPuIFO/PUscCi0hpmnUPcJRlJsk6PTySZBq05kCbk6rFS/TkW1N7S
   jMYzieztPpEzBI+CNe1T63y9jIuK8tFzXZPNGUbgY5DoWu0I2KKREoQ4z
   Ujsi9HWPX9Q/+Oqr/okK2J9Vb74ElxO+gKyDAKRqyRkulSL+OHWtPRMba
   jrbW8buqUaHjwZKP8ahqXE4uWCHsNL9Ep6+8xFtcmoqTIhZeU4eqxmN7W
   7TSG88DiUlvgoPWr5+C12B0cKPifnndiMgU4t+Cj1R0ScGbs3HaDKIVRl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353171925"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="353171925"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 16:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775240954"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="775240954"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 May 2023 16:15:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2gew-000Jee-0U;
	Fri, 26 May 2023 23:15:46 +0000
Date: Sat, 27 May 2023 07:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.3/zen-sauce 2/30] drivers/scsi/vhba/vhba.c:145:6: error: no
 previous prototype for 'devnum_to_bus_and_id'
Message-ID: <202305270703.rkFmAC6N-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230527/202305270703.rkFmAC6N-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/i2c/busses/ drivers/scsi/vhba/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270703.rkFmAC6N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/vhba/vhba.c:145:6: error: no previous prototype for 'devnum_to_bus_and_id' [-Werror=missing-prototypes]
     145 | void devnum_to_bus_and_id(unsigned int devnum, unsigned int *bus, unsigned int *id)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:151:14: error: no previous prototype for 'bus_and_id_to_devnum' [-Werror=missing-prototypes]
     151 | unsigned int bus_and_id_to_devnum(unsigned int bus, unsigned int id)
         |              ^~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:156:21: error: no previous prototype for 'vhba_device_alloc' [-Werror=missing-prototypes]
     156 | struct vhba_device *vhba_device_alloc (void)
         |                     ^~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:176:6: error: no previous prototype for 'vhba_device_put' [-Werror=missing-prototypes]
     176 | void vhba_device_put (struct vhba_device *vdev)
         |      ^~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:183:21: error: no previous prototype for 'vhba_device_get' [-Werror=missing-prototypes]
     183 | struct vhba_device *vhba_device_get (struct vhba_device *vdev)
         |                     ^~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:190:5: error: no previous prototype for 'vhba_device_queue' [-Werror=missing-prototypes]
     190 | int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~
   drivers/scsi/vhba/vhba.c: In function 'vhba_device_queue':
>> drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror=unused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^~~~~
   drivers/scsi/vhba/vhba.c: At top level:
>> drivers/scsi/vhba/vhba.c:219:5: error: no previous prototype for 'vhba_device_dequeue' [-Werror=missing-prototypes]
     219 | int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:274:6: error: no previous prototype for 'vhba_scan_devices_add' [-Werror=missing-prototypes]
     274 | void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:287:6: error: no previous prototype for 'vhba_scan_devices_remove' [-Werror=missing-prototypes]
     287 | void vhba_scan_devices_remove (struct vhba_host *vhost, int bus, int id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:300:6: error: no previous prototype for 'vhba_scan_devices' [-Werror=missing-prototypes]
     300 | void vhba_scan_devices (struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:348:5: error: no previous prototype for 'vhba_add_device' [-Werror=missing-prototypes]
     348 | int vhba_add_device (struct vhba_device *vdev)
         |     ^~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:382:5: error: no previous prototype for 'vhba_remove_device' [-Werror=missing-prototypes]
     382 | int vhba_remove_device (struct vhba_device *vdev)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:403:21: error: no previous prototype for 'vhba_lookup_device' [-Werror=missing-prototypes]
     403 | struct vhba_device *vhba_lookup_device (int devnum)
         |                     ^~~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:474:5: error: no previous prototype for 'vhba_queuecommand' [-Werror=missing-prototypes]
     474 | int vhba_queuecommand (struct Scsi_Host *shost, struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:508:5: error: no previous prototype for 'vhba_abort' [-Werror=missing-prototypes]
     508 | int vhba_abort (struct scsi_cmnd *cmd)
         |     ^~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:551:9: error: no previous prototype for 'do_request' [-Werror=missing-prototypes]
     551 | ssize_t do_request (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, char __user *buf, size_t buf_len)
         |         ^~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:617:9: error: no previous prototype for 'do_response' [-Werror=missing-prototypes]
     617 | ssize_t do_response (struct vhba_device *vdev, unsigned long metatag, struct scsi_cmnd *cmd, const char __user *buf, size_t buf_len, struct vhba_response *res)
         |         ^~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:693:22: error: no previous prototype for 'next_command' [-Werror=missing-prototypes]
     693 | struct vhba_command *next_command (struct vhba_device *vdev)
         |                      ^~~~~~~~~~~~
>> drivers/scsi/vhba/vhba.c:710:22: error: no previous prototype for 'match_command' [-Werror=missing-prototypes]
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


vim +/devnum_to_bus_and_id +145 drivers/scsi/vhba/vhba.c

   140	
   141	
   142	
   143	/* These functions define a symmetric 1:1 mapping between device numbers and
   144	   the bus and id. We have reserved the last id per bus for the host itself. */
 > 145	void devnum_to_bus_and_id(unsigned int devnum, unsigned int *bus, unsigned int *id)
   146	{
   147	    *bus = devnum / (VHBA_MAX_ID-1);
   148	    *id  = devnum % (VHBA_MAX_ID-1);
   149	}
   150	
 > 151	unsigned int bus_and_id_to_devnum(unsigned int bus, unsigned int id)
   152	{
   153	    return (bus * (VHBA_MAX_ID-1)) + id;
   154	}
   155	
 > 156	struct vhba_device *vhba_device_alloc (void)
   157	{
   158	    struct vhba_device *vdev;
   159	
   160	    vdev = kzalloc(sizeof(struct vhba_device), GFP_KERNEL);
   161	    if (!vdev) {
   162	        return NULL;
   163	    }
   164	
   165	    spin_lock_init(&vdev->cmd_lock);
   166	    INIT_LIST_HEAD(&vdev->cmd_list);
   167	    init_waitqueue_head(&vdev->cmd_wq);
   168	    atomic_set(&vdev->refcnt, 1);
   169	
   170	    vdev->kbuf = NULL;
   171	    vdev->kbuf_size = 0;
   172	
   173	    return vdev;
   174	}
   175	
 > 176	void vhba_device_put (struct vhba_device *vdev)
   177	{
   178	    if (atomic_dec_and_test(&vdev->refcnt)) {
   179	        kfree(vdev);
   180	    }
   181	}
   182	
 > 183	struct vhba_device *vhba_device_get (struct vhba_device *vdev)
   184	{
   185	    atomic_inc(&vdev->refcnt);
   186	
   187	    return vdev;
   188	}
   189	
 > 190	int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
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
 > 219	int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
   220	{
   221	    struct vhba_command *vcmd;
   222	    int retval;
   223	    unsigned long flags;
   224	
   225	    spin_lock_irqsave(&vdev->cmd_lock, flags);
   226	    list_for_each_entry(vcmd, &vdev->cmd_list, entry) {
   227	        if (vcmd->cmd == cmd) {
   228	            list_del_init(&vcmd->entry);
   229	            break;
   230	        }
   231	    }
   232	
   233	    /* command not found */
   234	    if (&vcmd->entry == &vdev->cmd_list) {
   235	        spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   236	        return SUCCESS;
   237	    }
   238	
   239	    while (vcmd->status == VHBA_REQ_READING || vcmd->status == VHBA_REQ_WRITING) {
   240	        spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   241	        scmd_dbg(cmd, "wait for I/O before aborting\n");
   242	        schedule_timeout(1);
   243	        spin_lock_irqsave(&vdev->cmd_lock, flags);
   244	    }
   245	
   246	    retval = (vcmd->status == VHBA_REQ_SENT) ? FAILED : SUCCESS;
   247	
   248	    vhba_free_command(vcmd);
   249	
   250	    spin_unlock_irqrestore(&vdev->cmd_lock, flags);
   251	
   252	    return retval;
   253	}
   254	
   255	#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 19, 0)
   256	int vhba_slave_alloc(struct scsi_device *sdev)
   257	{
   258	    struct Scsi_Host *shost = sdev->host;
   259	
   260	    sdev_dbg(sdev, "enabling tagging (queue depth: %i).\n", sdev->queue_depth);
   261	#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0)
   262	    if (!shost_use_blk_mq(shost) && shost->bqt) {
   263	#else
   264	    if (shost->bqt) {
   265	#endif
   266	        blk_queue_init_tags(sdev->request_queue, sdev->queue_depth, shost->bqt);
   267	    }
   268	    scsi_adjust_queue_depth(sdev, 0, sdev->queue_depth);
   269	
   270	    return 0;
   271	}
   272	#endif
   273	
 > 274	void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)
   275	{
   276	    struct scsi_device *sdev;
   277	
   278	    sdev = scsi_device_lookup(vhost->shost, bus, id, 0);
   279	    if (!sdev) {
   280	        scsi_add_device(vhost->shost, bus, id, 0);
   281	    } else {
   282	        dev_warn(&vhost->shost->shost_gendev, "tried to add an already-existing device %d:%d:0!\n", bus, id);
   283	        scsi_device_put(sdev);
   284	    }
   285	}
   286	
 > 287	void vhba_scan_devices_remove (struct vhba_host *vhost, int bus, int id)
   288	{
   289	    struct scsi_device *sdev;
   290	
   291	    sdev = scsi_device_lookup(vhost->shost, bus, id, 0);
   292	    if (sdev) {
   293	        scsi_remove_device(sdev);
   294	        scsi_device_put(sdev);
   295	    } else {
   296	        dev_warn(&vhost->shost->shost_gendev, "tried to remove non-existing device %d:%d:0!\n", bus, id);
   297	    }
   298	}
   299	
 > 300	void vhba_scan_devices (struct work_struct *work)
   301	{
   302	    struct vhba_host *vhost = container_of(work, struct vhba_host, scan_devices);
   303	    unsigned long flags;
   304	    int change, exists;
   305	    unsigned int devnum;
   306	    unsigned int bus, id;
   307	
   308	    for (;;) {
   309	        spin_lock_irqsave(&vhost->dev_lock, flags);
   310	
   311	        devnum = find_first_bit(vhost->chgmap, VHBA_MAX_DEVICES);
   312	        if (devnum >= VHBA_MAX_DEVICES) {
   313	            spin_unlock_irqrestore(&vhost->dev_lock, flags);
   314	            break;
   315	        }
   316	        change = vhost->chgtype[devnum];
   317	        exists = vhost->devices[devnum] != NULL;
   318	
   319	        vhost->chgtype[devnum] = 0;
   320	        clear_bit(devnum, vhost->chgmap);
   321	
   322	        spin_unlock_irqrestore(&vhost->dev_lock, flags);
   323	
   324	        devnum_to_bus_and_id(devnum, &bus, &id);
   325	
   326	        if (change < 0) {
   327	            dev_dbg(&vhost->shost->shost_gendev, "trying to remove target %d:%d:0\n", bus, id);
   328	            vhba_scan_devices_remove(vhost, bus, id);
   329	        } else if (change > 0) {
   330	            dev_dbg(&vhost->shost->shost_gendev, "trying to add target %d:%d:0\n", bus, id);
   331	            vhba_scan_devices_add(vhost, bus, id);
   332	        } else {
   333	            /* quick sequence of add/remove or remove/add; we determine
   334	               which one it was by checking if device structure exists */
   335	            if (exists) {
   336	                /* remove followed by add: remove and (re)add */
   337	                dev_dbg(&vhost->shost->shost_gendev, "trying to (re)add target %d:%d:0\n", bus, id);
   338	                vhba_scan_devices_remove(vhost, bus, id);
   339	                vhba_scan_devices_add(vhost, bus, id);
   340	            } else {
   341	                /* add followed by remove: no-op */
   342	                dev_dbg(&vhost->shost->shost_gendev, "no-op for target %d:%d:0\n", bus, id);
   343	            }
   344	        }
   345	    }
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
