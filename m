Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C58A28
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Dec 2022 00:35:25 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id jn7so3201940plb.13
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Dec 2022 16:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kwP5HcBF+fgUi/kKFaJ4xv8JAo6gbyWvQve+daSpqhY=;
        b=kOmuyKfNLbpiXl+TQfql3B5Bqpu+wn5veS+rx409QF/AQ1VxlGTkAMlFcf65me/CcH
         trPOVLGIaU0I6tryrM9zdQRBPdpd+KbDTPExQAqT5ncmP8G8B2QqOLVCwOfO7oPVSSB+
         4Uo5OKWgZv8W0/yk0HsI2eMN8+dugRyxdid+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwP5HcBF+fgUi/kKFaJ4xv8JAo6gbyWvQve+daSpqhY=;
        b=jwA4YkEj+mzMedo5+yjUURRh5oqDt/4zZsqfAFWyfI5QVbgP5IvDVS25GjttufGh+P
         p7WUkl8uExIpWu4l3X5NAydo3EOPUOzzSTV33luAvT9bGl53cHS0KYHYXV70NKf4Oe2U
         GQEvDa+vlZ85geY6PyLOjcR5ZotcnLTaXCCi7GXLF3XGUfj/9PgncHGZt35iIb0G57ce
         6xGfTaVhVDuZW6TZal4BoVV6XXjPDoueSxGofQl0DCBlxV62W4XVVY33lwuvsNbcauAG
         cZGPhu0XMi+hfhSTs8V5JCx+PvKLxAr5IBhTpC5w0oWU8j6YCjHOTJhWH06NMTfojkLg
         CUcA==
X-Gm-Message-State: ANoB5pmxarC7IprlduB8X0nOg9VgNSLcyRELN9TVgZKNOo4mXSDuJ6RS
	YUyiihxKd8V2VUoS0EqRx0g26Q==
X-Google-Smtp-Source: AA0mqf4dHitAUKJftdOplFruo5ficLsZOByUDzPKchriOKqVeeqjRAVCNStAziR0fva4gU8CybR5Cw==
X-Received: by 2002:a17:90a:b946:b0:213:d7cc:39cb with SMTP id f6-20020a17090ab94600b00213d7cc39cbmr78732576pjw.144.1669941325242;
        Thu, 01 Dec 2022 16:35:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a564f00b001ef8ab65052sm3566016pji.11.2022.12.01.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 16:35:24 -0800 (PST)
Date: Thu, 1 Dec 2022 16:35:23 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: include/linux/fortify-string.h:50:33: warning:
 '__builtin_memset' offset [0, 7] is out of the bounds [0, 0]
Message-ID: <202212011632.C56CEB7B@keescook>
References: <202211271212.SUZSC9f9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211271212.SUZSC9f9-lkp@intel.com>

On Sun, Nov 27, 2022 at 12:37:10PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   faf68e3523c21d07c5f7fdabd0daf6301ff8db3f
> commit: ba38961a069b0d8d03b53218a6c29d737577d448 um: Enable FORTIFY_SOURCE
> date:   3 months ago
> config: um-allyesconfig
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ba38961a069b0d8d03b53218a6c29d737577d448
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ba38961a069b0d8d03b53218a6c29d737577d448
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=um SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:253,
>                     from include/linux/bitmap.h:11,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/mm_types_task.h:14,
>                     from include/linux/mm_types.h:5,
>                     from include/linux/buildid.h:5,
>                     from include/linux/module.h:14,
>                     from arch/um/drivers/virt-pci.c:6:
>    arch/um/drivers/virt-pci.c: In function 'um_pci_send_cmd':
>    include/linux/fortify-string.h:48:33: warning: argument 1 null where non-null expected [-Wnonnull]
>       48 | #define __underlying_memcpy     __builtin_memcpy
>          |                                 ^
>    include/linux/fortify-string.h:438:9: note: in expansion of macro '__underlying_memcpy'
>      438 |         __underlying_##op(p, q, __fortify_size);                        \
>          |         ^~~~~~~~~~~~~
>    include/linux/fortify-string.h:483:26: note: in expansion of macro '__fortify_memcpy_chk'
>      483 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>          |                          ^~~~~~~~~~~~~~~~~~~~
>    arch/um/drivers/virt-pci.c:100:9: note: in expansion of macro 'memcpy'
>      100 |         memcpy(buf, cmd, cmd_size);
>          |         ^~~~~~
>    include/linux/fortify-string.h:48:33: note: in a call to built-in function '__builtin_memcpy'
>       48 | #define __underlying_memcpy     __builtin_memcpy
>          |                                 ^
>    include/linux/fortify-string.h:438:9: note: in expansion of macro '__underlying_memcpy'
>      438 |         __underlying_##op(p, q, __fortify_size);                        \
>          |         ^~~~~~~~~~~~~
>    include/linux/fortify-string.h:483:26: note: in expansion of macro '__fortify_memcpy_chk'
>      483 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>          |                          ^~~~~~~~~~~~~~~~~~~~
>    arch/um/drivers/virt-pci.c:100:9: note: in expansion of macro 'memcpy'
>      100 |         memcpy(buf, cmd, cmd_size);
>          |         ^~~~~~
>    arch/um/drivers/virt-pci.c: In function 'um_pci_cfgspace_read':
> >> include/linux/fortify-string.h:50:33: warning: '__builtin_memset' offset [0, 7] is out of the bounds [0, 0] [-Warray-bounds]
>       50 | #define __underlying_memset     __builtin_memset
>          |                                 ^
>    include/linux/fortify-string.h:316:9: note: in expansion of macro '__underlying_memset'
>      316 |         __underlying_memset(p, c, __fortify_size);                      \
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/fortify-string.h:323:25: note: in expansion of macro '__fortify_memset_chk'
>      323 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
>          |                         ^~~~~~~~~~~~~~~~~~~~
>    arch/um/drivers/virt-pci.c:192:9: note: in expansion of macro 'memset'
>      192 |         memset(buf->data, 0xff, sizeof(buf->data));
>          |         ^~~~~~

I had noticed this too while running kunit tests, but never tracked it
down. That's done now. Patch sent:

https://lore.kernel.org/lkml/20221202003137.never.887-kees@kernel.org

Thanks!

-Kees

-- 
Kees Cook
