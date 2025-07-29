Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94128688E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753781278; cv=none; b=eGEyzEyP+LKet/kau4zxN3FgNyV6wmMq8g3ol/hQswF2t+Ah6lCI54G/B2JgXdKOpMkzQ2NOLm//FPn9wFnXBVs0HrSBkx9M3s3j0+5WZSHNcTARS3YSUeiaj1wrgveNTfFZKvrzsM6iigIkvro+aU9AqMep49EqfQ8PlhMfKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753781278; c=relaxed/simple;
	bh=UVxbONYMenZ2G62xj1Ajze9L88dIaFIhF2FAPvq5IM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oki7dtA/QNT5DMwk8iBOObRYa/vLaGz9H8jtgzR9GZIaENVgXAKwJ/sf07/Vy+4Z/ovcE14x9jqVLzpADbBy4Q0H109TfOpxePjMl+rRInirU3r8G2SFoDNavYFadKiSL0HSEfcMS3p3zNzjWEIJGCp3URQFmFF9ThkaNy6kh4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SlyZNI9v; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SlyZNI9v"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b733911b3so1074283e87.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753781275; x=1754386075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuYSK4gM34dvKj46U2AHyFVlRRjXrZ8f8iJud63I7rk=;
        b=SlyZNI9vH4T5zKnXU+4wuzr1U579ZfhFikxCyXwXh0krPRR6UADCcWMTKWKbO1XX/f
         9M6CqLLxbpY0FB+oHA+DU0FTGJwf4n6cunXn6E6x7wUMzINAFxYD8G5DqXhJCmuKeHUE
         YZch5laxk6ZbhXypE9ewR5zeRZGNwLv9D1Lpz3x+aoiwwjsRf8JJoW/EJQkiS1P9dKmM
         HveG5AvD2tR16mZeBWBVg9gLgvwQFgFX3nqXamjVrxmhxOraPS8EjqwxHF7ld3MQKuKj
         RFcHzdrRKWsoRby+PfbSOCOOkXeyDl1yJQABpEsSQll141oq+YU8qzsX/aSJCjM6G/iG
         cFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753781275; x=1754386075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuYSK4gM34dvKj46U2AHyFVlRRjXrZ8f8iJud63I7rk=;
        b=MelNE4d5C4nB8ee0zYzyV0o4il2TeGF49+Ptjbc+IXHDuRkL02pjm6DvWiyOvp37/k
         viITIHxfursFOAW0kZWaiud5qAkYcVWgDiRTjenqcMsUBpi4AIviPcc51ZdOHftbopeh
         8Q7xouFewGMW4r3NV8xRN02wt9DfmmeKhrP0bugoBO24lNAmJc5L9yH2LDlYJ266ALNC
         Av6eGBwkrR92NPB1ZYVZEeooSIkFekL9O0FI2lXveuyAZR+TF0k+ATsRseFqHks/w/VA
         snuN7B3L1Nw++6p7OJL1lLynSVbLbRaiOmmvmuF6JRk7lQ4NEdNqogC25Roih+DYmQZh
         6Nsg==
X-Forwarded-Encrypted: i=1; AJvYcCXG6lxlQvXu26kGO1PrbJL+QK5AzojtLX4RhmtlzBPjrWwIK+IIJzI2iLxMPhmIDPnOR7vtyfDF5W/uIgeP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2HoI9AppSqWXOV0B/19UDdapi4WeCUqPnpvjASQG/WVu7r4VS
	M7SoiWpQdOifUD6eDuE6E3OCwINsz9hp+eOtB9cWDKSMBbmwPUr333isKqqfoZ0lWDUuBG+opZY
	MCSzIGs4vCekDU3q0p8nAIiGq6Jql58pPc9vePAI9DA==
X-Gm-Gg: ASbGnctwuub1Hf3e4U72uzGYnJz2jcbuyfkMVMCwtZdXQqrYwzc4MljFd0dyca1wanf
	yZSKrDK0ay7gULVKJPvjFJ35QXnf+IvvNfy1dK0G5GB0nUQdGXhDnqI59l14K5qJXKqSgBFmrEU
	XuJj/seQLuSIt6rt1320VOG1wjW21Rdlc8/Qo03U0nRZ4kndq/rOXQ8FzqhTmgIDFM0pdsyyk7U
	ZreLSfvk1qR3rMyT2xaDunHZVH9UaKbUtHgGDI=
X-Google-Smtp-Source: AGHT+IH1xjV/IusjYm7wD8jJwivk100eFvhpmAtG34em5DQvAFyq0WxlVADr0UXhPPNReVxqcy9+hVN8vSu0g22pdSc=
X-Received: by 2002:a05:6512:1245:b0:55a:26ae:56e1 with SMTP id
 2adb3069b0e04-55b5f480918mr3865559e87.27.1753781274688; Tue, 29 Jul 2025
 02:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-10-af4db9302de4@linaro.org>
 <202507261937.Txq9shpv-lkp@intel.com> <CAHp75VcrL56_8uKNrmLj9sk+t7qZfKNi6-W-yAKNZ+mSCXU8zw@mail.gmail.com>
In-Reply-To: <CAHp75VcrL56_8uKNrmLj9sk+t7qZfKNi6-W-yAKNZ+mSCXU8zw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 11:27:43 +0200
X-Gm-Features: Ac12FXzctTCjvP8s5v8QO4Q26z9E9jC3m2QKR1Qn8JCLGwl_tkRpE49-qECZAkg
Message-ID: <CAMRc=MdfMEAjgkTNENZejzRPN4svCiy4VZS9Y5HG7Ht5XwqUgA@mail.gmail.com>
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

On Sat, Jul 26, 2025 at 9:29=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jul 26, 2025 at 1:31=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Bartosz,
> >
> > kernel test robot noticed the following build warnings:
> >
>
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/pinctrl/pinmux.c:917:7: warning: cast from 'void (*)(const v=
oid *)' to 'void (*)(void *)' converts to incompatible function type [-Wcas=
t-function-type-strict]
> >      917 |                                          (void (*)(void *))k=
free_const,
> >          |                                          ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> >    include/linux/device/devres.h:166:34: note: expanded from macro 'dev=
m_add_action_or_reset'
> >      166 |         __devm_add_action_or_reset(dev, action, data, #actio=
n)
> >          |                                         ^~~~~~
> >    1 warning generated.
>
> Good catch, LKP!
>

Ah, strict function type cast...

> ...
>
> >    910          /*
> >    911           * FIXME: It's generally a bad idea to use devres in su=
bsystem core
> >    912           * code - managed interfaces are aimed at drivers - but=
 pinctrl already
> >    913           * uses it all over the place so it's a larger piece of=
 technical debt
> >    914           * to fix.
> >    915           */
>
> Indeed, this has to be addressed first, and IIRC I also got something
> like this in the past.
>

I mean, it doesn't have to be addressed first really, it's another big
chunk of technical debt but we can live with it for now and address it
in parallel.

Bart

> >    916          error =3D devm_add_action_or_reset(pctldev->dev,
> >  > 917                                           (void (*)(void *))kfre=
e_const,
> >    918                                           (void *)function->func=
);
> >    919          if (error)
> >    920                  return error;
>
>
> --
> With Best Regards,
> Andy Shevchenko
