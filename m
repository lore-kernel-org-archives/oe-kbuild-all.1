Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792431855;
	b=qiI8Ft/x4xzkP0IDcoMLuDU8v9uLQFABIt33Q+DWmf8/pnJgJju9EW7xBkX/ud99sy+S
	 l/0/3K9hfSNImC7Qr4pPjJASzPM4SWLYDZwlY9fQjjkt/4/NrJPP6eoRU6xe8b73sQ3yC
	 qzEvSJk1pIuPS1VymqpFq2r/fxwwKSPO5sd/J5iVsbf+AXHfO4vOx9WFMyb3RtvwhfuzT
	 ZQMwqEDYjQ033/9dG2KTLHV6DeXJ1BgV7UUsBHA/0PhZv8ioAeWz84PgMtTM9Myy3s3a8
	 tyHNIaujFZemF8THuiGxtlZ/OdqAUj9BfZIAt2rDiZKmoa/Z9l+U4Igh17NEJdGYwZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792431855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:User-Agent:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+x4XGLGWws4qU2+ljM6zYDkaB+j4Wc1XJmCnn2agD6k=;
	b=hVcem8aOigikAgGdPeWaQmD6GLvoBUSl1BbO3iWUO1vKbckdREFdzo+V680cMqd7J+w6
	 k+6N3rfTcCDMSn9KRb2E5ki/nJS6OG//+ylr6sHfXozY62p9RMMgWQdSBCtFgvItvb/do
	 QF3eJTyV6Ypg4mNUF8EcDT6YFQf5VegsouLgt4qcT2jvzgqGVlIMfDy4389oo/wONOljF
	 osYDuBGsT+wqw8dWK5bv73F6lKHVMjPq9YGo2byRr3k7K0m5L8rlALTI4GClSPnnNxrYi
	 Zm2F54iqjNAomD9xvvmheye8glyuuAvftiiJMEl85igaNaxfuonJN5b6tI3JU9jSy4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwzP7CcG;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF7606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 17:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwzP7CcG
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dc202a60eso567764f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792431853; x=1793036653; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:in-reply-to:references:from:subject:cc:to:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+x4XGLGWws4qU2+ljM6zYDkaB+j4Wc1XJmCnn2agD6k=;
        b=fwzP7CcGZle+FdB6lDCDxAkHf4HdwrdxG2eOZCeD9LbBm6yAK1BY7kFAcHDv7ckJwj
         p575fuYW76Ms17PsnOBqQ0wE2QBPH1QtUnGC+TJdINTGFFw36CGJXqTcd3AbFPPYKx3r
         1wzXGRLgPzD08iqo3XhN9cqlT8NRFee2d1ZvmIqdzhyCbTdaZT796bPjLekSFbomohH1
         KpqpKlLUwFxmHQibNf1n80SHVndkLlfsHTMEM8vRbowO8bA6XqWIjn/fhsnHAxI/Oxc1
         fqJXYlMHXAITN0tEQ6I3kkxH0i6DC29Q18gg18LqokA4zPlbdLhMsK4UGYjYXGd5AbPm
         fiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792431853; x=1793036653;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+x4XGLGWws4qU2+ljM6zYDkaB+j4Wc1XJmCnn2agD6k=;
        b=AGgejhpS44KCTE2v7ueKVPurNnFYKnWsaJNvY5aftK2E04901/VgsV1YEHbRfwpnWx
         GroxN7xpgsKmquh8Jg3EKD9V3/6Ccex03Q4JQabACSroVSi/l4V2AfLFj7Ke6b7oMMEr
         bjmVudZzHtmTkgt65PxjC5vvZdyPDPlOEkIZk9Xw35iHiZhnuFm5N/K5HEPuJYusfaUp
         ET0wT2kG1H5jB5lGAEq1y6hciA7wrBXI6uldrvrhaxX9lMjB2WdIhRBG8PhMyB5nTGdS
         ZQ0LCmwazGDHxuPNw5RaZ3hQZf9hGAmsWLnsDXqyMgL27HfOSIonbExWfSO+mFQCA8+r
         T1zg==
X-Forwarded-Encrypted: i=1; AKwUvBwq4+/eQcUx4XUjV7Z+S4AafDtkm3jAoA6gUXLpOYtN05izNLYcY8+Rrdta7fdTpUAbCRYCX+7lhN++fL4x@lists.linux.dev
X-Gm-Message-State: AFq9FYJiamcP308Ei2kNuxbr/B+nX79UrcXnJa6egthCtsKjieQGHqyO
	XtwOZpIzD3dlzjx1DIlKb3dNTClzzUY3ev5GRoAcLXPfCzxNfb2zOjVCH/LIXA==
X-Gm-Gg: AYBFou1eWmOEAfbvbC/CZby2veWNYypohNZ+trjqJzrsQPZzuW1/o1D3WvlBINNSKd5
	5I1q5Hu7B140G+MMKOdqcy1zQucuxvXmTikZP7xi1jOCCtup97zA99+BJdMSgZfJv9nOBuc2TjN
	G2ukfxDl48M6NrzDsDmjh7cVZRhe1bET5Qe8d2i7Bx7etBJq373ga+mczsxuY7xh5xLwFdmksi0
	gpOHvnC0IsMkaoGI9IMaR4Kz+z0s5C6wWvEmI1dkK2GUnQ1EK6qz2ipvgGXdrvQqMxQg+xIuwrX
	X97fIovZtG7I9RtHVzyD23hN5q4X0G/QxTasG7qmEV8I//p0nkNRo3hMmwCOQrz2P2ErVGz8bOJ
	z4GkHbZAiJtu47LJgmDLomUNlCmTTBA4JARitpBjvA5RErC+sZoARTK3+qIm3lDtFFiLfUPPr6/
	ZaAb3rsfz0S3mkHzNuGkJ2XsTahPe3UHg4RWXEAq6wKkdJqZ4Fc8W5u4lGP7LPfJeNeS4bRceX
X-Received: by 2002:a05:6000:430a:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-48e07bbca55mr17668410f8f.23.1792431853127;
        Mon, 19 Oct 2026 10:44:13 -0700 (PDT)
Received: from localhost ([81.6.39.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dd2a2sm413280f8f.7.2026.10.19.10.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:44:12 -0700 (PDT)
Date: Mon, 19 Oct 2026 19:44:12 +0200
To: Jiri Kosina <jikos@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Vicki Pfau <vi@endrift.com>,
 oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: introduce dependency in USB_HID
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <202610171559.gZ0QBMFv-lkp@intel.com>
 <3HN3VLNWTGRM8.2HVANQO7V2MPM@homearch.localdomain>
 <8q2ss5so-r679-247p-o8q3-pror0844p3nr@xreary.bet>
 <224MMXDV49Y20.3OGRUP8M1CBFH@homearch.localdomain>
 <999rr212-sp54-sr2n-6pp7-rq9o69463677@xreary.bet>
 <2qs9085o-r962-r57s-16r0-4rp34o81726q@xreary.bet>
In-Reply-To: <2qs9085o-r962-r57s-16r0-4rp34o81726q@xreary.bet>
Message-Id: <2SHWV2E59YE9P.3GRUK9VZ1YHPZ@homearch.localdomain>
User-Agent: mblaze/1.4-3-ga04b747 (2026-07-03)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jiri Kosina <jikos@kernel.org> wrote:
> From: Jiri Kosina <jkosina@suse.com>
>=20
> hid-nintendo does depend on USB_HID. Reflect that in Kconfig.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610171559.gZ0QBMFv-lkp@i=
ntel.com/
> Signed-off-by: Jiri Kosina <jkosina@suse.com>
> ---
>  drivers/hid/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

LGTM!

Thanks for the fix.


Cheers,
Silvan

>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index f06263ddfbfe..f88ec97f3976 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -867,6 +867,7 @@ config HID_NINTENDO
>  	tristate "Nintendo Joy-Con, NSO, and Pro Controller support"
>  	depends on NEW_LEDS
>  	depends on LEDS_CLASS
> +	depends on USB_HID
>  	select POWER_SUPPLY
>  	help
>  	Adds support for the Nintendo Switch Joy-Cons, NSO, Pro Controller, as


