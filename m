Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD379134BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711701592; cv=none; b=WaNmk9Lsd9R680NbxdbrXj9YRJh1YHr2DHnMpR1tKzoUgvrhh3HIJ3Zs6nDgxrI+zq+6AeAnO68QFzSLgc8WmId4KtywAhsDy7h7kTRvP3WBB2hncu2N8HkPOEaY0i5bWcu6nnY/Hj3EW9z/moZOjvm19QJBureXfFb+Ao0u22w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711701592; c=relaxed/simple;
	bh=GR3x12krJXOXWvG/BBTxB9091fvn1PewsYR2Rzs/mFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpnjhXse9LEb8QaBba028gIYbwuTWz6TpBgvoUBT+GgXuEGfUGJ8qcAg5i1bqhvmuMDy1l/TYQnzEckXcBSYEC1NcRDbAEHMsO1fM8oyneArNKKcRK5eRvtZnDqQQAVRuee0nfsIRtOZ9a3pv4qmtVELXx9NPVEQB8LE3CQ/gIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6145a4c79cfso195497b3.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 01:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711701589; x=1712306389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hkLfUozsxdncT8HuF2o4O/3RcsP/sGMaEklDCCLn1M=;
        b=MeluE2tzEeDWzq8GXwtLTCnMr2qqKxoMxisQm3+731K8clokVphILKahAEGg8oisAN
         P9LcDUWKSKAol2XSMca7vyboqG5eL2vBdlnC9O6TPIEeLMYqU6A7oaxJ/zfN2vzVG3SA
         JwbHpt7IvYuGoz7HwlAOiFCWLfqEkBS7hBtVrIPmz1Fjq07licef3cBLmwkR1tVyDuKI
         5ZD81tNZN3mbd9ehOs/OqgchDelpmR0i9ImRgyTmhf5WiZasMFnjvMmUCxwhN9s9Upf0
         HwI4VEeAKQTOMyYvC8/omfi4UGuooX1sEM7EBpVc+3K8i+GL2qukUtEohlZv5E9hfuwI
         +JXA==
X-Forwarded-Encrypted: i=1; AJvYcCVMcKKkeercIhte2byZd+CYK40H9SKBtPTHB0qJTu3XkgnfyfRjoKCya9UZZgSfZ3u4gkDhYgNzg8tYfqlyDDdanhtdL9JG7jdlUBuzOw==
X-Gm-Message-State: AOJu0YxhKXj6icH+jSK1zWr4r+3B67hR7HO51t2K9LDyNqOOGuYSno8O
	e8gi825YepBz27FezvI1NJdPaAxILLIpdMf/4rdU+YcFvxm90sWQia4o5WAq9sA=
X-Google-Smtp-Source: AGHT+IEqAK04kOF5/MLvbH9CB537fDwpVGncrvZ2yn0QbsDaG8ZLGbPuUsQANUkw8xNdsQU3P9R/Xw==
X-Received: by 2002:a81:8844:0:b0:610:ca8b:9a1a with SMTP id y65-20020a818844000000b00610ca8b9a1amr1716984ywf.46.1711701588825;
        Fri, 29 Mar 2024 01:39:48 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id l25-20020a81ad59000000b006145a494d61sm8399ywk.86.2024.03.29.01.39.48
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 01:39:48 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso1648525276.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 01:39:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUE3mcLhl1OHi0Bb4Km0B0gNyaVyVSsVmgTehkjtBiSmpO4RYnzVofTSTSZ5QGkvqMVNF54wh28Gn+zYgSRu8L9LJ0KTMrAfFokYZ3LRA==
X-Received: by 2002:a25:83c5:0:b0:dcc:ae3:d8a0 with SMTP id
 v5-20020a2583c5000000b00dcc0ae3d8a0mr1625934ybm.48.1711701588203; Fri, 29 Mar
 2024 01:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403291057.uo43Mlue-lkp@intel.com>
In-Reply-To: <202403291057.uo43Mlue-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Mar 2024 09:39:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPyz+bZ43Nu-iq_K0GnWbtP3oiXCt22cQSyMvMhQ=A2A@mail.gmail.com>
Message-ID: <CAMuHMdWPyz+bZ43Nu-iq_K0GnWbtP3oiXCt22cQSyMvMhQ=A2A@mail.gmail.com>
Subject: Re: arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT'
 undeclared; did you mean 'CONFIG_LOG_BUF_SHIFT'?
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 3:19=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8d025e2092e29bfd13e56c78e22af25fac83c8ec
> commit: 5394f1e9b687bcf26595cabf83483e568676128d arch: define CONFIG_PAGE=
_SIZE_*KB on all architectures
> date:   3 weeks ago
> config: m68k-alldefconfig (https://download.01.org/0day-ci/archive/202403=
29/202403291057.uo43Mlue-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240329/202403291057.uo43Mlue-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403291057.uo43Mlue-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from arch/m68k/include/asm/thread_info.h:6,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/m68k/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from arch/m68k/include/asm/processor.h:11,
>                     from include/linux/sched.h:13,
>                     from arch/m68k/kernel/asm-offsets.c:15:
>    arch/m68k/include/asm/page_mm.h: In function 'virt_to_pfn':
> >> arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undecla=
red (first use in this function); did you mean 'CONFIG_LOG_BUF_SHIFT'?

This is the same issue I mentioned to Arnd in IRC before: as no
platform is enabled, none of the MMU_* options, and thus none of
the HAVE_PAGE_SIZE_* options, is selected.

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
