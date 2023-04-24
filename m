Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8356E7470
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 23:57:16 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-42e3b5bc5ecso1844361137.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 16:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682380635; x=1684972635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PgfwWAI0nR+mH6vI8X48Pnl9xXhXWmJyez6kNpzO0o=;
        b=NdaQhiYkvythU+92hJ9/OSbzGaAKAe4tAwl+3WG94TqrpeWCfwKXdhNXJiaGg3RiA7
         K9SJ52jwhPGpYPCmMj1gCM2cmnD/wvyXV+htGSKblAuz1+FGFZ4B3gk0PtUFu5zpel0x
         eIQkmTQv0BcqeLcTUkFPURoCo5DBNepe0EJ1Li0qXKgxpXJuJdN5xm+6gU7vxkPUM3ER
         Zk57JQv4vvG3+T4Up8ZokbqL9xxdlyQOSNOUfSd35O2GvBrn/JNUtqcyKTvzgv5MMMvm
         fQfo9fq7ved/t6cG3YQqTBBYZVZNZ3qK2QkCEk0zZeXTwYkwEHO9SCwTfcarm8+1SBry
         /jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682380635; x=1684972635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PgfwWAI0nR+mH6vI8X48Pnl9xXhXWmJyez6kNpzO0o=;
        b=TbTTzMh9+SQgM8HV/kcc4wd3CftBMTw+qTbd2EHwENZaljQlFVII/onYLpQd3rVSBx
         wEYGSIlRerpovSTr+Fi3PStft5JFoCGgVheoUDhD0FZqxsgyRB3xj/akyAvhQPy9ovOF
         QQHsJ3oKJt7Zv34ofRDSzIjcMQ6QnkyNW7L+uMZTArG0UtuQ2a6fUyeO1+Vav4RlG5qP
         QEJO8igXdzWJ1wrt87mYYyV/9sj6USERvO/INBj5fczF6HduebxuAj7m5ndT5cegKQvv
         7snBrkWLENlyKlpdYuTPtehRlrLAQviD4u4Nc6bJHyDq8COl4RR/Cw+EoE9MdZGRzD7I
         Jx8w==
X-Gm-Message-State: AAQBX9fHA82tyR4HI5OgDYJfkRQboeP2IGyY+V8Kq/VccDVCivi/Mw7H
	hOhgoyLOmjsn5DjFiJWFriGiBffrU247RyrcWjs=
X-Google-Smtp-Source: AKy350Zxdd0E75nlIdKgzB3gJxkgqo7XgTgknfm3q9IsIPSsVi67yjZ3bnhQtNi4g5Q1ble/k1qMyzC0ZtmtEP7jWa8=
X-Received: by 2002:a67:f786:0:b0:42e:3c25:cc2d with SMTP id
 j6-20020a67f786000000b0042e3c25cc2dmr6631756vso.19.1682380635118; Mon, 24 Apr
 2023 16:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304240617.8iFXzb2j-lkp@intel.com>
In-Reply-To: <202304240617.8iFXzb2j-lkp@intel.com>
From: jim.cromie@gmail.com
Date: Mon, 24 Apr 2023 17:56:49 -0600
Message-ID: <CAJfuBxzHTQxUtjBc6iQ3fCkBVh02aekQkYB-q6_y+wcbps72ww@mail.gmail.com>
Subject: Re: [jimc:maph 3/5] lib/test_map_h.c:41:2: error: call to
 '__compiletime_assert_314' declared with 'error' attribute: BUILD_BUG_ON
 failed: __builtin_memcmp(caten, "YESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello human readers,

does anyone see anything wrong in the subject BUILD_BUG_ON construct ?
It builds / tests fine on my x86 boxen,
but has failed on i386, and now on mips.

I have recapitulated the results locally:

  MODPOST Module.symvers
ERROR: modpost: "__compiletime_assert_314" [lib/test_map_h.ko] undefined!
ERROR: modpost: "__compiletime_assert_315" [lib/test_map_h.ko] undefined!
ERROR: modpost: "__compiletime_assert_316" [lib/test_map_h.ko] undefined!
ERROR: modpost: "__compiletime_assert_317" [lib/test_map_h.ko] undefined!
make[2]: *** [/home/jimc/projects/lx/wk-rpi/scripts/Makefile.modpost:136:
Module.symvers] Error 1
make[2]: Target '__modpost' not remade because of errors.



On Sun, Apr 23, 2023 at 4:33=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/jimc/linux.git maph
> head:   cab31ac00666c326de475b2390a7f92950c0d1a5
> commit: 4f85eaecae8f0c517c49bd68f6c7133cd93166a9 [3/5] lib/test_map_h: ad=
d new module to test map.h macros
> config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive=
/20230424/202304240617.8iFXzb2j-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b=
7602e4a998220871de78afcb020b9c14a661)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://github.com/jimc/linux/commit/4f85eaecae8f0c517c49bd68f6=
c7133cd93166a9
>         git remote add jimc https://github.com/jimc/linux.git
>         git fetch --no-tags jimc maph
>         git checkout 4f85eaecae8f0c517c49bd68f6c7133cd93166a9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash lib/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304240617.8iFXzb2j-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
> >> lib/test_map_h.c:41:2: error: call to '__compiletime_assert_314' decla=
red with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(caten, "Y=
ESNOMAYBE", __builtin_strlen("YESNOMAYBE"))
>            BUILD_BUG_STREQ(caten, "YESNOMAYBE");
>            ^
>    lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
>            BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)=
))
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_=
ON_MSG'
>    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                        ^
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:385:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:378:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:92:1: note: expanded from here
>    __compiletime_assert_314
>    ^
> >> lib/test_map_h.c:43:2: error: call to '__compiletime_assert_315' decla=
red with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cat=
s_names[0], "DRMx_CORE", __builtin_strlen("DRMx_CORE"))
>            BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
>            ^
>    lib/test_map_h.c:35:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
>            BUILD_BUG_STREQ(_vec_##_names[idx], ref)
>            ^
>    lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
>            BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)=
))
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:385:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:378:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:97:1: note: expanded from here
>    __compiletime_assert_315
>    ^
> >> lib/test_map_h.c:44:2: error: call to '__compiletime_assert_316' decla=
red with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cat=
s_names[1], "DRMx_DRIVER", __builtin_strlen("DRMx_DRIVER"))
>            BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
>            ^
>    lib/test_map_h.c:35:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
>            BUILD_BUG_STREQ(_vec_##_names[idx], ref)
>            ^
>    lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
>            BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)=
))
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:385:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:378:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:102:1: note: expanded from here
>    __compiletime_assert_316
>    ^
> >> lib/test_map_h.c:45:2: error: call to '__compiletime_assert_317' decla=
red with 'error' attribute: BUILD_BUG_ON failed: __builtin_memcmp(debug_cat=
s_names[2], "DRMx_KMS", __builtin_strlen("DRMx_KMS"))
>            BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
>            ^
>    lib/test_map_h.c:35:2: note: expanded from macro 'BUILD_BUG_STREQ_VI'
>            BUILD_BUG_STREQ(_vec_##_names[idx], ref)
>            ^
>    lib/test_map_h.c:30:2: note: expanded from macro 'BUILD_BUG_STREQ'
>            BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)=
))
>            ^
>    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_O=
N'
>            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition=
)
>            ^
>    note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:385:2: note: expanded from macro '_comp=
iletime_assert'
>            __compiletime_assert(condition, msg, prefix, suffix)
>            ^
>    include/linux/compiler_types.h:378:4: note: expanded from macro '__com=
piletime_assert'
>                            prefix ## suffix();                           =
  \
>                            ^
>    <scratch space>:107:1: note: expanded from here
>    __compiletime_assert_317
>    ^
>    4 errors generated.
>
>
> vim +41 lib/test_map_h.c
>
>     27
>     28  #if !defined(__i386__)
>     29  #define BUILD_BUG_STREQ(_var, ref)                               =
       \
>     30          BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen=
(ref)))
>     31  #else
>     32  #define BUILD_BUG_STREQ(_var, ref)       BUILD_BUG_ON(0)
>     33  #endif
>     34  #define BUILD_BUG_STREQ_VI(_vec_, idx, ref)             \
>     35          BUILD_BUG_STREQ(_vec_##_names[idx], ref)
>     36
>     37  /* force compile, even if its not called */

it was actually called.  I changed that in case it corrected the problem.
It did not.

>     38  static void __used MAPH_BUILD_BUG(void)
>     39  {
>     40          BUILD_BUG_ON(sum !=3D 6);
>   > 41          BUILD_BUG_STREQ(caten, "YESNOMAYBE");
>     42
>   > 43          BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
>   > 44          BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
>   > 45          BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
>     46
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
