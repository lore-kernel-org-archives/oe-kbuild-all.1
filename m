Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82F99479
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 15:26:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f20215fa70so5041005e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 May 2023 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683213973; x=1685805973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u1wOnpPB7xIGeEMYZRJJJeNQ/vrJNgJZFGyQA0rcjVQ=;
        b=BwWKOTZBb9hiiEmUdThY4iYdcENTO4k/rEYjuqrrSXulcR8g4h4f2RXe5848OdS/Bm
         u/1aOZZbn7UwWcuyurWrRBfO2/2YB1W4F0Aw/PytnGLv9z+6yI012ZHQl3m5qMisWwDU
         dNGSLrQtM/vq+UyC32QtbaB1ZdzpEyb4n2OwOwvP4m9WSOp/9Z5a1rJ4Ds+irIkbSygo
         BHjKFOeRTpdjxy9+RiHXN7lKag5o/wc7uCtuhliJp0AdTHUZd0Z88cESM6Tw+SRgY2CN
         D2Ckpf9p0X+5qW/ikyIXtAjogXjKEphtln+jpHYWSfh2+slZVdkhc4rQy5dCSCd/oULg
         Dpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683213973; x=1685805973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1wOnpPB7xIGeEMYZRJJJeNQ/vrJNgJZFGyQA0rcjVQ=;
        b=fCvGH0MGPeGEvXIzK9AMbJecpVDttkurBfCWH6Xgw/z0L157EPLQOx5FdHi+x3UYff
         /liMwVrSeeJfMY7764Ztn9dB04d1VrhvuFyLzuAHlyy1PyRQDdfWrT3YtQ3gjp2B92jO
         YwsS3nBc0138igZkMOGU6BCCuDdSb1Y+fPI4AwKr6fiC5MaMO2bmudgJVoGkxwRdX7KJ
         fpdiUwrXgXlA+vI46kjC7DNGL+NVaMMnfURyWVooa/sJwG3n/mu4XMLIzJpNQ3YQUndQ
         LRgUZoXaU1huL4NbjmNB+kXow8CLAiMxXtZrVV3Z88/4FrhlgLwd4MyrQMmOC9DlgV5M
         hDPQ==
X-Gm-Message-State: AC+VfDyTEB91E2fdQjk1pW2dEI+/raIJZub7Un9hJqgSg8iSGy/8mjNK
	fhQRVguCwjmj4H1gmTViRsM=
X-Google-Smtp-Source: ACHHUZ5ZEYyOfIRPVl/DbMt17ttDftDHiWGdvGrXCH6fbfGfMlb1QUtEIv7dhf4a6KynVXm1fCQ4lQ==
X-Received: by 2002:a05:600c:b4d:b0:3f1:8430:523 with SMTP id k13-20020a05600c0b4d00b003f184300523mr52054wmr.14.1683213972431;
        Thu, 04 May 2023 08:26:12 -0700 (PDT)
Received: from localhost (host86-156-84-164.range86-156.btcentralplus.com. [86.156.84.164])
        by smtp.gmail.com with ESMTPSA id g22-20020a7bc4d6000000b003f049a42689sm5193109wmk.25.2023.05.04.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:26:11 -0700 (PDT)
Date: Thu, 4 May 2023 16:26:10 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 14552/14714] mm/gup.c:2813:14: error:
 implicit declaration of function 'folio_fast_pin_allowed'; did you mean
 'folio_test_pinned'?
Message-ID: <f59cbdd3-52f5-48fa-bd77-4488fb3fc21a@lucifer.local>
References: <202305042329.Gyk53keD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305042329.Gyk53keD-lkp@intel.com>

On Thu, May 04, 2023 at 11:16:20PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
> commit: 848839c209785a44524fdafa04b0464cd453da1f [14552/14714] mm-gup-disallow-foll_longterm-gup-fast-writing-to-file-backed-mappings-fix
> config: mips-maltaup_xpa_defconfig (https://download.01.org/0day-ci/archive/20230504/202305042329.Gyk53keD-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=848839c209785a44524fdafa04b0464cd453da1f
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 848839c209785a44524fdafa04b0464cd453da1f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305042329.Gyk53keD-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/gup.c: In function 'gup_huge_pmd':
> >> mm/gup.c:2813:14: error: implicit declaration of function 'folio_fast_pin_allowed'; did you mean 'folio_test_pinned'? [-Werror=implicit-function-declaration]
>     2813 |         if (!folio_fast_pin_allowed(folio, flags)) {
>          |              ^~~~~~~~~~~~~~~~~~~~~~
>          |              folio_test_pinned
>    cc1: some warnings being treated as errors
>
>
> vim +2813 mm/gup.c
>
> cbd34da7dc9afd Christoph Hellwig       2019-07-11  2782
> 2667f50e8b8145 Steve Capper            2014-10-09  2783  static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
> 0cd22afdcea21f John Hubbard            2019-10-18  2784  			unsigned long end, unsigned int flags,
> 0cd22afdcea21f John Hubbard            2019-10-18  2785  			struct page **pages, int *nr)
> 2667f50e8b8145 Steve Capper            2014-10-09  2786  {
> 667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2787) 	struct page *page;
> 667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2788) 	struct folio *folio;
> 2667f50e8b8145 Steve Capper            2014-10-09  2789  	int refs;
> 2667f50e8b8145 Steve Capper            2014-10-09  2790
> b798bec4741bdd Ira Weiny               2019-05-13  2791  	if (!pmd_access_permitted(orig, flags & FOLL_WRITE))
> 2667f50e8b8145 Steve Capper            2014-10-09  2792  		return 0;
> 2667f50e8b8145 Steve Capper            2014-10-09  2793
> 7af75561e17132 Ira Weiny               2019-05-13  2794  	if (pmd_devmap(orig)) {
> 7af75561e17132 Ira Weiny               2019-05-13  2795  		if (unlikely(flags & FOLL_LONGTERM))
> 7af75561e17132 Ira Weiny               2019-05-13  2796  			return 0;
> 86dfbed49f88fd John Hubbard            2020-04-01  2797  		return __gup_device_huge_pmd(orig, pmdp, addr, end, flags,
> 86dfbed49f88fd John Hubbard            2020-04-01  2798  					     pages, nr);
> 7af75561e17132 Ira Weiny               2019-05-13  2799  	}
> b59f65fa076a8e Kirill A. Shutemov      2017-03-16  2800
> c228afb11ac693 Matthew Wilcox (Oracle  2022-01-07  2801) 	page = nth_page(pmd_page(orig), (addr & ~PMD_MASK) >> PAGE_SHIFT);
> a43e982082c24c John Hubbard            2020-01-30  2802  	refs = record_subpages(page, addr, end, pages + *nr);
> 2667f50e8b8145 Steve Capper            2014-10-09  2803
> 667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2804) 	folio = try_grab_folio(page, refs, flags);
> 667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2805) 	if (!folio)
> 2667f50e8b8145 Steve Capper            2014-10-09  2806  		return 0;
> 2667f50e8b8145 Steve Capper            2014-10-09  2807
> 2667f50e8b8145 Steve Capper            2014-10-09  2808  	if (unlikely(pmd_val(orig) != pmd_val(*pmdp))) {
> 667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2809) 		gup_put_folio(folio, refs, flags);
> 2667f50e8b8145 Steve Capper            2014-10-09  2810  		return 0;
> 2667f50e8b8145 Steve Capper            2014-10-09  2811  	}
> 2667f50e8b8145 Steve Capper            2014-10-09  2812
> 369dd755eb2530 Lorenzo Stoakes         2023-05-02 @2813  	if (!folio_fast_pin_allowed(folio, flags)) {
> 369dd755eb2530 Lorenzo Stoakes         2023-05-02  2814  		gup_put_folio(folio, refs, flags);
> 369dd755eb2530 Lorenzo Stoakes         2023-05-02  2815  		return 0;
> 369dd755eb2530 Lorenzo Stoakes         2023-05-02  2816  	}
> 84209e87c6963f David Hildenbrand       2022-11-16  2817  	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> a7f226604170ac David Hildenbrand       2022-05-09  2818  		gup_put_folio(folio, refs, flags);
> a7f226604170ac David Hildenbrand       2022-05-09  2819  		return 0;
> a7f226604170ac David Hildenbrand       2022-05-09  2820  	}
> a7f226604170ac David Hildenbrand       2022-05-09  2821
> a43e982082c24c John Hubbard            2020-01-30  2822  	*nr += refs;
> 667ed1f7bb3b1c Matthew Wilcox (Oracle  2021-12-22  2823) 	folio_set_referenced(folio);
> 2667f50e8b8145 Steve Capper            2014-10-09  2824  	return 1;
> 2667f50e8b8145 Steve Capper            2014-10-09  2825  }
> 2667f50e8b8145 Steve Capper            2014-10-09  2826
>
> :::::: The code at line 2813 was first introduced by commit
> :::::: 369dd755eb25309495d67de7cd85b77e0bc0f948 mm/gup: disallow FOLL_LONGTERM GUP-fast writing to file-backed mappings
>
> :::::: TO: Lorenzo Stoakes <lstoakes@gmail.com>
> :::::: CC: Andrew Morton <akpm@linux-foundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

Yeah I think Andrew's fix didn't quite cover all arches, I'll fix this up
in a v9. Just needs some juggling around with #ifdef's :)
