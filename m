Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1722B669
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815883; cv=none; b=A6iKjRf/vNXhqtNDe9WVwgknflN/wHUVZK29RkMfy4U+7hFKtl4Re9Wr2xR73xfPclM32DWdN1bTbsl7Z1laC/B/kuJQEE6AlX1NVaq+WYpRHZbgNnl7Qj6JiEoDKyLwSJoa9ZnpRHHydg9FoNF5HnMwizKcBXxeEBujUW06lno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815883; c=relaxed/simple;
	bh=UpnRrG99LA1Rx1tfoIP8j4Uc2j+wPbasOMgMZTJHmyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5SMbe6Amgi0dT9RaSn+xLm7u96e2jzzQtyTRkUFGMkUJqpE4JYPo4t7JdGrS1uiqdfzDuGxD0JSRiAZ0DvkCTLRE2ivILPj0Yx59d60cdlVgb8ZQ+HJ+yJthJ9uBVEfzTLXin6z2mRKZT87HTZqwOjJjlnzExZ+AZt6uW0hFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZEJiUaSx; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZEJiUaSx"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-460969c49f2so141211cf.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 17:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729815880; x=1730420680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nuT0fnnlxs5eAyzDSS9qSu7p9GRGl497Qq89CE+BNc=;
        b=ZEJiUaSxrxWKpM63klJVtpJIM4Wus8s8ESmmfgPRq97jj97UO4j8NWBPyxIlsuIvHt
         kU5RXeHVKWJVfmdpxb7RxcHwRLluLGI+JZWskqnPD6ERdegSZoWb+XQuemDisPYlTnUV
         +0vw6z9GbLyDuceNn5T0urIpFhwz+AKFYSW4wEWoVrI1WqZBqMW67epRvKcLtapqteeS
         YL1od8O0MJhMU3FSGuNC6rU7zinsXA+6ByvLsz/3DMpGOA1YtaBatuYYgZ7ApzPOSsVa
         v9ylMzvr6uu8vPPCX2M4eu0pUgDzYzzazlwu8dppHuPjFFtvIazZ4Ie+BXe9idwdyMyk
         eqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815880; x=1730420680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nuT0fnnlxs5eAyzDSS9qSu7p9GRGl497Qq89CE+BNc=;
        b=jXMAfIvyFH+RPvIp8vDnNLCoMpyuLH/LDrq8sg9Jvlhn6cbdX6blv3bqOdbmFPn3pR
         0MfSxj0r6kvg3bzwXQigu3fXtwKkZXgucLelHS0XAma/5COnONWv0L3Zbp0FZh7X289Y
         a1sv5ZWlGIVBosdp08BxBTVq/iqFMJ/4C9OHxhWn+VjEtrPzuSuUkk9ah6WIfbMAmc61
         jhZYzkWVyZx/eXrXlBGPbEduyHgVyzSChp9i+HW1fAv3u2gz22yCI7ra0sJwQq8oh3xf
         Aph9kVkCKjSBSuvp4tqmwrzmvC4M9z4ENTh+e24egTrfft4Ys8x5arMM8VS5xeUJVpVe
         1LPA==
X-Gm-Message-State: AOJu0YzEbyMUWkbGrbLQpaEjmdClYUqJZEInRGgg6WxHLEMaFcC6aHv+
	/kC7YZNqVrj9ozNP2VQ2AjWua2P53pabOETlQmM8YNSWRnDmvXjmE7q9ISkvAEBPuFYboz2lpWO
	Vs0ohAurDhqqOJJShDYvtaFL/MJkwh+KcbJE3
X-Google-Smtp-Source: AGHT+IHtSG99EbfebDXsUToNxk38hYC677s68nuuV2ReNo+2/qpqm/8TebR0/8TGqeBmyFFlFonNiBfYqaTyGiNODJg=
X-Received: by 2002:a05:622a:15cd:b0:461:2827:5176 with SMTP id
 d75a77b69052e-4613069daa9mr729931cf.17.1729815880199; Thu, 24 Oct 2024
 17:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023170759.999909-5-surenb@google.com> <202410250808.dQGyYjlk-lkp@intel.com>
In-Reply-To: <202410250808.dQGyYjlk-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 24 Oct 2024 17:24:27 -0700
Message-ID: <CAJuCfpFwY06BUj+qbgkV48PUfKYTXf4rZe6h82Ho5sHYAnVh=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] alloc_tag: populate memory for module tags as needed
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 5:11=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on b5d43fad926a3f542cd06f3c9d286f6f489f7129]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/maple_tree-add-mas_for_each_rev-helper/20241024-010916
> base:   b5d43fad926a3f542cd06f3c9d286f6f489f7129
> patch link:    https://lore.kernel.org/r/20241023170759.999909-5-surenb%4=
0google.com
> patch subject: [PATCH v4 4/6] alloc_tag: populate memory for module tags =
as needed
> config: sh-rsk7203_defconfig (https://download.01.org/0day-ci/archive/202=
41025/202410250808.dQGyYjlk-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241025/202410250808.dQGyYjlk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410250808.dQGyYjlk-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sh4-linux-ld: mm/execmem.o: in function `execmem_vmap':
> >> mm/execmem.c:385:(.text+0xf4): undefined reference to `__get_vm_area_n=
ode'

Thanks for the report!
I think this is due to CONFIG_NOMMU=3Dy. I'll fix that in the next version.

>
>
> vim +385 mm/execmem.c
>
>    370
>    371  struct vm_struct *execmem_vmap(size_t size)
>    372  {
>    373          struct execmem_range *range =3D &execmem_info->ranges[EXE=
CMEM_MODULE_DATA];
>    374          struct vm_struct *area;
>    375
>    376          area =3D __get_vm_area_node(size, range->alignment, PAGE_=
SHIFT, VM_ALLOC,
>    377                                    range->start, range->end, NUMA_=
NO_NODE,
>    378                                    GFP_KERNEL, __builtin_return_ad=
dress(0));
>    379          if (!area && range->fallback_start)
>    380                  area =3D __get_vm_area_node(size, range->alignmen=
t, PAGE_SHIFT, VM_ALLOC,
>    381                                            range->fallback_start, =
range->fallback_end,
>    382                                            NUMA_NO_NODE, GFP_KERNE=
L, __builtin_return_address(0));
>    383
>    384          return area;
>  > 385  }
>    386
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
