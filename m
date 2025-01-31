Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1814B092
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338169; cv=none; b=DhN+m0l13iEy4nR7Pi9NuffLRT9pNoNCLXh3rG6BfoyDYYbaFEyv1id20GbKSTayBgwR2ZyxZsGrheL+tpOvdyVea2FJhm4gUwsKT0AwR62cMXL8pQ+fyfbug8+d7wDRBoOm6uFx/emlxUtBJ0xwkT6gQxMYmj0ke3iCtB5V5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338169; c=relaxed/simple;
	bh=n9Gz9bG3IIEKIMS8XJwC/jZ68fSHVat70F1hfq0BtcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgW3O318ihF9OjDi0DIbsTQezM73K/MdyKRPh4q7SkszNcX+UtU/7YlGYvU93CtfhKAR4h7O8mxzWBKumOVTUzx6FSGpZ78tcCHxUj2gOpaUZQWzYWIUMOA1wmJ4HizP5gqAoeX/GFYsg9ivSAY1cmOqhSkhkT8LEkHVOBTvNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+RWX5Hf; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+RWX5Hf"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30616d71bb0so21599911fa.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 07:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738338165; x=1738942965; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bUtGCXebxJB/NUgo0wgvoy0ZsdfeWWX1Pfldx3r/dk=;
        b=F+RWX5HfeqYQcdkEDPz7CYG37w6C8cEnfyC0oBwAOZujq0RVzSUzXCnKJTXgmSEikv
         AaRzz7KfTc/I2L5lqYiAhD+ecrgqgiOoZP9vSHfXKHy76xQ2j7sxvXQ1mTi8gWo0A33g
         Ye2B7WpmCIkADslos5Ns3Uh4S4Z988NYaM0qgWNSGcQWAHB7wTN2sA61XbCoBKx/PQxj
         sX3SDYToG2dG7DKpbts7aHy/BOEhDZuzh4HwQAsVjxKBYXDKmwai7RWItyZsb/k8Gw8M
         Xna0BzyxPMbZyhj59g0LDlAzYwD/tZ4wxGZx789I3wvjxuLnusP8ybIq4YjxJ2587KtJ
         ECMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738338165; x=1738942965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bUtGCXebxJB/NUgo0wgvoy0ZsdfeWWX1Pfldx3r/dk=;
        b=U3W61Y7q2a0zIEdRQ9g1iT4+YwlVf4n52YLzSU1LHIqUotHK8FfzMKHh8TE+mPiqam
         YjIt9Fp3POLttW3/uU9U/V87KL/7aTDs49jOXi9UiRvXJP4bSOsL4hg2zZDzuaSvww9D
         lCPaIfG65KlvSZJ8+1esJkGI3JHll2e2clx2Y5du6LoaOZy8BUwN+TUoT5KEEw9Gje/S
         OGpJ0NUA8125OqVXViUH/tpCD185GFBrJjcc6F86zZyKNyywaZoZBe/NLxKx+4Y8No/v
         FCRQqC92qQfDK6y8Y5ko16PcAlt2mjgudr7od7l/PgKPtDUBZtvp1phkDfeia+Rak3xr
         AxgA==
X-Forwarded-Encrypted: i=1; AJvYcCW1hQtx4MU4AhjziCPdGIVKRJe5gDdAUfFYjqwbnEwQWLMsOC7V1UFTSCwjuznv1IiONIjOi04UgoG0oORI@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk2ZqVBPw3uuRq1JEBq9CKXCuaufFbgIEndOkoW7YD3bxSFHs4
	e7CeiFgvPhD6xaIVajWVspq0dSicoDKapjasmy6Kp7Ml+fPIYMtLHKkNi+1JR1rWVRu8tsX/XJ5
	DWJzE9GuMGjjxwnY9X9EXpVmgqo4=
X-Gm-Gg: ASbGncvDvLIl8Ye3ahJoWAtiKjIxCangZZ3ee7fefzVIxSEw76WTlWf92cyhzDHClEA
	4bGevSQqSTRZm33gl+/oCTZrF5GzadCOH81fHXwAxCs0NOiQvLx+xJOrhpmb9Bc942MGUqvQw
X-Google-Smtp-Source: AGHT+IFNrV95VHDgen0+CB3k2ntv9AqrMK4uGIr3VosIu2APJo+JZYKDsp9rhOjtLezKHw60AGcVcNWNWYiN2weKWp8=
X-Received: by 2002:a2e:9a0e:0:b0:302:1b18:2bfa with SMTP id
 38308e7fff4ca-307968e0aa5mr50215381fa.23.1738338165239; Fri, 31 Jan 2025
 07:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501312159.l6jNRaYy-lkp@intel.com> <CAFULd4bYhA+XsJH3rr=i98O4DJr_jjZe5HtBETGV_4Sm0S0QnQ@mail.gmail.com>
 <CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com>
In-Reply-To: <CAKbZUD0N7bkuw_Le3Pr9o1V2BjjcY_YiLm8a8DPceubTdZ00GQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 31 Jan 2025 16:42:32 +0100
X-Gm-Features: AWEUYZkkKGT6RsJh1QHVVEHFurmEuGz4J6nhpgm-gTCdnK1YGW2DY0LDl8hmIn4
Message-ID: <CAFULd4YZkRtcaE2T+v9DjUWVgYK08RPRPU94WXzAd7tq4mA66Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 52/52] lib/bch.c:317:undefined
 reference to `__paritydi2'
To: Pedro Falcato <pedro.falcato@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 3:34=E2=80=AFPM Pedro Falcato <pedro.falcato@gmail.=
com> wrote:
>
> On Fri, Jan 31, 2025 at 1:23=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> w=
rote:
> >
> > On Fri, Jan 31, 2025 at 2:12=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-nonmm-unstable
> > > head:   1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e
> > > commit: 1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e [52/52] lib/bch.c: u=
se __builtin_parity() when available
> > > config: arm64-randconfig-002-20250131 (https://download.01.org/0day-c=
i/archive/20250131/202501312159.l6jNRaYy-lkp@intel.com/config)
> > > compiler: aarch64-linux-gcc (GCC) 14.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250131/202501312159.l6jNRaYy-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501312159.l6jNRaYy=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    aarch64-linux-ld: lib/bch.o: in function `parity':
> > > >> lib/bch.c:317:(.text+0x10e8): undefined reference to `__paritydi2'
> > > >> lib/bch.c:317:(.text+0x10e8): relocation truncated to fit: R_AARCH=
64_CALL26 against undefined symbol `__paritydi2'
> >
> > This config for some reason generates a call to the library function.
> > But I have tested this with a crosscompiler:
> >
> >        fmov    s31, w0
> >        cnt     v31.8b, v31.8b
> >        addv    b31, v31.8b
> >        fmov    w0, s31
> >        and     w0, w0, 1
> >        ret
> >
> > It looks that __has_builtin() does not mean that there will be no call
> > to a library function?!
>
> Yep, __builtin functions aren't strictly required to be inlined and
> can generate a library call if the compiler so chooses (how often this
> happens depends on the optimization level and architecture).
> e.g: https://godbolt.org/z/zKPb9hbaM

Thanks for the example!

I have to retract the patch.

Thanks,
Uros.
