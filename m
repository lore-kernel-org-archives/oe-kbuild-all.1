Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD29538F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 05:08:11 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-666edfc50deso3308446b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 22:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690261690; x=1690866490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x2r+ii17FI9VRwibRc5wN5clAB5tyzXqQZlyBBkXR64=;
        b=Ustkhv4KDV1IReaORm06XIn2tX3c0iIUpxjDPN85UWKkB3C6xpSPtnB7N6FToBjo1O
         m+VrOq57BR5CAezTN+71FjqYzP5fB/ZwkgcN4UZnG/SwXXwHZo0YN91g/yppbrsHGaOM
         lTCd/Eu+uSOBHTZcBiVylc78SGor4No70XK/XpvCobtGsmMkYkyVa9ID7gqSxXZxe+YR
         JEhOH20k4UJ2bIO2rfOnjiN90AT8k+XQKKVuIEEF5GjWtnhELHpos+pBFVQeSV34pZNm
         6t/4CZRc2qEbrAbVqokeaOicmGAKImIuiUZFsyPD2+c4+WXe6f4HIX5j/lukA3SakBXP
         uSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690261690; x=1690866490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2r+ii17FI9VRwibRc5wN5clAB5tyzXqQZlyBBkXR64=;
        b=YWlanRhyUwQYyNv7l2x49cN58Mlulw5rR+rPyoFFpo+p+7PDPtdqL8f9F4J5QgPPsu
         qmZcW1IK0LTu8C3a4WZzVg2khh3zQr6dCWOO5MzZBOqVnXDauU4dObigs2rR0tNKJpqP
         MEV19YwGtYX4FuAWAVWLjmwjBSgYnP0SbluJ02AIJjBKAGIvmUZgfm1VB/fTfu387AcN
         3K8PHbDVqO47T2/8XQs2oCJvLPdcTyghCaw6HT870fC17WVixJkESsWwA0NE/MSblbEc
         KuW/l32sYhqVmmJVUQMLzbo0F8rZ2LaKiCIXjLqnSn1hLZD33ZEuQ70CL7F/IuD8w0Ly
         xENw==
X-Gm-Message-State: ABy/qLbgIqku0zaGmkelonQmVlPuXsUDjkhT3a6Boq/dNOgsvc6afnH/
	ln4Py6R+qVJspLDVaCXpAVRNpw==
X-Google-Smtp-Source: APBJJlGVhTaKuGI0RMOqbRnrABRXSbIs5OgLAxNpkR2U9pu1L8PH87fIuVqYocHq0h9x+ekBws8YJQ==
X-Received: by 2002:a05:6a00:a88:b0:684:bb4a:b86e with SMTP id b8-20020a056a000a8800b00684bb4ab86emr1827329pfl.1.1690261690617;
        Mon, 24 Jul 2023 22:08:10 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.25])
        by smtp.gmail.com with ESMTPSA id fe15-20020a056a002f0f00b0066ccb8e8024sm8655802pfb.30.2023.07.24.22.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:08:10 -0700 (PDT)
Date: Tue, 25 Jul 2023 10:38:03 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: drivers/pnp/pnpacpi/core.c:253:17: warning: 'strncpy' specified
 bound 50 equals destination size
Message-ID: <ZL9Ys8DKf7RKg20G@sunil-laptop>
References: <202307241942.Rff2Nri5-lkp@intel.com>
 <ZL6IpoGPu5hgFidK@sunil-laptop>
 <CAJZ5v0gyGeier-Oz=o59TY1XzuPfZ02K=D6F-bMfJbXJ_5OnBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gyGeier-Oz=o59TY1XzuPfZ02K=D6F-bMfJbXJ_5OnBA@mail.gmail.com>

On Mon, Jul 24, 2023 at 07:15:22PM +0200, Rafael J. Wysocki wrote:
> On Mon, Jul 24, 2023 at 4:20 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > +Rafael.
> >
> > On Mon, Jul 24, 2023 at 07:32:36PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   6eaae198076080886b9e7d57f4ae06fa782f90ef
> > > commit: a91a9ffbd3a55a0ae1bb75e2b6e85b2a03f64e8f RISC-V: Add support to build the ACPI core
> > > date:   8 weeks ago
> > > config: riscv-randconfig-r032-20230724 (https://download.01.org/0day-ci/archive/20230724/202307241942.Rff2Nri5-lkp@intel.com/config)
> > > compiler: riscv64-linux-gcc (GCC) 12.3.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230724/202307241942.Rff2Nri5-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202307241942.Rff2Nri5-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >    drivers/pnp/pnpacpi/core.c: In function 'pnpacpi_add_device.isra':
> > > >> drivers/pnp/pnpacpi/core.c:253:17: warning: 'strncpy' specified bound 50 equals destination size [-Wstringop-truncation]
> > >      253 |                 strncpy(dev->name, acpi_device_name(device), sizeof(dev->name));
> > >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >
> > I need some help here to understand what needs to be done. This is a
> > common code across architectures. Apart from the fact that ACPI is
> > enabled for the first time for RISC-V, I am unable to understand why
> > this warning is seen now. Is this because only RISC-V gcc enables this
> > warning by default? I don't see this with clang tool chain. If this is
> > expected warning, is there a way to suppress?
> 
> I think that this is relevant information:
> 
> https://stackoverflow.com/questions/50198319/gcc-8-wstringop-truncation-what-is-the-good-practice
> 
Thank you very much! Rafael. Let me send a patch to append a NUL
explicitly to fix this issue. However, I still wonder why this code
added in 2005 getting this warning only now. Why is this not being seen
with other architecture builds?

Thanks!
Sunil
