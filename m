Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B331AF24
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 04:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765774611; cv=none; b=cnYzEMslCYbzYp+j7qy3qnSTkZoZYRLeH93Q36rzlsyETQS4yghi7oopXARagM/3rFhwRBOKzdt2FNTKzizvVQBosjVZzu72uUAgdxtsnVNqP00u/cN4JRkfJfutiqkcLZzoaRJcK2uEiu1ijTMbggqCjmvIKgVVzjmP+roIpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765774611; c=relaxed/simple;
	bh=dyWaY6Fyj3zh8+NX1FMllbUobGrRmcg99lsPSxMvcLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGwU3+w8XN9l8Al8YYHJzU0RbtrvyRSCvJR+2Sf93uqXz6X5OVtPYhP+QDHhrU6yg4DQqUY2kiGO94wy1Fyj2MfEn6Z87jn7fFYsqYqmgVEhZLtbjBeg37s47AAyYH7L+xprqsRSpK8E2IXs7dKkLTh7xLOku3aTPsqznzIaO1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7vjr3CX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7vjr3CX"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7370698a8eso407403966b.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 20:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765774608; x=1766379408; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPCFQP3Vt5EBLlG8b8H61bS7KpkCTlBSE7JQzBw720w=;
        b=e7vjr3CXdIvpWQOFw1GYAb/cmUWvi4nER86Fp+xZQsmozioqocIYca0OCqVG7QQUsh
         BqAhKz08FJmwIQOje9y7gZ1JeJ7N1FUHWBNIASf1YS63bddI5qqXetW4L5cb4+eMTrIw
         ilBP8ldRkr6RXSG5nKBt0EJyKng3CpBdDvVd8by1085x42k0Cxe0SMnEjBOGoREQUm5D
         9lo+hHoMXZuEzV0hCpibShf7DMUUrzkgC+al7InpCIM5twa/seuDwEPQrL3DIrx8+mP7
         TDNesQHBD0H5xfeApCTJRYaB/5p82p0303g+YwFyKl/kj4gY3GYCOLXp4U40Uf8K1BMs
         l4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765774608; x=1766379408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPCFQP3Vt5EBLlG8b8H61bS7KpkCTlBSE7JQzBw720w=;
        b=YgGvYvYHW513kGuEkPelGy/3/6NfsQt84Q8zWsVdhHPrC7vEvhojsG2K1IegK0+Ori
         KG726GDv5rlHbNeIFB7Xky9mzLZaYpz9+Rrtz2mq+5y4kOQMrBxZ4CHvLtc2L7kzvGco
         MLFX8S/GOeQ1XAfR5LZvRvNuflF+wLu4c+Q0dY/4tzZ/xXc109SZ+vo1R3wqVypNqq9s
         Wu/L6RvTHV7xHyVfKiTKUsdWKWoQH//HujwhPp/Svjb/lL+3YrkyqCUwyDgRcVdg6iZt
         TYC6+8EqTVTakR+u1/GkXBMnPAjD25Xfxk9q8UTMbOJRYUq3+Tj7V5+oyMrBSHDvwyzt
         0ieA==
X-Forwarded-Encrypted: i=1; AJvYcCXMBuYd53HLuHx3OJNQZTK3fGaxX3s6NceD7Jxx5CLYTYrJQAPDfNR8HtX+lSjqTZIxJJq0bLizFoL4FD9M@lists.linux.dev
X-Gm-Message-State: AOJu0YyNT4kbWWvtOwifwjI4cGCU1lJtugiM6IlsOUw9wHm9KZnJa0pU
	MHP5xbQL9PDK06V3Ri87XKasJCup45q3H0ZAi9+tOpS393IG3FYtkGm4NzK3ramv53NB4WPQhsZ
	YxKRSy7ANgOL6TI6pxJqDLvMxA1kgGe4=
X-Gm-Gg: AY/fxX5pGP+e5idxa+I2o3yymqqPB2sFj4YtJNz/nbrRbaW2dFO1AzdEhpNDKwOkRsZ
	snUhjkrIjoeHuJ6Rq7Bqm6IfF1Ipg/ivRjPOQeQwR9WVBEfqJrShAWnMz3mcWcxsMhwMjWDPty9
	bwQ4nV5Gw3DI/t1LU+sMQliKOBD8YiD8I3tv1zv3XPzTlooVP/pOwKyTRlGYyRTDwp9BEgnCv1W
	TAgLRY98Fwg7m7epCykoQBDLuqufSw7TN30fK5XO8Qb/fzzb8/Up+tcURjg/lFwDVedN6Gz
X-Google-Smtp-Source: AGHT+IFrfJBBUqe+fJTs/otz3aUzkW8Pl0HnggOO5N0PlXVavpMLXgznKsETHhKbrHpJk7KNU5ZMajnlz703M/7GIhw=
X-Received: by 2002:a17:906:4fd5:b0:b76:2667:7717 with SMTP id
 a640c23a62f3a-b7d23aa4046mr1086480366b.56.1765774607557; Sun, 14 Dec 2025
 20:56:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251209121349.525641-2-dolinux.peng@gmail.com> <202512140850.JdD1lPmn-lkp@intel.com>
In-Reply-To: <202512140850.JdD1lPmn-lkp@intel.com>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Mon, 15 Dec 2025 12:56:35 +0800
X-Gm-Features: AQt7F2r7qaPfCZNFQJWN3FmkMI3nvzBmLh_-WHohqasKL2htaY_edIPtmNPav3E
Message-ID: <CAErzpmvxz7mthfTxc4gWFqcCW66ckuHaFnjQbakSHj31x1vOOQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] fgraph: Enhance funcgraph-retval with BTF-based
 type-aware output
To: kernel test robot <lkp@intel.com>
Cc: rostedt@goodmis.org, oe-kbuild-all@lists.linux.dev, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pengdonglin <pengdonglin@xiaomi.com>, 
	Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 9:15=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Donglin,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on trace/for-next]
> [also build test ERROR on linus/master v6.18 next-20251212]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/fgrap=
h-Enhance-funcgraph-retval-with-BTF-based-type-aware-output/20251209-201633
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace=
 for-next
> patch link:    https://lore.kernel.org/r/20251209121349.525641-2-dolinux.=
peng%40gmail.com
> patch subject: [PATCH v3 1/2] fgraph: Enhance funcgraph-retval with BTF-b=
ased type-aware output
> config: arm-randconfig-002-20251214 (https://download.01.org/0day-ci/arch=
ive/20251214/202512140850.JdD1lPmn-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251214/202512140850.JdD1lPmn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512140850.JdD1lPmn-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arm-linux-gnueabi-ld: kernel/trace/trace_functions_graph.o: in functio=
n `trim_retval':
> >> kernel/trace/trace_functions_graph.c:888: undefined reference to `btf_=
find_func_proto'

Thanks. I will address this in the next version. The issue occurs because
CONFIG_FUNCTION_GRAPH_RETVAL and CONFIG_DEBUG_INFO_BTF
are enabled, but CONFIG_PROBE_EVENTS_BTF_ARGS is disabled.
This prevents trace_btf.c from being compiled, while the function
btf_find_func_proto
it provides is still required.

Thanks,
Donglin
>
>
> vim +888 kernel/trace/trace_functions_graph.c
>
>    872
>    873  static void trim_retval(unsigned long func, unsigned long *retval=
, bool *print_retval,
>    874                          int *fmt)
>    875  {
>    876          const struct btf_type *t;
>    877          char name[KSYM_NAME_LEN];
>    878          struct btf *btf;
>    879          u32 v, msb;
>    880          int kind;
>    881
>    882          if (!IS_ENABLED(CONFIG_DEBUG_INFO_BTF))
>    883                  return;
>    884
>    885          if (lookup_symbol_name(func, name))
>    886                  return;
>    887
>  > 888          t =3D btf_find_func_proto(name, &btf);
>    889          if (IS_ERR_OR_NULL(t))
>    890                  return;
>    891
>    892          t =3D btf_type_skip_modifiers(btf, t->type, NULL);
>    893          kind =3D t ? BTF_INFO_KIND(t->info) : BTF_KIND_UNKN;
>    894          switch (kind) {
>    895          case BTF_KIND_UNKN:
>    896                  *print_retval =3D false;
>    897                  break;
>    898          case BTF_KIND_STRUCT:
>    899          case BTF_KIND_UNION:
>    900          case BTF_KIND_ENUM:
>    901          case BTF_KIND_ENUM64:
>    902                  if (kind =3D=3D BTF_KIND_STRUCT || kind =3D=3D BT=
F_KIND_UNION)
>    903                          *fmt =3D RETVAL_FMT_HEX;
>    904                  else
>    905                          *fmt =3D RETVAL_FMT_DEC;
>    906
>    907                  if (t->size > sizeof(unsigned long)) {
>    908                          *fmt |=3D RETVAL_FMT_TRUNC;
>    909                  } else {
>    910                          msb =3D BITS_PER_BYTE * t->size - 1;
>    911                          *retval &=3D GENMASK(msb, 0);
>    912                  }
>    913                  break;
>    914          case BTF_KIND_INT:
>    915                  v =3D *(u32 *)(t + 1);
>    916                  if (BTF_INT_ENCODING(v) =3D=3D BTF_INT_BOOL) {
>    917                          *fmt =3D RETVAL_FMT_BOOL;
>    918                          msb =3D 0;
>    919                  } else {
>    920                          if (BTF_INT_ENCODING(v) =3D=3D BTF_INT_SI=
GNED)
>    921                                  *fmt =3D RETVAL_FMT_DEC;
>    922                          else
>    923                                  *fmt =3D RETVAL_FMT_HEX;
>    924
>    925                          if (t->size > sizeof(unsigned long)) {
>    926                                  *fmt |=3D RETVAL_FMT_TRUNC;
>    927                                  msb =3D BITS_PER_LONG - 1;
>    928                          } else {
>    929                                  msb =3D BTF_INT_BITS(v) - 1;
>    930                          }
>    931                  }
>    932                  *retval &=3D GENMASK(msb, 0);
>    933                  break;
>    934          default:
>    935                  *fmt =3D RETVAL_FMT_HEX;
>    936                  break;
>    937          }
>    938  }
>    939
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
