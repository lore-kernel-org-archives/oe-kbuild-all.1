Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3515A224CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732297798; cv=none; b=aT38srZTE3EwT/PYk380grFARAZHr7pv+tLg65YDn0fcMcFstcEiPAY2POAaVEza87P59pFVH3rbDPUqfpeeqjFPN+d1TFHTo0OsepC4Wn6XRtpvyk+HYSKg9Iwj/wXgAUTXtJiR9ZYzskd+7Py3qlcYBjQNxaI1+2q6Jw3SIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732297798; c=relaxed/simple;
	bh=+AIOD5DHNPcbMamjWx/6QOwR3RqcsnWuoFYItac1mm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EI/bi+aadqQ1F84GUI8ky/lZ8yKkJvtVwhw7yf0YYx87a4lduGZZ4Tz0e2U9CSRcitqdZB7zVG8Oc1023QsJgnUDyoBc1hXW9OqCdFdn0mnjsfSjcyuC2sYseC6K1Fw9dXfedzvMIlYV+SpEu/mEoZYYa2ADAi3nHDESj8ACaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3VdtRwbl; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3VdtRwbl"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4635b03a3cdso591cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732297796; x=1732902596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va/pp/UeivMrLdOLLMvaY015FyLzx79PjbcS56UV/FY=;
        b=3VdtRwbl9BuPmxsNMoY8AkbsQ/nY/0Cz4U01+LzFfxV2r4OAChZ3EnmYNgFeraOYh5
         pfDrxw22Ej7XlZq2/evvJLemfJ6D/I1IzJT7TRCZDyFi+mEm7txtbyZmMC6BHYGQBYEP
         nAWYZFiEllprPy/VjJpPveaRpZu0QvTZ58YHkj7inJrOQvVcUeDS2BpgQV5QmWTbt29Z
         tWKenFaDRJfs+8kWVUZYsPNpCmekbby/C0rca4k9o/ywAVdbfuK+EUz+3aaHsBqCooAY
         Y6LuHXVH19VKDRmstScpL7+a2wkyUSsZFG0dR/mKp49pWbgtX8pfRcXduMyZO7wReKuv
         4etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732297796; x=1732902596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va/pp/UeivMrLdOLLMvaY015FyLzx79PjbcS56UV/FY=;
        b=B3fqyXI0JiP/yxaFtvxSSzNmAYUa6xTqO4OOmyZjlbCZGCMmh3KBVrKtLiG91g7oSY
         +otH7faw4hU2X7DPQIyftNXBaiCA5U5tMvMNjTzo8CmCw5YsH65fxYN8Y2UM5NdnzDqy
         EKr3x50w3YD1BFLHkrVjkjpjKpZfmN14SOVzRkk/kQr9El4wuSAtf46mfeueVi/oXCUq
         +ypAuncHXX1CWkqArOCjWEamkC7pbBV9TIw6KnuEmu613XWgzpDRCmLWm6ltu9vh9Dtg
         Lw3D+Qbx/P4jsm2MMvj6n6gM75Eh+N2BdMZFer8qHbxawwTjINyUZU8CQDrycG6h/AxV
         kzVw==
X-Gm-Message-State: AOJu0Yy7gg5pghNY1BT11mvPiOmSOjwQEHuXUMNW8WUOwDGeL5i3bOWa
	x3b9b1BIU6iVOBlTWcNMhme16lBDjGPRwYSbHZHPSiUhKd76YXHr3tUw+lG5E5Bo0+d25hzUHmU
	7w0Ff2CiRPdouvLSAN0zSuq/GPR5DatxjguftOJs13uiKMxFv/1ti71w=
X-Gm-Gg: ASbGnctP8kQ22kPd8bYrtqNDQGOTTKhsNioM/x5GXJeH5iSXHxkUEPmi+WKrkqdQZH/
	iJhWM0XmV9DnOEnaxJLO3JhYd8fn1ULNohT4X/+nsBIyfM6ezvo7wS3Fbpre67A==
X-Google-Smtp-Source: AGHT+IEb86ktQkp4e8YR33JRXk6fooJ5cqEMHr+qQa5ZiFboZBBGLdaafGGAB4YVMCxsTcC5rUH/EARFjKuTTK2KdSY=
X-Received: by 2002:ac8:5746:0:b0:45f:89c:e55 with SMTP id d75a77b69052e-4653d470d8cmr3862241cf.8.1732297795768;
 Fri, 22 Nov 2024 09:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121162826.987947-2-surenb@google.com> <202411230014.xk4U56vk-lkp@intel.com>
 <CAJuCfpFWVJa_qBRYBAytyMcaf79Wbeo+kNa+Pyg4u5ynwX_3Rw@mail.gmail.com>
In-Reply-To: <CAJuCfpFWVJa_qBRYBAytyMcaf79Wbeo+kNa+Pyg4u5ynwX_3Rw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 22 Nov 2024 09:49:44 -0800
Message-ID: <CAJuCfpEPHGs6WLW-XaRpR9ReFgDacX5-stueyd5oyt8m+OWe1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqcount
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 9:17=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Nov 22, 2024 at 8:52=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Suren,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasary=
an/mm-convert-mm_lock_seq-to-a-proper-seqcount/20241122-003050
> > base:   43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
> > patch link:    https://lore.kernel.org/r/20241121162826.987947-2-surenb=
%40google.com
> > patch subject: [PATCH v2 2/3] mm: convert mm_lock_seq to a proper seqco=
unt
> > config: sh-allmodconfig (https://download.01.org/0day-ci/archive/202411=
23/202411230014.xk4U56vk-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241123/202411230014.xk4U56vk-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411230014.xk4U56vk-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/asm-generic/rwonce.h:27,
> >                     from ./arch/sh/include/generated/asm/rwonce.h:1,
> >                     from include/linux/compiler.h:317,
> >                     from include/linux/export.h:5,
> >                     from include/linux/linkage.h:7,
> >                     from arch/sh/include/asm/bug.h:5,
> >                     from include/linux/bug.h:5,
> >                     from include/linux/mmdebug.h:5,
> >                     from include/linux/mm.h:6,
> >                     from arch/sh/kernel/asm-offsets.c:14:
> >    include/linux/mmap_lock.h: In function 'vma_end_write_all':
> > >> include/linux/mmap_lock.h:140:35: error: 'struct mm_struct' has no m=
ember named 'mm_lock_seq'
> >      140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
> >          |                                   ^~
>
> Oh, this is due to CONFIG_PER_VMA_LOCK=3Dn. Trivial fix is to move
> ASSERT_EXCLUSIVE_WRITER() into appropriate mm_lock_seqcount_end().
> Will re-post with the fix shortly.

Fixed in v3 here:
https://lore.kernel.org/all/20241122174416.1367052-2-surenb@google.com/

>
>
> >
> >    include/linux/kcsan-checks.h:371:32: note: in definition of macro 'A=
SSERT_EXCLUSIVE_WRITER'
> >      371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCE=
SS_ASSERT)
> >          |                                ^~~
> > >> include/linux/mmap_lock.h:140:35: error: 'struct mm_struct' has no m=
ember named 'mm_lock_seq'
> >      140 |         ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
> >          |                                   ^~
> >    include/linux/kcsan-checks.h:371:45: note: in definition of macro 'A=
SSERT_EXCLUSIVE_WRITER'
> >      371 |         __kcsan_check_access(&(var), sizeof(var), KCSAN_ACCE=
SS_ASSERT)
> >          |                                             ^~~
> >    make[3]: *** [scripts/Makefile.build:102: arch/sh/kernel/asm-offsets=
.s] Error 1
> >    make[3]: Target 'prepare' not remade because of errors.
> >    make[2]: *** [Makefile:1203: prepare0] Error 2
> >    make[2]: Target 'prepare' not remade because of errors.
> >    make[1]: *** [Makefile:224: __sub-make] Error 2
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:224: __sub-make] Error 2
> >    make: Target 'prepare' not remade because of errors.
> >
> >
> > vim +140 include/linux/mmap_lock.h
> >
> >    128
> >    129  /*
> >    130   * Drop all currently-held per-VMA locks.
> >    131   * This is called from the mmap_lock implementation directly be=
fore releasing
> >    132   * a write-locked mmap_lock (or downgrading it to read-locked).
> >    133   * This should normally NOT be called manually from other place=
s.
> >    134   * If you want to call this manually anyway, keep in mind that =
this will release
> >    135   * *all* VMA write locks, including ones from further up the st=
ack.
> >    136   */
> >    137  static inline void vma_end_write_all(struct mm_struct *mm)
> >    138  {
> >    139          mmap_assert_write_locked(mm);
> >  > 140          ASSERT_EXCLUSIVE_WRITER(mm->mm_lock_seq);
> >    141          mm_lock_seqcount_end(mm);
> >    142  }
> >    143
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
