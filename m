Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD32F5475
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685235; cv=none; b=o6QrzutAg+nNEZCbXniivrPKFBtoW+7IfJu4MY3LmlwPCT4Ez3SplL6zN1hKWlRu2ra3bbffulWJYE6SZcFJmNvKWoVY1O0+mHZmAZZ2OaHtuatQnVZp6YEjlEQgkNUUTImBXB5yDByW2x85f4zAT8DOMWU0PBIGW4xZdZm6iB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685235; c=relaxed/simple;
	bh=VT2e/D8TNHzCkI96xQbHOMePD40bqojitO9TYfZwJRU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9WvY/QwCWNpWAru2wegxaNs8k21c5V+oECtYvwX7RiI7Bs3WNSCg6K31OxiUy7M+u/5c6Aub6+1YMmJvmC6Nk4x6dMi6fOynKQHYcR4JdbaCJr3fwsxmrmVs3r2DXUIfsL4xFudO4Wq2RdKf4iu23Y15Dkiup8w8HZFdnpxG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGW2SqND; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGW2SqND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752685232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bKE/0cNtoQ/CuczzprbbV3beLrr2MpjH/0TxwAvYDI=;
	b=EGW2SqNDS+bbvfZeAe7m0XkeSE/5InZp+3e8Cm9971xBLykYMr0Id2ZKD6lhZf2L14cb7E
	m/7j21puwycBSAL1z5yPa+WPPIcNV7qCtSSmndOl4e2MIfmaQBvEJL0v9ZDdhcEouARXw7
	N1R7nTs676nXIO0KAIF44/eoIk4Gb3s=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-CN3gsIJqPT68DAcElHVEmA-1; Wed, 16 Jul 2025 13:00:31 -0400
X-MC-Unique: CN3gsIJqPT68DAcElHVEmA-1
X-Mimecast-MFC-AGG-ID: CN3gsIJqPT68DAcElHVEmA_1752685230
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cf803792dso23939f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 10:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685230; x=1753290030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bKE/0cNtoQ/CuczzprbbV3beLrr2MpjH/0TxwAvYDI=;
        b=KG9meYpU2p5xDcafpgAKUQqzEimsBQiW9swc99rbY9ShZab1HLEVIXEs7iLjW9Am4x
         3+hyOrXei7RUIDtWkqGBaFwVwgMXFa0+VGXYIMks5AN7Na2Nm8BqqSDLqWx3U04CXwpo
         sWHO4GARsuwe1d4GxcogCF77CD0mN7uozEYePdkJTjZT5ObCsNiJ+jc7WjIKUFtNiWyI
         PnFiblTuq16FDWqiILM13U1A7ZeQG5LTneYaibUfMlMnqcCFkBkC0TgtblKlkK4ujCF/
         AhtYxYG8VPQInhs9oHrtWb1QPRDEZmOR3o3uDnhFkY3nSsStji6y6A3RzZudFXIuc5r9
         JjoA==
X-Forwarded-Encrypted: i=1; AJvYcCWhYhcnqr0L/4dG18+uziVF8cS7/Vu72ckFZAC7Dj43yjush+eF3Qq8gIV8jdHzEu9X1VMom/e3Yy4hFuP0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn/ZkkZEaOqunaQYfC09R9Ql91XNaW4wjWzREaUy41cUGZyNIb
	QCEQWaqMhTlpn+UaQ2opwwJ6aE7Kic1UHCE5+DdnmgD3zdpwUpnvOGhAbl4I5x/25BHL5mxoQ8U
	dRUHoaUrkCcW6t8ACtlzkIMGFHIfXwLXQT7kga8S1CxwnobBhyFElRWaP+VCYPwfeeB8=
X-Gm-Gg: ASbGncu3Thz8xPuK9ooVSWDDfqXtIXFHd6U40WWOFz/IlGRS+XrU+8AGyD1GEUgTxd1
	TeJJLqJLOGVoKC5mSuHGcH3u2dCNDBYzoqy11Lw3bCqwoHw5fO/9FEkDg4QltR/a1m/UikVzr8T
	yClKwXGyb0bc+KaBrIFWnUPfQZydPsSgq8pnGtCUdIAz9DClv+l4ZiLgMfbs950m1Qy+sAIqw9Y
	toyOHTanlfZNyI4fuW1Z5KFZLpt9DbB0Lk5avZ0aNyxW4rqvqWCJv1KXtVdzKmItR4vH+HHPwcL
	ckE2rmElKqpUZgYTpo5dEqRM8JFlJgKd0yF+v4y5h+o=
X-Received: by 2002:a05:6602:1690:b0:85e:12c1:fe90 with SMTP id ca18e2360f4ac-879c096efeamr126747539f.5.1752685229885;
        Wed, 16 Jul 2025 10:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tZmWUIYwitvuBgGnxfswO12NMpp8mD2icMHkWg5+YtIZRRU8sqVvx4qLf0KrRuHgGBPToA==
X-Received: by 2002:a05:6602:1690:b0:85e:12c1:fe90 with SMTP id ca18e2360f4ac-879c096efeamr126745539f.5.1752685229362;
        Wed, 16 Jul 2025 10:00:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-505569d0e42sm3119302173.101.2025.07.16.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:00:28 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:00:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Ankit Agrawal <ankita@nvidia.com>, Brett Creeley <brett.creeley@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, kvm@vger.kernel.org, Longfang Liu
 <liulongfang@huawei.com>, qat-linux@intel.com, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, virtualization@lists.linux.dev, Xin
 Zeng <xin.zeng@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v3] vfio/pci: Do vf_token checks for
 VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <20250716110027.7e94129f.alex.williamson@redhat.com>
In-Reply-To: <20250715230618.GV2067380@nvidia.com>
References: <0-v3-bdd8716e85fe+3978a-vfio_token_jgg@nvidia.com>
	<76f27eb9-7f56-45e7-813e-e3f595f3b6e9@suswa.mountain>
	<20250715230618.GV2067380@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QbDseL6mwHVZDzn_gGKil4ys4iVCnJj447Ymi3_HSjM_1752685230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Jul 2025 20:06:18 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Jul 16, 2025 at 01:55:45AM +0300, Dan Carpenter wrote:
> > 5fcc26969a164e Yi Liu          2023-07-18  117  	mutex_lock(&device->dev_set->lock);
> > 5fcc26969a164e Yi Liu          2023-07-18  118  	/* one device cannot be bound twice */
> > 5fcc26969a164e Yi Liu          2023-07-18  119  	if (df->access_granted) {
> > 5fcc26969a164e Yi Liu          2023-07-18  120  		ret = -EINVAL;
> > 5fcc26969a164e Yi Liu          2023-07-18  121  		goto out_unlock;
> > 5fcc26969a164e Yi Liu          2023-07-18  122  	}
> > 5fcc26969a164e Yi Liu          2023-07-18  123  
> > be2e70b96c3e54 Jason Gunthorpe 2025-07-14  124  	ret = vfio_df_check_token(device, &bind);
> > be2e70b96c3e54 Jason Gunthorpe 2025-07-14  125  	if (ret)
> > be2e70b96c3e54 Jason Gunthorpe 2025-07-14 @126  		return ret;
> > 
> > This needs to be a goto unlock.  
> 
> Oop yes, thank you
> 
> Alex can you fix it up when applying?

Yes, I'll apply with:

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 53a602563f00..480cac3a0c27 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -123,7 +123,7 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
 
 	ret = vfio_df_check_token(device, &bind);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	df->iommufd = iommufd_ctx_from_fd(bind.iommufd);
 	if (IS_ERR(df->iommufd)) {

