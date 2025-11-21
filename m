Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769EC3358BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763711124; cv=none; b=AsWmPzuoFqikovKtXqE5kbQOq/GsIzOn3CA0SAQ8tl7+FDCVk/axgQxba2Kq23T4G1iYfDkBepYqNSlZrkhR8v0N1W7alY2EYzjwrrVUeAmwySLyCqcg3Ssd4u/ScMvr/ytuIhRawMCUnvgWDhTEE6vbGGT38eDtICZIN2bSj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763711124; c=relaxed/simple;
	bh=tfMBHvx70V3U/Bwlu6ZMBGE4s9HLUwj/TYltsTaRrCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+7MqToYY0fgxjLpX1+5Kj86/JWlHY+nUq+daMU5Z1cG6fln5sdYHtxBwN1Y6/s7uJMPqTdkIt7tC4d2ZFfAgrDtEFOW7X/DfgNIGZ4Bx0vLrFXOqrUW8kQbIqJH6bDYssR+QT3xxAy2h8I1x0txwDrMgGR1XhyoDI2irhA7pHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NE42Jm6+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NE42Jm6+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b31c610fcso1448362f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 23:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763711121; x=1764315921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNfeCE1e6MaDdJHL836IZwvD2ivh/Lyc/8YqLS2OgkQ=;
        b=NE42Jm6+zI4sOZqD0QTYG7Z1drkyEBUQiNSawvKqP/2yqIq+HJ41WJAHpCHXdsd8y3
         GAl8yaRcz1b5VxRaK8Touyj+ka+yESoFOQHDRFb1EKwMJipxydV8Th0QyDfTXjExNjup
         tKuyZPk8v9Tnk9EumKx3/EgiyooCjw4qDYmP/gGBYybdWP0pLfCOjGHdYYm7PyITsiuN
         a/wBQoxQly4lxUYjDQX5RONBM1BkTj3ULdndA6EX7h1T/77Z4e7xggfE6w/Gk0hDB2kh
         GJiNQvyXsbNfMf9iDpFh281EQZTHyAOA5azsgQCQnYg/B982jHSbfzD4HmuuZhNrVnqm
         Dpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763711121; x=1764315921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNfeCE1e6MaDdJHL836IZwvD2ivh/Lyc/8YqLS2OgkQ=;
        b=lAGil5qAjRNrqfLIBHJxX7tsDx7lcHJ/F5xZfI7yW1cKvuZtpVnI4BqFmbr0GiGF6x
         j+IN7soCpApSa5BWjtaQFsmx533yG+7GeAvZcGBbSYW5OoPfMRExLU+Gn+xRuJIXvOQL
         6fKtQz/hh5CG7EvHDVOhbP4SiQ8JIjTJjCf2GBhqwUY9+EVhlL6pc3FGXwZ8yIgJHVcv
         Fqzsz8n98sl0CxqiX4jImUZLgCb32b1S7lfzLnjlD7fCSiH+lx75yH81FDlwCyYkecF1
         O08ibvXpJ7cgE2bNZzLpErSDVNFzAbKM2k5E/xkcdMMYyvhh26d3rd3P1hEdAUB6BN72
         EVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXySWXKReynNsjm7bA+QVAycptnPLeGRyTSUcIttoLnd36DImwa3+eJBAieRZEeq8h/YPUt3cyFahseuIk9@lists.linux.dev
X-Gm-Message-State: AOJu0YydE4kdDGdMecJpDR7vI1eLyLETlBHKXuOajKENVBy2X+qajBB7
	Gp3Zk4CLbpM/eAz6xOu/V0+/qTX4R3tvMhZLKR6N9T4f4IYAAIAaPZjKckmNPCEaaLqK3x/jnCn
	sgyxjsPu0d7d16+/kXSlr/3qZtvd9qqr+LKgC5gNM
X-Gm-Gg: ASbGncsW0X0u/7no1WKAqhZ55cmhK51E6nvDVmWj1XEyU1gpV+bMJeVX515FoTjEaTI
	4ojWdmkPUFqTzuAAI8xp6BJAA9x2qdGhqXtTU+B0u6cdYoddygFAdUpRDrSp40UdJYRYwhp/AsU
	nWBVBjm2VW+pFjaDECyNq96YuzceaIivXbVJUS5FJkCTJOAT4xwsmIZd/UuJWd3aBYpW61QR/t/
	JYUII6jgO+X++rvXJv1H9b14VFXU2eAvDalQkoOtqBol2LIyHGftneV6ivwGyRRzvzJEK/G
X-Google-Smtp-Source: AGHT+IH4bZU0UC8ntMpOj8UwK7NUsoW/1eQMXB9eAcOiATG0ToN8lvJWyCDvGHUuulamSK0loazLKlpdBDK6wLYFVDQ=
X-Received: by 2002:a05:6000:1888:b0:42b:3ace:63c6 with SMTP id
 ffacd0b85a97d-42cc1cbcdfcmr1124534f8f.16.1763711120617; Thu, 20 Nov 2025
 23:45:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210649.lhQnt194-lkp@intel.com>
In-Reply-To: <202511210649.lhQnt194-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 21 Nov 2025 08:45:07 +0100
X-Gm-Features: AWmQ_bkq0yEtWhBGMaX2_lZAXxg8uRUT2e1Q2Tt7JvF8tfBss-ozFIzLA-BFKvI
Message-ID: <CAH5fLgjOcqg3p4y=gkTr5EXJzFTkWsr575psi6uCb1NZOyK9yg@mail.gmail.com>
Subject: Re: [linux-next:master 2964/10599] error[E0609]: no field `dev` on
 type `drm_gem_object`
To: kernel test robot <lkp@intel.com>
Cc: Lyude Paul <lyude@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 11:48=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f [2964/10599] rust: drm/g=
em: Remove Object.dev
> config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archi=
ve/20251121/202511210649.lhQnt194-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251121/202511210649.lhQnt194-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511210649.lhQnt194-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0609]: no field `dev` on type `drm_gem_object`
>    --> rust/kernel/drm/gem/mod.rs:231:57
>    |
>    231 |         unsafe { drm::Device::from_raw((*self.as_raw()).dev) }
>    |                                                         ^^^ unknown =
field
>    |
>    =3D note: available field is: `_address`

I don't really see how this error can happen.

This is a 32-bit x86 CONFIG_UML config ... maybe something with that?

Alice
