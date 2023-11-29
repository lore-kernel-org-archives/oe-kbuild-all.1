Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B7C2D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7q16iB6"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-544455a4b56so8890579a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 06:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701268197; x=1701872997; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qdoeeagOYLK4qbp2jjR1vPFPXFdVKef/9E1TVuVg+ZA=;
        b=B7q16iB6is11wkqHJ02qdUVH7/qjiGhcCIzmMLZBNFh3YL9NVMvsXEgni218NQxGAY
         LWKNOpXKYQdcc9akzVv+X7Ux7Z8enUxkfxPyox/KxwHGSYt9oR9k+BXF9M47ErZ3Tlly
         s+Rtk99mCcF/iw4HlmjLwIHdkp18BwPgxhb7JBAUiH1k+D0Ol4W8Kyu59PqQ3FzSQfM4
         I7OliplzE6r5plUhlzLq61bau/93ZKRsNtsqqGiv9rZiLnuvlVe0b0SROLf/QqvDXC8O
         ih+noR/o1R8c/e+ufLATIzR5MV/9WFQQ4+bN1eLqeaMEmF5+gZLs9OiJfrz1afPrR4gl
         fI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701268197; x=1701872997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdoeeagOYLK4qbp2jjR1vPFPXFdVKef/9E1TVuVg+ZA=;
        b=KWDzjOb28jDBqfvRZlbJELjGRifIEq7kcaZEM1D+kVMSHtMYsfJIVPyI10KRVJ5kfl
         6HE6j2PWNUHNdfNY5WsaqvT8rYF0bL+fZSOpI8xb5dbexheOvIVEv38LeWOPn0pWKikD
         oAbVVFom7+IVSvY3r+b2nkJTkB6DaFdW6TpuPzHVg9UEvI2UWOgHbS8hFNpaXwd4j6YH
         S3K/Bl8hBl7IiRaydSDyeztJZn21dvY4hZSK7NVyCPICAJZm66FyRyAbWqxuUpKXLlVE
         HDmf/UCsDEhi9Y5q/UDQBsREjlb3OnXvI34ZZuWqNm0NbtbUPuUD2VSDOKAPtzlzJiF/
         yYcQ==
X-Gm-Message-State: AOJu0YxX9eu4rHjlqY8/YbR63IkIRDQtWypPOK2W/vY2sI31c+zZnNFZ
	Nilkzv6ldt9UPY98MzU4aBA=
X-Google-Smtp-Source: AGHT+IF7cSLiOMTqE7T/VaCVfadmrV+/UtvqeemRHybJucvE20WQtPfgxrR7eCoAIrjjylrYew9etA==
X-Received: by 2002:a05:6402:278e:b0:54a:f041:17d2 with SMTP id b14-20020a056402278e00b0054af04117d2mr14173200ede.35.1701268196697;
        Wed, 29 Nov 2023 06:29:56 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id da7-20020a056402176700b0054afe3625a9sm6119108edb.43.2023.11.29.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 06:29:56 -0800 (PST)
Message-ID: <5fbcaa21840c509c22024c8383dfe3e4ffbcc635.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Andy Shevchenko <andy@kernel.org>, 
 kernel test robot <lkp@intel.com>, Nuno Sa via B4 Relay
 <devnull+nuno.sa.analog.com@kernel.org>,  linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-doc@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 15:29:55 +0100
In-Reply-To: <CACRpkdaQ0=KduRoSOn+NKNOXvL2HqL_xeCR-LQZWh6CdRMf1Pw@mail.gmail.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <202311250548.lUn3bm1A-lkp@intel.com>
	 <fb2aaa4c69c88738499dfbf46ef93e3b81ca93cb.camel@gmail.com>
	 <76957975-56e7-489e-9c79-086b6c1ffe89@kernel.org>
	 <ac950d01-d9aa-4fb7-810d-b21335e4cc94@kernel.org>
	 <ZWS90GQTJWA7DrML@smile.fi.intel.com>
	 <bcc5da24-7243-42fa-a82b-48851ce17c0c@kernel.org>
	 <cacce41f-f1c0-4f76-ab24-c6ea8bb0303f@roeck-us.net>
	 <c7e7b7bedd5b016a29cc86f767cbec533d727ff4.camel@gmail.com>
	 <d4a9bd79-1cb6-4da6-9380-bb8085866533@kernel.org>
	 <CACRpkdaQ0=KduRoSOn+NKNOXvL2HqL_xeCR-LQZWh6CdRMf1Pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-11-29 at 15:10 +0100, Linus Walleij wrote:
> On Wed, Nov 29, 2023 at 9:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 29/11/2023 09:35, Nuno S=C3=A1 wrote:
>=20
> > > world. If we are now going to ask to run smatch, cocci, sparse and so=
 on, we
> > > will
> > > scare even more developers from the community... I mean, the bots are=
 also in
> > > place
> >=20
> > This is not related to Linux at all.
>=20
> Smatch, main author Dan Carpenter
> Coccinelle, main author Julia Lawall
> Sparse, main author Linus Torvalds
>=20
> To be fair I think these tools has quite a lot to do with Linux, being de=
veloped
> for the kernel as the primary use case, by Linux kernel contributors.
>=20
> > When you develop any C or C++ code,
> > you run these tools. Upstream or downstream, does not matter. Why would
> > you not use automated, free and easy tools to detect errors in your
> > code? It's just a matter of professional approach to your code.
>=20
> This I agree with. We just happen to have some especially
> talented C developers who write some novel tooling.
>=20
> (I think developers should be able to rely on robots to run them though,
> we all seem to agree on that.)
>=20
> Yours,
> Linus Walleij

Hi Linus,

Since I have your attention, please give a look at the gpio stuff when you =
have the
time for it. On the v1 cover [1], I have there my concerns. I'm really not =
sure if
I'm providing the right interfaces for the device capabilities.

[1]: https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@a=
nalog.com/

Thanks!
- Nuno S=C3=A1
