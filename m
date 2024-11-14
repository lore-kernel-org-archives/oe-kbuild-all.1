Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824B01DD884
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731575397; cv=none; b=Mn+rTH7Jh+zvvAMwwbQ/c+q6JVUk4eBHOZ6aTFlVk/p1XR6alQ64WT4dgtkGnErMbmDsfaETvfO+1ykPNC6gXUmhZ2q/iie44MRnQt+XWuIo8yczsrxyNHG2sLS+CLXQ/mHnyR0wFx1dSJLRGnwpTY3eK4ZTS/uRO66UlSJOrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731575397; c=relaxed/simple;
	bh=PXXiTOHQpXHEQRGW+QOZTJIMm+Kw3J/KPuf46M5D3sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKDGObaE52/mjHSLdTMSPs54lr7R4qugZyYnvjf4cxO92z33aRcN4LDUB/UFLMeB23enP/9wmbascXCTvkszkLQ3/NpcOkw4U6KF3pWJTvfiI8xPWGJldnw6GlLGaqcmKrYm5b5ANmYV4akR2WjZfFQaZG4JUVGxOeAeoTo9HXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BYmFkLUq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BYmFkLUq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d50fad249so297565f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731575394; x=1732180194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snrIemuufDuHlApDkEdxfvq/ObcDoeWFzUnMAOE/OGg=;
        b=BYmFkLUq09WKVq7l27PpNM2zTmI8DlNlwe1RIZQZYh7PumRmF2vEfO9Th+/7VcxOrT
         YVM2FPeE6auTF9sDWIFe6rSG0bTn5qSq60oJBKhoQqDVf4vjaAAsf1KiKzqyYB5lQxjv
         7nCHXGssTUmXpNWYOhAuchB2B2IIE2eU9FRqyKfuM4QxBYWIE1QcxTXE5YpMtwtpEsqe
         fJvkyR57mP9KN9qJwdl2nIpkqRNJMTNLyqKAifvUuTBCrG+5QxPQ3n+m1MAveSQSSy+3
         vrsnrgFoqDZuxHNMyv4uZnkNh6RzTifz3ib9bDhcDhGiLBZ3K9ZeH3+PIxxmTlcjEV/X
         pCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731575394; x=1732180194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snrIemuufDuHlApDkEdxfvq/ObcDoeWFzUnMAOE/OGg=;
        b=fW1eNDOEtWaUVLKz8UzNZcMgvag1GLZX9/myuOao7dVRWVg8Hvb25oLw0NfApLlGT2
         NXYpYLmbkuQmw+L2Oq/z5DqLP9WSOG22H3viyqvTZ1Y56hPdhQPIb5AiD4v1vK4fPou0
         FeDtcQbB9Lp4B1J9lx39k4Qk4lRcB1SH18itfl439i+hByP8xCruVwNlls0JYPochTIe
         9S938tMByezzwDrfSJfcamVzMYK0K8h5xUz/yJEdm47KUBapfNxwF+8Im9Vz+XNQN6fZ
         J6RWWyEiaiQYOo+hw0Rk8h/xkp/ngkzoN7HuaS51p1SmAm19A78wWBvQ2wlefiiTUZsL
         B6Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU4AHZHWbVm9aOjYX5Ka2fTQYeWLMOvL1k0iOalIlkmgJhpq5MP/u5c63fMtv4rleO0HwxOxuJisRXRCnW0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4cuLjtj+NmQXh6K3jl5s+zTffq9raeeg5yGpyVFk3YOL9DPsr
	jmV0uoW7zuA/f7lI5hlbeJ57v8OK08RXAP7oUsGRGvXx6zSc+YAXoMCnx7GQR8Z0Pu6wvBlY6iy
	/KKpUz+1yHPTBtJvLP2HZF/hPe3iW7S+mhwWP
X-Google-Smtp-Source: AGHT+IHl0YWMjVvQXfBmpZasv/AG4TN0t/e3GEjRFSir20aLU4svh+bxXjwNfmgPiqts/mQJb7ilPfmVaSUPRQZ8974=
X-Received: by 2002:a5d:5d89:0:b0:37c:ce58:5a1a with SMTP id
 ffacd0b85a97d-381f188ca8cmr18357244f8f.54.1731575393711; Thu, 14 Nov 2024
 01:09:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411140520.VL33V6fD-lkp@intel.com>
In-Reply-To: <202411140520.VL33V6fD-lkp@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 14 Nov 2024 10:09:42 +0100
Message-ID: <CAH5fLggEzmerC6Qg1fjuc_wiy21BJQGGYdZSZA+KV=oP6q9iJg@mail.gmail.com>
Subject: Re: [linux-next:master 8233/11277] error[E0425]: cannot find function
 `rust_do_trace_rust_sample_loaded` in crate `$crate::bindings`
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 10:16=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bd05b9a700c10473c2f52bf12c5c5938c30e80b0
> commit: 91d39024e1b02914cc5e2dbc137908e29b269ce4 [8233/11277] rust: sampl=
es: add tracepoint to Rust sample
> config: x86_64-randconfig-013-20241113 (https://download.01.org/0day-ci/a=
rchive/20241114/202411140520.VL33V6fD-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241114/202411140520.VL33V6fD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411140520.VL33V6fD-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
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
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Please see:
https://lore.kernel.org/rust-for-linux/20241111201607.653149-1-ojeda@kernel=
.org/
which is already in rust-next.

Alice
