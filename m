Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BB0200BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 17:41:41 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-65627d49d24so3315866d6.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694713300; x=1695318100; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/EpZ1GWHc4x/nG0Kx2s7S+DQIRkgyoK7g5ng753eM0=;
        b=qxFGa1BELA32X6kevhoSIEIEXahZlqJlMQT/txfZwI3EVBQNWWwVse12QjPiIMeeH1
         LLPZBaZh/g8l/pBdFac8VVyHIheOXZNV/qU6oZW6XC2dh/4mpDZ8HgbBnkwZBSP2pKKb
         8CZgvvOgLZDp7LZ/qDYDlpUxt/mQ6ooLXc0HAh+XEVgq8qGLvtnpchdMcQowlcYGDs2w
         qNIdSjZjqpsOFPqG42uwMoPRtK4Z6eC7/Szbz3o6ajThmlh//3UMZ+JBVhWgbWAI2Dbq
         SawJw9wsrDCXjB6x76oE9s98hSl5yIseWw/H6yLYs5ZgD4o3ExL5Zv5AYiG4K69WHBlC
         Rvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694713300; x=1695318100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/EpZ1GWHc4x/nG0Kx2s7S+DQIRkgyoK7g5ng753eM0=;
        b=mIMH24WwLhKYQej87I8K+6YJBNdkg1PUy3t+dpy3ER4gRtFfUgt1rZWoXZbODxJgz6
         56Evja4TDS8wKfs9oI1UZmkzl0MctJAuUsvJo3pF09CCj6kKRuL3Ghkr8ajIze7gc0en
         /Twe4QLpRjmAi6Kg+dqibpO4lNa6GeGVRrm6m8JesRRzXxy3XLL7ydgcyIQbZNC5j9VC
         O6qhJGBeqFurqx6ttfASBgf9EtEGICmyMTgESZiqfc3QOTzqNEUxvP83a5i/pSO06T6p
         Wbbz8fMl0zy3ZEw9ouIQiHIlfm78MO2Z8ZIp0W2X6m/fAoJiue7yspAMabXYLtkUCQdZ
         8mUg==
X-Gm-Message-State: AOJu0YyoM6FoSpJPDmUhddtNVBZXuPWbrWrOmShkoLdrNr2SJtYHXAyJ
	t2rUNV0y9/AMVz7W4h+XFqxJmr+54mUnElkUUBgZLA==
X-Google-Smtp-Source: AGHT+IGrRQUd9vGZgOD7XJuFKtsEk06aXUbUmblrVes6BRVOnec7PqkFsbqyvZZKUVdAqUve111n932fyZemZTPEoJE=
X-Received: by 2002:a0c:cc03:0:b0:656:2f3f:852f with SMTP id
 r3-20020a0ccc03000000b006562f3f852fmr1005291qvk.28.1694713300087; Thu, 14 Sep
 2023 10:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309141433.6gzJPSYA-lkp@intel.com>
In-Reply-To: <202309141433.6gzJPSYA-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 14 Sep 2023 10:41:01 -0700
Message-ID: <CABCJKuck=4TKdTjKqu6Qd6ZhqrtS+=a=zOz+G=vFuiMoyfXerA@mail.gmail.com>
Subject: Re: ld.lld: error: relocation R_RISCV_HI20 cannot be used against
 symbol '.L.str.6'; recompile with -fPIC
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2023 at 11:14=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Sami,
>
> FYI, the error/warning was bisected to this commit, please ignore it if i=
t's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   aed8aee11130a954356200afa3f1b8753e8a9482
> commit: 74f8fc31feb4b756814ec0720f48ccdc1175f774 riscv: Allow CONFIG_CFI_=
CLANG to be selected
> date:   3 weeks ago
> config: riscv-randconfig-r002-20230912 (https://download.01.org/0day-ci/a=
rchive/20230914/202309141433.6gzJPSYA-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230914/202309141433.6gzJPSYA-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309141433.6gzJPSYA-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '=
.L.str.6'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
>    >>> referenced by errata.c:94 (arch/riscv/errata/sifive/errata.c:94)
>    >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_pat=
ch_func) in archive vmlinux.a
> --
> >> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol=
 '.L.str.6'; recompile with -fPIC
>    >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
>    >>> referenced by errata.c:94 (arch/riscv/errata/sifive/errata.c:94)
>    >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_pat=
ch_func) in archive vmlinux.a

This randconfig builds a fairly large 64-bit kernel with
CONFIG_CMODEL_MEDLOW=3Dy. Switching to CMODEL_MEDANY fixed the linker
error for me, although the laterr BTFIDS step still fails:

  BTFIDS  vmlinux
WARN: resolve_btfids: unresolved symbol bpf_cpumask
FAILED elf_update(WRITE): no error
make[3]: *** [../scripts/Makefile.vmlinux:36: vmlinux] Error 255

64-bit defconfig with CFI+CMODEL_MEDLOW works just fine and I can also
reproduce the linker errors by building allyesconfig+CMODEL_MEDLOW
without CFI, for example, so I assume the build failure with this
config is expected. Is there anything we should do here?

Sami
