Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF76362
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 00:53:49 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso3112889e87.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 18 May 2023 17:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684457627; x=1687049627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sivbYrV1bwadAn0fltPP6rK4i4zR+Og2lN0Gw2Oc6Vo=;
        b=fV+U0lRFgOUrBk2S15+f6+JYfPBvpTkpMx8KtdzflaHNzL2S2y9Eli5t8RLxJu6Ide
         6ySt/2IknEJMCbGc0fZ/gUFSrMgJNGlnFgcBNq0eOaYloOYj5bh0m+J5miz0romABUM1
         fU72IZRjd7GBaD8J12mIiEYI5Lxsd6uZvErlWwjlga2C94GyF4E/T93K8v1DCFx312ii
         7/NG22ru5of/LDh4OJiwer85D5JHYS7DIyYmS65A+NVAAzjw3UvQ/E7eA2m7lvqAkigX
         t0CbXhKVxQc7y0CS9odK9PwBo5KOuGcBs62BjbhuED3oZl+W/HO54IOTiDxpWX+ZgDsL
         qpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684457627; x=1687049627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sivbYrV1bwadAn0fltPP6rK4i4zR+Og2lN0Gw2Oc6Vo=;
        b=M2GVXAjlwT+J2Pyi7Y0zj3j1zwq4W2o+nTSmLXz5ozeOaO4t+V3zDmI3Hz+Xvdy8ww
         gPT0HaOpYwcPxjrW551cCRgmHbIgELlJ2kE09kBTEe5wg1F6iU5ov7sjnJPTteUeQ5kO
         W3VdcL2edxW97rEncNnn+ffXqwi0jq1C7+cfYKUTbe9Hr1gIfjmRf6heGsx+RCnS28X7
         6wDPCzUiPncpfKz5E4DqQKEVc/EQNRpWPdW/NoGJwNZmMz6o3JprQz7eRQudVhWgej1y
         hTMr8LYJe0vP8aV8w9FKci15jWc7T238B1SLxpKd8Qb5wCSHsa/3N7SbEnH2X02HgsUc
         4bWQ==
X-Gm-Message-State: AC+VfDxJ6Mkc9CtDDzRLLpUkiXF0TVyhV9If/hbu+Yp4KF6d6EZ6rIIm
	dKQ/pZHODBfA25qx10xQA7dWErkZWb3bwjlZHnw=
X-Google-Smtp-Source: ACHHUZ69uBBZgn6f6vUX8sQygzgcHzJYsGHym+7MIAzeaKrUWk1qJvA5wNnrk3YM1RC+LLKe8LJ88BQl+X8zF0LsGsQ=
X-Received: by 2002:ac2:5939:0:b0:4f3:8823:ebe9 with SMTP id
 v25-20020ac25939000000b004f38823ebe9mr245681lfi.22.1684457627157; Thu, 18 May
 2023 17:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518215444.1418789-2-andrii@kernel.org> <202305190724.nnh1ZV2F-lkp@intel.com>
 <CAEf4BzYW_OXeF=5L1XU5025-VbWN3M-wOSszXqMD6c5E9bEO9w@mail.gmail.com>
In-Reply-To: <CAEf4BzYW_OXeF=5L1XU5025-VbWN3M-wOSszXqMD6c5E9bEO9w@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 18 May 2023 17:53:35 -0700
Message-ID: <CAADnVQJL3ZAxXrR6nkk=pYbuVS8NhGX19UJpsvSrH4VbPAayhg@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 1/3] bpf: support O_PATH FDs in BPF_OBJ_PIN
 and BPF_OBJ_GET commands
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Aleksa Sarai <cyphar@cyphar.com>, Christian Brauner <brauner@kernel.org>, 
	Lennart Poettering <lennart@poettering.net>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 5:19=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Thu, May 18, 2023 at 4:59=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Andrii,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on bpf-next/master]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/=
bpf-support-O_PATH-FDs-in-BPF_OBJ_PIN-and-BPF_OBJ_GET-commands/20230519-060=
110
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.gi=
t master
> > patch link:    https://lore.kernel.org/r/20230518215444.1418789-2-andri=
i%40kernel.org
> > patch subject: [PATCH v2 bpf-next 1/3] bpf: support O_PATH FDs in BPF_O=
BJ_PIN and BPF_OBJ_GET commands
> > config: m68k-allyesconfig
> > compiler: m68k-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/intel-lab-lkp/linux/commit/74f08e59c3fccac=
04b3c080831615209e11be4fb
> >         git remote add linux-review https://github.com/intel-lab-lkp/li=
nux
> >         git fetch --no-tags linux-review Andrii-Nakryiko/bpf-support-O_=
PATH-FDs-in-BPF_OBJ_PIN-and-BPF_OBJ_GET-commands/20230519-060110
> >         git checkout 74f08e59c3fccac04b3c080831615209e11be4fb
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Dm68k olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.c=
ross W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash kernel/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305190724.nnh1ZV2F-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    kernel/bpf/syscall.c: In function 'bpf_obj_get':
> > >> kernel/bpf/syscall.c:2720:13: warning: variable 'path_fd' set but no=
t used [-Wunused-but-set-variable]
> >     2720 |         int path_fd;
> >          |             ^~~~~~~
> >
> >
> > vim +/path_fd +2720 kernel/bpf/syscall.c
> >
> >   2717
> >   2718  static int bpf_obj_get(const union bpf_attr *attr)
> >   2719  {
> > > 2720          int path_fd;
> >   2721
> >   2722          if (CHECK_ATTR(BPF_OBJ) || attr->bpf_fd !=3D 0 ||
> >   2723              attr->file_flags & ~(BPF_OBJ_FLAG_MASK | BPF_F_PATH=
_FD))
> >   2724                  return -EINVAL;
> >   2725
> >   2726          /* path_fd has to be accompanied by BPF_F_PATH_FD flag =
*/
> >   2727          if (!(attr->file_flags & BPF_F_PATH_FD) && attr->path_f=
d)
> >   2728                  return -EINVAL;
> >   2729
> >   2730          path_fd =3D attr->file_flags & BPF_F_PATH_FD ? attr->pa=
th_fd : AT_FDCWD;
> >   2731          return bpf_obj_get_user(attr->path_fd, u64_to_user_ptr(=
attr->pathname),
>
> argh.... s/attr->path_fd/path_fd/ here, but it's curious how tests
> didn't catch this because we always provide absolute path in
> attr->pathname, and from openat() man page:
>
>   If pathname is absolute, then dirfd is ignored.
>
> So whatever garbage FD is passed in (in this case 0), the kernel won't
> complain. Interesting. I'll send v3 with a fix.

because other tests have an absolute path to bpf objs?
