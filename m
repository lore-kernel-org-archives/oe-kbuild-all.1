Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15C1EA7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710520945; cv=none; b=uAIsfXbAySYC+2uAdZQxeyzuB9VusgVBpyQc9PL10mG4zPFv+65eccsvyxD8cNPHb2PY5Z86+QY49ZAToZP1wd8kpZfDDEaRZMil5No+GBsqMpUxDmrHDnaesDjo43xMLQHusYFxxZ/7KRJ45nYtbh+yCWQNWAnzrPvOFInlcrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710520945; c=relaxed/simple;
	bh=hIwLeauctgBMp7l98Z9Pbwy1HUT5HKtfynYgMSjBHg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebQi2lZAZOrBE9XVmnZURZKLi0cOTgS3Gzd06bHkL1W3oVZAP0cxq6ZAbbANKfYS9VNR0yjH4TPjAmFR+lP7jZuUkAKarsJJ5uuNUvn91fuXUrB03BJGqNP9jQrmppqAvDZYfKeDj6EcNaNbMRkuMx5br6N/Jhk+6jIeAXWRCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CMGyu72I; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CMGyu72I"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a466c85ae5fso80419166b.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710520942; x=1711125742; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=am/PWCEeHNB3+7UJCgYcRSSjRqhgq8ufptHRIWrU5Kw=;
        b=CMGyu72IpZ6WpjdUA+vYj56ve7yBX5kYEGsBaUzD/KJJxDQBU/5JKpNLCIgUYNztvU
         yITe7cx5mi4BEBIctj4TR8VA652Lht1PnVj6iaWp5iXTwIb7FgGcnuUIF/mBWp3GAex4
         1LqOuU5mwA3YO367IxhwzoUFwWGF+6Ly0VfuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710520942; x=1711125742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=am/PWCEeHNB3+7UJCgYcRSSjRqhgq8ufptHRIWrU5Kw=;
        b=B51ovS2Tcpyy1/QRYL3TEJlP/LcOKOu8w9+hzfV579KUoCQEW60r0+ZULFWqA/3anh
         ijctLStFmCkS0FqjEcsTkKYgyVMCBef5e/hn45U5WJtao69BbjnnX0nmg2AlYWZ/LIwX
         pOtE86/qf0uxaEKh6OsvboAmbhWK/1JsuEitXjEQGxuBOnAZV+l2om+6n0f265E6x9Ji
         Ic3nGMuy5sVIYrmwVzqT00L0m4I5+hivlwsGYRjnDWxQ2eWDYKDcQgqNuO983t37UaME
         oAiamk6+dy6YsJziA+N6VRqyvxJVeHHQ3x8fh3OLVvSYzBoHqw3Fet3uNYtYH9QSNZuM
         rIdw==
X-Forwarded-Encrypted: i=1; AJvYcCVcDZ4QrDhqJgN+v1isEeofgGNogqDiGLC2EPfUjuzRfomNTQnBPLT2S+C2JeNAEitpiC2p4XZ+q0Gi3g5AG3hkkEylbZPf/Dico+GobQ==
X-Gm-Message-State: AOJu0YxSQMMIerSIJK1IjhsP21teu+Zsr1/JVfwWrsgbVykCHqYmdYhh
	qcKonU+BaO4/OMnIcW6vKQmfYodnNwPQuQfheiOUOQCW1ldXkAeabvPQazxHrM0MU4iG5pd571+
	lUMo=
X-Google-Smtp-Source: AGHT+IE6SDneeeHg9D3a1eC+r7Kxx+vHcYIxoXWCqfWqC7EJ4g1k7Tnod1tgPORvJsTnxl6wTeuOdg==
X-Received: by 2002:a17:907:7e89:b0:a46:8c0a:6b91 with SMTP id qb9-20020a1709077e8900b00a468c0a6b91mr1783832ejc.11.1710520942132;
        Fri, 15 Mar 2024 09:42:22 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a461a7ba686sm1863114ejo.75.2024.03.15.09.42.21
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 09:42:21 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-568a3292916so2442792a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 09:42:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWO9bU082lFDQT1NjRV3eooHmg4yQzlAM5+FsErGel7mrWf1jIGhRPMZPxS0lc96AM6fjS422ZIy5hX5caMxjJeuh0FMx6zj4aklmQrqQ==
X-Received: by 2002:a17:906:bfc8:b0:a45:5be1:6e20 with SMTP id
 us8-20020a170906bfc800b00a455be16e20mr3108974ejb.23.1710520940765; Fri, 15
 Mar 2024 09:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240303235029.555787150@linutronix.de> <20240304005104.622511517@linutronix.de>
 <e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net>
In-Reply-To: <e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 15 Mar 2024 09:42:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=whK=G1o6RtS9DS3wEGF1KU7WLgLL1+6Se86bj8m7wwqrQ@mail.gmail.com>
Message-ID: <CAHk-=whK=G1o6RtS9DS3wEGF1KU7WLgLL1+6Se86bj8m7wwqrQ@mail.gmail.com>
Subject: Re: [patch 5/9] x86: Cure per CPU madness on UP
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	Uros Bizjak <ubizjak@gmail.com>, linux-sparse@vger.kernel.org, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Mar 2024 at 09:17, Guenter Roeck <linux@roeck-us.net> wrote:
>
> [    3.291087] RIP: 0010:rapl_cpu_online+0xf2/0x110
> [    3.291087] Code: 05 ff 8e 07 03 40 42 0f 00 48 89 43 60 e8 56 5f 12 00 8b 15 b4 84 61 02 48 8b 05 01 8f 07 03 48 c7 83 90 00 00 00 e0 84 80 b6 <48> 89 9c d0 38 01 00 00 e9 2b ff ff ff b8 f4 ff ff ff e9 47 ff ff

The code is

  mov    %rax,0x60(%rbx)
  call   0x125f5f
  mov    0x26184b4(%rip),%edx
  mov    0x3078f01(%rip),%rax
  movq   $0xffffffffb68084e0,0x90(%rbx)
  mov    %rbx,0x138(%rax,%rdx,8)                <-- trapping instruction
  jmp    <backwards>

with %rdx being some index having the value 0xffffffed (-19).

That's ENODEV.

Without line numbers (if you have debug info for that kernel, it's
good to run "scripts/decode_stacktrace.sh" on stack traces) it's hard
to really know what's up, but I strongly suspect that it's this:

        rapl_pmus->pmus[topology_logical_die_id(cpu)] = pmu;

because we have

   topology_logical_die_id(cpu) ->
       (cpu_data(cpu).topo.logical_die_id)

and we have

    c->topo.logical_die_id = topology_get_logical_id(apicid, TOPO_DIE_DOMAIN);

and topology_get_logical_id() does this:

        if (lvlid >= MAX_LOCAL_APIC)
                return -ERANGE;
        if (!test_bit(lvlid, apic_maps[at_level].map))
                return -ENODEV;

so that -ENODEV is not entirely unlikely for a UP run.

This also explains why it *used* to work - that whole thing is new to
the current merge window and came in through commit ca7e91776912
("Merge tag 'x86-apic-2024-03-10' of ...").

Thomas, over to you. I wonder if maybe all those topology macros
should just return 0 on an UP build, but that
topology_get_logical_id() thing looks a bit wrong regardless.

It really shouldn't depend on local apic data for configs that may not
*have* a local apic.

                 Linus
