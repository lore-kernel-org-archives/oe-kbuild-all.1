Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794667515;
	b=q5HDjySQpMTvWC2jkgDBJo6pYTA/V/KYwvWdrvqhQOMkgVMJKDQJSb8t0g2RrVLLnv94
	 5n4sg1u16XFEz7ewyhdQFgByccZ6n4gy122UO+w1qmJ0lRKmCuyvXOwX0ACRUOjwSFSfL
	 rhFsn1KLvRXqdb4srKaFfu0Yxj9Qaq6NGUZwDi+EIKHYnjctyMigad8XHlt96y0uc285+
	 ZECWx5eBgn+G79+F0WhyHb7LaAbUSi8uhxxoaxRgN7y/FzKH6ey8ZviduVsD8rUnyG6ij
	 Si3NQDnXrVea4fRWNPQcUYIRIIxzvaOkeUMOAKZ1DPhrrjzRpdD16NTAEffBBNEma7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667515;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
	b=ZYiMVSg3IbTzQkSUN7sB95ebhcem/W2NP1gWttKjH9/YbSr2GdjmhaLwe2WS51DiESSr
	 ZJsTw2lFdOvOsCQc7WND/GD0CjFDvrMzMi+qwytY6iXJEuDjIR12QIgBEz4kuE9JrXJgj
	 LYY2edlSo5/MGhJiowGVnHNbV2AHjKb1FbiyDJyxmOebfrNuAdtdezpPkKAj30/1xGC/3
	 jeJzRplQ2N7DrONg7OC24GQUhxZo33Y9jEcrdNSVmy2lq3o1ltFP4Jb87lcf+2A6SgBey
	 UcR4HTBi+cxZcdBni94XbB7hByoS5v3Dr0y5jvASaZNkSdI/EOMW9hOQyDboLMSkcnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=va9T2o08;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A6606A334
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 14:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2A6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=va9T2o08
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so3419679eec.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 06:45:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794667514; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdDzl8pZAbq6MueDmqXG81iToNeaQjhLzAWLEs6dMuqDOh6EnZFTZAKZnBwbPlFKlj
         kVCWAzGWan47a6T+l6iPmhkHhWYc5LUBhifigrvCZd702WMsh0pkWgXb5PblwPSRiKNE
         rguDi2T5LlSITPxHHutIrVcVQjYUZ5tvErIuM7Aq5boQJkErepd/U5IaMCuu6CB+U4z4
         4D9j39CSr+XUmZ3LwJCs0jUeCRrREEvbwL61HAu1D0CIulwBRkItELimXAgVCr8RsGl9
         u7CNkhOVWvcnJD+4EMdXKWLlaUFbNxLCWK0JpZoRt7VHXZ+Q4tgWyp0VVCQ7N0us1aMq
         XivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        fh=NKkb8uJ5tJsN615kyQHhOcA0Bh1R2CSbRIMCVrou2hk=;
        b=Q80xD98jvaCfSc1+/0CMCuNzf+bGHtdY97YYlHQqaZU6vNM9Vmtos6/hJ43v2vFYoo
         Qd7APM9qbGh7AFgJ1SLM0OnBHdVUPdLHJ+q3oYsZAT6PjJfknNvbOgTiUy3I/O5gucAW
         3WNrL6L17iGgXZm6CGVK9vjf7wmzZwkcufFb28jU63yxOIZ2oSjN5vKdqXiP1eyTN6Rf
         ab1KxZLH7HKw0kOUBd46POzG9nlcJyelJubvKYZHFBvIzz+BM9nJaK14iNS0L6i8dhqB
         oYmuZUoMyOXKiIPGqESUUuunhE6Y3xHkyyTHG0CrGeV9NrgCWinOWWHUY6ujCLXxrR2G
         br5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667514; x=1795272314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        b=va9T2o08+GDgwGVFU2w/u/xT/nlOHNa4VQj1jJ7/rHfLjgzd56G6+5W+rC9xBPF5xE
         +bx/NXQMIjqk1eUUyEA1OfgyTCRvClHpc99zdDVZiqYbCgDyS+fCD2oBu+SNqq9BV3CI
         rcKAKActhSckRQwWq6ZLaAZ7RlOUnU8q+k1oMp6aztlAt19+M5yhACsd/HbUf5HHwexn
         UXJcgqatiQZ/F8GHJimJv45Hl3NzgCD7h8XeYRq5RC5a9B4l+NPgoaDsCn5gLlIUs3yg
         jWkpTzAKXadjpp8f8QX7G/vW+bPnlb+iPRRkTzCpCUFeCVPrzG5uaafhBDW/Qow7c1zK
         KNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667514; x=1795272314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpGxYuoYKOxkEJjh9D2Ng2/n10DyVBs0agON6KJxSRQ=;
        b=vvJNti5D+0MdaVjn2p53z2Jb2Mt6R6llosOyWMftWG4kO1ZBGyxGiNuprxQRFwgqCb
         64034TbsYn/qq6XjqywvlQTlGqx5K9LJKBexeEl1T9nZA+2I2q438UnJ4p2RXzIhhGjW
         iw9OcSuL1BEv/O7ndP0T3UbcKAWJypTvWaw+29kgUcfZjDwneZGf+UTSAkgOMOMwkFRR
         oB5/jAGNJDwTtEesm6//TnKgAtNOkjRzWI72T5IOSF/IT7Sp930j3Nj2VHJtWIr+gnHV
         8daJeIthQJeqHK19qNR6jKnXiC9/AIRqQQDoFtbWzMpVQ1t9g7P4qxvsMbwwLjeQ648G
         RwnA==
X-Forwarded-Encrypted: i=1; AL+hErGohUQD8UGuhu4L0J7tmJ5GwgUAYKQI9hyPZPQIlI952FM/s4ZhKfviLgCOW2wWgsm9JV1aLTgLvtVWeFEW@lists.linux.dev
X-Gm-Message-State: APuU4Z+cx0YI0AQcvcFypmH7vAztlGoBWEPUaJuBlYxyt9u182nOKtxX
	3ja/S/KJ/RORJDMEGILnMf60BHty+Eua5EFUKqguyQF/CanVHkuK1/KBOGXzczkkHtDbBXvspb0
	AQ7V2uW1tXJ5n60vskC6wR70loAUXU6E=
X-Gm-Gg: AYBFou0Fi/phMaCkW5Vz4krjog82duzTGwO0XhEl7GRzIjxE8nWgLIr2tBXwb6eT0/L
	h4/MybxpGnr0SC0VS39ArotCDHApJ8Pa5s/qdhepJitkArzF6zVYzNMTe6H3vA+q/AZfx77A96I
	ok7IbE2Z1unILtesAprDnyhmuvzH7nQk/Dl6wmOU1l/r/q5AtKsTrcWgj0CL6UJ/+jIFiQ6/QLX
	BqaGmENUiB3aKmXsNjF7gmOZ2kt3vrhj9s/zMHUsUa6nAparOYIxFsSQIF8Xrtw1cq+kY7QZbhZ
	lKS4Ga7v/L3hIuWLioRXB1IxIS4UjYW+tpEDS4Cr3gap/Wttr4wGZhgFyxDWEBSt5ed7Pyr4QGW
	RWHQfUr2BaHLs/66Tr7d3brCVhdGcECSHwaGIoyON9OyJQ9bRW3o/LddOgLiKRLA0vGN+3U6CCY
	ccGlJk5w5g8oLDqRYRm8r5NssNzliBGQ==
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id
 5a478bee46e88-377e093db88mr8125743eec.4.1794667514069; Sat, 14 Nov 2026
 06:45:14 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108094253.83899-5-clamor95@gmail.com> <202611090518.mm6yt2nO-lkp@intel.com>
 <avInQ08dVrsc-Rbo@ashevche-desk.local> <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
In-Reply-To: <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 14 Nov 2026 16:45:02 +0200
X-Gm-Features: AclHuK9Q2MT7WzTqFgmyb8uGWfov9bVv3FDtVPr7EAhs0HUduJChL9YtHwu65_c
Message-ID: <CAPVz0n1UG6L8divtcXgg7mfS7C3bO9tKv9d-Xh6VbyayG7p8-w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>
Cc: kernel test robot <lkp@intel.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, 
	oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:07=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:=
04 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon, Nov 09, 2026 at 05:48:09AM +0800, kernel test robot wrote:
> > >
> > > kernel test robot noticed the following build errors:
> >
> > ...
> >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > WARNING: modpost: vmlinux: section mismatch in reference: trace_initc=
all_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: =
.init.data)
> > > WARNING: modpost: vmlinux: section mismatch in reference: __arch_xpro=
d_64+0xac (section: .text.unlikely) -> initcall_level_names (section: .init=
.data)
> > > >> ERROR: modpost: drivers/iio/light/ltr501.ko: symbol 'iio_find_chan=
nel_from_si' undefined!
> >
> > Forgot to import namespace?
> >
>
> It is not exported in the core
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/iio/industrialio-core.c?h=3Dnext-20261109#n319
>

Should I export it? Do you have any suggestions?

> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
