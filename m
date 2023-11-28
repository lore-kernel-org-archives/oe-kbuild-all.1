Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289D35263
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dctSe7LS"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-67a31b64a9aso17812386d6.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701190907; x=1701795707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PqjX8MOTxb1SOKCk/xBi+5E9akrq+S2fSUS82B/9Jw=;
        b=dctSe7LSXyZOBBfieE6O+aikrQj7x182bbDnAYm3un9bE0/3F2Zs+3ShPukTigOjZM
         fonqCtpo1kNaNtyag3giw97O1HASsV7zzEY+Ap15Lgsb1Un/C7uoivKkAE2/Vww5w52O
         HZVKurQa+qMkzytdoRpnwFoL97gtVnB2DMJdycGCiCvTh1QnC4k+LfwYIzzAg0gRoHdS
         L0rwkidLnTO1OAge+lr251F2V83vghTBbPfXXF0usS5gaY3n1OE7c3Stxy7tkRMI9pHz
         VKNeMxyOxRd+Mi+MpfP68XBp2TEG9FHP7UK0abtfpd4LEudHKBm6HNbi0C92WyckEyzk
         3L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190907; x=1701795707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PqjX8MOTxb1SOKCk/xBi+5E9akrq+S2fSUS82B/9Jw=;
        b=hyy9LjHM33f7zafZCEJ3YmWxgQaXrTSOcYkVyK5dZojLnHS16I6fBj3i+5/PajRZ1E
         NsiFXDfqnFCEYWOHD5doFcMJjU5rSbib9kbV8nFkHHAFhd8XnG1KWPVIovi3w1chkgAq
         /tRTx6tEVCo3eKbzUvxGB72PdSYwP8GY9vrsjxXXpvHPDHejM6emQkZRhVWWTyuDec9A
         9Hv4VJJSqZboHTTv5uYg8d7dEmbuqYdmZT1FBkSM8DNmJD4XB98RAfYtMzG/0Es23o3/
         DNb09JIT4zU3Fg7Y8uNrUVtsZJt6Rb3/hAdlXB7KqnuMkNuk/gBktBkL1UQpKdc5dHQt
         KoVg==
X-Gm-Message-State: AOJu0Yya0JMg9I7sCKwOvX0zHL7e8PuzBVEU7Ea9UyRltQ0QWqk4F9pp
	mEtXzGkfahiqftXua+bBBof1wCkpWJoH8Zoy9tA=
X-Google-Smtp-Source: AGHT+IEMZ3vVr6Jl4jSd075/USecySxeDQcTTDwr/o/Vk4iia4tS13RutWkwZH6QfLRK6EpZ7s8lHcNMTPCB4mP0c7o=
X-Received: by 2002:a05:6214:8ea:b0:675:3fed:ed with SMTP id
 dr10-20020a05621408ea00b006753fed00edmr16716189qvb.44.1701190906747; Tue, 28
 Nov 2023 09:01:46 -0800 (PST)
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
In-Reply-To: <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Nov 2023 19:01:10 +0200
Message-ID: <CAHp75VdwiFLBtxm6vpM1dmrw_UTJ6cZSHQ0yQwKD1ngag7JRDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>, 
	kernel test robot <lkp@intel.com>, 
	Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 6:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 27/11/2023 17:03, Andy Shevchenko wrote:
> > On Mon, Nov 27, 2023 at 09:12:14AM +0100, Krzysztof Kozlowski wrote:
> >> On 27/11/2023 09:10, Krzysztof Kozlowski wrote:

...

> >> Wait, this was not even unusual test, just standard compile, which mea=
ns
> >> you did not do basic tests on your end. You must build your new driver
> >> with W=3D1, smatch, sparse and coccinelle before sending upstream.
> >
> > Well, sparse is lagging in development, for the last year it's at least=
 two
> > times it broke kernel builds because of being not ready for the new stu=
ff used
> > in the kernel. Do we have anybody to sync this? I don't think so, hence
> > requiring this from developer is doubtful. Otherwise I agree, that basi=
c
> > compilation with GCC/LLVM must be done.
>
> Sparse still detects several issues and handles lock annotations, so it
> is useful.

Absolutely.

> But if you disagree with that part, I still insist on Smatch
> (which is actively developed and works great) and Coccinelle (also
> actively developed).

No disagreement on the usefulness of the sparse, my point is that its
development is lagging and hence diminishes the value of the tool to
the developer.

--=20
With Best Regards,
Andy Shevchenko
