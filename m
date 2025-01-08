Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEDB1A76BC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325619; cv=none; b=sZSBvlOJosyJtXQYkCwn03EtiZa+bFIKCd+4fMSUbrAomYnlbEQ1EebFbh+Rbvb7T9CUMyg3qZ+sO8ycChEvHtbAwzoBzoiM/PObYnwwSocL+wsrkAdwqXy6OWOLLhKvvj95pa2nheOJ9PCVkjxCxUsZpc+2sPnWr+y2tPtHS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325619; c=relaxed/simple;
	bh=x5mIvVNKGyy2aWx0VaD1TwfygyA0rOOc55zKg1dxEPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeYmw0nuailqY87W6OtJ6apN1iZ9bAPSqm9x7pDj5La65kFGOjkocDj42VPDz02RvDdymjNqkg9hfn5nvd3cK08f6xrH5CMjw/pqtw2hAiaQGekU3kbuDSVpN1Ea3qAb2a0d8Oy2301jINF3IOHSoda2OEfWE+2tWVfeaUbxpi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hTT3jTgz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hTT3jTgz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385dece873cso6190074f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Jan 2025 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736325616; x=1736930416; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5mIvVNKGyy2aWx0VaD1TwfygyA0rOOc55zKg1dxEPg=;
        b=hTT3jTgznnRY7SDxdTXAKGaqBkrZbX26+M+xwc7a5zgpOzlksHErZ/LuKtRuPx3Q/1
         U79lZdtF7zTaDnPs1Ane5nKHX8rOzug1DXVRAI/WAFG9IEkez6EaxerMBzuFKrTbpXSA
         CfQqp6+QklRFmEU+FXW+aJL0kxdwtEn+F0H7JxngViwREvpHbaFTgPfNztExa2vPYyfF
         v776ZSIRzgVv7Dd8u51WnRRi28NT37DJrRZW9lLEE6dAoE21JNV5qjmfeEDuWR/DTO2n
         AqyUttGNLKcTBSkX071/FcG/8Zimf32DI+83ORk2G98eSOjKmt+pEuWjgU7fE4CHncTP
         LEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325616; x=1736930416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5mIvVNKGyy2aWx0VaD1TwfygyA0rOOc55zKg1dxEPg=;
        b=ndXdk0WNh1zRM/S7+1PURWFGFbT4UcN3us/Dxy0/yjqT0IJ7CywckFGx8Pvg5GMYFl
         s+iELxzLBvR3cVZM45iIbRcjXxvPihIT+IwjltaK9y8L+AQBGslyg/1jU135xgRCmIHv
         rvokNJEKLxaFWEkFTcKy0Fypjq/Pw7Oua+yk6WgPXQtuQKq/8lt6mKZujx4qrTJEIOoO
         IQ6DDdnfHwLmOhcQZpR2VVOef9/Q9DeeIy4/VlZNdrUihooLFf/aRVpv9Q+5H8A1u1TS
         S4FGEl0qMAZzstsi8R6V5hHwhb31kvPSfiquBcQZKlLqqVVVUeH+sWtkugDoMoZ2LLmn
         lITg==
X-Forwarded-Encrypted: i=1; AJvYcCX+cmD3xXaSxJn/4582xajofVW09zh/s4J0nsdgG1EuXu4DzR/zgHdHLbOb24s/VDlu/apm9SqHDtK+y2sZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyAf7LJmNkHDaiM8VE2C938OtefuoC+PPU7bNJkBxbaR3+/ckFE
	F7AzTNjxSPRHjshfYWUYemT9SJbusCLcbHhoU5L/KXzs/EmIwhxGVwYuomjOKdwSBNsARO4gXPq
	AvexcDYsCUEUQfIicBlxKFE9AiVfAV+/XK5JL
X-Gm-Gg: ASbGncvBjFAleehWONiR2m5pQsa8x73snULA3KsHFGPsVb0fwTk5hkVX/VcksDwfgHF
	JNf+uDmcHbWx6Slh3YMzkiwXDsGrsSwnjJ6dLXAFMSodW86wn4BOEAKsIXUxNxTX2bOBX
X-Google-Smtp-Source: AGHT+IFl8H+0Y5zTJzlBfI5aIydyFDaWJ1GV39q6UZ01B11fzHBRDnHXE0FV7FUDOqKvCczWXUZt4FhIPpZacI5ligg=
X-Received: by 2002:a5d:47c4:0:b0:385:f892:c8fe with SMTP id
 ffacd0b85a97d-38a87306ddcmr1605877f8f.21.1736325615885; Wed, 08 Jan 2025
 00:40:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311507.14xdiaIX-lkp@intel.com> <Z3OyANq7fAkCs+Qi@rli9-mobl>
 <CAH5fLghNqbu2LO6SMr2Nsciji5k01tagaAEMZQ-WKJ8b9E56hg@mail.gmail.com> <Z33NUGpt7FM6FKuJ@rli9-mobl>
In-Reply-To: <Z33NUGpt7FM6FKuJ@rli9-mobl>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 09:40:02 +0100
X-Gm-Features: AbW1kvZq1qORT0gFbWfSwaaryRaKvr2Sdho2Mc5xAhDXDEz__7FPQG8iIFou4rQ
Message-ID: <CAH5fLgj0X6AkUjv72axApE7=+47qXSPFdqp71dSPG7URsFpbMA@mail.gmail.com>
Subject: Re: error[E0425]: cannot find value `__tracepoint_rust_sample_loaded`
 in crate `$crate::bindings`
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 1:57=E2=80=AFAM Philip Li <philip.li@intel.com> wrot=
e:
>
> On Mon, Jan 06, 2025 at 12:49:43PM +0100, Alice Ryhl wrote:
> > On Tue, Dec 31, 2024 at 9:58=E2=80=AFAM Philip Li <philip.li@intel.com>=
 wrote:
> > >
> > > On Tue, Dec 31, 2024 at 03:15:47PM +0800, kernel test robot wrote:
> > > > Hi Alice,
> > > >
> > > > FYI, the error/warning still remains.
> > >
> > > Kindly ignore this report, which had already been discussed in [1]
> > >
> > > [1] https://lore.kernel.org/oe-kbuild-all/CAH5fLggEzmerC6Qg1fjuc_wiy2=
1BJQGGYdZSZA+KV=3DoP6q9iJg@mail.gmail.com/
> >
> > Would it be possible to upgrade bindgen used by this robot? Please see:
> > https://lore.kernel.org/all/CAH5fLgjmtuZ7Sxp49GoGC079sXqS4wmsEmZKM-T4Mh=
9FycDYGQ@mail.gmail.com/
>
> Sorry, i missed this suggestion. Sure, the bot side will follow up to
> upgrade bindgen, so far, it follows scripts/min-tool-version.sh to choose
> which version to use.

Thanks!

Alice
