Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6399438655D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169596; cv=none; b=h6c2IcjU1x6B/NONz6pbywb3FCEasW+M/e+O9bl7mKQ+g5VPvtkXH73tQfEitXTePU+6Eb913CbaHMDbuJFVtc1fUj0D/21Tw5Sr5gDJG38NVue5r6dqSuwrA8XaezvUcLisSBqmSTKjhaL6gLn9Q+OYlj3lYbmDek8ivnpqxrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169596; c=relaxed/simple;
	bh=ajXZQKlUQjfq8KP8zbjST5yGUA03a95kKBL0PDELn/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awXhkPk1zNZW+CxXGpLQd0eDa2ZJqVgGYxpkhs2mCWFYWjBjTJP7+UX8rHvCzCCJIjjHPWf1ckuNLykH3uKIQqVbyEKYWj3i/B44YZG4lKfqG7WnS567xwmYkxtgmhyE380FWRHCVxX7k1B4R9dXPMQioghb/+3DAdRul0wiC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJmM4nf9; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJmM4nf9"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ce9d444173so93387466d6.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781169594; x=1781774394; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EikgnS3vF4jqNMcBcK4JJO0h4MFVBm6MQacJ2h8Nxpw=;
        b=tJmM4nf9tixDPTJVRYZe/Dy1p3Dn6nGqCWI8ntK+BIbrTsELA1m5Y/h/2UFA9R/aVN
         NOhfe1GtP2zINdWhaDjsSRwFVlfZXIgmf8yqQx/oA2M3IhvKQvVbNf+7EpZb9q1YZKI1
         WpGyW6UWRR0fdjpRdp9eqsfpUMzUEhW17hTyku0oVoEdwsIdh80BN8GvOG7nmHIyAm+o
         lXuDJViinP3ozTzHm6gI7HpqNvvCJiQ/W06Sy2DsczEDNFtess8e//n6YxoP2W+6F8hf
         IhGxzevbSsrWj67fFwKExNM6fAwyGgOfW2GpZfJiv1mluvzVyExrSBsTM8KVjsFq8v9M
         ZGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169594; x=1781774394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EikgnS3vF4jqNMcBcK4JJO0h4MFVBm6MQacJ2h8Nxpw=;
        b=gYhQBrpP8ri5aFp4eWZIHLBNNRGCDCgQZE4+TgQgCRbngOZzP3QX4W6WI0Vrqd6XWe
         DrIPpNE/YOjUnR2hGFrMEaQcSAQPmpRnUVpciiD2VTwscYh1H0QCGPEXgRThyuI5qxkW
         wFw7TIQlVtM4UjSLGHpTNRJRm+WYNCif+EW+tL01aSLA3onCeSbGvAG8hQEL8ujnVIo7
         nWe8sqvCpIANh/Izqqb4hztL+P3Kq6cBp46L8H+1gpmptFHKlpoONqqdrT4dEooXXunc
         MnGie0U8qod1rD04VLvJ6ep/GbNNG3WsCR9PoH+g43wZJbWGeB4vHGZE7vedfY2J4Apm
         DkIA==
X-Forwarded-Encrypted: i=1; AFNElJ9VEikfJEaXdX2XHW7NsIx4/XpIefb8V2dfXF6KZHqrLNal7YO9fi5c/ViPoa4GyWqghI4S0d/MYHhg4oKP@lists.linux.dev
X-Gm-Message-State: AOJu0YyF/Y+8c1ZkqLclJ7xe5YNW8DIYLnDyilLGK1bUV9G9DaNiL6ju
	s2OJP3ahQXvQocKAEVW07kewN6DoV4J32JoMAYI2diilDEnauoHCJ8eZ
X-Gm-Gg: Acq92OHUDuwDREcE3NPH6KgF8gUEwHiJnavS2dm1NJnB5luI3kVLGNqqvs5Q8pOL5dd
	NwNey9gbLRoeqY0OkKfSyZvjGmAuwZ0Om7hxz9iqLLLa1c8jvc/iS1dPDRWQiK8EchyJuYzx3hp
	TJvpl1OkOqMlQLP6a2k9N6UxfZVH2xGG8lsCJPlgddRBxgZn/wwwDrmZVBj5o7B0CBB2f/nlbCZ
	gVy2CLpzfPb3ff+3ajXnuhp8zo/ruYeRFTzp14YWJzPV4oJsj9Ljz3We+DS5jPTYEVucA94u/0t
	M/vAM+h4QRoqGe7lq7pRoKSAjN0Yvu+WDToSBDoM0lCFJMw/7mttqHarT+2WHqzDCe6yxXIcSu0
	km3qyMb9nFWIbQVNtFfliusd6EHOA1f0pY7ZRErWmj32P7VJ48vl6F98PFfmqQAvJXtHsQiZpgV
	9KE0dXFMNXoVc0t9ThQvD1vg5oG6M=
X-Received: by 2002:a05:6214:20a5:b0:8be:3da0:bba7 with SMTP id 6a1803df08f44-8d1d8726fa1mr30343866d6.16.1781169594344;
        Thu, 11 Jun 2026 02:19:54 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1e819f58fsm12933396d6.11.2026.06.11.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:19:53 -0700 (PDT)
Date: Thu, 11 Jun 2026 12:19:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: oe-kbuild@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Cindy Lu <lulu@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
	Yongji Xie <xieyongji@bytedance.com>,
	Maxime Coquelin <mcoqueli@redhat.com>
Subject: Re: [PATCH v3] vduse: Add suspend
Message-ID: <aip9tNOx6WHIq22p@stanley.mountain>
References: <20260610083452.477759-1-eperezma@redhat.com>
 <202606111115.tKKe1qCE-lkp@intel.com>
 <20260611050140-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611050140-mutt-send-email-mst@kernel.org>

On Thu, Jun 11, 2026 at 05:03:24AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 11, 2026 at 10:18:51AM +0300, Dan Carpenter wrote:
> > Hi Eugenio,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-Add-suspend/20260610-164534
> > base:   next-20260609
> > patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperezma%40redhat.com
> > patch subject: [PATCH v3] vduse: Add suspend
> > config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 8.5.0
> > smatch: v0.5.0-9185-gbcc58b9c
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsistent returns '&vq->kick_lock'.
> > drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn: inconsistent returns '&dev->rwsem'.
> > 
> > vim +577 drivers/vdpa/vdpa_user/vduse_dev.c
> > 
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_kick(struct vduse_virtqueue *vq)
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  564  	spin_lock(&vq->kick_lock);
> >                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  565  	if (!vq->ready)
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  566  		goto unlock;
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  567  
> > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  568  	guard(rwsem_read)(&vq->dev->rwsem);
> > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  569  	if (vq->dev->suspended)
> > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  570  		return;
> > 
> > unlock before returning?
> > 
> > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  571  
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  572  	if (vq->kickfd)
> > 3652117f854819 Christian Brauner 2023-11-22  573  		eventfd_signal(vq->kickfd);
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  574  	else
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  575  		vq->kicked = true;
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
> > c8a6153b6c59d9 Xie Yongji        2021-08-31 @577  	spin_unlock(&vq->kick_lock);
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }
> 
> 
> I think this is fixed by:
> 
> commit e4a249d15eb2d4b28213bebb1eefaf2e6d99de0b (HEAD -> vhost, linux-next-vhost/linux-next, kernel.org/vhost, kernel.org/test)
> Author: Nathan Chancellor <nathan@kernel.org>
> Date:   Wed Jun 10 12:16:49 2026 -0700
> 
>     vduse: Fix error around jumping over a __cleanup() variable
>     
> right?

These things haven't hit linux-next yet.  I found the email.
https://lore.kernel.org/all/20260610-vduse_vq_kick-fix-guard-usage-v1-1-0ce02c08006e@kernel.org/

That only fixes the bug in vduse_vq_kick(), not the bug in
vduse_dev_queue_irq_work().  I don't see a fix for that
yet on lore but I may have missed it.

regards,
dan carpenter


