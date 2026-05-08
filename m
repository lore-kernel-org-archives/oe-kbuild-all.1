Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3A376BD1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 06:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221018; cv=none; b=knwsyXO0DL4fX630UH44m5pj9JocpcSA18/vBJm8o0/XiV+nC5OjkwYb3YnPRGLMzm+9XDS46oM3N0mxHpPgKMhfVPs65jxrauVlLJHnH03On+NupfBPUppCOIcKK7G+H1/H1xMmDOA19GtwuSfNc/4iC8pkwQrJUNc6gFYL0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221018; c=relaxed/simple;
	bh=maMKpG5JtsahwCoCistRB9wzcOXtXjO7nbLwk2IXAhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ibq/HkzBJvTS2w7JcA2EEz7rACJwTpMNOK/HgXiP3AqkWcsvckMCtXA25ALozXM6sEdqMSbT9YyzjY0Q0+S/dWbL0mJQYEppaPzc5fS1FXkK7NgQZQbOek1OS8R53h9pvl4X4cfWg+H/sbDAIdx8uj7OgJLt+bjaVmjRiRSDZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KM4KFiy3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KM4KFiy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778221011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2unXq22HY2FnCjKT6qtydtFufJI+AwXDzC5gFdjej0M=;
	b=KM4KFiy3W6T+yPa/+5TBYd1nyixpSjiBEJeevhfbKczLBojqwwkjOZLUt2rw0Ippl6mMJO
	yfKH2GOb9iIeVrJVZMfkS6Wc5kPOkuifcWfQXjSCfMObaClabjHAnD5TLiFT9O6ezCZ8ia
	sCxxM31/M5PT44GCBVKwju3q0slF5KA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-NX5oqdWePPm-JLS0b0ls-A-1; Fri, 08 May 2026 02:16:49 -0400
X-MC-Unique: NX5oqdWePPm-JLS0b0ls-A-1
X-Mimecast-MFC-AGG-ID: NX5oqdWePPm-JLS0b0ls-A_1778221009
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488c2cc0cbaso11929705e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 07 May 2026 23:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221009; x=1778825809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2unXq22HY2FnCjKT6qtydtFufJI+AwXDzC5gFdjej0M=;
        b=DrAgz+KlIN67v69z3FVn0far2Vy9WTRimC1/sobl2aoyHT1WID3GKW1Twc/7+OTADM
         92IaQuEIGDkxjswu69/oyB/BHCogAPwXbJBaZTx5YluHIad5XB9W9dVv4tlhgeGLElXk
         lhBu64B/YfFkV9u7YWSE6zPVMa0f55Sm+49uszFIb7XTaZQrN+jkWY4y+UwSEFf78TFP
         UOEkmC/PLPlUniAlTgi8CpirjsUDeX4680ZG6bblM7d9eneWxJugjwDTtRiAUXEkTAZj
         UX1Kdc5SnqUqcri1CGurDhUoZWFrlTOpkhIW/UuVGDuLyHT758opjOJVyNT8aCstf3sT
         irJg==
X-Gm-Message-State: AOJu0YwNjal+itOSZLevvEnKLdWdZoOZSHvvxXET9XgcettQdkay3XI5
	d4Sb6GN+cdWSS3U+9okP4ujR+MmQJ6ude3FODik4fuEKjeZvqgdicpiSzkxE3F1sXvpBpMbRouM
	lfyNgf22MvzxYwgPGTFSqBWZ4BJV8P7CVVScmfJa0BWkgLx/i0k8xfKdW0n6bBFu6oo4=
X-Gm-Gg: AeBDiet1Vdba0Ep9NjjuATX7bCxRHJAbfiJ8cKPNACpNd0Wrq9iMVIFBG5XY0kM9pQL
	OJR3/6dxHq/H7sUEBT+lqElvAKQqGm7gap9/6KWTixg7Dwk8E+77RgBxcWOXoAb9tdfWLF6AhSz
	ZPvSoM8a2IW0RzuOLwv29IB1Bn4D6h2WvVa4w80aXJCMEIUjGGPhDAROfe0Qfk8ql1QyNlcivLN
	fMpDXlC7Wht7nLfzY9rKthsqn+R5g0DrAQ69YKq2h2ix/PRcs+KAEgTs56fgNAYZecRibc9zLTv
	jesHZx73mlh8wnMAlg4mf42kJKj34hTjZHHmkrDfDp8v0bHPvZIQk9vgOblgFALonYvuP5/hipo
	zRaoIfPYBlLEmsTV3nulPrkfVKZ+5rGkOa6f3keBF
X-Received: by 2002:a05:600c:a47:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48e6767e04fmr19385205e9.11.1778221008544;
        Thu, 07 May 2026 23:16:48 -0700 (PDT)
X-Received: by 2002:a05:600c:a47:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48e6767e04fmr19384575e9.11.1778221007973;
        Thu, 07 May 2026 23:16:47 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68eef558sm15122585e9.7.2026.05.07.23.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:16:47 -0700 (PDT)
Date: Fri, 8 May 2026 02:16:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [mst-vhost:balloon 4/30] Warning: mm/mempolicy.c:2527 expecting
 prototype for vma_alloc_folio(). Prototype was for alloc_frozen_pages()
 instead
Message-ID: <20260508021630-mutt-send-email-mst@kernel.org>
References: <202605080331.y1eIdVUC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202605080331.y1eIdVUC-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ny-5xnWt6HSd1oP_PlYBUTYMtoN1h0lxUKsuuc_UXm0_1778221009
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 03:56:56AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git balloon
> head:   9f56ee36fbf6a6d336dc6a9eaeb4f8a67cb42a31
> commit: 95744e0e9c4df79c6bc8ec96306b29c7a8e8984e [4/30] mm: move vma_alloc_folio to page_alloc.c
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260508/202605080331.y1eIdVUC-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080331.y1eIdVUC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605080331.y1eIdVUC-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: mm/mempolicy.c:2527 expecting prototype for vma_alloc_folio(). Prototype was for alloc_frozen_pages() instead
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


kerneldoc messed up by a rebase. will fix up.

