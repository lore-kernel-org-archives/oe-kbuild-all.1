Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8C2B756
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QiFGDAbQ"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-581b6b93bd1so2918369eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698188956; x=1698793756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0siPgI8LR7VRXz+41IZBvL9RtyJx4xQS8xBV0BH+ukI=;
        b=QiFGDAbQzzjIEaAJ+15OcT34DPW794YvnnPPTngNNvRoEjzuH94jo+jJmz3sbOl6HV
         ayhezf4iAF9UDKYimWcnmKxoncmrYtGz1RhJC5ivB7tB73PY+dNB45pJG5VBGXUt6zkf
         hw+nEOy68aJuVglc6F5PQR3cnZwNDglhlY1m38pcr3IDXC0YaMqM/QWhpiZapI/fKb4T
         FP9UX1JbbgZ8yVJFQO4JkDg/b0zdFaBikyLx+4/FrgOgxk7HFvWUVt4BSuqp0CkwMDeJ
         lPP49pEgS9g8kSt+cHWXDLePqO90rYfEpFaXv27GkvMY2KcLr6EB5D0DB/E1o31NgDyf
         7oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698188956; x=1698793756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0siPgI8LR7VRXz+41IZBvL9RtyJx4xQS8xBV0BH+ukI=;
        b=qREqgki6Z3stVrUoX6ff3n8LhF3sqDkkXGrwgWS9py+KJFANHodbotreZI3WXOILvt
         OfVDYQPfrNJ91iFyeYK7/ZyqEJwNwDYNYRmU5M7nB4rvDZyG4dDOQJsnu+xVRkjYfEmV
         1wd6JKk7GsBJsjQWMvnYrT4LSTBVi50D32U6x2R1MReSFSDvZstuwNKL1xkEvOWNt3ZQ
         XBBeo36ipn9DWnIVNAaBc0PqZBYPcPTId2MysX2z3szIouTX1byhlaFGO6YhOUGilGq3
         Mh8btoV+9s76gB2JIswhZ5YbsaTzrA/EpAd1DoAS8kQTp/62+CBeVarbOcnHZPxlWg7Y
         ubgQ==
X-Gm-Message-State: AOJu0YzpXSN3TnITXKnS8x7k7Ezg2ZqyUGvqYR+vw1gGjZRnz1jQNG15
	oyn3ZaIuK7DrQqcOZfn+qfRIRAlg4Oacbx89Mao=
X-Google-Smtp-Source: AGHT+IHztkvC2r7oEw2SKjAYFX1HuTwSeL3HpB6c8WZff7ql18+EFwphRduVa+Av8g/ijeOIM+FMGA==
X-Received: by 2002:a4a:ee19:0:b0:586:881d:ea25 with SMTP id bd25-20020a4aee19000000b00586881dea25mr1636114oob.6.1698188956370;
        Tue, 24 Oct 2023 16:09:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id p6-20020a056830338600b006c4edf462d7sm2053790ott.43.2023.10.24.16.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 16:09:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qvQWP-004TSm-TT;
	Tue, 24 Oct 2023 20:09:13 -0300
Date: Tue, 24 Oct 2023 20:09:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [jgg-iommufd:for-next 36/39]
 drivers/iommu/iommufd/hw_pagetable.c:101: warning: Function parameter or
 member 'user_data' not described in 'iommufd_hwpt_paging_alloc'
Message-ID: <20231024230913.GN691768@ziepe.ca>
References: <202310250418.NmeDHFgw-lkp@intel.com>
 <ZTgosVlGp/H/k6pd@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTgosVlGp/H/k6pd@Asurada-Nvidia>

On Tue, Oct 24, 2023 at 01:27:29PM -0700, Nicolin Chen wrote:
> I think we forgot to add this:
> 
> ----------------------------------
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index 6e11693617a0..358708973cd7 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -84,6 +84,7 @@ iommufd_hwpt_paging_enforce_cc(struct iommufd_hwpt_paging *hwpt_paging)
>   * @idev: Device to get an iommu_domain for
>   * @flags: Flags from userspace
>   * @immediate_attach: True if idev should be attached to the hwpt
> + * @user_data: Optional user_data pointer
>   *
>   * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
>   * will be linked to the given ioas and upon return the underlying iommu_domain
> ----------------------------------

Okay I fixed it

Thanks,
Jason
