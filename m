Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D430DEB2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 05:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488319; cv=pass; b=Ov75iKuMYeuOcSSa6QQ2x1uNGq3luEw6q3CS8NrA1hgbPGOKpjaUXoM5aZKv3BCBVF3bSer8pHIku1weXp1Y7ig7QNsXH/Ti4z3RlJt+iwr/qRg8PjHe3bHdgC2XRKO3PoVb/ccLvoRuTEC1oIgJ7JaUyMEWJOUnuX1VzIUqo2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488319; c=relaxed/simple;
	bh=/kTU6MFmevrrv1OddF9a+mcU8Z/0Amm6MPhpD/q6zgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9wjiwNc0cF7170UcUBPAOTzP/l9qG+Pzf3MxKNlCWd5xsNb2rBZeLqup6ySU/oNd+osZzUwDLQxifCbEBb90qSL+xpqtUBE3aq31nuYtTCuBarv+CM8z8aJa6ICEhWADgzMwCK3OPO5j0+PE03v38/9QXDz8aaihdK1atClM6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmTQSQ4A; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmTQSQ4A"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474303f3c72so142575f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Jul 2026 22:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783488316; cv=none;
        d=google.com; s=arc-20260327;
        b=SvkT5qDI/SMBy99qHnL1sjY1+B1BHF5s/QXq29FLqQZzMS2ecYQARyNpyWJQTtrDB8
         GRQrTA0TngnTrjmy1ysPqxqZGWC3A7UXksp2v8fW9BeCACIh7MxzPVlwG/4qRt31A2rK
         QuNhZlnO2xjfUQrGDL1xeHZqzEWU5p/RBqMVa0GLV6oVHMH5F0cEUs7uhGPZl7WQTof5
         tA12tzljRdtUBWxDgYRwI0AaBnkKHfjXOno2uG5kyG5luY9gFPLoIjZjb9DJ1vGv1dOL
         fOq61Osn/TmmD31UT8jae/Adrd4jgFQz02CHVtzxfWLOniEoQadAp0qFNDxGM8h+TOyT
         7XNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=McxLoVeeXuZbwaPBqU1uU+GUw6cbUxZwfwVouqa0k9w=;
        fh=LlkaWlOjMlu6Q+AExQdgdTgkH0/ooMrbbubfMvKmFBY=;
        b=h89tatUHUfDLUq3kbaW8GImogQ1FfYEgcNzDcmDxhrjK7JcLhFo4zoQzw7xYO0G8+l
         7K8vlIboNp3v5shaFMdKQPdY1ZswATu0xvD2L7KWJ4//Qg3h3t5qepr7c6A8Gv7AlkLR
         vnM8LoPWs7/Tkp4uJ2C/NB/Fo/XY131BMgFzXWNAxzD6gyHO0DOo7mtmdBmrmLRzqsFE
         HsmboaAU22HrqU8kNIINxjypc5sUxbtkiZO7ItTGOhH2u6/5hDTKksoLkxB0NZp96Wrz
         L5RP9p1/YSUPonlKVMk/9KyfZ5WcFQ14Cn+dBcNp8jmy8sKx71aUKHfQpf9BgSgCt/yj
         jV8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783488316; x=1784093116; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=McxLoVeeXuZbwaPBqU1uU+GUw6cbUxZwfwVouqa0k9w=;
        b=XmTQSQ4AnTT6ArTp61b9Rc6GfxhOHbU8t9IehB/a6m/sgiA/1iALhH71BpeJIGH/Ry
         uljBJCN/KAGDsWOKbZHDpVaf4Rga7Gm4B5gMkfTQaVTct4GmxK8Fd2hdNkXPI9/q3kr3
         UwnibdBap6RrNC3E86DplXpTSgUzM0ux3yeGeIfrHN5wC+jkJGOLQa0YxiSiuB8pdbgb
         jPeafzAw5hXgGWXs6IFq4U0tAeNKZnanxkr3mZDuNgQ6mMPiP8LHZo0rTVOfmjik/iId
         rpFEV6pTmJqmyUP/DV/ldBcMJ8VMMdDfOMVm566Y4jHNWkvJbt4XrHQWAogBYQ0qbSCE
         Eorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488316; x=1784093116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McxLoVeeXuZbwaPBqU1uU+GUw6cbUxZwfwVouqa0k9w=;
        b=dfKnUTiUOrsuX+h81LMWzso1Gilw6+OW/jsFWvzaZ/sg4qu9vPCxNo/uFWNWxY1rVN
         +I/G6r+aCa/fRtuAvMAV7lhCfDd88xPiNpi4MreOleKhdrO7WdhuigK/n9rqIdy1fpy6
         GuUUZIUDzfq1Ed09fOZtbMNEcO/VyA7EMj64KpKzVAgJrxTDT3rGc+Cf4o0IA9crGDTo
         LcWyhaEo0D6+eFXz/kJ8sSFhFg2MSEUicvM+OQwEIlpYxE9BQwMWeB1A7Xw6YLKqVmjq
         Hfec+ZSIPs0PnAdBynO6ei/HkIoAMRgp1x3mLM0d/62TWRzQ/xqlm2H+sgGOP+VTch27
         Y6LA==
X-Forwarded-Encrypted: i=1; AHgh+RqRdsBtMFpHzC8HHwBwvR2fPfG9u18SBV1xMegxJsSR0T/tY5jTH+Gy6Q3eKt2U51iqc0m5zSNIenF6cXzL@lists.linux.dev
X-Gm-Message-State: AOJu0YyHrwhiyAM6TErwoSNA5GKPXF/ku6zQqCA7Ww9+hzfG6BflzFUU
	hBRPpnGBPU2SCcVBUlpTBe01nqIFAukqIDCQVbTIomcEMLfwgvYyyMhyjj7JsidrZAVlHLoQ0va
	2ihKfY9mNpz30ePAtlNs8GbN2CwODetc=
X-Gm-Gg: AfdE7ckabhWw+YwXZtgmB516wsB0pn/4dyGUmY71Mw3S5EdwS40HMyWHEqICQ9WM2Bc
	cX+1FH0zgSDqO7O7bPRCN7qqe+b4sWhO7ORKHhWv34AlcoTxkKRXZmf6pcFPviz7J0P1MDCtNfM
	gjN75ZxOlPAbXPwURUeKRLq3P7npHn/AQwd7TtAji3Wbzxe/6Hyh/kT7iuKOdfF+IJ9yZh21465
	GhbroaBezyjwFzNEaXap972TCQQ3xad2PMcP2oP/OW5lFeNYKHf6tEkP3aSCVRrn+3HzHLAue7O
	aPZu/UGa8djpmatRZMD2BAX2X+fW
X-Received: by 2002:a05:6000:4715:b0:466:6ed8:1e1b with SMTP id
 ffacd0b85a97d-47df07be343mr640145f8f.21.1783488316058; Tue, 07 Jul 2026
 22:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607080254.6qrH5NrH-lkp@intel.com> <d7f0aa94-43e7-4890-b4e3-8a9d093a68af@iogearbox.net>
In-Reply-To: <d7f0aa94-43e7-4890-b4e3-8a9d093a68af@iogearbox.net>
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Date: Wed, 8 Jul 2026 14:24:39 +0900
X-Gm-Features: AVVi8CdwFc7jgMn5Ac1MXSO0AgsJ_YTJvkz5tappgS5guv8WZDe10MeZG10_wns
Message-ID: <CAOrxSK6jqXnv7D5E2jboDB7fGeA6ZO=ohX6gD2RdQPfgXOxVaA@mail.gmail.com>
Subject: Re: [linux-next:master 4051/4300] kernel/bpf/task_iter.c:759:14:
 warning: variable 'mmput_needed' set but not used
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Daniel,

Thank you for letting me know.

I will come up with a v7 patch that addresses this issue.

2026=EB=85=84 7=EC=9B=94 8=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 4:09, Da=
niel Borkmann <daniel@iogearbox.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 7/7/26 8:47 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
> > commit: 311e11cfbfbf3bf8030de95b831d5c45766b847a [4051/4300] bpf: Fix u=
se-after-free on mm_struct in bpf_find_vma()
> > config: sh-allyesconfig (https://download.01.org/0day-ci/archive/202607=
08/202607080254.6qrH5NrH-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 16.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260708/202607080254.6qrH5NrH-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607080254.6qrH5NrH-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >     kernel/bpf/task_iter.c: In function '____bpf_find_vma':
> >>> kernel/bpf/task_iter.c:759:14: warning: variable 'mmput_needed' set b=
ut not used [-Wunused-but-set-variable=3D]
> >       759 |         bool mmput_needed =3D false;
> >           |              ^~~~~~~~~~~~
>
> Sanghyun, I'm tossing the fix from bpf-next tree, please resubmit with th=
e warning fixed.
>
> > vim +/mmput_needed +759 kernel/bpf/task_iter.c
> >
> >     752
> >     753       BPF_CALL_5(bpf_find_vma, struct task_struct *, task, u64,=
 start,
> >     754                  bpf_callback_t, callback_fn, void *, callback_=
ctx, u64, flags)
> >     755       {
> >     756               struct mmap_unlock_irq_work *work =3D NULL;
> >     757               struct vm_area_struct *vma;
> >     758               bool irq_work_busy =3D false;
> >   > 759               bool mmput_needed =3D false;
> >     760               struct mm_struct *mm;
> >     761               int ret =3D -ENOENT;
> >     762
> >     763               if (flags)
> >     764                       return -EINVAL;
> >     765
> >     766               if (!task)
> >     767                       return -ENOENT;
> >     768
> >     769               if (task =3D=3D current) {
> >     770                       mm =3D task->mm;
> >     771               } else {
> >     772                       /*
> >     773                        * Foreign task: pin task->mm against a c=
oncurrent exit_mm().
> >     774                        * Use trylock on alloc_lock instead of g=
et_task_mm()'s
> >     775                        * blocking task_lock() to avoid deadlock=
ing the target task.
> >     776                        */
> >     777                       if (!IS_ENABLED(CONFIG_MMU))
> >     778                               return -EOPNOTSUPP;
> >     779                       if (irqs_disabled())
> >     780                               return -EBUSY;
> >     781                       if (!spin_trylock(&task->alloc_lock))
> >     782                               return -EBUSY;
> >     783                       mm =3D task->mm;
> >     784                       if (mm && !(task->flags & PF_KTHREAD)) {
> >     785                               mmget(mm);
> >     786                               mmput_needed =3D true;
> >     787                       } else {
> >     788                               mm =3D NULL;
> >     789                       }
> >     790                       spin_unlock(&task->alloc_lock);
> >     791               }
> >     792               if (!mm)
> >     793                       return -ENOENT;
> >     794
> >     795               irq_work_busy =3D bpf_mmap_unlock_get_irq_work(&w=
ork);
> >     796
> >     797               if (irq_work_busy || !mmap_read_trylock(mm)) {
> >     798                       ret =3D -EBUSY;
> >     799                       goto out;
> >     800               }
> >     801
> >     802               vma =3D find_vma(mm, start);
> >     803
> >     804               if (vma && vma->vm_start <=3D start && vma->vm_en=
d > start) {
> >     805                       callback_fn((u64)(long)task, (u64)(long)v=
ma,
> >     806                                   (u64)(long)callback_ctx, 0, 0=
);
> >     807                       ret =3D 0;
> >     808               }
> >     809               bpf_mmap_unlock_mm(work, mm);
> >     810       out:
> >     811       #ifdef CONFIG_MMU
> >     812               if (mmput_needed)
> >     813                       mmput_async(mm);
> >     814       #endif
> >     815               return ret;
> >     816       }
> >     817
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
