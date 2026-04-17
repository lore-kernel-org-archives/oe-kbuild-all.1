Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7EF373C10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417109; cv=pass; b=rR4dRG7pAxVld/zNqSId2t4p14Wb4R6Gt7mzhZuDejOjIjAwyH9ZVMi2O2kweRvv7m+/vQwcJdEI3pXyVaJMl688OAj33imHaWEWJzRXiuXtaXJgpzcwNIg9K5bu2kvSyiI4m5BXkDhT5fa8/RbMccVBD3fKihrALZTEzQL9N78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417109; c=relaxed/simple;
	bh=hZqD33S6TaBeP1U8RwrHN4MgbX19/ibIMOcdz9Suo8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTWIezovP94FQgVv7IfCk4XyDWue3cROIb4M0IfGgLhC8gLLPIbNxrUQX1k9kPUmW0dXuAh3uFDWnKQmL4qprYg88zIGv44uZZYCetb8t4vpppPpwZT4tzN/B7tPEgy7kIAztBFGMHCxUe24INnM9/JDwKiCiLtBcoQ4DDsKbGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0p7Tq9m; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0p7Tq9m"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64e87a81639so456110d50.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 02:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776417107; cv=none;
        d=google.com; s=arc-20240605;
        b=WZhcY1p2ryfSAp+nswOz5a7mtGNhKUq7Z3WUN7gpZUcLUnRTfpwjlNCRNsfalyqEPa
         C7HvzUsHLh9/AdQUYQt0ROxD9aNCtLBY2DemmtiY6X/Xj7FkDaSsnfjWcO81t7iR16yN
         /aaBRbDfn/EZWSQYupvwOug8/OYonlTl8O/Xx6p+/lk/5LJhD//ADwXYg3uC+uNgHm2U
         q3Xw6eO3vcNkZLPU9QLUfehsfqc0Q9d3VFL8zKdoY/txfTIB6LIgqUN+QSlWxl6/o5xA
         puBP2K+jRE8vBl6MHaWn33Wi5D40qOWBATUAmXeKKZiLILPOJe8ThXmVtyTTFUSSBgEg
         FTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        fh=0HA3JsHftreyRfNvH3TX3gbqSTrkvrbvaSJhjXuwogI=;
        b=jDtAEwx/tUZ2iezY3FHGdoZr7gzJiqTf6XrdDVvyz6LEpd/ZJ4xo2F3RF4h8E1PjYb
         oYku0zoEnmR7kNbvxRdEIaV7ywERZrZDBB4iwbUp5h+QhGt3XdVOAymQorMrG/yDAsUl
         EmbGil0Im9Y9G1YhwuvN9ScaZJkrWE5ROBpJ44dEN9NhUE0mDpeXHBtiugk1zMt691+p
         Liba6hPCqbw7SToKkiFrf1EEiInebXyp1ZrbeqwVf0ATErxQh6DrxSv4h2CDa5lUk11Z
         NiLWOkgLSY05ccFZm+DdDJYmSgd/wIg9CerkgeTf2k2Q4zyKCDoU7BhIJIFocVW9066o
         Entg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776417107; x=1777021907; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        b=Q0p7Tq9mcKbWehC7s+FDYhZMZMNDgpkJUxm5V5Piq8V8c5Ft4gX+9yVEUbSOLkd4rD
         LzVQ5sQn75MXCDV202YItEgRWMsxMwiY+7FJpctz3E6LXlk1l8ZAz9NGe0+KYW0/VMAe
         eqTkq15DNNGTwGTtEoBn4YhoLNh2l8ySwQjOJtnzqEgHzWT5TZpAyCr18qMcLGwrUK4w
         Ui/rUTdbHyJV64go0bvjXXVaoHneH/AN64bHH9xInE+okIlZpkTI8gEXOtIVA4/tctIW
         qR4gWexs9DZ6h5fbh8nJKyr1p2FYDkLP0aVGJOHT5hpAJC596i0UQB6i1H2AN3cztpAV
         Sofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776417107; x=1777021907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZNEHLjnCSi0dTY0sR3/yoFnjW7rryZybDVgQX7Z80k=;
        b=K8aZ9UQE2UXz5zmFNAXcIzWM107pmPmYTQdn2C7IJHZ7+0bEwPBJunGN8r9V0k3efl
         icOKbk8AAAFCA+7OCE9vUNbpyxvM5JxBzUlxJYCCb+S0wFXf+rUdxM/tz/bo7IDZJxg9
         OS4jSETiMygePbsftWSqmzI3ypGnk9/hgryuDpWXKG9GscP+4nn2IRL4TO1CusY9q6xB
         g1wHdo/ez/qsXq5nJjQXZtBfYK41mQ/Md5e4gCUT2xm7k3Tc5aebvC57GL8R8awv+TIH
         VgFfCNwHrW7AYT+wFsM0aFmkQHqoydUFrSgsno/h5xO11v84GxZeyWA5afZuM7PNYS/l
         Ss4g==
X-Forwarded-Encrypted: i=1; AFNElJ9+ht/qnNr17zlGO48l4QnLNQa/iCFTAr3f6OTtlHqXD9ROXRo7wFuymzdxQh41ybgRgBnF9KTGt1HHvon9@lists.linux.dev
X-Gm-Message-State: AOJu0YzWLaPhOdoQo9FB/rxgMFIjKsQ4Ccs2qRXJcNYXO/Dc9TnCv7lm
	YZbYiyQR+vHXmSaRAMNlGz6fcQQpNc59q+x/T6ebYRhM48U8NKS9/+ERWGQ51e41Gwac6+r7Afm
	Ta113q4rGvyP8Xw5N377kJud+hbLkWtI=
X-Gm-Gg: AeBDievXwm8pj3yst/Kq5cCh9xxwseZ3AgbahMWu0/dfMSb+DrC0OoFTO0tWYma57Wf
	Sf7Jq7ZymVzDjPweEn+/5bAdMIQNr5XnIIRGb9LC5TViSV9lNaTzCudUCr26ZH6d+hJD1wAxYEy
	fEgZ26zpWIJj6FX6eQCk6yNGFhHn9evRx9JdRB8kwTqNrs7rb1RC3xHO7T8IloE27OgQWxBEwcN
	NzjMDomrHuLWEmgrBn9zR/bhAM1YI/HBMNENu2CoSstwmFZl/dcurqLz9vYcP7nLg1XYEd3Wea4
	S0O1vyaCX8mGgtBlrMRM
X-Received: by 2002:a05:690e:130e:b0:651:d634:6d32 with SMTP id
 956f58d0204a3-6531085f25cmr1805344d50.20.1776417106750; Fri, 17 Apr 2026
 02:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415175038.3633384-1-lgs201920130244@gmail.com> <202604171609.wl8JLCit-lkp@intel.com>
In-Reply-To: <202604171609.wl8JLCit-lkp@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 17 Apr 2026 17:11:36 +0800
X-Gm-Features: AQROBzCVBYydseR7J8ekLAtPw3aL9_q0Qe5MzF8i8S3g1XrJyVxsBCHjMaTpGHI
Message-ID: <CANUHTR8SyfZouETXFpDv4ivzin+DC8OTDYhbSQ1cRaoNqYPduA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: fix reference leak on failed device registration
To: kernel test robot <lkp@intel.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Olof Johansson <olof@lixom.net>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 17 Apr 2026 at 16:47, kernel test robot <lkp@intel.com> wrote:
>
> Hi Guangshuo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on chrome-platform/for-next]
> [also build test ERROR on chrome-platform/for-firmware-next linus/master v7.0 next-20260416]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/platform-chrome-fix-reference-leak-on-failed-device-registration/20260416-135638
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260415175038.3633384-1-lgs201920130244%40gmail.com
> patch subject: [PATCH] platform/chrome: fix reference leak on failed device registration
> config: x86_64-randconfig-013-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171609.wl8JLCit-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171609.wl8JLCit-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604171609.wl8JLCit-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/chrome/chromeos_pstore.c:131:3: error: use of undeclared identifier 'ret'
>      131 |                 ret = platform_device_register(&chromeos_ramoops);
>          |                 ^
>    drivers/platform/chrome/chromeos_pstore.c:132:7: error: use of undeclared identifier 'ret'
>      132 |                 if (ret)
>          |                     ^
>    drivers/platform/chrome/chromeos_pstore.c:135:10: error: use of undeclared identifier 'ret'
>      135 |                 return ret;
>          |                        ^
>    3 errors generated.
>
>
> vim +/ret +131 drivers/platform/chrome/chromeos_pstore.c
>
>    119
>    120  static int __init chromeos_pstore_init(void)
>    121  {
>    122          bool acpi_dev_found;
>    123
>    124          if (ecc_size > 0)
>    125                  chromeos_ramoops_data.ecc_info.ecc_size = ecc_size;
>    126
>    127          /* First check ACPI for non-hardcoded values from firmware. */
>    128          acpi_dev_found = chromeos_check_acpi();
>    129
>    130          if (acpi_dev_found || dmi_check_system(chromeos_pstore_dmi_table)) {
>  > 131                  ret = platform_device_register(&chromeos_ramoops);
>    132                  if (ret)
>    133                          platform_device_put(&chromeos_ramoops);
>    134
>    135                  return ret;
>    136          }
>    137
>    138          return -ENODEV;
>    139  }
>    140
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Yes, the build error is because in the first version I accidentally
forgot to declare the local variable ret in chromeos_pstore_init().

Sorry for the oversight, and thanks for the report.

Also, the underlying issue here appears to be related to the
platform_device_register() core/API behavior. We are currently
discussing in another similar case whether the better fix, if any,
should be made in the core/API code rather than in individual callers:

https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Once that discussion reaches a conclusion, we will revisit this and
make the appropriate fix if needed.

Thanks,
Guangshuo
