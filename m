Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317D1AF4EF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730715250; cv=none; b=BVyDVkmSSOugiahEULV79EuYQ2FTTgW+PD/0Mc43V71iNj9WAOIBEd4RC2dHoshqN8u4de2XToWD06hFhcEK2KZzR+ql5iqPI5QvKjHNVU039p8niqA56+ATRYJemGoIBl8iZFJLiRrGZ9JeHvqtfW10Ajz1rBA2RVW77WkmSeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730715250; c=relaxed/simple;
	bh=1ZD8l+C1EuzgucsrrDGFXbeA8HL3duQOdkk9LUjOOuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdDIu7UYwQNzjIjEVIznCAMeOrjemVVuf5u5ts337hXORkQa3nIKSGwLnuBgj5PvicPlFe6t1RE8O4tRzFg1QZjDN6pFRU9OLYsuK1rWP0wPk10bGAeasbCk5YvGxLuUM2wrwqUbQRBcRBMNZvjXrGUM1sjJ9KrENc6oHWtB0lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qkdVeBFP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qkdVeBFP"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539eb97f26aso1695426e87.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 Nov 2024 02:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730715246; x=1731320046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4c7jIDPXYCos97zH52V3Rx0a/Pe9j9klHJ/m3x5c878=;
        b=qkdVeBFPVU7AKUQpCmT03zN0buVPsI5iUPrRxAR8T2TmbngHqTTVWPzk2lqJ3kWRr5
         ljhE3Bm/kgV3SJOh0YCLS8zdnnYC80QH72K60dJh+fspJ/ZVH9mROn3JhcWxbGOjsxdk
         v1OhZ27mrqNQ3SOINf31Vk4hHvMa2roRqLDyxxnzDDiFwarsN7t2O/+hLOcuDBc3eq6o
         uaFsSIZK6FqoREfuTneIQhUe98W3Egyf3p4AXfpCkXJYjaeCVQnhl+zW+Szza0FYZR/S
         LtWLB3U3rDsjiQfAncJkgj+HVnQbEUKkYtNyaYkanbpmk1Wm5KaHDIZ32kBuIfAk29KZ
         aCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730715246; x=1731320046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4c7jIDPXYCos97zH52V3Rx0a/Pe9j9klHJ/m3x5c878=;
        b=PeDEJWsvqxyMYGXXRcIJNci3LExMtehQrUMozaB6L+GOD/3L/lMUGhjzGgtaJhfRNM
         q+1IUYXq5uGoOHtzYgy1doO0U/pOIbTz2Q+1Dyz5yzfyv8o+CWPMc02qFCb5ImXyRcYl
         gEn5hPSosc52jquiIH/W+3fTS0fDOcPwplfJhwAsW2NIzknk2Z12C/TFithgM22Gkhki
         BaxNSR7ba/4PdmY81S7Pe7EuUMHPvLGwm8BsO7+eZH9uZPO1+W/xIl3oVEOdlY/ui1Zw
         Tfs0CRO9V7hWvg6jQohp8+De9Xd2A3npIEaRASr70kgrKhZTQSpY77XlrHsEBtE8hMJ+
         2T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCP4mM0MXKdkdTkLAHD/zgdb+biIl2rXMFGuwn8JLH8fKrbMEAie08lSEaPcf+9SrVLcSGKPsafPTHfgzK@lists.linux.dev
X-Gm-Message-State: AOJu0YyBVHIRQaAHiS+mSk2EFYrxOylq2/u5deFw6ahnxyG+QQoNxlm0
	t4QoYo7GIlzV9YXu6D3T34zLPzOj0sQgCxHub/yAMmI1QQodGEgfwqcWyGE3yEHyz9T1nq52CrX
	xVBk2HcyGXonENGvHDOeS1lrQkct82Tu4+BA1
X-Google-Smtp-Source: AGHT+IF3YrSYDNpUh7K6DP1BrHft72F43XaFavJhNPR1z+HcVXMbGOoX4JuofOBYs8pgr4OQ7WmvjdXbt+mvTRqeQfM=
X-Received: by 2002:a05:6512:3041:b0:539:e6bf:ca97 with SMTP id
 2adb3069b0e04-53b7ecf28d7mr10644101e87.32.1730715245823; Mon, 04 Nov 2024
 02:14:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030-tracepoint-v12-3-eec7f0f8ad22@google.com> <202411021421.jZ0FSDq6-lkp@intel.com>
In-Reply-To: <202411021421.jZ0FSDq6-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 4 Nov 2024 11:13:53 +0100
Message-ID: <CAH5fLgjOxfKR+HE9KZRCuBGVW26adM=r4AxSCJ2B-G2eG_4FzA@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: samples: add tracepoint to Rust sample
To: kernel test robot <lkp@intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 8:08=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Alice,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on eb887c4567d1b0e7684c026fe7df44afa96589e6]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-ad=
d-static_branch_unlikely-for-static_key_false/20241031-000709
> base:   eb887c4567d1b0e7684c026fe7df44afa96589e6
> patch link:    https://lore.kernel.org/r/20241030-tracepoint-v12-3-eec7f0=
f8ad22%40google.com
> patch subject: [PATCH v12 3/5] rust: samples: add tracepoint to Rust samp=
le
> config: x86_64-randconfig-103-20241101 (https://download.01.org/0day-ci/a=
rchive/20241102/202411021421.jZ0FSDq6-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241102/202411021421.jZ0FSDq6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411021421.jZ0FSDq6-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0425]: cannot find value `__tracepoint_rust_sample_loaded` in c=
rate `$crate::bindings`
>    --> samples/rust/rust_print.rs:87:5
>    |
>    87 | /     kernel::declare_trace! {
>    88 | |         /// # Safety
>    89 | |         ///
>    90 | |         /// Always safe to call.
>    91 | |         unsafe fn rust_sample_loaded(magic: c_int);
>    92 | |     }
>    | |_____^ not found in `$crate::bindings`
>    |
>    =3D note: this error originates in the macro `kernel::declare_trace` (=
in Nightly builds, run with -Z macro-backtrace for more info)
> --
> >> error[E0425]: cannot find function `rust_do_trace_rust_sample_loaded` =
in crate `$crate::bindings`
>    --> samples/rust/rust_print.rs:87:5
>    |
>    87 | /     kernel::declare_trace! {
>    88 | |         /// # Safety
>    89 | |         ///
>    90 | |         /// Always safe to call.
>    91 | |         unsafe fn rust_sample_loaded(magic: c_int);
>    92 | |     }
>    | |_____^ not found in `$crate::bindings`
>    |
>    =3D note: this error originates in the macro `kernel::declare_trace` (=
in Nightly builds, run with -Z macro-backtrace for more info)

This bot is using a buggy bindgen. Please see
https://lore.kernel.org/all/20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcf=
e@google.com/
which was also mentioned in the cover letter.

Alice
