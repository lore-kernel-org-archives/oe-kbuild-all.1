Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD43A1A8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 03:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706757002; cv=none; b=uV7COgLOD6hp8W3Ruj3MoXmC4nIvHxmO8thXEMgts+rpP8998IindYySv5mvSnIXHKX0gr3OYl5lQFdB6nOwPSJFAiueqpEbd8oE7mPv6S724nvivlpTcgOxfavIH8yCZq4UK5aGdWmVnFORdgVvcecXf5z9h9LHXPXnZ4FVCJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706757002; c=relaxed/simple;
	bh=vOUXPahGNAVTaTDzE387IGL2+AvX6EtHqCWoZJcrtII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2C4sc6sRT2CcvG4z5l7z+pF82UGJmxCb9GzAZ1pBHS2eic0wWEGrlCw2XUr/yZl/5mf2im5r8GKP6dS41rcaKErOY6U7635ChY7ExsSQjFQkaDmUMVkGPYpWmXf2W9XgO/ZfmFiXgYK98hrH+O4Y3Kfp9AeHOgLw4xr6Xwi93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=WRFPApIj; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WRFPApIj"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4b978e5e240so235425e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 19:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706756999; x=1707361799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnXXqSs2mVSlmNeDNc5RN8+jodeQKbLDet8uL7vKB3k=;
        b=WRFPApIj6Cai6HCsqgH6+oU1PHx/sax6KsnbpiMBBGD97Zt0txPEN8ePnRj3/lVxjo
         wuAjGK3IDub8oO9tPUu61DQ1PtAQq9GUEouPwwFez837GCdMqlmfLfXERq4aYIeqg9pj
         NoE7HBGIw12oEI/4Wzz/CdQTqh+KWyhbdl8DrRyuUwcsGnSRT+i+O0534p965HVhiFB5
         offaf5YfTBjaeFTw4Y7IRZ6g0QWY+r7+l275m+IO9HUOGIHVfQvZycKGaZNRdPVQ348m
         cq2MkXilouq0I2NuD3t5WiGfjonOK1sTD9XhSVI2RdpaW4HhaX9IZZeqHCd3A2fwi+KQ
         5v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706756999; x=1707361799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnXXqSs2mVSlmNeDNc5RN8+jodeQKbLDet8uL7vKB3k=;
        b=g6GoZ4Vz81mpkNB+/1fOvs7R7jp5HFPns3eqV9C068LE/U0aaBHIX0ywV0K+wgW7sQ
         vgYsnR7N399zg8m8veC7iCOwWjQfOig/V9ex79AXrXgG2k/a4yre502ligxI3wjG+2dq
         ESBuNyxCoEpV5MdxciA6Z1d7PQlT0qSxNZ7A7pw9ltDhCfXB39GMzRqZH6wffAJIxrFP
         tpprqKr+RUmOJYWCLR3l0eByXunYTsXvPH71L2kuyNHYrviG0Y1L/GAPvtPXo19+UDt8
         4Vd9yaolvuAKUFjQMZBcTJCflRrg/5xQ5caKGkT0BYP6BjJN37ku1mFpUVezGgyAnFM7
         JWHw==
X-Gm-Message-State: AOJu0YwxMd3ZLx1KxPtYbq6OJlF3Api7+Kvl7e0lm0JlVDGMl8oUb+WE
	3c9HEikR/2/3BSowJlOYdW+ufdcbonPTAZ/w8DiN8yGpi3WqISzGMwBbReuTqsb1PDYO03j6+Lw
	Ri4bS1deuNpf7a4X3WfFbExKic3VXD3m0hyb3qTTP6rzYPblDLSs=
X-Google-Smtp-Source: AGHT+IGHoW3TeZ25nu33PKHk6GyjlEOOI7lvQERqAQcYT6EfVQceFF4nvsZwZj76g4IUZ7D7lzTQysCQdzQ3CtGYy5c=
X-Received: by 2002:a05:6122:996:b0:4bd:76f3:9dff with SMTP id
 g22-20020a056122099600b004bd76f39dffmr3721284vkd.8.1706756999342; Wed, 31 Jan
 2024 19:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401310055.wBrlZfRE-lkp@intel.com> <CAHVXubj8R-HeJb6joDD4mRLAeoF0Ky+2YKWRubqs1Gjd2qKYyw@mail.gmail.com>
In-Reply-To: <CAHVXubj8R-HeJb6joDD4mRLAeoF0Ky+2YKWRubqs1Gjd2qKYyw@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 1 Feb 2024 11:09:48 +0800
Message-ID: <CABvJ_xikJHznmC5FDQ6=z1Gg+FMs+28V7VWsY2V0wtj5T44SxQ@mail.gmail.com>
Subject: Re: [palmer:fixes 1/1] arch/riscv/mm/tlbflush.c:207:6: error:
 redefinition of 'local_flush_tlb_kernel_range'
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 4:28=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosinc=
.com> wrote:
>
> On Tue, Jan 30, 2024 at 6:07=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.gi=
t fixes
> > head:   eb70c97995147c7febb0f3ad67ca6210d19f5724
> > commit: eb70c97995147c7febb0f3ad67ca6210d19f5724 [1/1] riscv: mm: execu=
te local TLB flush after populating vmemmap
> > config: riscv-defconfig (https://download.01.org/0day-ci/archive/202401=
31/202401310055.wBrlZfRE-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240131/202401310055.wBrlZfRE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401310055.wBrlZfRE-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> arch/riscv/mm/tlbflush.c:207:6: error: redefinition of 'local_flush_=
tlb_kernel_range'
> >      207 | void local_flush_tlb_kernel_range(unsigned long start, unsig=
ned long end)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    arch/riscv/mm/tlbflush.c:69:6: note: previous definition of 'local_f=
lush_tlb_kernel_range' with type 'void(long unsigned int,  long unsigned in=
t)'
> >       69 | void local_flush_tlb_kernel_range(unsigned long start, unsig=
ned long end)
> >          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> >
> > vim +/local_flush_tlb_kernel_range +207 arch/riscv/mm/tlbflush.c
> >
> >    205
> >    206  /* Flush a range of kernel pages without broadcasting */
> >  > 207  void local_flush_tlb_kernel_range(unsigned long start, unsigned=
 long end)
> >    208  {
> >    209          local_flush_tlb_range_asid(start, end - start, PAGE_SIZ=
E, FLUSH_TLB_NO_ASID);
> >    210  }
> >    211
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
> Yes, we introduced twice the same function in 6.8, you can find a
> resolution for this error here:
> https://github.com/AlexGhiti/linux-riscv/commit/756d1871f58edac455773db0b=
b996f8d064a6b06
>
> Unless Vincent should send a new version?

Thank Alex for providing the solution and thank Palmar for applying
Alex's solution to the fixes branch. I discovered the code base v6.7+
I used seems too old to have Alex's patch, so I didn't encounter this
issue during the development. Apologies for any inconvenience.
