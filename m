Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4BD2C159B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962301; cv=none; b=m6DXsnrPnFh3mazz3+JuXnu0wD23B2uza08HRbgGqmamtg5cRY/5TdWo9ykC5NGW9llaD2HzNczSO1vbuh1nChtqa8QUBEsUSC8cm6y/NHF8ive9yB0NRzSyLNGVZcLtKznrUdH7t7QMjhi5v96cszJZFXW8YnT+P+Hp9rzNp6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962301; c=relaxed/simple;
	bh=JFCvzlReTi8Ei5B9DR3TeP0atjNQ9jgR/NEQXHWwgZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoJsZy3qFU9I4EqTM8ZT3jmS3IIOtVH8HLe4y3xgDWnP/giN7GMuIYPrehdX4vIBRXgtP0pn99kvSxLAC2YHmZngqlm+rLS2gbUEq17wbfyoOsAIJeiwZLK3e4Q6uYVpBElrk5LyOMhCDb7QUmD77CPTWgBg2YPRTdYHpmaCeQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZgMNUZ9; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZgMNUZ9"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ab814c4f2dso4170831cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 04:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753962298; x=1754567098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PKLSjCjZPYymf2Az68ZABMj828kp1cj/gOiTB6pG/w=;
        b=yZgMNUZ9Ri4ZH51WrO83PIGNeRjeKQ69NQ4cQAygxjJPJYxScSV7sq0aR1Ld/AFj1s
         MUl28QMGfywfKC+DTvdFGFeB+r4Kq11uvaHlfmt461l0EBSr15FbBGGZCGCScmNstY4G
         uNK5c4lgXruLP7NK+l9VJtHag4KqbaBfpm4WEtQgcrMYh+NkT1k3KMb5s7ra/X++oHr+
         aUG5+uhIguUER3n3XZ/AI9jW5e/0xoBww8054fdUAk3odvu7sVSGM2MbWkT7VWvI/7SX
         K2YXiN0woJyFTeZTSzg0mCjzHIxsT1+GrisH+dmTUnIdv/5pqcsrlgjrYT9Y0zofjSFk
         T6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753962298; x=1754567098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PKLSjCjZPYymf2Az68ZABMj828kp1cj/gOiTB6pG/w=;
        b=il9xBkm/v06c9TngfnD+8wtGPX29ebg6T6eFnn7sv2L3EQbGuCj6a2b0DU8K7NqAsW
         TETNcnLcpvvaJBhA/wymUDpI9TgpmP3HKD0kAIhvBEDFiaN7e5i2zv9LcEmfIxzxRMvS
         VIOvr7th2P6CaUUqTMOzTUSYVR98ecVBbAzS6VOxovP0cZ3DFe7Z9zkerhKdFUusPgDy
         UpglLWep9gVwxD2TXzZKOJNThryx9EpcQ04BtSC/vGPvVlcka11psi/NJtSbpTDmBGP4
         AoROZqwuIqkyhw9x59BjeypPmDPP+/Y1LiyQLvM22DtjYV1nwGFKnrlhJkZWBeiTuocz
         8wFQ==
X-Gm-Message-State: AOJu0YwHIZmc3IAQdDNXmB6XUqMJQjQTgRc2ZQqi29sQMU/1FVcdxRLV
	o3myHVHz+XwEOCJe161AcuIQwuTqdfzXIDNR7c2O19EDZmf0xiI0N6qhsTjM8R2+YUqmwBdHhsA
	TQQbgB+d4Ldy7c9eug77U+XCGoKlEo5sEqS5a4YoA
X-Gm-Gg: ASbGncsJC8Er0HGZ7/uLyjfJngi8HGQvt6+gQ2IeQfiPN6pqQ8GCm043vy9hNRrxtsk
	yfa1xmY9/fqaMA80h5KKuTDK0itACxd4SrPgnLpQacaxfjFeNPdMyHL/wpu9D0N9q1gtfxnJZND
	hYwb3egkcup/WGXySg9utMz+MWxrCgqGgvnRatNgdbBmG7WXGfWuhkNQjaoem7LI3jVBoj95VlV
	QSHi8XAh1ZA8e2D1yZxznGqKk9aHnYSpv8=
X-Google-Smtp-Source: AGHT+IEk0govKksD8fD53Cm5JbDgSmTEUMcltanx2W34a2wuxBj8FO2SF9v4SYEv2sTc6MQ7ZjpqAEttqGXyZQsYSLE=
X-Received: by 2002:a05:622a:1107:b0:4aa:ea4a:eddf with SMTP id
 d75a77b69052e-4aedbbf7a26mr121102461cf.27.1753962298094; Thu, 31 Jul 2025
 04:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250728152548.3969143-5-glider@google.com> <202507291913.UMbUQv95-lkp@intel.com>
In-Reply-To: <202507291913.UMbUQv95-lkp@intel.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 31 Jul 2025 13:44:21 +0200
X-Gm-Features: Ac12FXw3MWIiorLqfBfwnfmq8Ic-Jw62GS99_ubxKh9VEDUg3SBKoiWcbSpLn60
Message-ID: <CAG_fn=Xs+gctrJUhA7GCF37N3CyMFMdu1PX1EpaP4reCRQJa5w@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, quic_jiangenj@quicinc.com, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Dmitry Vyukov <dvyukov@google.com>, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexander,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/x86/core]
> [also build test WARNING on akpm-mm/mm-everything shuah-kselftest/next sh=
uah-kselftest/fixes linus/master v6.16 next-20250729]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenk=
o/x86-kcov-disable-instrumentation-of-arch-x86-kernel-tsc-c/20250728-232935
> base:   tip/x86/core
> patch link:    https://lore.kernel.org/r/20250728152548.3969143-5-glider%=
40google.com
> patch subject: [PATCH v3 04/10] mm/kasan: define __asan_before_dynamic_in=
it, __asan_after_dynamic_init
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/202=
50729/202507291913.UMbUQv95-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250729/202507291913.UMbUQv95-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507291913.UMbUQv95-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from mm/kasan/kasan_test_c.c:32:
> >> mm/kasan/kasan.h:585:6: warning: conflicting types for built-in functi=
on '__asan_before_dynamic_init'; expected 'void(const void *)' [-Wbuiltin-d=
eclaration-mismatch]
>      585 | void __asan_before_dynamic_init(const char *module_name);
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>

For some reason GCC declares this function as a `void(const void *)`,
whereas LLVM goes with `void @__asan_before_dynamic_init(i64)` (not to
mention that ASan userspace runtime expects a const char * parameter).
I'll change the prototype to match that from GCC, because Clang does
not care much.
