Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DA07C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 02:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B89C433D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679367590;
	bh=IgyActK3dl0E6Ymzj8R7DNWaTNgGQTMkSEIkKQe437k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sCQIvEDg+m/p5buszRcknQeYLKttEcEkSx79YiOGF0cbS5SmfSi+2i1Q9iiXqwHv8
	 GjWYvDRpGXnpJZaBYL8mQaWp0Cldjb6ZXgPGhhfLSx25xDCYebmpCIBp4rh25Wl7eF
	 0P/R1ki1gXj5KdAvyK+jv9N6cO24sC0Ox1Z0bSsmEROTWc8Naf9fpctIF8BRMgImMa
	 shSLVzT2v6XtdMW8vuXdMdP1dl90G08xtGJpcuQErtALBNStskR5lj9bEFmBDSHqDJ
	 8vM+YxcASBvHNKm3EpKGdysA50OuDk2Es+A9nIF8UrNWTULdLAjTzH1XF8CQ55G6GW
	 EVsNbelzAx6LQ==
Received: by mail-ed1-f49.google.com with SMTP id eg48so54320068edb.13
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 19:59:50 -0700 (PDT)
X-Gm-Message-State: AO0yUKUBKAjISBsP+2xgR2Xo41Xb2G72kaPQvewe+HzB4ExtSuh4fnxq
	WqVmhqXGrR4QdSgMGeyXeDp0eGQ0usfu885UFY4=
X-Google-Smtp-Source: AK7set9EIETaTY3kIh5/3SMKpIkDdoNJVwsdHvl7RIcwjgXZvwdTI54si9iqZa1Dij+z8lS/caKmO/8zIt2/0anca1s=
X-Received: by 2002:a17:906:2451:b0:931:2bcd:edf9 with SMTP id
 a17-20020a170906245100b009312bcdedf9mr563679ejb.10.1679367588760; Mon, 20 Mar
 2023 19:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303201615.Qfu18nWV-lkp@intel.com> <20230320155626.hirui3frcaunnajj@box.shutemov.name>
In-Reply-To: <20230320155626.hirui3frcaunnajj@box.shutemov.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 21 Mar 2023 10:59:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4P-HUBvd=UnZxEyrqNZeOCzHabYCBEF=C+vfW+oQvqCA@mail.gmail.com>
Message-ID: <CAAhV-H4P-HUBvd=UnZxEyrqNZeOCzHabYCBEF=C+vfW+oQvqCA@mail.gmail.com>
Subject: Re: [linux-next:master 3778/4413] include/linux/mmzone.h:1749:2:
 error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: kernel test robot <lkp@intel.com>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.xn--dev-s01a, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all,

On Mon, Mar 20, 2023 at 11:56=E2=80=AFPM Kirill A. Shutemov
<kirill@shutemov.name> wrote:
>
> On Mon, Mar 20, 2023 at 04:06:33PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   73f2c2a7e1d2b31fdd5faa6dfa151c437a6c0a5a
> > commit: af8daebdbc0833b8095767ccef7ddce55e9fdf32 [3778/4413] mm, treewi=
de: redefine MAX_ORDER sanely
> > config: loongarch-buildonly-randconfig-r003-20230320 (https://download.=
01.org/0day-ci/archive/20230320/202303201615.Qfu18nWV-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3Daf8daebdbc0833b8095767ccef7ddce55e9fdf32
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout af8daebdbc0833b8095767ccef7ddce55e9fdf32
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Dloongarch olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Dloongarch prepare
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303201615.Qfu18nWV-lkp=
@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/linux/gfp.h:7,
> >                     from include/linux/mm.h:7,
> >                     from arch/loongarch/kernel/asm-offsets.c:9:
> > >> include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exc=
eeds SECTION_SIZE
> >     1749 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
> >          |  ^~~~~
>
> +Loongarch folks.
LoongArch defines SECTION_SIZE_BITS as 29, so I think the upper limit
of ARCH_FORCE_MAX_ORDER should not be 63, MIPS is similar.

Huacai
>
> The same situation as with mips:
>
> https://lore.kernel.org/all/20230315152636.smn34f3c6a5jzpn3@box
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
