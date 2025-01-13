Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5835F232372
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736754179; cv=none; b=mEb8sW9ir9Mu40xoL1CF/gCysjwy3+szDAnDEEAP0Gnwo0v3OqAJw4gKWWGwow+rJrkiW2+meQsP1rwYsBrTU7ZUgCzLEcGrIZTMbQrFMT/WWIcixw/rPs0thR+EaRTb9SbVC76306NhMhbVm0JaJqWgcAnBBEBhG5HfZjWGgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736754179; c=relaxed/simple;
	bh=hfB4/BMVsk+qNpzDmbACkiRFPMTgeQPmQ7ttP2eG0DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtJ/gIHHozw/mMjjJ3bT5aKmPcUwvPaiVix/H9Yn+r3u6+bWT0d03vHnlFeQbGejKkqgmCDp7MCA508o1JGKn+9VE2qWrknN6/0//PsSls0HHrDmNyfA41kxt+AVStBN1NmmQyqKAOx+efJ9RTYmxAs00MQia2yHia4oiJSOgwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBP0QvBs; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBP0QvBs"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso7149971a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 23:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736754176; x=1737358976; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBfCS4f3GB98NtQEO3qoTOxmU652vWLY8h98oZesbJM=;
        b=eBP0QvBsxop1WAZ5S7ukSDzGexOJgJBTgdlWIeqVEI+f8WYU44TdQK0QwcLiRR6RzZ
         x0U0blx4lPFO1D0eNewZnlBIRuy6ZNxJV71hbe7GRznlinBRLBMvyOSwyYt7zYTFCVyx
         ddiYzJ8G3vZFRtW2DVPuCZRbCMEM6ehMgoLJaHu4sww3tInxOjabzn/EaneovjLYxZgk
         0Zq2Z+S0c+cBpZpplkl0sWgeq2HHmbdIdC3cSZLT91y2OnJVfI3j7aiADJSUsmisc5pa
         InMNTJLtinIpQsJOYYS2713JH7jU9Hj38Uxt6R9fcq52gK+40+cbV9F7FY+JQt18qGI9
         VUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736754176; x=1737358976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBfCS4f3GB98NtQEO3qoTOxmU652vWLY8h98oZesbJM=;
        b=R9JleJJFY453BD0iS+crJpXdjPHYdjbvFvt/AMYCdhMzNZeHjtyheDQQTDXl6AElc0
         Prf6n6mGl/VBU0r1McL+vHfvb/7yjvxGr1OfGuz0F7d/hoKIkgKbWr1+p/oitD3yIK4M
         Uv1M/aSUSURqWqBJ6xDX9jK1lM9vld3w6zwXaTFAIrZZtK3F+H1pGtmSIjdyOdIWhYii
         c1EVNo/pHByaD9Z6Wx51MFVJSwl+HXQv8yFcOM/rT3i58PEaTyCSE5aSyI8nlAwF4dxG
         z5Hl0gyMoj/RAF72/ZW48VOtpqcmO5H4BogEk1/2oeVHxyle1Y1klY6AsGLz3Ven44B7
         ds6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9AYRuLqUdeR57AoEhMs/tfQLDdaPONnKUS4ezd4GXwM6+m54/LVmuPCYn+HRYo+7xI+S/1RKG49D5t153@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1jut05k7e9ObE6sNJQwJwxiwp63gYz7QUFX0AxTymgCCVnvux
	PzMZf664nUFmNBtlfVPjYlGmrrowNCevxfNnEAZSeR2rrC+HT4Z1414SYP+6PCNBiUSKITk4hPm
	OVqdhMMTAjdNIV5wXTVAnRVQF6w5iPmEd7WtR4Q==
X-Gm-Gg: ASbGncvqwPdUlAjNq+gdHIjG5hikCSbskKm98UWHKQC2++5R3ueNPBdnJPkuUKIl77k
	1/Lw2YmAA7+Llk8oGyy6t/KnF+LH+no1wxcbwT9E=
X-Google-Smtp-Source: AGHT+IH9BNq2JSD5qTfbjAMQ9632YxtevhYgSQVQo0T+HHaqnh56Wt5eyW662YY4KuPKM+W46OrUAo42TCPJH8GJFRs=
X-Received: by 2002:a05:6402:1ed1:b0:5d0:d208:4cad with SMTP id
 4fb4d7f45d1cf-5d98a105e8emr14550351a12.2.1736754175332; Sun, 12 Jan 2025
 23:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501130056.dNRlSRuE-lkp@intel.com> <543a7c55-cc06-4825-a37e-29017fb4fe3f@roeck-us.net>
In-Reply-To: <543a7c55-cc06-4825-a37e-29017fb4fe3f@roeck-us.net>
From: Denis Kirjanov <kirjanov@gmail.com>
Date: Mon, 13 Jan 2025 10:42:43 +0300
X-Gm-Features: AbW1kvYXEZ5QzH2Bb2YsZcNHsjw5TZ20UX5u5MksB-8YM_D-5R6vDTqOg-YdNGI
Message-ID: <CAHj3AVm3EZNZ6szO-f1xEgBCD+JY7zFO7Je7Ju6SwPD+iVHHSg@mail.gmail.com>
Subject: Re: [groeck-staging:hwmon-next 41/43] drivers/hwmon/pmbus/dps920ab.c:205:21:
 error: 'dps920ab_device_id' undeclared here (not in a function); did you mean 'dps920ab_driver'?
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've sent from the wrong repo, sorry, I'll send the proper patch shortly

On Sun, Jan 12, 2025 at 7:46=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/12/25 08:15, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git hwmon-next
> > head:   ffd30617d9ea248f5766778227bc2b59ee2e691a
> > commit: 139c3e32b53bdb1ee06f2f67adeccbcb4ad9288c [41/43] hwmon: pmbus: =
dps920ab: Add ability to instantiate through i2c
> > config: loongarch-randconfig-r131-20250112 (https://download.01.org/0da=
y-ci/archive/20250113/202501130056.dNRlSRuE-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 14.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20250113/2025011300=
56.dNRlSRuE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501130056.dNRlSRuE-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> drivers/hwmon/pmbus/dps920ab.c:205:21: error: 'dps920ab_device_id' un=
declared here (not in a function); did you mean 'dps920ab_driver'?
> >       205 |         .id_table =3D dps920ab_device_id,
> >           |                     ^~~~~~~~~~~~~~~~~~
> >           |                     dps920ab_driver
> >
> >
> > vim +205 drivers/hwmon/pmbus/dps920ab.c
> >
> >     198
> >     199       static struct i2c_driver dps920ab_driver =3D {
> >     200               .driver =3D {
> >     201                          .name =3D "dps920ab",
> >     202                          .of_match_table =3D of_match_ptr(dps92=
0ab_of_match),
> >     203               },
> >     204               .probe =3D dps920ab_probe,
> >   > 205               .id_table =3D dps920ab_device_id,
> >     206       };
> >     207
> >
>
> I dropped this patch as not even compile tested.
>
> Guenter
>


--=20
Regards / Mit besten Gr=C3=BC=C3=9Fen,
Denis
