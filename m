Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D406A5B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:04:46 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-58dce1f42d6so8787837b3.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 00:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692255886; x=1692860686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTUnF8+5OcFphnAsfJzdo2CYTn7bNaZM23DDcspeFko=;
        b=i+jCcxwNQzifyznC5+Xzx0WFayNXAB8WJSLIRuHzKFseY7+g9J1YQDKysdZ929lsQC
         VNchxafUkOzi7u/PXS5eu1cPg3EkaODHFVEG7NEZPf9gX0s3HJyEHFXpkEIADnfuXyRk
         ruww97/ooebec4VJkrNAPS01Ap8U68cxAXtoGJytEYZCja1mzgDi2WMod7W7c/66N0DC
         smaHraNEttq/odSUj1fB1GKrdf/NeCa35WbatBKnGdj71bW/M+X9nL2DztjxrbwdWFYV
         ZBYfQ77U9fZVan2T451kXrRkpTu4JSsKl2hUmsU0FuKpMGrqGG1shHkyneJdhIhqUoBT
         psEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692255886; x=1692860686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTUnF8+5OcFphnAsfJzdo2CYTn7bNaZM23DDcspeFko=;
        b=UN84y/CLfMY7CuIPnmv6MkQQ8EF4k9mfqGfmK9cSDxzbyecvq5dPu1dFEkK+aG6Cct
         iV1YG+dyOgFK91sfsiIdAg2Vapn9RdRI9pqPa3f8yr7IrxfffC9V7Nz1DdxiZlmzkCgK
         VkHsLIGm5A5+Jw32ZUjdcmMPZX7MMxvqDqJNk7Y+130dmmUc+u2iAxGipqDABzy1vEsg
         Q2hkI4ZZiQYXYfU+ZTD3opzQpRQosEuRDtGdmZRvduEoSUbiTBdWbCimBWXsWcs/A9yi
         vmDEJezBQI1vhmFbtD/7ZOtzQ0pL15JTbpyM1ey9TYbUzrjf5iNPyOGmBRIBwxu8alyn
         l0xw==
X-Gm-Message-State: AOJu0YzZo2a2KP3hF+9MoCNL5nFRzVDd6iS/sJhPaHCqw+3l3Qp6xeDK
	yGKE7FKykph1MfziGJcmU8I8MnfIixMAYds+yeeWTA==
X-Google-Smtp-Source: AGHT+IHOiYNKBOPzOndinqHKn+QqLLTy2t+36nqmModM1KgAA54scfRTf3Wq9QXv1HMTfbGsz0wNmIsqR3JaXYb+Nos=
X-Received: by 2002:a0d:d641:0:b0:56c:e5a3:3e09 with SMTP id
 y62-20020a0dd641000000b0056ce5a33e09mr2141980ywd.15.1692255885986; Thu, 17
 Aug 2023 00:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308171406.uWe0yyv9-lkp@intel.com>
In-Reply-To: <202308171406.uWe0yyv9-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Aug 2023 09:04:34 +0200
Message-ID: <CACRpkdbo_94Q2_ZLgV7SsCMfme8eiJaHjmchS3Nm8TRNHz+Dhg@mail.gmail.com>
Subject: Re: [linux-next:master 2839/10848] drivers/pinctrl/pinctrl-cy8c95x0.c:168:
 warning: Function parameter or member 'gpio_reset' not described in 'cy8c95x0_pinctrl'
To: kernel test robot <lkp@intel.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Naresh Solanki <Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 8:18=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> >> drivers/pinctrl/pinctrl-cy8c95x0.c:168: warning: Function parameter or=
 member 'gpio_reset' not described in 'cy8c95x0_pinctrl'

Oops Patrick can you send a documentation update patch?

Yours,
Linus Walleij
