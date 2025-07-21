Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE61FC0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753107465; cv=none; b=taPNIb2Xga5K0zez3M6tbSmIf8yq6F5Osq5EG4PlWh01e3hNheJqVlv9uxZgrpUVZLY9Btq+q1IDj3hSuepTGNPdJbvg2xl7j4Wh/wVP0j0XkCam3woZXdlMNTdxfJSeQCTxlUnGtpmkWHb/+lACCuxnWEUqyxe01LsYfjk9vdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753107465; c=relaxed/simple;
	bh=jx62/zzI69MGOw6Q1ltR2MwUC388v3A5IGqMmpKVPmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3MCOr2oB9Ul7VhsrMG88SDTItHvzZR2lEbqsxvyatGmSjguyGtDEV7PVzgjjiQdDKe4b0Gl0pivHvIuAVSP8/05yBNvzsFmVWjgXbOr+aIDUzW3MgLamNRdGHwFP9jihPWmc1fDrVEfPIlsDx8BcybfiuUDanYujdn3SqxoCUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+/0tb6Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+/0tb6Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso33318535e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753107462; x=1753712262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHTz2f/tCB5gJfHRUHusAnrHo0WkysiHKc8/HuxZcyk=;
        b=v+/0tb6ZkOWMa+Iwrknj9TrI/LRPowoztR4Nd/ltXSzA3LD664zicum6EpsFVPa482
         rhg3v316pr/I/D2agq/WQJPGIXhneBE1dOZLLoWPPGkveoB7M9Vo4HiYH8DzNXTrBeKM
         c7HCwwffIEMZJbGucVeN0LiBPIzwad3zymxtH3yCOZd+QtWLm6cnJA3eUClwZbYlxlOQ
         R7s/rb5HRdTF+QkXbikNXiVrK6K5/WI3XuvruKAqF8JMzC0M9eNLHnnTNnil2jj0DOWD
         6vSA1bvDQOOQ+scXpQ+uQfhm+q7UBybhIto+SeDfGXGh8r6MVBKSPxHNJUkfOYJ4PirF
         /xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753107462; x=1753712262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHTz2f/tCB5gJfHRUHusAnrHo0WkysiHKc8/HuxZcyk=;
        b=BWx+eI2GFh+G7YH/uIU2t+MbCUnLEA6QOKL+JXCcnb+CEjdwi99GysGCWMRaYr51XR
         QkS6AwmVg0hHjhjeYLGXrGfDD7RnKXm1wcbEXByXkrJ5rCW57S/ByATRWgS8wmIhIje+
         noNxwCILMyXor/iSB+9cG8IulcyUmCs5HgkTqFNkub1IvSLjfoqMrzv3WbJDP+3WPM25
         stoPDBOZNK8FTaqszJt/d/qttbWuY/RLeMbGIcnEsdsLLJg1Q9Cih26yJesqgjoxxEYB
         KD0KURns32vLifi/F1Sfto7VC4cLMqPIQU67qD//J7widmoTnUxa/AbFVHiXUhu+SUnW
         PabQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcA9tNL3TlJSYytD6MJkH+rSLNqlFrCHhupIEBj8Si9/Gmke4TlGmcM2U94qgVuTjgVbpm8DplRHwfkO31@lists.linux.dev
X-Gm-Message-State: AOJu0YyxpismsoITSYnxgVg3An3HPc2WbT8629zu2RUMWj4Iy8162XNK
	F3tHAVBGAL6+R9i3MHoLwVbVKrRYRiBbk+yg0FQm0qpjz7Jyr9N1EcH5gcDK7EYkCqvUTUR+GbY
	lvVLSbYThH64Wxb6XRSvoEacyh8r/3qoi3BvZC5LY
X-Gm-Gg: ASbGncsEIni/szOdyoYPbSrIU1DSxT8trmcTiZYoY2PNV02+OWIqS2FEOPVOkOlzrM2
	3SspUMVQUB+OqopFF3XWEVOawzFfwad93enSsnvrYszqxjNGoANri2eGPtJFRowmZEE5NGM0L+j
	IHRQLJVPGeebs81M2rZYZPbfLOXeO7U/oDfS03sfM850wilNcqw3uHDfN8N2KoZg+OFRGGoe1Qe
	1T+Wu9YTylLLx/Nk2+JCT8cLhGClruM6qwpMg==
X-Google-Smtp-Source: AGHT+IGjLzZ7/Km2FCbSNRsrArfXJV2GEMgIhjJN78UwwjSKkWJY+F2cHXQv40vfc3kSfYwQzfjjab4StDfPm4kGNEg=
X-Received: by 2002:a05:600c:5253:b0:456:1efa:8fe9 with SMTP id
 5b1f17b1804b1-4562e03a678mr216153965e9.2.1753107462190; Mon, 21 Jul 2025
 07:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250715-topics-tyr-request_irq2-v7-3-d469c0f37c07@collabora.com>
 <202507170718.AVqYqRan-lkp@intel.com> <9834736F-F70F-4290-9DE8-755A6D0D5EB8@collabora.com>
In-Reply-To: <9834736F-F70F-4290-9DE8-755A6D0D5EB8@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 21 Jul 2025 16:17:29 +0200
X-Gm-Features: Ac12FXzqc3WLYmS_rx0F_dtIhtQQ4LQMKVOtCM3xLb6rdTs9AmutrC95-1kYQiY
Message-ID: <CAH5fLggfp36q0UmF_XNLCZKn+fc1xd2hMBsYX1UrtJqBFYrf+g@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] rust: irq: add support for non-threaded IRQs and handlers
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 6:21=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
>
> > On 16 Jul 2025, at 20:45, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Daniel,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 3964d07dd821efe9680e90c51c86661a98e60a0f]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/r=
ust-irq-add-irq-module/20250715-232121
> > base:   3964d07dd821efe9680e90c51c86661a98e60a0f
> > patch link:    https://lore.kernel.org/r/20250715-topics-tyr-request_ir=
q2-v7-3-d469c0f37c07%40collabora.com
> > patch subject: [PATCH v7 3/6] rust: irq: add support for non-threaded I=
RQs and handlers
> > config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/2=
0250717/202507170718.AVqYqRan-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250717/202507170718.AVqYqRan-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202507170718.AVqYqRan-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >>> error[E0425]: cannot find value `SHARED` in module `flags`
> >   --> rust/doctests_kernel_generated.rs:4790:58
> >   |
> >   4790 |     let registration =3D Registration::new(request, flags::SHA=
RED, c_str!("my_device"), handler);
> >   |                                                          ^^^^^^ not=
 found in `flags`
> >   |
> >   help: consider importing this constant
> >   |
> >   3    + use kernel::mm::virt::flags::SHARED;
> >   |
> >   help: if you import `SHARED`, refer to it directly
> >   |
> >   4790 -     let registration =3D Registration::new(request, flags::SHA=
RED, c_str!("my_device"), handler);
> >   4790 +     let registration =3D Registration::new(request, SHARED, c_=
str!("my_device"), handler);
> >   |
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
>
> This is a single character fix, so I am waiting for the discussion on the=
 cover
> letter [0] to advance before sending a new version.
>
> [0] https://lore.kernel.org/all/DBCQKJIBVGGM.1R0QNKO3TE4N0@kernel.org/#t

My suggestion is to make the flags module private and re-export the
Flags type from the irq module. That way you don't have to write
use kernel::irq::flags::Flags;

Alice
