Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86915149E17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 02:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769480970; cv=pass; b=sCfZ9qAIPuG0edvhzobD2xeF+vpPm+SMhradfOW4pOiH0kUkg/Cl1tBWn7N4TKbLJF+x/kVDpr2lTU8W0pGBPupgfR4uR0D9/TNdSsPU6epR+IWbzwVlBsqjMSZwuAR89TrSPp9DWb25NmWU+pXpDJc/uoWTTgaZ8X6GA41sSRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769480970; c=relaxed/simple;
	bh=yPX2UxWW7N4/r7e8BpNoc0/2oNDWfidjBmr6JaklJzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7vyUVVFw0zvhot1QwK+wXWyzIYmjw3hP6vUZg71hdNQjSldIviCnygFIu9Z397vEb3CFAWNa+jK+0jkWfyRtVfk7WqtzJcACwCya6gUM+PtkAJyhO0NYBIdDQ4viBr3MpRA9Pi8PMEKk7B0gxFN+zQd9NQEIJi6+4zr8UWWMEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZZ6A77d; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZZ6A77d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43596062728so3765654f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 18:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769480967; cv=none;
        d=google.com; s=arc-20240605;
        b=j+2RtS6npGyuhlTAXVLPpVxCpBobpHkShw8i+3k7L4tE459l3UXLRweYUgKGKxr+hw
         uPcEo9nNT14wLTIiak6wLCKUuw2uqVELJdGsHo8thon/4zoEsWgZeSFXxN9PDbfhkDo6
         hvo9m3yeEmcieU9L3fo5rMirysfWALQxl7CmMtAFx7T2BJ3V8Wj/XUcNQlwGOI3hgEAl
         GMjQ7HafT44ak1p+njnLq2wDYHz3ZeAHljxmCG5V6YsbgDu9+W9/jfTlPJp8K90Vpt+/
         2bT2Sh7QWALCO6K+Ms8dYBmVM2C9ef3mSBULhhQAMK/j7S1+1fhi5G6eKshJWWyc5L1B
         RXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zC2j0Jfkmlqo+I0JfCWbANnbTnMT3Wh8bohHZbF81zg=;
        fh=DAzTwY3Uy/+NQjrzeAPxCGj/FesGKjgTleW7VThfLc0=;
        b=Gs+DahQeq8dpl4GuL9axaHpsnHN6mFMaKlda7bunDu9MV5dD+MTNQz+kUtjp9kkD4g
         XAgA1/ttnEJuaxC6P7xttXcfMaIXRav2DU80qMVp25IP5fyBsF4X5P2mI41L37rgTSoc
         d/aAS0sZdbSTLCBVy56TzpQ1MExEd8x+HRtd9jcnQY4ub+770KaGFocvsUFY9Rk8fLWD
         g+GZeQChoaClMtaAyRHYF8jQWld2iGuAxu9Oh3L2EA4Jquny+lDSFFodlHgu1U4Qh2uc
         sXKANO1T+6ObjrQDThaGuI6kh5EefHICBQD0EytdbQESRQkTb7XeegGQBxyqBWKHwBda
         TGSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769480967; x=1770085767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC2j0Jfkmlqo+I0JfCWbANnbTnMT3Wh8bohHZbF81zg=;
        b=OZZ6A77dj7f49TZWRwhfTqcM+VjrSzAKY/CBdFu2ZkrxfRL2gu1hbmIVm+//GvETno
         mdstHkh2dMsvEih3bCTETEPA4QmYsf0Cvx3SB8ZkonI2bXCNM6QAj34DAhlDkBR62RQx
         naUAQGSv1G11w1OM+36hMnCGa8JEIHd2/btGh8lJqcTazow11N1sqooByIY3vn2/Nfxf
         rKHYSaRBCr7xIJF8TiYdz62D5q5QxNz+eWOpXlNYhgZLPOET2tGg2hkkuEWN8u2BZXgz
         9v8vpMt9EcdyoBeLqlml2Y1DojO5OTxJ/GAeUOr4mOK9bhT8NB/6Gdi0QxXpO2IEaRiI
         uiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769480967; x=1770085767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zC2j0Jfkmlqo+I0JfCWbANnbTnMT3Wh8bohHZbF81zg=;
        b=FfDCXFSCfa/9Rljj4gu1SRB+KQC6TNuyF6EtnkvH014NYjcV1vl9BEx0+33fW8UcaF
         TUnEwMSRwYWR+/7tIvHIOAhbYI/xaMmRyhI1iYlDEz8ORC9Ucob4h6LmHuKSbX4Eg7FI
         YQFgEguWCpqkMuFcZT1h4xerHyzJzJzkr0qBfnSbY6YVg+7mRqJ/QSKvbdDm6CAvwxiR
         M9PWRP/8rqAydVX+3K58zjybIfgI/KTfJSd1FL6HF38qbrI2EGM2dzNIkEEhDmBKJiWP
         g+G4gWWMrCDn4J7Yt8bPmUham2iR7PuLjsUhKbFlT7cldSPE2sG+8Fwj6d1m2X2cBGgx
         u9xw==
X-Forwarded-Encrypted: i=1; AJvYcCX6VAS6BvSwJwhMqIr0sbdwWf1TT4ni7eog3qcA3uZ+8LNXB6zNxYZjZpEPIzeF7mfsL6zI5/oGYxf6mh7k@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4aAhcR6BuG67xV5NVhZ1yyOaOUG4MsWE9U7AAXg65fU0ZM2W+
	ssf7qEuubsEsxVVhMBdut4qPlH9+JjteB3U4aLcOvO0vPtQQ645hIwoXgmpD0+O62g5ADtJuErY
	oD4DVpDMzBwLLFOw9/NBZY2344rAsKVs=
X-Gm-Gg: AZuq6aLIre/4h/hSOhimuNYTPKz54YVm1B1HHrIFpaSBPRtjr1nGjJY9XoC6NyVASyA
	w1YzuD6szMF1XZnqL6hfSiejoKz3Dz7vZHebXxnHfsNfGC6LHCksaJYR+WegKTFHuSJEguQTG/K
	t8xIE8dc23tEM/P9KR3kxW67vA35Mqxkh600WAVKsxiACMEJwoEh+qsHxYIzdh2rTldToU9ThIJ
	gh45sTBjy4hkvc20GpWQY9Z0FIo0hJ6vMa5v1oekwiPT0XVsEJoPRh0nzk0bZgpisNfWqia7KkS
	PhYvRtp+3YZxcpGNzp+LJ6G985mAbfs8+ig1y/KJWreLicaBK9y9wS1fOLSL++3KDTXjBbQVcdP
	jeJv2pH9QWtM+gw==
X-Received: by 2002:a05:6000:2c0e:b0:435:9a50:bbc8 with SMTP id
 ffacd0b85a97d-435dd1f7abdmr108303f8f.18.1769480966854; Mon, 26 Jan 2026
 18:29:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126173431.19825-1-ggonnet.linux@gmail.com>
 <202601270903.NBB1BD47-lkp@intel.com> <CAADnVQJNvx34irz6JYbmZvmaYU0AGRDcu8znsKjA_di798RisA@mail.gmail.com>
In-Reply-To: <CAADnVQJNvx34irz6JYbmZvmaYU0AGRDcu8znsKjA_di798RisA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 26 Jan 2026 18:29:15 -0800
X-Gm-Features: AZwV_QgGJ_z96uCfVOYhpG9WlUFldQomgN8ann-MUm7tE6c5sB77qAxilutzk7A
Message-ID: <CAADnVQ++Bx+xZ1jmeM6rLC7xeLHfsSUNizzMtw0=zOcPfLcc6g@mail.gmail.com>
Subject: Re: [PATCH] bpf: fix TCX/netkit detach permissions when prog FD isn't given
To: kernel test robot <lkp@intel.com>
Cc: Guillaume GONNET <ggonnet.linux@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
>
>
> On Mon, Jan 26, 2026 at 5:57=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Guillaume,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on bpf-next/net]
> > [also build test ERROR on bpf/master linus/master v6.19-rc7 next-202601=
26]
> > [cannot apply to bpf-next/master]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-GONNET=
/bpf-fix-TCX-netkit-detach-permissions-when-prog-FD-isn-t-given/20260127-01=
3722
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.gi=
t net
> > patch link:    https://lore.kernel.org/r/20260126173431.19825-1-ggonnet=
.linux%40gmail.com
> > patch subject: [PATCH] bpf: fix TCX/netkit detach permissions when prog=
 FD isn't given
> > config: sh-defconfig (https://download.01.org/0day-ci/archive/20260127/=
202601270903.NBB1BD47-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260127/202601270903.NBB1BD47-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601270903.NBB1BD47-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    In file included from include/net/tcx.h:7,
> >                     from net/core/dev.c:114:
> >    include/linux/bpf_mprog.h: In function 'bpf_mprog_detach_empty':
> > >> include/linux/bpf_mprog.h:348:24: error: implicit declaration of fun=
ction 'bpf_net_capable'; did you mean 'sk_net_capable'? [-Wimplicit-functio=
n-declaration]
> >      348 |                 return bpf_net_capable();
> >          |                        ^~~~~~~~~~~~~~~
> >          |                        sk_net_capable
> >
> >
> > vim +348 include/linux/bpf_mprog.h
> >
> >    343
> >    344  static inline bool bpf_mprog_detach_empty(enum bpf_prog_type ty=
pe)
> >    345  {
> >    346          switch (type) {
> >    347          case BPF_PROG_TYPE_SCHED_CLS:
> >  > 348                  return bpf_net_capable();
>

I dropped the patch from bpf-next.
Pls fix and resubmit.
