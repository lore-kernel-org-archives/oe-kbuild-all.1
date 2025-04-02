Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B64239587
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596918; cv=none; b=nZTM6i+6gurlB0wYD9RpXqVderTZglMObU9pZKS+TOr7OFR4C7//H7sNHYXvVW6RTcYn5bKGxsX68t+W7kwF29XSYzPrsvNadZOLhRQvFuDHiz0Aal77KvpKk0coml/PmvaOgraThHMv9yZ3ckXQzDZ9qow3iX5gYlyE8sFM9tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596918; c=relaxed/simple;
	bh=+SCZDfxxA2B0yMBUNsxCv14vdfyPf9VIXiifo3cM7E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKP3K5WE1QMwX0Ehmx39is08Fh9gPguZGOybCZyJCpdmOWJorzTMot+SBZ/6YBKvhIXngGTTTQH5LddSncdSLoBmOVaBy45xYxh4lbCq+O7DVgZjEWtFTB7vZNlrUvsMaU3nM3cWdIBvXyx8M3iyls2ELN3fWXetQEkQV15gyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dxqq0Tfh; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dxqq0Tfh"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fd49b85eso98362656d6.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Apr 2025 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743596914; x=1744201714; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=boUrn1HsQb1nnElScm6m0UUoO1nwQ5hUNZv8OXQnxS4=;
        b=dxqq0TfhWbrzd7gpOK8+NwtNatZopy28DIxwHcN3VswzNJGLpBbt/KbsvAtqyeVdwg
         9Nheyd1rfB1iCNgyDEALchBB/9+HBd4JnGObcH+fiT2ACGe2iPgZ/Ac0Q9U7wbOAJefF
         4yPsGLYtqrkhCMrzrQ2tw/69WxrVkLLk52mgnqYFTtg0moFSUYVNBR/wiU+ClkLKIQX7
         jx35JFe6hOg2I3uJFxzIrqmSVQTJCfoFwlO5N62u7KWY3aog9tLvAi866J2mLTsfGAHM
         cxHPpW9gIaSp939okQcH7XsesHGA56R1Ch/po2lYy7FW9nes1mHotqa+NsPHxkPSy/Ae
         nunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596914; x=1744201714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boUrn1HsQb1nnElScm6m0UUoO1nwQ5hUNZv8OXQnxS4=;
        b=w7l/VuW7Xy9KE4mTUGpk2Hovqc1K90tKKNUCCyScJ9cZ5DayvJwoGyOnddy7mfr6gg
         cBHDFLsry34QNJMCcRqfoG/HeG5U4rX5aCkQBaAUWEjhYZpB0yxaPTRXXs1a4kXz/XhD
         7HL24aXes5tZMAFP7H2/wWzbUuUsdF18QoIc77pFXNotxTNFQSOqJFW/gFP2YRmh6Yp5
         byrLCyI1E545iyHMnA1GNasqQXxquA7Z2Ql+xScYECgDVcuzpVw+ksN01Cafouh/bkef
         f3T9dSErGPQdcH7EKWjZZP8llyC26NsLwki6wZYRa+rUDkGAYC2yEZtrCAauJn28R1a9
         Nz+w==
X-Forwarded-Encrypted: i=1; AJvYcCW4gCSqgLIkARtWdkOI50IbP/Qz1KNdQ3ym1i5Wm3yfiDvDHT42Z/ags5H6kpAJTGQ+MoT0fXfrMfnxwCWI@lists.linux.dev
X-Gm-Message-State: AOJu0YzWl2uXez60dO4z195E03nBhZgCbZfBwTstnmlrA+vG3gG5lX3I
	9E/3JX7FuH45TT4zGm0VYbcpYa4dPVjkIImfsGGPJSMhfB+2W9ux+Y2Hi/2kdh0=
X-Gm-Gg: ASbGncttnAdWeEyxEZX+PIxB9D96/+w+n+Nxct+PmcmqyGbI0Kst/XCJI1edSETq+Z4
	KXjKJzqx0WqNXTPcOnK3EZHezqprWloWxbmkvxed8MCB/Ig3lpoJkqSdLb1yOyJJw25gI3QU580
	z3RyrZ29tAfHkpkcGHfe7FYjgoAv/IuG8J4LtYmxsZR2l+nAWYHjIeI+QU7ZW1bGNI43kYQtgxK
	lPgHLM3PDXrJS/+IbhD0Vu3p8y3G5G8gIop2TpJLF9jses+aFg1l9KqL2vgheSW5D8gcCgPwVzH
	a9iIgh6Z0N/NWD6/Vsbx+mig1SAYPlA4ZXijnFU75nq6K1q2eq+YBR/zqIcK11CxuxnfSSZaNbj
	j/Cq+6cFyLtOr0LkZNhoDSKOVlWB5pPnugQ==
X-Google-Smtp-Source: AGHT+IGDCkSbFp8f8ItZCaq6vv36bzHaTEtd7quznYJdA2LK9gJlZ7Yqkvb5oveXIQ6Y2NtbpB/TGw==
X-Received: by 2002:a05:6214:268f:b0:6ea:d40e:2bc5 with SMTP id 6a1803df08f44-6eed5f513acmr258929926d6.9.1743596914105;
        Wed, 02 Apr 2025 05:28:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9643d6asm74291336d6.28.2025.04.02.05.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:28:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzxCr-00000001Wk7-0YpL;
	Wed, 02 Apr 2025 09:28:33 -0300
Date: Wed, 2 Apr 2025 09:28:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>,
	Shannon Nelson <shannon.nelson@amd.com>
Cc: Brett Creeley <brett.creeley@amd.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leonro@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <20250402122833.GB327284@ziepe.ca>
References: <202504020246.Dfbhxoo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504020246.Dfbhxoo9-lkp@intel.com>

On Wed, Apr 02, 2025 at 02:46:38AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   08733088b566b58283f0f12fb73f5db6a9a9de30
> commit: 92c66ee829b99a860a90f62ef16df3e42f92edac pds_fwctl: add rpc and query support
> date:   11 days ago
> config: loongarch-randconfig-r111-20250401 (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/

Shannon, can you send a patch to fix all the sparse errors?

Thanks

> sparse warnings: (new ones prefixed by >>)
> >> drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:202:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] endpoint @@     got restricted __le32 [usertype] id @@
>    drivers/fwctl/pds/main.c:202:50: sparse:     expected unsigned int [usertype] endpoint
>    drivers/fwctl/pds/main.c:202:50: sparse:     got restricted __le32 [usertype] id
>    drivers/fwctl/pds/main.c:250:29: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:288:39: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:294:40: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:300:41: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:329:44: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:405:56: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
>    drivers/fwctl/pds/main.c:405:56: sparse:     expected restricted __le16 [usertype] flags
>    drivers/fwctl/pds/main.c:405:56: sparse:     got int
