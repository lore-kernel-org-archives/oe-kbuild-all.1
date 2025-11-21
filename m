Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193B1DE8AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734920; cv=none; b=C3OMUBoEAJoNCrwpoHVaxck0o7MS9UnvXXjJJjuJf5hHc9zAwYcnhHb15ENUsQIASGZVb7XVAlqL9djhIiq0PEaWfkSH43nLyIHJKw6i0QzVgDE87DAKgh18AxxQH1xmwrUwn8hMsbkN1KNqaEL+r7WSdfBSQJib8WoKJJpnYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734920; c=relaxed/simple;
	bh=RFR3V1kjpvSdxAsPiYx8UtQOBKC0WuXfpNS4qKQz+TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0PYp390d4rpxsM51ehUkl95o3MEU9Jsj3NEbZs3nN0g+HRlY6IBuG5jp2R3twjoiOKMwCBVvIw56RfvooxUCrdETbqPajimLbsHZgPe/FEgWSOGZGXIR+54v/Kl5ujT/PxpJFvE0TjZ0yesDOCBTbSBA4/inExaaTGt0HoX53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZSnCFJh; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZSnCFJh"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc07266d011so51431a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763734918; x=1764339718; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFR3V1kjpvSdxAsPiYx8UtQOBKC0WuXfpNS4qKQz+TQ=;
        b=VZSnCFJhOaD4DKI9PJIc/XoJEuv/3sLQD/eC7AbXR3DmLO1UZRTGvaBC9/paep2SXt
         2BaVHKGmAwN2diC/2xarIMb7FLcVhq5Kim+2liOXCdRCWBVz+x06rcTL0irJHX9BB0Bb
         N0Fq2vd0LHNfU6vrBU61MZuOO4yQO/E++Qs7TTS8Kj42DvNwTKZu9gBF5QscGxcjC+n2
         4yc7rQtD2pxMu1YA4dCdMQh1evvgm2dXvx8Yy78O9s1RPyY+NkDe8oUB96hiRbDgN7HS
         a4n93Za7y811gxXJMK1LbsJ+i8vc9zxlY7DtK/vnGMHCJML6QgG2+X0VwWZ9XAf55IME
         3tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734918; x=1764339718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFR3V1kjpvSdxAsPiYx8UtQOBKC0WuXfpNS4qKQz+TQ=;
        b=tzs3KjA7VoNA9Rnl1QfUc1kqDsADGu+R2KzOhYJfw8arQpUm0Kxskc6cOnBSgEbix/
         WeQkXclU6gDQ29Mv5fPcaP8WxelpJRq4iCsvw5PUbIZBgkN08YLndVHFB+X2VZxTuyJx
         OQfiS/0tyx0IyRJXOxR+AlL04K5gYD5BQ2P+cbUTrG4YK5ipbEkYEyE2UgTiS/Pqw0sZ
         P2kuFBPmTTYgktU9L1/yQHvHgaXtWsLUIEGsXUsPRNjXIrMwAs6ecKiuPtQwdtSVIMy7
         xkIeMB1BagvF9M9OQExqliL+7oYHJFQ1Rhb1N4Z/6jCh3mRs+RtSJbDfc6n8a6faDnWo
         XVMw==
X-Forwarded-Encrypted: i=1; AJvYcCV7KakZZohV2nH9+ca9bBowFpRjv+JLWzuyk/Ab924876EfasQqwskmImToHrf+yoGcTCMrVsabYBIS3L9q@lists.linux.dev
X-Gm-Message-State: AOJu0YwJb+jEzVtnyvjrZkFMz8YvZsYPeLG3J7PmDAco+EEqbZf+8PA2
	2v+laGrQYy1rl1mgdBMZ57Gzo4DqzQhm04Y+BPcEvjhryYsvd+j0S6bgQDD9tCwJpYlNRK8CmaH
	WjGHTscGXfkB4Kn38h9to0AJ5pB0ejQU=
X-Gm-Gg: ASbGncuiXpa7QWG5kkAsCWjxlpgY6yoNpBAcBOIK8LhNWOVADds8pEFVaIhjXT9aNvz
	REG2xHkct18tY0OxcFGD/9tYWASnJJh2+Z86Lpt9UiDTeMwBZq3opfN76fCKLH9qKJsSoG8rVml
	o7SAUXsg0Bin5Vc62muPoVHc9NBL3ppoGqD34xHxcbv8NOtbv3BndN8T9LNFuoqjcO4v/csAqD0
	MIMPySr2FYzSlsnez7lBmo8mThU+nQCMwa5XYWXqI2Qw5nnicceUb0mO0VAlVU/zrSZDtSocHxc
	IPprnQBsW0hU3FFSiwVAYUs2obAQmc3WbRx6/s+oeNRXjTPXphAo5BXUJ4Qm+K4+7zHRr55c+Es
	bSv7LEVLnMVPYDA==
X-Google-Smtp-Source: AGHT+IGxgGStt/Y22K+JAx7fQyUc5IwSKSdul7Ur4fV9rcsaVu624t/wqTaDPbm6gJD4VZMySt2L8cgvvFVuT+BFc/E=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr573676eec.2.1763734918154; Fri, 21 Nov 2025
 06:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
In-Reply-To: <aSBy3HQ9Z-h2LbB8@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 15:21:45 +0100
X-Gm-Features: AWmQ_bltZJf8aT4AG5SSFuJR5htkKbAvAmWm-6LDkIIZH4sdUIX3MWvzZ0DLe6k
Message-ID: <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This kind of thing is why I keep saying build_error() is too fragile to
> be used at all.

Adding `unsafe` blocks for things that should be able to be statically
known isn't great.

`build_assert!` is just too useful, so it is best to try to understand
what can be done, or find an equivalent solution. Gary et al. may have
some input here.

Perhaps we need to resort to a macro, that would at least be better
than adding `unsafe` blocks. It is what C does in many cases, after
all.

Cheers,
Miguel
