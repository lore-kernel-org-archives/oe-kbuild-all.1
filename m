Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9641FC7C4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003566; cv=none; b=TiuweqvVhPXA2KXiprdPyQU6EoeS5lH8mWb3IbFcE2NtUKmyVYVLHz3ZcYBZh/nAZsyTw/ZFbDYAGzPZtV9Lv4mj9dR53/vhlH0HOVeI43ZSEh4Gyhqgk8ErPWWLfJOXlIfogROktN7aZy4275xp8D6OIvlT7Yyk+NkbbhPDjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003566; c=relaxed/simple;
	bh=1bEhqwEHmxJs9+B05nsJYv9A3NKyJkdV9GS5A58QEEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gmwRG+fE3V7/3WFQcu96dBdqARICxsF5s3S3oB/HRK4SEmTVQFpO23iTIOW6qa4n834WsOcXjhcGVc2u5yz1eGVwHKm/dJIe7MMbFVVYuIWb+XRhXHf6S6PLOy2lkG0FKLvQeAaz36hDrqBcBXuFhyy3z8DHL5DsNbVU1OWr5Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GZ0byIul; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GZ0byIul"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so3873934f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 07:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729003563; x=1729608363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bEhqwEHmxJs9+B05nsJYv9A3NKyJkdV9GS5A58QEEw=;
        b=GZ0byIule8ja/Ad1x7X/EuEjkES55YnRHTMSjwfF4/CrAQPRfPx1vI2f92ngTao5AT
         DERkw0EOnLnTMFol3shw6NTNU9yKqgMgF11khGVhuiQRgbN+RxvkNJYTL5lURXSaismM
         b1QKCVhu6fwBHScitjBhk2N+PoYvJlyzsoPqBtLHJ2bD5agrUrQU/y2ISqm/UPBKEFV4
         2cSGLX1Q3qgVUKdDXLxAj2UMUq+vN3xsjR/pJ6bKVm7HuooWLv10AEsNus/VZT0xcdot
         3luuSLxB78mvUJjbOD2CPR1zthvsG1XqFToWatAMJrJO8hVmeQVRUyaWBbTsUKOSunBh
         jrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729003563; x=1729608363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bEhqwEHmxJs9+B05nsJYv9A3NKyJkdV9GS5A58QEEw=;
        b=hjH59mRfrPSGxdrKhhWsWGa9eJj8jfS4YT7s4Y3yMfFmPthWcE9SEMogIFycGRBEk0
         LCjOg9ianWefsENMDcBIMOTcTtq1YdODwRjfzHVew916/8qhgUyX6mCETrSe06M9l7eu
         Hw2wnzuzJ8Fs8o0D3qct6okLfj2FMgcKJqNrghBblLxtTrMVXmBI+AOCZjhmr2H7gndp
         3t+V60A4xSr+1rQwjjxzvhVJLmC5usu7vSRBO05GGj9X63kUVXnclC8vPdMxrma/6tBe
         S1eSjykInBRgW04Lr9yW8kxJCDYkuz9IIbgTYjinVNf6wRE5ZH5j5zRFzT75LssAmao7
         X1hg==
X-Forwarded-Encrypted: i=1; AJvYcCUPP1j2u+ODGuJoARuIMFZVq4mBs0FEocMIMH5IEuTDfdwfr/xqzB0komO8IHiBC1Z47qgfihJkAQ8dRTHZ@lists.linux.dev
X-Gm-Message-State: AOJu0YycAPEpwYFlCgYBBrhsWN+ImtbrwSVUzasVfDgVXRFMv1B3vfvf
	PNN1tsxLCs1r0q1GPfnqCHZxeSWAnv63tm83DdgXKRfHANY4VSdaWADGrXa//njwe3QgZ/clCNU
	aJHIA8rZ7F4QJKIwjHi7jMsRoV2ny8vgkTSaC
X-Google-Smtp-Source: AGHT+IEK4Wl6/jw5iBhBo/Fx/Cp0uqUqlmPb/nuYJU9OSwXavYyNFlXi/fqkdToVUNxEJNnuM34srOxgnvxgq3tp3J8=
X-Received: by 2002:a5d:584f:0:b0:37d:5359:1ec1 with SMTP id
 ffacd0b85a97d-37d86d793acmr386815f8f.57.1729003563300; Tue, 15 Oct 2024
 07:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
 <202410151814.WmLlAkCq-lkp@intel.com> <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
 <CAH5fLghJrrq2nJu7S08bBg2sAjdibkZ4D14K9cqETafnr4CR4w@mail.gmail.com> <CANiq72kRiQvw3xWbMGRxcVJhHN0LMRa0RewxnkofVr=71KQvEA@mail.gmail.com>
In-Reply-To: <CANiq72kRiQvw3xWbMGRxcVJhHN0LMRa0RewxnkofVr=71KQvEA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 16:45:51 +0200
Message-ID: <CAH5fLgjFFmm-m8=4Qbad6X-EOjKfCytE3ncevO1u-sSn-jJF9w@mail.gmail.com>
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

On Tue, Oct 15, 2024 at 4:44=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 15, 2024 at 3:07=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Thank you. I was able to reproduce the error locally. It only happens
> > when CONFIG_JUMP_LABEL is disabled. I've verified that this fixes it.
>
> You're welcome!
>
> By the way, if you end up sending a new version, then you could
> simplify to `ifdef CONFIG_JUMP_LABEL`.

Too late! But I can do that if I send yet another version.

Alice
