Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCA97491
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 14:57:14 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id u9so66994481edd.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Mar 2023 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678287433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbYh/W1Fs/fFmchMFnpfyRdMkOMcvrfTqWNY38sSzsA=;
        b=M4MdMnI+XTerK1kGMClHbQew66CG12nz2yEmsldlQPsYogUEt0/iIHrNu3BI3PCsdo
         NOKvZ9vcTzX9uFh1gYgLVt5KIrOkB2X0hLr/nDJvmI2SOhU1caMiDRYTIJ80wPEhHHDU
         +iSpW75jPU+9Y3vofGNdto3SiR150bsFM7yOfPIxUNXfspRMHUxICQNTKJZpacYxLUiW
         8pTZ6G5y131YUHCbg3rcmUG4X8aS6XOVDZl+p7er08W9FdKhHCRJlQGg9N1Cs0ZrSQHk
         7qx01br1Wo+fHvKWMSLcNG0Q0HvcSQw7cvHRe15fuFwfSLRbqudATS/XYMpkmWA/M8OA
         E8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbYh/W1Fs/fFmchMFnpfyRdMkOMcvrfTqWNY38sSzsA=;
        b=dlchqE3hJV9/gCLX2SoU+4V9KdW3Ihv/YzXON/cwgRO3+LFX195epVld3b8KKvo6PZ
         lrP7EP2BhIbi53/dLUD/AwfdiG+IS93ArPoXvqOG7zEDIZD5YGXQm5Cf8oniEEcdLQxB
         mFynIPWp/xpjVTC9wCh2CXFqmse7VynIunUtnZLU3HUattl/WwLQMNscgR8yW8K/4Glo
         7Eevx/L//Ea7oOTJjlzaLGQqo2OXV4l31ipN/G0zEx1pc53x6oEs5YA/+34fG+cBGeae
         cXdYvPX4hZp/vo8MCHZ+db4KjyRZC6029rcMeirXXChMQLOJrjZA14H9GqlzFqGM0mm/
         XL2g==
X-Gm-Message-State: AO0yUKUUGMCnyjx2JZx4oDuW/hNXNez/CrYQeYzhM5m1n0pUptbNqgR3
	gRcbmMjwG9nKyaM15j+1IEmfqJARAknQYJliXJ4=
X-Google-Smtp-Source: AK7set+AdV1zu4+ft8Oj4nLbScWI1GqFW1grJAmpz+I3c7UowpzRf09rMqeg95+d4OMhNWL7XrZynXtAvY04ctK8gIo=
X-Received: by 2002:a17:906:1ec6:b0:8b0:7e1d:f6fa with SMTP id
 m6-20020a1709061ec600b008b07e1df6famr8788268ejj.15.1678287433056; Wed, 08 Mar
 2023 06:57:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230308035416.2591326-5-andrii@kernel.org> <202303082250.AUFm2qRJ-lkp@intel.com>
In-Reply-To: <202303082250.AUFm2qRJ-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 8 Mar 2023 06:57:00 -0800
Message-ID: <CAEf4BzYeTN9TPdDBFL6wQ2O=Fpteb2iAwfcKr2YECUGmGQ8kbg@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 4/8] bpf: implement number iterator
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, oe-kbuild-all@lists.linux.dev, kernel-team@meta.com, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 6:30=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Andrii,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bp=
f-factor-out-fetching-basic-kfunc-metadata/20230308-115539
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230308035416.2591326-5-andrii%=
40kernel.org
> patch subject: [PATCH v4 bpf-next 4/8] bpf: implement number iterator
> config: nios2-randconfig-r001-20230306 (https://download.01.org/0day-ci/a=
rchive/20230308/202303082250.AUFm2qRJ-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/19acf9ca01e2927a2=
9d3235b3aa73598430dcb70
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Andrii-Nakryiko/bpf-factor-out-f=
etching-basic-kfunc-metadata/20230308-115539
>         git checkout 19acf9ca01e2927a29d3235b3aa73598430dcb70
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dnios2 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dnios2 SHELL=3D/bin/bash kernel/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303082250.AUFm2qRJ-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from <command-line>:
>    kernel/bpf/bpf_iter.c: In function 'bpf_iter_num_new':
> >> include/linux/compiler_types.h:399:45: error: call to '__compiletime_a=
ssert_426' declared with attribute error: BUILD_BUG_ON failed: __alignof__(=
struct bpf_iter_num_kern) !=3D __alignof__(struct bpf_iter_num)
>      399 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:380:25: note: in definition of macro '_=
_compiletime_assert'
>      380 |                         prefix ## suffix();                   =
          \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:399:9: note: in expansion of macro '_co=
mpiletime_assert'
>      399 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG=
_ON_MSG'
>       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #c=
ondition)
>          |         ^~~~~~~~~~~~~~~~
>    kernel/bpf/bpf_iter.c:794:9: note: in expansion of macro 'BUILD_BUG_ON=
'
>      794 |         BUILD_BUG_ON(__alignof__(struct bpf_iter_num_kern) !=
=3D __alignof__(struct bpf_iter_num));
>          |         ^~~~~~~~~~~~
>

Well, of course, u64 is not 8-byte aligned on 32-bit architecture,
thanks. I'll do the following change in the next revision:


diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index bf8b77d9a17e..4abddb668a10 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -7118,6 +7118,6 @@ struct bpf_iter_num {
         * alignment requirements in vmlinux.h, generated from BTF
         */
        __u64 __opaque[1];
-};
+} __attribute__((aligned(8)));

 #endif /* _UAPI__LINUX_BPF_H__ */
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.=
h
index bf8b77d9a17e..4abddb668a10 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -7118,6 +7118,6 @@ struct bpf_iter_num {
         * alignment requirements in vmlinux.h, generated from BTF
         */
        __u64 __opaque[1];
-};
+} __attribute__((aligned(8)));


>
> vim +/__compiletime_assert_426 +399 include/linux/compiler_types.h
>
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  385
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  #define _compiletime_assert(c=
ondition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  387      __compiletime_assert(cond=
ition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  388
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  389  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * compiletime_assert - break=
 build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   * @condition: a compile-time=
 constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * @msg:       a message to e=
mit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * In tradition of POSIX asse=
rt, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   * supplied condition is *fal=
se*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  396   * compiler has support to do=
 so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  397   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  #define compiletime_assert(co=
ndition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @399      _compiletime_assert(condi=
tion, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  400
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
