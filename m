Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49615110B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 09:33:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-403012f27e1so58335085e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 02:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695116012; x=1695720812; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpYHaXDJ9fV3McCT5caMeGlmzeSYOtE24Q/o7Z1lAx0=;
        b=RFB2EVW6X629Ftgm2pxCjElmEMddmAUDwzKdCqk0mGLPNCc1vAeeVLZrEdpM0krbHm
         GISd9I+gUOhLoSFb9XUYHMTpBWH7z/feubRQyFRF9DJ6Nbs7cbiHIVg6kSEpzg7BNatk
         ksHSRN/N0fSVqqpMyxZbRJEuHtCNWwOrTNxIwTKlZ6HLM5Muna39sx9wL92IqTKA3B0T
         m29zxdSpDI70SCckRJiFW5oy4GLRyAkMViY+zEAyAHQb11RUqjtXiOlEUVyXjQZ2dUA+
         ZFuQuaaMb57hyTYrY5yF0EO+Uix8fDGR4/rvjskzaLWN6Xv0yFXhwNhDmphDwrbhCiN7
         JwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695116012; x=1695720812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpYHaXDJ9fV3McCT5caMeGlmzeSYOtE24Q/o7Z1lAx0=;
        b=jt0v1fzsPV6Fp9B3vHkghDWRc4VVTCPbxBWnh2K63Gc1w/b2AkkqsR9Jlv6FAOw6I1
         38kHj3xxYKhiedH3qHoC4124A07ex/8dbWTDZM07AoN/pZDmiUA8SsrMYDZRjn9n7BeJ
         xlxD92A11R/gwnQFL9i8URhK2a0DM8aiwJwlY5SLwoNQekh/4L61ESAgu/YQirxFHeN8
         4pxjAF6J/gjitA32xQ2S/lQFe0aEQyH5OBEdnYSqctskwtJnxRUzdgepjQT12KPBnY2S
         QtTMtDHOPoN+Vv5nxNFMFyWrtQPvMNvshTdz1CB58oVsmIKB0/JaIz5xDz0smgwtxglO
         VNSw==
X-Gm-Message-State: AOJu0YyqzL0d/FIRX8JkN48hPKLNK9sfhJe6jYMoqHVN61vQmvKzbDNg
	IAvEbti74fyRRyhgF+6/I95Ld5/U1J9WAxoI6dWKaAMxVOk=
X-Google-Smtp-Source: AGHT+IFoeASmfFuxlv4GDCZjiRfLtAzZFkECWaLXabSgbEsfWe9UvJ2c42YXYzNjsAGXKQNQQxdE0buGI7r1JzgxgCE=
X-Received: by 2002:a05:6000:98d:b0:320:a19:7f87 with SMTP id
 by13-20020a056000098d00b003200a197f87mr5985622wrb.18.1695116012003; Tue, 19
 Sep 2023 02:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202309190634.fL17FWoT-lkp@intel.com>
In-Reply-To: <202309190634.fL17FWoT-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 19 Sep 2023 02:33:19 -0700
Message-ID: <CAADnVQLvqidYQp4jnrL+ryi5o32P-yqHgrQ+aKdp5gvDBndbJw@mail.gmail.com>
Subject: Re: [linux-next:master 5430/5912] kernel/bpf/verifier.c:15232:13:
 warning: variable 'prev_offset' set but not used
To: kernel test robot <lkp@intel.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 3:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   7fc7222d9680366edeecc219c21ca96310bdbc10
> commit: aaa619ebccb2b78b3c6d2c0cd72d206ee8fc0025 [5430/5912] bpf: Refacto=
r check_btf_func and split into two phases
> config: arc-randconfig-002-20230919 (https://download.01.org/0day-ci/arch=
ive/20230919/202309190634.fL17FWoT-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230919/202309190634.fL17FWoT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309190634.fL17FWoT-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    kernel/bpf/verifier.c: In function 'check_btf_func':
> >> kernel/bpf/verifier.c:15232:13: warning: variable 'prev_offset' set bu=
t not used [-Wunused-but-set-variable]
>    15232 |         u32 prev_offset =3D 0;
>          |             ^~~~~~~~~~~
> >> kernel/bpf/verifier.c:15225:35: warning: variable 'min_size' set but n=
ot used [-Wunused-but-set-variable]
>    15225 |         u32 i, nfuncs, urec_size, min_size;
>          |                                   ^~~~~~~~

Applied trivial fix to bpf-next.
