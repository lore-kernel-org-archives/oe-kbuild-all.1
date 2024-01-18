Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D2C2E645
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705610195; cv=none; b=mDvz1LR4H0LZW9yZSOluhOfEZabQs4gsMG2TpWPoWZ2xlcZSineBpszlwXOrtO89LpnwNp9WMrrTzaPjs83v7aF1IvVpAAmkyeRQiM6ThQE7vBC7kiQRH3CuvTqTwRZkwx3ac1vXIR8VDDi7kNqfnjkv6aLvTAk/W+tBiiK2xkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705610195; c=relaxed/simple;
	bh=CR+CPgkwVgLCbPAIyGRpihDaYVG336e/bnFESDj19dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lP2a5pbs8iODRQfS5um7M3JXoqtj3PA3rYP+bIa5JH0NJSiArSasKHOkiwcx7r+L9Pl8MkCDuZhov3vusqgYNsG8B5Gm8U/dpfoLqEE6FgXuzioGp9BTFEwOlp0UQxGvcA2HC6ygwfR3RiDookAqH7iZ/qbvbhCGjymPh9HBdnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bz/29lEe; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bz/29lEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705610193; x=1737146193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CR+CPgkwVgLCbPAIyGRpihDaYVG336e/bnFESDj19dY=;
  b=bz/29lEepwruoAgcoJXqsP0OnToHFj8ThSb3ab0hCwirvlr8J8l3iyI1
   kW3LTogii9DXpiL33FAnHSIgWktqYRb5UPBOgPLr3BpmUXanCLFon/wSg
   GH2l/AIkayACWVpVKFoDqxwICgi0j0icxmvxw98PQYxDxQad79HHCY+Dy
   cxyA+JhoW4PUw4zDJIVoB4rtxK5PG4liWz4Zf/XKGf6Bm62PSIJGd2hvM
   5W6EU+kqxv0a+viLXnwCFYEputunOJe1iGM+yv3xDEvEGWuNC80EWvq0X
   3gn4oQ/dgv6uqyOatXfUqXaNyrLifN4bpranc58pHeSiUgrxTMXhj61zW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="391015303"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="391015303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:36:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="386852"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2024 12:36:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQZ7k-0003Jq-0r;
	Thu, 18 Jan 2024 20:36:28 +0000
Date: Fri, 19 Jan 2024 04:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [linux-next:master 13015/13783] drivers/net/virtio_net.c:4340:35:
 error: '%u' directive writing between 1 and 10 bytes into a region of size 9
Message-ID: <202401190425.IGYMqCJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2863b714f3ad0a9686f2de1b779228ad8c7a8052
commit: e3fe8d28c67bf6c291e920c6d04fa22afa14e6e4 [13015/13783] virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20240119/202401190425.IGYMqCJW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190425.IGYMqCJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190425.IGYMqCJW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/virtio_net.c: In function 'init_vqs':
   drivers/net/virtio_net.c:4339:36: error: 'sprintf' may write a terminating nul past the end of the destination [-Werror=format-overflow=]
      sprintf(vi->rq[i].name, "input.%u", i);
                                       ^
   drivers/net/virtio_net.c:4339:3: note: 'sprintf' output between 8 and 17 bytes into a destination of size 16
      sprintf(vi->rq[i].name, "input.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/virtio_net.c:4340:35: error: '%u' directive writing between 1 and 10 bytes into a region of size 9 [-Werror=format-overflow=]
      sprintf(vi->sq[i].name, "output.%u", i);
                                      ^~
   drivers/net/virtio_net.c:4340:27: note: directive argument in the range [0, 2147483647]
      sprintf(vi->sq[i].name, "output.%u", i);
                              ^~~~~~~~~~~
   drivers/net/virtio_net.c:4340:3: note: 'sprintf' output between 9 and 18 bytes into a destination of size 16
      sprintf(vi->sq[i].name, "output.%u", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +4340 drivers/net/virtio_net.c

  4293	
  4294	static int virtnet_find_vqs(struct virtnet_info *vi)
  4295	{
  4296		vq_callback_t **callbacks;
  4297		struct virtqueue **vqs;
  4298		const char **names;
  4299		int ret = -ENOMEM;
  4300		int total_vqs;
  4301		bool *ctx;
  4302		u16 i;
  4303	
  4304		/* We expect 1 RX virtqueue followed by 1 TX virtqueue, followed by
  4305		 * possible N-1 RX/TX queue pairs used in multiqueue mode, followed by
  4306		 * possible control vq.
  4307		 */
  4308		total_vqs = vi->max_queue_pairs * 2 +
  4309			    virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ);
  4310	
  4311		/* Allocate space for find_vqs parameters */
  4312		vqs = kcalloc(total_vqs, sizeof(*vqs), GFP_KERNEL);
  4313		if (!vqs)
  4314			goto err_vq;
  4315		callbacks = kmalloc_array(total_vqs, sizeof(*callbacks), GFP_KERNEL);
  4316		if (!callbacks)
  4317			goto err_callback;
  4318		names = kmalloc_array(total_vqs, sizeof(*names), GFP_KERNEL);
  4319		if (!names)
  4320			goto err_names;
  4321		if (!vi->big_packets || vi->mergeable_rx_bufs) {
  4322			ctx = kcalloc(total_vqs, sizeof(*ctx), GFP_KERNEL);
  4323			if (!ctx)
  4324				goto err_ctx;
  4325		} else {
  4326			ctx = NULL;
  4327		}
  4328	
  4329		/* Parameters for control virtqueue, if any */
  4330		if (vi->has_cvq) {
  4331			callbacks[total_vqs - 1] = NULL;
  4332			names[total_vqs - 1] = "control";
  4333		}
  4334	
  4335		/* Allocate/initialize parameters for send/receive virtqueues */
  4336		for (i = 0; i < vi->max_queue_pairs; i++) {
  4337			callbacks[rxq2vq(i)] = skb_recv_done;
  4338			callbacks[txq2vq(i)] = skb_xmit_done;
  4339			sprintf(vi->rq[i].name, "input.%u", i);
> 4340			sprintf(vi->sq[i].name, "output.%u", i);
  4341			names[rxq2vq(i)] = vi->rq[i].name;
  4342			names[txq2vq(i)] = vi->sq[i].name;
  4343			if (ctx)
  4344				ctx[rxq2vq(i)] = true;
  4345		}
  4346	
  4347		ret = virtio_find_vqs_ctx(vi->vdev, total_vqs, vqs, callbacks,
  4348					  names, ctx, NULL);
  4349		if (ret)
  4350			goto err_find;
  4351	
  4352		if (vi->has_cvq) {
  4353			vi->cvq = vqs[total_vqs - 1];
  4354			if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VLAN))
  4355				vi->dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
  4356		}
  4357	
  4358		for (i = 0; i < vi->max_queue_pairs; i++) {
  4359			vi->rq[i].vq = vqs[rxq2vq(i)];
  4360			vi->rq[i].min_buf_len = mergeable_min_buf_len(vi, vi->rq[i].vq);
  4361			vi->sq[i].vq = vqs[txq2vq(i)];
  4362		}
  4363	
  4364		/* run here: ret == 0. */
  4365	
  4366	
  4367	err_find:
  4368		kfree(ctx);
  4369	err_ctx:
  4370		kfree(names);
  4371	err_names:
  4372		kfree(callbacks);
  4373	err_callback:
  4374		kfree(vqs);
  4375	err_vq:
  4376		return ret;
  4377	}
  4378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
