Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106398;
	b=AJWOkiSEREq4aZGCNxIoeBJdd6jfbYoKyAd9mQ9IrNAfxnElFckC46GbOGFYaarp828p
	 GFbaYd5DTXvNnTEArbqjJsOoDWivfyUkVbsWy+p4O2uR18vZvfzLzZuBG6wmOx5ZSmV2x
	 bzh+MRGwh2zwccEDVZirAz0VuJAlk6A2IQMBvwdUqZ92PpXkWHZ/U2306m1R9Y4vnk6Jw
	 69qkXCFvd78hbiMb3rNdG7AhiKwKTFUgNPNjUZZDqBq+4bkInhY30RPPlSOjZ/h0PFWj9
	 cnslGOUVl6Npe6jUIc3gjk1LKOl3qcbTxAx1sHofWuurEJV6FaHBtB4zrTNaUUMAuFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To;
	bh=22yvN5w4LekXsoG2Jr2gH7s62z7rAEnSkLMnu5caXgw=;
	b=TbjzcXzP7Uw3LbeY8vIlT59j4hK+Tq7wNg+tl7BNwi9ZobA3/HDs1HECFCBAE5/fYjk8
	 qXMptFtsN67SrJ0BPK/DXpMFTylDNKuhMyqHCJPwPdZyN+c4mV8RqRsQuQ1rtRa3mXVdP
	 JV0Vs0PbFUQYo95w6y5NXvrJOBxbQD+6GKdcPRufxmwmOvz08leKd736KM/Y67XpSPZae
	 EVBZvpEGCSuBFRijL9gjveJC5RU9OL0zZl3aWyyxPp7SFv3kTgwS5gYRhAEotit/UjPxP
	 WDQ25Zwv+Tw11KIWb3fua17N467bYLJ5RY5c8oO+tZ1fLnJBmJD8Vkiqro3oi5nT8cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joaOGp2f;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A84606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 02:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A84606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joaOGp2f
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06c60065fso37091b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Nov 2026 18:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794106397; x=1794711197; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=22yvN5w4LekXsoG2Jr2gH7s62z7rAEnSkLMnu5caXgw=;
        b=joaOGp2fuo+M9T04z276WQdQR3ISKDSCy6b1Y6o/uQInT76/UGR4VFBwYn1bxT8qIv
         msuzVNDwHyNXDw7iAl7Zzq33ddsCB2jvazvP8wSizB5FvP7yLdFbhC2vLmcIM0OntitX
         DxuLBCsBZKfmv5J0nmYxNB5GrN+R709wCnFXQLrzZEqmzix94oQIksX87UIBxjCi4N3E
         ioLQxkEZA4u8eQ9Jcf0YzJt6O4O5iLRlQQbKnu19cKYRgdi9XqHxFPWIX8k4J4+daRlx
         Hin18Um4mT6+qIVj/GgBbSGQQE2T2od56AyMIaffyELpbynzSbPjKUWeoAhUDSeTt8v5
         8c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794106397; x=1794711197;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22yvN5w4LekXsoG2Jr2gH7s62z7rAEnSkLMnu5caXgw=;
        b=M6/pNAoCd2yQ8Q0UOq06z1+QlyYikvwe5pZqeD4mk7riMjiU0C6hng/4tz+tMDp7ce
         NgqIk3e13Chvaj95sUKJE5RxIis3oxZW3m+zSIl+9reA+P0jXU1Sv3Ut6X2wsm/SsyTK
         sLyws5nmiFkS4YlzpOo7ggA4rsb/nOasfRa6p8ISuIjj4s6uvH3+cEPZcVr0B4dUVwmw
         cyx7vjiqz5H5OobHax5s6OZ6+LmNe7/VZKkpe51BxsN+vWh22OQkub64f/oeTIDu43up
         mLKK5CEdFUAArxFSAxRsjMEdTCBLo3QY0HSp++PJ5LZecoYS8yJz+tS7aEzCbOelZ1C1
         bOsg==
X-Gm-Message-State: APuU4Z+EQ0ZcvJe0kaToCXmlaqWklcj0KoR3wufB6osTRcQd+W+hlPYO
	kVbiTOxRWgIXJ7X7RyWbskjpFp38FVslLOxvrAAY0J+txmTrcUdiQLbQ
X-Gm-Gg: AYBFou19xf2lgOeiJMGVAAeJ0PCOS+ztSvzFdfgFALl7vzZvrpWE+9a4wVo/xk0kW+Q
	eLbuc6mgghG6x+5VztkZT/Qnt8yYl+KIU+B7S3Z4p2WBmewedJqaACySdpy1yzwcktCdI/I4MFh
	d5z7w/22Jq9eReykrwxNAyk9O3S5ZVZYs9m6qFgiyLwgpriZ4kz4fT3lcpHtwnwmhMY193o83hf
	V6Osz/dDqFp7K26I2ZMuAIDs31OzVqJu2WZISnz14uXnWMbryYtnL4MrCGnFArq29im4ftebrND
	HOAgLnGWWV9d5U/qIzKQfZ4peFmNLxMAj0Amqjzg4XmELgCBZaQD9+r2P14Q2l9jZzzR2AE2PwK
	RAzPRevsjeZF4FLUzvTdOU7ovp5JAYro49b34bh6S7drZzzOEuwmTfLPnTF/qtn8kOBxd5Wi+pK
	QO7QivqB6r9roRICFunPwQjHPYXC5vzYQ00+Fu5gaaE5kNU/UwTmBpGGb0LXk722tWXnnvj96FL
	iPaDN66rVVMnAFH3GMYFax9JATmI++DhCVQQtjPHtt2qkV1NlPu8aqYSD/Ew4XyI1cgWTkAro5O
	tsoWnEzVPyrSqeOFQXYh13qBhnErDvXh4L1olDtRMlgWG96o+w4hbdG5bqBiqtgOaM2etxFbHFz
	9RJm+G4yZx72XsevlBHPrwf2RKwHMMTvLb0Oa6UaxPmr1Gim4TfKup9E=
X-Received: by 2002:a05:6a20:a123:b0:3e0:e349:f672 with SMTP id adf61e73a8af0-3eed55de967mr494828637.82.1794106396880;
        Sat, 07 Nov 2026 18:53:16 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b649821abesm193541b3a.34.2026.11.07.18.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 18:53:15 -0800 (PST)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 02:53:15 +0000
Message-Id: <DMPHMZT0ORT5.3FFQQHE7YNP6J@gmail.com>
Subject: Re: [linux-next:master 3430/4145] kernel/bpf/scev.c:736:33-42:
 duplicated argument to && or ||
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "kernel test robot" <lkp@intel.com>, "Alexei Starovoitov"
 <ast@kernel.org>
Cc: <oe-kbuild-all@lists.linux.dev>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <202611080024.A0phXMMa-lkp@intel.com>
In-Reply-To: <202611080024.A0phXMMa-lkp@intel.com>

On Sat Nov 7, 2026 at 11:54 PM UTC, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> commit: 28a373cb0f6a579049ffe92747575213a442673f [3430/4145] bpf: Fold su=
ms of constants and two shifts by 32 in scalar evolution
> config: hexagon-randconfig-r2101-20261107 (https://download.01.org/0day-c=
i/archive/20261108/202611080024.A0phXMMa-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0=
fa861dbbf46e5a75f621406fd91cb015d8754bf)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611080024.A0phXMMa-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> kernel/bpf/scev.c:736:33-42: duplicated argument to && or ||

...

>    735				if (class =3D=3D BPF_ALU64 && op =3D=3D BPF_RSH && id >=3D 0 &&
>  > 736				    is_imm(scev, id, &imm) && imm =3D=3D 32 &&
>    737				    is_binop(scev, BPF_LSH, reg2expr[dst], &l, &r) &&
>    738				    is_imm(scev, r, &imm) && imm =3D=3D 32)
>    739					return replace_reg(scev, e, dst, expr1(scev, ZEXT32, l));

No. they are not duplicated, but yeah the coding style is questionable.
