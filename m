Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C8D1F9439
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337765; cv=none; b=qSNU8ZBr3QaGCfGbuuIhPPItlXUfGnv6DWW8KBvxJA3KYtmXsDJtNFLIO+IkiZDgcYQx/wE6o7hIWVme9gVs0l0FdjcBrDpzL9iWsC39Uq+1DkcxXKBGDGQGmFOxZvg92o4Ew9ChUBgOqY5NUmeFGWt2M+LbXo0ElHjn4CBgSLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337765; c=relaxed/simple;
	bh=IRcFUEnTe1JCKcKtnWX/qLTSGUTw9/fWw8tLCIvzbDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DeV2C1xHuhzBK3qHgBe+o5VPDDOi+t/1ky6uzxaZ5SMBZIc+NgqEWYbV715Qf5qg5Smn/yja+aPq91XfpbxGkO2K8CwOA0zheUJe48A8HWi8TTBAkHYP8mtV84pgG2UCjWxP6mIowM+1Rz9Ewlw6LAQ6aGtFTaBN4KtX1LiH/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bAzd69tB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bAzd69tB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736337762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLqYtIizfpzeEDN0YbG2hxxynEcPRAfxOqYGH5kCnXM=;
	b=bAzd69tBQLTMcryyJdGebVgj7FgnRZoP+l2YYpYiCTSXUGXBaGSQbJtB+xNQYie2Vtnqq+
	FWjFGTukhXsLW9OLo1J28agJd8Mx4kcgNKBAK+ayr6JP3LfUNJ0jhl/ZYkpv5X7q2mjIoU
	71i4VX0DJSpCNdf0+7yQyhnbjK34H4I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-RO9NQ8MpOG6JplqRgRJmBg-1; Wed, 08 Jan 2025 07:02:40 -0500
X-MC-Unique: RO9NQ8MpOG6JplqRgRJmBg-1
X-Mimecast-MFC-AGG-ID: RO9NQ8MpOG6JplqRgRJmBg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436723db6c4so96226215e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 04:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337759; x=1736942559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLqYtIizfpzeEDN0YbG2hxxynEcPRAfxOqYGH5kCnXM=;
        b=PQjzI7Aos8HGPmAG/bMldB7Kpw9S84rzlJTntqD+UfWy2/Uy+l0tSMHPa3hL2xLZrx
         aSqtPAwVuFBV2YRTSSo5b+T1dx+jYXo7jj6oO7k9McADss/WprfNZW0Ix5xbDxsjilhO
         iDNKBd+zR5iArqAj3FL3/6ePp5KQuQpzqONm4GAA0rvMTpxIN8hiiXDtRDSYN/cFTwk7
         zvaKwNCgLbcIIQaHwYl1C+HEjUm4tDz7e9KF4OPQ6ny5EEWfix9dAuuMEzRbAPoI4Csb
         NhyvvSzydRULPyrfx2wZk/U8l8Ba7bTILs85t2KLI30LrJh5C4AHSfkKsRGTqwOSv6xt
         Hohg==
X-Forwarded-Encrypted: i=1; AJvYcCUUz9mPugKSqHRqK63cEUEdxoA04i6WkNDbzKDBkFNRs+G7v2hTlrWk9crA7MhsK+f/GUNcNBqn+AJWzmoV@lists.linux.dev
X-Gm-Message-State: AOJu0YzEh7UgPVwYh1P9Pu3xCVGZrVSWtJn5vUyt7j3nhMtt1x1GHK0r
	eCDP+j9h0MS74c+181EYBUAcuPL+BhtRpbg3ZISX11m5B3gW8ZSDMJh7OLIqbYBX9+KrD5hiwiZ
	iFxqjDwjV1M9ucfq133Rn7g/PQxC66GRQWHIq8CnLkU6zcBzJ6oE9X7PW0FmEC2k=
X-Gm-Gg: ASbGncsumrunqv6zcrugazNjv1aFyCobcuNP5wlx2+6jIe7g4GE0Xa0o9SQTSNpnhHC
	liP61XpoWXcM9x0CRqPVp3BDqN24eTAwHYJYEr6o3op30szr1oIptyuRuuGwz5kpvkpbWF7KeoQ
	eeQlOAvAc10DXkQSXxEm5930/JvRdYU8R1kwJgp9+Mee097wpLVgYchjdJkLJQs8XlZeHoqk4uz
	HO2Tcq4D7q+5c9UAZLvOGhv+O8a0aLWiIeKaBgPT0+Gk4lDbKw=
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr17628605e9.23.1736337759391;
        Wed, 08 Jan 2025 04:02:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGScykllzbh31utZyOyhyPCeqeJOHfUUx2k3Z8hq3BxWlAiscDN3qnY2p23jYlKYf6YnAI+gQ==
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr17628305e9.23.1736337758928;
        Wed, 08 Jan 2025 04:02:38 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddcf38sm18472675e9.20.2025.01.08.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:02:38 -0800 (PST)
Date: Wed, 8 Jan 2025 07:02:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Yuxue Liu yuxue.liu@jaguarmicro.com" <yuxue.liu@jaguarmicro.com>
Cc: jasowang@redhat.com, lkp@intel.com, angus.chen@jaguarmicro.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] vdpa/vp_vdpa: implement kick_vq_with_data callback
Message-ID: <20250108070206-mutt-send-email-mst@kernel.org>
References: <CACGkMEvf9TS6c9PTiwWn3POr33m7m1shNfHOkviZpk-Pkbf79Q@mail.gmail.com>
 <20241203023743.1757-1-yuxue.liu@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241203023743.1757-1-yuxue.liu@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GvdPqzeuWjmEJzJqbEU8NROj6zdvQDJjS_wrcARID2Q_1736337759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 10:37:43AM +0800, Yuxue Liu yuxue.liu@jaguarmicro.com wrote:
> From: Yuxue Liu <yuxue.liu@jaguarmicro.com>
> 
> Implement the kick_vq_with_data vDPA callback.
> On kick, we pass the next available data to the hardware by writing it in
> the kick offset.
> 
> Signed-off-by: Yuxue Liu <yuxue.liu@jaguarmicro.com>

Pls do not send v2 as reply to v1.
I am not sure all tools test the patch if you do.

> ---
> v2: fix build error for kernel test robot
> 
>  drivers/vdpa/virtio_pci/vp_vdpa.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
> index 16380764275e..8787407f75b0 100644
> --- a/drivers/vdpa/virtio_pci/vp_vdpa.c
> +++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
> @@ -367,6 +367,14 @@ static void vp_vdpa_kick_vq(struct vdpa_device *vdpa, u16 qid)
>  	vp_iowrite16(qid, vp_vdpa->vring[qid].notify);
>  }
>  
> +static void vp_vdpa_kick_vq_with_data(struct vdpa_device *vdpa, u32 data)
> +{
> +	struct vp_vdpa *vp_vdpa = vdpa_to_vp(vdpa);
> +	u16 qid = data & 0xFFFF;
> +
> +	vp_iowrite32(data, vp_vdpa->vring[qid].notify);
> +}
> +
>  static u32 vp_vdpa_get_generation(struct vdpa_device *vdpa)
>  {
>  	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
> @@ -472,6 +480,7 @@ static const struct vdpa_config_ops vp_vdpa_ops = {
>  	.get_vq_size	= vp_vdpa_get_vq_size,
>  	.set_vq_address	= vp_vdpa_set_vq_address,
>  	.kick_vq	= vp_vdpa_kick_vq,
> +	.kick_vq_with_data      = vp_vdpa_kick_vq_with_data,
>  	.get_generation	= vp_vdpa_get_generation,
>  	.get_device_id	= vp_vdpa_get_device_id,
>  	.get_vendor_id	= vp_vdpa_get_vendor_id,
> -- 
> 2.34.1

