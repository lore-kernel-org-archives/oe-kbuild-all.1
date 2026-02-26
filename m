Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2448F1DF74F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091431; cv=pass; b=pTkFWj0fPPRUNAO8L4UE5z67fDN66zTTHKKXtkNviKMn57oVzVoVKnmuEn7sqM21YBsUOkH4mBvjLEWWfw2M/HXhvd2zlOeZn5M4A9AKJP84sHZWlGScnDyfP6wGZ+KGn5cBz93axmnnxA9TyvDFqkywn59TkHNd+0jbiqv5h70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091431; c=relaxed/simple;
	bh=zMMoC9tW+ovG5gEv/EikKuLCdiFcENkonHNXGvJwtY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIIXOWOCFr0k2u2mwcAcmLrXCEBisAEVb7njGOOq6zBxONFU+dy7vgviYNY1oygiWtuvka+1noPZQ0/Sn3bbg4FJ2RNzAaElyWP52tqfVLRHM+dxELU1qItZ29mnZEWsNsHkv5pW2Vh3868WrbWUvEhG48xvhEWWMlDZOKP8BKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=CTOGHxJ4; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="CTOGHxJ4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b904e1cd038so68719966b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 23:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772091428; cv=none;
        d=google.com; s=arc-20240605;
        b=HBkYKDHG9e8AtVq6KTv0F+ByJw1DNMwLjrCabplpRXGF02fSe6Y6rWxz7ribonXnHe
         7hYILvA7Nzj5oFhgyxTIlDUiS8Ww5tE63wMy2NTSHe31RqiZSIeVc2eneruI10sgJUwq
         5DxuO+BLCNPZbiFxnRc+aWrgV0iV88tcUd9i1dP513zteGMUvE5OUhIFBg/WXbUF+NPV
         51xFTo9kO6QgRzToz+w6E6+DJQpH1rGpJBP39U8fuFrz5XoaDGwqpylD2QUvp7O4mhCZ
         SiVF2EC1aQLDlyxNexFMVtHzZ864DGmEGmP34Vu7of3NDrd2exaObnXjyR/qefnS6WAR
         KROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sy5pSpIT1+34GDUf2p6GIfTrx9hUeuZulWhjNSVORZ0=;
        fh=uRR47Fksh1pzfwdqfC6b9pOfnC5lXAmBSR6kg6fkKoE=;
        b=A8Dk18BOtym7aqaLOE7khWiahaK05/reD8FPt4anM+Om+CmOlrBImD/oR2wJcUXX2f
         2NfhocCeqUnF6bJnA2P/brUKUtZlgOhyswAQ6ysBe1wx0KggBygyVw0JaoOnTdzM9lRZ
         ogb3XACVPFq3K0QWflNt4KfaNcDo0+xDbZPC3M3ayYA+EgAZOZSn0X92rfS60NoF9Q0e
         cRDriuoAkNOPNDY6aL+FbdyWfeYaFkp0Nzlv8k90CYnxV9969E+pRG78NrtzahLPwIOj
         0e/1Bo3LV9Ff9BMEUf7rBkmx/ui9YM95zVmHuFMOFx/T9ULDm43iAezNZWfa61IMcKFE
         QZOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772091428; x=1772696228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy5pSpIT1+34GDUf2p6GIfTrx9hUeuZulWhjNSVORZ0=;
        b=CTOGHxJ45PZEPcPG6rrMz9YcTo685zyt02xc8RzdvvWCeXpgFaLZt64zBTBvraowR0
         dQ2NNJ4ucB1lVz1hu4EAXUu8+sY/2tZp7dXDNe4o5OToNUg41rE61jyDSaWU0CWzq9r7
         8pIe721mbVVKWLXJYhkAMlwMQbMwisuDdK72CPNyKGxwaTJXpRwhGqJ/7kW7/Eah0L8t
         RJAFo3u9vWNtYr286vICm4Fu+kQrMov0PKVrcqnWrRtwt1dhbWAN2NwF03eoMYy6qJOQ
         GXeubBKaUzzRyqRCB8Tbgn/1o2GzkyoK7thnNElkFqtnLEeNOtVs+9m97WV7kBkxs0wS
         bQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772091428; x=1772696228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sy5pSpIT1+34GDUf2p6GIfTrx9hUeuZulWhjNSVORZ0=;
        b=HUnh0n4h/Q8O2tvuJans4O49hEVu53A2WT4D+7h6e9jrqxMxKbScJ+bHI8D+9LVTHJ
         yyq0zl2NVpsW1btyRYssP2HU4luxIU5RNmGcdNyWx/1jOB1S6EsBR98Wf4QePA1qVqgP
         NLxYLvtqpbK6C7QsqGZIGadR5dZA/hSS0vtHCw2yYqTPjSReWwvOdI/IThGEoXbkHu5g
         eUnoPtPRVqAxDqi+x/XZznDmZRujEOvOtbd0SNkkznz/2o6G0mQq5EUL3o4Pa0Ag6Woq
         ucEprdAxSrpT6Z5lNUN0oNBkQYOTJQzpWr7fst3S1Uh8BSz+fXU6mj1Lse8S//0w58MH
         ClPA==
X-Forwarded-Encrypted: i=1; AJvYcCVlgmZHzxFlPGxikXBnl/tsSgGac47ZM4H8c4vyDzGKIgvGtdJWCqik6tsgAG4skxFv9PR1eG4A81/bDBe9@lists.linux.dev
X-Gm-Message-State: AOJu0YyQtOjZG0LkkzJ06vX9v5jFbph83qKGOFtWBDGXIqZeTQm45dte
	Ph7vv6TuOo1HoVrEFTVnh+B3EiajeL18MqzK2rqIvPTj9m7aDNf77Y6pYlJ6mkngtZTFSejtAfe
	egGCR388XDck9Hy0StvSRZn+gBqrgUbsl3NwtrQx+xA==
X-Gm-Gg: ATEYQzwrCjd8KKUqaiYFMBdFc+6XSQneaz1E2Bip9PZ8eQmbCYKpt7KAcc0s+DQKrhq
	0mJxA5Q5NQLeB9b5qV3I9Vqc8RkL8UYTsWE1h3ub7xE2lwJqWJoZKMoMKiPFD5r2FcUngx7JS89
	XjvhIUCiwzOUmueenCSeE8SB3rTRrO0NdeeSXh8TSQV4ARFrpbRYrr0N6/ChZDd2BkkEDX0C8n3
	tAAL47jA7SZSBBFdlk2K+1EhI/MYVh0KL8hj1DRVash2VXgZS5liLtK5cNJh3hSiWoepUSicdDA
	OawCpg==
X-Received: by 2002:a17:907:1b10:b0:b90:bc06:2abf with SMTP id
 a640c23a62f3a-b9351492d3bmr217956066b.4.1772091428009; Wed, 25 Feb 2026
 23:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225-ina4230-v1-2-92b1de981d46@flipper.net> <202602260418.XKPUlQmZ-lkp@intel.com>
In-Reply-To: <202602260418.XKPUlQmZ-lkp@intel.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Feb 2026 11:36:58 +0400
X-Gm-Features: AaiRm523uaAkpoMIzz0BIKHXKFT4QsucGv2thoPccSpDCoItrF8k9Gyi_Md5Wd0
Message-ID: <CAKTNdwEoHEKeRGvz=XoMT1RON3ud4rMrUW2oY0M5Uhx2z_gyCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Add support for TI INA4230 power monitor
To: kernel test robot <lkp@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:33=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-hwmon-Add-DT-schema-for-TI-INA4230/20260225-173657
> base:   3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
> patch link:    https://lore.kernel.org/r/20260225-ina4230-v1-2-92b1de981d=
46%40flipper.net
> patch subject: [PATCH 2/2] hwmon: Add support for TI INA4230 power monito=
r
> config: arm-allyesconfig (https://download.01.org/0day-ci/archive/2026022=
6/202602260418.XKPUlQmZ-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260226/202602260418.XKPUlQmZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602260418.XKPUlQmZ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arm-linux-gnueabi-ld: drivers/hwmon/ina4230.o: in function `ina4230_se=
t_calibration':
> >> ina4230.c:(.text.ina4230_set_calibration+0x584): undefined reference t=
o `__aeabi_uldivmod'

Alright, I'm spoiled by AArch64. Thanks bot, I'll rework this part in
v2 to avoid the 64-bit division.

Best regards,
Alexey
