Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B70D3217
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 19:04:59 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id n2so3169981pgb.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 04 Feb 2023 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mUn8Be+13vClnnWtDHhooL/sMdhScbk/CUaqeF1Jz/c=;
        b=eZ+Bv1VyGuF71emj1OfSwnYB6cRwoh57JmKX11uj0dzbtyuVBjMob2zIcxttGLc0rN
         yKgRxWYsP/EiLcbwVLPe1cpO5OaMXpn/LCXP/nWV+KzWkea6cNi5RtclQQRw+pLi33oF
         FtQIl6uJRwT7ggEf9TXtvn+bGDxLggiuV9f8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUn8Be+13vClnnWtDHhooL/sMdhScbk/CUaqeF1Jz/c=;
        b=PtcUlqin1EKSimqHrnyGvAIqAc/OQbyyBv9Sha7fhhwlC5dCiu15HZApUAAqZRxcZ8
         HWxTuHWpDO7kboCo8UWqHpTLPtLFG6oY2ewpnFJWHFfENumZRV9r6dK/PbVwxAfTfPmM
         mn3EfqYPSihBmPOuF74I4PCTdlfWqmzQ+1A3VN/n/X8rf3/mmYGlANX1rsfNohrQeJOJ
         1Xu1BoAViG3Wq2UEeK2JSJ1Q1/QiA14XZoW+TkD6VJR2j35vnEMHMHwhUyLzzNkO1r5O
         sY5NCKr7AWP1gqoj+qksWaohYoaWtuoGEVVnEi0ObMx6MRPRUQgs3e4Ggrt9iUzU/qei
         m0ng==
X-Gm-Message-State: AO0yUKWyscaqO+iW6qEzm+TcP78Ux6Doo+3l78DLQwkSxba9fAjkWoeN
	APfoCw6V6DaMRNck822YxxXxkw==
X-Google-Smtp-Source: AK7set83qkJxD4lzMtiKTpmzF/z5pc/vprk7I0w8i06Qqg7WrjqIzdY10adnfNPiFPhlDmGTgVvm8A==
X-Received: by 2002:a05:6a00:1ace:b0:593:b422:f11d with SMTP id f14-20020a056a001ace00b00593b422f11dmr16783228pfv.30.1675537498785;
        Sat, 04 Feb 2023 11:04:58 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b64-20020a621b43000000b0058d92d6e4ddsm4055403pfb.5.2023.02.04.11.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 11:04:58 -0800 (PST)
Message-ID: <63deac5a.620a0220.2c25e.6cf0@mx.google.com>
X-Google-Original-Message-ID: <202302041104.@keescook>
Date: Sat, 4 Feb 2023 11:04:57 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [kees:for-next/kspp 19/19] lib/ubsan.c:27:13: warning: no
 previous prototype for 'report_ubsan_failure'
References: <202302041600.oGDByVG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302041600.oGDByVG5-lkp@intel.com>

On Sat, Feb 04, 2023 at 04:45:49PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
> head:   eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd
> commit: eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd [19/19] arm64: Support Clang UBSAN trap codes for better reporting
> config: s390-randconfig-r044-20230204 (https://download.01.org/0day-ci/archive/20230204/202302041600.oGDByVG5-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd
>         git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
>         git fetch --no-tags kees for-next/kspp
>         git checkout eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/ubsan.c:27:13: warning: no previous prototype for 'report_ubsan_failure' [-Wmissing-prototypes]
>       27 | const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
>          |             ^~~~~~~~~~~~~~~~~~~~

Thanks! I'll get this fixed.

-- 
Kees Cook
