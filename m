Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3598820
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwuJUrto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703771423; x=1735307423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xjuAcoNfyZ+W7xmVNtH2mUDhKBG4zHTOjojea5nmJ/Q=;
  b=SwuJUrtoJVWcOlC0qwwz8pxK8uHjhR0jVCCPmscyjdMQ3Ai5LH6Ja7HK
   QJikIYzF0sY6MT6CrCx5sRu15h+NWEd9+tr/rNE8hvuBJpU3yTWXgqIk6
   84eddLRRZ5fUKQtGgQtxNhUylod2yTGEo47CBvpSBCxnyfVXs4nQvmcXy
   tXeVXV/PQWSIuJq49PQ68MaiV7E3lSlt2FpDHJCquDA9ILoeO0yecQST0
   kmKvqaMxortKKit9dn7ZuB8POdMPMtz22sqRGGL6zjBJLrYJLKVV454k7
   BIEfk7wfQi+CiWaHK1sozuoKqBnAwHLu0frdHmW9XpZys/bYwFJ1JWVzb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="9941663"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="9941663"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2023 05:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="901974264"
X-IronPort-AV: E=Sophos;i="6.04,312,1695711600"; 
   d="scan'208";a="901974264"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Dec 2023 05:50:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIqmB-000GW1-1C;
	Thu, 28 Dec 2023 13:50:19 +0000
Date: Thu, 28 Dec 2023 21:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Yanjun <yanjun.zhu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] virtio_net: =?utf-8?Q?F?=
 =?utf-8?B?aXggIuKAmCVk4oCZIGRpcmVjdGl2ZSB3cml0aW4=?= =?utf-8?Q?g?= between 1
 and 11 bytes into a region of size 10" warnings
Message-ID: <202312282156.wb5beuAb-lkp@intel.com>
References: <20231227142637.2479149-1-yanjun.zhu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227142637.2479149-1-yanjun.zhu@intel.com>

Hi Zhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Yanjun/virtio_net-Fix-d-directive-writing-between-1-and-11-bytes-into-a-region-of-size-10-warnings/20231227-223431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20231227142637.2479149-1-yanjun.zhu%40intel.com
patch subject: [PATCH v2 1/1] virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
config: x86_64-randconfig-015-20231228 (https://download.01.org/0day-ci/archive/20231228/202312282156.wb5beuAb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312282156.wb5beuAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312282156.wb5beuAb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/virtio_net.c: In function 'init_vqs':
   drivers/net/virtio_net.c:4140:36: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
      sprintf(vi->rq[i].name, "input.%u", i);
                                       ^
   drivers/net/virtio_net.c:4140:3: note: 'sprintf' output between 8 and 17 bytes into a destination of size 16
      sprintf(vi->rq[i].name, "input.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/virtio_net.c:4141:35: warning: '%u' directive writing between 1 and 10 bytes into a region of size 9 [-Wformat-overflow=]
      sprintf(vi->sq[i].name, "output.%u", i);
                                      ^~
   drivers/net/virtio_net.c:4141:27: note: directive argument in the range [0, 2147483647]
      sprintf(vi->sq[i].name, "output.%u", i);
                              ^~~~~~~~~~~
   drivers/net/virtio_net.c:4141:3: note: 'sprintf' output between 9 and 18 bytes into a destination of size 16
      sprintf(vi->sq[i].name, "output.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +4141 drivers/net/virtio_net.c

  4094	
  4095	static int virtnet_find_vqs(struct virtnet_info *vi)
  4096	{
  4097		vq_callback_t **callbacks;
  4098		struct virtqueue **vqs;
  4099		const char **names;
  4100		int ret = -ENOMEM;
  4101		int total_vqs;
  4102		bool *ctx;
  4103		u16 i;
  4104	
  4105		/* We expect 1 RX virtqueue followed by 1 TX virtqueue, followed by
  4106		 * possible N-1 RX/TX queue pairs used in multiqueue mode, followed by
  4107		 * possible control vq.
  4108		 */
  4109		total_vqs = vi->max_queue_pairs * 2 +
  4110			    virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ);
  4111	
  4112		/* Allocate space for find_vqs parameters */
  4113		vqs = kcalloc(total_vqs, sizeof(*vqs), GFP_KERNEL);
  4114		if (!vqs)
  4115			goto err_vq;
  4116		callbacks = kmalloc_array(total_vqs, sizeof(*callbacks), GFP_KERNEL);
  4117		if (!callbacks)
  4118			goto err_callback;
  4119		names = kmalloc_array(total_vqs, sizeof(*names), GFP_KERNEL);
  4120		if (!names)
  4121			goto err_names;
  4122		if (!vi->big_packets || vi->mergeable_rx_bufs) {
  4123			ctx = kcalloc(total_vqs, sizeof(*ctx), GFP_KERNEL);
  4124			if (!ctx)
  4125				goto err_ctx;
  4126		} else {
  4127			ctx = NULL;
  4128		}
  4129	
  4130		/* Parameters for control virtqueue, if any */
  4131		if (vi->has_cvq) {
  4132			callbacks[total_vqs - 1] = NULL;
  4133			names[total_vqs - 1] = "control";
  4134		}
  4135	
  4136		/* Allocate/initialize parameters for send/receive virtqueues */
  4137		for (i = 0; i < vi->max_queue_pairs; i++) {
  4138			callbacks[rxq2vq(i)] = skb_recv_done;
  4139			callbacks[txq2vq(i)] = skb_xmit_done;
  4140			sprintf(vi->rq[i].name, "input.%u", i);
> 4141			sprintf(vi->sq[i].name, "output.%u", i);
  4142			names[rxq2vq(i)] = vi->rq[i].name;
  4143			names[txq2vq(i)] = vi->sq[i].name;
  4144			if (ctx)
  4145				ctx[rxq2vq(i)] = true;
  4146		}
  4147	
  4148		ret = virtio_find_vqs_ctx(vi->vdev, total_vqs, vqs, callbacks,
  4149					  names, ctx, NULL);
  4150		if (ret)
  4151			goto err_find;
  4152	
  4153		if (vi->has_cvq) {
  4154			vi->cvq = vqs[total_vqs - 1];
  4155			if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VLAN))
  4156				vi->dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
  4157		}
  4158	
  4159		for (i = 0; i < vi->max_queue_pairs; i++) {
  4160			vi->rq[i].vq = vqs[rxq2vq(i)];
  4161			vi->rq[i].min_buf_len = mergeable_min_buf_len(vi, vi->rq[i].vq);
  4162			vi->sq[i].vq = vqs[txq2vq(i)];
  4163		}
  4164	
  4165		/* run here: ret == 0. */
  4166	
  4167	
  4168	err_find:
  4169		kfree(ctx);
  4170	err_ctx:
  4171		kfree(names);
  4172	err_names:
  4173		kfree(callbacks);
  4174	err_callback:
  4175		kfree(vqs);
  4176	err_vq:
  4177		return ret;
  4178	}
  4179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
