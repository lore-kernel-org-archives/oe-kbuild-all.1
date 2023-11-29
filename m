Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C028F12B61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ru3SeTcB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54b18dbf148so5718530a12.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 00:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701248179; x=1701852979; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UzC7u7XHPaOQqtUVRI8/zgc51khZ8nOUC/D9UTwFyWk=;
        b=Ru3SeTcBXhygJ4DrEFDYaV4goEsfgu4leVRCATG5I2bNK4/67ZM9jt5b3mYB9m8B//
         Io7X7lh3vrm90cH03v9c0nLdukjy5mRmKQ+lx/QoHEnSIF+cBzea0AHSCEQJFYaurmDD
         Y8DCJghVOVIwjPyJ2r75dZlGarAaugAoL6S2G+PkIBsUcxLA/q4NpfHRFg7/LQD4B/kR
         z4k0zv+o09WkWAYpRzU2p7fsHEY32Y/Unfsv2n9TwlRSKvxThucQ8Ydkluq8fqsYAitE
         CcgZyksN/t9PnXjPWB3i9zdVvmq7OjqXetW4QwSHYBvKwoJlrEzk1VmYICp0OYT/hFUZ
         fvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701248179; x=1701852979;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzC7u7XHPaOQqtUVRI8/zgc51khZ8nOUC/D9UTwFyWk=;
        b=LLlbRXQSb/fdfR87uMPQ+AFd0CJ3B67ENszDAPofYtBN3/nENWSz1qKVZ95c1zX7AF
         pPs0oLEQC+YYe/ZbENaPHm598I4f7SHDznLRsEQLHPPcylL2UQ0HUFwVa+pN0NroKhPj
         1plHKxLNN2/PYNjDt3L+jtP2bjlzEBt8BxrTzjIpxhe8+v3wmhxxsIxB3L/kltCIcRll
         CXtPHqBeKGG8ovCFaK25pc5mi82RnmXoClZBt3y9qCfRMzYZLytudSFzSUC+1Pj9/0yD
         VDXvpIW2INEiLdsmclrTUsSOutP1701u7H3ju1nrjTjGMpJWfco1PuiCTUI1ZsowHatu
         0btw==
X-Gm-Message-State: AOJu0YyVCTCuOGhZbwtc60Xizx6wU8G0w1Q48M8iqKnoQi643jWH88ZB
	JY3wM13N6zNRiVGD+NLgrOnYBc6U+QfFS3w9dyo=
X-Google-Smtp-Source: AGHT+IExjvaOkUK2FbCLNi1a2wfzeXF8TuA05XOy41Zpy+2YJf6EPwUMDERCJj1MJ0WGUTor4fDgQw==
X-Received: by 2002:aa7:d805:0:b0:548:7a28:4df4 with SMTP id v5-20020aa7d805000000b005487a284df4mr10958769edq.15.1701248178697;
        Wed, 29 Nov 2023 00:56:18 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id f11-20020a056402354b00b0054b59096da4sm3377724edd.13.2023.11.29.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 00:56:18 -0800 (PST)
Message-ID: <aa9d45b7c7a21fa818f79d249536c461b2dcac9c.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>,  Andy Shevchenko <andy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Nuno Sa via B4 Relay
 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>, Rob
 Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 09:56:17 +0100
In-Reply-To: <d4a9bd79-1cb6-4da6-9380-bb8085866533@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-11-29 at 09:45 +0100, Krzysztof Kozlowski wrote:
> On 29/11/2023 09:35, Nuno S=C3=A1 wrote:
> > On Tue, 2023-11-28 at 10:03 -0800, Guenter Roeck wrote:
> > > On 11/28/23 08:50, Krzysztof Kozlowski wrote:
> > > > On 27/11/2023 17:03, Andy Shevchenko wrote:
> > > > > On Mon, Nov 27, 2023 at 09:12:14AM +0100, Krzysztof Kozlowski wro=
te:
> > > > > > On 27/11/2023 09:10, Krzysztof Kozlowski wrote:
> > > > >=20
> > > > > ...
> > > > >=20
> > > > > > Wait, this was not even unusual test, just standard compile, wh=
ich means
> > > > > > you did not do basic tests on your end. You must build your new=
 driver
> > > > > > with W=3D1, smatch, sparse and coccinelle before sending upstre=
am.
> > > > >=20
> > > > > Well, sparse is lagging in development, for the last year it's at=
 least two
> > > > > times it broke kernel builds because of being not ready for the n=
ew stuff
> > > > > used
> > > > > in the kernel. Do we have anybody to sync this? I don't think so,=
 hence
> > > > > requiring this from developer is doubtful. Otherwise I agree, tha=
t basic
> > > > > compilation with GCC/LLVM must be done.
> > > >=20
> > > > Sparse still detects several issues and handles lock annotations, s=
o it
> > > > is useful. But if you disagree with that part, I still insist on Sm=
atch
> > > > (which is actively developed and works great) and Coccinelle (also
> > > > actively developed).
> > > >=20
> > >=20
> > > Quite frankly, for my part I would be more than happy if people would=
 read
> > > and follow Documentation/hwmon/submitting-patches.rst. Most submitter=
s don't
> > > bother. That doesn't even mention building with W=3D1 (the much more =
optimistic
> > > me who wrote that document several years ago thought that would be ob=
vious),
> > > much less running any source code analysis tools . Feel free to submi=
t a patch
> > > to strengthen the wording there. If you do that, it would have to be =
more
> > > explicit
> > > then "run smatch" or "run coccinelle" because hardly anyone would kno=
w how
> > > to do that.
> > >=20
> >=20
> > IMO, submitting patches to linux is already not the most straightforwar=
d thing in
> > the
>=20
> True...
>=20
> > world. If we are now going to ask to run smatch, cocci, sparse and so o=
n, we will
> > scare even more developers from the community... I mean, the bots are a=
lso in
> > place
>=20
> This is not related to Linux at all. When you develop any C or C++ code,
> you run these tools. Upstream or downstream, does not matter. Why would
> you not use automated, free and easy tools to detect errors in your
> code? It's just a matter of professional approach to your code.
>=20

That's true but still are too many things to remember for every single chan=
ge/driver
one sends upstream. Yeah, I might just wrap b4 in a script to run more adva=
nced
checks on my patches before 'send'.

> > to help with these kind of more advanced analysis, right?
>=20
> They do not come for free (someone is paying for them even if they are
> for free to you) and they have delays in responses.
>=20

Yeah, but actually thanks to you, I discovered I can have my private branch=
es covered
by lkp (and I got the PR merged already) and I do not mind having 1/2 day d=
elay for
sending patches. So maybe that will help me avoid these kind of mistakes.

- Nuno S=C3=A1
>=20

