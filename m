Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF83BCD0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170240; cv=none; b=kgP90+kCj+44KiEHP+MxH96qIkCwQkVozXmEFeYijhxk1cPyf5VMgeoMrkwCOIZh3JAxrwn6Vbdk55D6ZeEm/XCdFnZNggVDE60uLaNFoJxHX2u9Ykuv0yGTiPLf18unIBBkLdIenXOE45rDm4GRNICHnpR2nMgyXphlXCEfow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170240; c=relaxed/simple;
	bh=C1S3L/LEpKSx7OkdBw3weRasepoj5Ehsa+LpRcAEm8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uML1m8SRv/ogabM0rm36AwgecwdMFc7TZnNC+nA/xJVscuqwOSZinMO0v8oI6+FOAtc/UVLthuQmqhBm8t3XIt/xQLoivC/MN6WC+ZavoBURJCey+QIKencU8wWEgkBX5xlkQs/sRaHRJ4435z+ybTsKtfMhcGuszMOuc6UoDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WW9BuLmw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WW9BuLmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781170238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aMr7MQeoSiuBHAcF+jVEe51nOK2JsiXVmtxZEm7uzc=;
	b=WW9BuLmwe7XPlK7wGAsvn+XoGIKyghDJ5Wdnf3umGM91nL4f0MgTL+UxpO4xGLiOd/cxAV
	wpHgPjsdmlRR8gG8ckbBph1pFrdQNpCihEuM4UMUJ3LNLNOo95MBxEzS2ECScO0x4V/Kup
	3AvNDMIACO7+xERzLQT94987xJJkWHU=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-0GR8ILF1Nw2bX0mCrjAs0Q-1; Thu, 11 Jun 2026 05:30:37 -0400
X-MC-Unique: 0GR8ILF1Nw2bX0mCrjAs0Q-1
X-Mimecast-MFC-AGG-ID: 0GR8ILF1Nw2bX0mCrjAs0Q_1781170236
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6625de666c0so2076950d50.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 02:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170236; x=1781775036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8aMr7MQeoSiuBHAcF+jVEe51nOK2JsiXVmtxZEm7uzc=;
        b=I9MrwCq2GKuo62kNtIKv/g1pJvUTDRtbAuTp15X96Hk09J5vYFn0UUxRgMJYsjXDeJ
         CmYE1+oSIKyP4FO9s9WfBVvd+G8krtaoybreW7mIQeM2bcrOH6bqDg8o0gEe47ng2Ky8
         6QWxWKktPnZV4V+0pwaKBam4xr2zbJtEb7u+jMRqnlUlgHQFbh0t2ppOxnMuhOuuT8dL
         PXntRqcEBLpWSWGlivjtr4rgJnaI9j4TxhDW2fEIVDh0IiHhapAc6/B5fuITKmtnbQTg
         dZmF4AfEsGJRCFb4xXH4tDDCxBGXJDCiS3A3ixQELsmFWY3crPj2mYQ9aCBq0HU6p84i
         9auQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cuU89saLIETK+QO/AEPIHVoX7a+TBSpLpqRtE3uwhvgFmpihF4l2PzYNFhkkmJVc20+vPS7WiwOagwoq4@lists.linux.dev
X-Gm-Message-State: AOJu0YwXd091bhT2R5TfI4XJ7vflkFs23+oUndcCz3imvFis8wC4xCQu
	zCHOssI/qq4f2FuEn5FCSZ/Goj9WQGESEKJoo2i2LBjY9wP4n+sac/uU+FRPcwPde5UKwmcgu6e
	RYICFCoLVbHp2SMsW/UlIjan5BmLao8iex5rDpVJhTFF83PQTR6f52ZG5qwpi7GFSFB/gEKtl3/
	Pz8molKFoSqz64k+lAPe2Dy/dkfKlsQYyjkjHAwPWLTA==
X-Gm-Gg: Acq92OFgVdsfTlhyUupIG9EzN1jPXr/bJQ7nM32/pAz8eyFCwNpMKcYQA91Fsxy+hA5
	2JKggjcMp91P/SZdjVxo0PtulyTnD/Gv00HqmokMJYzQdhPf6I9hDN9UqENtYZI2yLGMvpIb6Gp
	qnGLC7v5yIdJqc410TGapid0XISGFu8Z7BmUPWtGRi8DkzqrrLv5Iqkji5GXzszaRbD8xJ8OAiq
	+FWcw05yPzSMm6G
X-Received: by 2002:a05:690e:169c:b0:651:bd70:1622 with SMTP id 956f58d0204a3-6626960e086mr1532244d50.10.1781170234912;
        Thu, 11 Jun 2026 02:30:34 -0700 (PDT)
X-Received: by 2002:a05:690e:169c:b0:651:bd70:1622 with SMTP id
 956f58d0204a3-6626960e086mr1532162d50.10.1781170232819; Thu, 11 Jun 2026
 02:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610083452.477759-1-eperezma@redhat.com> <202606111115.tKKe1qCE-lkp@intel.com>
 <20260611050140-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260611050140-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 11 Jun 2026 11:29:56 +0200
X-Gm-Features: AVVi8CdmsRFKQZIyZ17UopqWAhMPANwF34pMq76ydWAvEXpRbOQ4uag66Ggnruk
Message-ID: <CAJaqyWfCLBV7wc9usmX20A+NWwBvNiDfyFWhRkNc8Uyr632WnA@mail.gmail.com>
Subject: Re: [PATCH v3] vduse: Add suspend
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, virtualization@lists.linux.dev, 
	Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	linux-kernel@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>, 
	Yongji Xie <xieyongji@bytedance.com>, Maxime Coquelin <mcoqueli@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FO-e0NzIMGeaDAg__yOJBVFqH7YOBwjs2Td6znKC00E_1781170236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 11:03=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Thu, Jun 11, 2026 at 10:18:51AM +0300, Dan Carpenter wrote:
> > Hi Eugenio,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vd=
use-Add-suspend/20260610-164534
> > base:   next-20260609
> > patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperez=
ma%40redhat.com
> > patch subject: [PATCH v3] vduse: Add suspend
> > config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci=
/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 8.5.0
> > smatch: v0.5.0-9185-gbcc58b9c
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com=
/
> >
> > smatch warnings:
> > drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsiste=
nt returns '&vq->kick_lock'.
> > drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn=
: inconsistent returns '&dev->rwsem'.
> >
> > vim +577 drivers/vdpa/vdpa_user/vduse_dev.c
> >
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_=
kick(struct vduse_virtqueue *vq)
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  564      spin_lock(&vq->ki=
ck_lock);
> >                                                         ^^^^^^^^^^^^^^^=
^^^^^^^^^^^
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  565      if (!vq->ready)
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  566              goto unlo=
ck;
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  567
> > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  568      guard(rwsem_=
read)(&vq->dev->rwsem);
> > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  569      if (vq->dev-=
>suspended)
> > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  570              retu=
rn;
> >
> > unlock before returning?
> >
> > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  571
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  572      if (vq->kickfd)
> > 3652117f854819 Christian Brauner 2023-11-22  573              eventfd_s=
ignal(vq->kickfd);
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  574      else
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  575              vq->kicke=
d =3D true;
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
> > c8a6153b6c59d9 Xie Yongji        2021-08-31 @577      spin_unlock(&vq->=
kick_lock);
> > c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }
>
>
> I think this is fixed by:
>
> commit e4a249d15eb2d4b28213bebb1eefaf2e6d99de0b (HEAD -> vhost, linux-nex=
t-vhost/linux-next, kernel.org/vhost, kernel.org/test)
> Author: Nathan Chancellor <nathan@kernel.org>
> Date:   Wed Jun 10 12:16:49 2026 -0700
>
>     vduse: Fix error around jumping over a __cleanup() variable
>
> right?
>

Right, that was fast indeed.

