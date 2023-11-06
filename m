Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C318120316
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcfxpZki"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-da2b9211dc0so4293816276.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Nov 2023 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699276613; x=1699881413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmQ2IOK4VigklEem+xi/Ol6X6Y0vHqrd8mxsRrkTK0M=;
        b=dcfxpZkiFVdcTUv23bR63SitBpWdY0ETVs4xwBkefRq5mBkvQbSj0sC3FiuiUWVpLK
         ZEkwh1fFUls8ATNfCwurnQ6RdlSIl2MX2+nf9NbXntedjFV+Twj+AMAhOnE7PW/vawv7
         UoAe5O2zDYvzFCMpYuHnS2RJ5IO3VA+f5P4jMu6JbsI4Txwd4/uCFL16QwKnLnTsDWRN
         omeaOBZ/EJJR9p5ouZyuiMOZYqSyMZqD/O/iS1JzkAywz1/PA0Nq3Pq6v7+5GrzoFCsm
         Tr3YKrdZ8IbG7CJg+4PGr3qsy6QCfwUsoMT/kJGolXCaIQhP58dPjXqxVTJf7AMPNWXi
         RJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276613; x=1699881413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmQ2IOK4VigklEem+xi/Ol6X6Y0vHqrd8mxsRrkTK0M=;
        b=e9cHsJqQTgHalTz9SbDgtBil0G8OhrCAkAG2FJXzQpGr4zfBOlqZlSvHXt8Yw4wQ0l
         Ww5NrdcYFracz9zj9srCgJ9ThVGJeOAmb59MVx0cOw/+oCL2kNbtP9BXYKlkS+sMK8fj
         PW9z2eVpQ/UfBgOVbOK1/eXUaOr+P+6CBnEsldLIOlh+ZfDXf1W7Xk/RmI/ljQuJMVqm
         Y+wHz67AZ1bJ+NAavZE34+i0KrA/XGjlQiJh/PlttGoMG1wkJu94KjVj4vnGZEurIC70
         MM1J3Pm8iVx2XwXarDhNZdYAVsf8p0Y/yEAYjCpj2NeQIyJgtDIYJ5fhES7vtyPm5PUv
         +Vjg==
X-Gm-Message-State: AOJu0YzNUzxONXgNPntyjQ5hyiYGXdzLoUCPz7svve6/r0vJKOrVQx4H
	b1c5/WEUMPCgULemgJSbuSM5bU51TYF63jTI+mK89w==
X-Google-Smtp-Source: AGHT+IEYdwFGrQpGmkQoM+END07GEaA8YSVQaf19XAB8XjDlCXnkhETD4WV4pjnnBA9GjZXOEomsSXTdH4JAzr2deNY=
X-Received: by 2002:a25:54e:0:b0:da0:ce05:ca2c with SMTP id
 75-20020a25054e000000b00da0ce05ca2cmr25226767ybf.7.1699276613651; Mon, 06 Nov
 2023 05:16:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310190854.yTRUMqLL-lkp@intel.com>
In-Reply-To: <202310190854.yTRUMqLL-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Nov 2023 14:16:42 +0100
Message-ID: <CACRpkdZ-1OcZ-cz0V218-VxAc07DMPvKWee3MHngs6Hrwv4zPA@mail.gmail.com>
Subject: Re: arch/arm/include/asm/memory.h:298:23: warning: array subscript -1
 is outside array bounds of 'const void[2147483647]'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robot,

On Thu, Oct 19, 2023 at 2:22=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

>    In function 'virt_to_pfn',
>        inlined from 'pfn_is_nosave' at arch/arm/kernel/hibernate.c:29:33:
> >> arch/arm/include/asm/memory.h:298:23: warning: array subscript -1 is o=
utside array bounds of 'const void[2147483647]' [-Warray-bounds=3D]
>      298 |         unsigned long kaddr =3D (unsigned long)p;

What does this even mean?

>    296  static inline unsigned long virt_to_pfn(const void *p)
>    297  {
>  > 298          unsigned long kaddr =3D (unsigned long)p;
>    299          return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
>    300                  PHYS_PFN_OFFSET);
>    301  }

Array out of bounds? It's not even an array! What's up with this warning?

Yours,
Linus Walleij
