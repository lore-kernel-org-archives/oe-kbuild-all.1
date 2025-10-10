Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBE3245019
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760079561; cv=none; b=ROLIxGCesd+c0d+nufrnCo3eIqoOhoQfKRMnIBFgLXP9NqBQ6i7VOH5jpF6jViqswLoIKS3u97AKnxG44Zduc0dEIK1va08cP9O4bmB6VUf867IAQhwcT8lC3MzVeyBZP4UVBOwA5kl1gN3Kxlrf06K43CcBY8Fbs2yTciN0CFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760079561; c=relaxed/simple;
	bh=2dB8tTCAO9ji3Z4boU5e7IS4dANk0Sx09hvrwHzIYTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ytd+/V7XqAdCdNDXx31uSJ1bn5N13FA7Dp8wo3by0q1eWVcoqM7C2p/yi+SoUDE1DsxNHt/AuNABNVIVFP0dOxjOphaExouAeLSYXWc8HmZoE8VaiL2M8XPCzSaHPLxat4Y36JEYsVuEBGYeS/ZwfVdPe9/zPI1UQ4dTMLGHEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJrpBy45; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJrpBy45"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2698d47e6e7so3043835ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Oct 2025 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760079559; x=1760684359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/KsRtAPQyYYfQyL6T3MHYdC3MZg30zHcUpFS/EA2b8=;
        b=DJrpBy45jQ72ugpw+wS1yJKBIFoguKlKPSJBGKzSwnrj2qoPWSHOhOPOBzyDAIwRwc
         fWzBlDLZNnROwiZpwIsGVHeEQAHvDvOznnw63z/WWfCOSyEelimyCVquOm588T5sHqar
         oQM1fBfJd4veUh24a4hrUyqBexgQ/Y4tFb4H2ViOozQ6JGqucbFap8GwvPGlNxtnAm7T
         SeRSQdbNEOuF01a7zG633j1NQX7m/N45hPhP8v+QoNmJTgyYPmpAN09310i/2MHI08a6
         I2eMMTzoLFMhrhHx3EQ+fsnxoavd73B2VCP/chJSp5w9SqBvSEB4DS8Y4P7x+mI7Gcir
         vKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760079559; x=1760684359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/KsRtAPQyYYfQyL6T3MHYdC3MZg30zHcUpFS/EA2b8=;
        b=mA4SpE64C7beBvr+LO25aujrLp+LrL2pYev4Ft7QSsm7PGTOb0pSZJ6Ubibk3wS1/B
         U6nF2xm2VWXudrbDftL5aTpjMGq1V3M2sENvIgNRmoXX64SPxwbvYuypCCy4fExq2cKM
         cG9zHtQavOA/CBAly+KxwOQAhwCG1xnmgARbZrZbyMEv51DYhIniUupnmHhu/Yl8qjzb
         OmewfRlI1fbbXFUsrP+KX7Pm5S3xSQN+ZVZdAiebCsKa1Xb+fRY9CMWTPQCz4gB4wLF6
         jGnWY2ViNpnHRb5NRx7ulrW3WLGJ2S62WaPXwGcL/oooQb43GGy8WREnRFhpFI+I4Ywq
         jR5w==
X-Forwarded-Encrypted: i=1; AJvYcCW3gLDiU/0MuqS5feE4ZExfp0dO0wSTNGSzYlQT7Rwj9s82f67NQtQmLP5BWioYW3hkdBhLrr27c3JT3hJG@lists.linux.dev
X-Gm-Message-State: AOJu0YwTD2l3FuUeWfXBfjpZtZzODGCAfOYjoUtHXqadVAEiwlUacRa+
	vhYJhW5YzeWmi/bo7BDoeVniRLNhu3AhiHvb6Qs5LiVWROcyfix6uO0P78TWuST/y2o3S4RSGKM
	vl7PZ8kRnes1TlsYy31W13IGn12cAdRI=
X-Gm-Gg: ASbGncs9k3ulDYVcls/habsE0H2Sqb4Y4rfcV2vyGy62SDFBr+e9wWSLmNuv14nUHyi
	HEzZ9fBdsV4WyD3F5D47O2pbl2fkFEfKpnAGgPFEaS+ZP6f+Vgu+6e9lJjeW+fwPLsL9pAwKHfi
	rhH8aj6ToIAxorzIwxdNlUq6wxvl8VyrVJWU8uZZD3kb8aoXhzf0+3p5k9xYxgD3CsQPhGGMj3O
	Lvxw7SXZ9fySet/xSF6HD0+7ZNVfyofB250GhzIzS3DJI1HKkrN6cW/DX09tIpdQS3Mo9XtocGB
	jIXenewRRYtUS4qEjiyhR3m/btoM/pZjTF9tJuK6znCb
X-Google-Smtp-Source: AGHT+IEUQCZh2bXNZHQ88G1WlQFzYGLfnLI6ghhtXSvp0Cccxl6SfEYz7wbupJhdzFbhRIa9rBWq/hVI+k012AHDODc=
X-Received: by 2002:a17:902:ce87:b0:27e:eabe:7604 with SMTP id
 d9443c01a7336-29027449af2mr78609005ad.9.1760079559298; Thu, 09 Oct 2025
 23:59:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510100127.yuqhg8uo-lkp@intel.com> <20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
 <CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com> <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
In-Reply-To: <20251010060618.GA80465@dev-dsk-acsjakub-1b-6f9934e2.eu-west-1.amazon.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Oct 2025 08:59:06 +0200
X-Gm-Features: AS18NWBsqvp1_UAZLl54SYhCuFPQy0caeuUUUgRAWv4x_WbqElbX_D_UZSSrijI
Message-ID: <CANiq72kndiqwEm-OZLd6JumAaBy7KrzYf_rDjwhtw5Uh4vdTCg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ`
 in crate `bindings`
To: Jakub Acs <acsjakub@amazon.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 8:07=E2=80=AFAM Jakub Acs <acsjakub@amazon.de> wrot=
e:
>
> FWIW Alice suggested the enum version and we discussed adjustment to the
> patch in thread [1]. I was going to send new version of the patch as
> soon as I figure out how to test for the issue pointed out by Derrick in
> [2].
>
> Please let me know if that is desired or whether you're taking care of
> it here. And/or how else I can help.

The `enum` approach is what we usually suggest if possible, and in
this case it also avoids having to replicate conditional compilation
on the Rust side, which is good.

However, using it here as-is means the resulting type of
`VM_MERGEABLE` is `unsigned int`, not `unsigned long` -- but wasn't
that an issue? i.e.

    https://lore.kernel.org/all/20250930130023.60106-1-acsjakub@amazon.de/

We may be able to use a dummy larger constant to force the compiler to
pick a bigger underlying type, e.g. something like:

    __VM_FLAGS_FORCE_UL    =3D BIT(63),

But note that older versions of GCC and Clang keep the smaller `enum`
constants as `int` (i.e. small and signed), even if they will pick
`unsigned long` for the bigger ones. Newer versions will pick
`unsigned long` for all.

The best would be to use C23-like `enum : unsigned long { ... }`, but
sadly we don't have a recent enough GCC as a minimum in the kernel
(GCC 13).

If there are extra complications with the `enum` approach (i.e. second
link), then perhaps just replicating it on the Rust side is simpler.

Cheers,
Miguel
