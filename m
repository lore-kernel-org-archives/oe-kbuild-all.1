Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766176;
	b=Cgujg0bGco/LkF2dr75DiOqwO+GgJvCaz+GseyRN4LU2sFw5B9nmJ9V5sMyVLJTUeaLn
	 fKjsTjX7w0CduImj5PDWw7fjV9zPd9OaqxHZNCHm0qC/yrDv8/D8q806J3pTemBrggGcU
	 9T+ONRizXCotG734CowNzsl0FikurFFta2JYPmS5WjIlrhrIxKfqWyTlwRl2SH+uMYmHF
	 TtuSPfXE0NK6OoGvs07UdE7QvaDradcTSbBlaAtf7UHCXz72lm8A9Cen3OHP4vAlBndXs
	 UKIMxoOI2m4a8PROGML/Z5gKbo/FyL8w97l+nWVXCjW6vpkXP2h1ErjcuWYY2SognIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+1moggd1iRJXchYi3IM1BXadcDP2xscjRLIrFEHuwYA=;
	b=vPKRMSpxOUPT+Vcp3Z6EZEIjGu9FSVK/wklVkq/2sPkkiIjHZvEmWFFNO+5/3z7BN/FL
	 mVIIqcznHrGUbqFQBah8CVHT3d20p976Y1/t89yKT2PSM4elyrQpSPJIsgLXKRLJGI9NJ
	 WitFSnROBKJE52XpPy08ru0XusXypDk8pwoONexihJFeNg4uy1sCFI7suztl4tESUDVYf
	 oiY8HoaV6fvV+xbhvcEbcebtHxrOy71YTQRIm5F2+ynZxgkkgoCC5IgC74K5rcv8RqCOL
	 asH6SPmv41WjGwPe6fu91GQy0Sno6+jfjnfU7HayLQlxxpVWP4TY0JGyMOwsFNrqMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FF2ZM7Xj;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF74606A337
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 07:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF74606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FF2ZM7Xj
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04e3bf46dso57512725ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 23:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766176; x=1796370976; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1moggd1iRJXchYi3IM1BXadcDP2xscjRLIrFEHuwYA=;
        b=FF2ZM7Xjzdsp+zbwEh9YRtM5YHz9ba7KbliulwALAG+Iss/7bD3aD3vQETuqK+qoM0
         gtXvnnltI+gD3Kp8e4Y1wZcwe/hq+suQoYyx+Za+neohTACcEbLQXhGsLoTSWzD9UUdE
         oc/eUkjUf4z7g24QhzdssP69q3x21+PKOuCAO7M6wRhPWFxb9jfDFQutsDqSgyHbZq+I
         6scEct2/rNI42VvkvmpbUPcdl37H9omzGxWRZ9PPrI24JSRYTgpMSsqe93OHPaC6f3l+
         Lbnqo0wyaSsxY6PdBhCnIjbbQ72FGosRd09JKbnnzcRxZdLaRqYyJk2gmpBTX0TDS0XT
         D+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766176; x=1796370976;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1moggd1iRJXchYi3IM1BXadcDP2xscjRLIrFEHuwYA=;
        b=xifuz8H7Im2nIJ7ZyafK5cNrniI7DXA0TKEDSTDAXIzK58Gc00DaJWd32LWjGgU9Pc
         dDSlyb1JyyFgvllkdYEq7GGv5M+0QezBv6wCAjsb/vek88Lm2wuV8KU3d19qa6FNi6ac
         Eix41A0BPBELHKRptFI76jGWhEDAc3ekAuz/8qDmmh0XJyDsOVuv/ZkzqTcWb7HrIxmR
         mKVGsTkEzAHv68YaSN4/q5Fi6GHeNQ1OttHuGC7UIQ5N5jZTHfyb4RolyDHS+2jA1XdB
         HAxkohb+AUuCAqnw6QUKwj2QWZzdUqx+S8nv/T64rPsfl7RnPhqs7BpQ/DoYwnmEgX4f
         Hllg==
X-Forwarded-Encrypted: i=1; AL+hErGJ/4yoH0cs413lESfMi2TveWMMx+8NaVwJDNYPHTI/XqLVPNCtXeHBIeYihg5wrabkf1E+EVtNkhiktI0S@lists.linux.dev
X-Gm-Message-State: APuU4Z/M+dTDrVoFzp20qAaGmK0bOstNOs6RPdj49Z06PRtNwCCwrcgj
	5de8SEvwdwZmJKaLdUKObrsYDW+RoO1kIZZi844jOHZMYrY4/0yMBBKG
X-Gm-Gg: AZFdTZe8SSvDXEtkvGombjZB9+oKbjiP46jin38KInBRpjip7PwAc5bBm/1H6ExHYod
	e8RzVuKU8NX0VKbTEK8jJnQglx1P55XOvpqLuA8kCIs0WOPfT2nGUp68z9o7/T3uN7cupEYXSWQ
	zIp0U29rqCvJwqpfQtbBALllbBDTi2pEqU+j19DvgqYEsMM3aFUCxZ/37vaHDlMjTGysmemvGv9
	HTEq9mtDQdYyOI9xdyJgdLcnNV+BH3GykiRjb07WqYis3xJYCtcZjOulhT7YFw+ia2dLc4nsGEJ
	ys5ZMSHn46VzMDRbFXoZ1VI3mHty44nR+RxSBaGZM6EvaQ+xKMrij2vEj4CEgA5ZrSH2Gk4HnHg
	Xdgno69FoNfjutv4LHVuLocgoUzu7P3KH6jydehS3qu/exdPJEdLCZWQH1w1AhrhO7POfT2M3wb
	j7dLFxhK6YGkMdVOPhEAFE7i+kAplYW7YGS7RJ4Btq4to19V30PGidgFCt8+/GALxjVmY5HdWHx
	uK45Q4gQBcSHqtmOlnJ+3LIJK9qnYapUwpXB9l2X2dyF0dnS1xR64bN7oGSOL8jUGypcGyTRQxF
	pXAJQR3F9GLD+7ev4Z0asBi2sqXrrx5MOlc0r2mm1oPZ2A/hTA3pU316lrfU56L3ptdbuYs5VcQ
	GMq/yBkAYvhG+EBoMcNZfjv6IB3OyeJXCxMyYvZH3zpNV
X-Received: by 2002:a17:903:4586:b0:2ed:fd82:e905 with SMTP id d9443c01a7336-2f03f207db7mr255674895ad.31.1795766175642;
        Thu, 26 Nov 2026 23:56:15 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc4f2sm118968555ad.30.2026.11.26.23.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:56:15 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Dan Carpenter <dan@pereq.eu>
Cc: Dan Carpenter <error27@gmail.com>, Mark Brown <broonie@kernel.org>,
 oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.
Date: Fri, 27 Nov 2026 15:56:10 +0800
Message-ID: <179576617048.3953440.16752646728304372112@gmail.com>
In-Reply-To: <awkf4CNhSPz-lcEk@stanley.mountain>
References: <20261125184601.R647t8Sj-lkp@intel.com>
 <179567739729.2548149.711673218230357357@gmail.com>
 <awkf4CNhSPz-lcEk@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Dan,

Thanks for pulling the tree and taking a closer look. You're right that
the state flags and split error cleanup make this harder to follow.

One catch with tracking ocp_hw_enabled only in setup_ocp_irq(): the OCP
ISR disables the hardware interrupt and ocp_recovery_work re-enables it
later, so a flag maintained only there would go out of sync.

The regmap writes can fail, and an error doesn't necessarily tell us
what state the hardware was left in. I'll look at moving the failure
cleanup into qcom_labibb_ocp_hw_enable() and whether IRQF_NO_AUTOEN
would allow the initial IRQ setup to unwind locally, without breaking
the recovery and retry paths.

If I can verify a simpler and safer error path, I'll send a focused
follow-up patch rather than reworking all the state tracking at once.

Thanks,
Yaohan
