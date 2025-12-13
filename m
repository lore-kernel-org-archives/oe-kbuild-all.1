Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907F02ECEBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 02:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594300; cv=none; b=jE/MhAGV1fLRgR+VTF4/J/uFhW/iKGL71PAO1BvH9C9ChOR0Ufd/tw6QY6cfrOT3MoigrZqy64jxcxcc7fm9uXIKJFhfYS5YO6Kc/U60JDNC4GZx4TqQWs1N5CjE3W02YZY/92LoRWSm2bT7CehL8I3pRZNN6fNj+ctIQc+WAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594300; c=relaxed/simple;
	bh=0kh0WYhFmoO4rEBO1q6mpm9nBbpEZvlGqlt37KfCrkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HW9htqqos55q3ABNc3XH2+eAiuJwpZYy81BF2k+quvyUax+SW7pv2Kj5gWQAOkGSXoaPNPJaRX/qlHN6pl/Td9nsGHgOPOELXTWoF0U/UElvCSbXhRAAn/PsolavpEbaoFZsRiKb0Sw93b559XBnKWne/42Wss8fRTlHKm01uv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4a+NHWc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4a+NHWc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29ec714c68cso3134125ad.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 18:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765594299; x=1766199099; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPZzUAmbhd5aNyzMZPLZOSKoA+1fDvZBEx/NYII7dYQ=;
        b=f4a+NHWc6wGfik20v05ViLPl0mpL1QhyC3ligez7DdLPlIG1t4WmadDSfx1aUWRsII
         zTYAXCTb3szi84CurIs+R/zR/fQ2yi0X1CDXsRcCHodP0M+B3RYGBKuXlxX+yKkImBz9
         JHdYPWddKmPBvt8qHw7TOb7T5G1hNHkhu6ftrqYPExV/jT1LM6oFZiZH4l4JegQ+NW25
         DolxaS2MkyIN5ivDcp2nHcvxHYYICB811LlLJRqJPsI+IsNkOvQH/N/i3KG17zwloMHZ
         jNVbCYeTbfHwECllvn2jtgp4zv9OJYC6qW0pI92oZXRD8cV2Y4VrQ1m0JtqQmT1resYV
         E2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765594299; x=1766199099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPZzUAmbhd5aNyzMZPLZOSKoA+1fDvZBEx/NYII7dYQ=;
        b=ReG367PhkJCetySUGrI06a6gy0TwqVw2yfB01S96RJt1HO8XEQiACMK2iSSLTC3uCK
         TGXx2qmkBNBE66AoNopl7AjQy2EbqD27D5w2a5GIFwAqKAl/PkFGQ2DGk40ZdPIW/cr9
         L10vJggPNpW2cvf2kjofyqoTeqHAz+YjtJc77AiOZO9gneG8q3JZoVCOkVl983sjQXK5
         tx0W7rTRP9Ci8L9zM+rZKZnKDcgSWxE5kJw9IpS5r3x7oGBH0lYxx1lsX6Tz8WKPUKQw
         3IOxZlHDzwoDuTZjRvg+vvDqsIz/br43bvMxT9QwkmEu8yZfvruqoy9ML1y/3qHvCX5w
         Z63w==
X-Forwarded-Encrypted: i=1; AJvYcCUqnN+Ker9dVlO/boiA9ccfUdfxV2tEZYiwH8DBWBnJS2vxo/fl/5mm/qfcODflAWiuRoXGUS3tG4s+SKwE@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf46B67rY9YRTEQobfCzvnKahOrUkt/zjcyjUBOtkvKJ7qd1eF
	1nvQ6iH3CR1GmBBRBENXcUkSXomTax+4/9uitRjMrvyuIN7XEQIuVSw9TtYLX8Sh+lZtuJCTraB
	7s+EaW5NIzE1kYPNc69EjScEucsOdgHQ=
X-Gm-Gg: AY/fxX6NBY2WVDHhlz4jNKrgvfm9bbEYPNlLYxoBkSV/j65+2vxjBigUFj8Xn3djuTT
	r/vWBOD506EpQHLy268CHc++wFrWVJq7udbHuG+bWFkAgQoQuGQOtnyBzmlcTwYeLVUVYtUM1C0
	Cchsb8QRjchj/KHfEL+KgWgVFf78uuK0jf1m6Jm3rEG3NY22kUcE84/ewZWTFWdVXrTVLL76gvS
	EvnCelLpT8vySiSZplwplelAE5NYjnxqG3P90Se4Qh46HLJ5r4ZWCgWULkwyWzlpBocAgqd2m/d
	MmvokFSuYDLoDqE3+J9iafmJWC2F6Y2v/zIoBxZ0aHkPGtEyc4DvkqoW02EtrGAAC+r/1ZNVrlX
	6OohE3kq5QNSn
X-Google-Smtp-Source: AGHT+IFny2v1iDnxtTGSJ3uQh+TzPlo+TJVoiYJQB+fvYnj2WYRQDgbfQeVK/wdHjg5Yi1R3J0MjKOqH8gyq5vCU1JY=
X-Received: by 2002:a05:7300:8251:b0:2ab:ca55:893d with SMTP id
 5a478bee46e88-2ac3010f076mr1227402eec.4.1765594298653; Fri, 12 Dec 2025
 18:51:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com> <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <aSB623GKVDR2TBc3@google.com>
 <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
 <aSQ1VNuGHhFXYE2e@google.com> <20251124144810.2fb0e99e.gary@garyguo.net>
 <aTtqI7Mu7LYu0fpx@google.com> <20251213015006.GB3115176@ax162>
In-Reply-To: <20251213015006.GB3115176@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Dec 2025 03:51:25 +0100
X-Gm-Features: AQt7F2qqa3yIDchRzOWyQpw1nLZ5Q7uQnN-G_Qbw5VV9ic6BtM2C6sfAFPO3XxA
Message-ID: <CANiq72k2NAc-EsxeYs9F2OZLbrhUsgRbMouVHkWNU_CjL_SjKg@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 2:50=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Right. If BUILD_BUG_ON cannot be elided (i.e., its check is not
> proveably false at compile time), there will be a build error.

I think Alice was trying to say that she did not see any case where a
runtime value was used (of course, the condition itself needs to be
proveably true at build time, but e.g. it could be that it is a known
range of runtime values).

But from a quick `git grep`, it is easy to find quite a few, e.g.

    BUILD_BUG_ON(sr >=3D NR_SYS_REGS);
    BUILD_BUG_ON(addr > 0xfff);
    BUILD_BUG_ON(index >=3D KVM_MAX_NR_INTEL_FIXED_COUNTERS);
    BUILD_BUG_ON(bits !=3D 16 && bits !=3D 32 && bits !=3D 64);

where those variables are parameters of `static __always_inline`
functions, i.e. the conceptual equivalent of what we do in Rust.

If the use case is valid in C, then it should be valid in Rust too. In
other words, I don't want to penalize Rust by not being able to use a
nice tool we use in C.

Cheers,
Miguel
