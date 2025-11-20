Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930FB25784E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763676449; cv=none; b=cuD8vuQierAPIfDJiGIIkQDjRlFBoQPL7hR5PZVR76lZV2zhtFDC9YJsNd9CekWhwuir7vhSqQGsx2LC4yDCPhL/4ifyklpMzOOrSYt6iOg3/E0L+eFnidA8ToDKIyax7CfhBqbPsXH1IDtlIzi0SLYakVlYjVmusBwz5mKuy0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763676449; c=relaxed/simple;
	bh=76WDfDeMZeiQvwT0J+wE9EpXfzbbHo+X4N/VWdr5pe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaNWH8bwuORcguRRJdVKhAMukrlMFcdJnfCpVWGf5nsbpq/sl/kV7OYz7DfYm70xOAM36lhzHGQFQt6Kc5RTLcTaj0tAsBfpfsSU/t2kIAUCnqshGG6rwW4dhDMZomXGfLoSmXHa6mElIG0HYkX8LN2tiSXg4ABjyzMdiqnuRp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ET1S7dd8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ET1S7dd8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso1870712a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 14:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763676446; x=1764281246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZknmF3VpgAd9bo/Uo3njgGJcOyZCg9JJGN/hBR6DdHM=;
        b=ET1S7dd8ghINMDjR2Jwt8tk5hw9hhZuhhWmhT4eg6f6cBQTp7LjB9HeW7zgLvZTp0j
         GWmdCKkxeaKcqkL+xICtF7GIDmiAjCQiBnc7NRzX32fZTgGoc1d5jtv3v+CymKMdX7w6
         WVnujvCGvrCZX1g/NG9R1YIGu0DQddSmTXLYbgsPqxoSJaMQo0CfRNSt113/gECrkYvk
         6ETXaz9lRpTAVf5AmDrkaScWdErOnXXAVgxVagG1DF1xh7jh0u+vrhP0m/VYvO1pImCD
         ouT7CISdUeiHzwu3tICnZde7JW/b0L5tLAqjuaDMVUl+heVphFDCn8uFri1orboQIhZY
         EwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763676446; x=1764281246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZknmF3VpgAd9bo/Uo3njgGJcOyZCg9JJGN/hBR6DdHM=;
        b=KfE8cKtPobNnmAaAC4ftjBTnc3/S5qZvZmwfO/DhbS0DNPyy9htJcZorroI36OlbBQ
         BPFYnDuGUKokPy4uOZMiCplvcVE32yjYRlrRYzEOZwG6MkOizbCKdwZ70AhDSbdZ0jE8
         LOAOF6a4Niqnmu355E/srCCdG6YjupXagmaDMIwyOmKDeI5ZPy/e5zycfwXwDujye1Gr
         xr7FDX8olzg/c1Nbi3e6kPrOHGuZJnUQcdo4mcWHxypkp3e7ZXukD+2jkzKzIm0ixk0d
         9q+b5GM10ftnKPjTXvuuXyWE4mc6vnQDCkHNkoXVV3QbP5Nzl0LlyMBno/MZLTWXsWpe
         JoTA==
X-Gm-Message-State: AOJu0YzX0KrBGb550G3UmmWE/BXR/FdbLq/NJcW0Js3SyEavi5+He5r1
	kIdBm6CpWKKGCQPpFBNCbX08XHDW9NFbUo3ZP2vHupRhAbdJEOteeAmnsbcOh774jSW74Z1jBdy
	b1mQDwsd1vZfX4nCczYA03UDSnvcaY4ACUprM21D9LA==
X-Gm-Gg: ASbGncvZRWK0nWdKH2ayPPauv9Edqi+JV8Jz7Bbw8JYSToDgVKfSCpMPO05tPRtbqdv
	huFGohAerNUxWK0s47NdnemFOkR2qYaTk6VyThg41yMhXXIIUl3X+XE+XLaAFC9OyaU5COqt64Z
	wRwfX+aUPiw+qUfcvWa/iMMlT0APz/jL/pQ9P1aqXnRFpDbEkzeQGFi9X6HU7O/zniRufqA6fYn
	LwdWiDluAE5i7e6kkhzZHO73twcNoyUu8VN1tsigrE03CSm9Cn1aOpaVB1n2qnC/tf7
X-Google-Smtp-Source: AGHT+IGGH+g0kYgYnofK8nL8B1VmA3Kloy65i8uSy0ml2n0UZYKAny9eZQdSBm/1tUGN38T2SrmNnESf+SbwD7gKsW0=
X-Received: by 2002:a05:6402:1ecb:b0:640:9997:a229 with SMTP id
 4fb4d7f45d1cf-645550783cfmr206597a12.3.1763676445755; Thu, 20 Nov 2025
 14:07:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210513.ywQeN1k6-lkp@intel.com>
In-Reply-To: <202511210513.ywQeN1k6-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 20 Nov 2025 17:06:48 -0500
X-Gm-Features: AWmQ_blimq4IQ7xme_3ojz0bDM0Um-4i6aYcx4O7UAhNInw7IGfPjHprHt__x7s
Message-ID: <CA+CK2bDOxj14O2kuvn+BNnXJ+R7rb0CK+ZS_hoiUBX5YhDfaHw@mail.gmail.com>
Subject: Re: [linux-next:master 9912/10599] kernel/liveupdate/luo_session.c:392:86:
 sparse: sparse: Using plain integer as NULL pointer
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 4:36=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> commit: f485f57c35af5b8c2a243dfc39ee171673484915 [9912/10599] liveupdate:=
 luo_session: add sessions support
> config: x86_64-randconfig-121-20251120 (https://download.01.org/0day-ci/a=
rchive/20251121/202511210513.ywQeN1k6-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251121/202511210513.ywQeN1k6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511210513.ywQeN1k6-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> kernel/liveupdate/luo_session.c:392:86: sparse: sparse: Using plain in=
teger as NULL pointer
>
> vim +392 kernel/liveupdate/luo_session.c
>
>    357
>    358  int luo_session_deserialize(void)
>    359  {
>    360          struct luo_session_header *sh =3D &luo_session_global.inc=
oming;
>    361          int err;
>    362
>    363          if (luo_session_is_deserialized())
>    364                  return 0;
>    365
>    366          luo_session_global.deserialized =3D true;
>    367          if (!sh->active) {
>    368                  INIT_LIST_HEAD(&sh->list);
>    369                  init_rwsem(&sh->rwsem);
>    370                  return 0;
>    371          }
>    372
>    373          for (int i =3D 0; i < sh->header_ser->count; i++) {
>    374                  struct luo_session *session;
>    375
>    376                  session =3D luo_session_alloc(sh->ser[i].name);
>    377                  if (IS_ERR(session)) {
>    378                          pr_warn("Failed to allocate session [%s] =
during deserialization %pe\n",
>    379                                  sh->ser[i].name, session);
>    380                          return PTR_ERR(session);
>    381                  }
>    382
>    383                  err =3D luo_session_insert(sh, session);
>    384                  if (err) {
>    385                          luo_session_free(session);
>    386                          pr_warn("Failed to insert session [%s] %p=
e\n",
>    387                                  session->name, ERR_PTR(err));
>    388                          return err;
>    389                  }
>    390
>    391                  session->count =3D sh->ser[i].count;
>  > 392                  session->files =3D sh->ser[i].files ? phys_to_vir=
t(sh->ser[i].files) : 0;

Should be: session->files =3D sh->ser[i].files ?
phys_to_virt(sh->ser[i].files) : NULL;

Will fix it in the next version.

Pasha
