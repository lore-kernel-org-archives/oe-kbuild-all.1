Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1E3321D8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772626784; cv=none; b=bHw589fj5j+ah8rr39cbIn1H6NE0iVGF5oXnbU3EtOusc6dJzgP4p9THweaLnkpIq/2odUkd5WB8ZEY430L91CVcOR1tbQ7B3I3/T5OyLhh7JT+xua14Jf7bX1M4bDJgDcyldNz838R+sABF9aXS4NkZVUxyrMtfu2Qicyez4yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772626784; c=relaxed/simple;
	bh=8jaB9xhr+C3taJqbbWa5n/w0SjBdD0Ab/HQmNKTmf5w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B/TOEB5E8y4s8aWIAenzlNF8hGadB0d0dELvci4tKsyCPenVd/ALcqEroiTPUe9lzv9MYAFJO94+6VTAOXhahjsTXg07zwz2BkElVP7GrAdp2cyZfaKbgYfj5IkQRQ/fOUfurY0sRHwvcJKhdxTirmwYmPk1+jZ4IfhO6CMXDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyrMQkCQ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyrMQkCQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b790af67so1934081f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 04 Mar 2026 04:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772626782; x=1773231582; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=NyrMQkCQ905umoRgGJxg/5ob1YhjRXqxLWP9/+b5IiUS09NGnkoUvH8s9467jfhnJQ
         HNriqVtGHS+v+2LbVYPSnbvNjwbJX5WUJpfEx+zczHbiQiKqcTWCW9y3PTFJqOQAs7G4
         en2swWJcz5Gif2yd1UDR0nf06nI4tf+UPU9PTL5ChgM8ymdEyiQ5XjYUhAQ57zFzMU92
         CZoblqPQyknCOhvPUAnGFCS4MRwj+XSIZR2VuDFdb96wm3g1QI30wGCWQllEsoMuqkP4
         XKdd7ct3Cl3nsATiZncD7gaonwiAZoxjhPzRwkq7AP6T4rruT8slmPotLa/iAwXusCaI
         5Uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772626782; x=1773231582;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrV9cbgp4wuO7j5QZsaUWjFR+kDOuc1YVBeslenYsE8=;
        b=V8rjc1I7zVR8cYLM5NGSn+qVvrVYdFGHaaEqGhIyGnJEeGbRY3tmIk+sp9ecV7ELF9
         5yGzyBpEU6iJoiiLKBdTcS76SuVowrmS38MEtjd9gzeWGe0adhUxC4SDLIj5ZBVAULS6
         oDxnIU79xWNKXqWRMnsIpleRHWbzRfIHlpBpFiiT/WZE4eW8y88xdtAYHYnhyRT28SOp
         e0yoy/2uJvEHaIf8b0jUgm7j3PyQRYVT8rNRHQdlcVIYqETI+s4O2Z5UKTPo9BgswAnm
         9t6YZYem7bIM8/MCtb+fbnCsdfm/Fxy73HRgrGtwrfjX3Oo4uNO4ekANODSFEMfmMQwj
         Fsgw==
X-Gm-Message-State: AOJu0YyKEj8Zgslx0zeav8x/l3ImShO5JMvw+ceg4Rxb6xT/Fcgk/6pa
	3oUt+jmPMF/xOD9Ri4p7MoNHEsejAJLAhrdo77gsEXndPzeVsvCVt9Ri
X-Gm-Gg: ATEYQzzuml+rHjrrQCHRqvfNHYG8zQGWSoCyox1g+u+K3t8xDWN0mGyWWctT5kEc4D9
	jJ92t0vbngJEkja4aOws1zqcdzh+tTASTkj8F3uVpxFh8vA4TR3kd7jf6xBIZjeXXJDn5mnijHF
	zCD1xWUF7WEIj2wvfgskG7b/356xwxdg9ZEki+btIWJ10nexH2eejDHAeCB5FkHWT6Qf/4MBdNL
	8kdgjjJDXer8KfR/InKET24Q7kK6qxF3+wRJPTem7QMcq8Uyz+Oemv1RwfnnxzA7bDoda/NvXur
	KZcXqIXxuxcJ/wRFPVseSPL8tYNWjsUw6oc98D/j/VfuY5UUYwCAT904CRhZxC7SBZa9m68frLg
	yZd0VohY5X3F0kkfPRwkOHj/0En2VSNS9Jn9+gXxCm8JXQV5GKpQ6gGFtatkEXu4rKFTyPrtTXn
	o//QAYAb8M3C0wNvF/7vXXh7sfDpyVsDc=
X-Received: by 2002:a05:6000:2912:b0:439:b9e8:635f with SMTP id ffacd0b85a97d-439c8a9f004mr3065699f8f.21.1772626781522;
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b3cc2e65sm27010827f8f.2.2026.03.04.04.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:19:41 -0800 (PST)
Message-ID: <f3fa4c490a61c4544fa93682f3dd18e0f98b8473.camel@gmail.com>
Subject: Re: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, Nuno =?ISO-8859-1?Q?S=E1?= via B4
 Relay <devnull+nuno.sa.analog.com@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,  Jonathan Corbet	 <corbet@lwn.net>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>
Date: Wed, 04 Mar 2026 12:20:25 +0000
In-Reply-To: <202603041109.HFnPWnj8-lkp@intel.com>
References: <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>
	 <202603041109.HFnPWnj8-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-03-04 at 12:05 +0100, kernel test robot wrote:
> Hi Nuno,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 78558965440b27814592ec82d8f3668395953b1b]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Nuno-S-via-B4-Relay/dt-bin=
dings-hwmon-Document-the-LTC4283-Swap-Controller/20260304-010255
> base:=C2=A0=C2=A0 78558965440b27814592ec82d8f3668395953b1b
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260303-ltc4283-=
support-v6-2-efe11502fad2%40analog.com
> patch subject: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283=
 Swap Controller
> compiler: clang version 20.1.8
> (https://github.com/llvm/llvm-project=C2=A087f0227cb60147a26a1eeb4fb06e3b=
505e9c7261)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce:
> (https://download.01.org/0day-ci/archive/20260304/202603041109.HFnPWnj8-l=
kp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202603041109.HFnPWnj8-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]
> > > Documentation/hwmon/ltc4283.rst:258: WARNING: Blank line required aft=
er table. [docutils]
> =C2=A0=C2=A0 Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: =
ERROR: Unexpected section title.
>=20
>=20
> vim +258 Documentation/hwmon/ltc4283.rst
>=20
> =C2=A0=C2=A0 256=09
> =C2=A0=C2=A0 257	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =C2=A0> 258	power1_failed_fault_log		Set to 1 by a power1 fault occurring=
.

Arggh, will wait for more feedback before spinning a new version.

- Nuno S=C3=A1
