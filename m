Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129C158D96
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732005413; cv=none; b=jloJ2642jR1zalaPekB0cS1YFWzA2wNkItzOzfLBPnw+dYk1ki1DU5Yi4eYH4aJJNaza8r++PAU9H1mM1Kr4It5o+UFZB3ujK1CYleXC8KeMO5QvIa/gU+6WFfH7aE0EkLo+cyeM0qXK3wrt7tEePiNYYjY6GaQJEwKpezFPSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732005413; c=relaxed/simple;
	bh=+MTvleFySir8FtP2uB/UOknrMvhVUid7WSDjacUiN1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPgEdkKJxZft/csYobSD3rBNUvhdaacqMxbgSt35cQGfXL+p3BUMH8DK09A68Qou8HK+KEQzQYM7CQwO0QcZiiCnH9kRl9yjAsOe/Ee8ktEbslJo8R8hUUvjfq//CdHaSEiNQkQpq1rn3kU3bzrFvUmdTeb400JsuaLu+fR0d04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bw3sWGId; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bw3sWGId"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso5688465e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 00:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732005410; x=1732610210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDqTouV9BVPKs1qxw5HUNjIJ97gDgkRw2ACsRZndJJ0=;
        b=Bw3sWGIdxP1QbfEpAwHmppUTYK+ZhHciRF2RH6jyqQSoEYL60SfqNIk1WajgB8eCm2
         a/yPevKO4uCN6JVH/p566JskHb+scQAgsHWoeZWP5pQpVcaQafaBR4qEoka7mFO7BI1l
         9qSgRNRs1x1F9T6kX2ab7QZ0140RU45s43sE/ApXIRFofMbfbABiFhMgUHFP8na5Bdp4
         kquWDMEbN8mN0z0ypaj0E1m5VEXQAeFkhUIKQArZADI02dpwz9N6gM9Bv5c6gvyheh0I
         saVY9LgHewa87AVJ54+s/NwWiqQg+rHfTm1qx65LeveqdI8aErgCPTDG2kLsQHypb5xW
         U/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732005410; x=1732610210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDqTouV9BVPKs1qxw5HUNjIJ97gDgkRw2ACsRZndJJ0=;
        b=mCAhUhsy560VcymThFBnIh4czc25IXiq6Twxc5s5PrLwUkcW/XhKHkE1IT8n80gO6x
         YLbDFLnjA3blkPygZgJ5MEMufCfmVxjMhQR3PsVyM3xogzcL9gT/ioe5OJMcgiilVA9T
         Ae3oZkg4vfcCXgOc3GItCSe0IdhA8HknxBeYGOiOsinnVkcD1rJ5jRERbuwY8P5MxL7x
         aGsHuyA25dWVfaFddzgB0EdAH7KeJPdSfbENtOcygwkoiUXcVMOSfA+vwwt9/9NY40HS
         HfMOVd1pfK/xzyJg75BHwGKeurrV88PjhMGZlO5d/SsiB2Jkva+wWfvxkO7XjTnaVoQ0
         yhDg==
X-Forwarded-Encrypted: i=1; AJvYcCVvU9mJseA/TOZtrPbuwf78jnfC9oGxx6YtVzHw7nn93x5k9NtT7AC/p7lhbAZT+OWM0EPz1nRiunGcL36b@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8fIYfuaTvIyWYxOBVuTC3SwkwhNaf98fIPD11HEG2w7/TyDap
	IHaBam3bGVNuX0nt9yfEnv04g3mIV/Yqd/2wxcNW7YDVlHe0QGqyUneCs7xHyaFyIMmQwbs6baW
	3bjW9++nVwSXtjnZaj4ihIQi/2uJA+wg3BRly
X-Google-Smtp-Source: AGHT+IFn12obJ8XL6amrk2N2Qj1d2LRmnwgIFMT7b3jmYMIY7gdAA1MtHRCcurUYNkF/oO5FeyBfxH420CYhnypZ3DA=
X-Received: by 2002:a05:600c:444f:b0:42c:b905:2bf9 with SMTP id
 5b1f17b1804b1-432df74eb09mr147079455e9.16.1732005410440; Tue, 19 Nov 2024
 00:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411181440.qEdcuyh6-lkp@intel.com> <20241118202727.73646-1-aliceryhl@google.com>
 <20241118182818.7717993c@gandalf.local.home>
In-Reply-To: <20241118182818.7717993c@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 09:36:38 +0100
Message-ID: <CAH5fLgjBpz7bPvanupPSsJx3fjLAa7g7nMjLgSxjEde_KDGV2w@mail.gmail.com>
Subject: Re: [PATCH RESEND] jump_label: rust: pass a mut ptr to `static_key_count`
To: Steven Rostedt <rostedt@goodmis.org>
Cc: lkp@intel.com, boqun.feng@gmail.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 12:27=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Mon, 18 Nov 2024 20:27:26 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > When building the rust_print sample with CONFIG_JUMP_LABEL=3Dn, the Rus=
t
> > static key support falls back to using static_key_count. This function
> > accepts a mutable pointer to the `struct static_key`, but the Rust
> > abstractions are incorrectly passing a const pointer.
> >
> > This means that builds using CONFIG_JUMP_LABEL=3Dn and SAMPLE_RUST_PRIN=
T=3Dy
> > fail with the following error message:
> >
> >       error[E0308]: mismatched types
> >         --> <root>/samples/rust/rust_print_main.rs:87:5
> >          |
> >       87 | /     kernel::declare_trace! {
> >       88 | |         /// # Safety
> >       89 | |         ///
> >       90 | |         /// Always safe to call.
> >       91 | |         unsafe fn rust_sample_loaded(magic: c_int);
> >       92 | |     }
> >          | |     ^
> >          | |     |
> >          | |_____types differ in mutability
> >          |       arguments to this function are incorrect
> >          |
> >          =3D note: expected raw pointer `*mut kernel::bindings::static_=
key`
> >                     found raw pointer `*const kernel::bindings::static_=
key`
> >       note: function defined here
> >         --> <root>/rust/bindings/bindings_helpers_generated.rs:33:12
> >          |
> >       33 |     pub fn static_key_count(key: *mut static_key) -> c_int;
> >          |            ^^^^^^^^^^^^^^^^
> >
> > To fix this, insert a pointer cast so that the pointer is mutable.
>
> Hi Alice,
>
> BTW, how do you test the sample tracepoint? I see you add a tracepoint in
> the module load call, but currently we can enable module tracepoints on
> module load. How do you enable it when the rust_print module gets loaded?

I've only really used the sample in this series as a build test. The
bulk of my testing has occurred by using this tracepoint support in
Rust Binder where I have 30 different tracepoints and I've been able
to verify that I can enable them and so on there.

Alice
