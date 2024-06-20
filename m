Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BC221364
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718868759; cv=none; b=Ukyixl+Hs9nmlFaSMn1Ob24hsFOWXuqcVECTc4TdG+VpuqYqZQ/OfDjoUdJAX3ZaztS6EZEuUlhqhBZ+UJVsg4/ads1hE+bLf7tJ8bg9S4mBAMJEdYNrBRqssUoqfylyo90LDplmdFA/8ahxp4IoEmIgRJIN+hMlAPSlnR8eOGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718868759; c=relaxed/simple;
	bh=wHBVd9fc2iWfUZuweb4LS9YbAAd/18fD/OhLw/DQ1QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgBQKDElaiBa5THypnJhe2lEd3Vm7YsfMtruG0sRKzSlC6ykCPiOtTa2hUSWUxdrVdRjpYAEEiAqQkcJ/rYF9ky4e7QSjT5nl3oxj75FvP4nBj/ZA+Uud2QpK+tNuIjqFABwyY6e2vY6vrWVCghTJNxuvKBcv87sd/kKgXaG4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G78eC0Op; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G78eC0Op"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63bf3452359so5458637b3.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 00:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718868757; x=1719473557; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnAIkWGQryIAQtTLmUZTYaNhdbVrLJLMPyGuu/muHE4=;
        b=G78eC0OphOox9REx84WXh7ji6s68jUvBqLtApzJuSOcqSvDnicXahVl9tUh2T7SNhk
         84UPnlh4l5oYqwoEVVr9A2RGdEKPrxF1kiSs/JhfJ44zc1XyhhVlmfeEhevN3JRL/1bK
         vYdWvFonpAeemUB9NPm5c80EKqOwv4ReFZmLClePODydspeIhzYiQCbGlHMkAso/enu6
         +F7HpHYe0fP4p6WU3cjRM1rTXxcQlpBcq3mpgZKp/raIb7fPJa5txsVvSkOYeGz2Nwdg
         cU/vOgramvDgMOJVnhLg3S74xmUMBsU6c3UZLKAHZ+EE48MvYFevYgqaIzoQK5BdUiax
         7ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718868757; x=1719473557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnAIkWGQryIAQtTLmUZTYaNhdbVrLJLMPyGuu/muHE4=;
        b=EFQdmDQWbN+o5CEbrcm6NqKlFWIbk2EirO64URTAmKwpashagZAAR5uwj1qu+wTOYI
         Wz/AgfEcTxNsFSO7ru2+WwXSXjzgibrUonfHx7Y55rpsLOpy5laX0IhWzSZjoF5aJS7d
         VmBDniBxVpqwViLwtZvyw1DwjGS8X47GlQJkxv+KTQm9zi+CQhn90/4iuEBUVokQmh+r
         3L8GX0wvxwQVGCIdo7IOGNGjKcMt5ZF33ak7VsXXz/H+DqG64eOV0eDJwkdrO89Dhlf/
         cL6X22PPYqfrObEl8o/eip444SW0uTLddZ+CjeDMkkFLK0LoryZBsMmON03hOLCbcSQL
         dKVw==
X-Forwarded-Encrypted: i=1; AJvYcCXiZ0zJNAyPyRCZwKafkx1+NDnd5UXTbEdUZdy27tTAM1epFBxO/gzb/CuKfqnnLMIdnGpicakoohlOXiruXvQW3UCIyoQstjJIIUO9bQ==
X-Gm-Message-State: AOJu0Yye4iRpRId8z32p6GYSaxwiT2vy5SBwxAZu5ua9PR0h3M8/TCBj
	Laov988QZhWI/l/CMffyodCp8MozfjjQ38eF0neZZzNe+DB01ECPGRvFbZvtwKbPgaWunun912J
	CtRfybirfGmx83U9/SrDFmNtTC4k=
X-Google-Smtp-Source: AGHT+IFMs27chWrPqAVjs1vjzs16P9LfbkLcD+9tzrx+qaAHwjt2BmEAahSMklBZ+1btLgaZ6nW+L/dXD2/WIeBy5t8=
X-Received: by 2002:a0d:e605:0:b0:618:8d31:a557 with SMTP id
 00721157ae682-63a8e1d915cmr46504547b3.14.1718868757233; Thu, 20 Jun 2024
 00:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618185819.2155595-2-tmaimon77@gmail.com> <202406191439.3NcnExKM-lkp@intel.com>
In-Reply-To: <202406191439.3NcnExKM-lkp@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 20 Jun 2024 10:32:26 +0300
Message-ID: <CAP6Zq1h2Sk6H2V-i+PAk_fCy9xdywcYw=w9wT_xcJ2WrqyWbAg@mail.gmail.com>
Subject: Re: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
To: kernel test robot <lkp@intel.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tali.perry1@gmail.com, 
	joel@jms.id.au, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	oe-kbuild-all@lists.linux.dev, openbmc@lists.ozlabs.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob and Krzysztof,

Could you please review this patch?

Thanks,

Tomer

On Wed, 19 Jun 2024 at 09:20, kernel test robot <lkp@intel.com> wrote:
>
> Hi Tomer,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on linus/master pza/reset/next v6.10-rc4 next-20240618]
> [cannot apply to pza/imx-drm/next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tomer-Maimon/dt-bindings-reset-npcm-add-clock-properties/20240619-093532
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> patch link:    https://lore.kernel.org/r/20240618185819.2155595-2-tmaimon77%40gmail.com
> patch subject: [PATCH v25 1/3] dt-bindings: reset: npcm: add clock properties
> config: arm64-randconfig-051-20240619 (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191439.3NcnExKM-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406191439.3NcnExKM-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:63.7-177.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "f0000000"
>    arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:50.35-55.5: Warning (unique_unit_address_if_enabled): /ahb/reset-controller@f0801000: duplicate unit-address (also used in node /ahb/clock-controller@f0801000)
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/memory.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: system-controller@f0800000: compatible: ['nuvoton,npcm845-gcr', 'syscon'] is too short
>         from schema $id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: interrupt-controller@dfff9000: 'ppi-partitions' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb: apb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]] is not of type 'boolean'
>         from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> >> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
> >> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: timer@8000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-timer.yaml#
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>    arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
