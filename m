Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB9715F330
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738329971; cv=none; b=e1SOLk3wR/+hdm83tQi/BVnGAL0p9x2ULtWBKqs5h3ZO92a+gsdjf0gs2jNP43GkFeXAYegDXcRA1CMhcSLValqgACVdbxzDiCDr0nyXSHFlMcOUDJAfTTy+wFVfKTAecVyFVKqNiASTzcnHHn7RbuA8O8+9OMP1GJ+0d8BQOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738329971; c=relaxed/simple;
	bh=AeYMe9tw82DdRL0WQ5f5iY/17y+yilEk0XFVTGbT1N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j/ZZP/2SGsLIiipLHQeUgABytvFx17uYbx5GbzxB0szORqyEOVerQpw30YONtuiRAIrGh8l4fhUmvS3+EMIi2yKPAtU0Jzfu9sM7eqPs5vS5RkevVW1xVAZPxp0FruY4UawUnyECZOaKCMNQ1Wn7FqY3lUbSQ/TSY3zVLMcFALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njn5SqJq; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njn5SqJq"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so15357601fa.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 05:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738329967; x=1738934767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCJ/JEUblGM8xXeJ9eraP5+q+PP0rIj2Q1ZN6CtIb3k=;
        b=njn5SqJqgB5CL86numjkmbPiFwAw9e+x9k7rpeV3x4IIKxtjxm9r9N1uHzN0zoO/iT
         mwIWyjgtDOSKjDQUtamvFYVHBdgrySFTXfFCNo48UnIKSmbi+YDrRHSIFVwIUTwqEnsk
         sResoNP2QP5lpVlmc46+MdiQgHDl2cXwAXBrTqve274+XxvclL/aFaYfghKn5a07cQ+Y
         ZP6BL3NWOqiK4iAR3L0JKRXyMQHrht/d+sfzMtgExuyLs/5YgFt8H1JE788kAsRE280S
         5Vyw7QUN5dAlQzyzTMTvOJ2f7rAuXpgOVqSIA4afX904BpemN+XKPNYWTT5jthDdTzQO
         wo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738329967; x=1738934767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCJ/JEUblGM8xXeJ9eraP5+q+PP0rIj2Q1ZN6CtIb3k=;
        b=tl3CWDrpB3aKFFA/ewo9N5UmgsL5aeHF6DjoTY0Fl5pPPbrdY11W0u/0QFVQU13XcF
         hivl41Kpc5vSGpi1HFtTXWN19DhGNtTbKTlb4C8Zxv75aRZxEnFJzj09KYZqUkj+6ZCW
         82WuEOjWjh4eOzMNZt8yHH7RkM1TwP3oJfPi69lD7h7LYkFqLUlGOUFNLOQymch+AZYa
         g+yW/xJJd6l+3QZIHxYkYag3qPAeIJEmiBYAUE/vUhQbkLBg/Sq/alXaoW81rGzaEz6e
         yxWhtioZV1XSaUfLEl4GZ4LX7bTlMZaCMDmY1weO8nEY7omdZxz8FGq2SfTjYxOyoEXS
         RzFA==
X-Gm-Message-State: AOJu0YwhTtNGkshLBvmiDzplDMDJzPvIcTn5tmIZ5CuSy5lyPv5YA4Hi
	zXJfsa6ZawE606kCfZT2NECqVIumgimk2jdir2jKyvmGPmBb1Cnn9cDTU9oO2MAJFbUDNNF8GKE
	sBLmQqcrrDqG3mkcq8oG1QziI12Zn/a6hhG0=
X-Gm-Gg: ASbGncvRmHElhWeWfQpCot6hySqNlusWZgrnauTZyUdcXWUx+TD9rHJNZ1RT1ODkuJ9
	VaviauQYMgOiP10AmwBGeSfpQebRSTM4rVsI69W7rbcdGHEy1HQPYyG9gAyuzqxf8Te8gVHvR
X-Google-Smtp-Source: AGHT+IGe/6VEtzNpbOfm1faZyMh4OUwNA9EhOY/44Wb4qaftPUGHBxEimHysdmWFZO5ZqRjsJPBYpsxN94kZieZU3DY=
X-Received: by 2002:a05:651c:896:b0:302:2bd8:2653 with SMTP id
 38308e7fff4ca-3079681f8f0mr42044661fa.6.1738329967080; Fri, 31 Jan 2025
 05:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501312051.0vJPrrIL-lkp@intel.com>
In-Reply-To: <202501312051.0vJPrrIL-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 31 Jan 2025 14:25:54 +0100
X-Gm-Features: AWEUYZkkQmDhxcYqheY-MERj7thpTxRKLNdsnydSIcwTmG8NMYUkuVc1vAyFBM0
Message-ID: <CAFULd4Y7r-ELNr-XBP2u6Ka1JCgYGYn_yOu25h9ehBNbzuG3TQ@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 52/52] bch.c:undefined reference to `__paritydi2'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 2:02=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> head:   1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e
> commit: 1b9f78ccbffefb107cd92e20cfccd03ff2fa9d0e [52/52] lib/bch.c: use _=
_builtin_parity() when available
> config: loongarch-randconfig-001-20250131 (https://download.01.org/0day-c=
i/archive/20250131/202501312051.0vJPrrIL-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250131/202501312051.0vJPrrIL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501312051.0vJPrrIL-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    loongarch64-linux-ld: lib/bch.o: in function `solve_linear_system.cons=
tprop.0.isra.0':
> >> bch.c:(.text+0xd18): undefined reference to `__paritydi2'

Hm, my config cross-compiles to:

       bstrpick.d      $r4,$r4,31,0
       vrepli.d        $vr0,0
       vinsgr2vr.d     $vr0,$r4,0
       vpcnt.d $vr0,$vr0
       vpickve2gr.du   $r4,$vr0,0
       andi    $r4,$r4,1
       jr      $r1

It looks that __has_builtin() does not mean that there will be no call
to a library function?!

Uros.
