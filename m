Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5101EBFF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994280; cv=none; b=hvjxwCv2Ba0UpQbG04L8HqNn6Csd9GlhI2/VcADaHMtzz7yh/3wEtWKUotkJEWEFiB34ZyVD6SMUW0FP+Q04CyDw9pJYMkw75dzeSNb9S4GP8B2uPHBbFsIwYvPaPH65YxUlyOSCSgojygQSkYHuttIbRxQRsqIsh0xnOA2XhFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994280; c=relaxed/simple;
	bh=dnnZUgzCwws9KYXi6ot0s1d3Fp6NN+N4r5wRaq6PAzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMaUpFmXuNZjgfhcgTyelzspAZq3pibdtf4U3dTExwz5cdEw0qQ40/gGHmMWlVjSt/MJmmxHcwfOgewgFYCqiR5zuSm3BzHwIEIX6y5r1x9dyWiytS9JkqrlhXGFIkt1mXh+5ZZQUVjCakdbd2HhT4NNgozQFVUnNhAIikLvMJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq3iZNlX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq3iZNlX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e31977c653so539663a91.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728994278; x=1729599078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV8FOLSLhwtyiWp+lk7vSGC6JLIndGdKNovPdihlpN4=;
        b=mq3iZNlXaEdfvprh2JbKgVDlJIg2dJ6FkEXzsaL+/Blt6qIhJPF9KLNzPFbNsA57aL
         eyagN5cHDnUVN5BPlH6Uxm66WD1200quo9pM6QYoH6OM+WoK0aDH9YhxcrrFdvz4lzRg
         waevbg1AghbXGmu5aYYP+Xqu2XXA4pnwKMmiPS+GSfQ1Tt3OvSdAVU/prXncFPwhZNF+
         EUic4pWDKAFW79P1cwt5azl8/VMGjUsHjUvLf7ZPK4azu6m5DaG65jVbcdZnqxJaYUY+
         bx4rSLsdcISgRGAdGEkUh7xudcn6DV3k5xV6qRlWVywl/14lZXSnzUz3E860v6Y8IVs7
         xtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994278; x=1729599078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV8FOLSLhwtyiWp+lk7vSGC6JLIndGdKNovPdihlpN4=;
        b=kVw+GQCWIuDZM2H0+8+/U6fzr860m1Qc1kYSDzMZ09eBFwEf+QTbA3YiVHKzwxdkVF
         GI4dv+RBFZCuPD+2CNqEilRyaPty/+oICXFD6KavUmlWXYtXmebcOFyS3s6+v8kstrST
         PkfdnkvZ5zdcAxsxWLsavtsHUxmWdjUkOvo7ZQtF+O0hRsMD89Cn47iLA8MEXi2J1Oqt
         IhCHh7tlV4fbzFYUA1uqcFJWZkCSC9ON6InfpS9BkB71i/oiUYVE0ix/LclMqggoMLQb
         ec4DK1DOZZvWZ0bf7/5MpuCZ1Nle8BgLwWJJUxuhNQdpNv8cNPV5chq0VJ0wxXXHVoGL
         5u7g==
X-Forwarded-Encrypted: i=1; AJvYcCXXA+1UbXFFxhJm0+/S3fj5EkcDUvUS18j9kASCMrut6F/Sw66pBcMkR1fBnuRTP9w4Jjtkl1ZLo3nltq/H@lists.linux.dev
X-Gm-Message-State: AOJu0YxhE4jn4yZyMx6cnGpMUCQCj0T2M6C3oV3SlZ9/CDa+Pd7eI24c
	/TuV6Opmf1zgRULCh5FQNILVKUdD87I797Aqq+MxpBZ1/x8O7qqOIJWEbGnoY2/aHLuJbBokL/a
	nPQ+Q8YKLZnjQr1lJE/WR2nyaIKg=
X-Google-Smtp-Source: AGHT+IFSfFq5YCrErjt8c8UA+f+PBcvIWdJRqe/AN44rKjjupOA/NWpgra6o1nxcyv+5NZeBZYXbe5CQMWH68x1Ky44=
X-Received: by 2002:a17:90a:bf91:b0:2e2:e860:f69d with SMTP id
 98e67ed59e1d1-2e2f0d788cbmr7356172a91.7.1728994278289; Tue, 15 Oct 2024
 05:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com> <202410151814.WmLlAkCq-lkp@intel.com>
In-Reply-To: <202410151814.WmLlAkCq-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 14:11:05 +0200
Message-ID: <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
To: kernel test robot <lkp@intel.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Tue, Oct 15, 2024 at 1:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> >> /bin/sh: 1: cannot create rust/kernel/arch_static_branch_asm.rs: Direc=
tory nonexistent

This happens because we run `RSCPP` even when it is not a target. We
can add the dependency conditionally:

@@ -423,8 +425,10 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags =3D --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o =
\
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
-       $(obj)/kernel/arch_static_branch_asm.rs FORCE
+    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
        +$(call if_changed_rule,rustc_library)
+ifneq ($(CONFIG_JUMP_LABEL),)
+$(obj)/kernel.o: $(obj)/kernel/arch_static_branch_asm.rs
+endif

Cheers,
Miguel
