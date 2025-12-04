Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB32E6CC6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851061; cv=none; b=YMFDd1Mq6TL/uxlI2AaSJePyt+7MK0qfWdWr/3JNE1FZmQo21ZoStc1n4eWkx/U6ekZPJSgYHc5Kc4ViMopv9K+XGaN0WMQttp1fsHJSNySlCBsM1TfVr9IjLMr5IVIAsIp+v18rzw6PImvxa3K/CdXMIyudyIj1aT2RqO4Qnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851061; c=relaxed/simple;
	bh=wx7YOTQm1+6xH4GoEtrFQixMVUNTd1Is2awGZzzUXxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcrQucPG6VqZRqerPje+vQe28kdsSmono5xUX8AwyMA/T4/xL0ndQajgycMUWWLivngFAN/py0TmpNmmWA/GldBqpuEo6n99+cbzgXf+MN4w6Jb7qmWtZFLrmCrcb9oF5/TfY8oiMJOhEFUuJacT9yfdEZHYkSIxqQ9lWLHw+V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTBtzOlr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTBtzOlr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-299e43c1adbso1050545ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Dec 2025 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764851059; x=1765455859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx7YOTQm1+6xH4GoEtrFQixMVUNTd1Is2awGZzzUXxU=;
        b=QTBtzOlryJmEOdz4giyluY9Ox9VdasURRpWgcaYmp7dixhT309Mi9b7BZq5iDJaKkz
         /zR0/UakFKu/84+BAlqz1g40YLiAvo1yis44pzxULw511l2rEoEyLzCrlFLfSWh2dYUy
         GKUsQRU833aFfunjq8Qsy4ZXdUnftw5AuC7M1Vo2aAQ2iD1SxYdCeWTIBAi0cjnP6IOe
         AohTaOxsm4x1M7MyauPz5+FRexxEL0DSx+W2TdTjDZqIavX3HA/AYOaNLrqAKv51NoGq
         Pn0c6P8jCCPpMCWR7b2XF7wIbmYVGEMnLswoZHWdS60ZfRX09TtJ8tDsGPvgxOUyBZSf
         jqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851059; x=1765455859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wx7YOTQm1+6xH4GoEtrFQixMVUNTd1Is2awGZzzUXxU=;
        b=J7gX0g/GCUb59vqD5ZaAKDmzwpKoNHRIgq2RHmT8FUyRN2IXR/OF8MJIx4Y2DfgVEp
         TcMipuems5mHFIBEA1xc3CZsGolsuAEK4AOEmqQxDEtH+LYuVtG5W00Kl3oyCPPoWMub
         CaMkPfTUrJbbHN8oZzZKyREVc7IBIxj7RhbF0yliTBQrFLtT0Cjvz14FJ0dTm+rTdioy
         bZKi9HT6xRZiLZZz3gGLOD+99IZ6mdNEYqX0DwLllD5j5Z0COHw2qFqGaTjgSRD/nVHa
         nKY6gDW9+s9NRVbyRZbR1sIls20vqPpEulX63pjosRj+z5mqsKlPhE7WksgqfCYieNUy
         YWHA==
X-Forwarded-Encrypted: i=1; AJvYcCWfx29loc0hxcXyRfpWC1SBdKsOb5/uxcqUcwa6yZJaMxA62qTTJY1teGhAPUVVjBfwUkrnOTJKN7Yajg9R@lists.linux.dev
X-Gm-Message-State: AOJu0YzAev0WWRlujc1rKNCMlTEikGLM0jsS/jRcBrunwQGNEzNm8+6i
	jCZY9H4zRcSN+ahFeqL8tBk8f3ne0+LHUJKKoYijPgdLnLtp2SpbXK7fnr/RE4i+bCLe4ko0I2T
	g63Fj4tHZ/5z2HudVkQi3KO1OG4Pi6Bw=
X-Gm-Gg: ASbGncusRRqw0ZTS/QMobRFO57U8xL8QG2DvuWGikHPMh0Vvorf9bRr2O8UvVaKMB4a
	FROmVFqI8O5YvWKnbmak8R0Ut4w+oQ719YHNZbmcyqQMRRn3DG+bJuxR/wUsXvtz7kCC5FdvUxj
	/oH0aWK24V+0z/2w0eLFRhoPxC0249brs08wQ0Ld2un209wLiuu4Q64Ji07XFUtBHl2gFurykln
	oK+AezocrjAnxwK88Jlbb3+Ic+VT66oxh6cAjshNwf/wx01OFuA5+v/ku/f/FBx/D19KqSCaXDe
	nPg1Z2kefnuCaKo5BrijQwubi5WbScTaZe4TWaQFqqT5M/U/HFFXeVAoX4akjf0etgRiNzxnr8D
	CB51ObVgOj6m6Vw==
X-Google-Smtp-Source: AGHT+IEGCFDBt2eoPSljCNpANqr750UNfLEzTSVY3v8vro8CTu0dsedRZV8/m4AnguLNbvon7weD3EE/mhrcNnr6gGM=
X-Received: by 2002:a05:693c:2d91:b0:2a4:3593:5fc7 with SMTP id
 5a478bee46e88-2ab97b11c4fmr3497869eec.1.1764851058645; Thu, 04 Dec 2025
 04:24:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512020454.Tf36WHw5-lkp@intel.com> <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020> <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
In-Reply-To: <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 13:24:03 +0100
X-Gm-Features: AWmQ_bm22o0HmIVipMvKSSbI8f__DLAk-7_3xkoLhOObPhxc2fM3rpD9hD8rtmY
Message-ID: <CANiq72mNQDN5cAi9XEo5X48ZNMjDoe3xkAeskFPcSjuhBCXwvg@mail.gmail.com>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Oliver Sang <oliver.sang@intel.com>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 12:59=E2=80=AFPM Daniel Gomez <da.gomez@kernel.org> =
wrote:
>
> + Any reason to use an unreleased clang version for this reports? Since c=
lang-22
> is not officially released yet, issues seen with it seem lower priority t=
han
> those reproduced with stable, released versions. Does it make sense to ac=
t
> on these kind of "bleeding edge" reports, or should we wait until they're
> confirmed on a stable release? Does 0day test both?

Some people in the kernel regularly test with unreleased compilers
(all GCC, Clang and Rust) in order to fix issues before those
compilers get actually released, e.g. ClangBuiltLinux for LLVM, I do
it for `rustc`, several people for GCC, etc.

So I guess the idea is similar for kernel test robot? There is value
on doing that, and whether one should act depends -- if it is close to
the release of the compiler, then it makes sense to try to figure out
what is breaking so that the compiler has a chance to fix it.
Otherwise, if nobody tries, we would get quite broken compilers (for
the kernel use case at least).

It is also why I think having at least a basic kernel build on the
upstream CIs of the compilers is a good idea (it already showed value
in upstream Rust and perhaps we should talk about it again in LPC for
Clang).

But, yeah, the reports can be confusing and reacting to them properly
does take time and effort (e.g. I need sometimes to bisect the
compiler etc.).

Does LKP try the bleeding edge versions only if a stable compiler
built successfully? That could perhaps help.

Andreas also suggested yesterday in our meeting to have such bleeding
edge reports perhaps more clearly marked or similar.

Cheers,
Miguel
