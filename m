Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FCF3D47A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174296; cv=none; b=L8HbAbv9LdQX1agSCpHP5JPW9iPR2yENIRCgmbXaX+2Vcf0chDg7Xso5IXd6VhEVNtXqekQdJFr4jQKwc4PNdcdqIiZzEnAkIzyuyiRa+uINz82WE5Zd/nWmPVjy2rDaI5PQTwPbRmngkuwTtGCf0Dn91NAYXILiwnN8q7Q1++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174296; c=relaxed/simple;
	bh=XoTYR/TeqMK2ycCgG5+xbyxi/eud39OEFhZfHmqkKeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ktqz2XuTlgBQs8yzcdKWlGcj8LCxigs8PHeKgW+jziVyeIQltpYM2Ah66TO0M1ko5iAkIC9myAcAQXs+f2ejCEe6Eg/m8HuGut8wPS0xpUY2JdmguVsOUNwLf3PyqPZZj8c5OzkI9l0BYFG3wJtS5HVobAnW3CUvve4ZgJgGX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KOr4eiL9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KOr4eiL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781174293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/vtY/v3M5U6llxqJZ4Yn6/DNDaMuf4s018w2I93KIY=;
	b=KOr4eiL9y3zw82rQbC2xif0vWjnLMDnkkJWniygba8JDegEofT2Iw9Cquc02ZY9/5QcvjU
	kFoHsAoRD1OQr4DM/oHJwjRQXirm6zzTWxY3wBdnPfbSYxOG+m0y7XIL1SlZ2mT36xx73k
	CD7gPYk29Awk53vsw1AYVc0A14WNnqY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-zH09_9ikNfOCi2Osew1mvw-1; Thu, 11 Jun 2026 06:38:11 -0400
X-MC-Unique: zH09_9ikNfOCi2Osew1mvw-1
X-Mimecast-MFC-AGG-ID: zH09_9ikNfOCi2Osew1mvw_1781174291
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45ef93c359fso6451452f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 03:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174291; x=1781779091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/vtY/v3M5U6llxqJZ4Yn6/DNDaMuf4s018w2I93KIY=;
        b=HxnYgb9s/mWIrjeTrON6JRT/VlOqllqOyzRCp1kilwxiXE1a9xjWzjdXVdigu8OWfk
         eFGESw2cOkYmKEyHNlVZunlSgrQmpSs0YEtc/YUxUTD/9Muy5Qr0ggBw/P/Mvy5SHmOj
         fS+82Dcip5elt4zIMcDO6bWYoionGSe6DgEfnxVFrijnjhg+4veup6/RKn5pwM20D0n8
         t6oareaV2BBrBGGVGlT/w371TvQ6O157tnNJiiCsFpxCycCUP4Zf2UDcBSeZE0Vtjy1T
         M/3z0N8HKsqgyIVHSGh+OItodNr/A3OrEcnCC4RojKrPu2BosAzIyBan5JHWwtlRH9uZ
         ydwg==
X-Forwarded-Encrypted: i=1; AFNElJ9wGA3gtbmYKlTiHCq0l5VPW0LEGoA5aZx/ES6w/e0t3LvtN6mi5eVosXlyvNpKiDjuJxfvsXn9EmSwIAhL@lists.linux.dev
X-Gm-Message-State: AOJu0Yziel/QTrTegUHO21jpG2CsewYiNKSBimkIHggOVtdARsP6b1kF
	iZY3282C9SKGaRhJRxfnIDrBo5EMC/503uBTaPWydVfJ0vvLkLLSvHceeBCEpQTZ75rMfch8rVz
	i5G1VCG12Avx8f5rUvl9okfb6Lp26wsGSSRbSc9MXxhlFLpXa96gHfK5745oJBwN7ICc=
X-Gm-Gg: Acq92OFxfK9hUrN+CzBOXTJGeVMa+/F0kzq2UyyIAekiwRnk1lvn6iEhIBiZXeU9//E
	rhxSQ3e58U9C4tKFikMaHAxxIJt82F1ivWMj+87ScYIYgjoGREPyOHkvifAD8kJbzDSOCOXFot+
	cjO9IZOpMKJHUIjI0ClNpJkavRW7G+rH+VGge+8gRFxQJ5LCwnCm1jC/KDRq04FWxwaTY7Eye8P
	sJLnUTI2B6KVvamto+c/4osbN49rFepb7eShVqLkTcCOhoUhHj79Pc6K+KImphLtx4CpgmO4Tw8
	7uh390E6oLXnT+SlhFQnTrqIfBH4YLrQeB9jDktoA4M47YbDT9JOxnOLh67tGBQohwpeGspHgMI
	iD3D3ayRmm0t1PJPEY/VqfpjLXngHYW5Vst6ncKBPN0NafZ5wCuOStQ==
X-Received: by 2002:a05:6000:41e3:b0:460:3234:293f with SMTP id ffacd0b85a97d-460677e92a0mr3648441f8f.42.1781174290510;
        Thu, 11 Jun 2026 03:38:10 -0700 (PDT)
X-Received: by 2002:a05:6000:41e3:b0:460:3234:293f with SMTP id ffacd0b85a97d-460677e92a0mr3648382f8f.42.1781174289911;
        Thu, 11 Jun 2026 03:38:09 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f67c6sm76938127f8f.16.2026.06.11.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:38:09 -0700 (PDT)
Date: Thu, 11 Jun 2026 06:38:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Cindy Lu <lulu@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
	Yongji Xie <xieyongji@bytedance.com>,
	Maxime Coquelin <mcoqueli@redhat.com>
Subject: Re: [PATCH v3] vduse: Add suspend
Message-ID: <20260611063730-mutt-send-email-mst@kernel.org>
References: <20260610083452.477759-1-eperezma@redhat.com>
 <202606111115.tKKe1qCE-lkp@intel.com>
 <20260611050140-mutt-send-email-mst@kernel.org>
 <aip9tNOx6WHIq22p@stanley.mountain>
 <CAJaqyWdQ7_1zYcfNVF_vQrrLHf_TRAbqS0X1kMQm7QMZ4UY+kA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdQ7_1zYcfNVF_vQrrLHf_TRAbqS0X1kMQm7QMZ4UY+kA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CDMLbHQApuntTJ-eIXyCwkqNtKxOOIK0nD5tOJirkSY_1781174291
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 11, 2026 at 11:30:23AM +0200, Eugenio Perez Martin wrote:
> On Thu, Jun 11, 2026 at 11:20 AM Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Thu, Jun 11, 2026 at 05:03:24AM -0400, Michael S. Tsirkin wrote:
> > > On Thu, Jun 11, 2026 at 10:18:51AM +0300, Dan Carpenter wrote:
> > > > Hi Eugenio,
> > > >
> > > > kernel test robot noticed the following build warnings:
> > > >
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-Add-suspend/20260610-164534
> > > > base:   next-20260609
> > > > patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperezma%40redhat.com
> > > > patch subject: [PATCH v3] vduse: Add suspend
> > > > config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
> > > > compiler: aarch64-linux-gcc (GCC) 8.5.0
> > > > smatch: v0.5.0-9185-gbcc58b9c
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > > | Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com/
> > > >
> > > > smatch warnings:
> > > > drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsistent returns '&vq->kick_lock'.
> > > > drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn: inconsistent returns '&dev->rwsem'.
> > > >
> > > > vim +577 drivers/vdpa/vdpa_user/vduse_dev.c
> > > >
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_kick(struct vduse_virtqueue *vq)
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  564    spin_lock(&vq->kick_lock);
> > > >                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  565    if (!vq->ready)
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  566            goto unlock;
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  567
> > > > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  568    guard(rwsem_read)(&vq->dev->rwsem);
> > > > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  569    if (vq->dev->suspended)
> > > > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  570            return;
> > > >
> > > > unlock before returning?
> > > >
> > > > 9c4307e82fa1dc Eugenio Pérez     2026-06-10  571
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  572    if (vq->kickfd)
> > > > 3652117f854819 Christian Brauner 2023-11-22  573            eventfd_signal(vq->kickfd);
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  574    else
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  575            vq->kicked = true;
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31 @577    spin_unlock(&vq->kick_lock);
> > > > c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }
> > >
> > >
> > > I think this is fixed by:
> > >
> > > commit e4a249d15eb2d4b28213bebb1eefaf2e6d99de0b (HEAD -> vhost, linux-next-vhost/linux-next, kernel.org/vhost, kernel.org/test)
> > > Author: Nathan Chancellor <nathan@kernel.org>
> > > Date:   Wed Jun 10 12:16:49 2026 -0700
> > >
> > >     vduse: Fix error around jumping over a __cleanup() variable
> > >
> > > right?
> >
> > These things haven't hit linux-next yet.  I found the email.
> > https://lore.kernel.org/all/20260610-vduse_vq_kick-fix-guard-usage-v1-1-0ce02c08006e@kernel.org/
> >
> > That only fixes the bug in vduse_vq_kick(), not the bug in
> > vduse_dev_queue_irq_work().  I don't see a fix for that
> > yet on lore but I may have missed it.
> >
> 
> No, I can test & send a fast patch for that.
> 
> Thanks!

Alright.

-- 
MST

