Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE30B5C911
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710425411; cv=none; b=bY1CbhFMj+uGxhAcjkULkv+3J13bqnyPDkCUBIuBPasyYqStY4gmxqaBkQLLxP5Uobrbr2Oor654nGrRh4BxgA246qR/0AgGUb4SQebQX8k0NR0kLl+Fi+J1bXLUe00Ulc9vak3a/B4T/My7ri4GOM71k70rQ9/pwZxR2thudlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710425411; c=relaxed/simple;
	bh=Z20hppiO+OA8ms/iHN+zZdFA687W0S6Lm4euPA+gV60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hiTb3jo+FrSdOVoLZkuy/ILd3dgnJg3DXROMnAsbypGTKQyTyuSKRgrMETR0Y1LTbV2e24tZBcd6xTcL3ZbSf7S1PqrGBNWObq60itsykmrbgriatjZTeLeQC3U0ZAIacIi3pB4VIKoozAbKb2hz6k2WR60CLOcK0gEGvAy1GRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ma+vKcqE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ma+vKcqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710425408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rkWuu+moLBejGqgG1PUVfAsPi/A+0gM2VfsVVpgvkOc=;
	b=Ma+vKcqEFjSuQ+jGAsHsxICiHHgYmEEc3XhfjRZAp0dAOQMx/QzCZLkncIX5db6bD9jWLQ
	pkmpqP1XQPmm+d+dNadciB2B7c3uGxYMUKJBP5QEIoqCTy4adJPqvjula53Biym0gJTM3L
	jpmmkYV8sipcmURq9BXvivuvregw3fw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-ZeufFXSYPVyNKPPtJlsKag-1; Thu, 14 Mar 2024 10:10:07 -0400
X-MC-Unique: ZeufFXSYPVyNKPPtJlsKag-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3c22fa01f9dso41175b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 07:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425406; x=1711030206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkWuu+moLBejGqgG1PUVfAsPi/A+0gM2VfsVVpgvkOc=;
        b=rM8tRdLfMDNeX5pkoBgK2EMgjfr6esgXYVlNfVvqa32WAtjF7vvhJjqxxpc3WD+Ogz
         T0I6XewcGXDbeE+u211vu2nIHPev51VwaNvrRPGexKHe9Ohg5F3T+LaVj+qxNH+zuEyU
         2BNIzIZjKNu3jIOVNwNlvOsbSxAm6FWqfztEk7vPFPOnwiXHaEKU5Fge/NX+v2AHie5t
         hs6ukUmWSswo1bWiynT1WIZNmqlhWNz4tXXX/syBpzhpiNEbaZ95CN+VLz67rZT1e3gf
         K+7B8xDD8ssQFIo91uQkjBalLjjHS3Dz68QLIHG/NNlVKa2YhQ2zqLDHr4NR9oN9Ue9z
         RtMA==
X-Forwarded-Encrypted: i=1; AJvYcCVjaZ53wmec/NgJO/9m1KnjJ8/3zXJum/yFMEjTB5SH1jWInk2Uj0wu/IJdz9SUjxJq2DACVjEIPdxAmWwYLwkhOYhrtm/vKcIYtvckhQ==
X-Gm-Message-State: AOJu0YznL971fmQG6eqifszS9ZQpub5H56+jZnUTZ/ttpHzM2RnVp1FE
	SQonXzEinE5tWN5SAKeo72F28YJpiNoMdcFtTXHsOmCmLo/xIzEPq7AlrhW1Y1zKl9Yrio2fHsR
	RBXbe31XoxBPCYH6ILsawwU0sa/cU/mXrvi+432ZP/Z2GivefuUCok4LorF0dcQw=
X-Received: by 2002:a05:6808:1806:b0:3c3:56f9:ed52 with SMTP id bh6-20020a056808180600b003c356f9ed52mr2234248oib.4.1710425406392;
        Thu, 14 Mar 2024 07:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3n/2sG7MBK9m872zsL8hx1/ucNS60gnWqRnEmQJEzTW8SIFwyNS29mOW0AE/xdz2nsAtxcA==
X-Received: by 2002:a05:6808:1806:b0:3c3:56f9:ed52 with SMTP id bh6-20020a056808180600b003c356f9ed52mr2234195oib.4.1710425405922;
        Thu, 14 Mar 2024 07:10:05 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id l1-20020ac84cc1000000b0042f04e421d2sm810226qtv.24.2024.03.14.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:10:05 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:10:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Yujie Liu <yujie.liu@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 12265/12944]
 arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-ID: <ZfMFPESPAscjb75A@x1n>
References: <202403101607.a42gaLOS-lkp@intel.com>
 <Ze8vFNV9YSdgC2S7@x1n>
 <ZfK+uOh1PgeB6ij/@yujie-X299>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZfK+uOh1PgeB6ij/@yujie-X299>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 14, 2024 at 05:09:12PM +0800, Yujie Liu wrote:
> Hi Peter,
> 
> On Mon, Mar 11, 2024 at 12:19:32PM -0400, Peter Xu wrote:
> > On Sun, Mar 10, 2024 at 04:10:37PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> > > commit: 924bd6a8c96767a05323d575bdefd664631dce73 [12265/12944] mm/x86: drop two unnecessary pud_leaf() definitions
> > > config: arm64-randconfig-r031-20230409 (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/config)
> > > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202403101607.a42gaLOS-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from include/linux/pgtable.h:6,
> > >                     from arch/arm64/include/asm/io.h:12,
> > >                     from include/linux/io.h:13,
> > >                     from include/acpi/acpi_io.h:5,
> > >                     from include/linux/acpi.h:39,
> > >                     from include/acpi/apei.h:9,
> > >                     from include/acpi/ghes.h:5,
> > >                     from include/linux/arm_sdei.h:8,
> > >                     from arch/arm64/kernel/asm-offsets.c:10:
> > >    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
> > > >> arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of function 'pud_leaf'; did you mean 'pmd_leaf'? [-Werror=implicit-function-declaration]
> > >      904 |         return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
> > >          |                ^~~~~~~~
> > >          |                pmd_leaf
> > >    cc1: some warnings being treated as errors
> > >    make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1
> > >    make[3]: Target 'prepare' not remade because of errors.
> > >    make[2]: *** [Makefile:1199: prepare0] Error 2
> > >    make[2]: Target 'prepare' not remade because of errors.
> > >    make[1]: *** [Makefile:240: __sub-make] Error 2
> > >    make[1]: Target 'prepare' not remade because of errors.
> > >    make: *** [Makefile:240: __sub-make] Error 2
> > >    make: Target 'prepare' not remade because of errors.
> > > 
> > > 
> > > vim +904 arch/arm64/include/asm/pgtable.h
> > > 
> > > ed928a3402d8a2 Tong Tiangen 2022-05-17  901  
> > > ed928a3402d8a2 Tong Tiangen 2022-05-17  902  static inline bool pud_user_accessible_page(pud_t pud)
> > > ed928a3402d8a2 Tong Tiangen 2022-05-17  903  {
> > > 730a11f982e61a Liu Shixin   2022-11-22 @904  	return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
> > > ed928a3402d8a2 Tong Tiangen 2022-05-17  905  }
> > > ed928a3402d8a2 Tong Tiangen 2022-05-17  906  #endif
> > > ed928a3402d8a2 Tong Tiangen 2022-05-17  907  
> > > 
> > 
> > There's another possibly relevant report for riscv:
> > 
> > https://lore.kernel.org/r/202403090900.OwPqmRuI-lkp@intel.com
> > 
> > I think I messed up the nopmd use case.  Since this commit already landed
> > mm-stable, I assume there's no way I provide a fixup.
> > 
> > I attached a formal patch below, but I don't know how to test it myself,
> > and I'm not 100% confident.  Before I post a formal patch, can anyone let
> > me know how I can kickoff the test bot to test the patch (or help me do the
> > kickoff)?
> 
> It is recommended to firstly follow the "reproduce" link in the report
> to see if the issue can be reproduced.
> 
>   reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/reproduce)
> 
> Then please apply the fix patch and rerun the build command to see if
> the issue is gone.
> 
> The kernel test robot sends reports when catching any new issues, but
> the bot is not yet able to test whether a patch can fix a previously
> reported issue.

Yujie,

I see, thanks for the information!

-- 
Peter Xu

