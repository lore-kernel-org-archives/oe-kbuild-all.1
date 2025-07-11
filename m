Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85722AE66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255244; cv=none; b=leO183hYkglAU8WUO2v4V0X5onEO6u3beQjQtXkOA4ouqVx+kr1E3qFL+tdFVLbGtWrIJqWvCCQ2b3JptPHA60xrHBENC6LTOJSRmhSTV0lVDO+EW+EuiMHsspPlmzTClHkgwSd2uPifRva6BHFQk0M91UCxJzeCdluO9ETWTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255244; c=relaxed/simple;
	bh=YheUpLAaSbWrLSfr9uvkFZMV3QzgZpMF4iUrw6RPSnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eimy0LBnm+yQkF91Tu+e6s2b/LOtegQ6863qbaLiP/VU/9eCQJnxGihCJLKC2gKgaFO8IGXbc3VeXaZ/O7IvMQW+bNWUa0tN7xtnVvEwR52Z0rLHI4pKwyjonPef0WMqi8H91khT71G9XMkvKncwTecIRYckds4CsK+3UcOd9H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=G/25hfbd; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="G/25hfbd"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a58d95ea53so29546601cf.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752255241; x=1752860041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbVI5I1QFoXVsOUzX2X8p0vZv+BlFK80WUUBrHjJ1RY=;
        b=G/25hfbdnLn861jas8KkgG9//VNeCrTHHSATm64FHpFZDn2IyAbEPyFBSr+/GbFJ04
         0MDhBEShbgju33Uboa5NZY/vo0J36sqphiv7iwldYxlPd4p49Ch4NXso+ViC0zpJQ8lz
         oosORO9iqYZyGc93/PMfgO29TV8SKn2a/6JFoObEd8b99LizkHgXmt8Fwf8wK8Wjc9HN
         +uuKlxpJN4v8QSwIKRa4e6p5Uj6bnVG20w1i9Bx7FbI0H30K4Iq41PQX3ISNcaeGLb3l
         QLfk+lL7lOu8aG4JB62CFTttu3tFAUOROvoqW7tAafkBJi2feT+oxazNaA4ZGQ208gVd
         yy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255241; x=1752860041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbVI5I1QFoXVsOUzX2X8p0vZv+BlFK80WUUBrHjJ1RY=;
        b=skG+m6Ynjsiz+WJBq1eFiX8hybqr8OGRNuInyWGvvzs/G36a6HKqqxPH4+1/quHoCY
         cqWQ2p+8MrwbjkVnyQ0Aw7UEnU3U5FJJyZSxaEW3jhz0der3pugXvqyW/dBrU80o7qRL
         TeeLtOavpfgem5C0aPydzsVf6dBtDBl9cAEYIVf8/nT5lbdqXn8NRKx0YrzIiXXQcUeE
         9Xs97TirAUVfwEEnBEQnjOJwEpsQ/yxJnkvuHaOkcQ7cjDRyOShc8WLIx4R/MSDM6SUi
         dqopFUBhdUsIEQz9KzO1rN83bsKcZ7R9bBbUyXvyaZeqirMU/Xcwxm1fsyX+9BGwunAf
         wSGA==
X-Forwarded-Encrypted: i=1; AJvYcCUS6KPPuMMml3Mlc21m7Uo2pF9tf7YnHqo1yE2R7Wv8FTYdAoZalFi/NZo1P+mnXeS28yGa70oEn+3PqwDf@lists.linux.dev
X-Gm-Message-State: AOJu0YwsUqnKAFcTOIdtzBmEbsD+qdRetBVR/m7QCtY2ZjQ0vmrTZunu
	PKjeB3LfOcjGdChuI9ZExkLeP8RPsWhNAaKvazJPWZa+BOaa23v7rlVL4HvHKz5+Rjc=
X-Gm-Gg: ASbGncv7UAuB6rKmHDn1D6iZTsKfu9HeatIcgjqb5C7UizX+JThzxXE1AVhPkUodoEn
	BFNqY8ilw5RM06CuzIrAEFXWwxD0qJRFG1Cq3jtbcyvmiVgI5fkVgb35jk/HhwKXZU8qamk7YZH
	JglwrZrXPArNNxdIBAn4HlrqPoYwRoMZssBot2XyLSkVwHHKIWf74ErXCegODDJ5Cr2y5hjzwCe
	Cscea78YIiBSkT1S2zz2VtndzZnLilKnctVO8TbGJSQWGy04YsE9vhEVnuBJ3qCdIuHDGUVYRER
	pRDJ6v0s/3kpcMY5l4d0V9xJjVvqY5o49N2jpovEeNuAu1vt6bhQzj0/mzu1ESqSfUtbpg6CFWc
	M/MwbcUBCQdRPbUQ/uraRQZh/ASCzcpLOnWaMnL7EhyBf5zK/nnW4+d4Xq5IlaXlKAZCL4rtpZw
	==
X-Google-Smtp-Source: AGHT+IHpAJHHkXD9R6vsbMGnar4E62cga0t4JvWO+H5hIrVMOpKDYL5YBGDXf1X3SFqXbaPr/hbPzw==
X-Received: by 2002:a05:622a:1b93:b0:4a9:9359:4635 with SMTP id d75a77b69052e-4a9fba8a5bamr67130801cf.4.1752255241337;
        Fri, 11 Jul 2025 10:34:01 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc5d7e0sm23679941cf.29.2025.07.11.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 10:34:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uaHdI-00000008GBP-1Lnr;
	Fri, 11 Jul 2025 14:34:00 -0300
Date: Fri, 11 Jul 2025 14:34:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, oe-kbuild-all@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [linux-next:master 8533/9053] include/linux/limits.h:11:25:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '18446744073709551615' to '4294967295'
Message-ID: <20250711173400.GD1870174@ziepe.ca>
References: <202507120122.8Tizf08n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507120122.8Tizf08n-lkp@intel.com>

On Sat, Jul 12, 2025 at 01:13:16AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
> commit: 44b6b311bedcd301731cf16738373bd66f7e96c8 [8533/9053] iommufd: Add mmap interface
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250712/202507120122.8Tizf08n-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120122.8Tizf08n-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507120122.8Tizf08n-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/overflow.h:6,
>                     from include/linux/string.h:13,
>                     from include/linux/scatterlist.h:5,
>                     from include/linux/iommu.h:10,
>                     from drivers/iommu/iommufd/iommufd_private.h:7,
>                     from drivers/iommu/iommufd/driver.c:4:
>    drivers/iommu/iommufd/driver.c: In function '_iommufd_alloc_mmap':
> >> include/linux/limits.h:11:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
>       11 | #define PHYS_ADDR_MAX   (~(phys_addr_t)0)
>          |                         ^~~~~~~~~~~~~~~~~
>    drivers/iommu/iommufd/driver.c:61:43: note: in expansion of macro 'PHYS_ADDR_MAX'
>       61 |                                PAGE_SIZE, PHYS_ADDR_MAX, GFP_KERNEL);
>          |                                           ^~~~~~~~~~~~~

I fixed this like:

@@ -58,7 +58,7 @@ int _iommufd_alloc_mmap(struct iommufd_ctx *ictx, struct iommufd_object *owner,
 
        /* Skip the first page to ease caller identifying the returned offset */
        rc = mtree_alloc_range(&ictx->mt_mmap, &startp, immap, immap->length,
-                              PAGE_SIZE, PHYS_ADDR_MAX, GFP_KERNEL);
+                              PAGE_SIZE, ULONG_MAX, GFP_KERNEL);
        if (rc < 0) {
                kfree(immap);
                return rc;


Jsaon
