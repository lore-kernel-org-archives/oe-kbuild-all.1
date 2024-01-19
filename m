Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC496D50F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705650288; cv=none; b=dT19hTOpKs930S1Ur9Gtfg3xTD9RkW3EgOEHkITr8mFxvkp/gXBmZa/+jfrmOgXWj0gd0zE3zRX3XY3yrQfDRrtg7a1V+OBrpaZiyKs+PH9nC8tsvKWKJ5ptPa2tBKBjqiX2RCb9i6hJzSv/iqzeJnyJlt6PcjdafTdxn5Ho0zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705650288; c=relaxed/simple;
	bh=ZEXbqYXwT8yT4lsujguw5hF3X4s7crtA+ohr4KhGRgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JVcqM+BhcE4pxdwIHiYu4rICLF+PysJDgZ6MqgQRL2YudjuO72U8hSHKG5VumMtas6grXLMcK3sScTWe/o/Z7NnzFAeSNSH8D1yCyNFOXxmc6dxnyaEKTXZR0go8ePHrwPE5wcYLzLuzWtRZnFtkyTRSg0ZCeEUFa1o3qxQ+AXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nBww+/xI; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nBww+/xI"
Message-ID: <7f334083-afab-4393-97d5-7d5fdfab2991@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1705650283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfdbWh15m6eGg8EbFU7d9Mus+SMsi4OG6VHA3hHpJRY=;
	b=nBww+/xICupSH571ZfuSPoZCOk49z5yEvhug1esLrDXCgGSEHixCaP7eaAFT7SdROWovc/
	Bf4uh7/hGLC+EwUjon/nz2tzunFdU65M8vRvK2A1FIfGrWwcE23Hzs1kUBb1y/rZ0a5IcQ
	FQPKjrojPDHRgOfbQZ7Gix3cFmuc3Bo=
Date: Fri, 19 Jan 2024 15:44:35 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 13015/13783] drivers/net/virtio_net.c:4340:35:
 error: '%u' directive writing between 1 and 10 bytes into a region of size 9
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Jakub Kicinski <kuba@kernel.org>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <202401190425.IGYMqCJW-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <202401190425.IGYMqCJW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2024/1/19 4:36, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2863b714f3ad0a9686f2de1b779228ad8c7a8052
> commit: e3fe8d28c67bf6c291e920c6d04fa22afa14e6e4 [13015/13783] virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
> config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20240119/202401190425.IGYMqCJW-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

I can reproduce this problem in my local host.

It seems that this problem is related with gcc-7. In the same test 
environment, with gcc-7, this problem will occur. With gcc later than 
version 9, this problem will not occur.

And with u16, the range of %u should be [0, 65535]. Not the following:
"
    drivers/net/virtio_net.c:4141:27: note: directive argument in the 
range [0, 2147483647]
       sprintf(vi->sq[i].name, "output.%u", i); "

And the size of name is 16. That is, the name string can contain 15 
bytes characters.
When the variable i is set to the maximum 65535, the string should be 
"output.65535". The size of the string is 12 + 1 = 13 bytes.
The size of the name is greater than the maximum string "output.65535".

In short, from the above, this problem results from gcc-7. It is a 
problem with gcc-7. Based on my tests with gcc-9, gcc-13, this problem 
is fixed in later gcc versions.
And the warning is a false warning to this commit.

Best Regards
Zhu Yanjun

> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190425.IGYMqCJW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401190425.IGYMqCJW-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     drivers/net/virtio_net.c: In function 'init_vqs':
>     drivers/net/virtio_net.c:4339:36: error: 'sprintf' may write a terminating nul past the end of the destination [-Werror=format-overflow=]
>        sprintf(vi->rq[i].name, "input.%u", i);
>                                         ^
>     drivers/net/virtio_net.c:4339:3: note: 'sprintf' output between 8 and 17 bytes into a destination of size 16
>        sprintf(vi->rq[i].name, "input.%u", i);
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/net/virtio_net.c:4340:35: error: '%u' directive writing between 1 and 10 bytes into a region of size 9 [-Werror=format-overflow=]
>        sprintf(vi->sq[i].name, "output.%u", i);
>                                        ^~
>     drivers/net/virtio_net.c:4340:27: note: directive argument in the range [0, 2147483647]
>        sprintf(vi->sq[i].name, "output.%u", i);
>                                ^~~~~~~~~~~
>     drivers/net/virtio_net.c:4340:3: note: 'sprintf' output between 9 and 18 bytes into a destination of size 16
>        sprintf(vi->sq[i].name, "output.%u", i);
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: all warnings being treated as errors
>
>
> vim +4340 drivers/net/virtio_net.c
>
>    4293	
>    4294	static int virtnet_find_vqs(struct virtnet_info *vi)
>    4295	{
>    4296		vq_callback_t **callbacks;
>    4297		struct virtqueue **vqs;
>    4298		const char **names;
>    4299		int ret = -ENOMEM;
>    4300		int total_vqs;
>    4301		bool *ctx;
>    4302		u16 i;
>    4303	
>    4304		/* We expect 1 RX virtqueue followed by 1 TX virtqueue, followed by
>    4305		 * possible N-1 RX/TX queue pairs used in multiqueue mode, followed by
>    4306		 * possible control vq.
>    4307		 */
>    4308		total_vqs = vi->max_queue_pairs * 2 +
>    4309			    virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ);
>    4310	
>    4311		/* Allocate space for find_vqs parameters */
>    4312		vqs = kcalloc(total_vqs, sizeof(*vqs), GFP_KERNEL);
>    4313		if (!vqs)
>    4314			goto err_vq;
>    4315		callbacks = kmalloc_array(total_vqs, sizeof(*callbacks), GFP_KERNEL);
>    4316		if (!callbacks)
>    4317			goto err_callback;
>    4318		names = kmalloc_array(total_vqs, sizeof(*names), GFP_KERNEL);
>    4319		if (!names)
>    4320			goto err_names;
>    4321		if (!vi->big_packets || vi->mergeable_rx_bufs) {
>    4322			ctx = kcalloc(total_vqs, sizeof(*ctx), GFP_KERNEL);
>    4323			if (!ctx)
>    4324				goto err_ctx;
>    4325		} else {
>    4326			ctx = NULL;
>    4327		}
>    4328	
>    4329		/* Parameters for control virtqueue, if any */
>    4330		if (vi->has_cvq) {
>    4331			callbacks[total_vqs - 1] = NULL;
>    4332			names[total_vqs - 1] = "control";
>    4333		}
>    4334	
>    4335		/* Allocate/initialize parameters for send/receive virtqueues */
>    4336		for (i = 0; i < vi->max_queue_pairs; i++) {
>    4337			callbacks[rxq2vq(i)] = skb_recv_done;
>    4338			callbacks[txq2vq(i)] = skb_xmit_done;
>    4339			sprintf(vi->rq[i].name, "input.%u", i);
>> 4340			sprintf(vi->sq[i].name, "output.%u", i);
>    4341			names[rxq2vq(i)] = vi->rq[i].name;
>    4342			names[txq2vq(i)] = vi->sq[i].name;
>    4343			if (ctx)
>    4344				ctx[rxq2vq(i)] = true;
>    4345		}
>    4346	
>    4347		ret = virtio_find_vqs_ctx(vi->vdev, total_vqs, vqs, callbacks,
>    4348					  names, ctx, NULL);
>    4349		if (ret)
>    4350			goto err_find;
>    4351	
>    4352		if (vi->has_cvq) {
>    4353			vi->cvq = vqs[total_vqs - 1];
>    4354			if (virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VLAN))
>    4355				vi->dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>    4356		}
>    4357	
>    4358		for (i = 0; i < vi->max_queue_pairs; i++) {
>    4359			vi->rq[i].vq = vqs[rxq2vq(i)];
>    4360			vi->rq[i].min_buf_len = mergeable_min_buf_len(vi, vi->rq[i].vq);
>    4361			vi->sq[i].vq = vqs[txq2vq(i)];
>    4362		}
>    4363	
>    4364		/* run here: ret == 0. */
>    4365	
>    4366	
>    4367	err_find:
>    4368		kfree(ctx);
>    4369	err_ctx:
>    4370		kfree(names);
>    4371	err_names:
>    4372		kfree(callbacks);
>    4373	err_callback:
>    4374		kfree(vqs);
>    4375	err_vq:
>    4376		return ret;
>    4377	}
>    4378	
>
