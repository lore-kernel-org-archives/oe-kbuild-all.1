Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A61C07FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728997635; cv=none; b=b0AZKJQOtz1Pbq5lXJULsikOVtTOil4W0k32tD4c0xpSCHabHpIqfiw8dLB68hOmPuTx4sr6wWWcIDC5SwjTsJTVmkijH6LLkvh8OaCn0DtB53BJuUAx6Cv5zOR/noZz47gh+H+l6TD7MTy3EpcFd25cHBBFU7kI9nlcrmkHA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728997635; c=relaxed/simple;
	bh=RAFtXXlMObqVzV2d+gmuJ5R6yL2BTETgZusCP73IhnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThtbTkqm6cYpoBHvuMGgH9Q2zVsoZAjIhMFfMnZNCzGNQH8KRL1cVmRcIsFYQc7dqYSmv7di67GUEuaG7f6cZQmUzVfQrI9tILmU2qcxbN6kbDld2DETh7q8adj4QOSkbO68mVR39auft+N7+qfJGNgVoev47gJz2+HU/8mxzms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AKm/EqTn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AKm/EqTn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4305413aec9so51499435e9.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 06:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728997631; x=1729602431; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en9jFwXT2bDiA0LT5HaPdVoOH8lCOJ0LwIRdXejUMhk=;
        b=AKm/EqTnj6JLWcgq+G2sEIOgBjlel0VB4UCNpPhNL0N3UUdSSs1XBNeXpn6kZyzKhv
         al5ndiiJsR0mjv3c8W18RCwYsl8SGQhVfwvYF5Zf/4bbR1BfDQplTYFcG43inBFRFJZT
         iUFm6jO69F8qBQCUbVzUoKrTHcdQ8/7ShhAwVrePnbdGN+K5rRard2UQJafhAL6LnEBp
         DKSA5+UMBWnbBX5gslghdnVfXO9NeOD1VmJ7SAmTFArORMUBwkbRUN8GaB2OnO/5cec8
         JTWWALoGreOAXnFSjHriQaes3n6SLdNQg+4Pg0npRSWom2oZwr+0H+H9x9l/C8imOvmy
         uHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728997631; x=1729602431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=en9jFwXT2bDiA0LT5HaPdVoOH8lCOJ0LwIRdXejUMhk=;
        b=WuzwxHUje1AhIYhGH3uInAiTXEW7EYw0LkTBlgyV29Gtw1U7dRQPGWFk+Xj32Yj0Ww
         kSsA79TpTut5Wio4sQ8GHvJGbV8PpqxpMbERkz+9Vi2AiiAyxTnH/1mMYBXI5sVnNS3s
         LgyfWmQWn1BI0M52ehPY/34B6DcVyrUlIV5kSkoyjv6k+CG+xfNYY5DY+3Rgyd5ORI1R
         RMO8lx5+6KKPONV85Z4t/SH5QFOpKujLa4elS0G0lsC66gX4K14HtVKEF8B6VSi7NZpP
         gfe4vFtvKXSTBkyHFepsE2hu20AqZKvu1tc+szYo2tNk8j+YaUq7E6TQ4RbNSZy6itjv
         /McQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdPUMSso1Rf7hytnlWiLnCxjim2WZgAyXjI64YmIxz4k4dm6TEcZKASM3QODHIPbhZ9DDPOi5nqlpBZtbB@lists.linux.dev
X-Gm-Message-State: AOJu0YxSFc671tf1e/uS/J/Q9h1fJlM4X+pPXWFqAM8IP0F1/wUThc7o
	6v9fLRYZSYrluvdEST+ZVBJRx/SJlPzZm59cm2YFtILCSIrdYoE6YPXsnmm+UOPceIESrC5W1Pk
	OdodoZROHmfzijMUEtsIJggw0p0sShnJsrDnU
X-Google-Smtp-Source: AGHT+IF+ejFusSyTSFm0RCp9pxJc8mmToy5lXNSY48Rr+wd/q53EvtiwpWkYjw4u1eyqqetmcpQmCrujFgNR9X+o7To=
X-Received: by 2002:a05:600c:b8d:b0:42c:cd88:d0f4 with SMTP id
 5b1f17b1804b1-4314a379091mr4398285e9.22.1728997630948; Tue, 15 Oct 2024
 06:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
 <202410151814.WmLlAkCq-lkp@intel.com> <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
In-Reply-To: <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 15:06:59 +0200
Message-ID: <CAH5fLghJrrq2nJu7S08bBg2sAjdibkZ4D14K9cqETafnr4CR4w@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
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

On Tue, Oct 15, 2024 at 2:11=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 15, 2024 at 1:06=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > >> /bin/sh: 1: cannot create rust/kernel/arch_static_branch_asm.rs: Dir=
ectory nonexistent
>
> This happens because we run `RSCPP` even when it is not a target. We
> can add the dependency conditionally:
>
> @@ -423,8 +425,10 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
>  $(obj)/kernel.o: private rustc_target_flags =3D --extern alloc \
>      --extern build_error --extern macros --extern bindings --extern uapi
>  $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.=
o \
> -    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
> -       $(obj)/kernel/arch_static_branch_asm.rs FORCE
> +    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
>         +$(call if_changed_rule,rustc_library)
> +ifneq ($(CONFIG_JUMP_LABEL),)
> +$(obj)/kernel.o: $(obj)/kernel/arch_static_branch_asm.rs
> +endif

Thank you. I was able to reproduce the error locally. It only happens
when CONFIG_JUMP_LABEL is disabled. I've verified that this fixes it.

Alice
