Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A7A20DD45
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742409736; cv=none; b=kWzvDzz5Mk472BsXRcdd/P34DsGoGN8ypxeHfHsh0Pt4K8wIobvMxRF7hhXAPOW0CUBdRFKZOlHAhOEgLxT6KUhipYV2aGNDKz4GN2cP7WWugIVrkZsp9ELPimHIo6YZc6RDP5ZkE+pzPMAqGJ6Fs/868jZyPdZRtLYUmVKrlUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742409736; c=relaxed/simple;
	bh=I8TM6U4W8E1iammAjKzrmGqfsegq1HYaLtvp0NJi83M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKLdak/2FJCkcBZ5FzAi8JIegNl2IISgpwlrp/rEHjLyL08AQkgF6xYGXWwF0tAGon6SkNl5aMjC6OLs+Uotx1ItADCO8ehzLVcCyaMUQfRW4LcOkA9ki3lwjDjZ7Y2Cl3kJ/Z2qa6AsA/iUeY6LVVn+930yDFw4SBfHxu5IrMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6aaiSGt; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6aaiSGt"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52413efd0d3so3037300e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742409733; x=1743014533; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP+M6BjbnhzzbbapwY22IG+UhaXnw6zzi5Vog24T5U4=;
        b=C6aaiSGtmvSylvwbyIaT4PnhrZaTbsqEAOwh/eHiuYJX5GhUadq6b5vYxCWtoBjxXx
         PG46YmIs0T1FP30SI2dbdHC2IaWMmQ2yXA+W5RRsfLmV061LQuPq49M2g1bDef8q5i8a
         kcb1oK8xQPoSS1YGDOTQ1MK/elVI3i1CScO3LW7VhFLEM4YVBfBhRsHVt6IYPu2zyG1V
         /nCqvpNIqL3ijUBIAhW7lPue3zg3yl5RvvI/M7q1oKe352NXLpDEHPm/uv9hbYzd21ok
         B4kOI3Y5Oo1YIq6Qe5B68aM6Wgv9+rnvoS9GsSpj4KUJ/G8e0bSk3FYW6XZtyb6V0AaI
         7PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742409733; x=1743014533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP+M6BjbnhzzbbapwY22IG+UhaXnw6zzi5Vog24T5U4=;
        b=sopvHIDmlBswWgA7eHU1p/z7Md1ZIasI5Dtz8ecxPg6e4/E1uEIFDn1hmy3Th/5dy7
         TI+DNw/gqf4nJJlrlQCIiZ769piTwUnoYukExa9NitFH2hMRbC5mBru3b8dPEWQY6Src
         XxjG3YCD1UNVkCpZiLxliOnSxRTbjlDqmQuNGU4Ag2hgiDwZhdXGhsiDk9e/ALZFZTbA
         irMbSsf8L2jAuiRjmgM2Mc/5ybGDNHShM8Mc/Q6jCfmi/Po3jQNTqm1mBwLMiPtE09l/
         +3vLPhggKmZ6pfZng0hlGZql2NJfs6xSA4lus5wy8TkdNyOZ8y0LPedQqa3Y1650B+yK
         diiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPzGDxxJX+UVqSgmtJQztgqvnFxfiejDt+xZ5irhnZ3sflM3rZ+ndO0TGcVVzqPayaouchz8wBiTenx6Fn@lists.linux.dev
X-Gm-Message-State: AOJu0YwfBzAtra5pdt43Iz+gu2xgXl2+IET4UDNzGv8OttEtuIdSR5qH
	5VxB1CxDiV8jt1k7sm17VuItOvH6ifta1ENMMig3BUR/Fcj3RRmumtibkZ7XzKHmVOh8xVbd7ct
	S1hlwbhLivkHtI+Jdbfmg/b6ugHM=
X-Gm-Gg: ASbGnct9N7pdUPeT0eRI4DHSqOkLR/oV5VUnqFKyz+MKzJhviu/5myPfbDmSLjhjH0B
	GA+hqfEVQ8hnmWUFn0U90vHH7W3C6/cmmtJpq0PaX2Fc4diZ54w2VLHz9SgjBq6VLRcrfaUkvgT
	NrAJinc/PSPat7L3sl2mDZJCeOHQ==
X-Google-Smtp-Source: AGHT+IGvmmYvRZxaQpwOlm5/g30RcEwknbFzXlIE4/QcXAc1CEJMRoTLbZCqsGvZk1+U/GCOf7N2MIXZXFeiDK2BB34=
X-Received: by 2002:a05:6122:2a4c:b0:51f:4154:c1b2 with SMTP id
 71dfb90a1353d-52589135db4mr3735030e0c.2.1742409733365; Wed, 19 Mar 2025
 11:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318205735.122590-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <202503200200.WXMnn3Kq-lkp@intel.com>
In-Reply-To: <202503200200.WXMnn3Kq-lkp@intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 19 Mar 2025 18:41:46 +0000
X-Gm-Features: AQ5f1Jola8EJXzzsGPrnYQKrU1Z9ZvkepFcnYY4hn435lmQbHPiVJntqetDza0o
Message-ID: <CA+V-a8seHo-ngtbnysXLVq47ob1QU8m61F1_5guekxE9wur_-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: kernel test robot <lkp@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Mar 19, 2025 at 6:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Prabhakar,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindi=
ngs-net-dwmac-Increase-maxItems-for-interrupts-and-interrupt-names/20250319=
-050021
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250318205735.122590-4-prabhaka=
r.mahadev-lad.rj%40bp.renesas.com
> patch subject: [PATCH net-next v4 3/3] net: stmmac: Add DWMAC glue layer =
for Renesas GBETH
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/202503=
20/202503200200.WXMnn3Kq-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250320/202503200200.WXMnn3Kq-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503200200.WXMnn3Kq-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c: In function=
 'renesas_gbeth_probe':
> >> drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: error=
: 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP' undeclared (first use in this functio=
n); did you mean 'STMMAC_FLAG_EN_TX_LPI_CLOCKGATING'?
>           STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           STMMAC_FLAG_EN_TX_LPI_CLOCKGATING
>    drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:125:7: note:=
 each undeclared identifier is reported only once for each function it appe=
ars in
>
The dependent patch [0] has now merged into net-next.

[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git=
/commit/?id=3D0c1f1eb65425

Cheers,
Prabhakar
