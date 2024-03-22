Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D31CA80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711116629; cv=none; b=l5bmr9ShbF+pudov1VBUmVP/jY2E4HIpka7n8HT/QY7gGpM/fW9XnEMQ0wjV1+LLzAdemjXUbFb1q47t55bi3nSpnnIXw4e/teUX4az7BjA6nPk2X4Menaio/x8kb7+t31zvNCWQoJnNMNZM9cq0opKtK7L9vdoyygfxf3KrGOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711116629; c=relaxed/simple;
	bh=/5qWAk7YnDsA6PVPp1lPMFrXPBFQkClCH27VR/KpKmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+xzcmfUIJzyV4VchVWzMiNx5CkhGTOF1DrINN/eTFGvBBQyqrsgE5SUWY8mcf9FPxzrVJqd3e2AOv7gEEYbnYP1gnoswBEWlDfYk+zb/otWRyV4jvpqzGL+7ex7Wy/pWSDOdMCYJCTNP8vWDFs3/cjvE73+NYHQGn6IfmEvU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFZBSkoS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFZBSkoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711116628; x=1742652628;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/5qWAk7YnDsA6PVPp1lPMFrXPBFQkClCH27VR/KpKmE=;
  b=WFZBSkoSvaJFjSCIy7SivxIqGBaPBNH4e/mDU+aYxmoaNHgFpDw+Upas
   /dRI43lrI9ObiD+W9MuDC72DnHpLBjcxDmUeQiPtj6/RaBh1Hou1HSFqK
   linsgg9W88/aHjApAa0J+QKXaLLN41Ij0f3tMFtwgugs1cv88Nd6dVDAP
   LfcHs73m9WyKDseFnbDYMiB4DQevcdxPjUyzcO4v1eRsjD+cWUK0NjXRP
   vOR8qGEOx5k3Jh3hRGns0CILoO4glFL7/x6M+fLgwEJaTHAZTFBV8Ke5R
   OL7oMszc28JhvbdGZZwQBF+Z08lvHPWHpUTfgm5g0bQ182O/nA8a5SLw5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6374183"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6374183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 07:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="14817417"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Mar 2024 07:10:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnfbD-000KMZ-0f;
	Fri, 22 Mar 2024 14:10:23 +0000
Date: Fri, 22 Mar 2024 22:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH vhost v4 3/6] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <202403222227.Sdp23Lcb-lkp@intel.com>
References: <20240321101532.59272-4-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321101532.59272-4-xuanzhuo@linux.alibaba.com>

Hi Xuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on v6.8]
[cannot apply to s390/features linus/master uml/next uml/fixes next-20240322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_balloon-remove-the-dependence-where-names-is-null/20240321-182217
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240321101532.59272-4-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH vhost v4 3/6] virtio: find_vqs: pass struct instead of multi parameters
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240322/202403222227.Sdp23Lcb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403222227.Sdp23Lcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403222227.Sdp23Lcb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_vdpa.c: In function 'virtio_vdpa_setup_vq':
>> drivers/virtio/virtio_vdpa.c:216:41: error: 'struct virtio_vq_config' has no member named 'cfg_idx'
     216 |         cb.callback = cfg->callbacks[cfg->cfg_idx] ? virtio_vdpa_virtqueue_cb : NULL;
         |                                         ^~


vim +216 drivers/virtio/virtio_vdpa.c

   142	
   143	static struct virtqueue *
   144	virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
   145			     struct virtio_vq_config *cfg)
   146	{
   147		struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
   148		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
   149		struct device *dma_dev;
   150		const struct vdpa_config_ops *ops = vdpa->config;
   151		struct virtio_vdpa_vq_info *info;
   152		bool (*notify)(struct virtqueue *vq) = virtio_vdpa_notify;
   153		struct vdpa_callback cb;
   154		struct virtqueue *vq;
   155		u64 desc_addr, driver_addr, device_addr;
   156		/* Assume split virtqueue, switch to packed if necessary */
   157		struct vdpa_vq_state state = {0};
   158		unsigned long flags;
   159		u32 align, max_num, min_num = 1;
   160		bool may_reduce_num = true;
   161		int err;
   162	
   163		if (index >= vdpa->nvqs)
   164			return ERR_PTR(-ENOENT);
   165	
   166		/* We cannot accept VIRTIO_F_NOTIFICATION_DATA without kick_vq_with_data */
   167		if (__virtio_test_bit(vdev, VIRTIO_F_NOTIFICATION_DATA)) {
   168			if (ops->kick_vq_with_data)
   169				notify = virtio_vdpa_notify_with_data;
   170			else
   171				__virtio_clear_bit(vdev, VIRTIO_F_NOTIFICATION_DATA);
   172		}
   173	
   174		/* Queue shouldn't already be set up. */
   175		if (ops->get_vq_ready(vdpa, index))
   176			return ERR_PTR(-ENOENT);
   177	
   178		/* Allocate and fill out our active queue description */
   179		info = kmalloc(sizeof(*info), GFP_KERNEL);
   180		if (!info)
   181			return ERR_PTR(-ENOMEM);
   182	
   183		max_num = ops->get_vq_num_max(vdpa);
   184		if (max_num == 0) {
   185			err = -ENOENT;
   186			goto error_new_virtqueue;
   187		}
   188	
   189		if (ops->get_vq_num_min)
   190			min_num = ops->get_vq_num_min(vdpa);
   191	
   192		may_reduce_num = (max_num == min_num) ? false : true;
   193	
   194		/* Create the vring */
   195		align = ops->get_vq_align(vdpa);
   196	
   197		if (ops->get_vq_dma_dev)
   198			dma_dev = ops->get_vq_dma_dev(vdpa, index);
   199		else
   200			dma_dev = vdpa_get_dma_dev(vdpa);
   201		vq = vring_create_virtqueue_dma(index, max_num, align, vdev,
   202						true, may_reduce_num,
   203						cfg->ctx ? cfg->ctx[index] : false,
   204						notify,
   205						cfg->callbacks[index],
   206						cfg->names[index],
   207						dma_dev);
   208		if (!vq) {
   209			err = -ENOMEM;
   210			goto error_new_virtqueue;
   211		}
   212	
   213		vq->num_max = max_num;
   214	
   215		/* Setup virtqueue callback */
 > 216		cb.callback = cfg->callbacks[cfg->cfg_idx] ? virtio_vdpa_virtqueue_cb : NULL;
   217		cb.private = info;
   218		cb.trigger = NULL;
   219		ops->set_vq_cb(vdpa, index, &cb);
   220		ops->set_vq_num(vdpa, index, virtqueue_get_vring_size(vq));
   221	
   222		desc_addr = virtqueue_get_desc_addr(vq);
   223		driver_addr = virtqueue_get_avail_addr(vq);
   224		device_addr = virtqueue_get_used_addr(vq);
   225	
   226		if (ops->set_vq_address(vdpa, index,
   227					desc_addr, driver_addr,
   228					device_addr)) {
   229			err = -EINVAL;
   230			goto err_vq;
   231		}
   232	
   233		/* reset virtqueue state index */
   234		if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
   235			struct vdpa_vq_state_packed *s = &state.packed;
   236	
   237			s->last_avail_counter = 1;
   238			s->last_avail_idx = 0;
   239			s->last_used_counter = 1;
   240			s->last_used_idx = 0;
   241		}
   242		err = ops->set_vq_state(vdpa, index, &state);
   243		if (err)
   244			goto err_vq;
   245	
   246		ops->set_vq_ready(vdpa, index, 1);
   247	
   248		vq->priv = info;
   249		info->vq = vq;
   250	
   251		spin_lock_irqsave(&vd_dev->lock, flags);
   252		list_add(&info->node, &vd_dev->virtqueues);
   253		spin_unlock_irqrestore(&vd_dev->lock, flags);
   254	
   255		return vq;
   256	
   257	err_vq:
   258		vring_del_virtqueue(vq);
   259	error_new_virtqueue:
   260		ops->set_vq_ready(vdpa, index, 0);
   261		/* VDPA driver should make sure vq is stopeed here */
   262		WARN_ON(ops->get_vq_ready(vdpa, index));
   263		kfree(info);
   264		return ERR_PTR(err);
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
