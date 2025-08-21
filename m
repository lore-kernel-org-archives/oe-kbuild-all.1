Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3DA393DD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 20:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755809999; cv=none; b=e5JZbgXRv0/D0en3OPRAMl/YneuD8iR8XAcOipjHds+gUu3HEz5JM14Qp00X9IuMKs/GwhM1w183W5EGfO386QUOQ3Hit//dW8Fy3dMvWMThth/M3eqkeVfe/bqpCnA+hwuCGg/+sN0g61YtppHoGjoE0UZPIpdMVzeHJELv4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755809999; c=relaxed/simple;
	bh=iZGYE1Xd6jy1p5PRZ84O4xkm6GrvOQTQufb1eQO5abw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DiiX+rVAKMNrt18iWvwCAprOF6BdQXjgpf50Zimg1xZI8/UY6QR2y0dXM/p8MmZwR6awwjhrlJJe1H6wOTXZo9Lke3vFCgI5bi9nbHPuyJns9DOu2XHmkm3I8R/dC/leZasg4rmR5J9xLuZp3eku4iKJTN05DThBV3MzztfiYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D+K/Ufgl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D+K/Ufgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755809996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4G04SOJ0glNxufycnOsZm8GbV4T3e/3GwhGPhyQ8IQ8=;
	b=D+K/UfglLZQkcrN6RQvmE8mcdQPYiTQMxvT2OlgW6R7BJ4KAW4Y5akmKXmQ0qkYLhR2I3j
	Ufwob0u4ZzSpBtUzSKcZQZK5ts2b0keWmgHSxWz/I0U7CBMVuvA0yj+W34wdoLt6Ha49Mz
	/XWvzlKdmBde/8mEQTzVxZJsY/5RhL4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-H2kOFs0qNF-F4Y2OeBnDmg-1; Thu, 21 Aug 2025 16:59:54 -0400
X-MC-Unique: H2kOFs0qNF-F4Y2OeBnDmg-1
X-Mimecast-MFC-AGG-ID: H2kOFs0qNF-F4Y2OeBnDmg_1755809994
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-88452e4058bso11414539f.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 13:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809994; x=1756414794;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G04SOJ0glNxufycnOsZm8GbV4T3e/3GwhGPhyQ8IQ8=;
        b=ZfL5KtYJG4bLWqvwSoV5iCQDLKLhzobbJbp9huqZRHFkNIm2gAE5KHzoEVcVvmA/fI
         TLPH03uBUhQtjRVp1Boc5juz7mfXKuoEMdl0T3ry7pnpxBCOb5bjhGTC8m8jGEaeeVEX
         JqncFm+HwnXy9m5osg3M77lpS/YM4xq0llTfQcjWZpX5V8AIw9H1JPTq3wfZZABXqFiN
         jVDP73/MfXcqRnJBdFwjZHHtl6QrF11co/Wk9hT/fz4oRKgnxtUEEGgMXTQOp8Q3H8zF
         1JT1LAMpukdtNeYrkhnj37YNjx84XXWGyyBoNfULDa9HRgvsyGtNLsARblnovkJu2vPY
         FsCw==
X-Forwarded-Encrypted: i=1; AJvYcCUnfBfuod4JdnZb2vckBcsBVzrE5GHDe3f64mDVpoTNwAC/4AAvbW7st+1ApQt99mR8BMWEwG9g9W+Hz0vq@lists.linux.dev
X-Gm-Message-State: AOJu0YxKGKNnnKF2ziklwODllXzLQJ8fRMCKwwHIT7c706aKxMlBW/9w
	Dxw+la8vq0YGHzMOzc35Vcc9tApYfGD5cA39jUge5EeHW+LeSJt2Tlc8FD/Wpr2BuuiFkOIQHBT
	Y0Blo47lqp7d//IOuI146VH7i4ZYRMyQruMKLusVdC+rw0HpkRkRgGcuSziLq99FZ8KE=
X-Gm-Gg: ASbGncsuDHj7wtKL/VGDuETH5QGjZwHOfde1G+zgzK2IzbWAQ1ne0Cd7D6Bwdt1SDzj
	4cAz05tsHGIOq40WlzRIBjeS2ygN9oOx79a1PmaBPS7E9RtIDC2Uz4zPAZAPSq6oWAA6WaYkh/e
	dzCukoyyIj+Yols8mOEBIKxc3gqk62kYKk6jyC89BfD2Z5DesMJ0OlKlaITnedESK+HiwER4fDW
	ZNwXA3nSZw1eN8s138NnWlhxLNUKsmfEQtDm0nzyDbqPXr1zsmSjns1mhzYzDD9bk/dHKgPColx
	/RYatSFtJz4mF61i33Eucm0ZF2DyRoHbiKxl7uasBsw=
X-Received: by 2002:a05:6602:2cc9:b0:881:659f:cd6c with SMTP id ca18e2360f4ac-886bd101642mr35933639f.1.1755809993781;
        Thu, 21 Aug 2025 13:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWsV1EzHTqmOI9QMn9r4+1m0MFqBhgNbF+N2ic8JnDHSvJKjdfICIF99AEr9+2AABgW89gRQ==
X-Received: by 2002:a05:6602:2cc9:b0:881:659f:cd6c with SMTP id ca18e2360f4ac-886bd101642mr35932439f.1.1755809993389;
        Thu, 21 Aug 2025 13:59:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-884702457d5sm273437639f.17.2025.08.21.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 13:59:51 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:59:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <nikhil.agarwal@amd.com>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>, <robin.murphy@arm.com>, <krzk@kernel.org>,
 <tglx@linutronix.de>, <maz@kernel.org>, <linux@weissschuh.net>,
 <chenqiuji666@gmail.com>, <peterz@infradead.org>, <robh@kernel.org>,
 <abhijit.gangurde@amd.com>, <nathan@kernel.org>, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250821145949.7fa51308.alex.williamson@redhat.com>
In-Reply-To: <20250821071308.1572106-2-nipun.gupta@amd.com>
References: <20250821071308.1572106-1-nipun.gupta@amd.com>
	<20250821071308.1572106-2-nipun.gupta@amd.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hjFw-9sv6DCxiMfli359T7B2JrflKDEgFzkY22QckoM_1755809994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Aug 2025 12:43:08 +0530
Nipun Gupta <nipun.gupta@amd.com> wrote:

> Define dummy MSI related APIs in VFIO CDX driver to build the
> driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-lkp@intel.com/
> Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> Changes v1->v2:
> - fix linking intr.c file in Makefile
> 
>  drivers/vfio/cdx/Makefile  |  6 +++++-
>  drivers/vfio/cdx/private.h | 14 ++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/cdx/Makefile b/drivers/vfio/cdx/Makefile
> index df92b320122a..dadbef2419ea 100644
> --- a/drivers/vfio/cdx/Makefile
> +++ b/drivers/vfio/cdx/Makefile
> @@ -5,4 +5,8 @@
>  
>  obj-$(CONFIG_VFIO_CDX) += vfio-cdx.o
>  
> -vfio-cdx-objs := main.o intr.o
> +vfio-cdx-objs := main.o
> +
> +ifdef CONFIG_GENERIC_MSI_IRQ
> +vfio-cdx-objs += intr.o
> +endif
> diff --git a/drivers/vfio/cdx/private.h b/drivers/vfio/cdx/private.h
> index dc56729b3114..0482a1516439 100644
> --- a/drivers/vfio/cdx/private.h
> +++ b/drivers/vfio/cdx/private.h
> @@ -38,11 +38,25 @@ struct vfio_cdx_device {
>  	u8			config_msi;
>  };
>  
> +#ifdef CONFIG_GENERIC_MSI_IRQ
>  int vfio_cdx_set_irqs_ioctl(struct vfio_cdx_device *vdev,
>  			    u32 flags, unsigned int index,
>  			    unsigned int start, unsigned int count,
>  			    void *data);
>  
>  void vfio_cdx_irqs_cleanup(struct vfio_cdx_device *vdev);
> +#else
> +static int vfio_cdx_set_irqs_ioctl(struct vfio_cdx_device *vdev,
> +				   u32 flags, unsigned int index,
> +				   unsigned int start, unsigned int count,
> +				   void *data)
> +{
> +	return 0;
> +}
> +
> +static void vfio_cdx_irqs_cleanup(struct vfio_cdx_device *vdev)
> +{
> +}
> +#endif
>  
>  #endif /* VFIO_CDX_PRIVATE_H */

Why are we returning success if we don't implement the function?  This
provides the wrong return value to the user.

Also, aren't we also missing in patch 1/ that cdx_dev->num_msi is
initialized and therefore vfio_cdx_ioctl_get_info() might return that
an interrupt is supported when it is not?  Thanks,

Alex

