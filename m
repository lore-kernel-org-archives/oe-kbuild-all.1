Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE73200C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBiOCAOp"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cc86fcea4fso57481007b3.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701267038; x=1701871838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4YgMwpWk3DM18zVHWXUshQ7Hq2vVbZ+qHKkATPOglw=;
        b=FBiOCAOpsPQ25kdIhd/mt7ye/bX3XCaxEk1baycXve/8BVWw3X73tM0Pdz8q6PdAZg
         DXrSa4qBnaziGiuwkGUD4jg0G7S/ZyAE6RSwpjyc/B5aNpMoFrXG6iDhpEcenQtOxvUY
         AyiT4bFATMMqDB6VlrGpmgakYoeIO9LOIKAdXupmk5PpkGa9kbXRrot/Z5QdV1M2Gzl4
         sZCMzv0f21bn9RSBY9IHQC/DpKLOOuQkmwEw1sufldr10wpUP3sL6dusX+ZuVeTQl4W8
         LGqwQ8sTom/eAVi3YLkvc+P81KewSGGmvTD6PnwmdbaMJZYiqkWLYa/AhOL9tKrGChwT
         SAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701267038; x=1701871838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4YgMwpWk3DM18zVHWXUshQ7Hq2vVbZ+qHKkATPOglw=;
        b=LZt0mChcmJ851eHC9wZVkGTQd210ou403V6W0nYY955f1SjZKAraqz8I9duQtTEF7b
         ALG0YJ6thYXsrYPRCGF4V5H+Wcm8PkzZAuQsl4Ad2Pw3ROvmvNSIL6x9Mg/c8GOWwdZ0
         CwIHx7SEeg4FmZoK2Kkrp/UkWEIsdqGnaZ+cWG6+vcyZus1nQPPUFbGtbyQiAULu2hiX
         qqjowEZi00CJrXCFbX319uDlN9tfconkqu323h1BeBTpICYLie9thyq79bFDd6jNHOFk
         Ro0l0X5emdAauO1PlfRgPMVHtOl13y/QarHLig3GAzfnxGMcwsLzJbPEixnW8AC4g5rt
         jy7A==
X-Gm-Message-State: AOJu0YziPOV0/hBRLiZRi/qLJDls2QBoTZGFkBZtl31HQ5v50Es8uEsr
	rve7K+Iv0njxPP7QSFCG+hf79T1aQIvGAfonDaqrRw==
X-Google-Smtp-Source: AGHT+IFYRZbtLNDuKxAN7bokht3V/01ANp2eTBXMc6bL/P9sgi01OUjcqSjDqOZSFH3dshHDFn84juUVViO24APqGvk=
X-Received: by 2002:a81:9bcc:0:b0:5d0:d517:a8ee with SMTP id
 s195-20020a819bcc000000b005d0d517a8eemr7832100ywg.31.1701267038552; Wed, 29
 Nov 2023 06:10:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
 <202311250548.lUn3bm1A-lkp@intel.com> <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org> <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
 <ZWS90GQTJWA7DrML@smile.fi.intel.com> <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
 <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net> <c7e7b7bedd5b016a29cc86f767cbec533d727ff4.camel@gmail.com>
 <d4a9bd79-1cb6-4da6-9380-bb8085866533@kernel.org>
In-Reply-To: <d4a9bd79-1cb6-4da6-9380-bb8085866533@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 15:10:27 +0100
Message-ID: <CACRpkdaQ0=KduRoSOn+NKNOXvL2HqL_xeCR-LQZWh6CdRMf1Pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>, kernel test robot <lkp@intel.com>, 
	Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 9:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 29/11/2023 09:35, Nuno S=C3=A1 wrote:

> > world. If we are now going to ask to run smatch, cocci, sparse and so o=
n, we will
> > scare even more developers from the community... I mean, the bots are a=
lso in place
>
> This is not related to Linux at all.

Smatch, main author Dan Carpenter
Coccinelle, main author Julia Lawall
Sparse, main author Linus Torvalds

To be fair I think these tools has quite a lot to do with Linux, being deve=
loped
for the kernel as the primary use case, by Linux kernel contributors.

> When you develop any C or C++ code,
> you run these tools. Upstream or downstream, does not matter. Why would
> you not use automated, free and easy tools to detect errors in your
> code? It's just a matter of professional approach to your code.

This I agree with. We just happen to have some especially
talented C developers who write some novel tooling.

(I think developers should be able to rely on robots to run them though,
we all seem to agree on that.)

Yours,
Linus Walleij
