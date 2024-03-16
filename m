Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C517F0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710552213; cv=none; b=ZQqqy2foxkX9t0yW/cHa8t+lNI5Z2gSoCtoirqDqaguf5HvgdiHnVhwuIZQ8sIi1x8rlRre57o3h1DU0dhE/WsY9xDr7n2mQbzO+apoeX0Ea7PW1Swb6aIKEnrsXBtuqKcTFSMt1DG80COr+GnlyIncIgTwM6mi8hL6rHowqA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710552213; c=relaxed/simple;
	bh=zrk0mlljUXq6JrTr3qaP5fW3ShetdUZodGHSY6f3a6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIfqGUy+z52tF9TkR8djK11Qxidc2f8EIRk4ZPx8yBgQSn1XF5QXacwhcy10wOI2ToLQuHbgaIAfs568n3UgYqEjDbBsOyzGsc2emNg5U+qcc9OHSUvr2NoyM0bxWTaS1JdcT+WXGom5MJtrl4B/9QlowlFWojGQVEkk8njKukQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FdY9fRaU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FdY9fRaU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4644bde1d4so343840466b.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 18:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710552210; x=1711157010; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=69cI/hdQb0CMrhhOHzUcjMzxCnMmxWubP/uXkL4m1gc=;
        b=FdY9fRaUPJ/D9d1R7lAf9/+ujWsEvyEUDjJ53saOvi3qvbmmunahlBx/vB/h9S6fla
         qtz8C/V3/48swwSJ7JOpj6D5748c8HACMIrdDUhZBD+EQG69Pv0VYPYNzXz2xyH7LZ1D
         41dkHlSd20v+phqCHzJBUJy0aQ8hnJYI0Jecs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710552210; x=1711157010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69cI/hdQb0CMrhhOHzUcjMzxCnMmxWubP/uXkL4m1gc=;
        b=QR2E/5oNVJ+PrYQ+mY+k28MI79cWXmXpTCRGsi9knqKAUDF25KPwa8zbDuDD+MvJ5O
         1lfG3JB8Ncc0/eliISQkO1PrqkejNmz/cEvoLgInXlJPoHv41S+nVIJ4fWeKH9Fimt+v
         AYYqRj/th5VZXTGYaRncBquXEinCSaneHg5Qg/hlTQzaWgeP2ACSbIuJH6ovAtsQwCp7
         kJKvEZlY+3Vl5R4GhGq3K95ctykLlFwVEsbGsMmYAYeNMmZA4yOjE9FU/Dy7UI1B6sbV
         pme8nW3dyTYPAIH1hqv8Gif1vep33J47jNTO8tWHviEDBX6ecjEAikcHWZ1fdQtnIWsS
         iuFA==
X-Forwarded-Encrypted: i=1; AJvYcCWvfpWnTmvaMUFVhjv7Ob4l83/Rg0/CRlHz7SGo87rlWZO7c6RB4V5FZdCA4mcaiYHoiaCpxalqNkbB74l9/1TLkRvQlfqEhGEgX1bAWA==
X-Gm-Message-State: AOJu0YxDhnxsdCG7QMbJKR48uaKQ4OREOsgQezeNX/aqPDeTRIEHT5Bg
	WQGiYmo1+Kw9hdzyGuZn/G26lXA86VtsrfLni4E1J3OCVyPaogGN07KQDMN0bwv3KwU8a9rx71s
	8+TmUow==
X-Google-Smtp-Source: AGHT+IFICOg0z44NWvcmIAEl9eboVNS658hks+fthJMeKMMYmRKnY3FqN8Xd/DjNxQs/CYFjrQdZLA==
X-Received: by 2002:a17:906:b4d:b0:a46:9e25:9f4f with SMTP id v13-20020a1709060b4d00b00a469e259f4fmr697308ejg.22.1710552210129;
        Fri, 15 Mar 2024 18:23:30 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id jl27-20020a17090775db00b00a45c9ea48e3sm2201228ejc.193.2024.03.15.18.23.29
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 18:23:29 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a44e3176120so352578966b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 18:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrJi057nyLEveGk+8NAm4X0w8h0S2RSapYMRcQUiilfJSVIQezWDulnRff1e40zx8YQKOoy5Bx1fmehB57UEGHM+pB6YpN4YygEZ66kg==
X-Received: by 2002:a17:906:3654:b0:a46:9711:4f04 with SMTP id
 r20-20020a170906365400b00a4697114f04mr1417533ejb.13.1710552209212; Fri, 15
 Mar 2024 18:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240303235029.555787150@linutronix.de> <20240304005104.622511517@linutronix.de>
 <e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net> <CAHk-=whK=G1o6RtS9DS3wEGF1KU7WLgLL1+6Se86bj8m7wwqrQ@mail.gmail.com>
 <87y1ajjsv9.ffs@tglx> <87o7bfjeae.ffs@tglx> <CAHk-=wiP+XMGHr8NU13sSOG_oasNZN02O9_c1PzCJNG7+O-GPw@mail.gmail.com>
 <877ci3j80k.ffs@tglx>
In-Reply-To: <877ci3j80k.ffs@tglx>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 15 Mar 2024 18:23:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg50AGnzhmOK0TNqDN99T3dWd747h3y-ZFuv4bNZ4Q0tw@mail.gmail.com>
Message-ID: <CAHk-=wg50AGnzhmOK0TNqDN99T3dWd747h3y-ZFuv4bNZ4Q0tw@mail.gmail.com>
Subject: Re: [patch 5/9] x86: Cure per CPU madness on UP
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	Uros Bizjak <ubizjak@gmail.com>, linux-sparse@vger.kernel.org, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Mar 2024 at 18:11, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> You wish. We still support 486 and some of the still produced 486 clones
> do not have a local APIC.

Ouch. I was _sure_ we had dropped i486 support too due to cmpxchg8b.

But apparently that was just a discussion, and my wishful thinking,
and we never actually followed through.

         Linus
