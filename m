Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8821FC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 17:15:35 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99b49e51f62so133027866b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 10:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690218934; x=1690823734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmzPsAYzy8NSDpn9uqZi6xNv0tfNhDnok5avWIDLP/w=;
        b=AiiEPFlo/eMrMxsp7OzSAFHFLmkgqxGiq24OKUM/h8nEBYA5eS144nLxS8NRBafM9M
         e/uhcRMylFbjugdCJOO5tgeyJVjOsq/KbXJtq19eb8VsPSTiZ5eEC8oK7ttQEHNn/o0d
         neh86q+EmIdUbWuSgNMSspx1/U870ai05cQYQNAUITmID8q4k0W9Y1leUWIDCube+spI
         L86iWVGLJmWKfbDiQAwpeu5jBgJyoScutoDobtBjrD5VMZneAjgyPv8CnJreMEZSiEpi
         2r/QkPYGJaKUSiUx69JHA8WEzw/vlewF9ecWAELtVzyhl1hdV2brvOfTTIgGO8EuU0cM
         d/QA==
X-Gm-Message-State: ABy/qLapBgvgXPVgCujXSAIwkGJp8QwDHBP430BVbNbY6zBGmgriCOjv
	p1F71L7ZIy3SrrSNZ7NZdMMqeYkNbQqNImjbcOI=
X-Google-Smtp-Source: APBJJlGoct3mHpZZnM6Ol+uQnfypSnCptgwMWEkfwlB/H4mVcZnq79dRut/tnQu1J8D0Sf04VcsiQ6tlcbJvnvZybGI=
X-Received: by 2002:a17:906:20d0:b0:997:e8ea:178e with SMTP id
 c16-20020a17090620d000b00997e8ea178emr8541422ejc.7.1690218933967; Mon, 24 Jul
 2023 10:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307241942.Rff2Nri5-lkp@intel.com> <ZL6IpoGPu5hgFidK@sunil-laptop>
In-Reply-To: <ZL6IpoGPu5hgFidK@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 24 Jul 2023 19:15:22 +0200
Message-ID: <CAJZ5v0gyGeier-Oz=o59TY1XzuPfZ02K=D6F-bMfJbXJ_5OnBA@mail.gmail.com>
Subject: Re: drivers/pnp/pnpacpi/core.c:253:17: warning: 'strncpy' specified
 bound 50 equals destination size
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 4:20=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> +Rafael.
>
> On Mon, Jul 24, 2023 at 07:32:36PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
> > commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add support to=
 build the ACPI core
> > date:   8 weeks ago
> > config: riscv-randconfig-r032-20230724 (https://download.01.org/0day-ci=
/archive/20230724/202307241942.Rff2Nri5-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230724/2023072419=
42.Rff2Nri5-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202307241942.Rff2Nri5-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/pnp/pnpacpi/core.c: In function 'pnpacpi_add_device.isra':
> > >> drivers/pnp/pnpacpi/core.c:253:17: warning: 'strncpy' specified boun=
d 50 equals destination size [-Wstringop-truncation]
> >      253 |                 strncpy(dev->name, acpi_device_name(device),=
 sizeof(dev->name));
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
> >
> I need some help here to understand what needs to be done. This is a
> common code across architectures. Apart from the fact that ACPI is
> enabled for the first time for RISC-V, I am unable to understand why
> this warning is seen now. Is this because only RISC-V gcc enables this
> warning by default? I don't see this with clang tool chain. If this is
> expected warning, is there a way to suppress?

I think that this is relevant information:

https://stackoverflow.com/questions/50198319/gcc-8-wstringop-truncation-wha=
t-is-the-good-practice

Thanks!
