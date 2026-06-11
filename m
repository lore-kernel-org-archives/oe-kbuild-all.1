Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8CC3B9D9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168614; cv=none; b=D7Czn3HTuk7ThoNAeytZDHVpSZDdIsoCjL15tl1hqisDOR0w7lWHSZK9M4QpfqGllak3d4YBq6S+fIAAlSzpLpIzKFehT2HKGjaokAu7uVYmHBgXOB/pbkmeMTUhc0M/6BRIKTEB+Aj0A/ibiQFgjqFrxyMyZyrh5svO7s0TdKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168614; c=relaxed/simple;
	bh=pyFP8rEsuhRSBav3/vbueGdQhuXe4DppYtiuEmfeMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TFLZCFNBkQ0BLXK4IX/CI4FUyTcboT5/wpUaEMg3xW7l9InjnXQnpUyk/L+6Shfg2qbgnieauKKH0TXj+cJO7PVkxrfxgETxDSc0J5SxHk/3rcxfArE5u7z4ZVU03x8d0O73aTkBKnsehAemFt+1M9EMpuINjqJG7Jb7P6TWsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B41f1DUD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B41f1DUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781168611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94ZuSq5C8+JntXJociCbJ2ZeSl1NXVmpyu/CZrm5Jlk=;
	b=B41f1DUD+6BGbyihQu9cIHViPDQGMYssNEN6YXflq68ilKeRIZTxSxRzK1rnYG/078bEwo
	T2kuO8H9B3Po9Gmq/q1ucptuqGcYiT9bkCLj7kzbhcA9Lkarr8btX7JvpM27pZOlDcjTWU
	GWmJ9DiPiXOWTgASbo7W7+ry6vfDPcA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-WhPQmngHMqCHp3pNZtQpHA-1; Thu, 11 Jun 2026 05:03:30 -0400
X-MC-Unique: WhPQmngHMqCHp3pNZtQpHA-1
X-Mimecast-MFC-AGG-ID: WhPQmngHMqCHp3pNZtQpHA_1781168609
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45ef0af9517so5064667f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 02:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168609; x=1781773409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94ZuSq5C8+JntXJociCbJ2ZeSl1NXVmpyu/CZrm5Jlk=;
        b=iKk5ded+Z0NXy0/PlKrAMMDG8wuX601JRQb1IszHEMrBICEneLMvotMrP8ZPKQWwCF
         gqk4XFp/u1M3GxZu2EJSPtQz9Fpf3V+dDIr2itkDoRZOFVHb5WgcHfb1+Wl0PfBv4V3Z
         gHpEDF0rgbiUPjZGLwyKHqRp12cov7LYcsZKhuIc408I0QffrLPXJgrkvrM21lYPJTqH
         e7MBE2fpiY/sBNkidtfQaghYMru3wOKFH3FJvOXKHpwa72L51ULlrrZAJwx6oUHiDiVn
         PY7UtFA+USgfKeot86ANk2Vwc2hISYWiRXRX9jr8IJbL1rV5dSB3CFI95MiSB9bGVyTB
         Wfaw==
X-Forwarded-Encrypted: i=1; AFNElJ9r9sR/Dj/woDaWo77uUIqEEU7rbPRQxoJFfPe0o53Z4BcW0dLVmygj3nCrbYlAvWGg2V70B4aawF0T2b2K@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ4k+DJ8jtep2YnqyqUwvthWft7qlQV80nawdiL38noO/GhQcx
	kcFFfNa+AirA+HrTj9gfJVRhQzJ21FmgW7cB9CwG+/SRJwgE+x/4XHgS3qKZUQB+s+k0vJN3P3w
	FtBCkxz00AlY7XPEaADtr5s3gYc370Qr/4Fos5LYRQ1OHkAVqhje7F158lmHNeHEyAhQ=
X-Gm-Gg: Acq92OHyEV5ENrMIn+tKmoKbZQjXoOogVJRG8l3cR/CvYj/c8JUzjo6oh5B0v884daj
	xycPoSVOmGDLo1gy1kVNGUY4emddufXEPTXUDQd9zJ0jynVzV8DQUEDv2fppvLxWWmVkzYUphjz
	5C+/F8CWbo0acdlv/tTC27A9ycvni6HIAaqjznXORAuaNe+33bSjtqTDvk9z0TPE2VmRAwOIA+h
	aIaENDzoo3HKLfE6pSYptmniOrp6As/9QLq6dcwtSW0H4YFLfmMlUCPzwSSDGb4YQBrkgHj4CcS
	ad9JJ5Uh0Zh+W1R/UFkobwjv4BF2N9MZaDkcMgy+1QB9p2/dN8v8HfsiKnpuF/S2v9WSMD08Yjx
	ZAjYTO1rIBPQ1UlqLaM0OS8HmREme+Zn7LFe+5+vZ+6nAQz3ArPRlag==
X-Received: by 2002:adf:e005:0:10b0:460:3233:66fd with SMTP id ffacd0b85a97d-460677c2fc0mr1828635f8f.40.1781168608642;
        Thu, 11 Jun 2026 02:03:28 -0700 (PDT)
X-Received: by 2002:adf:e005:0:10b0:460:3233:66fd with SMTP id ffacd0b85a97d-460677c2fc0mr1828570f8f.40.1781168608034;
        Thu, 11 Jun 2026 02:03:28 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm75472219f8f.18.2026.06.11.02.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:27 -0700 (PDT)
Date: Thu, 11 Jun 2026 05:03:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <error27@gmail.com>
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
Message-ID: <20260611050140-mutt-send-email-mst@kernel.org>
References: <20260610083452.477759-1-eperezma@redhat.com>
 <202606111115.tKKe1qCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202606111115.tKKe1qCE-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qUCINwqwCn1VdSsxp5TeYHaONcVl2aOR2Ye_q4IsP-E_1781168609
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 11, 2026 at 10:18:51AM +0300, Dan Carpenter wrote:
> Hi Eugenio,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-Add-suspend/20260610-164534
> base:   next-20260609
> patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperezma%40redhat.com
> patch subject: [PATCH v3] vduse: Add suspend
> config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com/
> 
> smatch warnings:
> drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsistent returns '&vq->kick_lock'.
> drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn: inconsistent returns '&dev->rwsem'.
> 
> vim +577 drivers/vdpa/vdpa_user/vduse_dev.c
> 
> c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_kick(struct vduse_virtqueue *vq)
> c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
> c8a6153b6c59d9 Xie Yongji        2021-08-31  564  	spin_lock(&vq->kick_lock);
>                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
> c8a6153b6c59d9 Xie Yongji        2021-08-31  565  	if (!vq->ready)
> c8a6153b6c59d9 Xie Yongji        2021-08-31  566  		goto unlock;
> c8a6153b6c59d9 Xie Yongji        2021-08-31  567  
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  568  	guard(rwsem_read)(&vq->dev->rwsem);
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  569  	if (vq->dev->suspended)
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  570  		return;
> 
> unlock before returning?
> 
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  571  
> c8a6153b6c59d9 Xie Yongji        2021-08-31  572  	if (vq->kickfd)
> 3652117f854819 Christian Brauner 2023-11-22  573  		eventfd_signal(vq->kickfd);
> c8a6153b6c59d9 Xie Yongji        2021-08-31  574  	else
> c8a6153b6c59d9 Xie Yongji        2021-08-31  575  		vq->kicked = true;
> c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
> c8a6153b6c59d9 Xie Yongji        2021-08-31 @577  	spin_unlock(&vq->kick_lock);
> c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }


I think this is fixed by:

commit e4a249d15eb2d4b28213bebb1eefaf2e6d99de0b (HEAD -> vhost, linux-next-vhost/linux-next, kernel.org/vhost, kernel.org/test)
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed Jun 10 12:16:49 2026 -0700

    vduse: Fix error around jumping over a __cleanup() variable
    
right?

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

