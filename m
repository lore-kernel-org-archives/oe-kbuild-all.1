Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBFE1E8332
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608317; cv=pass; b=dUYPoJN3uFNXXtEyHFaGiMvQKLbm9xTCOoo/WFvGE4JfVaycxLelSZ8XmfkSSmq5Jzj2DY6Mhxq7VRK0+X7FpvCZLE/CCdmWoHSqNO8WieNWgoVXrG+DSqKVnXyytGun/Bac6wlXYDDKGoT9k2Lo5vzD3uTOcig5eEY6V+EDPEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608317; c=relaxed/simple;
	bh=51QJHitYo0D2EhVGNC7I9TulMG+PQspEKqbVmVaR7k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ1E4upwVTbi1hRt7rPB1R7HwWkOhwmDPxDhm5fL6xzT6cd8MtcLxUi3eE85tU0TDzQWflUKqfIjNPGOl16tXYaM7XxiH/n+ugiIsJWuIwnvs8UZhr61uJNKiY/quMY6AQfSoYF6+sajTIYFBcn9T22nTBdxJtKNdYfOdfIyR3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QEnmavQh; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QEnmavQh"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so11607a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jul 2026 07:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783608314; cv=none;
        d=google.com; s=arc-20260327;
        b=JsfgVHZcEVrno+2c+kr4myZKNNP+cHgJY016Otwi6PJE0VjSLnfqfwE+2qOhyf19j8
         9u6kSGX1YCldfBS+poIw/rpacNPWgCol2VqxibZXZt3Gd1xQL05UQpCXAE9Y5zg4OX+T
         IbsOYxfm7OBSD5h2aIZtoZ2+DhS6TLkzucCB+YDb4zTVCwLGEkqZaEwnIRwNGEyqJEYL
         DkqsXpQMsZvx78fo9awF7aHbE9xgJ5R0YB2b1BGCxnUtejwOLxy/2uPM/QS8pJC8fGpf
         DfRT7UfgEoPNaleBk0ys0XvZxr8HTCr8m1QpOgy/Xi6AhX1Ql8x0xcjg0nFCUddrnF/1
         amWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zd5VoNhWPJ5FEzML0KqVlaL2mS6uuL6nYiz9sQZLNME=;
        fh=dhj89vI5lQoEYYv9QS96/qdAJul0yFAEPBtrPDv4J9Y=;
        b=HHcNpJf/USWNsimeqvMKCFNSGDinHCCSeRRtAaJV8U1kWAsQ42kPnfRUG4zuDjSJYs
         2511hmLb6AyLQ/dBO8+yIMkLv+6vslIwZLDezgZdvv8+2jchb0cvMBPQHQU3e24Xny63
         c9FmHT6uhAUbzNZiFczMlrpgsl9ph7mdAAvZZ/2/dQAONLSOsGnyb9WOhNK8Y4yhsnRi
         aLF42/xmXzJZ7f5ZkiTpurNXnfwUSBW0gsgZYDj3nty2KPbLFbIj0lLSbVDWSiPWWpI7
         CsAB5AVtf6BTmmWrmX1NZwDX6Iw258ydemEI9eAee23L44+4eTjiaBlj4B3zUgliijXn
         tGOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783608314; x=1784213114; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zd5VoNhWPJ5FEzML0KqVlaL2mS6uuL6nYiz9sQZLNME=;
        b=QEnmavQhV4FO5cGWyXO0+y03haXPm9OM0Ta+isgF2QcjOVqLPO7bxjgCGMe6H2aTQ0
         x4GWckZhfwSFKVTbPEz3JCGuePrDCrwmHIvo0UmVoE7/OfhMUWsThnTDacilHrOwi8nL
         77jq30gBpGQxuDOSSVMMVi6aOi4mnl+dnCOa4awHBeMV1BLJhnuB5xjKPpP9GTvCJsKR
         80UwJBItlGm2yYSnKp+u6rYKbAtA7O7kw91cCHt9kJhivsdVemaS0+DQLbvUk9vDCEmY
         b13KIlY8zu7dVnmlYEkCRcn+ZlRGM+ZlcZoyl06x03GpKdhHgSloBOt8cNrXLmN1eN2+
         Aneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608314; x=1784213114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zd5VoNhWPJ5FEzML0KqVlaL2mS6uuL6nYiz9sQZLNME=;
        b=ZucwXdqzZeiviP6GIeghcau0jB/pgo5fCb5xxjJgyjLSYlPJvqOSzstSczEBYP6J9A
         Z57ugEr6w+kPzGt+sG+tJD4adLXASz1ZhUJ8SEepM5wu3j9aUiSwy24mwhS3XLCU60fm
         pLNL1M2YLX/CEcJPwNTjpiDrI4zbjt0YB5NFm7Jd5kMbsXUJW0u+7hGuVEMRJRnW5V/R
         jXezHzDShR/VDwQVjP8T2s/Z26sXBuk5mBE2JUz55AFX4oiqF9TjVNXdZ4lAp6ipm7ow
         R5mgVu3rEZVTXL9Ft5mI5zx4IgWmnFzTUhCQg2x4LBhDPafu/xmGv1k+l4F5beXqxXaI
         tWVg==
X-Gm-Message-State: AOJu0YwDJmnWLYUnBePGyuYe+JKd8R0GKgz/xAdbD+EMiDZS2NZ4uE/j
	CLntARmbb45rZkWL4EwGc24aXMzRO1m6U9EYuXCQUQTEddTCS4GasNT02mLe9c56bqQ4FaClMqg
	JpNtQ2NeSFs7keqN2AsDYhd96P9slsA8z3bjJPNC8
X-Gm-Gg: AfdE7cnTavoK5a5nwG6ofdMBMqvghjYewtuay/orr220d6DtQlvM+ap/sYbosRP2ePE
	g9cCh4HfumytDCrcckevd6ItQI740RQlPZ5CcSpCKpz9/lLgj3frzacuwxWwwwm/FgcSWduHCZT
	EPHgAegQSlVVD5QSMNg5OTeRPYPyjyPaH5IDlUePWbLkZPcGit5WPbtSXmqni9AvidDcAKubtHW
	s8P6SUw6qwXmwLhHAMxwk29vv1nH0jX9TeD/PXJgr9Eup8+8JTrazKib9ORNVg0ygbfTfDAG27a
	9gHsQxM8eOpxJcfO1g/Ge3nGOlY=
X-Received: by 2002:aa7:d50f:0:b0:69a:fb2d:e84b with SMTP id
 4fb4d7f45d1cf-69c0702dbf7mr41178a12.9.1783608313884; Thu, 09 Jul 2026
 07:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607091820.qbjlGhKK-lkp@intel.com>
In-Reply-To: <202607091820.qbjlGhKK-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 9 Jul 2026 07:44:59 -0700
X-Gm-Features: AUfX_mxdaahI1V6-jyyKE3lUbvW_nBZksjAKzczctwG_EjEihAxbOStFVHjycmM
Message-ID: <CAJuCfpHjUij9kkD6QiWxYvsYD3iKga9rzJZWnN9vCf3bhp-dXA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 344/369] mm/alloc_tag.c:356:58: error: implicit
 declaration of function 'compat_ptr'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org, 
	Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 3:00=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ne=
w
> head:   59e34180e138a293260301c139cf7ee800978533
> commit: 27ace96bf8195484c9e9e1a08eb5af5a4e81f9f0 [344/369] alloc_tag: add=
 ioctl to /proc/allocinfo
> config: sparc64-randconfig-001-20260709 (https://download.01.org/0day-ci/=
archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260709/202607091820.qbjlGhKK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607091820.qbjlGhKK-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/alloc_tag.c: In function 'allocinfo_compat_ioctl':
> >> mm/alloc_tag.c:356:58: error: implicit declaration of function 'compat=
_ptr' [-Wimplicit-function-declaration]
>      356 |         return allocinfo_ioctl(file, cmd, (unsigned long)compa=
t_ptr(arg));
>          |                                                          ^~~~~=
~~~~~
>
>
> vim +/compat_ptr +356 mm/alloc_tag.c

Missing #include <linux/compat.h>
After adding it the error goes away.

>
>    351
>    352  #ifdef CONFIG_COMPAT
>    353  static long allocinfo_compat_ioctl(struct file *file, unsigned in=
t cmd,
>    354                                     unsigned long arg)
>    355  {
>  > 356          return allocinfo_ioctl(file, cmd, (unsigned long)compat_p=
tr(arg));
>    357  }
>    358  #endif
>    359
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
