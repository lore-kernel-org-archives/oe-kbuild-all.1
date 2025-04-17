Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830C188734
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896052; cv=none; b=lWHOUnvpOjXPaX1dse3RdnBJeSUf/0gs3YqUN4N04QboUWdfz4nAPKUVsUcdeXmQ5/hyb1JbLe/6yScylagL89KIFm/rvkvtsaSUZKGVv4ajHgxhQ9CoHudFEwdS9fX4V8YiNbIUSA60qTsPIBPjehosU2TbxrAFFJrYNY9Ut4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896052; c=relaxed/simple;
	bh=jnqj7AFgnxaBhK/OXRBhpGpDjimte4JIWt5zeOvCHCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjN2npYo8aPVJ4Y8IvvvkA2jQKoRUo70yWhUpOIP3LTE8MDKcppnRNP+Fq/M0or0S/A1llmr9b4TYISJln/cHYG8AUDyYS5vQe0tfZKU8hbWByc3eEibLhoq5d/1Bw5qHrzzeNUJTahmLxdVO0bK4lPpTGHp3YNjm1ViY5uZ7ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yBtxQtUx; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yBtxQtUx"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so969960a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744896048; x=1745500848; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3fNWc/pZCct0mYjTkt6bs0QfgoLsezjQ+6eDCuw5lGY=;
        b=yBtxQtUxjAeh8fIAgjJDDddB4/TkTp10F17T3OQa1xvB9rG+ZyevaMrLWp72Po2s2M
         HeLhz138OUCsLtIXZdoUVr9KNIN7oQzxY4diVKUAUjdutR9vmbZt40dkNlZtaaHiOQ0/
         DggESXs/Gd1PqecNxsR5qzKB99s9gzrlqmVGWty5AQUK8aHP+fbxyNGmETmAAFBWjQme
         Vj0MWJlSgnp2KAbCujK+klOGrunuNo+IUK3f9zDsijwqbH0hOb8PMOSV0/gx01S1TciO
         us/0McDHNAHjh9guHoTIhaNzGXn0UhvYXNO7EfmXmEi7wiyBckaoiQyEmoxkxWgRn1Yd
         XG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744896048; x=1745500848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3fNWc/pZCct0mYjTkt6bs0QfgoLsezjQ+6eDCuw5lGY=;
        b=BHrMHIsh2SKJl03hTCsl9o83IUbWVpk5CMykyJPreL36FUTLeCP3ALb+o/9AigdmUr
         eLv1iSw1Zj+Z7qiFuAHqfAqaSCrysOc2rUUIECyuEETWYOM5D2NkBOOwrrgXPaIa41JN
         sSHRfW/IKmL6JRNXuh9tsOsyrWLYmTej4pRMrfToQfLOr+on/wbWVbdgyccI+KFnWGHs
         cTlH+PCrL/mSsRf5+EUxljaHyFYTt/9NX+pVnT34vW6goKQeGjDr5W/jXAEvwwEf7DUV
         mRIjYvOPx8waGCgvhblhDrNaeFM2To2eTleciTikAVxVS01W2oKoR/Vo4xw7/WIEjjrI
         D9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCU5ij5Su3y9suWLAMUep3uUr8hUECQHzGw10OLYL6Y7KU19rarbbtmzwlnoVlv9gWKrGP4FJqRjQYSxB1VQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw826RZDAF629iI7YTqKbDSelK7bXEIgoKQ9J8mgT1rivJjJJsx
	kfm6bNfH9AnN6d5o2HGvRtF5kikuZEsh4NsiVYDRI+ShVA72t+eS6h0Gijd43Dkoy8x22kYwZhq
	1U5gBZwfPwz4IvLYVpHMudIksovGjF7/g7t2tig==
X-Gm-Gg: ASbGncsMJuMT7wX4HcKw9Znek0HF7H86sBEqgU94vQBfY013/BkaZEWNcgINbvvgqEc
	7FaXYeG9YVUInmAnTBNV9NKI46MlMUPgumhYRahzyHV8qtdTJhSM1PIouHHx1V2v4CZXEgoXJRX
	AvPu40uDaO0BRY5O+zgF6Ih1rCdzNc5PQIRU7jTqIdYJ+giGY22WHljAQ=
X-Google-Smtp-Source: AGHT+IF/XGZMdEbyV8STjZkrPYwpJAqWOdT4wpm0VqA2q6Y1+t51bywOrhtFvxpky7HoJViQWi0ovzZd740seNUOkT8=
X-Received: by 2002:a17:907:97d4:b0:acb:6686:4cb8 with SMTP id
 a640c23a62f3a-acb66865b99mr121722866b.60.1744896048162; Thu, 17 Apr 2025
 06:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504172017.4RgIYyN3-lkp@intel.com>
In-Reply-To: <202504172017.4RgIYyN3-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 17 Apr 2025 15:20:36 +0200
X-Gm-Features: ATxdqUHBjkbLdu2CyzK8fJOMjXIxG62qky88Kh9oEQ_r-YB1bwy10M1lmybsKqU
Message-ID: <CACMJSeuRUrWHV9PMHOOvXGw9QFQ=vp5VX7iubdf_SEZu_DH3hA@mail.gmail.com>
Subject: Re: [linux-next:master 4503/4779] kismet: WARNING: unmet direct
 dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 14:49, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> commit: 90d80a3dc4fb24446d9d423c1c8967a63f136b0b [4503/4779] gpio: tb10x: enable building the module with COMPILE_TEST=y
> config: x86_64-kismet-CONFIG_MFD_STMFX-CONFIG_PINCTRL_STMFX-0-0 (https://download.01.org/0day-ci/archive/20250417/202504172017.4RgIYyN3-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250417/202504172017.4RgIYyN3-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504172017.4RgIYyN3-lkp@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for MFD_STMFX when selected by PINCTRL_STMFX
>    WARNING: unmet direct dependencies detected for OF_GPIO
>      Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>      Selected by [y]:
>      - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
>
>    WARNING: unmet direct dependencies detected for MFD_STMFX
>      Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
>      Selected by [y]:
>      - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I guess I'm in the process of finding out why these were never
compile-testable in the first place. Dropping this one as well.

Bart
