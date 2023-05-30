Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FB3A42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 01:43:11 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6260bb94363so19394426d6.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 18:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685410990; x=1688002990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZhBCddfMEWt6ohNwkUglZ2f7npMux5N9R9w5sPjI/Q=;
        b=g2wTbsvb5WOYKBLDYCw7DTRTwgPhgrjTxeY6knaopNPxPrvpjBVJjUoyeHcAC7HRb6
         GhL8Sbzl1nyjEumSBdqUBSal11zAY0L4X2fTwXBrPfLD4m26F0XwrwuGx48jzCEptCId
         OcKJ7RHXXFXu65++cODdAvP+UXn2/dL462L8wvNBwAs/zbq5wnnlbhVub7UJKFPShctF
         QsJuP+3XlO5j+Q6sJbFQvnd8zmSKOtA3fhuJvd6E9RE0WdkWNZi+kSQ2AG/8GOowr8N+
         TAJKOk2PCsu3KsWFjymq9PfC25BcoP25S5M16iPfbJ7EBTO8no0kPLo7DD2mQ+TvaWIz
         mXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685410990; x=1688002990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZhBCddfMEWt6ohNwkUglZ2f7npMux5N9R9w5sPjI/Q=;
        b=Fqgb2evNl2Qshmj7uRW+8Rg5mazDKQPIZvvoCw04bm4OY4IdIlHGl7A6WaGabJ9zIO
         2Na9kCYeuS+OPyZ5qqg132+W16WKY70nFD1+eJtHF9S7RUrEINyxKnbhPbj9/g/DCBl/
         WJZAFyj8ErspWLv25u80LfpnOusf2wbCi+lLXBHT55apMyXI4eylQvO0JVvQJQlxGTC5
         cYg7BUChuXf6ZD0UKGD3V6+tqpyZRKRlDUVMoXvkLoryhEOR2pMIVC7YzTrECkrSfulc
         OHePgDlEmKJ76WLbWhjSpje6SMYghBmbSBfEIaeLUx42JBCXWmXHiVyRwipWnnyzhy6O
         oycw==
X-Gm-Message-State: AC+VfDxsNykmFHrrX8vVwC+skuibgsQGos1FJkej3jly3Sd48663VK1e
	nIkleQ1Ib9pyVaeRoPrccVib8v57/0wAWNzFeSk=
X-Google-Smtp-Source: ACHHUZ7pxtil0uksn0mwhVUMMdppptJGS1X0Sp4nhS91l3fCyI5uu7LtW0/FEpxlNz465OLmCewZDl62oHKg9+/xU9U=
X-Received: by 2002:a05:6214:1bce:b0:626:c17:8b55 with SMTP id
 m14-20020a0562141bce00b006260c178b55mr1065757qvc.25.1685410990668; Mon, 29
 May 2023 18:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230528142027.5585-3-laoar.shao@gmail.com> <202305291024.nGHfS0BE-lkp@intel.com>
In-Reply-To: <202305291024.nGHfS0BE-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 30 May 2023 09:42:34 +0800
Message-ID: <CALOAHbAf0Z-aPSPC3tFO5poYWbSAMOZ2rF-LtjUOsdkwvX-gzA@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 2/8] bpf: Support ->fill_link_info for kprobe_multi
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 10:45=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Yafang,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/bpf-Su=
pport-show_fdinfo-for-kprobe_multi/20230528-222347
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20230528142027.5585-3-laoar.shao=
%40gmail.com
> patch subject: [RFC PATCH bpf-next 2/8] bpf: Support ->fill_link_info for=
 kprobe_multi
> config: x86_64-randconfig-s043-20230528 (https://download.01.org/0day-ci/=
archive/20230529/202305291024.nGHfS0BE-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://github.com/intel-lab-lkp/linux/commit/025a35eef533c935b=
bcad95fd50bd973538ef4f7
>         git remote add linux-review https://github.com/intel-lab-lkp/linu=
x
>         git fetch --no-tags linux-review Yafang-Shao/bpf-Support-show_fdi=
nfo-for-kprobe_multi/20230528-222347
>         git checkout 025a35eef533c935bbcad95fd50bd973538ef4f7
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash kernel/trace/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305291024.nGHfS0BE-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> kernel/trace/bpf_trace.c:2571:23: sparse: sparse: incorrect type in in=
itializer (different address spaces) @@     expected unsigned long long [us=
ertype] *uaddrs @@     got void [noderef] __user * @@
>    kernel/trace/bpf_trace.c:2571:23: sparse:     expected unsigned long l=
ong [usertype] *uaddrs
>    kernel/trace/bpf_trace.c:2571:23: sparse:     got void [noderef] __use=
r *
> >> kernel/trace/bpf_trace.c:2591:41: sparse: sparse: incorrect type in ar=
gument 1 (different address spaces) @@     expected void [noderef] __user *=
to @@     got unsigned long long [usertype] * @@
>    kernel/trace/bpf_trace.c:2591:41: sparse:     expected void [noderef] =
__user *to
>    kernel/trace/bpf_trace.c:2591:41: sparse:     got unsigned long long [=
usertype] *
>    kernel/trace/bpf_trace.c:2492:21: sparse: sparse: dereference of noder=
ef expression
>    kernel/trace/bpf_trace.c:2496:66: sparse: sparse: dereference of noder=
ef expression
>
> vim +2571 kernel/trace/bpf_trace.c
>
>   2566
>   2567  static int bpf_kprobe_multi_link_fill_link_info(const struct bpf_=
link *link,
>   2568                                                  struct bpf_link_i=
nfo *info)
>   2569  {
>   2570          struct bpf_kprobe_multi_link *kmulti_link;
> > 2571          u64 *uaddrs =3D u64_to_user_ptr(info->kprobe_multi.addrs)=
;

Many thanks for the report!
Will correct it in the next version.

>   2572          u32 ucount =3D info->kprobe_multi.count;
>   2573          int i;
>   2574
>   2575          if (!uaddrs ^ !ucount)
>   2576                  return -EINVAL;
>   2577
>   2578          kmulti_link =3D container_of(link, struct bpf_kprobe_mult=
i_link, link);
>   2579          if (!uaddrs) {
>   2580                  info->kprobe_multi.count =3D kmulti_link->cnt;
>   2581                  return 0;
>   2582          }
>   2583
>   2584          if (!ucount)
>   2585                  return 0;
>   2586
>   2587          if (ucount !=3D kmulti_link->cnt)
>   2588                  return -EINVAL;
>   2589
>   2590          for (i =3D 0; i < ucount; i++)
> > 2591                  if (copy_to_user(uaddrs + i, kmulti_link->addrs +=
 i,
>   2592                                   sizeof(u64)))
>   2593                          return -EFAULT;
>   2594          return 0;
>   2595  }
>   2596
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Regards
Yafang
