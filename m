Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C251DD0EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729006285; cv=none; b=GBoX6fpfdni9TDmYcozgjczdjCyn4Y+rF7yU4vmYM0LavMkgRR+YcPDktt5VzD3U2ulWpDGuXHxjwyk4CMFmTfC3ciJer+LXLXyXj6Nc0jRAlryegLOBR6X53OSQT/r3aXg2UrQD9F2OXMDV4flNrbMLVp+DCmtEPhFVX7LduMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729006285; c=relaxed/simple;
	bh=XYJf7hrcLT7Ow0dgGMK3ItjJvo1qX/WLHMjBflskpp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQ3goPXzUCyoi7KG8YZhEarDQcKguEsyyYR25mAXMqDGZigHr/1SZns1zqOV5Q1e5QIYrVC6ZjsJpGsnHnJBUJ82hWzkQ5G/IQYGWLeDxA6Lu5Y+JXFrHuDW0854vlTJGumWlSnJ6CevEb/zGGk7aD0lkmFY2huOFct0NeTH57g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4vzrB4F; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4vzrB4F"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ca17bf0d9so3708525ad.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729006283; x=1729611083; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYJf7hrcLT7Ow0dgGMK3ItjJvo1qX/WLHMjBflskpp8=;
        b=f4vzrB4F6SjMn9nwmY4Zm0uSdXF20xWq3FP63JwQQp9bT51PQ2IV4LC8OgC5BJ5UKe
         4R9nUchubTPzInNTv6wB0EtercpsV6oJTete0+UIrXSyvP3hbHYfUgYExNCP0eRFPPO7
         bBHPnF3szL1pAiL3dyZkic9PfRRtxdth35Q7LaCMvNmZcMCKqIJ/4QKOlEfFSIPPIhBu
         avu6gD2wbeJPsoqq4owj3/5NUaRJwqrhO78ZvBB7f0XgM3JvWKEPlbiqENe85GLSDDPC
         6Bvos8iXL5Wv4QsClMyWnLQhkaGM4mMBfyqBsPUba15Pvh1ih4dWljuZuAENvZg6XokH
         AY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729006283; x=1729611083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYJf7hrcLT7Ow0dgGMK3ItjJvo1qX/WLHMjBflskpp8=;
        b=fgTG6DIMYiMteX/nM/B1unvbwBngf0kLPqwnEg2ibYD2Wn5X8tpFwD8ydPauvm0yLb
         1wdUNBsXNwqMCIo++ktToU0FEAOblzzcrzlhR8RjlkGy/y5wJqjeTki18eifzQx3Y8aa
         obDq7ZxiUjOjkzhhn1akPmXvdoxCmZ/Jp0+/ohgKqfgdd9vkZT1ZvV6/JSbjhgGervn/
         ScfGZydiAedld6neUP21sgrz523xP6Y767dRKr6SgBOhd/sy5gBxyhnaQ1TCgaK2OVJ4
         UKV0gilbtQ3nJ9eqTGsI/ZGnyDQeIS0MMtdpjtpNDKIStuHJoCwPWt1ZwX+ULpS4QqW7
         h4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg/xFsk99CL4zt3/NBOR1C+JIn2rEL4JPpKWaee0t3skvf1Hxp8cwcuIotaP5ZMqSS3x58SajkQ+pzoEZM@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4P8O2uscLbWspTgUlY+2ULdXvuZZKEalrFwa5npidmMu0IYHq
	CN0I+on16c1cJVvu7OgGVNxNNUhfgoiAtKybkCOqd2AcmfX/B9/dXbmxOV3tDNoPBCMfZNCCrZz
	p8nYNcQ6Iar133gRYiQqBYwy8ImE=
X-Google-Smtp-Source: AGHT+IFgGW52eztBAkDuewDmtmXhOGFk9GZOZdh7DbttGzN3ZkEhOvpiLgnEe8CkavcbYb8B+mBuvtNrTixMpXJBb9s=
X-Received: by 2002:a17:902:c402:b0:20b:99cd:c27e with SMTP id
 d9443c01a7336-20ca1425487mr86305455ad.3.1729006283310; Tue, 15 Oct 2024
 08:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
 <202410151814.WmLlAkCq-lkp@intel.com> <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
 <CAH5fLghJrrq2nJu7S08bBg2sAjdibkZ4D14K9cqETafnr4CR4w@mail.gmail.com>
 <CANiq72kRiQvw3xWbMGRxcVJhHN0LMRa0RewxnkofVr=71KQvEA@mail.gmail.com> <CAH5fLgjFFmm-m8=4Qbad6X-EOjKfCytE3ncevO1u-sSn-jJF9w@mail.gmail.com>
In-Reply-To: <CAH5fLgjFFmm-m8=4Qbad6X-EOjKfCytE3ncevO1u-sSn-jJF9w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 17:31:11 +0200
Message-ID: <CANiq72nHnecUS1H2t8AMx1oyY8j35HcEzMxeZDTp2aqjv+qksg@mail.gmail.com>
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

On Tue, Oct 15, 2024 at 4:46=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Too late! But I can do that if I send yet another version.

Yeah, I meant after the one you already sent :)

Cheers,
Miguel
