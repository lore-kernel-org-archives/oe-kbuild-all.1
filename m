Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF962701BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962935; cv=pass; b=CZbkH3KKUVe8rKj7SclZPWJdxSGBHfFMNa+b59E39RS4S72Y6x3/8pS2Rv7A9U3tmSq9L/UVdh5ArWPY7nUAvzAQSi6Ss4P4ySNexjkWTenvhKlMYrYrxUXahLVlP0sANMrUA0DgrYWd9Yk7lOAOKkk5Em5sQq4eov28wqzegTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962935; c=relaxed/simple;
	bh=kvADKfFp/IZbZct31ztc7jD+j2mkpZhpin5cMq3zYGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFcS3N8K/ZuwibsY3Pg7ajetX+XGCnNJcN5OntVB0FzwlK088/Svgh8bbS/d3uZ1c7Ottt2GKMw/A7MqnusMcVRzf4iA2mUQHtgT++sWxDdet22RETfXpSOb+zuvPm+V/Un0yHmWZtz9S+dQ5cGCjZMF0xAGdLUKQaJ/j+KmrDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TljzuEgd; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TljzuEgd"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c01c79467so17311cf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 10:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783962933; cv=none;
        d=google.com; s=arc-20260327;
        b=lDrakepVKSw31qN+wp7lWCo4eCRDoF/9j4hGkCT5SEKhhRUwSm7WzHLP9CYaRhmUUw
         P8Mwf2RQDO1WbVVleeOB7rPvYi+kFU/msfnR8WqlbLDOeXLQlIIS41EMT94W56YIZdTI
         nYAxkyH9ZK4dwT/kVUykRPdEvVMfcKqvSRYEFpjkTxInXBxUHJxPBeBgw7n6kBHHo9zt
         uIlIG7uYR/oPraSxi/UILlYo3XU5YYRnxsHvbLdYWmM0d8VHYpuF0aaShKpZsFxTOnt6
         WX5MOmrEXYinnXRZvb8RFTLCnO2Xpc8OKdIvOc7tvv1zz+82Caf7avxB7beuR73SXGve
         uz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mxVrxa7HxzqTiw7ir6NHv4olNuo0XGTjz/0zgJXDsGk=;
        fh=Y9LDbVEUr6aVZhEo6DfIg9y+iFcCQoMgr74yuA8HUbg=;
        b=SPmDO5sg+/eolHL43xcROmNrCh/wFn+UsVqGQsiyRtiQkXZSqSOlmC4LuSwOG2mcpE
         JDdV0hPF/sjek1JI1ExX2csbJqY523eNiFtV+Ai2TgUCzUm2n9Vnhf+ThEuFpFEEoMRK
         wKqeNT+pIrpR/tmKgx+c/cXy34TOWYCdgnnJp7a6X06sFFIBCWg5jRxfF2iF/PRnyM1q
         cSku07Bek/OQT4blQ/MFL0uI9X1GJbleU57XVz+2BCOrC0LxAKaRmE45QbK1rq1fZEx7
         aHPjQbQZL/QkBV3avPxC2GAM0nz0tU0/H8jIue84kSAP6vvnhtKnsNGD3ixzTxBFBCG7
         gKcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783962933; x=1784567733; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mxVrxa7HxzqTiw7ir6NHv4olNuo0XGTjz/0zgJXDsGk=;
        b=TljzuEgd+WiVPgWSb+xfhCviZymeBgMeIn1SGr162abBD04ep22UGxF2G4prZ8CxKI
         4z/n/guAHG1LoFT6R7tnle3A2EQiFBQ7HJ+pUR4XsmWaPz3crGWPs8Oy3qhe9xl+ECXx
         PYe/S7a7Lw1MrTqdtx53rF7HgbPwHQ8RL7bOqhPSZgdsPjEwIttHSji5NL+ZQXgnoGbX
         9/ofJNwsFrhOqWNuS9UtOFv163K4LPYsPgbtRfpzW0fQ/yLF9Ak97Htg588Qmyeyna8F
         IyZSmR+mEnFr17ha7l4ik/2tVkEbHBzjPMjWdOsxrcSAaD+10h7H7sd5Jw1DcLuHFZFO
         Nrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962933; x=1784567733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mxVrxa7HxzqTiw7ir6NHv4olNuo0XGTjz/0zgJXDsGk=;
        b=Wugx4nE2IgOtz8BohVP17Sh7NlCQnuE9ykMzvxtq3wmnIk9p5Rw62RDJ+c5qVESpzf
         GR+I13+Zo3q/6FRAJHEPHBXFEza9W0XuD40cJtKRSG+uOBXpUg3WSi9vab4yzQrsz176
         xQ6fXKdrdIcrzFRnY3f8iTyojwdgUVpOUWxToMpWK+d+Yb51wSpgTVtRUdcPL9TZpQHJ
         E/nkrRfiviAsUaYJM/SgZPa2eIfI97tPSzham3HA5PeNGLgqC+CoB0t2IgC2qY+eqCe1
         ydgntW8syHb4KUyRoazPef7kkMMZ+ztnb0YXJo95LVLWHvdQoue4m/jQFvc0gh9YjLwj
         MYIg==
X-Forwarded-Encrypted: i=1; AHgh+RqbXjuIC0IUVbmqLsLo18LesKfVpRkKXvcL5Un8KuOZc+Gnvwwr8uuqPAtdOhx761Rr33ldTrmgv/5KIkfv@lists.linux.dev
X-Gm-Message-State: AOJu0YxSEVx6CpNqu3/Ea/uB0z6ffNGwTu8KUKQFUbGc1ECfGxU/Em6d
	vQZPFn8TRfyqRnuRo63ozm9Dv3SGHG419xoqY775n4Zn89BIUA6W10PCAK+FJs92QhK7IqYMZSl
	XLDT553oHnfMQgobynrRRApL4OslFT9MkMSu/sIDNQoQg1bEr1TJcLniyU9c=
X-Gm-Gg: AfdE7cmOBtMNQ+Jg/XV9FFHmI6WRybPtKBtMIHkzFMNOxUztDHlxP7Cja8isUTFp+wX
	agY5byLur5Jw7VnjgbQk2tGawKGf5CtDoxnEq+JoEvH0i+IBs2IU32OcKG0TmMgbDdoQrLfF593
	h4djXiaeVLfqDexsBP36AW7AyAPjzQ7XwCq5MUYE4a8jKfmG0X7F9qaImDOtTfOGfDjwzXfJMq4
	KB5yMgipBhxAqZ2B12hvzhx/+Jz8Cs6y8yx8e8RnrLIi7A1m7xmBWCCDwqYxOY7dX01XOOb1tX/
	W/QC1Q==
X-Received: by 2002:a05:622a:90b:b0:51c:97f:83a9 with SMTP id
 d75a77b69052e-51d71546a4bmr4450771cf.1.1783962932086; Mon, 13 Jul 2026
 10:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607091820.qbjlGhKK-lkp@intel.com> <CAJuCfpHjUij9kkD6QiWxYvsYD3iKga9rzJZWnN9vCf3bhp-dXA@mail.gmail.com>
 <CAL41Mv6UNWWdv3a2g2+tKuy+EX=8FJZSCcEAyHYyuUybYK4NMg@mail.gmail.com> <CAJuCfpEpFDUNjgsHiETmxTLyVfHdCKEk8sR2fQtixBR8JOYRoA@mail.gmail.com>
In-Reply-To: <CAJuCfpEpFDUNjgsHiETmxTLyVfHdCKEk8sR2fQtixBR8JOYRoA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jul 2026 10:15:20 -0700
X-Gm-Features: AUfX_myZvy1Z8rlEHgfTq9Uyko36CQ_cIKDIOFd8bUwroWjufDnlrmXdmhg81mI
Message-ID: <CAJuCfpGmHY5_4G01DNodJA8byCkJUET00Lr8Ap0P6+XMV1=7jw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 344/369] mm/alloc_tag.c:356:58: error: implicit
 declaration of function 'compat_ptr'
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:13=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Mon, Jul 13, 2026 at 9:43=E2=80=AFAM Abhishek Bapat <abhishekbapat@goo=
gle.com> wrote:
> >
> > Hi everyone,
> >
> > I can send a fixup patch for this error if needed. Could someone guide
> > me on whether I should amend the original patch-set and send a v9
> > patchset or if there's another way to handle this without sending a v9
> > patchset?
>
> I think Andrew already fixed it up (I saw an email flying by but I'll
> double-check).

Here: https://lore.kernel.org/all/20260709171454.58E851F000E9@smtp.kernel.o=
rg/

>
> >
> > Thanks,
> > Abhishek.
> >
> > On Thu, Jul 9, 2026 at 7:45=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> > >
> > > On Thu, Jul 9, 2026 at 3:00=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git=
 mm-new
> > > > head:   59e34180e138a293260301c139cf7ee800978533
> > > > commit: 27ace96bf8195484c9e9e1a08eb5af5a4e81f9f0 [344/369] alloc_ta=
g: add ioctl to /proc/allocinfo
> > > > config: sparc64-randconfig-001-20260709 (https://download.01.org/0d=
ay-ci/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/config)
> > > > compiler: sparc64-linux-gcc (GCC) 15.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202607091820.qbjlGh=
KK-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > >    mm/alloc_tag.c: In function 'allocinfo_compat_ioctl':
> > > > >> mm/alloc_tag.c:356:58: error: implicit declaration of function '=
compat_ptr' [-Wimplicit-function-declaration]
> > > >      356 |         return allocinfo_ioctl(file, cmd, (unsigned long=
)compat_ptr(arg));
> > > >          |                                                         =
 ^~~~~~~~~~
> > > >
> > > >
> > > > vim +/compat_ptr +356 mm/alloc_tag.c
> > >
> > > Missing #include <linux/compat.h>
> > > After adding it the error goes away.
> > >
> > > >
> > > >    351
> > > >    352  #ifdef CONFIG_COMPAT
> > > >    353  static long allocinfo_compat_ioctl(struct file *file, unsig=
ned int cmd,
> > > >    354                                     unsigned long arg)
> > > >    355  {
> > > >  > 356          return allocinfo_ioctl(file, cmd, (unsigned long)co=
mpat_ptr(arg));
> > > >    357  }
> > > >    358  #endif
> > > >    359
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
