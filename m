Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D228C00D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753787206; cv=none; b=bzPYcTpcfEngqMZlaZYS1/Zig8GlO5BOQHd/da6amk+XfGSO9XWueIV+tjrAX0m7q1MKjlT/so4tFkUS96GEqtQEN1mMvdaFuuyE/w4G3PYwZSXyaKngR1cJA0ZiT6VHBAN2B/Qh80TZXtpAB4WW2A0GF7iZOwXMoCOGusqAFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753787206; c=relaxed/simple;
	bh=46wyHhlhbSdnUcyeFd1TriM28v5lVlqhA7G6+0LuhVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2+JcKzsZI/oeiF+rXZ5VHLvJJULZmh2z6z0mWiFowgonN9W0CLGXt5CQ5OUtJgioZ6Vp6a9cvyJAg81sz1tzUIAFDshpBxv+COoPMvhtGPjbMBn+ksf8CwAxGAxFXJIOuevt+lW7Lj5uR6nVfs8vAhHF3iSBeZmCjEGNoT6nKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JNBXvYbZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JNBXvYbZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so7404501e87.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 04:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753787201; x=1754392001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT6dUycl5sWhSXBL7/LG90t0tKRW5i7yHrlxM+huFP0=;
        b=JNBXvYbZYjZKBrv7m1NvdeHXBu5yXos9/GawF9/V8VBqF6y3LsZkx1DGML6fRSFyfn
         4+tOO37WHqUCkm9l36CpVFcyduc9lxFhIObAXQrQxQ4QYR5qxGIp1Kvq+TnYXPHMU/ks
         gImfAgLQa9R0qK9RkX/MINeQRE6FryFgKBJOy3xsG7cFm95wE/DArvXL3jOe4m0e6kSf
         q1TWb7n18BRFXrtlX8xw7MnkEy3f5avLHzjv6pJPfCIsq+a46X0iRIit90MbSOy8/8vF
         9Oc9rE/ObxzoTEdo05TulmYakcMqQy24V4x48rdCEP+4j1f3bPQXtDYDYYjQ23HEZN9r
         9dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753787201; x=1754392001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT6dUycl5sWhSXBL7/LG90t0tKRW5i7yHrlxM+huFP0=;
        b=UuseM4KClQk/bOUrnXxrCzILjp8ZR2x+48NK2E9CyzFCf7mM1PQyrIcvRNtYWB1zBu
         5TuaGhZh5mzcB8s8deKgezudCvWbYJElGUhsHes0Rims20s1fyMO3UqXPP0AFpcd6AS0
         5ESXcPIBFF159lDKDFesoIxVr5+35f9kDqhlw5XoxWuLmZTEcBpoRXuH8pOh+moUmGW2
         NNb6HwBUlMQF0AtibSCKB++/OKFyL99pRgAxJ45s+besA7UrEWmR6brvGFq6Iv+hlVfd
         1Me9wR1zyHLYFK3r6wxgMaDcL0OJoeZAw8IZ2/jwM7D0S8yei2qkwq88m4MdwHl0WBV/
         NeRg==
X-Forwarded-Encrypted: i=1; AJvYcCVEXFhEYLVYwYhCg60r+QRfo9m/mbCr+HsHzoEjrKL2EQR2nMgEjngEAz4pdY/eLfk1P0ldcAfvJFEMBx6d@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+xC2jmM1erW44j7UxZguViCtk+xoPVfMTV4B/j9qxmIstadp4
	sabM93ZwQgWra9UAASxlCuQKeV7XWNJ/ckhnh/34X4Cjj+vJw1bE9V3PM0jBjPnSzoA1t0ruFCA
	/gMnMjO7bHe+REoblRm0KJ7fPg8BqCMW63MyPjhJlig==
X-Gm-Gg: ASbGncu7eDiM0ueRVzXhVijxCDcsHwZ3bYN8iXYgfY6p5xgU/Z9AkUFuqVrvnWa64Jd
	kfrWIuurxZWfdWehbsEtwOGEKYlA4hsMEQyn4uYUqKuTz+5Lu6VrBELwbcNHhzoX9fDQjbRjO/z
	4n3GYjBKn5wZbb6InjuHiIQoA9BgLj9nl30zIjDIl6b5PrJUpNCJ7v4R8qxFD/M3Pi2Vct7gNHF
	gT27ENGCGE+ahledjzt5WJ65A0pGbTDOAawVJQVJzAf+ufMng==
X-Google-Smtp-Source: AGHT+IGEtA7omnM/WlhyTqrp+MzpL6gEEuylcbCGv1UrMBzIlwoRMnKLy4I4IBpUujg7JTfAwDTQVRve7gVWQ9qxB2c=
X-Received: by 2002:a05:651c:a05:b0:332:1de5:c513 with SMTP id
 38308e7fff4ca-3321de5c9fcmr1978811fa.4.1753787201467; Tue, 29 Jul 2025
 04:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>
 <202507261937.Txq9shpv-lkp@intel.com> <CAHp75VcrL56_8uKNrmLj9sk+t7qZfKNi6-W-yAKNZ+mSCXU8zw@mail.gmail.com>
 <CAMRc=MdfMEAjgkTNENZejzRPN4svCiy4VZS9Y5HG7Ht5XwqUgA@mail.gmail.com> <CAHp75Vd6Vwk8pLarDk+hDQ2S_ufZ6wNw9xffMUJfQ5M8bPJubw@mail.gmail.com>
In-Reply-To: <CAHp75Vd6Vwk8pLarDk+hDQ2S_ufZ6wNw9xffMUJfQ5M8bPJubw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 13:06:29 +0200
X-Gm-Features: Ac12FXzAt3jZif6EiYx3ZXMNgUEi0RFk8sAKe5WQhjNVC8kK1iCEnpnQq5pB1LI
Message-ID: <CAMRc=MdNN_J_uB4wxGgpvaxmhgGCYwu5LXCEFBOurNWc2OmSaw@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] pinctrl: make struct pinfunction a pointer in
 struct function_desc
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 12:32=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 29, 2025 at 11:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Sat, Jul 26, 2025 at 9:29=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Sat, Jul 26, 2025 at 1:31=E2=80=AFPM kernel test robot <lkp@intel.=
com> wrote:
>
> ...
>
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> drivers/pinctrl/pinmux.c:917:7: warning: cast from 'void (*)(con=
st void *)' to 'void (*)(void *)' converts to incompatible function type [-=
Wcast-function-type-strict]
> > > >      917 |                                          (void (*)(void =
*))kfree_const,
> > > >          |                                          ^~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
> > > >    include/linux/device/devres.h:166:34: note: expanded from macro =
'devm_add_action_or_reset'
> > > >      166 |         __devm_add_action_or_reset(dev, action, data, #a=
ction)
> > > >          |                                         ^~~~~~
> > > >    1 warning generated.
> > >
> > > Good catch, LKP!
> >
> > Ah, strict function type cast...
>
> ...
>
> > > >    910          /*
> > > >    911           * FIXME: It's generally a bad idea to use devres i=
n subsystem core
> > > >    912           * code - managed interfaces are aimed at drivers -=
 but pinctrl already
> > > >    913           * uses it all over the place so it's a larger piec=
e of technical debt
> > > >    914           * to fix.
> > > >    915           */
> > >
> > > Indeed, this has to be addressed first, and IIRC I also got something
> > > like this in the past.
> >
> > I mean, it doesn't have to be addressed first really, it's another big
> > chunk of technical debt but we can live with it for now and address it
> > in parallel.
>
> I don't know how you can solve this issue without addressing that
> first. I do not consider "fixing" by casting out const specifier (the
> whole point of which is to be not mangled).
>

We can do nothing and keep on leaking this memory or we can
exceptionally cast out the const and pass it down to
devm_add_action_or_reset(). The scope of removing devres from pinctrl
core is quite big and honestly this series is already big as is. I
don't see it as a big issue. I can meet you in the middle and simply
implement devm_kmemdup_const() manually to avoid casting out the const
modifier.

Bartosz
