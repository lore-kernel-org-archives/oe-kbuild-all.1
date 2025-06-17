Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD3285042
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750178872; cv=none; b=EgfT/oJ7lLXRNeY5oo4V3FZOV/JPZKXngmcuWxCqtwUi93hyUHI52Ej0WE4OQY1N9ddf3pvIdQXg6MNJGeJKp1xKNzsOtPTleD7o5H6LvLkYLXMj1NQPsDW2jr3rAmpVzIUZP6zJndrW7Onji54qg9ljSmQgxonz6Kld3HvdmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750178872; c=relaxed/simple;
	bh=Ng2+55cycp9Mq67N0F50gt8NmngHjK/xJ38hqLOcTTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OApuHhfoAmhrOZkV0jH2tRXEfK2ZA6pFluC2ZAmcB0odGeeCys4baE9L1Wyhs+7nHc2JlrgN4u6XX4Vef0ujhwwGTgPH9l27H/5hILpDWNKSNplo5aIHNztbr0Tp//BLNbo11Ocrdch6BBWEZUokoC8k1mW9xPoyhkbsrXXTB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LTXPo+xd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LTXPo+xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750178869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9udXpXMKLqnXjPpw+ssHtlTIRsjM/WGu/+kStlwAoqo=;
	b=LTXPo+xd6vQj7E9BKHOe1AR0GrbUYJxN6i5juYcM2QB5/rvrfGfnqDeEYReLwpFmjOM8XA
	ThxHWuDMD0bS5yiAXHNh/EIG5mgGeRh5Weh0F4cQBtGY/LAtdA4XknnJliz8PXtlcKrzmB
	J2qHxO2YpF1IQUykjtdt91sA9z+VBeo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-Kq4Lz9xjMw-0SlQMXi2lFw-1; Tue, 17 Jun 2025 12:47:48 -0400
X-MC-Unique: Kq4Lz9xjMw-0SlQMXi2lFw-1
X-Mimecast-MFC-AGG-ID: Kq4Lz9xjMw-0SlQMXi2lFw_1750178866
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311e98ee3fcso5918499a91.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 09:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750178866; x=1750783666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9udXpXMKLqnXjPpw+ssHtlTIRsjM/WGu/+kStlwAoqo=;
        b=bytKpmBbtognYSWE9VI9Q4yW4VobNwoDbNB9HgIlfmbirXKtp3+U95yQHuoOIxroDx
         LYgRbTOC8QGhdQo5ejtb0JkheOJPLA83vl1sIhb9QwelrLZlFz7sDFPtT8WmwxjsL8//
         ZrpoRJ7p8WBrndNLNxJptHdh5EC5+tpyjQzQwRCEHTPWpVUw+78J8GYf6lFSO9b7/pU2
         XRH7zIycKkzs3e4j0KGpuQlBVuqzejPU2t3WI4XamwhPYzyTEhuLR3b6Iup1oLL51MZX
         jrULtC9vaP11Vvu/BZU8obH+jmD9LKBopXxENVzrsNMByDs7D+BXWE/6GZhYYidlfl1C
         3LcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ31+8FJms/GRn56kB8iJA+1FcNX5SlVU8IixgvhDYHgjSd7K8jJLzq3NsNe3fJx1igo9SMgyHV+kofXVg@lists.linux.dev
X-Gm-Message-State: AOJu0YxivhnKgUfjEW7ryIPF36+16YlhfH21Ka+ux2eXd086+4jQDYiA
	6y3ir1Fhd2+ZtCZgN4uwFUwFuYJCArceDThz6kmmc2dWv/lE8w0YNrQOoZjCGZJOKrWsr17IVoC
	R5IpfGrEm3SGHROKE6EZuqQit9cM/mE0BxBCGGWvE4iV2FTLG6OLh/25mCu7XPR8IZpg=
X-Gm-Gg: ASbGncsQLQGc0lzNPSd3v0TqZbaBqDbBruy4QV+6SoH8d5zT8wpbvkWKCuS4FH46aQf
	2WVM3Wxu5uRARaoo6tpnMURnEjFRt42j3EXJDTxn6Iyf+R6VnP5Pp7PN7OziU87VDqHE3fyV7V1
	wtNYUUDlPqMGOj2kLDL6rHtd+VXIKN2OKnarEh9/Lmko0Xv7m6+50XYzZp1uYPJDiXUVJ5mI7ta
	R4iryAFDW0epxdxGAsh1gVkkVjcAPVyMON9S53PckhM+Tk4LWxiA0G5hEh5+CtA5RzgEp3cUH8S
	wH7eiapTklUU7w==
X-Received: by 2002:a17:90b:2808:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-31427e9f04cmr4387985a91.11.1750178866283;
        Tue, 17 Jun 2025 09:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ5RZvlcb8QDXdYGv2rCtK+dVH8l+O3RgQMnCOn4WGgTIeBHCIqlbbuc04Tn+tkV7OjqZJXw==
X-Received: by 2002:a17:90b:2808:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-31427e9f04cmr4387954a91.11.1750178865920;
        Tue, 17 Jun 2025 09:47:45 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decb947sm82211815ad.225.2025.06.17.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:47:45 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:47:35 -0400
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
Message-ID: <aFGcJ-mjhZ1yT7Je@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250617154157.GY1174925@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tMcrjATNvuXdunlGeiwJIju7A8QXhb54SywTWgyPsko_1750178866
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 17, 2025 at 12:41:57PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 11:39:07AM -0400, Peter Xu wrote:
> >  
> > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> >  static unsigned long vfio_device_get_unmapped_area(struct file *file,
> >                                                    unsigned long addr,
> >                                                    unsigned long len,
> > @@ -1370,6 +1371,7 @@ static unsigned long vfio_device_get_unmapped_area(struct file *file,
> >         return device->ops->get_unmapped_area(device, file, addr, len,
> >                                               pgoff, flags);
> >  }
> > +#endif
> >  
> >  const struct file_operations vfio_device_fops = {
> >         .owner          = THIS_MODULE,
> > @@ -1380,7 +1382,9 @@ const struct file_operations vfio_device_fops = {
> >         .unlocked_ioctl = vfio_device_fops_unl_ioctl,
> >         .compat_ioctl   = compat_ptr_ioctl,
> >         .mmap           = vfio_device_fops_mmap,
> > +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> >         .get_unmapped_area = vfio_device_get_unmapped_area,
> > +#endif
> >  };
> 
> IMHO this also seems like something the core code should be dealing
> with and not putting weird ifdefs in drivers.

It may depend on whether we want to still do the fallbacks to
mm_get_unmapped_area().  I get your point in the other email but not yet
get a chance to reply.  I'll try that out to see how it looks and reply
there.

-- 
Peter Xu

