Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4EFBE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711215536; cv=none; b=Iqg5lNBYBl4Ar3G+pYtEUEVa7CW2kZNWOk7iFemDmdmqFxMFuUCiMbRdzp2ee8s/lENVq8dnJvW6IE0AcQspiGd/8tAtd/WLlUPEolCnQSt2P1wCw4tP3e0mz8BwzmMJSsfG1/Nfc3rdvCBtnqxoZGa+JvQuzMB0z+eoK5sDpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711215536; c=relaxed/simple;
	bh=UQIiK8Z4s/l94svTjPP1GphXf2R1CeD3GtdYcZYyGe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=k1ioe1Avqe/ZLQfZjzVeimJH1K87ySZK+49wt15ydw1Zkrx1PCgvpLQedGQpBarPZa6nUcpEUEKwOoIqy4mx+aQF0D+miSLpo+SrrroF/eyXWE5g910E7dXU9K+4MvUwVlGjgtrT7831G2PcCd5UW76SuKzg58bNaJuZXCkBjTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQKQsL5X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQKQsL5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711215532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIauagApnARH4T0nvgXygBukzfZfxhBo5aFzyNLrHzg=;
	b=bQKQsL5XlEx6sFfbsYx4zo8Rt4LAgDfAesI0XoUDvNEITO4/wtU1xnSiQuMpnn3MD+K2y/
	kisuGJlC/cVI5rHAAlGSGRunM7K1NtZ69ECCcXM3reInzhSrcDjiELmfzHX1rNgDYUnYI1
	ijDQuhfpp4OuTv6pIsU+/hnkwXKuGhg=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-fqDDiXAsMt2aYHHJHvILJw-1; Sat, 23 Mar 2024 13:38:48 -0400
X-MC-Unique: fqDDiXAsMt2aYHHJHvILJw-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dea8b7e74aso837201a34.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 10:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711215527; x=1711820327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIauagApnARH4T0nvgXygBukzfZfxhBo5aFzyNLrHzg=;
        b=KU/2yaLtAx8d07qNWdTdaxv14/GgbjgQtJI8HGaL7F6mMnVz700AeeRy4bgkspdwDZ
         gE7r0YB51MyJqcgAI2380skWSWD47y1S3NnHWnk2oxi3ryKX0mHJhQVoBsALIYplgb/V
         Vctz3O/87TYqFniqGmDuqk6ottZRkiZpBEndAEPFBZdBViss8nTDjSzjoERWYalpigz/
         ZXn48EfAPFa3iACJGcVKZK2Pm+ew9Q10u36zWnUqsurvzAK+VCinHdayz9bI3lO54TdE
         LUWsqjATawXR6KsdauYFWOVoM+J8MwP6Lk4kb5FsB7C8V0W+LtxYgmPq0m0gfh5XWOCN
         NhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIth46pUGqrbP0o2cS+o5hdYn2SVCwW345I7J+A9imCmX1qzpsFzQHheKN+CbkbfWP4/cHBMNw8pfObzK0eKBwfmCQxYV66o0M5ELTYQ==
X-Gm-Message-State: AOJu0YxSRWO67YUjLgXjkEZW1rrAUtd6QVamtK/tkZ2PwGT84bLZqLAq
	99OVSeVJ5kp1xc1Ouibba7/M4lndzs18BKo/9BBBJINbHJLGi5LhzldfYM0RjjKA4pBQXqLWDPV
	f7GhaN4b3j5Es/DyvM9V8BxE4opPgm8+szrfe+EQs5U/9HHEGiwjkf1vVAdBvl2w=
X-Received: by 2002:aca:d05:0:b0:3c3:c090:59cd with SMTP id 5-20020aca0d05000000b003c3c09059cdmr2628147oin.0.1711215526683;
        Sat, 23 Mar 2024 10:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiVWsP3fTAlbJWgwYv+bI8uN+5fNa1oDVYu5Ny06AJ0joFwcEZjlU+wbLtW5FnYWSeHjMB3g==
X-Received: by 2002:aca:d05:0:b0:3c3:c090:59cd with SMTP id 5-20020aca0d05000000b003c3c09059cdmr2628133oin.0.1711215526216;
        Sat, 23 Mar 2024 10:38:46 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jx12-20020a0562142b0c00b006961cc3f91asm2264494qvb.20.2024.03.23.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 10:38:45 -0700 (PDT)
Date: Sat, 23 Mar 2024 13:38:44 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [akpm-mm:mm-unstable 115/141] mm/gup.c:536:22: error: call to
 undeclared function 'pud_pfn'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <Zf8TpI3unIxZuPRn@x1n>
References: <202403240112.kHKVSfCL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202403240112.kHKVSfCL-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 24, 2024 at 01:24:25AM +0800, kernel test robot wrote:
> >> mm/gup.c:536:22: error: call to undeclared function 'pud_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      536 |         unsigned long pfn = pud_pfn(pud);
>          |                             ^
>    mm/gup.c:536:22: note: did you mean 'pte_pfn'?
>    arch/powerpc/include/asm/pgtable.h:60:29: note: 'pte_pfn' declared here
>       60 | static inline unsigned long pte_pfn(pte_t pte)
>          |                             ^
>    9 warnings and 1 error generated.

Duplicated issue of:

https://lore.kernel.org/r/202403231529.HRev1zcD-lkp@intel.com/

Resolved by:

https://lore.kernel.org/r/20240323151643.1047281-1-peterx@redhat.com

-- 
Peter Xu

