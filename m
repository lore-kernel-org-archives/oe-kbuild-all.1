Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F76633123D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 21:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300151; cv=pass; b=gEp5646KCUkcpyvZ141dxxK4+/Nsc65MfEeV/KuIF6q72oWTA1h8adYzBdTDm1Iopv9Pt4AlaEcvuNvttEG5oecvm8WHpzcoF+aGJZ3mTgj87f4+7sDJjWw7+NKpD21H9Jg6SMzA+TdBlLdO5y26hfaacUHHmXitJL22d0rxPqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300151; c=relaxed/simple;
	bh=SI9GtV5VQQl0fkJhizAQstM7tsgQOIFOHYypPsLXIYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNjMXnkMTLVT/AvYVsnfNj18SYQe4LemzV4fpPUl635v20GOZtir5h2RFjCrk3Ort6n5WaorArdfkYwp30oIhyVRQdMTMKGJCQSF8MWZwz9DEUbh4PT7zSvn3EUjeXs1J4Dup4vfFvLv5fo6uNfetMlOxnFHotJARJuyx9z6GDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os7fDpNF; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os7fDpNF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0a5354da1so12673915ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781300149; cv=none;
        d=google.com; s=arc-20240605;
        b=i+UujygmN+JcUtRBbcWkUw6MtWx+atujh6wNTln/bh4p7po3P93leIhB1Y2lcq81St
         H0UlAKCw5Ur/9u4POGxMlkIogBU16+CcxoasZjRU2gNXgKpHIouZVt+znKN+QGX7nGek
         fbbs1Y0Nkw0yvVZzDisy3xlEWybm1+XfNF4o+5sw5aazGLa7kkYRMhJZJyEvlvGkJFi8
         A0pG3FNHLidHgqZx7+tSqHDWvr21nOJWhsWRRQDxHUqcM1rlTy8SAAkHWW4w39lPvtQW
         Z0+JTBudhpH/qhu6unhkVBH2IJLxX+IOj0STccBMH0ELXJTYgtSzZ3w5mvGw+NirTZDr
         5NGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DQzBXiianzmkqwPuAxPM2Gnm/zzcWcKPkGEq2cG/kRY=;
        fh=K5Hj8eqZ8X6nabuBlbP9gqjUajXtEYTbgsWlmXSwfmg=;
        b=Dgv9vftQAxF2nTphx4QHHe9nyskvC4E3jTwOqfiIu5HM+DIW1pH4jlR1+yHmychg/3
         hlfdPLn0XqN/y8tq9NkMYVrMWcJpFul94PKqQMH2spCXeP1gJXlTZ9c4xleknH+9Ma/M
         r+3bblXJ6HmNirpkIXvCM2k1T5YBZOIuzYPB58jCbzNN6OgsHhRHcWMvfLcJ2T92tL7S
         8f23T5VyI4e9F1OR+2qSGbuk3DqjVeSoDhr9wGmALFy0yDhfskXikWGuct6PsWVphApQ
         2XYbaMfowxzY6xCN1qtFFkWpUCAYN9ucVpNJW5lRDAV5ZZlXXIshgouLMOf4F7sLmMM9
         Jl9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781300149; x=1781904949; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DQzBXiianzmkqwPuAxPM2Gnm/zzcWcKPkGEq2cG/kRY=;
        b=Os7fDpNF4LxoURQYrXpTlYF41yiTCYKn5MjLDtPDpxOs3NkBstx3ubmhRt4rdeFIq8
         14QAiMnnLEmK392/hsAXjl+QMdXftVGY5/iCMfk+vUTUKlKORSoCXgO+GYlL6+KPKz/k
         JOEA8PYiigL9sZZ5OXJo8K/fdHj7ht8PPdYyMIqVl1zYpt34S993hZfnCSznMTvGpe5w
         9H9+kySXZL8DIZ46UqxzE44fOQTGyzhe+Xp6zm/mWH6Vj6CmmC5DLuXeMZ4HJW4xdMbG
         AKuPuAckDapTd6hVRdD0KzuDNuhMVqZj1i7SK3aK0OTux65UfrrNZd2e+wJNxL9iWmgS
         +IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781300149; x=1781904949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQzBXiianzmkqwPuAxPM2Gnm/zzcWcKPkGEq2cG/kRY=;
        b=liXKeIeQI2QlWK/QwGWOkFDf7BcP6Q1q2ASvUj/o70CqU8Wss+Z0jFrt7vpfCCYCgd
         pTbUpYtxuhXX52sc9wdODpkfgO915OaaBJJjcazQmssWe9753+j5kwg8QP/hzZRuWFTL
         W2DZ8GFjO2hPJM7AU3JSMDy6z3hFsds4Tjb6QlEfD6sV18Ha5o4c6aOgygUGcy7W9+tg
         lEcX0rF6s4x+w2SCinhanbiEnFu8QzDVA4Nxpiy25rskn2P5tzDqaxCiNJJB4jxE5uED
         B0Gm2aIiI1pCBZwII+Xwx8THBUlZ2KGWAcJMfMBB76fYRgNVryVNcYEhq3ZX5x5vO4JI
         Ockw==
X-Gm-Message-State: AOJu0YwB0eUZpFYV1J/6SX3zjefjexrTYFhVQVyr5hGWY0wuUth+L70K
	CYtPKbnVaD6JJArTfxQnenhryS7jcLjtA4Ww2bQyu36D0Fl1xMCLlLTV4yT0F7CC4odKk0/kmFW
	qP16QM0vX5qxgPXPzVdxUqbXLShL8X+A=
X-Gm-Gg: Acq92OGegXd9eeTXmYfiI9t19eqMfwkZr3r5Ls0aamBkjVRN9eQ/Uuha0OVf/YRZfDf
	YHwyulYPxIBkIKTAwrA/UDfkXeyntP4xbWjkDfXNmdnXLUljpmrUttbdOXC0cGeXX1m/wUypihY
	eoNe+komuQJH5tNm5o07eovUUYeUG8a2WwB56KTNTjScjyJ5Kq8L3qePQvpm27kFL3YQP0dUG3z
	/fuw0ro5bKrt1ji8JAtFcJ5kvNdS9vxXwbf9tXDgcfV5ZEPB/VxDRhtbz687QpORtdRsfVP52YU
	BJmOPQ4U7mAnx0UquC/SwCTulCPIF9B5u7uZbAJHOqtubR7twJDRLTIcyR87abqJ2qKczTm3++C
	OlBOIrqo=
X-Received: by 2002:a17:902:ce08:b0:2bd:9b0e:b43a with SMTP id
 d9443c01a7336-2c42cde67d5mr37440275ad.7.1781300149365; Fri, 12 Jun 2026
 14:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606121504.gQAUu2CQ-lkp@intel.com>
In-Reply-To: <202606121504.gQAUu2CQ-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 13 Jun 2026 04:35:37 +0700
X-Gm-Features: AVVi8Cc7UHMp7JWFO5XaoycuH90x33gbvn34LGIAIPMg7KszbZ3Wqtf_WWgsOyI
Message-ID: <CAABR9nEE9u=0qZbEiJJ3MNMHtXPDnuxD3ymO73i8u9avG_TncQ@mail.gmail.com>
Subject: Re: [linux-next:master 12430/13336] arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb:
 sound@fe1f0000 (renesas,fsi2-r8a7740): 'clock-names' is a required property
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all ,


>
> dtcheck warnings: (new ones prefixed by >>)
>         'arm,coresight-etm4x-sysreg' was expected
>         from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>    arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'clocks' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>    arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>    arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'cpu' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
>    arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: ptm (arm,coresight-etm3x): 'out-ports' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etm.yaml
> >> arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dtb: sound@fe1f0000 (renesas,fsi2-r8a7740): 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/sound/renesas,fsi.yaml
>

That's right. The patch series was applied without the DTS update patch,
which is why this warning/error is being reported.

The DTS patch was reviewed and applied by Geert for v7.3,
so I believe this issue will remain visible when testing mainline
kernels between v7.2 and v7.3.

Best regards,
Phuc
