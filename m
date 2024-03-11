Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484A4AEC0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173981; cv=none; b=SkAT17u+z7ob69bcbsS4yDCFAqn+ZTyyuqPiuo6shm8+9ltf0CdZez/obOaCpuJDPTp5CG6ZYn3Ai3ebW4Kk6zqgGIfHjYanXzrJn8JVBi84ebEGBwDv2YsjemZgE72WYyVHP7L3lLQKiYWd/wfkvwawP0RHMWC7CrhnSyOwirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173981; c=relaxed/simple;
	bh=ThPH1M8PfShrThEBpbGKkjc2bqO+6B8CgS98TQ5ZiyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iJuYNeIOvD1dBNf3DAkm/BwWpY/5H6kTkA60ftdaUbDhND4b+vfe85RV8OMNGcO0pNxRmXboQxJjVpQzqsC+nWsHNPiVuxl01WvV/9WY/hJokTxLp5DR2eRG1f6ujjqz62hxx8jwJCTmh48GViTPqMIWXAxPEcZpje6Y7lvpIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6sNpITN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6sNpITN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710173978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/oBCVAyg5PJ6txcGy/OlzYHp1Y1HFBlEoxbDyUxUl1s=;
	b=B6sNpITNeLr+vZx8yBacZwnfo6h5rhhHnk7cFfVKehdbkjwwGZQJdFL1TDmcsDJQSMNMGK
	uuvayGtENr9mhYiKVfcI1+3id2uyE9bw1t8IKaeWZusUnu4WCDl63jprtCMIOd81pYE67i
	QBkFd1DffrYYzyW/cPqu5m5HDwC0c9U=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-mCZd02d-NSGYJ0TzzV9N-g-1; Mon, 11 Mar 2024 12:19:36 -0400
X-MC-Unique: mCZd02d-NSGYJ0TzzV9N-g-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-221a4b83d7bso1272701fac.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 09:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173975; x=1710778775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oBCVAyg5PJ6txcGy/OlzYHp1Y1HFBlEoxbDyUxUl1s=;
        b=I1efU9fkRQaSiov1rvMyG+RvGTAc+mvaXUjYlLMXYuQhugc2DN6xKDfNoxuvVVhZaZ
         g1/hR0GBKkd6A8BLrAkv/Oatp0Er6hakTzwwL2m9+HFusx/crTJqftVvnzdV2O3Pb5uY
         o8APBL2QFZtqFq4t7rlEfdA3m3ktwT0R7/jT+UmXwzTJ6cYgJJ0eLJi6yCRVo2Mofcoj
         SY8La5HbT7l0INsF/fW0Gvn3GAwGwlbfGtq0s9GlAhUGT/xdxvurZQxitOrakp8yE29X
         Eg6b00NLIyOS6EzmLSMV4urEfEQPz3AcDDw3Tue6IAcbotUn3Xqwo3XOporHxq5YW9T8
         eyCA==
X-Gm-Message-State: AOJu0Yx1slNKZdzYqe/WJ0wF8jsnfA/ch/oAchj9pd+fdzV518SkZzST
	GXNkU57jNRl7HErC+P+XiymwRPpFgYLI6aqljz6B4Bconnv58xwDRvzunotx45X/WpxehLCg55b
	o8ZYar5nrKiZjTl3EPWY2XYBolPfQNLN7taNWmOh5s/rZ3N0JCPNlHMjCXOH7DtA=
X-Received: by 2002:a05:6870:2185:b0:221:c9e7:7220 with SMTP id l5-20020a056870218500b00221c9e77220mr6362384oae.3.1710173975205;
        Mon, 11 Mar 2024 09:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9rh3+Tgb3foOECTEe64qt+J/5fCOyDC/WMYulhyWAQOCTiohXg4S1OQ/42kgI4Ls7qjm3QA==
X-Received: by 2002:a05:6870:2185:b0:221:c9e7:7220 with SMTP id l5-20020a056870218500b00221c9e77220mr6362373oae.3.1710173974880;
        Mon, 11 Mar 2024 09:19:34 -0700 (PDT)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id g13-20020a05620a13cd00b0078825a5ac3asm2819476qkl.45.2024.03.11.09.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:19:34 -0700 (PDT)
Date: Mon, 11 Mar 2024 12:19:32 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 12265/12944]
 arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-ID: <Ze8vFNV9YSdgC2S7@x1n>
References: <202403101607.a42gaLOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202403101607.a42gaLOS-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 10, 2024 at 04:10:37PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> commit: 924bd6a8c96767a05323d575bdefd664631dce73 [12265/12944] mm/x86: drop two unnecessary pud_leaf() definitions
> config: arm64-randconfig-r031-20230409 (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403101607.a42gaLOS-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/pgtable.h:6,
>                     from arch/arm64/include/asm/io.h:12,
>                     from include/linux/io.h:13,
>                     from include/acpi/acpi_io.h:5,
>                     from include/linux/acpi.h:39,
>                     from include/acpi/apei.h:9,
>                     from include/acpi/ghes.h:5,
>                     from include/linux/arm_sdei.h:8,
>                     from arch/arm64/kernel/asm-offsets.c:10:
>    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
> >> arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of function 'pud_leaf'; did you mean 'pmd_leaf'? [-Werror=implicit-function-declaration]
>      904 |         return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
>          |                ^~~~~~~~
>          |                pmd_leaf
>    cc1: some warnings being treated as errors
>    make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1199: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:240: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:240: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +904 arch/arm64/include/asm/pgtable.h
> 
> ed928a3402d8a2 Tong Tiangen 2022-05-17  901  
> ed928a3402d8a2 Tong Tiangen 2022-05-17  902  static inline bool pud_user_accessible_page(pud_t pud)
> ed928a3402d8a2 Tong Tiangen 2022-05-17  903  {
> 730a11f982e61a Liu Shixin   2022-11-22 @904  	return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
> ed928a3402d8a2 Tong Tiangen 2022-05-17  905  }
> ed928a3402d8a2 Tong Tiangen 2022-05-17  906  #endif
> ed928a3402d8a2 Tong Tiangen 2022-05-17  907  
> 
> :::::: The code at line 904 was first introduced by commit
> :::::: 730a11f982e61aaef758ab552dfb7c30de79e99b arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
> 
> :::::: TO: Liu Shixin <liushixin2@huawei.com>
> :::::: CC: Will Deacon <will@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

There's another possibly relevant report for riscv:

https://lore.kernel.org/r/202403090900.OwPqmRuI-lkp@intel.com

I think I messed up the nopmd use case.  Since this commit already landed
mm-stable, I assume there's no way I provide a fixup.

I attached a formal patch below, but I don't know how to test it myself,
and I'm not 100% confident.  Before I post a formal patch, can anyone let
me know how I can kickoff the test bot to test the patch (or help me do the
kickoff)?

Thanks,

======8<=======
From acc5598c7af0b7c9a486a49b8c562bb351e8d35b Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Mon, 11 Mar 2024 12:10:45 -0400
Subject: [PATCH] mm: Recover pud_leaf() definitions in nopmd case

This reverts one change in commit 924bd6a8c96767a05323d575bdefd664631dce73.

One issue with that is it broke nopmd builds for at least both arm64 and
riscv (CONFIG_PGTABLE_LEVELS=2).  The other issue is it was overlooked that
it's a common change rather than x86 specific (relevant to the commit
message of the commit).

Normally there's no need for empty definition of pXd_leaf() because of the
fallback functions, however this logic may not apply to pgtable-nopmd.h,
because that's a header that can even be used by arch *pgtable.h headers,
which can use the *_leaf() definitions _before_ the fallback functions are
defined.  Leave it there to pass PGTABLE_LEVELS=2 builds.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403090900.OwPqmRuI-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202403101607.a42gaLOS-lkp@intel.com/
Fixes: 924bd6a8c967 ("mm/x86: drop two unnecessary pud_leaf() definitions")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/asm-generic/pgtable-nopmd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index fa27e16bbe1b..8ffd64e7a24c 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -31,6 +31,7 @@ static inline int pud_none(pud_t pud)		{ return 0; }
 static inline int pud_bad(pud_t pud)		{ return 0; }
 static inline int pud_present(pud_t pud)	{ return 1; }
 static inline int pud_user(pud_t pud)		{ return 0; }
+static inline int pud_leaf(pud_t pud)		{ return 0; }
 static inline void pud_clear(pud_t *pud)	{ }
 #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
 
-- 
2.44.0

