Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CA17F6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 03:23:13 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6260e8a1424so26367126d6.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 03 Jun 2023 20:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685848993; x=1688440993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3j1b2PCL9zmpQZGbEy07CfIrohfmMAKh0OXlOYM/r8=;
        b=f+gUAdcikhB0kmIc9D4zyKCdPv+l+Om+54rcNsftepq/Mpdqp+J5VZQwrtgl2y/Wqk
         pyRZg/CYT3RXGz+4zpYnbF/Mpvk3IBd2aCpXQe/kLzSuiE4mTa8KeudNKVFOvKIURo2D
         +i8KezXPLkCQs45lujEGr/gZUmpRuM7WIgkqdPl2JNr9mo+uPEUM44harBcDwjm5w4F1
         3WCZavzHTSYrHIlhqoFW1GxurostxVXj8bLy0mluiEKrHqOfsrXuDQtkM9Pizi0LNLy7
         PXqUQtyKLCNvN8YJSO/a5RyBnS1Rb18eOhPW6hwBCbU5LkzwkcabAwIpNWCLGVVGsxh2
         D55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685848993; x=1688440993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3j1b2PCL9zmpQZGbEy07CfIrohfmMAKh0OXlOYM/r8=;
        b=fQH6XT76IyFA5CIWwkpWSArjhkjfxO6QR/jgG9gtlnbQlbHPfAg5tBUwil9A4uAagp
         BvNYus3bzLg1sBvEqZ8bRHqOkd9QwEDCng8UtWs0tI5CbKRGFvn4X7kW3GmRICv2jW3Z
         QDk2r03PenJ1iUsP0QWrzg/0hX+DN9r2PNuADpxce0nh+OBHUXZeD8oDYDHqVPOXxmYR
         igYTDpas3XPCz6ERXU2Yv0S+xdgkDyNBziFuyt98pGb9KOgEFkJWfHYTAeBpgPZYEWur
         efSTnL6badWhNOaOhlhfs/z22jyZvXtjKxgSV8J1WuJ75O6ECz1YtFq/qayNrSZHs4q7
         9QkQ==
X-Gm-Message-State: AC+VfDyQRJ/WP8aXTMTZB+gx2ocw1WJgzPrpmSfrqoMvafz+4f7/4INl
	CuiapoSlRUquDbHrrepXUqsKt3i5gHRljA4tVL8=
X-Google-Smtp-Source: ACHHUZ5h3SB+IFvWLnsgRZFb2T+471h/375DGGMrFQMOc8JYdWYAiEG5DaS2URCj/C1OvyjNhVSSakIOuCbSN2Zdf3g=
X-Received: by 2002:a05:6214:d86:b0:626:29d4:9a09 with SMTP id
 e6-20020a0562140d8600b0062629d49a09mr4299951qve.53.1685848992654; Sat, 03 Jun
 2023 20:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602085239.91138-2-laoar.shao@gmail.com> <202306031438.0X2HPFQl-lkp@intel.com>
In-Reply-To: <202306031438.0X2HPFQl-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 4 Jun 2023 11:22:36 +0800
Message-ID: <CALOAHbDYPEVaK5bDfF=taEp33NcbXqDJrAMV1ERdfxaOZZizbQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/6] bpf: Support ->fill_link_info for kprobe_multi
To: kernel test robot <lkp@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	quentin@isovalent.com, oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 3, 2023 at 2:38=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Yafang,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Su=
pport-fill_link_info-for-kprobe_multi/20230602-165455
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230602085239.91138-2-laoar.sha=
o%40gmail.com
> patch subject: [PATCH bpf-next 1/6] bpf: Support ->fill_link_info for kpr=
obe_multi
> config: i386-randconfig-s002-20230601 (https://download.01.org/0day-ci/ar=
chive/20230603/202306031438.0X2HPFQl-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/intel-lab-lkp/linux/commit/270f3eb6c142f1f0e=
c7d800b8ecaab1b101682a0
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Yafang-Shao/bpf-Support-fill_lin=
k_info-for-kprobe_multi/20230602-165455
>         git checkout 270f3eb6c142f1f0ec7d800b8ecaab1b101682a0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Di386 olddefconfig
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash kernel/trace/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306031438.0X2HPFQl-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> kernel/trace/bpf_trace.c:2554:24: sparse: sparse: cast removes address=
 space '__user' of expression
> >> kernel/trace/bpf_trace.c:2571:26: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void [noderef] __user *=
to @@     got unsigned long long [usertype] *uaddrs @@
>    kernel/trace/bpf_trace.c:2571:26: sparse:     expected void [noderef] =
__user *to
>    kernel/trace/bpf_trace.c:2571:26: sparse:     got unsigned long long [=
usertype] *uaddrs
>    kernel/trace/bpf_trace.c:2492:21: sparse: sparse: dereference of noder=
ef expression
>    kernel/trace/bpf_trace.c:2496:66: sparse: sparse: dereference of noder=
ef expression
>
> vim +/__user +2554 kernel/trace/bpf_trace.c
>
>   2550
>   2551  static int bpf_kprobe_multi_link_fill_link_info(const struct bpf_=
link *link,
>   2552                                                  struct bpf_link_i=
nfo *info)
>   2553  {
> > 2554          u64 *uaddrs =3D (u64 *)u64_to_user_ptr(info->kprobe_multi=
.addrs);

Thanks for the report. Will fix it.

>   2555          struct bpf_kprobe_multi_link *kmulti_link;
>   2556          u32 ucount =3D info->kprobe_multi.count;
>   2557
>   2558          if (!uaddrs ^ !ucount)
>   2559                  return -EINVAL;
>   2560
>   2561          kmulti_link =3D container_of(link, struct bpf_kprobe_mult=
i_link, link);
>   2562          if (!uaddrs) {
>   2563                  info->kprobe_multi.count =3D kmulti_link->cnt;
>   2564                  return 0;
>   2565          }
>   2566
>   2567          if (!ucount)
>   2568                  return 0;
>   2569          if (ucount !=3D kmulti_link->cnt)
>   2570                  return -EINVAL;
> > 2571          if (copy_to_user(uaddrs, kmulti_link->addrs, ucount * siz=
eof(u64)))
>   2572                  return -EFAULT;
>   2573          return 0;
>   2574  }
>   2575
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Regards
Yafang
