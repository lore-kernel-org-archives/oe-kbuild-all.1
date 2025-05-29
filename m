Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B72505BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 03:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490914; cv=none; b=RK2uGqYS5GZyMez5K63XVOogoEqOc7enoLKkNaaCc9J0U8uCuWjdZ3bF2CHOExAFqqi6SBIKwaGUkFDDYC42ib7eD+9y6SPkOkHpICXwtLkrjkuvBtA8TY8mV884cDhXRBwUhRAnhDHamyWa8nf5yT+J0/qoqzi3vR5n2Hz3aZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490914; c=relaxed/simple;
	bh=bjf/JLayP19bwsqdRmI9LExctVLA/PfSC/qjpvMxmXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Om8uTBmsHupcJsJ2ifQmt1wZIMEHkZo4tjb2gDnxPsXG1smHAobfBCrwxAuuILxDWHZxrFimu8IrZCMxyBcQKvPrhsN+pK4LCIZKkpCDUblfXjDx0D7FGvPXGcca40qbZxfpkxsiVUfG44xmAQkmFBqHpw4oIqftCefHymVnNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hnJvOwyI; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hnJvOwyI"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC820405FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 03:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1748490902;
	bh=V4vVrDxJRiSVvwJTAsACN8FW8gcbiroxOJCqMNoZKGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hnJvOwyIkjvin+FB0DgEwX15JwTDzmGztxhHSj4mkKDBtMNKQFeKuSc52K+tDO0rQ
	 j2QAq/XTKTuqVkg3cvZcHuWdbRSVUvCjIRb+ylvGnTvwoDa3SomJywoMyPyytxOBA8
	 h2Uh5B6n1AwYZjg3wxsP35VM2c8sbS83aHosUfgmB/4/BYNKYogL/40Ahgzi68xgKl
	 nmeYmi5fmPUZlpPwctBW3MRauA1IxEjvsa7l5mIeJy2fkxR46AGVwgAYF3ID3r3MER
	 LyeDPSOoQx9O8ZadBoO2ed+iY2IUi886FldVTh30IyF7e6LMOZYAn8+G6qKX2Q7Qf+
	 MK4yJr39brg+A==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-601f3f35b88so446487a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 20:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490901; x=1749095701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4vVrDxJRiSVvwJTAsACN8FW8gcbiroxOJCqMNoZKGU=;
        b=gK9sfDDmVA6mGI/1/SI2Ppvm72wHOhjLzGqnKcdqVJpVgFy36ogUTqhDOD7uDcV0cg
         f4u3fu91fXZXor/upmNNIvKj9WDGRhhzxINZ3tAw5FzzQrIMH1maVLjLTTYs2pZi7Qye
         8+BWSYrhhUtkfizjB49X4j7jkpfEFQaGvlvfh7WCRh6CkOSEYwDvPE0J/ov+hH3/S7aX
         XNtDpVUgZEVH8FpbEACe6ymL6+GwMgetLdxNBCQGH3ttAbzQgaYW2XPt/qygkEYA5MjA
         hV/A7hQvbFre+6MvdbGbRzQl95sXWPoCsnpv+ifY3VaHs7ViV/aIswqHklADBuXIunJh
         54rg==
X-Forwarded-Encrypted: i=1; AJvYcCXd4EBLAbPwGds+3Ss7I0zVJA4DH0fOuFnAeD1RBtCUDO0mAwVRr8+tT1Td3uwUEf1gk3G/sCYN4jNJ3fCW@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5Dd5tSjFyjZwtrmqFkB4nF92JJk7q4BA6Sr1vqCibJ+gUgAjW
	tXC9HzNSNRRhZbksgAX0wdsERkECmcmOv3+qj8LwRMFeSVcyjSg6POVppqE0L/LRc42b/mzfjN9
	/B1mYrp/XGJtRmQgYpJgMUIex6Cygu7iNn7q8FmqxDNFDmUjFMTUOXkyrANIXMpWQWimHEMerRk
	o6yfy/THrIl2KCqPT+SIC4Q1bHpLPs4GjjBTMB8WLXW0ZXtFq3eb6vZdt61bVVBmz1zewP
X-Gm-Gg: ASbGncvYHfeRJ5xbfILeT1wuYjTQyGQpeq/sX23nlqLP2VPRYwwhPynW4qxgfPv+6mB
	JtmzJc5tSLro+e/ykYpDbeDgxfrq3MFOSbGBrBHmZnJwl3L/O6su75VnwuQy/B32V3ZlFmQ==
X-Received: by 2002:a05:6402:1d4b:b0:601:3f5b:39ee with SMTP id 4fb4d7f45d1cf-602d8f5d70dmr18033633a12.3.1748490901400;
        Wed, 28 May 2025 20:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR0ej2bZUX3SVv9aAplyxdVXsmtwHM6QDoYTrTihqt5ALCD/GbQf0L7mvCwR+nlHJCc5oIyUGYNq9gu+JSggw=
X-Received: by 2002:a05:6402:1d4b:b0:601:3f5b:39ee with SMTP id
 4fb4d7f45d1cf-602d8f5d70dmr18033620a12.3.1748490901054; Wed, 28 May 2025
 20:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>
 <202505290728.VsNgBfDO-lkp@intel.com>
In-Reply-To: <202505290728.VsNgBfDO-lkp@intel.com>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Thu, 29 May 2025 11:54:49 +0800
X-Gm-Features: AX0GCFuvPqKC8O7DWOhXj72SBZClr0XkXQZTp2dRyjUTIGZ3F1XCKz6JwMpGoeY
Message-ID: <CABscksPBjQ14UrvCVwgVMHZ6NsPKN9tWscaOGBy8TjufgzPGFA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write Disable
To: kernel test robot <lkp@intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, oe-kbuild-all@lists.linux.dev, 
	Guenter Roeck <linux@roeck-us.net>, "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 8:00=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yo-Jung,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 176e917e010cb7dcc605f11d2bc33f304292482b]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin/i2=
c-i801-Do-not-instantiate-spd5118-under-SPD-Write-Disable/20250528-163253
> base:   176e917e010cb7dcc605f11d2bc33f304292482b
> patch link:    https://lore.kernel.org/r/20250528-for-upstream-not-instan=
tiate-spd5118-v1-1-8216e2d38918%40canonical.com
> patch subject: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Wr=
ite Disable
> config: loongarch-randconfig-001-20250529 (https://download.01.org/0day-c=
i/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250529/202505290728.VsNgBfDO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505290728.VsNgBfDO-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/i2c/busses/i2c-i801.c: In function 'i801_notifier_call':
> >> drivers/i2c/busses/i2c-i801.c:1304:9: error: implicit declaration of f=
unction '__i801_register_spd' [-Wimplicit-function-declaration]
>     1304 |         __i801_register_spd(priv);
>          |         ^~~~~~~~~~~~~~~~~~~
>
>
> vim +/__i801_register_spd +1304 drivers/i2c/busses/i2c-i801.c
>
>   1291
>   1292  static int i801_notifier_call(struct notifier_block *nb, unsigned=
 long action,
>   1293                                void *data)
>   1294  {
>   1295          struct i801_priv *priv =3D container_of(nb, struct i801_p=
riv, mux_notifier_block);
>   1296          struct device *dev =3D data;
>   1297
>   1298          if (action !=3D BUS_NOTIFY_ADD_DEVICE ||
>   1299              dev->type !=3D &i2c_adapter_type ||
>   1300              i2c_root_adapter(dev) !=3D &priv->adapter)
>   1301                  return NOTIFY_DONE;
>   1302
>   1303          /* Call i2c_register_spd for muxed child segments */
> > 1304          __i801_register_spd(priv);
>   1305
>   1306          return NOTIFY_OK;
>   1307  }
>   1308

I think this happens likely because I put the __i801_register_spd() inside =
the:

#if defined CONFIG_X86 && defined CONFIG_DMI
...
#endif

So the function went missing in loongarch. Will fix this in v2.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
