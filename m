Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6525634
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227810; cv=none; b=ZjsKilEwpqU/NIR7a3550e19YK3wcAy2GAWECDt5cEYus789kT+pd5E8ZffFEeBTkJn+D18hr0BOu+LINP+DbwiPRs4fcJhrUYZEoChYP6fnksLUrwa+Uoc5DL498l267m6ojKsPs3NJ1STB3+s57BPqSJnzstXdnk6z/H9SDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227810; c=relaxed/simple;
	bh=Q4wcKs1NrEEn3+9O8a9Lk2hLaDkPh5JBoglNq961VPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WqfGxnMyhIWb73cqK0WsttDrvqCPUctaQkAIlQ8Ek+KpXw5G7s39/nkqZR1wbnJwnh9kPjpytttgBsq4RQ9Knd9nMyLnkSXIKEYw9Oq8/tqalnmrh9BbkeDR5x4Ijo+bTlJv2m1jMlDG6g2FNfnuRXHcLKJkcLkf6ae/0AGw9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afdf300d07so374041137.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 01:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227807; x=1738832607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6pCLkUySXuvE2ot+OueCX8LTwAM+45fREeEKYQp2mA=;
        b=et3NqGZT55xOzFKrHZy/8m6Ym2pDjRCImkCgfaOxRh1YprK7b4+ZTWksxKTDbPAJ7k
         QpgwCsGYc4CFwjHxUNgVJVh+ngMzxXDEEn/cxDnOyfM8/fhWGnfOmTKlwMPQNdTPVEbw
         NLUZEK2RzrFGedF5RUaFZTP4V/12ROFDLXYrBXhX/tIwmvetiRXQzjzli2UbwQK3vmhs
         gk7OxVJemn4YoI9xmOhx23xZE34QHMoCpHtAgwP0gA1Mfs4S8eiYizIpxKUF3aB51fSk
         EAd0M1lgu9yaBe0HNtXnqVyJtCUbKZtUOATbERS1m6X65TK7gk7ZaxQ1b5EUgRHvSTPG
         ttnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVress4W61efS9pPFxzrkoz0HB7I8CzYjBnBAHgcMtPCHRlAkUbCpBN+5y5365BFQD9DTdyR+ZNFhqjcPL1@lists.linux.dev
X-Gm-Message-State: AOJu0YzQO54Sx037Gp+WUzxbUG6mI4GhVW7KWcp60CBPiGCrmb/xTunE
	RBQgi73VNPX2BcYYu5EYJzjVzcDd0s1XI24WbZIvIVyiXK3Pk9Qt+nBccMYD
X-Gm-Gg: ASbGncvNiNe9joeiT4vQ20zN9EJ3vwEt9/jfclIGzBKLGgOsOyuN9yp5Pf98iUtrzlv
	P9o7djbRVuxir+MFJfSXttFblcKAa/XtvpNZSKkzlmqWzRPRThy/TH54VJZ6m6aLjnUkjUVEjgl
	5XBXIiomT9CqUDi0Ux8BF3dNgmlCj7k2kD5ysanaWxrFYo8Y0AxROWGGiTRVsKwB6r6THVTen+V
	KJdG1JZ2wtIpUS3ZB6FKLBAbxf5Ha8ZURR8DI7EOS22zWbbyrrLi6XKIEXZlBb7G0iFmTmDI0Rn
	I3GWJ/5cypg6eJX/Tf4ovzJ7igAY4/R70ARE7NToE9jSmYa8pPUIHw==
X-Google-Smtp-Source: AGHT+IGhxA6gaq3re46YYAB2cKwTaQTfIUn9Ez2YgszANd/9PULI745dlGDlYRB8BAYbj4JWyss/Qw==
X-Received: by 2002:a05:6102:1495:b0:4b2:5d16:2902 with SMTP id ada2fe7eead31-4b9a4f24005mr6166316137.6.1738227806923;
        Thu, 30 Jan 2025 01:03:26 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa9aefcsm170497137.12.2025.01.30.01.03.26
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:03:26 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so390978137.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 01:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2OvdIl4lftOJ43ZBcvrd3MBvkQF4KVH+HFTnYuMSLKKIzAVFgDQbiPT4I9sg07L82hGyEzvHu90kOF4HG@lists.linux.dev
X-Received: by 2002:a05:6102:2ac9:b0:4b1:1a24:e19c with SMTP id
 ada2fe7eead31-4b9a4f25ee5mr5781363137.7.1738227806317; Thu, 30 Jan 2025
 01:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501300600.APok2iDU-lkp@intel.com>
In-Reply-To: <202501300600.APok2iDU-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 10:03:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfZbH3bPjpDKm5-PMg-MSh2sDzoeYCzr6kkyvkD8cJFA@mail.gmail.com>
X-Gm-Features: AWEUYZmW56A7_7HJFKbvmHUgFJBvv92mFWPQ4viezAJWlG2D0Li4N3XPNOsB8GA
Message-ID: <CAMuHMdXfZbH3bPjpDKm5-PMg-MSh2sDzoeYCzr6kkyvkD8cJFA@mail.gmail.com>
Subject: Re: [geert-renesas-devel:renesas-drivers-for-v6.15 4/6]
 drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of
 function 'FIELD_GET'
To: kernel test robot <lkp@intel.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, oe-kbuild-all@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Wed, 29 Jan 2025 at 23:07, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v6.15
> head:   106b182b2d7f05703d27e37cbcf23a6fb652872f
> commit: 1e5827262bc7f29b3735889919009b744ea8f55d [4/6] soc: renesas: rz-sysc: Add support for RZ/G3E family
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501300600.APok2iDU-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300600.APok2iDU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501300600.APok2iDU-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/soc/renesas/r9a09g047-sys.c: In function 'rzg3e_sys_print_id':
> >> drivers/soc/renesas/r9a09g047-sys.c:51:13: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
>       51 |         if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
>          |             ^~~~~~~~~

Thank you, adding "#include <linux/bitfield.h>" to both
drivers/soc/renesas/r9a09g0[45]7-sys.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
