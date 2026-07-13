Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C257129B228
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963257; cv=pass; b=Ff4Q9cBXlQBKl8r0uy+EpGEaXCjhuiBgklViWIkNysurNoY3zpnNa3Cs9ICoe5rbib+hHyNrXcHI36rEvoyRp4qjL7n7SC+6ULUxSzkGTqUt3gJUjfiNWnuN0i6E2COECICuxByizvUqyrmM05fkcwHP/DQEtnMz7JpMLkeT29M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963257; c=relaxed/simple;
	bh=j+VWBP3JZZ9bvegeAImxD3t0lnkJPKxClSYTCXu3Qcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBtBO78RL1EDsHGtuH0f/lZZQ7P4ujy8ZJOwpQIuPx2njAyp8gmdvb+EpgOq0UU/nwk70wlco6qor54KNzWdKUwd/aRj75yOM8QiIrs7NOja1l+US61VJGKc2v1BxWiBsN93cpBDl+7wXK+TZeR7wZ0l6KDnptW0MEqIi5PpeFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MBMBWCAh; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MBMBWCAh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cab97c86bdso4415ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 10:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783963255; cv=none;
        d=google.com; s=arc-20260327;
        b=G+Y7sELA19qAFisCHQ4T+vsNjcL17hkrDg2ZjsLfKhFcWagc8cZat1ZU+FZ0mU/JfT
         HStgWWTBfBepbj54hTjVn/iUgfLwvL1dKZWfy4Jxna4q65u0sRBctXysn4L8bZmHULqg
         H1g+f3D1mVH7Hy/L60r7f55ss50xWmD+M8l14q3VHG56iA+J7whfIYj+hJi3sqUnpqVA
         eyLdEo/wjgxwRQlShAPEx8OLvFdCWXuaOEvXjWEXgdHKddNTnvWc/ryJY2mTdxvvyZgD
         0WEZmZqufGMZu7i7AqYrPDicH2FL881anZwd936QTPFcU1VMUvxCcsDtTGPFauWOrLYJ
         cHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Up4enbVP5XhzSIUsHA2kSerHZ2dcsLiJ/grrTWqZXk=;
        fh=y9T9mk25GarHJykSvv+B7AgLdPsLlqrr7a3CojkNNdM=;
        b=VV7oJspmbMQqau+kSYLoWVhWFgKsoai+f4pXyRjB7Z/OZocF7b6B163FduC4dGlWE2
         hc39iwOWBKZ/EWA6ZORtnVJPDX1P6m/zphIZYy/80TppTmUZfFFleagbRXxhPMd3H4se
         3ZG1xNI4oK/p6jU8aDBI5RGGAUUjRZkhAupQ+VJO7O1/OikPplD+sWsOowAMTWD0XPdL
         /SnpWeCssFfn1ZS7rixzGQXbTjJlTxBsaJVYyixPnUY2UIsy5YfZHIrpdZTPuxU2oWUy
         tPZBVNWL2tHBPtKfQgM8m3huLSG4TBt6w3qxP0MpqXEitf/nnm93JdcnQBDAc8oaYwu9
         OXxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783963255; x=1784568055; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Up4enbVP5XhzSIUsHA2kSerHZ2dcsLiJ/grrTWqZXk=;
        b=MBMBWCAhzwt9gMdJq7/mdKAgjfJijqkePn63tQm4cd7Kd9CIpQ1wUOsQgZB/GbbEFe
         i+7iWoteduq2Zm0RBKfOthCYwM5rQu5xoMNOAJrScCXck/Ts4oq9mBwE7v421wgyPXUB
         6B/k/3ytzi029W8qlh7uV/aMYdHfFWUP32EnVQDAYJk6sDLcXifazioRU+QahPMlTw4i
         2OpPJk0ZFAy6mWjDi8L82AkAGwY6Rtia+p9d37mEDgaYJB/yJa+oME4oY9rXC6eidXD0
         T5mTbUju7CL+Y8x0uxN5yJxhMD8XfOCZKkrNXTqupoI7+C4gdsD8+QT2RyT2BUbObZyh
         caMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963255; x=1784568055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Up4enbVP5XhzSIUsHA2kSerHZ2dcsLiJ/grrTWqZXk=;
        b=IiB1dbGU42kPyKQ9Vmo2+N5W3CCepR2x3Y7R5Wl4GmOLIF3/zVA2CJV4uw0txRkYzQ
         sHZ0Ql/Umsxqtmvh7cCoD3f4cqo66YM7L0kIzFI097Kl9PdbgmuwcIgHJuqV30T2I4Lu
         dCPvwAOrB/1EtApB2JitjAPtsZTruBaNMu6MkHtRLJQDIbcIAUysjj8RCJjqz3K5XPUC
         1ZyLBwsi7oQ/D8W0OylczvjC56OWV0qdcBUgpVr0zRpJlBFYySGthphNW8zMk5DdJiqL
         xD1pJ1sdD7jbLxCnMyfxLa/o9K67qT0mPbA3rLbhOHUnS13fkQTwLn7LfETxhK7SIbap
         Jfdw==
X-Forwarded-Encrypted: i=1; AHgh+RphxhlJPonAeHXSPFnMjivXev+qCiQnD/1ULYeXGLExfcxqOE3nWxPNZxhvRFsRAnyY4CbCY29+J/RTM45l@lists.linux.dev
X-Gm-Message-State: AOJu0YwtrSmBmuKdNcIKeVOzoHDc8E+rNUVEDgHwXI930xCs/eAQ4Ine
	Zru1+QHVbRAHchlHIqdNLUU6DrhcialhCNvgevkxFYBHOtt4cGNZiE/XpBqvFN24rI1P6ewfuSL
	k7E96mMYYx4tAyhqyIO7ZwAXUnw1wsVNUbZYQI1uc
X-Gm-Gg: AfdE7clwi0Nyn958C+9a1wIO60X7IRCU3al8WtKo8bG9zKih2vYibIHuHCsTrki6FCo
	jF3Uj3hRgrOziRZ9hO31J6y1bBGwGlzQjOubX/6PGuDX19LxVj5/MQQWvtr3yuMBYOAUse31Hha
	aKzgIoC5j/ox7A8x84G56KgLUKgpUA6Cv/JAkpCLTslf/UJFOmrmSeXXw/aKjyw6Wdz+982D/jS
	wP4oEYKa1nd1X2huUSyun2KWQkDJniyMyC/YWKyYx4Y2KSsPke2afi29cfGG5fw+gb40OEb8bZ9
	4HG16Bpi6YKn+nuVk9MGwoQk
X-Received: by 2002:a17:903:3850:b0:2c7:a13a:7fe6 with SMTP id
 d9443c01a7336-2cee1be4f23mr1770825ad.10.1783963254512; Mon, 13 Jul 2026
 10:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607091820.qbjlGhKK-lkp@intel.com> <CAJuCfpHjUij9kkD6QiWxYvsYD3iKga9rzJZWnN9vCf3bhp-dXA@mail.gmail.com>
 <CAL41Mv6UNWWdv3a2g2+tKuy+EX=8FJZSCcEAyHYyuUybYK4NMg@mail.gmail.com>
 <CAJuCfpEpFDUNjgsHiETmxTLyVfHdCKEk8sR2fQtixBR8JOYRoA@mail.gmail.com> <CAJuCfpGmHY5_4G01DNodJA8byCkJUET00Lr8Ap0P6+XMV1=7jw@mail.gmail.com>
In-Reply-To: <CAJuCfpGmHY5_4G01DNodJA8byCkJUET00Lr8Ap0P6+XMV1=7jw@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 13 Jul 2026 10:20:42 -0700
X-Gm-Features: AVVi8CdocdmQKkxGo8IOucf6phPMN-TtFmhTpXYtX5usitAxYi5eJViaBHUqH20
Message-ID: <CAL41Mv5X4tNvRcP1u9kEe6LKMTYpeS93E4oCBE_3N-iUgVLO=Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 344/369] mm/alloc_tag.c:356:58: error: implicit
 declaration of function 'compat_ptr'
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:15=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Mon, Jul 13, 2026 at 10:13=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > On Mon, Jul 13, 2026 at 9:43=E2=80=AFAM Abhishek Bapat <abhishekbapat@g=
oogle.com> wrote:
> > >
> > > Hi everyone,
> > >
> > > I can send a fixup patch for this error if needed. Could someone guid=
e
> > > me on whether I should amend the original patch-set and send a v9
> > > patchset or if there's another way to handle this without sending a v=
9
> > > patchset?
> >
> > I think Andrew already fixed it up (I saw an email flying by but I'll
> > double-check).
>
> Here: https://lore.kernel.org/all/20260709171454.58E851F000E9@smtp.kernel=
.org/
>
Ahh I see. Sounds good, thanks Andrew!
> >
> > >
> > > Thanks,
> > > Abhishek.
> > >
> > > On Thu, Jul 9, 2026 at 7:45=E2=80=AFAM Suren Baghdasaryan <surenb@goo=
gle.com> wrote:
> > > >
> > > > On Thu, Jul 9, 2026 at 3:00=E2=80=AFAM kernel test robot <lkp@intel=
.com> wrote:
> > > > >
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.g=
it mm-new
> > > > > head:   59e34180e138a293260301c139cf7ee800978533
> > > > > commit: 27ace96bf8195484c9e9e1a08eb5af5a4e81f9f0 [344/369] alloc_=
tag: add ioctl to /proc/allocinfo
> > > > > config: sparc64-randconfig-001-20260709 (https://download.01.org/=
0day-ci/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/config)
> > > > > compiler: sparc64-linux-gcc (GCC) 15.2.0
> > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-=
ci/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/reproduce)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202607091820.qbjl=
GhKK-lkp@intel.com/
> > > > >
> > > > > All errors (new ones prefixed by >>):
> > > > >
> > > > >    mm/alloc_tag.c: In function 'allocinfo_compat_ioctl':
> > > > > >> mm/alloc_tag.c:356:58: error: implicit declaration of function=
 'compat_ptr' [-Wimplicit-function-declaration]
> > > > >      356 |         return allocinfo_ioctl(file, cmd, (unsigned lo=
ng)compat_ptr(arg));
> > > > >          |                                                       =
   ^~~~~~~~~~
> > > > >
> > > > >
> > > > > vim +/compat_ptr +356 mm/alloc_tag.c
> > > >
> > > > Missing #include <linux/compat.h>
> > > > After adding it the error goes away.
> > > >
> > > > >
> > > > >    351
> > > > >    352  #ifdef CONFIG_COMPAT
> > > > >    353  static long allocinfo_compat_ioctl(struct file *file, uns=
igned int cmd,
> > > > >    354                                     unsigned long arg)
> > > > >    355  {
> > > > >  > 356          return allocinfo_ioctl(file, cmd, (unsigned long)=
compat_ptr(arg));
> > > > >    357  }
> > > > >    358  #endif
> > > > >    359
> > > > >
> > > > > --
> > > > > 0-DAY CI Kernel Test Service
> > > > > https://github.com/intel/lkp-tests/wiki
