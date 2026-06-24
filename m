Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65B2F531B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 03:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782270833; cv=none; b=jQTz4t9eBUfMDV87UEq8ebISbEFTo8OtKec2QWNThE9tkdDlbji+G21aNoUtP4fBgoTpvD+46hBxcGHGqYpu2AkSXm7KqNuZbvuPvA2oZW1g9P3/FjGNLKXh5VsCIAsOvUjUN9oxOZGU4+bE8beoTuJ81RkXnhasm2PWA4AXkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782270833; c=relaxed/simple;
	bh=C4jlcWPhrC0wzybY0QxDLLJr2pfB4v1cPwav+EQZ+Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKcojPDs+xuxFAWKU8noPZa2Bd6l6aoBoy9QAXi4OvX3ZjK46WGi80ei5uts2xabRb32ghyzHaC4Nj3Bsuz13+4D4TvcNfKxhNE5mX7ujwlEyv48owep/NR92FOGQVQ4Y71IcbEx6VxECOh7PFkjwcAZEzI1tyIuZ1CiWl40I08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3GNtIhG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3GNtIhG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c0efc7ef797so79206666b.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 20:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782270831; x=1782875631; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQrzuV1rnE++lwljv+0k3oMRhBJ0TRHfGR8h8CiTgyE=;
        b=C3GNtIhGQWNbscWPNncQPUAQ+Hm64WoyleRZuwicn6GzDfkYAuiVQ3ae1Ny6rgkReT
         ZbOYLIhR0CVTq8VDeHOanUTA18aQVosb1uNFGUsmvJha2OO9zPouzXf6sMUbt643ni9x
         +KjiZPoXhGDB23K5epygIajtaGdobrZ4KgslroafqfOv2C9MqlU6XxrpobBj48Q7oaPV
         I+ln7J1aLdtHpNI04ZgTURR3TIMY7FoKh1BxtsZh9DSp8mB0ooKqho7PBNLIHlwDI1ce
         IaujPIkFnNak56C1/wEorh1aBoZS64ft3eNOgPAWy8S/cp0JhhhgXxcwgE24gUwNT7nC
         FETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782270831; x=1782875631;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQrzuV1rnE++lwljv+0k3oMRhBJ0TRHfGR8h8CiTgyE=;
        b=Y6Bp4ARJdhMnp2/7NYWfrSbGfkfcyvHq3c8GXb9jkPH1CU9/+ore3X9vHvW5xt4zj2
         IRfutQJ77mEJxX1gHr7AXVazjBrfWdnUyozIOvcxshY7ZIXQ3wFRPxOAYxNrC5GwIHYa
         6LfXdOfH2oBv87VSYstpmqwI4shLNwIAR5LqxNjIDUeio1cqCszj0Ndo1OvoNw+oNOKW
         YaoqeYsVNa+QT45NsESelQfNx5UcQf5VO5Vks6UootKM3g0nYzXFjOuqfRkqS6v1PlkH
         mW+zFzGikXFK15yhFqPP5QOtJavZJOTAu2aEZIeHyL9RMrXl8iyrgp3oXq5yLrO61lQ/
         OJUw==
X-Forwarded-Encrypted: i=1; AFNElJ99Zlo4KjzseiOqd/xLnHlw9F7yRr6RJZG4pXQPBgldaK2pnqaUtJppeGXgdApiRaZC3BGBP0zO7KoQh2d1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0W97xFeMKA1hZ/xSc4WDf4KH00daucc2WYYBk2Unu3EyQKSdS
	luRqN5zqy1icyxjxYJUorQ6SpolblByRQP0lbjIIeYl6MF3rneu0uZtf
X-Gm-Gg: AfdE7cnhwIdFYY3XCJ4DCz9n3/2r2bdGGcAFNguq5qNnzAzFa6HwWVXLab8Ki3z6aky
	3MFW/sJ7RUBlZ/NfEgeII/nL25ua5sQrEvwRqaHvm0k6zKa6ALGg+UgoRPdIz1jaKrxnDJxEwf1
	gu4u4ifkNZ4erI4NeCayAjd4AjuZv489GQjGKLxIIQYK466T7TjcxCDBh5ydOSzaZBF/aZFQS52
	vOa3U+jQJ9jKlAzFnAobeBqhe3E01C9zZQ4ghQx1IGJFdi03HrhMg3JdubibVhoPAL5iguUVWDA
	rQ19XkzpYFwx86qWnnGcLPrFSgKK1C/5iRoWz5aNKGnGveZm3GALHZEyH7YJS8ZAyU0qF6l/APZ
	A9YQC1f7dqJDrixDTTPEEKa+iJ5S70VTn4OY6zXgJTWrGmWF1ZzGvxnwNtPSZEytzSnbz6JSqUZ
	iuAPZQYKleroo=
X-Received: by 2002:a17:907:1c1c:b0:c09:4ad0:9a3 with SMTP id a640c23a62f3a-c119ce7c34dmr60766066b.4.1782270830624;
        Tue, 23 Jun 2026 20:13:50 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ade18esm362886a12.7.2026.06.23.20.13.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2026 20:13:49 -0700 (PDT)
Date: Wed, 24 Jun 2026 03:13:47 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, riel@surriel.com,
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org,
	jannh@google.com, sj@kernel.org, ziy@nvidia.com, balbirs@nvidia.com,
	oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_vma_mapped: revalidate and do proper check
 before return device-private pmd
Message-ID: <20260624031347.zq2lhnnthuxqcuql@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260622130651.23359-1-richard.weiyang@gmail.com>
 <202606240042.ffPsEXVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606240042.ffPsEXVc-lkp@intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Jun 24, 2026 at 12:18:20AM +0800, kernel test robot wrote:
>Hi Wei,
>
>kernel test robot noticed the following build errors:
>

Thanks for reporting.

>[auto build test ERROR on akpm-mm/mm-everything]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-page_vma_mapped-revalidate-and-do-proper-check-before-return-device-private-pmd/20260623-012838
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>patch link:    https://lore.kernel.org/r/20260622130651.23359-1-richard.weiyang%40gmail.com
>patch subject: [PATCH] mm/page_vma_mapped: revalidate and do proper check before return device-private pmd
>config: parisc-randconfig-002-20260623 (https://download.01.org/0day-ci/archive/20260624/202606240042.ffPsEXVc-lkp@intel.com/config)

So this is parisc arch.

In the config file, HAVE_ARCH_TRANSPARENT_HUGEPAGE is not defined. Which leads
to !TRANSPARENT_HUGEPAGE and !PGTABLE_HAS_HUGE_LEAVES.

And then trigger the BUILD_BUG().

>compiler: hppa-linux-gcc (GCC) 8.5.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240042.ffPsEXVc-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202606240042.ffPsEXVc-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>   In file included from <command-line>:
>   In function 'check_pmd.isra.24',
>       inlined from 'page_vma_mapped_walk' at mm/page_vma_mapped.c:283:11:
>>> include/linux/compiler_types.h:699:38: error: call to '__compiletime_assert_406' declared with attribute error: BUILD_BUG failed
>     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                         ^
>   include/linux/compiler_types.h:680:4: note: in definition of macro '__compiletime_assert'
>       prefix ## suffix();    \
>       ^~~~~~
>   include/linux/compiler_types.h:699:2: note: in expansion of macro '_compiletime_assert'
>     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>     ^~~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                        ^~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                        ^~~~~~~~~~~~~~~~
>   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
>    #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>                               ^~~~~~~~~
>   include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
>    #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
>                             ^~~~~~~~~~~~~~~
>   include/linux/huge_mm.h:118:26: note: in expansion of macro 'HPAGE_PMD_ORDER'
>    #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
>                             ^~~~~~~~~~~~~~~
>   mm/page_vma_mapped.c:142:13: note: in expansion of macro 'HPAGE_PMD_NR'
>     if ((pfn + HPAGE_PMD_NR - 1) < pvmw->pfn)
>                ^~~~~~~~~~~~
>

This is in definition of check_pmd() which is already in kernel for a while.

I will update current version, and take a look to how to fix it.

>
>vim +/__compiletime_assert_406 +699 include/linux/compiler_types.h
>
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  685  
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  686  #define _compiletime_assert(condition, msg, prefix, suffix) \
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  687  	__compiletime_assert(condition, msg, prefix, suffix)
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  /**
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  690   * compiletime_assert - break build and emit msg if condition is false
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  691   * @condition: a compile-time constant condition to check
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  692   * @msg:       a message to emit if condition is false
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   *
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * In tradition of POSIX assert, this macro will break the build if the
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * supplied condition is *false*, emitting the supplied error message if the
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   * compiler has support to do so.
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   */
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  698  #define compiletime_assert(condition, msg) \
>eb5c2d4b45e3d2d Will Deacon 2020-07-21 @699  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>eb5c2d4b45e3d2d Will Deacon 2020-07-21  700  
>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki

-- 
Wei Yang
Help you, Help me
