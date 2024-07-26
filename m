Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D6C4C99
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721978786; cv=none; b=Y1KttAKVIfDgLMYL/LTWd9S4Q47Vxg8+kOnumCIgRKDJyfbYLfQkujVE31okkF99Tlw8Zf2hXI38C494i2mv2BZ3OWV3pDAIKBSLze3Q7LxrMO9l82eZ27tKS/7qJ2Z0SdiEIhgypRFKdEuaUyuNcIIekKZnOOMM/02jwnXKIAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721978786; c=relaxed/simple;
	bh=+4tNx5lAPIw3i+vKDepfBSh6/T1hhw1adM3RpZFFYaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbLJLnxOpoiyXYZuj9t8qNaTsKuKU4ZHJfBMBhm2hd2uoJPipfu7FtpTxbfabiZJJHNozb50BuzrcftjBcyzCxnhc4zrNNLmHCyYkLsGpia33HEb7A9+Y025j7H5RQs0Xg3JFjVFpaWiN9mW20pIa6to+g009h8UY2rbHbwKUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-66c7aeac627so19482137b3.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 00:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721978782; x=1722583582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLV1EGDyov1edVFnSsDDjihYYooPrxLZ+s79IlkB448=;
        b=lHWFtWuB3PGdK0wRpQcC7Vzj/7REju3QVwL+frqLFp2bFt9FDCzuKq7ieZw0oWqG0b
         Nik8iPqnnVc1WWSXHWLvMUIJrqYLjoT95+qkZ3PDJc37PkU1Oi3nKTXU4W2xJ1JeGR3N
         rop9lPoiSlOTcEC6geguOxKewjEejDgL1p31mKede+1IPsWywmfVtpEha5MPXKR9y+QO
         R/EVndfHUXH5yL/pE8nxyeJ1WG0l0cKj2yDK+fVowgneFAmV2zo0cSVn/NnM34iQWPzJ
         j4H9UcuZn9g31Orbipgc0oNTJDi9XjG6eXhn9gDFIhCNSxbUz17+ODOizXpwZ1QUi5GK
         84WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlPFUP7TTvreCIov9mJPFcKqT8At2fuMq1jxmScxCjO/fKU+uR9hRxaPHwXfP2RYOuehZrUoms32j3rMzCTwDwe0Hiz23akUYkCi4f4A==
X-Gm-Message-State: AOJu0Yz7r0twdI8A9m1FK+u5Nutz9559FAd/rVlKI9vHsEoaQxrMvLcF
	0S7ZAwG8HDg1gDm4lvcA07L/EnCQO8+XzMttXgx9M7hamk8dzJ4tnz03/0E57/w=
X-Google-Smtp-Source: AGHT+IHAscG6nq/VvEAfUR2RHbVQeTNhHn1RokZYkNqWLhhL6SRQk6lG4xjnISgjx+ebJr9CNfpyjw==
X-Received: by 2002:a05:690c:6d0b:b0:650:93e3:fe7a with SMTP id 00721157ae682-675b4b5ba70mr55706277b3.18.1721978782511;
        Fri, 26 Jul 2024 00:26:22 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756795e7d3sm7788017b3.32.2024.07.26.00.26.20
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 00:26:20 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b29539d86so17091917b3.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 00:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtp917ciyJVZhMLk+PoIpqfYSEKnuTEiBKr9811wzXhbksy6RJ1m3bVznCMdoDljED0sm0ZM2bLUci7oFq60RatNGn4vw/5riaJY038g==
X-Received: by 2002:a81:a20e:0:b0:64a:d9a1:db3f with SMTP id
 00721157ae682-675b3823cd3mr50786447b3.7.1721978780591; Fri, 26 Jul 2024
 00:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407260828.NQM5BhqE-lkp@intel.com>
In-Reply-To: <202407260828.NQM5BhqE-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 09:26:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLCPcH3x+LXOCp=9qiw1WWWRtre7Lf8HqtZ1E3JwfLsg@mail.gmail.com>
Message-ID: <CAMuHMdVLCPcH3x+LXOCp=9qiw1WWWRtre7Lf8HqtZ1E3JwfLsg@mail.gmail.com>
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>, 
	netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 2:38=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   1722389b0d863056d78287a120a1d6cadb8d4f7b
> commit: f73edc8951b2de515b5ecc8a357ccd47dd41077e kbuild: unify two modpos=
t invocations
> date:   1 year, 10 months ago
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240726=
/202407260828.NQM5BhqE-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240726/202407260828.NQM5BhqE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407260828.NQM5BhqE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

Nothing has changed in 5 years, mdio-cavium should be fixed instead.

https://lore.kernel.org/lkml/CAMuHMdUERaoHLNKi03zCuYi7NevgBFjXrV=3Dpt0Yy=3D=
HOeRiL25Q@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
