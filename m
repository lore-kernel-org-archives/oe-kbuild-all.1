Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B44A283C8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449253; cv=none; b=PJ2jEcgCbRx4PPEY1r05k4TfJO9rL0SQSZ7LjOmGqZWyekCBFlSN3lzjJbdKiKxBy0w6bWyeI3/PJ50B02p2/3Gi/VCyqkGrnm0LHgZxW17ekUYw14RcLy7e0WWvcnRfSzi6SmX61ud70FeYevmgYXuFoR87rMuqho/S5+xN7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449253; c=relaxed/simple;
	bh=pVfN9eS0l7ihongB0LOBdjBA6cxaKVHJrt34QSlJ1sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpvJ5LI+5vgmPNFQbiwG1Ed18/KmOCj2KET2qZeeGlemvTFUV5C9y528IP6fxN31/2LsjzShWhGWQxsyZlkGtvsfrpsGuQw0XwKhtlHQyT6b/sm3KwiZgjgjf0UgyOvMXvGiBWHey8wKhhx0NW1yt5ygPvxujQTVuLOXV9YtFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAN2FAkj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAN2FAkj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b116321aso6291362e87.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748449249; x=1749054049; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX1eTIuJOFJ1d8HmF81QUkvA4Oc+VUDTFQ5Tkm2VlKI=;
        b=ZAN2FAkjFt1iRpos5DkXpLI7uVO6ySofOhS0NdE441vb59jsiLqzvjSD84B8Oj62LY
         s1CsR+qkefX4uIvYf6eipDRNUDjn9HJQ6sIgDJSGd4Eluv1iCuZVYWc/H7FicXz41xbi
         gXDIyBcihesmFbYnt7A7DvGv3tYQ/8InTtdje/DGkVQnnSERDm7cNXxW25t4E3fmhKsE
         cdn1JdfJphcXsXmEAAOKhUYDdZYWcW6mFudBRMkTASMyymv2GTsKeW2LViybn9BRTsCi
         E9XcEDlWosKsKkXHDmlHPhjs6rXFBicMo9uP0mbuSJuZSQ/BBmsT/9/1BbrPQ7cUHYA/
         403w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748449249; x=1749054049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yX1eTIuJOFJ1d8HmF81QUkvA4Oc+VUDTFQ5Tkm2VlKI=;
        b=mWsGxC3fzo/95Mom0wYT1RqPbcGAQuB01iqq0yhFupJnl26008xdC19OaqsFD4eQno
         BXUoN0MjTGoFsblM528rCXl3QZ/X++f0VUMeNM04Xix7l03ebn/SXFDiYcjSAlfLNdQP
         c6IUltbwGJbO8VrPi7Yq46mq0klXNVAdnCaEjOOjtGvgeIkj74XLxbm0oIv0VmcjdhLW
         LPrGeIdlsYgl2Ben6fjDLqwktoXnnG3pddYoGD4gLRtfKiGuAf4qal7o6N6AxivNpsl6
         /Q9laQ/fnru6DHGebn5E2vztnbTX0kkBwr/eCHHznvS2pv9VFzUKa3XBNHB0mMa36W8p
         9zqg==
X-Forwarded-Encrypted: i=1; AJvYcCVHrw4yrM4l+fceZrsW5AFIjn3+7IHU6DfispaCKTcZA+87HZGF7Z0Gpa6hFrzAS3PqaKECqTnw7YnSP/dR@lists.linux.dev
X-Gm-Message-State: AOJu0YzSgtD3OwRT6k/K/j0Hczw3VluQZjqVBk1ESZvr9bAlfkipMebc
	zTk7MUt/eD/qoTwW8MWQcJAMq7nLkxc/VZiFRBVCv+GC1y8qU2a0YvBg37P40Utp6NMj9537YOb
	PEjb1phOiGc+pKs8azKA31M4Ly8aHbA4=
X-Gm-Gg: ASbGncsF338ej2BNYUcTBpr4ex/8SNN8bJdg1IiMwO6zGV+lI6axgllT0eRtn9IqCNV
	AZFrxOm9hDKsCWN1X5uzul1HEbkMc+bwk9TUZZx0gIqfzQvUuelbIiDZOANl7wL8NKoTs+FUCHg
	KEk0XNZoqCv2cBnpMLM5CFbE2p0TOvXz7sVaEE3b/Q0s1rUMZg
X-Google-Smtp-Source: AGHT+IERNF6nJP16os1FaKc3/sdXmm8EwNv8eCauOgOToi64bP3nXEDmXCRmFZmrwxC0g1SSj5SgySzC5xDlCsB7Oow=
X-Received: by 2002:a05:651c:214e:b0:32a:5e74:5726 with SMTP id
 38308e7fff4ca-32a5e745900mr27333001fa.38.1748449248922; Wed, 28 May 2025
 09:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527-idiomatic-match-slice-v1-1-34b0b1d1d58c@gmail.com> <202505282330.oOHtt60s-lkp@intel.com>
In-Reply-To: <202505282330.oOHtt60s-lkp@intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 28 May 2025 12:20:12 -0400
X-Gm-Features: AX0GCFtwpZSAhj_4TToLyRo1WFyFxvpTkmyybwSPHteM3wp-9wZFIJXZ0dupnGM
Message-ID: <CAJ-ks9m30hV+OiN3yO5nU47EoVfuBr=OhjS8QHpgBSWcoB4vWw@mail.gmail.com>
Subject: Re: [PATCH] rust: replace length checks with match
To: kernel test robot <lkp@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:58=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Tamir,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bfc3cd87559bc593bb32bb1482f9cae3308b6398]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/r=
ust-replace-length-checks-with-match/20250528-001121
> base:   bfc3cd87559bc593bb32bb1482f9cae3308b6398
> patch link:    https://lore.kernel.org/r/20250527-idiomatic-match-slice-v=
1-1-34b0b1d1d58c%40gmail.com
> patch subject: [PATCH] rust: replace length checks with match
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/202=
50528/202505282330.oOHtt60s-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250528/202505282330.oOHtt60s-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505282330.oOHtt60s-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    PATH=3D/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin
>    INFO PATH=3D/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cros=
s/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=3D -Wno-error=3Dretu=
rn-type -Wreturn-type -funsigned-char -Wundef W=3D1 --keep-going LLVM=3D1 -=
j24 -C source O=3D/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=3Dx86_64 S=
HELL=3D/bin/bash rustfmtcheck
>    make: Entering directory '/kbuild/src/consumer'
>    make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust=
'
> >> Diff in scripts/rustdoc_test_gen.rs at line 90:
>                 "No path candidates found for `{file}`. This is likely a =
bug in the build system, or \
>                 some files went away while compiling."
>             ),
>    -        [valid_path] =3D> {
>    -            valid_path.to_str().unwrap()
>    -        }
>    +        [valid_path] =3D> valid_path.to_str().unwrap(),
>             valid_paths =3D> {
>                 eprintln!("Several path candidates found:");
>                 for path in valid_paths {
>    make[2]: *** [Makefile:1826: rustfmt] Error 123
>    make[2]: Target 'rustfmtcheck' not remade because of errors.
>    make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'rustfmtcheck' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'rustfmtcheck' not remade because of errors.
>    make: Leaving directory '/kbuild/src/consumer'

Yep, I already noticed this. Will send v2 with proper formatting.
