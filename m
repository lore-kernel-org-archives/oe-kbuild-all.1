Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C043BB113
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035272; cv=none; b=XW/ZtZHkUD0qAVzHiYV5L46KSIfIKTKb2c887/4MLY8MpN1sLQDIIv6hw93oUodj7jTg/M8nUZmAbKXdxLuQ9ToE+ZFgWUu3hk2on5focZA503kDUC3N4Z/+AprmFd5Cjdnk62ivUPjTaQnjxYnS1HiLY16AWxIgci56jKUxgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035272; c=relaxed/simple;
	bh=Rw5xn6MDUzprJXALhd12R93b+y4cMokXqUcGPM/Ln7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj4m40dfChmIlyfVgjuLBss24MFAWxkJUPtkvRYMLnprry6WT0EDBLU+6InY11soUqJ9dOgDodrQFm3GOZquxAYcyGhb/vO6rZkOrhup9pAgJJEUGUSEkLAN4to94XSUNE9rxvmMviUzT+fAZw/KFzztDshDIBW8XLk8fduTfbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c83364233eso1033395e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 03:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035269; x=1789640069;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5pyFaModjtGkctdZvggQo6mIBpUFRdaaBsGlklIYms=;
        b=UQIqcqrYhl35A/6H7xMAk3r2JJsSUN3QK3xLXkrHJRejkP5QhqHl6rODXSnm09gkUz
         6sg0Fjw/rs9bYlrLpilUgQZYmPFRt8B6MXBaHIqLkKverbXvRnqab7RuGv+mZSQuUQSY
         tlg5XqUyE+N+re6KbSNMlvP7/nNERKTJjgd9SpPdi0WY4L9vFj7ojP2zRH5yX4LAnJn/
         3U9cPZivxmKKuSPXCpZJEps3pfoBENZlzdnps2tgyACzfdLfUPFnEOfDfxGgcoqjEgE3
         o7y9paOJc9sLae9NiwLk7DzQG2uIpvveywidYxPlgKSXnR2icpeGayCjsKU9ZxUz8b0r
         4X4A==
X-Forwarded-Encrypted: i=1; AKwUvBzPboSqbFK5U5ECqlrgA9ZLS6i9XSU4Kwoi38RK110FUgY+Q+Gw/8rhYF7vD9N9Pbm4TFczrF2gNMJx/sBi@lists.linux.dev
X-Gm-Message-State: AFuF++nFycMgeDffrDDKdEH9RYMheZmTXG91UUE3oCTMehIGBT3B/vDe
	8CqeSBZTG+Q18CyMD9elpCDtCzQizqSL/G/UUIh7lIC5GUnwtQMdmdIBrnnopMkQHaw=
X-Gm-Gg: AYBFou1ayGdpBFIxJs6NI6yejYXpM3Oh1GJwzLQqAC6e64jnY5B3GHRr28tot9zlT5E
	zQKINbrKahklnKE6IP1etBkjaw5mncwgE5CeFVa+ZagqMPqc/0owSBnBAvFGI37/7Vrt4Y1GS0e
	eTn7/rn3DPweL5+cDImIyYmFMT0UBYJj7HozSYGXDzwZUPIDzUndEto7DaiTVSAK1H5LRJal+1n
	O9cge6cA1C7JdAxNrjjQdNEMmlETlWjEv+F+jJiU6cN/ohK4vDURAxyI6hbdO6mLTbp6T5Iu8wP
	YtR5FiSxOBoNToQm5fJFTCqnORr1nYhYUVZRMp1Ld1tQLOikGIM7DMk3NoxYw5i+qCo9IHRVhm/
	C2A4f3i+bgFsA6YkoPpgf9r3MNi53KielhFqnjmGwpk1NTf1nlfdY7G206Hs+QZ3YeJHDHAGYAe
	uQErCt+biZSFP7pLUq9rh5m40mYtrQPq9SdilHqelKCPNN4/C/zTSCuovUac235kGKwARx2bRcb
	shL2BFoSMRQeoxaPKz8tkxkc3wdDJO7Fbax
X-Received: by 2002:a05:6122:881:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c7ed7cba16mr23062973e0c.6.1789035269254;
        Thu, 10 Sep 2026 03:14:29 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c827384808sm4886519e0c.8.2026.09.10.03.14.28
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:14:28 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98089686ee7so3974798241.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 03:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx88HiLu45NudjZG//6eXV5tt5AXVq4jEkH9l7R4fOEPYWlkJqeXc6WV1G63jKyQR4UqH46crxsl35EgvgG@lists.linux.dev
X-Received: by 2002:a05:6102:6b03:b0:77b:ae7:1bba with SMTP id
 ada2fe7eead31-78a4a72eac3mr22223768137.3.1789035268749; Thu, 10 Sep 2026
 03:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609101334.xgbNoC4e-lkp@intel.com>
In-Reply-To: <202609101334.xgbNoC4e-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2026 12:14:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com>
X-Gm-Features: AcwNN1WahnoAKM5bWAzumRTegPpUxaUzjYyd7D5gHP2WgaVBSlpot3X8X8LLi68
Message-ID: <CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com>
Subject: Re: [geert-renesas-drivers:renesas-clk-for-v7.4 16/16]
 drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
 identifier '__free_kfree'; did you mean '__free_pages'?
To: kernel test robot <lkp@intel.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Thu, 10 Sept 2026 at 07:34, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v7.4
> head:   810b8b6c4e02c40991c29491cec09ebdaf5ec6d0
> commit: 810b8b6c4e02c40991c29491cec09ebdaf5ec6d0 [16/16] clk: renesas: r9a09g077: Register SYSC regmap
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101334.xgbNoC4e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                          ^~~~~~~~~~~~~
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^~~~~~~~~~~~~~
>    <scratch space>:3:1: note: expanded from here
>        3 | __free_kfree
>          | ^~~~~~~~~~~~
>    include/linux/gfp.h:342:13: note: '__free_pages' declared here
>      342 | extern void __free_pages(struct page *page, unsigned int order);
>          |             ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function '__free_pages' must take 1 parameter
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                          ^
>    include/linux/cleanup.h:213:33: note: expanded from macro '__free'
>      213 | #define __free(_name)   __cleanup(__free_##_name)
>          |                                   ^
>    <scratch space>:3:1: note: expanded from here
>        3 | __free_kfree
>          | ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                                                          ^
> >> drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer to pointer conversion initializing 'struct regmap_config *' with an expression of type 'int' [-Wint-conversion]
>      966 |         struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
>          |                               ^                          ~~~~~~~~~~~~~~~~~~~~~~~~
>    4 errors generated.

Thanks, will amend with:

+#include <linux/cleanup.h>
+#include <linux/slab.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
