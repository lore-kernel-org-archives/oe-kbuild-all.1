Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059A386
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 23:38:44 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id u9so59178688edd.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Mar 2023 15:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678232323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsjKpk5Xp/eDGweOvjrgV/4B1gupExWnHgnL/97NTFA=;
        b=J/dHIop6AscTHTN1ibeEPYzc2UGFHsFEw4lw8eW9l6HfelpgPoP44iuaQCYPJDtWA5
         50bO3kSeO0b1b6eCXeHHiFLYo+bGD3ijHInV7tNl1ebD1LX8W3i0j9m2Fs73oKthso7/
         goOe2kHMVjEOUNHPxH66fb054dDL341ZIM9ZKvmvgekAbD6PIB6bvpT9F5FwcScLwBXa
         Op1+PtBGHCIv7rbFSyr9BXGDA4AYOgdi2i6KMRUB5o4/WAMLvoClIvBzfYatb3uZqwTT
         R2cvGugjF5urBtQBz9k+cyS6iC0ME07jOjA8/knHllojSPujm9UrL6qR4WIhXsoKcoeq
         jjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678232323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsjKpk5Xp/eDGweOvjrgV/4B1gupExWnHgnL/97NTFA=;
        b=7NF0RwNeGJfdPHBeAODJ3r6vupmPQNcsfjMM5w5A5uwpxtY9glnULqlvscnUT6wLfT
         XFscJs35TVKALG9+qvaUqoKu4oPr0GeLxyCgVWGGGMorTQtK9eyRRcPvC71DiNpB1SYo
         3OCdx9nZs/ipEDmZnZEUCjNziyZFz4YAZuq6HLewS8MLCoPFbPPORZiRe9WucWHHfFKi
         CYe/YHaaNQO/wVcnAdPVDnvbSDs+mvsI9a40ggF4Y8IEERQiI0uD024+bhPMyThblNj2
         bt9L1oEg1HkZR2mBRu+wP1ISQRg8zWQnN92vwBQtkyeJkN64Jd0ShqtU6H1K5QhPAyN7
         iksA==
X-Gm-Message-State: AO0yUKUneeQDy7AAwKrRALJAKt9bjcsQuNRmK5vNT07TWdBp6Ex4qEre
	htuSTSLaTrgy46o/w97xfZ/i1HTcK/eMfgkS6dI=
X-Google-Smtp-Source: AK7set/phfMctxOrcMqR9vhMN1i2+OrLdTUQdqxNXTtwG9WVbprWdNgH3sU/zPvWs34KP3PM6Pnt+UReg28fT8V/Fhc=
X-Received: by 2002:a50:cd94:0:b0:4c2:1a44:642e with SMTP id
 p20-20020a50cd94000000b004c21a44642emr9208296edi.5.1678232322815; Tue, 07 Mar
 2023 15:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307215329.3895377-4-andrii@kernel.org> <202303080733.7uzHxIB0-lkp@intel.com>
In-Reply-To: <202303080733.7uzHxIB0-lkp@intel.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 7 Mar 2023 15:38:30 -0800
Message-ID: <CAEf4BzYPu5ABeEcwoGTKnjEb5=jYj772KQ0nW9Ub21-8SVqvVQ@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next 3/8] bpf: add support for open-coded iterator loops
To: kernel test robot <lkp@intel.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, oe-kbuild-all@lists.linux.dev, kernel-team@fb.com, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 3:27=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Andrii,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bp=
f-factor-out-fetching-basic-kfunc-metadata/20230308-055530
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230307215329.3895377-4-andrii%=
40kernel.org
> patch subject: [PATCH v2 bpf-next 3/8] bpf: add support for open-coded it=
erator loops
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/202303=
08/202303080733.7uzHxIB0-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/9eada50b93c4fc3f4=
1032699fda73bc125b37d0e
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Andrii-Nakryiko/bpf-factor-out-f=
etching-basic-kfunc-metadata/20230308-055530
>         git checkout 9eada50b93c4fc3f41032699fda73bc125b37d0e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dm68k olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cro=
ss W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash kernel/bpf/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303080733.7uzHxIB0-lkp@i=
ntel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/verifier.c: In function 'is_iter_reg_valid_init':
> >> kernel/bpf/verifier.c:1255:32: warning: variable 't' set but not used =
[-Wunused-but-set-variable]
>     1255 |         const struct btf_type *t;
>          |                                ^
>
>
> vim +/t +1255 kernel/bpf/verifier.c
>
>   1250
>   1251  static bool is_iter_reg_valid_init(struct bpf_verifier_env *env, =
struct bpf_reg_state *reg,
>   1252                                     struct btf *btf, u32 btf_id, i=
nt nr_slots)
>   1253  {
>   1254          struct bpf_func_state *state =3D func(env, reg);
> > 1255          const struct btf_type *t;
>   1256          int spi, i, j;
>   1257
>   1258          spi =3D iter_get_spi(env, reg, nr_slots);
>   1259          if (spi < 0)
>   1260                  return false;
>   1261
>   1262          t =3D btf_type_by_id(btf, btf_id);

some leftover from early v2 attempts, doh

I'll wait an hour or two for some other feedback before spamming with v4

>   1263
>   1264          for (i =3D 0; i < nr_slots; i++) {
>   1265                  struct bpf_stack_state *slot =3D &state->stack[sp=
i - i];
>   1266                  struct bpf_reg_state *st =3D &slot->spilled_ptr;
>   1267
>   1268                  /* only main (first) slot has ref_obj_id set */
>   1269                  if (i =3D=3D 0 && !st->ref_obj_id)
>   1270                          return false;
>   1271                  if (i !=3D 0 && st->ref_obj_id)
>   1272                          return false;
>   1273                  if (st->iter.btf !=3D btf || st->iter.btf_id !=3D=
 btf_id)
>   1274                          return false;
>   1275
>   1276                  for (j =3D 0; j < BPF_REG_SIZE; j++)
>   1277                          if (slot->slot_type[j] !=3D STACK_ITER)
>   1278                                  return false;
>   1279          }
>   1280
>   1281          return true;
>   1282  }
>   1283
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
