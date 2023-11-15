Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED7BD51E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jG4PPL9c"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a92782615dso77225577b3.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 02:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700044116; x=1700648916; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=do0Q0u29Tz44Y8UUBoHQ+KrW0i2gijbFLTrdRooPIFA=;
        b=jG4PPL9cbbWsuhOoMxxyb/fAKzbEzUWHKXNaeuj+5BMEPXABX6UdlPMTOfHipUJl03
         qDq3DtLVtY2VzXjUp/MS2KWZPu8Sa08xbKLC9Wwkue4H9Rka+I/1qzqDY60URo87D/nA
         HFKvdYPeorc9xbI1HNWQT4a9tflpc45jtT6oUDErcMOq1g6SFMlxd6Kcv4wLL28DKeMV
         1delFYagorW9A1J8RP8rJZPseTGfm6adtLFifIye5asN1ssBheW2dHD1TTdbCqNO6kJG
         YxvZwSQHubLlCDtGSZ0lgnK8O0KuFj5wMJ0ZHvnBWx8lQ2kgAlm71yApfexe3f2ohp4T
         BxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700044116; x=1700648916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=do0Q0u29Tz44Y8UUBoHQ+KrW0i2gijbFLTrdRooPIFA=;
        b=YSlUOwKA3uCNvHmnJUsyCQ2zHIxt3C7qY/kqOx6iawDA+wzvuDgQBH9nnI50rPKf30
         hKadhl2p4RGzicsQ4GlTriC4XdupOsaCI/40mkXqDkV4mdO9a9vsT9pbFHuqfAGeuquw
         DC9uvZfj2PhUv3qcoVhpNn5XlBSFsswumoK+KQ6P/Fmo4dDSQSZIE3unmGdRLxjsRuMB
         Wpdl98zE0iBwRS8xIt2fhzWo9Jz8yw6ogYBrfRrTauP4nWCyf3E9qnrVrhPql0QquLEm
         hz4jO/+zouAXkreDSReugwYLV7ZINHT9U+s9k1xdRznEkMdnPLOCafbbXtifE7RPw1W2
         WMZQ==
X-Gm-Message-State: AOJu0YwjRJKLXYTpF0P/YUqh1C8s40XYUOzsDsUwrsRtGu9rZcfxbf1t
	vF4r8dNntoQP/5sHFAV9E4Vr6qjhssivXpvzuNXysFA3HMcE7gvt
X-Google-Smtp-Source: AGHT+IF8n86745aK0mAoqCk8o8BEcrky8kE5DIJC+RtaVr5hq4EG/nfkYjQEASp55CZ9wVIawIo8P8fKkM+MZ6bgDto=
X-Received: by 2002:a81:48d8:0:b0:5bf:5741:517f with SMTP id
 v207-20020a8148d8000000b005bf5741517fmr12584129ywa.22.1700044116627; Wed, 15
 Nov 2023 02:28:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311071303.JJMAOjy4-lkp@intel.com> <CACRpkdb4d9pfstqDTZoBSqOSS4d4vLOUCnS6AKcMjLZ8TTQ2Wg@mail.gmail.com>
 <20231115093742.GA32655@ediswmail.ad.cirrus.com> <CACRpkdYHJcx8gDsa5P2eLBh6iaVQzZY+-4eMJPKtnQTq3uR6oQ@mail.gmail.com>
 <20231115102537.GB32655@ediswmail.ad.cirrus.com>
In-Reply-To: <20231115102537.GB32655@ediswmail.ad.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Nov 2023 11:28:24 +0100
Message-ID: <CACRpkda3yBJjuHRvuCyL-XqJiNO57wPyuHJzn6cBMpaBnR+RMw@mail.gmail.com>
Subject: Re: drivers/pinctrl/cirrus/pinctrl-lochnagar.c:52:53: error: pasting
 "LOCHNAGAR1_" and "(" does not give a valid preprocessing token
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 11:25=E2=80=AFAM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Wed, Nov 15, 2023 at 10:57:29AM +0100, Linus Walleij wrote:
> > On Wed, Nov 15, 2023 at 10:37=E2=80=AFAM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > On Tue, Nov 14, 2023 at 02:40:38PM +0100, Linus Walleij wrote:
> > > > On Tue, Nov 7, 2023 at 6:19=E2=80=AFAM kernel test robot <lkp@intel=
.com> wrote:
> > > It has somewhat been on my radar to fix at some point, but I have
> > > in general been a little unsure how to proceed. RST feels like
> > > a mega over generic macro name to be exporting, so in some ways
> > > feels like fixing that would be nice. On the other side, renaming
> > > the register on the Lochnagar side would be very easy, although it
> > > would mean the register naming no longer matches all the hardware
> > > documentation which would be kinda lame.
> >
> > If MIPS breaks things like this because of weird defines I would say
> > it is actually fair to just quirk it in Kconfig with a comment:
> >
> >   # MIPS occupy very generic defines
> >   depends on !MIPS
>
> Hm... hadn't considered that. The driver is pretty unlikely to be
> needed on MIPS anytime soon, so might be a reasonable work around
> for now. Would you like me to fire in a patch, or you want to?

Send it and I'll merge it.

I don't see the value in MIPS compile coverage for this driver,
since it already builds fine with e.g. m68k big endian.

Yours,
Linus Walleij
