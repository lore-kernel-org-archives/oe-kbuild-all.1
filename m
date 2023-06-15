Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4C53BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 09:36:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f8c5d0b19dso17167655e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686821787; x=1689413787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IBv0/BNAr0Oc9p1PBcHm79LmC19CaoKl/uwYX0mfdM=;
        b=oMAydC3g3GzZoWd8RfevpVHXJQmIHxjv1pjmzeWKGhi0njvyC3+sYZjQ77SExm40n4
         Uz+vS+uAmHPg4CjEhVlpynZX0uy95Zr4wa9HnbiAAyDBCeQY7vkdM+J3ejdHHXS2F3Wl
         cIap9p+2MRhwbaRkOgbXpTvaURfYKxf3P0avRrCudn8gwv7hLJP4h/cas+51fSmgpQr4
         wUj9EqN/QTpd+AOw5aj8mR+N7Mdub8P4RMHGL2SnktRzp5aJPIP4JVcjbfSeVc1K6I9Z
         GCxb0s0MHTB+itLnY/bq7LfGW5ReEJJbonnb8MSsABVnx+tGNgi6PKBsjF19VRqbwhYz
         4Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686821787; x=1689413787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IBv0/BNAr0Oc9p1PBcHm79LmC19CaoKl/uwYX0mfdM=;
        b=amRVIT3+l7DLpxtEHBbAgL+ogLCid8H9s+8YclPfBfMKwE+p6CcCsJ/b2lVhmoCM0X
         4/dYsDzqsS5BvqdIhr/F0IEIVFKgNsaQm2jJAHm51J6V45iPx1BJHR37oxobSlPHD5No
         X80x9jAujoOsDAAJTf74fp7htR0jNQq7OJdx0JqU6w0VTdHotaDkSmra9Dc6LfB7gq8+
         5tU76RfXqSOEDHNa9KN9s9zgz6IUmGq/Tbye9EoM+GCkXtyENfC4c4SVu/a33yIO2o1p
         QMn5xPKyXZsYvTZmjVDERa5riR+3HkPJt09KuLL7fAT9IhFA5Iktsn5CW49z4DB1bAGq
         YAvA==
X-Gm-Message-State: AC+VfDxK3Hp3JbSM3GVSc13GFG83XgEKuK0tKmCL34G+9hl1k05BzGt/
	eSMY6/G3kur+zoPEIVCx57irHIcgYlqCtk0cRReNM6qc+uh6AWls
X-Google-Smtp-Source: ACHHUZ5Xr4a7B00EWkX/6qAhyNdm3PQK9SIUx5ZG3WIhbI5ZmacB2V1ZhcUYFBbPqNrE0nUds9pBIlGHUQtHYlwe7/U=
X-Received: by 2002:a5d:4743:0:b0:307:8879:6cc1 with SMTP id
 o3-20020a5d4743000000b0030788796cc1mr12874701wrs.71.1686821786944; Thu, 15
 Jun 2023 02:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202306151631.3uZmHI1c-lkp@intel.com>
In-Reply-To: <202306151631.3uZmHI1c-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 15 Jun 2023 11:36:16 +0200
Message-ID: <CAHVXubjdcYmFTqbE8AdB6=grmnxSuSM+VtwoSLagT0wBd=ZeEg@mail.gmail.com>
Subject: Re: riscv64-linux-ld: section .init.pi.text LMA [000000000197e820,0000000001981733]
 overlaps section .data..percpu LMA [0000000001951000,0000000001b219d7]
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 10:30=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b6dad5178ceaf23f369c3711062ce1f2afc33644
> commit: 3b90b09af5be42491a8a74a549318cfa265b3029 riscv: Fix orphan sectio=
n warnings caused by kernel/pi
> date:   5 weeks ago
> config: riscv-randconfig-r004-20230615 (https://download.01.org/0day-ci/a=
rchive/20230615/202306151631.3uZmHI1c-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D3b90b09af5be42491a8a74a549318cfa265b3029
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 3b90b09af5be42491a8a74a549318cfa265b3029
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Driscv olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/ma=
ke.cross W=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306151631.3uZmHI1c-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    riscv64-linux-ld: section .data LMA [0000000000261000,00000000007d98cf=
] overlaps section .text LMA [00000000000a7a50,000000000197e81f]
> >> riscv64-linux-ld: section .init.pi.text LMA [000000000197e820,00000000=
01981733] overlaps section .data..percpu LMA [0000000001951000,0000000001b2=
19d7]
> >> riscv64-linux-ld: section .init.pi.rodata.str1.8 VMA [ffffffff821f3ed0=
,ffffffff821f3f3a] overlaps section .data VMA [ffffffff82000000,ffffffff825=
788cf]

That's a XIP config, nothing to worry about.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
