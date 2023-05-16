Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BFA34CD4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 17:29:31 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-510b154559fso809123a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684258170; x=1686850170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSAwujdb6ZD1BWpdXf+Ik7CenrdNfZlSo0AIchZVf0M=;
        b=AqTMB6aqQ6C2RMcsj55sPBjAuOrB27skqyEto7o3plpppZw4eAytoBztXPdyDj6RVc
         QB7g1NoVeHIk1tmYr3vEeeeY0bWvRiV8vg1wyzjIu8P51bKS1nHB4Fq6lCXzbwU74o9z
         bfG5TRJ9N+OKXVM3T7rI6dvBHnYNsXhUFBJjBlHAN9lVTbXimvkeTUWVsPwFjwTjCXYP
         7WDOPLQYG4/e+I9w4AI278gsLKo8MjBaNWkJFtI8rGNNjjnIHLeXb0EzxAgPXB9yTW9a
         hRkxIn86e+foW3mpivw1xlXi4api82kznHjD57zv+m/iJUp7koIlKbjsB/TeR6gcqh15
         etiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684258170; x=1686850170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSAwujdb6ZD1BWpdXf+Ik7CenrdNfZlSo0AIchZVf0M=;
        b=b04gFLwVyv6bwhpvfIR5IHCHbFYvcfN8FxRhS1pb5k5l80zi7QizUPaL5pDdXIxDfk
         JR9UzL9dUXk1rqfe/O4XeFZ/YzvtUbjYVRay0elwO5TTyC7Bs2rFbTz54m7gCkyW4Uvj
         R6lFOWjSoCbuJSgQyHy7Uw0uoYBiQfRtoIr6CGvqCT4TSskycCgUBYtFgcCifvYQN2M2
         dRK1Rfx11bEDefFsrkPdeih02eNb9/AebzDRZgL7olJjNNatsf0VviR10CgdMDhgGrvL
         9pavu+BxBpvPH+Z174+OLP6mq4BtEUwIQFeNRO6/PcebRIAxOg0rfgCd0aXA2hk0ZzgK
         NIPQ==
X-Gm-Message-State: AC+VfDz4YYYSjd3lGuS4zcJHK4M0kU+qrX/JbxBXKnsGW+F0IOsSMqVS
	l1jDQW+qj0jlcBO8zqyZqAYFy6gmBtonZxwA631Zg9zbQkY=
X-Google-Smtp-Source: ACHHUZ6HdRMraWOnF0yvuNpYSQArV65PARmVgqkjCw5wjyfGgy5RVeaZxETL186zEUnLlKaeqgSuZjXH3gOnt9BsKbM=
X-Received: by 2002:a17:906:d54b:b0:94f:3980:bf91 with SMTP id
 cr11-20020a170906d54b00b0094f3980bf91mr40467887ejc.19.1684258169761; Tue, 16
 May 2023 10:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305161058.hUHyPIjv-lkp@intel.com>
In-Reply-To: <202305161058.hUHyPIjv-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 16 May 2023 10:29:18 -0700
Message-ID: <CAEf4BzZ5CrQvOE-RwR1UuPMxuPaMzpQ_3z1Fnx3m_K0iLTE2RA@mail.gmail.com>
Subject: Re: Error: failed to load BTF from vmlinux: No data available
To: kernel test robot <lkp@intel.com>
Cc: Changbin Du <changbin.du@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 7:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Changbin,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
> commit: acd3b7768048fe338248cdf43ccfbf8c084a6bc1 libbpf: Return -ENODATA =
for missing btf section
> date:   4 months ago
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dacd3b7768048fe338248cdf43ccfbf8c084a6bc1
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout acd3b7768048fe338248cdf43ccfbf8c084a6bc1
>         make O=3D/tmp/kselftest headers
>         make O=3D/tmp/kselftest -C tools/testing/selftests
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305161058.hUHyPIjv-lkp@i=
ntel.com/
>
> All errors (new ones prefixed by >>):
>
>    libbpf: failed to find '.BTF' ELF section in vmlinux
> >> Error: failed to load BTF from vmlinux: No data available
> --
>    libbpf: failed to find '.BTF' ELF section in vmlinux
> >> Error: failed to load BTF from vmlinux: No data available
>    make[3]: *** [Makefile:204: tools/bpf/bpftool/vmlinux.h] Error 195
>    make[3]: *** Deleting file 'tools/bpf/bpftool/vmlinux.h'
>    make[2]: *** [Makefile:113: bpftool] Error 2
>    make[2]: *** Waiting for unfinished jobs....
>    libbpf: failed to find '.BTF' ELF section in vmlinux
> >> Error: failed to load BTF from vmlinux: No data available
>    make[3]: *** [Makefile:76: tools/bpf/runqslower//vmlinux.h] Error 195
>    make[3]: *** Deleting file 'tools/bpf/runqslower//vmlinux.h'
>    make[2]: *** [Makefile:122: runqslower] Error 2
>

Do you enable CONFIG_DEBUG_INFO_BTF=3Dy for this test? retsnoop's
Makefile expects to find .BTF section in vmlinux image to be able to
compiler everything correctly.

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
