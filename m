Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D4364B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 00:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSEFGYGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07648C433C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 00:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703465456;
	bh=VcCLA5eCTXgJgraNY4y0YxuwUtYfoQOD/SCajC55leE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jSEFGYGIyXOezD3XocNQYloxoRQnvjCFK/+rAV97BTbp+9btcB1SVZXkSzqns69wl
	 UWcQouuLW37m8Podx2ycEIi2WVknxWFY7xUmKFwqVxk6etZcRhP0b6XuJsIjm3APbJ
	 7lu6vS2wk+jNYzRmoDRDxRVRogSQwjlwRB820SZ4p7fMfbLdaeXcBS1P9SiUoElyqF
	 CLOC6BETE4LH2B5qKhLooqociwlx0WGRwaLVXRcHC91BuUqoBFkV7lk/0GfuFXk7Z6
	 xzy6hWWTukLf4i85VNm2gTwStewASnXGnfPw4MEHSB5i6aD7aDIwiPMsS26pxc327z
	 ymeZm6nihgrNg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e72e3d435so972955e87.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 16:50:55 -0800 (PST)
X-Gm-Message-State: AOJu0YwZlZV5MEfB0XFtIVSKacYmSozuSmf9Lm4ZkANrqLQSzroW94pI
	hEe0rWttHc1z2KPLu6RPQx//GKydPlHmtx36/og=
X-Google-Smtp-Source: AGHT+IH90J4KnzZLCwUnCaXjURIt02FYrRF4Q26oIdgdXEESUgnXPw4x9qHxf0TaHz+zFtx3R9v2yrm+x3JySh1S6/w=
X-Received: by 2002:a05:6512:1291:b0:50d:10e4:cfe0 with SMTP id
 u17-20020a056512129100b0050d10e4cfe0mr1243495lfs.200.1703465454210; Sun, 24
 Dec 2023 16:50:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312241609.w1nPmrz3-lkp@intel.com>
In-Reply-To: <202312241609.w1nPmrz3-lkp@intel.com>
From: Song Liu <song@kernel.org>
Date: Sun, 24 Dec 2023 16:50:43 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4_esoAtHWrikykR0bEc0SxK8n7u2BLoUkoN016R3x3LQ@mail.gmail.com>
Message-ID: <CAPhsuW4_esoAtHWrikykR0bEc0SxK8n7u2BLoUkoN016R3x3LQ@mail.gmail.com>
Subject: Re: [linux-next:master 3585/10295] WARN: resolve_btfids: unresolved
 symbol bpf_get_file_xattr
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 24, 2023 at 1:03=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   39676dfe52331dba909c617f213fdb21015c8d10
> commit: ac9c05e0e453cfcab2866f6d28f257590e4f66e5 [3585/10295] bpf: Add kf=
unc bpf_get_file_xattr
> config: powerpc64-randconfig-r024-20220211 (https://download.01.org/0day-=
ci/archive/20231224/202312241609.w1nPmrz3-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231224/202312241609.w1nPmrz3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312241609.w1nPmrz3-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    WARN: resolve_btfids: unresolved symbol unix_sock
>    WARN: resolve_btfids: unresolved symbol bpf_cpumask
>    WARN: resolve_btfids: unresolved symbol bpf_verify_pkcs7_signature
>    WARN: resolve_btfids: unresolved symbol bpf_lookup_user_key
>    WARN: resolve_btfids: unresolved symbol bpf_lookup_system_key
>    WARN: resolve_btfids: unresolved symbol bpf_key_put
> >> WARN: resolve_btfids: unresolved symbol bpf_get_file_xattr

We have one of these warnings for each BPF kfunc (for this config), so I
think this is expected.

Thanks,
Song
