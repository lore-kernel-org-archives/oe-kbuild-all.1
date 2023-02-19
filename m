Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD48210F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 14:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F33C433D2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676817850;
	bh=GL7O+j4XeBP4ZqCzQdZsyeen71CJZrhF36ICuVQJqvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KaizzWB9klksEz5DiTA8Ln7ufouvmE6SZqDboAMfkdpkJPJ3sijKvcJJvxvVXkwYL
	 hxRrJhPEiha/iYXQaDn5Sv0dggTIbqvlGGpZIrzyH3FSl4Qn4yV+iz4JFicsHcTn5b
	 fhvRfjEn3V+9u7cZnhIpwJApFQxhl+JxAj+JKUUIeo2aE7L9jd3nKTHoqS7J6MtsLD
	 //gYup6oAvpzr/SlFdl+lsWflkjTN5GRKrdu6SaOhK1JwRFd5HNGtlcxxOgZ4ZtOJp
	 lW0n1RudWRG1Y0pSA2vRbSzEskmo4Rigi4A/uB6BR1/LNU78jep3snJ1JnA4JGl961
	 X4YwXuR8+DXRQ==
Received: by mail-oi1-f178.google.com with SMTP id s19so1238979oiw.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 06:44:09 -0800 (PST)
X-Gm-Message-State: AO0yUKVR15TFhPPL1wHOnWwdTH1c88zzKmTc7TSckX1HIuZdLQIzKKSB
	oS+Kf/+Ff43J3IWz0DHGobe5c6b8zZ7VKxCQ4aY=
X-Google-Smtp-Source: AK7set9VHD3Kw/2+R+jiUFD4SpFjwpiEfgbRYKNgTT33twjoLDTA6dy22s5y9iHIwKoNj9UUMNVZnTFsPRS1G4/j5To=
X-Received: by 2002:a05:6808:3203:b0:37a:bc9f:afe7 with SMTP id
 cb3-20020a056808320300b0037abc9fafe7mr591711oib.56.1676817849273; Sun, 19 Feb
 2023 06:44:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202302190641.30VVXnPb-lkp@intel.com> <901d5e4c-c5b3-5315-3789-93d50a280d3f@infradead.org>
In-Reply-To: <901d5e4c-c5b3-5315-3789-93d50a280d3f@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 19 Feb 2023 23:43:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5gTDWam2F_u2+Qc0qTh7twGvMhOvWpbwbMo_Z-3zjzw@mail.gmail.com>
Message-ID: <CAK7LNAS5gTDWam2F_u2+Qc0qTh7twGvMhOvWpbwbMo_Z-3zjzw@mail.gmail.com>
Subject: Re: cc1: error: arch/sh/include/mach-hp6xx: No such file or directory
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 19, 2023 at 3:44 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi Yamada,
>
> On 2/18/23 14:35, kernel test robot wrote:
> > Hi Masahiro,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   5e725d112e1a54c2611d5dffd124a79415d0f0de
> > commit: 4c8dd95a723d9cccf8810be54aa62be82885c9d8 kbuild: add some extra warning flags unconditionally
> > date:   3 years, 9 months ago
> > config: sh-randconfig-r021-20230219 (https://download.01.org/0day-ci/archive/20230219/202302190641.30VVXnPb-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c8dd95a723d9cccf8810be54aa62be82885c9d8
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 4c8dd95a723d9cccf8810be54aa62be82885c9d8
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202302190641.30VVXnPb-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
>
> I don't know what has caused this, but if I do this patch, there are no -Werror=missing-include-dirs
> problems with this build:
>
>
> diff -- a/arch/sh/Makefile b/arch/sh/Makefile
> --- a/arch/sh/Makefile
> +++ b/arch/sh/Makefile
> @@ -116,7 +116,7 @@ export ld-bfd
>
>  # Mach groups
>  machdir-$(CONFIG_SOLUTION_ENGINE)              += mach-se
> -machdir-$(CONFIG_SH_HP6XX)                     += mach-hp6xx
> +machdir-$(CONFIG_SH_HP6XX)                     += ../boards/mach-hp6xx
>  machdir-$(CONFIG_SH_DREAMCAST)                 += mach-dreamcast
>  machdir-$(CONFIG_SH_SH03)                      += mach-sh03
>  machdir-$(CONFIG_SH_RTS7751R2D)                        += mach-r2d
>
> Ideas?


Interesting way to suppress the warning.  :-D



I hope this will work:

https://lore.kernel.org/linux-kbuild/20230219141555.2308306-1-masahiroy@kernel.org/T/#m4f5e0d4589f48d4415da643f957b670b24b2e82c









-- 
Best Regards
Masahiro Yamada
