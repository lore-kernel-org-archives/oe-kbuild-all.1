Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F9C121
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 15:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABE0C433EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686498647;
	bh=7YkGE3oAy2YlOb34NM6GYIRQPzHpY+P6jMt0TGhHeic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cqZpo72OJJyldLtvnKOcQ1zLebfm9h0JSz8CdJ/fxuqPTwesZO+Qirl2auJv7ltza
	 PFr8hfjlY8MWSfPpU9TqS/9WAX/YvCvLiSD97aenaS6JZxiTEQ4xDpVRj8t32WLXjU
	 lyMi7wWNtxopJRuKB4xWTlZ1eRkjhF6MnZ27QRF4yGQYgqoNwBteP+UysHzuO4Cht8
	 /9LC3MiYHAE1D9iVtylQIHW6HTPvSmqDiG8rqybCxmqLOgojI2cJvu1iWir4csmghA
	 pg+BEiRmVWSADXvm+dWM20UJaNVTAuSm887hjzMoNxw3T+MyVn/Z0+kvYgYBjS4+kP
	 JU0aQkClweBqw==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-55b77d50465so596953eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 08:50:47 -0700 (PDT)
X-Gm-Message-State: AC+VfDxXfFdHtCAbefNz3ORJXWAPNHtcy4hrevM6SkF74vjL90kzNYLe
	y9AZkOj1i1qbPRLyNsRXn+XHxKQfn1Ku/R+aEFQ=
X-Google-Smtp-Source: ACHHUZ7cRigYqhXO+rUJtGow62SAM+vaVIKB4DHGC2MK/jIZh0J/J9agDHtUurnCxVo7Gsq/Rk8UAL/pk05a+nGg7gE=
X-Received: by 2002:a05:6870:8291:b0:1a6:7661:f0f4 with SMTP id
 q17-20020a056870829100b001a67661f0f4mr1026972oae.10.1686498646955; Sun, 11
 Jun 2023 08:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610091320.1054554-9-masahiroy@kernel.org> <202306110246.xCEMOjZy-lkp@intel.com>
In-Reply-To: <202306110246.xCEMOjZy-lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Jun 2023 00:50:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBGke2qLmJ6oNrYbwyM-tmAqsNzP0AYoGJOGGwo=UFvg@mail.gmail.com>
Message-ID: <CAK7LNAQBGke2qLmJ6oNrYbwyM-tmAqsNzP0AYoGJOGGwo=UFvg@mail.gmail.com>
Subject: Re: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 3:25=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Masahiro,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on masahiroy-kbuild/for-next]
> [also build test ERROR on next-20230609]
> [cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm=
/linux-next linus/master v6.4-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Re=
vert-PATCH-uml-export-symbols-added-by-GCC-hardened/20230610-171620
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git for-next
> patch link:    https://lore.kernel.org/r/20230610091320.1054554-9-masahir=
oy%40kernel.org
> patch subject: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYM=
S without recursion
> config: arc-randconfig-r035-20230610 (https://download.01.org/0day-ci/arc=
hive/20230611/202306110246.xCEMOjZy-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 12.3.0
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/li=
nux/kernel/git/masahiroy/linux-kbuild.git
>         git fetch masahiroy-kbuild for-next
>         git checkout masahiroy-kbuild/for-next
>         b4 shazam https://lore.kernel.org/r/20230610091320.1054554-9-masa=
hiroy@kernel.org
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Darc olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Darc SHELL=3D/bin/bash arch/arc/kernel/ =
drivers/infiniband/core/ drivers/media/dvb-core/ drivers/mtd/chips/ fs/ io_=
uring/ kernel/ lib/ mm/ net/802/ net/core/ net/ethernet/ net/ipv4/ net/ipv6=
/ net/llc/ net/netfilter/ net/rxrpc/ net/sched/ net/wireless/ net/xfrm/ sec=
urity/keys/
>

This is a bug of 03/11.

For most architectures, a semicolon works as an instruction separator,
but for ARC, it is the start of a comment.


I will fix it in v9.



--
Best Regards
Masahiro Yamada
