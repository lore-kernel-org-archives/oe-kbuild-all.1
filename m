Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404628CF7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750189170; cv=none; b=CzmWzYN6q5fJ8VFRVoFyaV17MfUkJxiKlwYahg3AuPuSAPQgG+65SVqgd1l4c5SeGi+oFH/Mp8tm7f6owbA2EQaDxyhEl6ajy1nMt3Wt7vf5bD0BrmABiJ6cJwCo2CRFEAr4pZSrET1m/C0dX33pk/njZstulj+aAJIvMB5V5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750189170; c=relaxed/simple;
	bh=F8sGT+/sgtF0uvYnPIHZZx0Lfe8FrbZyk0U6/gz6wZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dv32sfHi467Z3CnHo+DJk6KsdgYPlt8xLKQZ/dj3Tbpn5FN4bzqD6VZJR5/SrzBTk64Id6r3HUm8OI+UbvUcsJpOmAZ1jmws9e/I+xNmTbZbRywF5XIx7thGJxCFdavOKGpDhu3VWsf10Hz8DVNFsRep8KGvJtauy9ObY1XDLRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/M7kWMH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/M7kWMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750189166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJl3ISS5vZpEM73Zu2QnVbFcIkeedrpFNBWR+QK1Ynw=;
	b=F/M7kWMH0fl1vn9+RJhJemn6xfmoUQ5uCE21v7Z0o8GckW5JFB1W1hJxH0K+6o3N7pN92F
	OARk7nORjs0JCOWzfMqTiI0O0oIQeiXoAkbWbPDH4MYtRR4rzjw0LCrebP6zXZfbLkYnwM
	2zil/npKKFpnXKHOEyoyR+dkls8L8O0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-N4BaMfb-MYeX_tIK45AaIw-1; Tue, 17 Jun 2025 15:39:25 -0400
X-MC-Unique: N4BaMfb-MYeX_tIK45AaIw-1
X-Mimecast-MFC-AGG-ID: N4BaMfb-MYeX_tIK45AaIw_1750189165
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74834bc5d37so8957534b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 12:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750189165; x=1750793965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJl3ISS5vZpEM73Zu2QnVbFcIkeedrpFNBWR+QK1Ynw=;
        b=n5jtBT1HJbm93FALZvCS573iOfb7+bG8pgz6saBYDqSoChAQ+ttE4czAHJbmny0GTr
         pjAhePiMgipsvZHFjxTQayvxhV7bnLP4WKWKo7SFYgs5esT8bLGtmWM2xVF89vQsvH2Z
         VduyWu/I0ZDWGsUrHBwImRqqn1QTcUmAGq//NpHpWyo3NgpYu/NYWpaKDe4M6Y8HHxUG
         Rvj/d/aIPzwOzdQb9vsKbzME+bFPWTv1N9fbR7aqhLQ7BqsLCJr4phSNo88j50/lFlSl
         i/7X7N/EuH6G0hwq80OzDgp3iGgn4wd57RK2DEn7g3OTwWCj5iv7aXMcgU240Oj+YHLN
         wYZg==
X-Forwarded-Encrypted: i=1; AJvYcCWHWX7vu9TL0Y4kUM1E4VHaT5dipEcCqxeo+bMdU2jk8kUMrCf82V+303C1ZNh91ALTHaXxjF0Y+IAWGW+O@lists.linux.dev
X-Gm-Message-State: AOJu0YxbZHqZt2Ro623l5J9OLzG/LO25SKSs3TEuSfmbcshipSKLMRyd
	8yzm/lzy151H3t6W0CslbT0M9pl/8Jh5k1yH4AWH1gdfliZv/otixbvSPaK0mS0rvlkQRKT4nZG
	RaP5wwSU1XRp3mEAQ6TH1qIQCTKukpfXPBRiG9oKwuNLZVmA4vdmYpeeGWdJk+Ye7YDQ=
X-Gm-Gg: ASbGncvw5M0lc6m5fvZIxyCIbiHurCXqOI5LzoT8Wh6VY+W36vJ5aKDkwi+xY1WYPrL
	ePupSqrx2cpjE99lEDv+ML6BitAB/hKQ87OgZzTgl7WJ3jn61k1NQgGT9S8j2qfpzJ2jile/KpM
	6lHX85OlHkkXrlNiIQJCrGIjSu94Ji2CEn0/MareRrfvMtoain4r1CC02wiZvOFIFjaVWoCUoV1
	UXYjOGlSruC2W/4BhF5BmkFkvLFunfPzY+GfewLVKymgldBiONRw6f7VOyjvgklZxMNm2ULgaQf
	jnEtJVL7KlKNgQ==
X-Received: by 2002:a05:6a00:3a19:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-7489cffb6bbmr18361934b3a.23.1750189164733;
        Tue, 17 Jun 2025 12:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0d0QqjyrjopZorTKaCRFU/Z21FT70P9cxE4DFi+E6/jbvdkezfloKB99Q5wHRPPT6YtfIBg==
X-Received: by 2002:a05:6a00:3a19:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-7489cffb6bbmr18361911b3a.23.1750189164376;
        Tue, 17 Jun 2025 12:39:24 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm1700538b3a.57.2025.06.17.12.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:39:23 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:39:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kvm@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 4/5] vfio: Introduce vfio_device_ops.get_unmapped_area
 hook
Message-ID: <aFHEZw1ag6o0BkrS@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
 <aFGcJ-mjhZ1yT7Je@x1.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aFGcJ-mjhZ1yT7Je@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q2FV0dPWxxHHRh4qP_MS4WZBiqGP1ec0D1xUYl3H2rA_1750189165
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 17, 2025 at 12:47:35PM -0400, Peter Xu wrote:
> On Tue, Jun 17, 2025 at 12:41:57PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jun 17, 2025 at 11:39:07AM -0400, Peter Xu wrote:
> > >  
> > > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> > >  static unsigned long vfio_device_get_unmapped_area(struct file *file,
> > >                                                    unsigned long addr,
> > >                                                    unsigned long len,
> > > @@ -1370,6 +1371,7 @@ static unsigned long vfio_device_get_unmapped_area(struct file *file,
> > >         return device->ops->get_unmapped_area(device, file, addr, len,
> > >                                               pgoff, flags);
> > >  }
> > > +#endif
> > >  
> > >  const struct file_operations vfio_device_fops = {
> > >         .owner          = THIS_MODULE,
> > > @@ -1380,7 +1382,9 @@ const struct file_operations vfio_device_fops = {
> > >         .unlocked_ioctl = vfio_device_fops_unl_ioctl,
> > >         .compat_ioctl   = compat_ptr_ioctl,
> > >         .mmap           = vfio_device_fops_mmap,
> > > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> > >         .get_unmapped_area = vfio_device_get_unmapped_area,
> > > +#endif
> > >  };
> > 
> > IMHO this also seems like something the core code should be dealing
> > with and not putting weird ifdefs in drivers.
> 
> It may depend on whether we want to still do the fallbacks to
> mm_get_unmapped_area().  I get your point in the other email but not yet
> get a chance to reply.  I'll try that out to see how it looks and reply
> there.

I just noticed this is unfortunate and special; I yet don't see a way to
avoid the fallback here.

Note that this is the vfio_device's fallback, even if the new helper
(whatever we name it..) could do fallback internally, vfio_device still
would need to be accessible to mm_get_unmapped_area() to make this config
build pass.

So I think I'll need my fixup here..

-- 
Peter Xu

