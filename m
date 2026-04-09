Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AF3793BE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729617; cv=pass; b=ILJ0DFAUnDD1y2D+UgNTowaqzfLF7gZKT67CPAI3AuUC41KOMSxNikwykO/kQE+kOXmxen4ro9ilVxHsoZb4fW4PkfGYG3SM0q9lovBeuILvr82p9dmcgCaTo8tAXqEqsGTRhefprjP+ueFMgKeOnQPZK0VyAYbmd38i9JMGrIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729617; c=relaxed/simple;
	bh=Olrmn49k2z6vSAhxDNEehWUjD1DzUXaz5KUZ0YmKalM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5dyNkg9Xg91d1NQ1zXcRsZ3ceHJveWDc8jMVjKaoufbOyioh++ROqn9r9dV2tFr2L7VcNwYZRDNCW7A1GgdCw3pcDqy2Bfl/0yxKk7sNdVZ3nt/geLh1PHZLDH7/dbaxTNwYCtgqbb3nGEuRmN34aehH2YefBn606JQG1SfEJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H107SSuh; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H107SSuh"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66f8f556f39so999464a12.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Apr 2026 03:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775729614; cv=none;
        d=google.com; s=arc-20240605;
        b=LAZjzq8tRjw9+1vrUULruMl5FqtqIlqe7Nor+tXxXVXP31AQMQQJFSbn6K53xOBJ92
         jgZVhCTUck4WaNmqwOM+YiuR08vdw6Yqil4Zq8jLnoH3PJ9i49WBe5gSFzjDBL2BzXXI
         eYBpqr48MuNO6+vqusbVWAZpEOUMcXG+2dDTGeyFXY4+W7+DqHFkI3sQaAz10VFQOBiC
         KH0HeC48Cux6IuahIGuKaZq5A4ZMtWaDqqYItW3I2DWxZ1PVdarUfQ+HAS6BIvKhUL3g
         JpiwNComq+kmFlUG+CjMl4GNRMVDHVzqv0vyVZkXAMHfcEWShmPJD6nW3ys3toDR5JZQ
         f+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5G1tgPSgfqXAdaiT/Kh+YtWkW5LgqZYK/6TgiRqZBJM=;
        fh=X1HPDNJYM9WeTSgpRWLkGBimPcKxhVX4ZjcTCwadKwg=;
        b=gyIkuE+pnv9k90zvey2q9IeSjTaJFMjiBUFvPqPO0y6AtsXS6i5S+MDmAhMnMhtc6H
         R6+I8WigJ8HrW8D6Glpb4f4XQiREUnDYPiqTi17wdHfGIBS9emt+oUF+k9O2JBDliaRH
         aBEZZ6slCg3jvFSyhdEYVBMmHFNo7bd7N0BLSoB3mRepBZ/N0L0L7bmEgqApqZ07W0Jp
         dSROamUuq8g6uzqTl1iAPclJtTtVf0r50Rmov35OkXMH77KCSIqy/Km2Hsw50Yiuyizt
         c3Gt8zYvN/KrBWcXX9jsdW+QIa496kPCxbktJOX07NkUgUyLVngBdVWjBUlCxEUZEWoE
         Lw9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775729614; x=1776334414; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5G1tgPSgfqXAdaiT/Kh+YtWkW5LgqZYK/6TgiRqZBJM=;
        b=H107SSuhgW0AiTwnRpstcmctDNmXnREkY0Wkljgk0qAgFaBty485ZXOSgSN7W5a2eq
         VTN9ShbLi/5g4qhwlXC6Vp7moUEJQSPx25jsqehM7IzC/FJvgk90KA06LztyBUDfs4fx
         0mGgh29Vvw/MeZa7ZGC9ib0hDsOnQLr82b+mj2Gco2FLCq32WVV1sa2tpqNaGYQeZssr
         FPOqatqCUfaObvWGfUvJeGeTdqO5hNTi/pWdXDbT9Uy9f9FcWEIoG9kMI45mPO8RzgPR
         B51JipuqqenUkxrgiF2OgHbZmxW0mUHYDRrTJRUr0qFavb0DiGPXyWdFDGCA9JTIPjAZ
         +Ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775729614; x=1776334414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G1tgPSgfqXAdaiT/Kh+YtWkW5LgqZYK/6TgiRqZBJM=;
        b=C6Mu3k2orlJgZV8smff1tf455kCD64W/6dfgQz2+iq/K4fZpJxIq9miH6e+2wC9t9d
         THPmD5HOc0+BNGWMNWog+DBy+RAS5m8pkZL5yRtC/5PjNYzBm+HGeJ3Yvv5JgjYPi2wR
         s2q6YdAbu0oJbx0YswDdc1dhxwSzXk//WXgEDxCe0W8IX5FvNYuG/Wo9idFTY8xa5wCz
         ryhCLkUmpxqJdv66FF+O+52mTxvc1rX327AJoxpScRb+EaL9H+NjZJ/NpNC0yRI8HDYq
         79y4dDEKOEd/WhSFRd6HTzV+fU8lbLGY5Gs6DBcaOINtPZIMCE+hycD5AtC0HCve5DB0
         YM8w==
X-Gm-Message-State: AOJu0Yyo4dTGc625J2tQLlUpDRA7egPbw98qPWE4bEaacsurJ3HYxpJC
	EAAniuoIOPaQQhlmRCNzw+Ef43tRW5m2FDlWefua0CBixZwEjxIWf2h6VP7pmc4EAA7E21QjIRT
	BGYp/4a21K6PSD2O4LfOf9/PAbA34gSA=
X-Gm-Gg: AeBDietxSD54jJR/YzN4/3X5AGtqnqnsb5y/5JHqWai66XHKcygrFjy57UpsFPNkSN6
	DHVpn5HhKfVVEiFr12gJTiJ2ofMVSUwrHubAzOaOgmdmAqQXFxyWsOjq34nNBWuP8PeMoAKIyCH
	S5YqAEoC1xKQInjNVinIFzsNo1mId3qCcHCfWyTwDvIBk3dk3JCuAw9jjyxNtod4OLNyKVJxyfo
	DTULCXRLYyr2kJGYALTZjJfyr7ScP0JgKR/PLH2qPBrNUMgq91s3bEFx3oUKk3d8faGD9jFCgwQ
	FM511n0bpTbkg8n+Tg==
X-Received: by 2002:a17:907:9605:b0:b9d:3966:bc23 with SMTP id
 a640c23a62f3a-b9d4768d513mr142385766b.26.1775729613743; Thu, 09 Apr 2026
 03:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604090741.1kUVXMoc-lkp@intel.com>
In-Reply-To: <202604090741.1kUVXMoc-lkp@intel.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Thu, 9 Apr 2026 12:12:57 +0200
X-Gm-Features: AQROBzAZyly3rkZi_uaCRUbRSjWTfZY1vAkt2NvdbZUe0X0EKu3VrrmPc-isLc0
Message-ID: <CAFnufp29D4VdTgoJ4uDk-dQ4-RuO_C6=TQ7O9TA5M=JSe1j+cw@mail.gmail.com>
Subject: Re: [linux-next:master 8662/12838] htmldocs: MAINTAINERS:40: WARNING:
 Inline strong start-string without end-string. [docutils]
To: kernel test robot <lkp@intel.com>, Joe Perches <joe@perches.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 9 apr 2026 alle ore 07:24 kernel test robot
<lkp@intel.com> ha scritto:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   db7efce4ae23ad5e42f5f55428f529ff62b86fab
> commit: 420849332f9f9f1ce6ff142868ae2e6ae9f98f65 [8662/12838] get_maintainer: add ** glob pattern support
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260409/202604090741.1kUVXMoc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604090741.1kUVXMoc-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Checksumming on output with GSO
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
> >> MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>    Documentation/userspace-api/landlock:480: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
>
>

The problem is that "**" is seen as start of a bold text in RST.
Escaping the first * fixes error and keeps the glob unaffected:

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -35,7 +35,7 @@ Descriptions of section entries and preferred order
     F: drivers/net/ all files in and below drivers/net
     F: drivers/net/* all files in drivers/net, but not below
     F: */net/* all files in "any top level directory"/net
-    F: fs/**/*foo*.c all *foo*.c files in any subdirectory of fs
+    F: fs/\**/*foo*.c all *foo*.c files in any subdirectory of fs
     One pattern per line.  Multiple F: lines acceptable.
  X: *Excluded* files and directories that are NOT maintained, same
     rules as F:. Files exclusions are tested before file matches.

should I create a fix patch or we can still amend the previous in net-next?

Regards,
-- 
Matteo Croce

perl -e 'for($t=0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
