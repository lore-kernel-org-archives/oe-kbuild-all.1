Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243463382F1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961015; cv=pass; b=AfFeSsYcE3a+JPX3QZeHkPiHbAYKMi9vHiMgS9DSKLo58sQ+c8svzjYjEUAw0zPo+hYDy6LuuRFyBGfQ60DEIEVtK4ymeRsIo78WKVlsC8khUanJe4BbrVd47UWhgtUXEc+ZQG2JwJ3F2g/VSXIyNCid6QXypUcPYDlMA8lLFhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961015; c=relaxed/simple;
	bh=wVPz/aitjsQlMx1oF4wx/aef8cPPl1j11BPR0oV/Ggs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GLg08M+RIHOING2IPpndQbriV9q2nDs/YO7TL2RygQ7ZL6rpXT9cDc686PjppF5rv4imayeeFqQcHAx7rh4KmoCbNVg83cv3F0lDRp2QXoJlCN+W1ePgTHbGKYlMH1KklSaZJ6jP4iUGzgEwhp1TX1W2GbuzpFpDlGYtiUM003w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rccAPZMe; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rccAPZMe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacef7d299so192275ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 09:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783961013; cv=none;
        d=google.com; s=arc-20260327;
        b=SG9bIdcl+rld1xdZUPCsVMXjR59NOJDEMRbZvWKktKwCMNWiiFVL5VroIKffeBOa+k
         9q1hKLip3LNohN/hVWrX9+uviy80zWRaqoK1klRHcjKLo4VPhubB2twxfhXsUn9F95ko
         zSXt+rofbaX+FCQLh13W+vvlCgVp+FsCwyYpYEdIzbSYWPHRvkd0pP1J6HkSwy4TJfdz
         r/OaAapXWQXmyx4jOi+2sSvzqgzryfP/mYKMFfaLrHHnHQIZQ2or3jxnjYM+6/OXoaCY
         odgHh6IZGXXoi3nGevBNbFf1RQUzU5AVvBhZaHIH5m9LKB2h9R/uk8P8o10PE3ajlvpV
         wrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7RBjI+3c4wbCLyC30m5N44VxvHGqMYoVlsOrdbCo2A=;
        fh=EvNIs7K5wguvya8D0B2UNGpgjzIRuVsXsEuQWOv8dA8=;
        b=mVBYgKj45snFjEr2SQ8RRvuUhnmQXhXEkwLXaQRyrvRwKN62DzIZpEOfPfUY2Af0Zv
         54mbOn7WBg/hbJVxkL1/HZ+Aw8RhFp4YNvKP7jUSfuKu/3DVM8Wt2sz4UEuQ18JwCtJT
         M7+ImaEh5Gk8/IvIybwgHbp7ebDrN/6crnlHLqNcF/r7+mACY/O+7PPZi//CyNVEC63b
         mK6DYvnsRQidGZ5iKWJCTBNDr/w29QE1McAcDgZukfOK7nenkKX+V8Qm6WNAq4/u6xlD
         E3w0q6jyEhUS9N7ly8/Rzeu+/XSKdOcGOkibLEy6gFIYDmerjU3IcId0t2lKWQctN6/y
         n5Aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783961013; x=1784565813; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7RBjI+3c4wbCLyC30m5N44VxvHGqMYoVlsOrdbCo2A=;
        b=rccAPZMexLHOF6ofBbDv3mrlYefcDpgYkAMOOrKW7uUkOt4uNfCGhV2KgjWzHr9GQd
         1EVGWsmE4CVi07q0TBoMD71FjjUQMuLQ9RGQX9R7PHeErRK451SSWSzV1Q8mmbl0QDL5
         U1p4n1ffEzcCeOomj1rpQAX5Qsc/ZL1P11d5oEdVNU6Yx1lNhOjimSfd3FMCgO72liHD
         8nQ0kU2LAnwt6zGf1uTgsdsvbiKxUj02p788Fv+4t7tGqN5E7a47LTcIqyibbR+t6x1Q
         2VaZRakQEj/JAw7AZdRIejbSDXyKzImXf7r9EkJorM+gIuxJGFzV0axa5OWCf46f6HzA
         2heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961013; x=1784565813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7RBjI+3c4wbCLyC30m5N44VxvHGqMYoVlsOrdbCo2A=;
        b=fo0SMa0NTL7EAp0GRdTtRrDnCSJp3rPDVp8vxlbFSRUzV4NR0CAW+mAOjfdkXPXC5b
         UY/+F2I5awG1FKaiIWy09KnXqouIhypL37MlynEGSd+yEt/6Z+s/rUTsCXbdCP8iUK5w
         GWll6moZJJ/kaMEDu2OSg5RCuQLO4ZYbdFd83DptBxXhohN8/po45on4A4LwTmt0rior
         kTC596LEUfXfiETBbEfjY5mX3+jQpNPfp1XFNdoi9Bvl3hZLWP8XHkJv5iX+5uhAnpq/
         D2Nz5SWmsnsFuBGPdY7sslXBGCoR2kGfcpgX8N4+Ln9ofinP1NPRpIBzAhoZoU+KoaAn
         wMFA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9xgFaSBCMlJIjt78PqZU9QUpZdiNPEW+tAArMB9dbBaoQLRzfM9fhHEBi9U5soFYT/VqmtUbvOty8M1hd@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9BanlToJJolEGqZWivGeC24finN3T6xlN8wLTGqK5aq07ib8l
	0XwQ3OHGOjcTqgP4yDiYpmw/4OHDeeCUEAUT931jpfOmm1Ska2mvT2Fy7uh2IF/KyfNWxKSq+db
	4Pq5riziznnfie4wVUGuQgf/iVRadr7SSs0pgo8EP
X-Gm-Gg: AfdE7cldmOOgLEGGfWkRjX9FbhiAGlOaqnhRh8IbSDK11XszgJ74cik5br/Y6KP4eJ4
	7roqVjkj+F8nWN4HHIjsepeGY0AoDDauPxmAYJeLtsFQ6vyXQEsMwuRcYT65h5/xe3y1Yqez0Pe
	+5B7NmUxHUWZd2zy4qZkKcn0WqbzC3AGvdGLt+DRwVMN+wRwVUNs0m2unYCBXUR6tZjfz9OQZMX
	Nnh9momWGysLuRHPxITasA8uR3qrtYWjwBua0c4c7IW11vxYVDhQ7+CiTxTVhImn+Da7IGWnYkC
	w+0TqvyW9c3Ab5ue2QuBgFcE2FED/mN1nA8cmw==
X-Received: by 2002:a17:903:3884:b0:2c7:df7a:859a with SMTP id
 d9443c01a7336-2cee1c0873emr1602925ad.15.1783961012878; Mon, 13 Jul 2026
 09:43:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607091820.qbjlGhKK-lkp@intel.com> <CAJuCfpHjUij9kkD6QiWxYvsYD3iKga9rzJZWnN9vCf3bhp-dXA@mail.gmail.com>
In-Reply-To: <CAJuCfpHjUij9kkD6QiWxYvsYD3iKga9rzJZWnN9vCf3bhp-dXA@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 13 Jul 2026 09:43:18 -0700
X-Gm-Features: AVVi8Cdf0fJO40B3Qj_RdzqPZ1-qc6aBPc0lKEpRA9NJUP0hxR9kO-yh2KYqMwk
Message-ID: <CAL41Mv6UNWWdv3a2g2+tKuy+EX=8FJZSCcEAyHYyuUybYK4NMg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 344/369] mm/alloc_tag.c:356:58: error: implicit
 declaration of function 'compat_ptr'
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I can send a fixup patch for this error if needed. Could someone guide
me on whether I should amend the original patch-set and send a v9
patchset or if there's another way to handle this without sending a v9
patchset?

Thanks,
Abhishek.

On Thu, Jul 9, 2026 at 7:45=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Thu, Jul 9, 2026 at 3:00=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
new
> > head:   59e34180e138a293260301c139cf7ee800978533
> > commit: 27ace96bf8195484c9e9e1a08eb5af5a4e81f9f0 [344/369] alloc_tag: a=
dd ioctl to /proc/allocinfo
> > config: sparc64-randconfig-001-20260709 (https://download.01.org/0day-c=
i/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/config)
> > compiler: sparc64-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260709/202607091820.qbjlGhKK-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607091820.qbjlGhKK-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    mm/alloc_tag.c: In function 'allocinfo_compat_ioctl':
> > >> mm/alloc_tag.c:356:58: error: implicit declaration of function 'comp=
at_ptr' [-Wimplicit-function-declaration]
> >      356 |         return allocinfo_ioctl(file, cmd, (unsigned long)com=
pat_ptr(arg));
> >          |                                                          ^~~=
~~~~~~~
> >
> >
> > vim +/compat_ptr +356 mm/alloc_tag.c
>
> Missing #include <linux/compat.h>
> After adding it the error goes away.
>
> >
> >    351
> >    352  #ifdef CONFIG_COMPAT
> >    353  static long allocinfo_compat_ioctl(struct file *file, unsigned =
int cmd,
> >    354                                     unsigned long arg)
> >    355  {
> >  > 356          return allocinfo_ioctl(file, cmd, (unsigned long)compat=
_ptr(arg));
> >    357  }
> >    358  #endif
> >    359
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
