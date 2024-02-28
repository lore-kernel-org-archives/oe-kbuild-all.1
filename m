Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4F47004F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709157138; cv=none; b=IeLllQ4PR5+jNLAQ6ZAm7lt2x3+3bCFt7EoSzGMeuCqv0ZFxtzDKsDLhgjUKwT99e04Ri/8UX0l/B62CQIo3BrKmUS3RE8p7dJur+PUx+lKZ04O7/HTtRjLCh6zuHPOlGohghqSsdTor1kBcM09Ld6TVlMpZ/06KVq6Xm3lnMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709157138; c=relaxed/simple;
	bh=e+fJLlYebqg+aIxj+d+226rzzsuft+oTmxfFs2BI+Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lw50uQZgGSqGgFhNAPAep7LJf/TB27bT5flFHObwvAs/QKP01y6gNFQ4EWlGaMPhqzP7pW9lHBwMb0sCsyHUEQ6TAaBwFwtlrb/Bf4vmOPhNkK6JsDiPd8KkV/b6IpDWQ4MGQACKvlko6GCGLa/espwCs5t/ZjJTO/1ALuWkWO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSe9nQCT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSe9nQCT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dcafff3c50so2612775ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 13:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709157136; x=1709761936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2Z7fDOeCc1Jo9g4fiP9dbJAViK/ypWIjDNaG5Ns9O0=;
        b=GSe9nQCTb8lOiytWvvrjB1HcrvSa+D9VlPCk6caiSGDFB6Yqm9jXXgF7tVY6lW+X5y
         YSCb+u7ZZSsGqX0ExwcBrwnIcl2Y+aPoKRHYwfttjmnGFts9VJWducAdnH2WaN9pfcfM
         Ln/YoJCTOE79e0SaEA7bq6caSw6oiFt9s/DrUzZnR3q/4zmM8BHccA7FVQWUN6zaNLnZ
         k2n+3e2qaIJ53GNtIZFfbzgrU+rJ5qX8I3cDNRJXcPtXuUHzry6PnluW/SlAqn/n5+qm
         d6dj3p5W6wQFJt1I3vzsd3QGTsEKAgRW1aNHEtUHHm/270/XHD0O1V+vDjd4G/2PiI8l
         fHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709157136; x=1709761936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2Z7fDOeCc1Jo9g4fiP9dbJAViK/ypWIjDNaG5Ns9O0=;
        b=KZOwByRXWXK6svYO17uT6ZiiIFUnz+BoGb464JXvQWUiTrYcl2FEkh6FXGQdwSaCIi
         r14qTIgqKtcZd/M5W1/jGUwh2WtZzlAoBmVheU5tA0lIO6waifEOVZepvVRVe/4DDoDD
         SEUorpLJze65cEmSII0NnZ3TBeBTEdhLgk1rZ8bcYee/dURKN5SnAO/pg5MbJB50+4qB
         rcIWG/HWuP4OoGFR9G58+BnSiH5yESE3A8YLoSE5XzYlJjvYC585KHCGlKlaI7HvPQSW
         tXLkWzj3CvefUFX1coU8GOfQBCQ01tfX0qZF8BDV9m7peU5aVlaxF6evPzAQqcFpOA+W
         4OMw==
X-Forwarded-Encrypted: i=1; AJvYcCVb1BAplbNlCP/sT4aeVoc3kmRd0N1l+HHW3CZF0JArAGuWd0idX7Q+m/mz8UiOJMFLVTwtKWz2gO75axH9PN6r6MrXdsNjGQqqVJ4zVA==
X-Gm-Message-State: AOJu0Yx+5Jy2/SqTo1OlV0hLSI5RS3/mNHRwYweLrjFW1sMz+gfL6jVZ
	m/oM3Cg/yyXJL2TeSkPb+29wGyIyMUNOexdoHmr50I7xjGEWVhhS
X-Google-Smtp-Source: AGHT+IGzGsWaN9WmnZp2sB8Pazh319KKCgVgX2dcWjJZ2XJujUE9z9ErYWJ0oW03cXuizwNcJ0Jp+w==
X-Received: by 2002:a17:903:1c5:b0:1db:e672:3704 with SMTP id e5-20020a17090301c500b001dbe6723704mr367212plh.33.1709157136248;
        Wed, 28 Feb 2024 13:52:16 -0800 (PST)
Received: from barry-desktop.hub ([2407:7000:8942:5500:5158:ed66:78b3:7fda])
        by smtp.gmail.com with ESMTPSA id kr6-20020a170903080600b001dc3ef786f9sm3759861plb.308.2024.02.28.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 13:52:16 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: lkp@intel.com
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	sj@kernel.org
Subject: Re: [linux-next:master 10511/10830] mm/internal.h:98:23: error: implicit declaration of function 'pte_mkclean'; did you mean 'page_mkclean'?
Date: Thu, 29 Feb 2024 10:52:01 +1300
Message-Id: <20240228215201.39810-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202402282202.yV6GmMJu-lkp@intel.com>
References: <202402282202.yV6GmMJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
> commit: 9ea89c8b43ac0de34c9542a97eaab901af02e5a8 [10511/10830] mm: make folio_pte_batch available outside of mm/memory.c
> config: riscv-nommu_k210_defconfig (https://download.01.org/0day-ci/archive/20240228/202402282202.yV6GmMJu-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282202.yV6GmMJu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402282202.yV6GmMJu-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from mm/filemap.c:51:
>    mm/internal.h: In function '__pte_batch_clear_ignored':
>>> mm/internal.h:98:23: error: implicit declaration of function 'pte_mkclean'; did you mean 'page_mkclean'? [-Werror=implicit-function-declaration]
>       98 |                 pte = pte_mkclean(pte);
>          |                       ^~~~~~~~~~~
>          |                       page_mkclean
>    mm/internal.h:98:23: error: incompatible types when assigning to type 'pte_t' from type 'int'
>>> mm/internal.h:101:16: error: implicit declaration of function 'pte_wrprotect' [-Werror=implicit-function-declaration]
>      101 |         return pte_wrprotect(pte_mkold(pte));
>          |                ^~~~~~~~~~~~~
>>> mm/internal.h:101:30: error: implicit declaration of function 'pte_mkold' [-Werror=implicit-function-declaration]
>      101 |         return pte_wrprotect(pte_mkold(pte));

This is exactly the issue SeongJae reported and got fixed here:

https://lkml.kernel.org/r/CAGsJ_4wWzG-37D82vqP_zt+Fcbz+URVe5oXLBc4M5wbN8A_gpQ@mail.gmail.com

Thanks
Barry
