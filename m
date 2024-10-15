Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE721C07D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003440; cv=none; b=FZlo04zqLCzMq8kXnalXyaL2ajzpFS7Ligb6Rq/JHgZGra8MnQr8ALWUCMiowu/E16UaAhZgwQ5xVvhrWTq4ZSKNKFAbJFcPHLsUvFXbg+NUMJXe/oMSJty9cTEKhe/Wozmw7quqptZ3bX74SCP5CYXXFPi/XOnW6VeHw75SQl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003440; c=relaxed/simple;
	bh=A7CxIg3FylzHgSJxPQ/0P9yWq+JAO79Um66+WxhE0R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEwtDQLYd2mK4KKyTlONxGGbVQSHcADm7i0Ob1GZ77uSxTth9FB49752uOUONUL/vt57+XjMAWKwLrPJvF01SSANS6VxAtpDFh9ukCO8H2AVfC76HxXOq5IlU0EwIuhlEBGDCs7evz9nkexR3fm0jPq0VBh8gLTry1rT3SAOQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQFU0ifX; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQFU0ifX"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20b533c6865so3184075ad.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729003438; x=1729608238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7CxIg3FylzHgSJxPQ/0P9yWq+JAO79Um66+WxhE0R8=;
        b=kQFU0ifXMVEcVT96tGP2kjtnOXBSw+OKuks4lue3gGSclZyQYbCN7hD6J6la4pZJ2h
         F9GlPerS0dEb8b+EOTdszkW7I3GLHzihVbD9EbEHNZR8zVFRTRLIlJE+tGPpaRpM9o0z
         /45h1B9jQGjucVjZHsQADo3UDPu3b9hVs4GUNn00ME3Tdcp3P3X+0Gg3vissLMJJdhIZ
         jKuGY8zI8E81Jm+B8Y2r6qff5KSEj/gYDQbBUlhZ3e7RFfp/Au5uZHgr5VI1Os3xerAI
         jGedOkF2p2qInmrqJ2swkI+MatE956a/3y63v/H322FuFPxhk+N/274NOhPSGKsZ/kLj
         I4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729003438; x=1729608238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7CxIg3FylzHgSJxPQ/0P9yWq+JAO79Um66+WxhE0R8=;
        b=oknWpADZ4Ux1RMXKI3ooPa3zhDh8EBUvvKQkA6QfD7yD4I4rPND/4ajFdBzm2hIIW1
         4AIbE4k44Dm5rfKeIEHMna3TOphEWv70JZxVy40d0LkY+CY8jH9vjQQBtlgzRnqdc6H0
         8MwglnosR2E/lDeRy2pH1tsb9j0ayUmsIrBOx9P+3FKwspEwtXsWAI3ruzNya4rag5qG
         csWcOjCV2P6pP8gVzYr/5kvP286F+dE55C2RkatVS0yjhU0yLIYIUlIdvEUDa7rqc3IV
         MDHCz0mO/l5JTycM4vTH3YjlE4WPUFjiZ7rRwrlqm7xLoNHB5kmhJsiQCWYCd+lqGgzc
         nCTw==
X-Forwarded-Encrypted: i=1; AJvYcCWroARyQxrKQ7cvL7NhUH+2L9su0Q8EBlg5VHQ9yBKRmkWCX/woUUZnzfV4yhDO0kQT5lshLzpDrehcRboS@lists.linux.dev
X-Gm-Message-State: AOJu0YwKgqKsRWjUESA1/uNBiUkmAOW3Hu5OnhLwEXRt5EJgBr4A3vAZ
	aWk5U6XJe453/nPwtzppP+pm/QyN4/3+YyCbtwar8UVc1V56609y6YW8WBk023s4hHsDnL9KShL
	N+wAFFYfuAqh5zu3nKsJl+KU8n1o=
X-Google-Smtp-Source: AGHT+IFoXEBo1ZT1pXaD7KXeYP4P5odzuHy9MKmBB6t4PDsesuSr1w9SzhznkWVEoeEweWV6j6xd4RR7WhJRY5Fpauk=
X-Received: by 2002:a17:903:2343:b0:20b:b93f:2fec with SMTP id
 d9443c01a7336-20ca169ee11mr87190225ad.8.1729003438182; Tue, 15 Oct 2024
 07:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
 <202410151814.WmLlAkCq-lkp@intel.com> <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
 <CAH5fLghJrrq2nJu7S08bBg2sAjdibkZ4D14K9cqETafnr4CR4w@mail.gmail.com>
In-Reply-To: <CAH5fLghJrrq2nJu7S08bBg2sAjdibkZ4D14K9cqETafnr4CR4w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 16:43:44 +0200
Message-ID: <CANiq72kRiQvw3xWbMGRxcVJhHN0LMRa0RewxnkofVr=71KQvEA@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
To: Alice Ryhl <aliceryhl@google.com>
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

On Tue, Oct 15, 2024 at 3:07=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Thank you. I was able to reproduce the error locally. It only happens
> when CONFIG_JUMP_LABEL is disabled. I've verified that this fixes it.

You're welcome!

By the way, if you end up sending a new version, then you could
simplify to `ifdef CONFIG_JUMP_LABEL`.

Cheers,
Miguel
