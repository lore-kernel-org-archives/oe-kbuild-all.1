Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798292EF9DD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190483; cv=none; b=QNR6L4u0HEcEhHD7Sj6WG/NeSE3+xrZVxnViFPDO6yxAC4a+PD6rThN1qUYw5x55VfSIaMJ7b+jQGXU21lshjvbAMTJjPY+b1aJ4dO313XUssJHhPc21BmVHJUT6wlcNQlfyK3xH61PoUtJPTjN8x3EmVK2KphFZgheb7F+f4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190483; c=relaxed/simple;
	bh=9qlryhIHS0Cc2X2BC+ex+dW7dnay/Akl42iZ5dW4L3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oVwRnQy2KvDRsdPd3RsdahZrt6TD5xcToJdq5wgl4/4GcNFEQQsYVTHheK8U0+MKqJQveq8xxQhCOFCRgnOtyjOsMPH6VZyDDURI3KQvboOVHwuywKTPFto4mLaCLNvWtslGUn9Mzy/VltSVoxOX+Xe7z/Z7cPpGoZFPw5CBkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M48bd1k2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M48bd1k2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750190480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Dm/YTY2gnD+c/gsISARFM2WYB8H4Eho9ZAM8VM6ubM=;
	b=M48bd1k2d7gqfSNZ0dcClnpM/ZHvdIrRWS3NzQY4m4QgFXPw+aH5o6Kwmus2SSY7pFqF0K
	fsMRyuJBP8tAIRzDGT3uwv0VWI7Igf2fcz/ZYwCkzrl/qwLaR+Zt3J6S6eXAwgNOTRmiEW
	OOuqpuj9jZd6oRl6Bc9N5gwBI6Cy7hU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-jSw907hsP5GJ4MJBU73aJw-1; Tue, 17 Jun 2025 16:01:18 -0400
X-MC-Unique: jSw907hsP5GJ4MJBU73aJw-1
X-Mimecast-MFC-AGG-ID: jSw907hsP5GJ4MJBU73aJw_1750190478
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so6191802a91.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 13:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190477; x=1750795277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Dm/YTY2gnD+c/gsISARFM2WYB8H4Eho9ZAM8VM6ubM=;
        b=hqQfkm+njEpv5F6w4N0pDIyLHJpDibzLuFVTs0DypJfclc1SY0uy6tu1WtkWRW6LAH
         wVjRdKfXXQ1nD/aNJn5+K8A41osi8VvxeIDGJVysP0O2lW5cXfWB7hPtvKT1QKGk+nYq
         JQQEXPwAPnGVEsGhT67VCMgxvj4latnoEusNcPM+mRy1gz2/zWe+r9fwV9lf3pv2f06j
         ubJENbe8vfOsfz3C7b1ZfWMp5/TVLFp0Z8TRaEVH746M/DFkznLSg24uVu5OnNpXQK/n
         4VlehmrPA5rpHIDD+1Mq5zPv7yI/HeF/+re43bdCYkMYiVotXi6vZInZn1hrOV1Tw4AS
         MO0g==
X-Forwarded-Encrypted: i=1; AJvYcCUbk9Og/Sj3YHnmyxev5H5lhYlu4QoQ9T3z6HB4CNZ3/kVrSD5mXgvo5vn6JfMSacixZErenKpigPauWeMs@lists.linux.dev
X-Gm-Message-State: AOJu0YyE2czvtp+MJmpocZ10LmY0p0shtZN99eGGI3wR/wV3IEuwaDZa
	bdblBIPIQttb+KXA8VXlh/0nENgRoYSJ3Aw9oX4GX7OpoXd0xPrA8mSsQZ8C4pXQA8TcRv3ofH4
	aVVPlpRSJ9tU0K1mOpZ4/NPsXVvDkn/IT5+kOykc8osA06531ml4Jt6teRE8/BvjGEyQ=
X-Gm-Gg: ASbGnctESsIitl60wTdrZBRPB/L3wj04TySCRjWE3tl0ezaofQnbfis64McHm2i+OE9
	9jjniLvCKEpI6SC3CUxW7cr75s4ikO0yXUSBWV0pOzaR7fRzJIcSpRIdQk4lMC4kMFbNCuhQ3tR
	ZbwjtRdzUfcazUqcAxYA8JmVGFy41qxaQrvt3//upVc2Nb1o6XI/LfA3wwyOzkrum0iDz2F2Teg
	gEc0w7cy1b9rUfr5+CB+OrxNdWxAI2UVzXTw83PwIMjdJeLlF0J2Bc8dhDU9Hn2Q3N82GHlnEX9
	UBSaEVGEv8iDig==
X-Received: by 2002:a17:90b:39cb:b0:312:ec:412f with SMTP id 98e67ed59e1d1-313f1cc6475mr24162729a91.14.1750190477475;
        Tue, 17 Jun 2025 13:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9mPY0K5+r6ESf4SrogrsmJ9SaqRUqc0sTfpN2AxqMlGxDMB0nD5J8Sn7aF0/Lb+05TfOe/g==
X-Received: by 2002:a17:90b:39cb:b0:312:ec:412f with SMTP id 98e67ed59e1d1-313f1cc6475mr24162674a91.14.1750190477030;
        Tue, 17 Jun 2025 13:01:17 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3142874a4f3sm2156795a91.22.2025.06.17.13.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:01:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:01:11 -0400
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
Message-ID: <aFHJh7sKO9CBaLHV@x1.local>
References: <20250613134111.469884-5-peterx@redhat.com>
 <202506142215.koMEU2rT-lkp@intel.com>
 <aFGMG3763eSv9l8b@x1.local>
 <20250617154157.GY1174925@nvidia.com>
 <aFGcJ-mjhZ1yT7Je@x1.local>
 <aFHEZw1ag6o0BkrS@x1.local>
 <20250617194621.GA1575786@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250617194621.GA1575786@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zy1Nat0Nqn4vPlbJyJhu78cnSwAsppTtXFQompXzXnc_1750190478
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 17, 2025 at 04:46:21PM -0300, Jason Gunthorpe wrote:
> > I just noticed this is unfortunate and special; I yet don't see a way to
> > avoid the fallback here.
> > 
> > Note that this is the vfio_device's fallback, even if the new helper
> > (whatever we name it..) could do fallback internally, vfio_device still
> > would need to be accessible to mm_get_unmapped_area() to make this config
> > build pass.
> 
> I don't understand this remark?
> 
> get_unmapped_area is not conditional on CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP?
> 
> Some new mm_get_unmapped_area_aligned() should not be conditional on
> CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP? (This is Lorenzo's and Liam's remark)

Yes, this will be addressed.

> 
> So what is VFIO doing that requires CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP?

It's the fallback part for vfio device, not vfio_pci device.  vfio_pci
device doesn't need this special treatment after moving to the new helper
because that hides everything.  vfio_device still needs it.

So, we have two ops that need to be touched to support this:

        vfio_device_fops
        vfio_pci_ops 

For the 1st one's vfio_device_fops.get_unmapped_area(), it'll need its own
fallback which must be mm_get_unmapped_area() to keep the old behavior, and
that was defined only if CONFIG_MMU.

IOW, if one day file_operations.get_unmapped_area() would allow some other
retval to be able to fallback to the default (mm_get_unmapped_area()), then
we don't need this special ifdef.  But now it's not ready for that..

-- 
Peter Xu

