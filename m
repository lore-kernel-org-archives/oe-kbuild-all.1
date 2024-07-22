Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C071607A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721634532; cv=none; b=AaxcC/57cAKyRmTww9UgTsG0dxGuB9sq3j7ptq4R9vXozOih7eS5ZYYbz3octpa5WEAlOqf+FfgzGTfgN3NAYqdV7g6W8uxqs/KAWBSPA8O1jSKt2kC8vZr9Zd2nePwocuJIPTJBve9erzdo6QQxwrOzLgP6VAOG+5h+Q/tl3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721634532; c=relaxed/simple;
	bh=Fi9l7cvMS1N/rrW+7ejHVp2TyKDXOtDjp1hUa5Rl28g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sU1B3PACKjqTQ4N6eZNTAcETA3qIQ2Yei4D98ZBjnOQM3DJtcqLtLiqGIUNnRs9ju+jME6A/ENFtCPWAizQIf9PixoPIDY4VGsJC1/EWU7dVBwwwPwS8kNs+4aZbDIFAESSbqfH+kYHnDOi3Rjy2q9ktjL6T+qHh6uBFon1QZfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-65f9708c50dso39318367b3.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 00:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721634528; x=1722239328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0sQ5XRZBfD55xDMn0aVgeSX6fwhqOHYRYZxYiFb1nU=;
        b=I+2U7gszjXyLsDmlPifXf7KISWP25gyKm7HkY734A9eLOrG6njdDg4wg1nMxxTcJTs
         MuokjfFevLa7DM9AVykryDlDSxKzHrBZ+wafFSoaZ2QE6Ag/LwtRZuf1zMxQa/iARGIo
         xp2JmjdJt/yrY7JyjT1pxZ0/BtLowqnVTnv97rPZN6i2AKMwou/RjYv9oHKUpVJDfiEs
         qpdYOum3ggNeLc00RZynVXfQkCjYO+L8f/n0Rx0WlDp0mBr97mrU5AOwzxIlzNWzU+B2
         Ce3AOTZamEibXM7MChvGXFSeimcteaNhAHOphENCDfBHHNQtZJHq2cxd3jPlM5QCKz29
         hVzA==
X-Forwarded-Encrypted: i=1; AJvYcCVyvEz8hMbUSLNXbi78KA3qI+2I94z5OA44K3MgD46ExtB1k4NrmeJwBapcw6jY0IWWc0ya4NgQwzZuPbO2UsaPysYz3kRyyqPZrQGW6A==
X-Gm-Message-State: AOJu0YzB+Ht/piiJdLs+w9kHGLyralsy53dR6RX90unnhF0XDCOGZ+mr
	p1zqZ3P6QqrhstSvxajguSF33aFnzAbyx5gtq0BZ/ENQVzP6W9EeWPmDhuTb
X-Google-Smtp-Source: AGHT+IGOSF/GaJFdqS6AqmoH/7kAK2uAF6WlziQ0uc+eS5logm1Pho8kjLbTL663nJ8r0R+OLLoEEg==
X-Received: by 2002:a05:690c:f08:b0:61a:e947:5518 with SMTP id 00721157ae682-66ad8dc3bedmr78669937b3.27.1721634528560;
        Mon, 22 Jul 2024 00:48:48 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-669540c3957sm15626687b3.123.2024.07.22.00.48.47
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 00:48:47 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-664ccd158b0so39334767b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 00:48:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWW3Zga3OrxOQuGn5I8Uus7uDe/quk40j7GALw2vpE+uq6tzQ0OFDuSi2933Qr4GKQHsbt//VMUM6WZ/Ap4ZUXSfUTqVEVUP5GnM7Vaaw==
X-Received: by 2002:a05:690c:3146:b0:643:9333:9836 with SMTP id
 00721157ae682-66ad9fed5d0mr57401517b3.38.1721634527076; Mon, 22 Jul 2024
 00:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407200330.Mgxnq2Dq-lkp@intel.com> <420e09ad-f43f-4734-bc06-fee7a54f2eda@suse.cz>
In-Reply-To: <420e09ad-f43f-4734-bc06-fee7a54f2eda@suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jul 2024 09:48:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMSpv1BbvCqf0Abfxf0sGp+5it-m1GtFR2nGuQ5-ZCAg@mail.gmail.com>
Message-ID: <CAMuHMdWMSpv1BbvCqf0Abfxf0sGp+5it-m1GtFR2nGuQ5-ZCAg@mail.gmail.com>
Subject: Re: include/linux/slab.h:663:78: error: subscripted value is neither
 array nor pointer nor vector
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Mon, Jul 22, 2024 at 9:15=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
> On 7/19/24 10:02 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   4305ca0087dd99c3c3e0e2ac8a228b7e53a21c78
> > commit: 72e0fe2241ce113cbba339ca8c2450b167774530 mm/slab: Introduce kme=
m_buckets typedef
> > date:   2 weeks ago
> > config: m68k-alldefconfig (https://download.01.org/0day-ci/archive/2024=
0720/202407200330.Mgxnq2Dq-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240720/202407200330.Mgxnq2Dq-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407200330.Mgxnq2Dq-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
>
> Hm the new error ettributed to slab seems just a consequence of the broke=
n
> PAGE_SHIFT? Although it's not listed here in the errors for some reason, =
I
> assume without PAGE_SHIFT we don't have KMALLOC_SHIFT_HIGH thus we don't
> have kmem_buckets typedef and thus kmalloc_caches is who knows what and t=
hus
> doesn't look like an array? And the broken PAGE_SHIFT has to be cause by
> something else.
>
> >    arch/m68k/include/asm/page.h:10:25: error: 'CONFIG_PAGE_SHIFT' undec=
lared here (not in a function); did you mean 'CONFIG_LOG_BUF_SHIFT'?
> >       10 | #define PAGE_SHIFT      CONFIG_PAGE_SHIFT
> >          |                         ^~~~~~~~~~~~~~~~~

It's a known issue since commit 5394f1e9b687bcf2 ("arch: define
CONFIG_PAGE_SIZE_*KB on all architectures"): m68k-alldefconfig does
not select any CPU types, hence no MMU type, and as a consequence no
page size is selected.

Arnd and I couldn't come up with a good solution to enforce a valid config,
so this is still broken...

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
