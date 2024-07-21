Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A2DF44
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 22:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721601917; cv=none; b=ASkybDxU642Op3LVN5QSwOzqfyAZX2qVvZU1WCBx5TzGU+uTq6sTiDH62Ityvk19oCt5m1lKKdDLcpnw0CcToMSrIzCr4aCqKvM7uSraCNYAk0I0Hi53lgw32JFgQ5XzJNN0pVe/8a81y2JvxrGMW+VMnBtfVUH6nUkyswvOsaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721601917; c=relaxed/simple;
	bh=XAB61vLKJWnDQlcFZR7bf5Sq7OYUpOASYDv2+D+ZFO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7mrgPBTlUchaZM21L+3cSotWIKTceRyT0D6T7Yh/oGeoz1pHRs8CcO2bcayA81UkEe93yQImWTc8qcXOGYKbP04+hP9bPr3xUe6h+Gr7KwKQfPQE5re14bsdIG8r4IV9Cm88BnLKaP5/8LBcvmYplDaP0duPEcpFjUoLSUibXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltVkGrwc; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltVkGrwc"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-64f4fd64773so42250507b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721601915; x=1722206715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KImFB+SXLsoOxEFt5UuwpafcPo5jSSvyoPC95qiitmw=;
        b=ltVkGrwcHHhOnJtyvrXlCWgSObBt8shDTEAuXpymmk0PGJz2dTKpBujxnn5FSfuB/M
         qevAzHN78wc9yY2B0bzNKzEyGt5Qss/HC5bUJ9e51y/xLTvC7no5o7m97aaROPi5EWTH
         2mI5IgVF0GFKjz29yfmi9+Zowgsd0z9gm/G2l5hLY+QC6gzw4IIRd+bXcuaJEAnfuqLN
         Lf7dN4nb60Y/xaYmzWSO+9YHvEgFgX5ClPllP5rpH3bN/e3Cs51+BgTo/GsZnnOvRP0v
         C79eyAopSbf7H0Qbq0EFFAEllzfetp3emVGxKyA4Xilzw0VjJg/etAkCLOXvmRbX+qNy
         DGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721601915; x=1722206715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KImFB+SXLsoOxEFt5UuwpafcPo5jSSvyoPC95qiitmw=;
        b=K70eHMTMaNf64jkE08GDv1USs2Y4HRk+TukFSiQs3jpxX3j/Gqltdg+X3fynmTVdSf
         4gaKPhQ4EqvJIjPu4YoAIHbrRJNMtX7/evDXIiHcdkMfTSuBmVN8q8Vv8rJipzTda+Js
         LeIBjheSxSkKklIw27yFCVYvG8CYZ8acxny0q6zKE1rfBOuDNIICVuCdZ5yAJNlahHAk
         NxmmRiKPWsPA9TI4iCr37Jj5HSC7p7eRQn1A0NfW0WCsUprbfX++faMQ/iwmq/LPN0iP
         85XFcNfMAp7sl9awb8c6nCgg7tK/QtRNRUPzgmygvaK2U6/tnlKx1lGQTg0kxdzGx4yL
         DzxA==
X-Forwarded-Encrypted: i=1; AJvYcCU/8n5lTa6w6eIEvzKPfWuQX9rOEg2/91sAfkIkKA/DWic7D1pBa2186FDBkhRgrtdDpbu9eLnmOl/uuhKR/y6n7aPfS/7RCAsnSwCF0w==
X-Gm-Message-State: AOJu0YxP3MN9iWsPP42w79onoCxn2XgPPVqGD7j4d+UObqpFlq7MqCyK
	ewSY/aQn8BUeqwIoMlCMMluXqR2P3sFRvFcXYaxYk9jCgXxfxQuKo7fOt4DTbIIcLWIJZlD9rkl
	ps76BkomQbswdpOXeU/xf0LxTPbA=
X-Google-Smtp-Source: AGHT+IEXEhS4il9O4HiQcLX8Nw3RGKpo9YAEEBnYEsfJ5+/jEDb9u8VDy2aksWJ26btRZCRGD/H07koWeT/HmOl/hzg=
X-Received: by 2002:a05:690c:4589:b0:66a:b6d2:c184 with SMTP id
 00721157ae682-66ab6d2c901mr60003197b3.16.1721601914698; Sun, 21 Jul 2024
 15:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240720062233.2319723-2-martin.lau@linux.dev> <202407202244.HvnUVyjM-lkp@intel.com>
In-Reply-To: <202407202244.HvnUVyjM-lkp@intel.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Sun, 21 Jul 2024 15:45:04 -0700
Message-ID: <CAMB2axM565hLp1uuYggcEEPDA8y0NCpTn8gESmn6cPuyWfELJQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/3] bpf: Check unsupported ops from the
 bpf_struct_ops's cfi_stubs
To: kernel test robot <lkp@intel.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, bpf@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2024 at 7:45=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Martin,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Martin-KaFai-Lau/b=
pf-Check-unsupported-ops-from-the-bpf_struct_ops-s-cfi_stubs/20240720-14431=
3
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20240720062233.2319723-2-martin.=
lau%40linux.dev
> patch subject: [PATCH bpf-next 1/3] bpf: Check unsupported ops from the b=
pf_struct_ops's cfi_stubs
> config: i386-randconfig-001-20240720 (https://download.01.org/0day-ci/arc=
hive/20240720/202407202244.HvnUVyjM-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240720/202407202244.HvnUVyjM-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407202244.HvnUVyjM-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_supported':
> >> kernel/bpf/bpf_struct_ops.c:1045:48: warning: dereferencing 'void *' p=
ointer
>      void *func_ptr =3D *(void **)(&st_ops->cfi_stubs[moff]);
>                                                    ^
>
>
> vim +1045 kernel/bpf/bpf_struct_ops.c
>
>   1042
>   1043  int bpf_struct_ops_supported(const struct bpf_struct_ops *st_ops,=
 u32 moff)
>   1044  {
> > 1045          void *func_ptr =3D *(void **)(&st_ops->cfi_stubs[moff]);

The compiler warning can be fixed with:
void *func_ptr =3D *(void **)(st_ops->cfi_stubs + moff);

The patch looks good to me. I tested it with bpf qdisc, and it does
what it is supposed to do by prohibiting users to attach to an
operator whose cfi stub is not defined.

Thanks,
Amery


>   1046
>   1047          return func_ptr ? 0 : -ENOTSUPP;
>   1048  }
>   1049
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
