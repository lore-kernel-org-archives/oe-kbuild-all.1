Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427296;
	b=IEp3hPV1nsUtfaaWYIoLPCd99i2Wtzon8ITzc2kINFl8XnZ21zDSpQf7JqV2UE7G1FKM
	 XWjjcXHrY8eqodXpkolUQZi/3Fimjuf/ylqL/myOr+9IVZPwC72Q8+tVHoRuIoz91tLCc
	 094eHdCOThKnG08JEHyvLRJezEC+USfgekCa3kZpnfKWmRUD84rf36e4P3lEtVqlzneqw
	 A1n1ibXhbk2aO4/DnZ3md5P6Ap+UwQm0NjLXQwSbM9m93McjwlO3HdmYzmlWoqnArXPdJ
	 3qmPM6i3vPwmlGS65Mt/kX81uYODf64HefQ8t6z83V2zySSOZpSG/6CmZMkLelANVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427296;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cWZpBhDqNHZ7OOEEIRJTwjTd8bE65OY0/Xt9j7AHp2c=;
	b=gJv/mYm4HG1cwM4xYw8QMxRuQ5pcKtS87ckw8j9pgSR96ZFi7PB8RfTW5ssLA2MgIKqb
	 PgrWOSedSGtEeOq66o1bzZYmb9YfVfEhqqmEDIZaWh5NBSsngslUt1v/JPmbabpkeGbDc
	 MdbCPT+1b0ro11tTIj6gqanJB6hDi9+HV0cRh7FAhCpHA0jsRryQFjBMK0ZNXiL6dp2B9
	 bWFIi1Y3tfsbFsxUySNmN5IBCmpDl37xbzOQRNfYwIycJxie3HWhcmaWAJQ/Tpv2W1crW
	 2lHvpyx9b+bzhDTPx2QRyMaqNCoKDarfKJdY8k5LzP3MGm5Ybmz3s8Jg12w1YNnhTIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF08606A327
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 09:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF08606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so938318137.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 01:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427294; x=1796032094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cWZpBhDqNHZ7OOEEIRJTwjTd8bE65OY0/Xt9j7AHp2c=;
        b=oioZ54vgD872ym2Ii3NrPLIss6pOoi2mr8qZ7m7NVkscCLD3ceH0YfR4NM5cwiNhFg
         NQC2KNtvbM2GiEow20awjRuEFP87D3RVAArZvcrFvn8ScVS2DBiXZs4mzUUZ8YkTbWyR
         Gf4xR+0Wch/p4+sIu/w/UxCVsUnLyZUZhh7jon6JzGnCwEde8T6sv6pCCOs97BjhiVJo
         SoNX3yFwG71lsFrAKK9DuW3O6791WvTVe96yvUnvtDuR1lrdtmRJNLMvgcVIUhw3aDtr
         rSodGjSyBvCpyD0DFDuAf5zcVL6Wau73C9+pGmamVIUyYoZgSiLQ/t2oyXDc2Q6wK3J5
         Biwg==
X-Forwarded-Encrypted: i=1; AL+hErEi9oZYWCEthCQE+YYPSE5E9X01ce9ny3MTJ3/SYJP+6A9TrBGvQN0gm8cCctZVTwUYq1q6e+eQ/zSyzDs2@lists.linux.dev
X-Gm-Message-State: APuU4Z96W5jVPfETLtcI/Wxbipb6VR/kIfTXIBNw/UnU4UzOQ/aRpECU
	SRhTiiSPNHXozL48sEpEffVjwcBpywK2kiJxEcvPQ5D8qI2J53En82zzTxm4HKsy
X-Gm-Gg: AZFdTZfPVXcdj1j7qI18zD2OcP7p+Li58vTCl0hFt7PwkATXQmvO4ELeBYv+604a6u6
	zZAOg5CnjKuOQ/YSAAW3ebSHba93Iv+UaSjK8XY6S/spIVcYZIpb6HTIqRe5Rg7XuDN94a5DUyL
	RBboBFRPZJnY0bZpbtcSWUeXIUjk43FkQPNUtpk20D06r5dqbOaxESUcwLpz7DlPGTApm550Oe6
	+Sn0tP+P6UFdzpI4/DdlBcd9h7fmpc97Sf/Olr0tzeejCWxaRgpolsF3t4nYsXvdhj8Fes3MtVZ
	xr4XhvZdD3HB7cE3WgOnClSKuGDqeYI5ryYLC0odt+W8KjXVcga1GUhOMWG7OYLsQZoH5Lm6ApC
	zzfF3n0HQ6UJ77gKeCy99JiNF4304CW5OqrvjlApOGZEhgNErh1p2setUdBKc8M6T9aZZevvdCR
	Izj/jI3Nn4ezYBmoA0/eRpSjAZlOPcCWrtrWr8JURiGryj469QKLpInlM7skKtzAq3tg9uOQQGW
	FYyeWqVa7vjcX06dqdJcdW4VrQKybIt6VAcTvj0Ib1uDtCaHV3Z6IEUkwymg/Q9mdDjRN49anvT
	lYGaq5WzGafiTP3PqjrSJ2UviKvF8sw8BqsAHyhSYa4qYS/GR/uktnsCD+jcrlqGjQuidSFVTfK
	i8vCa8bmA21HS
X-Received: by 2002:a05:6102:6f06:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d7395fe209mr2886039137.27.1795427294346;
        Mon, 23 Nov 2026 01:48:14 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a29csm10872695241.5.2026.11.23.01.48.13
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:48:13 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so605996241.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 01:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGaDuwBasAGErIa9sjid8eSt8Fz9LLDwm0izSKnz73qLaOBkpjY9PjcaYeyTtedKLQ8flWQs7L7g2o0jIEG@lists.linux.dev
X-Received: by 2002:a05:6102:5813:b0:7b2:508e:3d57 with SMTP id
 ada2fe7eead31-7d72b3688c2mr4372703137.4.1795427293752; Mon, 23 Nov 2026
 01:48:13 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121034304.2dPxVKzk-lkp@intel.com> <0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org>
In-Reply-To: <0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Nov 2026 10:48:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
X-Gm-Features: Aa3M54rqU2bNqHYEoVpo9DgHQN7kUDp7nLSe10xRxRC_Yz7fZEF6xyok7yTvw-g
Message-ID: <CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
Subject: Re: include/linux/compiler_types.h:631:45: error: call to
 '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) != sizeof(*u)
To: Finn Thain <fthain@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

CC scsi

On Sat, 21 Nov 2026 at 05:10, Finn Thain <fthain@linux-m68k.org> wrote:
> On Sat, 21 Nov 2026, kernel test robot wrote:
> > FYI, the error/warning still remains.
>
> That's because the qla2xxx maintainers at Marvell did not respond to any
> of the three fixes I sent. I'm not a paying customer so all bets are off.

That's "[PATCH] scsi: qla2xxx: Rework BUILD_BUG_ON() assertion",
first submittted in March, right?
https://lore.kernel.org/all/4808a5dc1a71528ffa3360868561009744277450.1791502886.git.fthain@linux-m68k.org

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
