Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E9881F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693560934; x=1725096934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LxTfJwx8G4dioylEk/sIHk6W9gTMd/v1JkrclF0jkQ=;
  b=imSVH/OBd7rqr4UHVbITRgqb2vTKy4I75JsW688qpDSVyp8Zx0BiFl2C
   4eAATblMFU+potWIMmyhc4uNgf6qvr1GwunOhel12MAhLIKgUCybf3ZZ2
   m5jTelHzuzQ+Fk2crmPyo6paxYf+9TckqWzTuItd6aCFyXseLqrJtqqwL
   /fahq+TJXeuk6kTy3CGWViTVIcPJ5VNjauQQ6/9h9NtpcHTVjWozMWpiH
   n5E89TA4tn+FJI0b5NoA3iGQxHsUL5P1bqAee6VtywL/p8BSS1ZkpA6ei
   Jp4u2VCnIxqqKy57CxJuehgisVajapZWVTp83Axpi2HFfdwp9dITrsWgX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440159614"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="440159614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 02:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="810018514"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="810018514"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2023 02:35:33 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc0Yt-000197-0E;
	Fri, 01 Sep 2023 09:35:31 +0000
Date: Fri, 1 Sep 2023 17:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4145/24603] drivers/rpmsg/imx_rpmsg.c:371:6:
 warning: no previous declaration for 'imx_rpmsg_restore'
Message-ID: <202309011734.5uzfXF0X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: dc5690015984c6ba85503e5ead1938de078d38a4 [4145/24603] rpmsg: imx_rpmsg: add partition reset notify
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011734.5uzfXF0X-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011734.5uzfXF0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011734.5uzfXF0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/imx_rpmsg.c: In function 'rp_find_vq':
   drivers/rpmsg/imx_rpmsg.c:163:9: error: implicit declaration of function 'kmalloc'; did you mean 'vmalloc'? [-Werror=implicit-function-declaration]
     rpvq = kmalloc(sizeof(*rpvq), GFP_KERNEL);
            ^~~~~~~
            vmalloc
   drivers/rpmsg/imx_rpmsg.c:163:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     rpvq = kmalloc(sizeof(*rpvq), GFP_KERNEL);
          ^
   drivers/rpmsg/imx_rpmsg.c:168:32: error: implicit declaration of function 'ioremap_nocache'; did you mean 'ioremap_cache'? [-Werror=implicit-function-declaration]
     rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
                                   ^~~~~~~~~~~~~~~
                                   ioremap_cache
   drivers/rpmsg/imx_rpmsg.c:168:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     rpvq->addr = (__force void *) ioremap_nocache(virdev->vring[index],
                  ^
   drivers/rpmsg/imx_rpmsg.c:203:2: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     kfree(rpvq);
     ^~~~~
     vfree
   drivers/rpmsg/imx_rpmsg.c: In function 'set_vring_phy_buf':
   drivers/rpmsg/imx_rpmsg.c:307:22: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'? [-Werror=implicit-function-declaration]
       rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
                         ^~~~~~~
                         vzalloc
   drivers/rpmsg/imx_rpmsg.c:307:20: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
       rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
                       ^
   drivers/rpmsg/imx_rpmsg.c: At top level:
>> drivers/rpmsg/imx_rpmsg.c:371:6: warning: no previous declaration for 'imx_rpmsg_restore' [-Wmissing-declarations]
    void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
         ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/imx_rpmsg_restore +371 drivers/rpmsg/imx_rpmsg.c

   292	
   293	static int set_vring_phy_buf(struct platform_device *pdev,
   294			       struct imx_rpmsg_vproc *rpdev, int vdev_nums)
   295	{
   296		struct resource *res;
   297		resource_size_t size;
   298		unsigned int start, end;
   299		int i, ret = 0;
   300	
   301		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   302		if (res) {
   303			size = resource_size(res);
   304			start = res->start;
   305			end = res->start + size;
   306			for (i = 0; i < vdev_nums; i++) {
 > 307				rpdev->ivdev[i] = kzalloc(sizeof(struct imx_virdev),
   308								GFP_KERNEL);
   309				if (!rpdev->ivdev[i])
   310					return -ENOMEM;
   311	
   312				rpdev->ivdev[i]->vring[0] = start;
   313				rpdev->ivdev[i]->vring[1] = start + 0x8000;
   314				start += 0x10000;
   315				if (start > end) {
   316					dev_err(&pdev->dev,
   317						"Too small memory size %x!\n",
   318						(u32)size);
   319					ret = -EINVAL;
   320					break;
   321				}
   322			}
   323		} else {
   324			return -ENOMEM;
   325		}
   326	
   327		return ret;
   328	}
   329	
   330	static void rpmsg_work_handler(struct work_struct *work)
   331	{
   332		u32 message;
   333		unsigned long flags;
   334		struct imx_virdev *virdev;
   335		struct delayed_work *dwork = to_delayed_work(work);
   336		struct imx_rpmsg_vproc *rpdev = container_of(dwork,
   337				struct imx_rpmsg_vproc, rpmsg_work);
   338		struct circ_buf *cb = &rpdev->rx_buffer;
   339		struct platform_device *pdev = rpdev->pdev;
   340		struct device *dev = &pdev->dev;
   341	
   342		spin_lock_irqsave(&rpdev->mu_lock, flags);
   343		/* handle all incoming mu message */
   344		while (CIRC_CNT(cb->head, cb->tail, PAGE_SIZE)) {
   345			message = cb->buf[cb->tail];
   346			message |= (cb->buf[cb->tail + 1] << 8);
   347			message |= (cb->buf[cb->tail + 2] << 16);
   348			message |= (cb->buf[cb->tail + 3] << 24);
   349			spin_unlock_irqrestore(&rpdev->mu_lock, flags);
   350			virdev = rpdev->ivdev[(message >> 16) / 2];
   351	
   352			dev_dbg(dev, "%s msg: 0x%x\n", __func__, message);
   353			message = message >> 16;
   354			message -= virdev->base_vq_id;
   355	
   356			/*
   357			 * Currently both PENDING_MSG and explicit-virtqueue-index
   358			 * messaging are supported.
   359			 * Whatever approach is taken, at this point message contains
   360			 * the index of the vring which was just triggered.
   361			 */
   362			if (message  < virdev->num_of_vqs)
   363				vring_interrupt(message, virdev->vq[message]);
   364			spin_lock_irqsave(&rpdev->mu_lock, flags);
   365			cb->tail = CIRC_ADD(cb->tail, PAGE_SIZE, 4);
   366		}
   367		spin_unlock_irqrestore(&rpdev->mu_lock, flags);
   368	}
   369	
   370	#ifdef CONFIG_IMX_SCU
 > 371	void imx_rpmsg_restore(struct imx_rpmsg_vproc *rpdev)
   372	{
   373		int i;
   374		int vdev_nums = rpdev->vdev_nums;
   375	
   376		for (i = 0; i < vdev_nums; i++) {
   377			unregister_virtio_device(&rpdev->ivdev[i]->vdev);
   378			kfree(rpdev->ivdev[i]);
   379		}
   380	
   381		/* Make a double check that remote processor is ready or not */
   382		for (i = 0; i < REMOTE_READY_WAIT_MAX_RETRIES; i++) {
   383			if (rpdev->flags & REMOTE_IS_READY)
   384				break;
   385			udelay(100);
   386		}
   387		if (unlikely((rpdev->flags & REMOTE_IS_READY) == 0)) {
   388			pr_err("Wait for remote ready timeout, assume it's dead.\n");
   389			/*
   390			 * In order to make the codes to be robust and back compatible.
   391			 * When wait remote ready timeout, use the MU_SendMessageTimeout
   392			 * to send the first kick-off message when register the vdev.
   393			 */
   394			rpdev->first_notify = rpdev->vdev_nums;
   395		}
   396	
   397		/* Allocate and setup ivdev again to register virtio devices */
   398		if (set_vring_phy_buf(rpdev->pdev, rpdev, rpdev->vdev_nums))
   399			pr_err("No vring buffer.\n");
   400	
   401		for (i = 0; i < vdev_nums; i++) {
   402			rpdev->ivdev[i]->vdev.id.device = VIRTIO_ID_RPMSG;
   403			rpdev->ivdev[i]->vdev.config = &imx_rpmsg_config_ops;
   404			rpdev->ivdev[i]->vdev.dev.parent = &rpdev->pdev->dev;
   405			rpdev->ivdev[i]->vdev.dev.release = imx_rpmsg_vproc_release;
   406			rpdev->ivdev[i]->base_vq_id = i * 2;
   407			rpdev->ivdev[i]->rpdev = rpdev;
   408	
   409			if (register_virtio_device(&rpdev->ivdev[i]->vdev))
   410				pr_err("%s failed to register rpdev.\n", __func__);
   411		}
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
