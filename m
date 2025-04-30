Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ADF1F1319
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003777; cv=none; b=ElD/CqqPf6/+WO8kPtUrOErmKexfo3cujWK03X8pLrTWUP6RuKMhZ983oW2yWBLiwxISpdrm1akqZUbVbvCLUQ0bioQ7TYzdzTMIvT+8gSvBXIjKkd3cD+AWvpiUEAIQuUIs4tZKBpl87VZvarkLDYeYrG/Zb9bnOv5L0f55iX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003777; c=relaxed/simple;
	bh=R61Unc1O3PEjF+JSF1A48jFx0TNkpJAQ9/Rixza4/ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlwGg2DKKZXl6JnA9pARqkDUTV5pBLpTJW1HjqY4cBGNqioxY0lXkX74XWeAf8RZAkm/r23cM4JfWMq9C1tFOUjqBvnI9/ezHlpwYBaNyZdjyQEaw5SMnkmkUts1+nUDxfLHoh3x0femj1p1ELbEHcjb0W/3fwv38qIcvoMLdUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdLlAzzG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdLlAzzG"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476a720e806so67788991cf.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746003773; x=1746608573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X+hIncwnwSZUNbNNf14X22Cim2AO62TVydGoqooScU=;
        b=AdLlAzzG7M63aaQji+Lqmzpa8Omu6lSqeBO5RzrXIckJaCkIj05dqx1r+qmXfOFUHJ
         +6icSLfQHm/EPQPf+9FZo8UlRsCkPEACRylc9VeB8Src+Ycm/G/Uuc5aVzLAv0b3T76G
         JTSk1L59tEX07PpfKlN1dYlYNMb1/Bf7cKwktYx6ptLir2IW5zrLICBVAu/SdHZjUUO3
         KJkfFW8dhOuqe+CbXUrY54UcaKym385Z03gRDe0Bzf/ZaG8kR0JxpbuptS0MncZaaZuG
         cjE9OBRNsOPxgjJU00ch6kFe3r+DxVjCh//xr2k+OemE+UAV5rGIPbTS/fbUAnN51CDL
         WhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746003773; x=1746608573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X+hIncwnwSZUNbNNf14X22Cim2AO62TVydGoqooScU=;
        b=Jd/nIMl9yQ5sTnX7nR40/KhCWMUca4ipTjYfIiny1atSJ6UDs5xKAYJxjKxOtNg8cP
         nF4Id8Y/XpaKa/g0sWQ+Ya48QdZe12diEfiLKZ+bW/D0aHJfkr+44QHiptJ36kRuHAN4
         0XSKqMekSEJToxet/Jz0WYuLiuHG9LnVeFF355lPUUfPlYBqLDhJkd6Dyp2YPYQ0D6WE
         GqPzmQsAh0vTweOnhXNKtLdcC0Ym0SL3PI9Bp/aVYBNFDgVd6691NoBEaUcix8EVOZ/d
         i8keKyWI3Cwtto/M0a/gcaAQU8nuc6c5WV2OTxEujC6/yEuQHfepsN6xMsC0nb+ImzaO
         6F3Q==
X-Gm-Message-State: AOJu0YyEvxNBXMqKRnq9m4aznpMzGLdUew8GkK6u05RrT6WykTliGDqH
	bjnzZv5t87L6dR0wtUDAltK2cdphcU8JMe2PiBksbedfmsuEReKBOd8y1U7dRdxIUIc4MZVWLdT
	3XlaeJ0XL5zZKFSfG+Ld9yjmcirQ=
X-Gm-Gg: ASbGncs7DtWaHj1mF8X5viQQvnooww3Mo6EldX0CtNZTrmKDLZIbfEBN8ITy7EYRP4g
	6qgDfDtbCc7qgGoXaVIFf4ZVxMbruKR79rKUH6Ro6APnlXQIBX7S39dR+j8uIqGAl3GF0sTfYCD
	d8x17C3r1pgmaqt0jb4hJVRNU1KOSH/4i0I8N00i8IFxuIZGc/IDWjxg==
X-Google-Smtp-Source: AGHT+IHnekIPPgGajn+eHiNG9FrgoQGBVIu+d22bq0c7EK8+nbqn49ZCy2HWJYkYVExvwtQsV7kUge2CuQ3TPE2cqt8=
X-Received: by 2002:a05:622a:620b:b0:476:add4:d2b8 with SMTP id
 d75a77b69052e-489c4f27399mr38473341cf.32.1746003773021; Wed, 30 Apr 2025
 02:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504301545.gDwTgEok-lkp@intel.com>
In-Reply-To: <202504301545.gDwTgEok-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 30 Apr 2025 13:02:43 +0400
X-Gm-Features: ATxdqUFqaSd9ealT5-uklgA4yVl4iw1SKTCbfxq3GZMN9FVfdyUu2S3NismOAOY
Message-ID: <CABjd4Yy+Nd5nwV8WcVda0aO7i7jAm9g0S_zELQexvbgUsvLeow@mail.gmail.com>
Subject: Re: [linux-next:master 6331/7105] arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb:
 /soc/sdhc@d800a000: failed to match any schema with compatible: ['wm,wm8505-sdhc']
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 12:02=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9d9096722447b77662d4237a09909bde7774f22e
> commit: 927e1b7ac361fa1a76fb29caa21853c9d8ba315a [6331/7105] ARM: dts: vt=
8500: Add VIA APC Rock/Paper board
> config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/arch=
ive/20250430/202504301545.gDwTgEok-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> dtschema version: 2025.3.dev21+ge6ea659
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250430/202504301545.gDwTgEok-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504301545.gDwTgEok-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks=
/uart1: failed to match any schema with compatible: ['via,vt8500-device-clo=
ck']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks=
/uart2: failed to match any schema with compatible: ['via,vt8500-device-clo=
ck']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks=
/uart3: failed to match any schema with compatible: ['via,vt8500-device-clo=
ck']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks=
/pwm: failed to match any schema with compatible: ['via,vt8500-device-clock=
']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pmc@d8130000/clocks=
/sdhc: failed to match any schema with compatible: ['via,vt8500-device-cloc=
k']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/fb@d8051700: failed=
 to match any schema with compatible: ['wm,wm8505-fb']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ge_rops@d8050400: f=
ailed to match any schema with compatible: ['wm,prizm-ge-rops']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/pwm@d8220000: faile=
d to match any schema with compatible: ['via,vt8500-pwm']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/timer@d8130100: fai=
led to match any schema with compatible: ['via,vt8500-timer']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/usb@d8007900: faile=
d to match any schema with compatible: ['via,vt8500-ehci']
> >> arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/sdhc@d800a000: fail=
ed to match any schema with compatible: ['wm,wm8505-sdhc']
>    arch/arm/boot/dts/vt8500/wm8950-apc-rock.dtb: /soc/ethernet@d8004000: =
failed to match any schema with compatible: ['via,vt8500-rhine']

Note that this should resolve itself once the related bindings change
[1] gets pulled into linux-next from Ulf's tree.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=
=3Dnext&id=3Dbf45262ace269de52752d26b85d373151b8fea8c

Best regards,
Alexey
