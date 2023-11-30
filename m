Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B7664E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAKRyy5x"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6cd0963c61cso314286a34.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 17:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701309206; x=1701914006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8qVK9GAx0H0665gMp4/XaEH2mFpe/0oyKDd4JFknoA=;
        b=KAKRyy5xGqrIqk1ChHwxhRVN8odS05NLzDESlRLTW2NNrGfejgo/lA2vGMpvZkXR8K
         rc98sTj45G/vfWo3ktX1g2MaiOpuzm/MSLaaPwhNtTwSlV7LB0GXO61NtvLiOfdrVoG2
         68W3EiXg/IVS1X8+DmMmql7sSj2xppqHNG1+hrcXStXn5llFEnlDYmTsJzKcZ5RFBfcS
         3QtXvDvf2UTFZYFk7W77ygPxtXbstrLQTLYsb2bWB06v0UtxKNttQCgStKmf6DTlG4c5
         Ldbsxn1rX1PcSCRQv8xK1uFXOLxGyQcwkKgpZbmR/hgrYQlHNvUWpsbRFBQsYUh55tYo
         5/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701309206; x=1701914006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8qVK9GAx0H0665gMp4/XaEH2mFpe/0oyKDd4JFknoA=;
        b=Wspb1WQ2ZiL3Cs00koQWg6s1/QMhuj2z1dWKKK+KQ7uC6pI+oLLNiMM5LwEth70Qfp
         Cg2mmP7OkUeT11cNTumSKrz0cQSWwEHDZlrcRNfaDHuJIEOfUkDpFNjQGbjnBImWB/gm
         NFrgXKyNs5+E7TmR7X4pAOv3bwEnm5oDqY9ilEO/SrZCS0a1sYuoNljpUkcTDON1ObLg
         MZkbNZo+KnAMHsCJKfXtarIcToiHINaw5k0FeB1vDZwxwACUHdaMVIgOVkDOUYRdmctE
         PFzxvlakXzQ2C8qZiL8xZwpjzEP8lpH+JnNNK6EwbCordwOz7Qg3sgVV7lP9dmiFnu4C
         JI7g==
X-Gm-Message-State: AOJu0YzxSehWy5ktxadVkF2Ppw2bSmVeOr1KckKl4aVP89SunsIojyUy
	DFNuu4/yTh4d7bbpG6nigLtxdW2xp7JSWZnmJuo=
X-Google-Smtp-Source: AGHT+IEOKxVDBmFp8Gax7e+6/3Xpm9wFFIta8ZNQ1zGpU0q8pPtB1GfxxJmjAzk02CUnHcILxV1rRm8Zt7Jk3nJ96cA=
X-Received: by 2002:a05:6870:9a98:b0:1fa:2d7e:f67a with SMTP id
 hp24-20020a0568709a9800b001fa2d7ef67amr19389875oab.31.1701309206203; Wed, 29
 Nov 2023 17:53:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311292305.43bnw55s-lkp@intel.com> <20231129133431.73512e280e870efaa17f9f4d@linux-foundation.org>
In-Reply-To: <20231129133431.73512e280e870efaa17f9f4d@linux-foundation.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 29 Nov 2023 17:53:15 -0800
Message-ID: <CAKEwX=NUZb44XR_sHB8z9wa-DwwQbqEi_k54AtKo_oJ4u4MYXA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 179/192] mm/zswap.c:298:24: error: call to
 undeclared function 'obj_cgroup_memcg'; ISO C99 and later do not support
 implicit function declarations
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Domenico Cerasuolo <cerasuolodomenico@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 1:34=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 29 Nov 2023 23:42:15 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> > head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
> > commit: 70dd375afcfe1839321ea8a65749404a99f0e773 [179/192] zswap: make =
shrinking memcg-aware
> > config: s390-randconfig-r071-20231129 (https://download.01.org/0day-ci/=
archive/20231129/202311292305.43bnw55s-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.gi=
t ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231129/202311292305.43bnw55s-lkp@intel.com/reproduce)
> >
> > ...
> >
> > >> mm/zswap.c:298:24: error: call to undeclared function 'obj_cgroup_me=
mcg'; ISO C99 and later do not support implicit function declarations [-Wim=
plicit-function-declaration]
> >            return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
> >                                  ^
> >    mm/zswap.c:298:24: note: did you mean 'obj_cgroup_put'?
> >    include/linux/memcontrol.h:1352:20: note: 'obj_cgroup_put' declared =
here
>
> Well I'm going to assume it's this:
>
> --- a/mm/zswap.c~zswap-make-shrinking-memcg-aware-fix
> +++ a/mm/zswap.c
> @@ -29,6 +29,7 @@
>  #include <linux/zpool.h>
>  #include <crypto/acompress.h>
>  #include <linux/zswap.h>
> +#include <linux/memcontrol.h>
>  #include <linux/mm_types.h>
>  #include <linux/page-flags.h>
>  #include <linux/swapops.h>
> _
>
> Can't test because my gcc plugins have gone stupid yet again.
>
> cc1: error: cannot load plugin ./scripts/gcc-plugins/stackleak_plugin.so:=
 ./scripts/gcc-plugins/stackleak_plugin.so: undefined symbol: _ZNK6frange6a=
cceptERK14vrange_visitor
> cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plu=
gin.so: ./scripts/gcc-plugins/randomize_layout_plugin.so: undefined symbol:=
 _ZNK6frange6acceptERK14vrange_visitor
>
> help.

Hmm I tried including memcontrol.h, and it still screams at me the
same way with !CONFIG_MEMCG. I think obj_cgroup_memcg() is just not
defined in this case. Let's just return NULL here when !CONFIG_MEMCG.
