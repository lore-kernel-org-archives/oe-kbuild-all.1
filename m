Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377302F532C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 23:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202793; cv=none; b=hJfKhYO4qAlfyS82j7r2uDaTxxXUtdlqF4QqsjpeNLdl7zO5XOiwxF1W4ShukbJfwpmi5q4JVy/tjMzD1l3Ny4gFl7/TY6BPmZ5gJIlt4D/4JvzX8JPFBd4OeHxT8Ynyyo3kwcC+XkPgwft2Iv1h5gcTFjX1bDi75ctvRG5MkE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202793; c=relaxed/simple;
	bh=a3Bkx9998Qy+wrgZpWrw+TgJZmcL4kioGkDitnYrc1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tXYZ8JxTJ2Qf9hQ53qjm3KeGwTLAoSxlFFbjaNtewvYl1PRfWPrQKPIKyh9f/Y6VCHQF/aBUCxCyvCrhZ4kmnY8a/9gipTzvEEvPOWW6XHv1kXE84Ct9bU0TVMwdRYHSRB04E4IfIXMsKOfzxFaIdf4bwgl+UcN3ci0daO9zoY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XhbX4v9I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XhbX4v9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750202790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bEsBD5Y/shPQUCHjJaNwvlMTpenqDbmzETQpk04GETY=;
	b=XhbX4v9InsRTIVqpn2FzAT5wbRXPU6RuhGiiFeNuzUnkdv13RoWsiltsegIWUQvqSlDTy/
	8jO7yI4QHOl4HnUJsUc0ifjsZv6tkVRiUGyErs6gBX3zMk2wSuw99Inj/XhtIwHgj1Loyj
	Tk9rgdmtaMi4hEQ1rZBEMwLM7xuM5qk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-dlndSD6hOQiFfjfg6qhF7A-1; Tue, 17 Jun 2025 19:26:28 -0400
X-MC-Unique: dlndSD6hOQiFfjfg6qhF7A-1
X-Mimecast-MFC-AGG-ID: dlndSD6hOQiFfjfg6qhF7A_1750202788
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0981315c8so594574785a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 16:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202788; x=1750807588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEsBD5Y/shPQUCHjJaNwvlMTpenqDbmzETQpk04GETY=;
        b=AUQby1JSQ6ATXbBHndu0nTR5hnUmQQV7RBaWXvAH6T8HY/ZlqUG2Bj+iYgv8AvuiN2
         ayAC6fbKNNTq0BwDwX6bvfF5zIATH8lCRH97/2h97XeS2rRUfQEmjquZyx3rmxD6P5vR
         OvLkqglHxD/jaz3TfXgd8Ifp8JGw7n8hb9oLxVZNqmZ8xvVcZrQ1BGI0465UnF48TnNu
         lIaCIjNRPlemLWMPvvkTwSHMORhPC95t7nLLXZM3QtR0876IpJJ6ojnyUnULmGSLGvH0
         mmHVtG9DnYGqJOL5v7mm/FRjxueaQJuFvll54YgHFdbO1y4vUlT4HoXshWQBbDp7JwDn
         MGsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJWJNYJd0ZBtBbnnNHt6FUl7IRJgnCCzIqoELY5hTVdjncrlpdmuzgZt+HCQqnxi5ncOtirHbCU6pQBK8h@lists.linux.dev
X-Gm-Message-State: AOJu0YzxY9/xP3fHlNHMGG/Gsg+sZGJBhQo4i/+FuJr/LcTSiwVdha0/
	24zGXn9rL0+aPraMzh/wJ784b26UJ7PtZZAmAjZP7/zIzjRtd9NexdXSAnlvVUk7g5yqdQrp7zn
	n57gOgsQT9HSV8TTSpXZ/KFql+dpbnRotPsH0p+iUmA1R66soVxgxywbXt+eGHEdsD84=
X-Gm-Gg: ASbGncvMHz0wFtYzvXyMeLsEJWxWl062Td/qGbLvrEq29FrMhEEAtOeTF6T4k9YpRJ5
	Qhx22Nm0sY+SlPG5uYMvtcb299UY7KvPcwgYBl3SfEejb0bc7rwgZWcB7BGJc5wP17qPLwKC1Eh
	DfdbKstD24xYVzdz0KvbDM5tIlo6NDGNk6GOW5qdiKj6sK6OnxIivPxpn0i5N6u4qG5CfMg3M75
	qqcy46AYtD+S2QkFslntMwVq8CAkHGatwxAatAkaJQYPVpzE//W6snHs59UD6lU9qtcOJpz+z8E
	xrxLcun+SgFSYQ==
X-Received: by 2002:a05:620a:454e:b0:7d3:c4cb:1b76 with SMTP id af79cd13be357-7d3c6cf0880mr2064454785a.41.1750202788297;
        Tue, 17 Jun 2025 16:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi3MMf4tNBUwb4DWR6Icb7TRcNxnrJ4m6pAGFQDw3d9WUhT0y7JRmDmGn7yEga4dgomvUXJw==
X-Received: by 2002:a05:620a:454e:b0:7d3:c4cb:1b76 with SMTP id af79cd13be357-7d3c6cf0880mr2064451585a.41.1750202787919;
        Tue, 17 Jun 2025 16:26:27 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dce685sm703341185a.10.2025.06.17.16.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:26:27 -0700 (PDT)
Date: Tue, 17 Jun 2025 19:26:24 -0400
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
Message-ID: <aFH5oO1M1_TZz4NF@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
 <aFGcJ-mjhZ1yT7Je@x1.local>
 <aFHEZw1ag6o0BkrS@x1.local>
 <20250617194621.GA1575786@nvidia.com>
 <aFHJh7sKO9CBaLHV@x1.local>
 <20250617230030.GB1575786@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250617230030.GB1575786@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i92_iW8oduPG-6WOMNcHiEUAC7kn2aqlaQ-9rVc55o8_1750202788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 17, 2025 at 08:00:30PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 17, 2025 at 04:01:11PM -0400, Peter Xu wrote:
> 
> > > So what is VFIO doing that requires CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP?
> > 
> > It's the fallback part for vfio device, not vfio_pci device.  vfio_pci
> > device doesn't need this special treatment after moving to the new helper
> > because that hides everything.  vfio_device still needs it.
> > 
> > So, we have two ops that need to be touched to support this:
> > 
> >         vfio_device_fops
> >         vfio_pci_ops 
> > 
> > For the 1st one's vfio_device_fops.get_unmapped_area(), it'll need its own
> > fallback which must be mm_get_unmapped_area() to keep the old behavior, and
> > that was defined only if CONFIG_MMU.
> 
> OK, CONFIG_MMU makes a little bit of sense
> 
> > IOW, if one day file_operations.get_unmapped_area() would allow some other
> > retval to be able to fallback to the default (mm_get_unmapped_area()), then
> > we don't need this special ifdef.  But now it's not ready for that..
> 
> That can't be fixed with a config, the logic in vfio_device_fops has
> to be 
> 
> if (!device->ops->get_unmapped_area()
>    return .. do_default thing..
> 
> return device->ops->get_unmapped()
> 
> Has nothing to do with CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP, there are
> more device->ops that just PCI.

IMHO CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP doesn't imply anything PCI specific
either, it only says an arch supports PFNMAP in larger than PAGE_SIZE.
IIUC it doesn't necessarily need to be PCI.

So here in this case, get_unmapped_area() will only be customized if the
kernel is compiled with any possible huge mapping on pfnmaps.  Otherwise
the customized hook isn't needed.

> 
> If you do the API with an align/order argument then the default
> behavior should happen when passing PAGE_SIZE.

This should indeed also work.

I'll wait for comments in the other threads.  So far I didn't yet add the
"order" parameter or anything like it.  If we would like to have the
parameter, I can use it here to avoid the ifdef with PAGE_SIZE / PAGE_SHIFT
/ .... when repost.

Said that, I don't think I understand at all the use of get_unmapped_area()
for !MMU use case.

Thanks,

-- 
Peter Xu

