Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75F0142E73
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 07:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711868; cv=none; b=mGHqMoE5Op9fyThOnAaGPKO45FYBCRnAZPUePtb6ZfmFJ3/NEexjZ18PT1XQpd/kA81/oPrazMPbgs9ZODfExYstXRKK9Jvrjh7V7Y2j4e4dy0sQKJPERagU6MO0fovL1YK09R8j4sTh/chbTiINbyoSe3JvdLSjd2MHK5ekhTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711868; c=relaxed/simple;
	bh=q7FkDLSlzI+CdYFOAOxgI9KLHLVJdHDdF7mg/0rgET4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JTqeEpl7oBkdAZdPu3LRAYzzl8wFt5n0ZZi8C++bk6iqZQxFJ7AGsG1CFnNgzMkO93XCUI8mcKlYhMbhqz8Qy4b/5Q7gSojCCfwJK7ZYzKGDvBO/AyUyKMYG0vZg/+FhyLu9JlwCesfYaPYYD/nyGrGnYCLu4mq5aseCyARfHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nvDQlIuv; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nvDQlIuv"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ade4679fba7so119246866b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 00:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1749711865; x=1750316665; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw3L/WGzJkrxS3GghkKjCyC48doik3t7MN0Q+k7a2Qg=;
        b=nvDQlIuvFV/IpbWY+Jv+ae0fls8fh+JA9qJ3vUGtJ2Ve6fHFY2Vqe5vd+IqmGN0Qcb
         a9MUQhZZUB4FhBLTkrHwuTuI7LrBzoFEAWUKN6DLfx/jd+fiyIoWRRaF4NzuMN4kseSj
         CMWLThyuNAAj//TGuhIAOCSjJ4B/zXVjFnnUwILj9p22D8s7dnMqyO5AoqH40I9Sk/kC
         6sDq/+6EOMuR4kJvYz7p7ExJAzdz9OH3j9ZbmEDYr4PC3MqZhlV7+JCRYsmcV/9brShl
         Hgc8gp/Vx6Lw2Q+kNAqFPkEKIlCi11kEAYexZZk2iKaYMoLCOFGatknSdLZIzLMNilFg
         PJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711865; x=1750316665;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cw3L/WGzJkrxS3GghkKjCyC48doik3t7MN0Q+k7a2Qg=;
        b=RhqiZZmHY97f6cUsfiIWWf62dWrEjDtNzWLO2ZCgfOt2cXWRJBDGBw20uSk034n118
         6JkbJaAqc1P7Vsb8eCNk+RwoGTVHvrQ1ou6IB9hvSvoiWu0snfe9m3Op4csczR8/6s40
         O2lJP4sKzj4jEcjaa1uqDN8QeNn686pBjnOApAfGOCYXtUortBsSqe0EnWlRMzAwKCj8
         VtpoYnOuT0umxTGRAM7X8HCM5yXQ4Z1Obo/c0pDkNa4wsSFue6jWj67PtwP5zIRcFfot
         kX/PCD/L/FQ2sSPgESswwogWy2TIB4Uv2vXzov9NopgMudooMp4JY1zgJk2qD6xL6aU9
         ZUAA==
X-Forwarded-Encrypted: i=1; AJvYcCWPC/Y32xJQ4JsyTCPJssEjv6U5zx99bjxV3fyGmoVOeGOMo4h5b1qRLR2tY+2iIxiHA1iTnV4whbO/sHXj@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyx8l7z311fteXnwjb6EofCOuKVKT1jyH+aItnQU1uEeWG+RSg
	krAb63IKQlvcGU5+0wjrrRM7oq9GCQcqs11P0/0cgTAJjV4XnpzJDwk9KBLEC5fWOxs=
X-Gm-Gg: ASbGncsTMq+R+QBc6+agTmN3aRN0V12UQwXAdGmtVY9WJAc373Exj2jijxN4Of8fqGa
	zsuxQVkEll9GE2CB19KwQ+sBRZKqu9lP8K15VsR04wSlx+tGp6xZnB35QD7N3dXAhqtTthCZOdF
	x+1qi9cHVSSRacsYYVljhWzxO00pui3volLl96FahM8SO2YG674i5rHjLtQMbLGF46rVDLAtRxT
	EryyZURjPPPuI+GcQjw02NLOTct37UbywuFF82V1msu1mW50fyj9VrKe9XrS8mEqlVsniZLUram
	E86Y7lpk96yJt0nAfcvFJwYZsLQPMYZ+ij0LtbwKXunTtV5wqq+KCqLTNMGQ4SzONNd1Nauji3A
	IbNE5Yb6YI36SsDNcwIaBW9kvPwIn/wU=
X-Google-Smtp-Source: AGHT+IF+KDNKiObIpCIqlmOnoWcQdBtZSIbFbYbHlxE64f3Gbx2DmHfFPwsIDOzOarYvJsykGULdwQ==
X-Received: by 2002:a17:907:962a:b0:adb:2f9c:34bb with SMTP id a640c23a62f3a-ade8977bfe6mr621920566b.49.1749711865071;
        Thu, 12 Jun 2025 00:04:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb8e7d8sm83029966b.120.2025.06.12.00.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 00:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 09:04:24 +0200
Message-Id: <DAKD39PGNS5N.3AJ2BF7LUY4IN@fairphone.com>
Cc: "Paul Gazzillo" <paul@pgazz.com>, "Necip Fazil Yildiran"
 <fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>, "Bjorn
 Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [qcom:clk-for-6.17 13/18] kismet: WARNING: unmet direct
 dependencies detected for SM_GCC_6350 when selected by SM_VIDEOCC_6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "kernel test robot" <lkp@intel.com>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <202506120742.31WDlRHF-lkp@intel.com>
In-Reply-To: <202506120742.31WDlRHF-lkp@intel.com>

On Thu Jun 12, 2025 at 1:21 AM CEST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux clk-fo=
r-6.17
> head:   691f3413baa4bcaedbb40cd64be0f5e676423830
> commit: 720b1e8f20047e072b98a0931fc3e9a545fda18f [13/18] clk: qcom: Add v=
ideo clock controller driver for SM6350
> config: arm-kismet-CONFIG_SM_GCC_6350-CONFIG_SM_VIDEOCC_6350-0-0 (https:/=
/download.01.org/0day-ci/archive/20250612/202506120742.31WDlRHF-lkp@intel.c=
om/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120742=
.31WDlRHF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506120742.31WDlRHF-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for SM_GCC_6350 whe=
n selected by SM_VIDEOCC_6350
>    WARNING: unmet direct dependencies detected for SM_GCC_6350
>      Depends on [n]: COMMON_CLK [=3Dy] && COMMON_CLK_QCOM [=3Dy] && (ARM6=
4 || COMPILE_TEST [=3Dn])
>      Selected by [y]:
>      - SM_VIDEOCC_6350 [=3Dy] && COMMON_CLK [=3Dy] && COMMON_CLK_QCOM [=
=3Dy]

I imagine this happens also for most other videocc drivers upstream?

Most have "select SM_GCC_XXXX", only SM_VIDEOCC_8550 uses "depends on"
instead. Should all videocc drivers use that?

(also applies to camcc, gpucc and lpasscc kconfig symbols)

Regards
Luca
