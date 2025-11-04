Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F583334C26
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277611; cv=none; b=Bq+l0Pik/l71kYvjOf1T/XTvLtg8exF20fjCZsA5UmmlcYmc/uS11boB0xG7uFoOznniBwmZW0MTO+8COE5N53PbkUCslBoy/9NslUoCTjdh1anmBv0X/Io4I0eT4fynxERjeVzbzcejdolViaAodOySTVSx3VSg3VMoEj6q0LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277611; c=relaxed/simple;
	bh=KEbGvm2hDSQS8jirig5zERdsRyiy9f6KQWSjXT4BpaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g28kyFZXnPqYmMJkwSY2opX36k08VyqREnTChi+E2IUIl0cJco/P2FKLj2lOe+dVP1Trf/DYy7jklG7Xn4yuAhKlR3qHGacXk7I0+LJf3Rf4NL+psvlL0KpzggI8oVIjSw8yIJnmZrQBECbmE2YuvWXcIZc1Uic3FNenrEj5OCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Tbf47s/z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Tbf47s/z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63bea08a326so8231178a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Nov 2025 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762277607; x=1762882407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTfDTquCk48dkTU3Tq45eZhigns6jK7aZyvpfJOfrnA=;
        b=Tbf47s/zUjp2bCcE9S6kWLbmG+NxwbDJNbkgp0twwBQm1cGc0gyJKULHGEoVZlKKDG
         HyXFXpZZnKLb6M18vpx3eRkt3rORcYht8aouV+0x6BUNBJIzi8N2Y+Fq/5Hu78n3I6YM
         BgQHFUns/AxqF/4UKvX6SQkM+1Bk6SnPZcse+gfg5iGKQZvK3wcfd1Eh2u5m5VTWcriB
         LsqK43NyKV7qNmFLk9Rq9pQoyJlllXBEpcG1LPnFGtWyAATGT4n5+OY0yq/t3TDBjRLR
         XIY/w2Au784wdAJrh1jPw29N5xO7Dm9lFnDKEGLC+kR7pLqLAw/VxSnySVAhWRX30svx
         L6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277607; x=1762882407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTfDTquCk48dkTU3Tq45eZhigns6jK7aZyvpfJOfrnA=;
        b=NsrKqPMmuGG+1+Nt3y2fumkucsWU0IuMOWAQgvlW2y65gEGv494Vc3X1adIEHqU9I2
         R/FJ+dKHTr0E2/UAA2MPAo8TXtbXL3SAAvrwjO03+F4OpWTRXEr3uuOmWOjpElB4KOp3
         vTwNMr9BQSd6ldgT9rlgtoaBAXycBe7k9vWNUYFOggqDfR7tuRMFuPxPpqnyranbTqNe
         PV59TWybMejiTanwaOTRHEu7atRYGSmG2P1fiAfKk++BvN69dhrkAmLhSNaBwPg2xWy9
         f369isH+1X4tfLaTTgd0CWFTGN1+tFfmh6Caz0xYf4iLvlZedWuUjREO0oc49Oi/Iwk4
         7TqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCIzuLtkLck1g1gqvPfLuVmnaru7VJONELQpSFuWf7jlgCPIzQgxa9oOGMYdAB/d+UTGgbYG4qVVtvgVP3@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqm5ZLQRgyHmRt4tuA1XpVTJMyJb4HCWezoWjiUczpe+GrKewN
	0oe2Zn+Z+kT24zBt/nhxVcUrcDsUOTvjI68jftUTwIqWf/1nsHZlgVmMJACt4rDyB2xc5wRF0dI
	4QK2c3NxQxLA0ODLwBp9ckF9V3lJGnNlVmKWDvkOuxQ==
X-Gm-Gg: ASbGnct35rtcq1EtTyWX125NrWcZy48VBQx0Oj10daElKD1pLMink28JOcWWW2Fj2ad
	R4yKRB0ZSMUrH31+/WcidHvhxrFGFbDxt5YoXREhF4vloXt9mGrSs9GXLss4pNnKegu+PZUbbXR
	hTtX/AtUNk1eiIOLZepRV8Ll5kRXfaSA/p1Zpu9Yf1Q40uDSwzHYkzdK/C5TOPnVFg9s7NzBZQx
	mKKPD0P7dpvSDdVyhjsV4slxO+z4yWpVOwkpmQG7fF+5z9mwtydVvIT6b/gh9W4PLLB
X-Google-Smtp-Source: AGHT+IHAtkWxLI4f079UeX9mWGwD7T230+rA0BeumknybAB451rxF/wEunoh94xjXza19vrHmYhvGiuhu0O1dH647iw=
X-Received: by 2002:a05:6402:1447:b0:640:ea21:8bfd with SMTP id
 4fb4d7f45d1cf-64105b7a66amr13762a12.31.1762277607365; Tue, 04 Nov 2025
 09:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511042251.paO6f5BZ-lkp@intel.com> <aQod7jDFBjw9T-u2@kernel.org>
In-Reply-To: <aQod7jDFBjw9T-u2@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 4 Nov 2025 12:32:50 -0500
X-Gm-Features: AWmQ_blKIkIlMfgAINdWoBAGRXf_NXuynpSKevp0VOCPWGaVDe_zHYFu-h4128E
Message-ID: <CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
Subject: Re: [linux-next:master 4972/5926] kernel/kexec_handover_debug.c:16:18:
 error: use of undeclared identifier 'kho_scratch_cnt'
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eh, "kho: make debugfs interface optional" makes this variable external.

Let me see how to fix this quickly.

On Tue, Nov 4, 2025 at 10:38=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> (adding Pasha)
>
> On Tue, Nov 04, 2025 at 10:48:31PM +0800, kernel test robot wrote:
> > Hi Mike,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   17490bd0527f59d841168457b245581f314b5fa0
> > commit: 8c211175c3abcebb8bffce8095d78d193e482105 [4972/5926] liveupdate=
-kho-warn-and-fail-on-metadata-or-preserved-memory-in-scratch-area-fix
> > config: x86_64-randconfig-071-20251104 (https://download.01.org/0day-ci=
/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20251104/202511042251.paO6f5BZ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511042251.paO6f5BZ-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> kernel/kexec_handover_debug.c:16:18: error: use of undeclared identi=
fier 'kho_scratch_cnt'
> >       16 |         for (i =3D 0; i < kho_scratch_cnt; i++) {
> >          |                         ^
> > >> kernel/kexec_handover_debug.c:17:19: error: use of undeclared identi=
fier 'kho_scratch'
> >       17 |                 scratch_start =3D kho_scratch[i].addr;
> >          |                                 ^
> >    kernel/kexec_handover_debug.c:18:17: error: use of undeclared identi=
fier 'kho_scratch'
> >       18 |                 scratch_end =3D kho_scratch[i].addr + kho_sc=
ratch[i].size;
> >          |                               ^
> >    kernel/kexec_handover_debug.c:18:39: error: use of undeclared identi=
fier 'kho_scratch'
> >       18 |                 scratch_end =3D kho_scratch[i].addr + kho_sc=
ratch[i].size;
> >          |                                                     ^
> >    4 errors generated.
> >
> >
> > vim +/kho_scratch_cnt +16 kernel/kexec_handover_debug.c
> >
> > 4039a00022d42a Pasha Tatashin 2025-10-20  10
> > 4039a00022d42a Pasha Tatashin 2025-10-20  11  bool kho_scratch_overlap(=
phys_addr_t phys, size_t size)
> > 4039a00022d42a Pasha Tatashin 2025-10-20  12  {
> > 4039a00022d42a Pasha Tatashin 2025-10-20  13          phys_addr_t scrat=
ch_start, scratch_end;
> > 4039a00022d42a Pasha Tatashin 2025-10-20  14          unsigned int i;
> > 4039a00022d42a Pasha Tatashin 2025-10-20  15
> > 4039a00022d42a Pasha Tatashin 2025-10-20 @16          for (i =3D 0; i <=
 kho_scratch_cnt; i++) {
> > 4039a00022d42a Pasha Tatashin 2025-10-20 @17                  scratch_s=
tart =3D kho_scratch[i].addr;
> >
> > :::::: The code at line 16 was first introduced by commit
> > :::::: 4039a00022d42ac3d68b2eea63066bc9f7ef89ce kho: warn and fail on m=
etadata or preserved memory in scratch area
> >
> > :::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
> > :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
> --
> Sincerely yours,
> Mike.
