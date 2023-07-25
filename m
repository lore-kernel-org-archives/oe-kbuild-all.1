Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBA7486
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 08:52:06 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-569b5489e6cso452480eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 01:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690275125; x=1690879925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/SGPa4CFbfVRal8xLsbFh3tPOyaC9uwhKONoYiwSg/U=;
        b=fVtjN2UyWuxktYlUG2GtkKdkvT2SnGivFjbW78BKbNykPCskz+XDk/BvnuVHmWtrda
         vg4h8K6wDOvEXOr7ouR9ezYMzMIhglwBA8VnbgldfIg4wJsfzBW/IQi83Vtw8D2yxsVk
         a3fWOeyoBiPxJHSYAzP+8kRjhiEAg1Cgu0S6MwNg8zbQ9T/IYj0tKizfk7Pnx2YYa8bK
         zXQgod+mwBq41u2gNSFDMR4phaobvB6ngN+cKGWjfPs4353zxR8vmZ+CUfm1lAXGsJ9f
         wdhP7E9tjrS6zcVXlQLgTTJFEGnPfQISNSYOCeDcmOjRZeBoIstVG0rm6td/qjouEQei
         ifaw==
X-Gm-Message-State: ABy/qLb4Duq2cr6oguT0cmi8w8yMECqfs8q/2MQtID8wJpDcnycZoUBL
	JQhAn+H+RiLwNxszZz/qbnE8FFJBSfmx3cnV5kk=
X-Google-Smtp-Source: APBJJlGLbwy7vYhmSsUNvWxNaMsZwqRZLCnVbdKICjnOXTSxVsJi9EgvSnbUk6/ko348nn3RtCj/vxDTYdDFhlXQTck=
X-Received: by 2002:a4a:e7c8:0:b0:566:6984:c44 with SMTP id
 y8-20020a4ae7c8000000b0056669840c44mr7210812oov.1.1690275125402; Tue, 25 Jul
 2023 01:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307241942.Rff2Nri5-lkp@intel.com> <ZL6IpoGPu5hgFidK@sunil-laptop>
 <CAJZ5v0gyGeier-Oz=o59TY1XzuPfZ02K=D6F-bMfJbXJ_5OnBA@mail.gmail.com> <ZL9Ys8DKf7RKg20G@sunil-laptop>
In-Reply-To: <ZL9Ys8DKf7RKg20G@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 25 Jul 2023 10:51:54 +0200
Message-ID: <CAJZ5v0hvZfi8jnPbZSETFRnbcesECB_XHOEfsA8SN=GrH2axOg@mail.gmail.com>
Subject: Re: drivers/pnp/pnpacpi/core.c:253:17: warning: 'strncpy' specified
 bound 50 equals destination size
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 7:08=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> On Mon, Jul 24, 2023 at 07:15:22PM +0200, Rafael J. Wysocki wrote:
> > On Mon, Jul 24, 2023 at 4:20=E2=80=AFPM Sunil V L <sunilvl@ventanamicro=
.com> wrote:
> > >
> > > +Rafael.
> > >
> > > On Mon, Jul 24, 2023 at 07:32:36PM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
> > > > head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
> > > > commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add suppor=
t to build the ACPI core
> > > > date:   8 weeks ago
> > > > config: riscv-randconfig-r032-20230724 (https://download.01.org/0da=
y-ci/archive/20230724/202307241942.Rff2Nri5-lkp@intel.com/config)
> > > > compiler: riscv64-linux-gcc (GCC) 12.3.0
> > > > reproduce: (https://download.01.org/0day-ci/archive/20230724/202307=
241942.Rff2Nri5-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202307241942.Rff2Nr=
i5-lkp@intel.com/
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > >    drivers/pnp/pnpacpi/core.c: In function 'pnpacpi_add_device.isra=
':
> > > > >> drivers/pnp/pnpacpi/core.c:253:17: warning: 'strncpy' specified =
bound 50 equals destination size [-Wstringop-truncation]
> > > >      253 |                 strncpy(dev->name, acpi_device_name(devi=
ce), sizeof(dev->name));
> > > >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > I need some help here to understand what needs to be done. This is a
> > > common code across architectures. Apart from the fact that ACPI is
> > > enabled for the first time for RISC-V, I am unable to understand why
> > > this warning is seen now. Is this because only RISC-V gcc enables thi=
s
> > > warning by default? I don't see this with clang tool chain. If this i=
s
> > > expected warning, is there a way to suppress?
> >
> > I think that this is relevant information:
> >
> > https://stackoverflow.com/questions/50198319/gcc-8-wstringop-truncation=
-what-is-the-good-practice
> >
> Thank you very much! Rafael. Let me send a patch to append a NUL
> explicitly to fix this issue. However, I still wonder why this code
> added in 2005 getting this warning only now. Why is this not being seen
> with other architecture builds?

I don't know.
