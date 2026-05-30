Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A77B3469FC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162686; cv=none; b=XqFArzJziu92fduR/R5M1Urw5bfqB2awkZVU9MwPT0MfA+qD6rJsbhqit3mQ+My2lq4kYqryMA5kEZcSOIP0ddO0nUqhblylbcafbpzcdZm/EDxi1hEPQEVfqaxFXrz3Es4YiNneqiZzQqlPmemk0n1sTqaxDweOibsDa6Zsa4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162686; c=relaxed/simple;
	bh=4KUDK6B0s6RkrWxUeqc+fLP+EiLFcfa0g8VHf8rZGgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8R5sUJ4qhx4ClIffVV3ilpfvyPRqUjpaYSS1gENT+LerujS8Y9l1H0r3Xs+/IL9ZlmuYn5+r0r5sNYlas389tWNB/fyuCccgPm8iYj7cv/QifkzfTijxXcOiJo9Er7N7l4yja3OMTqsYHWI4of9kew1lCsY0ht/EOn5SH79AQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59b6227df10so897054e0c.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 10:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162684; x=1780767484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Dx7VWztqqPuXtOufyjrsXX2R4dmvaZeD7a7Au9IIJU=;
        b=MAsxToTxcTH8zSFTEYMcHMshpF+c74UIWw0fmh6CNAexV1H+Y4OhdlBR5qgv6I1oi6
         0eLFhi1CsDwFh+UEuBB5S7K7E3SK85iy9vwhS4DR7VfB7/BAChEPo5p9l+RPv5QwjZDk
         IZo8DxRJkYyJDx5AOuwU2/foAIvdHk63nQaHZdvQ1D1xxphmip6OKVmSY0Rtsbo00+fT
         av3X3LDySFRd3h16UopMQ9FA37Vg+2QOhYKDaw1uOYovVZ5x9QxVYe4Athit7UPgjbjs
         T/qbTR1ntmJfXIeLCIedUGskvSnkUnSUr3EJip6XD0c/inFRBuAjgSLG5kiNTMDg+SCs
         qJoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QZx7jh97Ld1GHO3XKfvrOSY+cB678ICHKo5CplY/vMZz6VpDPSsk4K2fe3bzSjFDkEcMWNBk8ANW5Mx78@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh3LnMGJJbHSI2thryXTSGzcGr0t7MQEa6fQDGB8UK8MaVYWEs
	8u6qjooN2jQqYj01Wn7waLLVsnPEt0I+wvlgU/203KIlwhxYd66MdXY1hBe3stFX
X-Gm-Gg: Acq92OFX7KvAloGbc04DaKU6ByEYyfOpfwiOGq6V88zqdbgnAqbn675jJ24NigHk1zd
	Qu6Q62q2TEAagdG5E7EZ8tyCgI+PNFSS4T2QBEoy+XteCSZIZqS6NiEv2yppYniLlt7a13YoZNl
	VIvkZJUxuL4QkR9JfM+YhwpGAIIGprQZHUaKEjzE9iwcrMA71ZsuaFF/35dvxdVTgJdE0X8Q6NP
	ugeKO2GbzXw1ut2fUcIwHN354E+qyGJsT5lh0fPvnTDDBZjwiQwd7T6mo5dVE+j9LlAMqPBweO9
	mHqZ7kU8MAEVClYg9k4wPCLKlT1ANIsnJwhx7IGHXVz0FNSBUGa3EYT7DLyyk7e3rnOLMHZvEf+
	iHX6e5e2tfKYwYgvV4OXqOcypLN8wHQTX8ioFYwvMf1SUNIH45wfY6p48q6s5uBZCNTHR10abbf
	8cvJ0vOhHBYJyLq66XN+DGquF9euNuVxXGqoyGBrCQbBObNxIN0aX3aYMsmd5JEofwdMVkJk4=
X-Received: by 2002:a05:6122:1ace:b0:575:3b34:28bd with SMTP id 71dfb90a1353d-59bf86b9cefmr1938183e0c.8.1780162683817;
        Sat, 30 May 2026 10:38:03 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-59b7521675bsm2722961e0c.13.2026.05.30.10.38.03
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 10:38:03 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-96393ce9a8aso1809436241.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 10:38:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/NsJKtbf+zK3vln9Uxa3h1UmoCZ9CgrXVlL5WlpUEG7GYyNBeoPK59FWbq6Q9dLE7NyVCqk0xemokmCfkz@lists.linux.dev
X-Received: by 2002:a05:6102:5344:b0:631:2973:5c2c with SMTP id
 ada2fe7eead31-6c693648008mr1745058137.21.1780162682834; Sat, 30 May 2026
 10:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605300905.msiJHWF3-lkp@intel.com> <09db37b5-808e-44c4-ae41-ff9594e39c4b@mailbox.org>
In-Reply-To: <09db37b5-808e-44c4-ae41-ff9594e39c4b@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 30 May 2026 19:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgMDPiRUJwOUv0Tab_D5qhQumChhN1288tTtXeqTLz7Q@mail.gmail.com>
X-Gm-Features: AVHnY4KadnsFVXb8v9SLs46ptd_23LKWhdBxkArHwu-W7QdYKD1_9Djism1iRl4
Message-ID: <CAMuHMdUgMDPiRUJwOUv0Tab_D5qhQumChhN1288tTtXeqTLz7Q@mail.gmail.com>
Subject: Re: [linux-next:master 7314/9870] arch/arm64/boot/dts/renesas/r8a779md-geist.dtb:
 clock-controller@4f (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one
 of ['cirrus,cs2000-cp']
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sat, 30 May 2026 at 17:33, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/30/26 10:02 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   7da7f07112610a520567421dd2ffcb51beaefbcc
> > commit: a3dcb0a3204f75f6841d8f7d0dc232f51706dfb9 [7314/9870] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist
> > config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> > dtschema: 2026.5.dev9+gdf9ad30c5
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605300905.msiJHWF3-lkp@intel.com/
> >
> > dtcheck warnings: (new ones prefixed by >>)
> >>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of ['cirrus,cs2000-cp']
> >       from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
> >>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp'] is too long
> >       from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
> >>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: /soc/i2c@e6510000/clock-controller@4f: failed to match any schema with compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp']
> >     arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: mmc@ee100000 (renesas,sdhi-r8a779md): compatible: 'oneOf' conditional failed, one must be fixed:

> Geert, could you please pick up:
>
> [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
>
> Or would you prefer me to send it separately as V3 ?

Oh, I missed that sboyd provided his ack; I thought he was gonna take it.
I will add it tomorrow...
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
