Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4F5687
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692041635; x=1723577635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGmX4v3a9I1FmhZw44y8B+KpoBVkymrp2ockMjA0h2A=;
  b=Rp7JJLB8FNW4P2H3hbDvHBlENGyIpmLogZypNXwDn+DEr9M4vLZueoXW
   qHB/dfc7PE7y9t4nEmsqUEv71NqsqSwu+MRkJSChyOsUBdMBFPLrpnDNQ
   IwdzjRFO9ZMjv0EZOSiEKyF0iBgozned7BDT8z/P6iahOib9UN3fZNiAT
   js950cTpWg8SNutrSiIfpFUsz3L2CSHwM6gIY76MsTJ2DUcNJWribwamP
   GsQ9xYVnXiZeMSsXDhvjs1YmztLMPp8pfiZ/jpvg+heV4IWV26j8xc20U
   sohK6wEAOOSotRjW7qjU/MXHsD6wXNrR1txY+SQB5kLdHr/cAUCB+XxMa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403100700"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="403100700"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980110245"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980110245"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 12:33:52 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVdK4-0000N5-0Y;
	Mon, 14 Aug 2023 19:33:52 +0000
Date: Tue, 15 Aug 2023 03:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhou Furong <furong.zhou@intel.com>
Subject: [intel-lts:4.14/base 7916/28962]
 drivers/char/rpmb/virtio_rpmb.c:123:12: warning: 'rpmb_virtio_cmd_cap'
 defined but not used
Message-ID: <202308150303.8Zo9WgYX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.14/base
head:   65b8aaa4ae7a568d08d64eeee7b09f26f711c78f
commit: 8fc9eba1bfd4fa94e6d3d61066ec6ebbbb5c0c18 [7916/28962] rpmb: VRPMB-FE create virtio rpmb frontend driver
config: i386-randconfig-r081-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150303.8Zo9WgYX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150303.8Zo9WgYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150303.8Zo9WgYX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/rpmb/virtio_rpmb.c:123:12: warning: 'rpmb_virtio_cmd_cap' defined but not used [-Wunused-function]
    static int rpmb_virtio_cmd_cap(struct device *dev, u8 target)
               ^~~~~~~~~~~~~~~~~~~


vim +/rpmb_virtio_cmd_cap +123 drivers/char/rpmb/virtio_rpmb.c

   122	
 > 123	static int rpmb_virtio_cmd_cap(struct device *dev, u8 target)
   124	{
   125		struct virtio_device *vdev = dev_to_virtio(dev);
   126		struct virtio_rpmb_info *vi = vdev->priv;
   127		struct virtio_rpmb_ioc *vio_cmd;
   128		struct rpmb_ioc_cap_cmd *cap_cmd;
   129		struct scatterlist vio_ioc, cap_ioc;
   130		struct scatterlist *sgs[2];
   131		unsigned int num_out = 0, num_in = 0;
   132		unsigned int len;
   133		int ret;
   134	
   135		mutex_lock(&vi->lock);
   136	
   137		vio_cmd = kzalloc(sizeof(*vio_cmd), GFP_KERNEL);
   138		cap_cmd = kzalloc(sizeof(*cap_cmd), GFP_KERNEL);
   139		if (!vio_cmd || !cap_cmd) {
   140			ret = -ENOMEM;
   141			goto out;
   142		}
   143	
   144		vio_cmd->ioc_cmd = RPMB_IOC_CAP_CMD;
   145		vio_cmd->result = 0;
   146		vio_cmd->target = target;
   147		sg_init_one(&vio_ioc, vio_cmd, sizeof(*vio_cmd));
   148		sgs[num_out + num_in++] = &vio_ioc;
   149	
   150		sg_init_one(&cap_ioc, cap_cmd, sizeof(*cap_cmd));
   151		sgs[num_out + num_in++] = &cap_ioc;
   152	
   153		virtqueue_add_sgs(vi->vq, sgs, num_out, num_in, vi, GFP_KERNEL);
   154		virtqueue_kick(vi->vq);
   155	
   156		wait_event(vi->have_data, virtqueue_get_buf(vi->vq, &len));
   157	
   158		ret = 0;
   159	
   160		if (vio_cmd->result != 0) {
   161			dev_err(dev, "Error: command error = %d.\n", vio_cmd->result);
   162			ret = -EIO;
   163		}
   164	
   165	out:
   166		kfree(vio_cmd);
   167		kfree(cap_cmd);
   168	
   169		mutex_unlock(&vi->lock);
   170		return ret;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
