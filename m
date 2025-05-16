Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D931E4B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400547; cv=none; b=E+oIm6HH42BAlvp7ckDgXVTuXdWcFTg9ev/1+0kT2KSIe4fYpSBmudem3JvIZpeYGFF0wjkQuGlNLK6ylnBI/LEoM6UQVV6PZLwRr4ugtp2CJQlgo9Lz5or7gm7n47YYF78DhP2XOzs/nwVTI4uQi4Y222VrQbVitRalFjOn26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400547; c=relaxed/simple;
	bh=KVS47/XoSWd+fNXjULjdUBqXz+ZFamPMM11G3krrkqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG6le0y0eLe01mizk9gwayCY/COdZ6x4wm3ap28AmEkvxUbq9jr9re6XSO1FZbe3BPke6J8276jk4h0SCE61mo5dAcRg6xnVcm8L4/sviB6Dwp3xM230zhEvA0JuA+H4lL5WyVWiGkka0wCHbCyPxmcJyyDXHzKZCAmjAbgWhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQlgDcGP; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQlgDcGP"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-48d71b77cc0so27467181cf.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747400545; x=1748005345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=;
        b=HQlgDcGP0/nMqfa0OizzzEltgUlcsk3DgSh0jF5ei/bVkRZMa7UfZSUzFE3U0Vq0Ii
         a07Rl2SiFiszmvZtUyWPDPV2NPZP7nvB7HBueoITgDNRy0K9qZm1R4mIAa/b5wvXL+UK
         YG8h0XWfgtaZ3D6EkuYjrr9/O+49Lm+HOtlZYo8npctLGRclDm4McPqiHAgTo8cLHPG8
         tOuo5gQ6/wyFfOstHhWu2Rg70htydAgZs2oQoOB8v4nBBJazUVX/SFnWsmjX/UY5MlZi
         QA/SQEVp6Qs1Z3VfG7+enNxlF8OQPsgJ+Tcd1X3RbHdC84BowvthSECiMT/vRDbu+Btp
         yraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400545; x=1748005345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=;
        b=BC2aKDYpPQAA2LokJ8NrgkP44jMK3+Ar3zVYD+ySqV0WFwkg4NFUEcGiZVpw02EGN7
         ZUxHOr/y7DhxbQitjjyFRBP5Fu+hPI8wJTlKLjwUhv/L2QUvaZyYXhMTXjSObBxRRUvH
         BIwAzBCpa9ltjE81wkqqf6bAZn1ESoKkLB1bwjQdfumTv+SM5fYjYoU0oE2TaBTRWVbK
         i7QxbesAHQ2rCa9/UtS5IhA9sCEZpxAPM4zt8Z+vK82F3ZYeszS4w8lmj3I/jjvgNTqo
         QNx9JlSGJwRtD2EGvTVrLE+HOSQJn6X/NX7QacBoYZ63+PvyqQwVO5POd8ET5vAgi7p4
         hPjw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ClvKo9aYH70b7XiMKxAmRm8H4M00N1NLfjO93OJ47V4ApMuzCB7xTLNic6ZiESqyiMm+p+nKsCmFBIXM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo1hNtJNYvWl2O7HQVdghNnGPwKUdty0P+6ELEZbxikK05dnDp
	QPMicL+R6Qp2rdH7q1nkPldyFb1iNtFbKWdldOkikqW9EybRA0x0PiD11riJAfWTAJwhJpI2WLB
	wRrJPTmPojlJylc4x80Ac9xeRdUQ1gqk=
X-Gm-Gg: ASbGncuFB2Ig11rRDDL259WSmn9bLRChLqcJ0RtJ89v1etSSm3layG2oOsxx4FFTbCm
	QpDWfFHYQGM+wcUaCTNF3Vw3t06SHc4H7B7KxiHUPC9L3ucjrwZBvCXJsRR+tSSUZdy9pmFhWjD
	B1+tDQf2i9SDpCu/dQ1ULd89IX9gosGBPTwDlshDsqVP0=
X-Google-Smtp-Source: AGHT+IHZyJqid//wCBlVNP3pcnUuvkjajKER+xeFHB1o8i8ij6OKhPHYHUDAmLQb9yNNQCp7v0lXFOO9XZFKzyx4pHM=
X-Received: by 2002:ac8:6f1b:0:b0:48b:5656:bb01 with SMTP id
 d75a77b69052e-494ae352f98mr41415291cf.10.1747400544544; Fri, 16 May 2025
 06:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com> <202505161430.wdURc0TG-lkp@intel.com>
In-Reply-To: <202505161430.wdURc0TG-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 16 May 2025 16:02:13 +0300
X-Gm-Features: AX0GCFuUyfeKPyuuQKwLTH_a0JHlANkAjiXIiU8TmkAt1AD4XrUds-vQSs5nQng
Message-ID: <CABjd4YykcZckQFfyuSpMtCJybq2nQuj9TYAP2S7RfivPLYPUnw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 9:56=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3=
-4-2197a1b062bd%40gmail.com
> patch subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia S=
oC watchdog functionality
> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250=
516/202505161430.wdURc0TG-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250516/202505161430.wdURc0TG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505161430.wdURc0TG-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/watchdog/vt8500-wdt.c: In function 'vt8500_wdt_probe':
> >> drivers/watchdog/vt8500-wdt.c:98:44: warning: conversion from 'long un=
signed int' to 'unsigned int' changes value from '6148914691236517' to '328=
7081637' [-Woverflow]
>       98 |         drvdata->wdd.max_hw_heartbeat_ms =3D -1UL / (VT8500_TI=
MER_HZ / 1000);

Will change to U32_MAX in the next version.

Best regards,
Alexey
