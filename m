Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFC27D786
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242952; cv=none; b=d5ixDKJyMCDpvhfxmH6qvzmyEKTbRO7YHZF5M/cn97da7v1Xl9OpwyHLz+VV/215bVNNhiPHVjF8+Ylyl2miqRg54P7VdcZnz03JwtvuWR09ouox13og0pnIA5u4ce8Ut4xHbTVxYDbCm2xMGYnzXjWYW2bsYhOVvOFWqhb7okc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242952; c=relaxed/simple;
	bh=yZKvYHncBfQJe0YWJMImi87EGAalGmTkBDddUMRaINc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnOsCu1tnONtIu7r9lp6WS+XSrlDo7eRqM3Y+W1AWVkIMRvLm0LlDC0ftU1q9Re6nf1Ki37AMd70J2VZjiMySitMYF7ZnKrCZFrrLNnEpSz2uzMo/Wbv4X6OM1tjexrlpp4eaKZ85Dk9hObjpyGkh8Bzpg543+anc6DTEeFldQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=WvjTNo3B; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="WvjTNo3B"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ab3fb340e7so2416441cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752242949; x=1752847749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6bI52/xgjAZypaQPclB5mkFlqrEG93vCH4YqlmfbgHw=;
        b=WvjTNo3BKBz9u+yt7DXw9tYpjX/bCb4YtH3fxmFSbSAzhbiY0U8HVdKzTwkZo+t3CG
         HOsSVidzZ/HvARC/3fQLjwsdR0k7ie0HdYD7xFQrb0KGlbGgSYR8Y6jA1kZZxHFqTD/0
         /DWTJ6nkzymuu5pZ7zxhJia4xwbOQLCdzSN3j2df3QdNYvqEPBMZW4Xmmmf16nzGGx7g
         cfQdPs3ZTfUFham8uJRliQh+zz9esujPKLJpi81rolwWvaebmQBX6rgJHhptji4HtTLm
         PLnRhmqAE6nehr6oC3xdtfEH/C6rmiaVU10VHaEVGy8A3fnkXQTUyRmJzNDKD2VIlV4h
         xctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242949; x=1752847749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bI52/xgjAZypaQPclB5mkFlqrEG93vCH4YqlmfbgHw=;
        b=Y9/jGYbYIKW0sbz41qkDg6HVKo/BhykcFD8Jlx0a/x0cBquU53HPmGnJ74or9r1eoW
         jIE/c22uW9TQd+lkndxMJyq6aM2pof2PbGYNrKqFTS64NG0rXH5rezMYnGcwMVlLI7gk
         QXn69HQugwTO3LZ1ZzhnuM99RMcroAGlwAYmPTl1+2/DltRZlhR9xF70BSAk8KFAEZAl
         wvfQsxNKO140uaw5TR4wf9ZQyGOoZ3o7qtFB3kXqVjod+ui0N5+piYoYAhKE4zjH51nQ
         i3URdNpiF6m0VL40zizG2ZMYvsmmGkw+/9NWS+NdAmb92lXOmEjoQLwTytkCjjoF5nBq
         JQKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9uiZB9e0w+zVLCkkLiDuRWavvJmxFmPlPXRPowQ4oaiZVspTXIR3i9QjNLMXC0mKDmq/YZm/btJr7IsW7@lists.linux.dev
X-Gm-Message-State: AOJu0YztegK0mbStHIH8cjTHxns6PZHL9F87O2HPrfHhrfHy4I/qfhiT
	pSH/OEjXeDyyzrN/RPXaqJWSzQ9wbLMQi6Emq3waddu0/XKv54O+86YaJwxfJxR/jOA=
X-Gm-Gg: ASbGncv8yCOZ922Hp3C/afJWseqSZFqHJvB6wdLA7BpNJL25nAp0Oqjpk47gllynqMl
	ZqgN/mRmvEIkbtDgWr+1le5pemSr3mu/yV+2FmcjdahDREjMKDIyhSXud7YCqrBFlWTnBFyu26c
	IeNB4xwy42rqeIAhPkEY5QWC6pEhw+mhYAJ4BwNI8Pa3dn28Nw8pqRS6G/DNvs+gsG0APuPqXpA
	Zy5y7/UdbLB+qJFN7CVb6apUfddfP18FXBu5TF37r8myq+NP6H7R+cjm3tsRRExaE4magfgy1tE
	mzwuQ6UCro/OIrEO/+q06S6d+aO4TauvDB0MsCp5XLcxoFnFqIVXOMyxoR7+KR+Hx1QCImE/aur
	KiO/PbGfvycfeELLdNwdBaDGQWUgW1K5hS4KkZOl/I6Vk8BWC9POG489Dqfc+uYr/5ZWzFFcaPA
	==
X-Google-Smtp-Source: AGHT+IEixxsJ1OPzAr8wF1jAqr76ZRx+zlHFTsJPyONXB0Hzt8glfUePTCHimwJLnXKMKDXsmrZPVQ==
X-Received: by 2002:ac8:4e04:0:b0:4aa:939b:2e75 with SMTP id d75a77b69052e-4aa939b3654mr25585771cf.5.1752242949082;
        Fri, 11 Jul 2025 07:09:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9fc780367sm9922481cf.61.2025.07.11.07.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:09:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uaER1-00000008ECi-2QSO;
	Fri, 11 Jul 2025 11:09:07 -0300
Date: Fri, 11 Jul 2025 11:09:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [jgg-iommufd:for-next 25/43] Warning:
 drivers/iommu/iommufd/pages.c:2114 function parameter 'lock_area' not
 described in 'iopt_area_add_access'
Message-ID: <20250711140907.GC1870174@ziepe.ca>
References: <202507111555.VxJIWo2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507111555.VxJIWo2k-lkp@intel.com>

On Fri, Jul 11, 2025 at 03:35:12PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jgg/iommufd.git for-next
> head:   7de5cc04caf979c6a1978b283eb8ad8fe5167e24
> commit: 940d0dd200c80a77133156bb3e1aaed47e2a9c23 [25/43] iommufd/access: Bypass access->ops->unmap for internal use
> config: i386-buildonly-randconfig-006-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111555.VxJIWo2k-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507111555.VxJIWo2k-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507111555.VxJIWo2k-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: drivers/iommu/iommufd/pages.c:2114 function parameter 'lock_area' not described in 'iopt_area_add_access'
> >> Warning: drivers/iommu/iommufd/pages.c:2173 function parameter 'unlock_area' not described in 'iopt_area_remove_access'

I fixed this with:

--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -2103,6 +2103,7 @@ iopt_pages_get_exact_access(struct iopt_pages *pages, unsigned long index,
  * @last_index: Inclusive last page index
  * @out_pages: Output list of struct page's representing the PFNs
  * @flags: IOMMUFD_ACCESS_RW_* flags
+ * @lock_area: Fail userspace munmap on this area
  *
  * Record that an in-kernel access will be accessing the pages, ensure they are
  * pinned, and return the PFNs as a simple list of 'struct page *'.
@@ -2165,6 +2166,7 @@ int iopt_area_add_access(struct iopt_area *area, unsigned long start_index,
  * @area: The source of PFNs
  * @start_index: First page index
  * @last_index: Inclusive last page index
+ * @unlock_area: Must match the matching iopt_area_add_access()'s lock_area
  *
  * Undo iopt_area_add_access() and unpin the pages if necessary. The caller
  * must stop using the PFNs before calling this.
 
