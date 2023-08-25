Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5319883
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 22:21:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bba48b0bd2so11194595ad.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 15:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693002063; x=1693606863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1xa8prIdsBQjNvtnPupAdpmbvqUQpx2wGPHxJGeCx7U=;
        b=A/WUbUBvQ115w1LsdART9sq/BAiB1k/slZdAi2Um4AcfX9f4rUBK4Re68FXRm3WEHu
         /z8klWcZZdAIXfO/3MiSCRkayW6uCfDyS9Q9z98m7I5UqCo8DKTxDlpEw/y1iuVBSGRm
         DRRwi+HT5iwV/pZ1/+7o2ppmzJUB+CSOzrljk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002063; x=1693606863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xa8prIdsBQjNvtnPupAdpmbvqUQpx2wGPHxJGeCx7U=;
        b=kyobtbaOxdhd2Bm0k1ZXrpNYYqhPgFfQ8id9ZpShrRKjDQuaD8wmsJnhr34+mT/R8m
         h6iminz6IDIBCXjX3QRBkZ/vTOwe7xoI3cdFddq1snhBpyhNanvjmECStt0vPkgdfRMh
         VcD6/hk80IGk1NvcezKa2XwU7TCSMqmyeUDxa6ZGUgSse+m9tK0asN99TRgs2bcMqcdW
         p8JdENhNftaJhIuPG0X55bKyfQwyC/2f8uNejvRbr8eVvxiIMkPOLCwdVxqNhLJepjyo
         cHz+UYpeiT0e61UXKLDajj6AqNRcmbRxtpQeTaLU0ufepDyWpFkWiqzXyhXSu0xHokOM
         oQ1g==
X-Gm-Message-State: AOJu0YwFUo7rSsMLhOHRkKuYVYjQAFjKp2MkfCr0j8PegIY46osyoRHH
	KydSUNVgURS6eRksA9kxW1O3/Q==
X-Google-Smtp-Source: AGHT+IF4466A+IfBkOf7VZMsidP/u/3r/P+te0XF2jVqXAXqZrsXSWc6SPMTxGsolO1WdHMv7mn0mQ==
X-Received: by 2002:a17:902:ced1:b0:1be:1fc:8ce0 with SMTP id d17-20020a170902ced100b001be01fc8ce0mr19340212plg.12.1693002063365;
        Fri, 25 Aug 2023 15:21:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc930d4517sm2294374pln.42.2023.08.25.15.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:21:02 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:21:02 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [stable:linux-5.10.y 53/9999]
 ../lib/gcc/aarch64-linux/13.2.0/plugin/include/c-family/c-common.h:173:10:
 fatal error: cp/cp-trait.def: No such file or directory
Message-ID: <202308251517.DDE5E096E9@keescook>
References: <202308241133.a9KtOHsj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308241133.a9KtOHsj-lkp@intel.com>

On Thu, Aug 24, 2023 at 12:00:42PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
> head:   da742ebfa00c3add4a358dd79ec92161c07e1435

This is 5.10.191.

> commit: 1eee36a5520b5a89fb4d0d6af6f9cb0217a3164f [53/9999] gcc-plugins: simplify GCC plugin-dev capability test
> config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230824/202308241133.a9KtOHsj-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241133.a9KtOHsj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308241133.a9KtOHsj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from /usr/include/c++/12/initializer_list:36,
>                     from ../lib/gcc/aarch64-linux/13.2.0/plugin/include/system.h:242,
>                     from ../lib/gcc/aarch64-linux/13.2.0/plugin/include/gcc-plugin.h:28,
>                     from scripts/gcc-plugins/gcc-common.h:7,
>                     from scripts/gcc-plugins/latent_entropy_plugin.c:78:
>    /usr/include/c++/12/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
>       32 | #error This file requires compiler and library support \
>          |  ^~~~~

I think this was fixed in later commits. I see these two mention it, at
least:

30455322787aee4bb95dcaabdcfcfaab69a1a8f0
9fc17c3af56cd0a3e501bf11e68650265096f1a2

Anyway, I guess I meant to say: If 5.10.191 still gives this error for
you, please let me know. If not, this is just an unfortunate bisection
glitch.

-Kees

-- 
Kees Cook
