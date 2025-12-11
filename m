Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C9729E101
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495021; cv=none; b=b3xYitFlVq029u2Az7ZUvO7JiT3NSe1n8mgd5Fcvc1m2g5OTC1tAVCkER/nkJgwqaHWDk3Wg5IkuQkdpIBRjeIYQ2CObNlH4WppIQmuiKBSoolAoC9PZg6s7fPuioEz55zKV5PxsbpWhEjy0ZXoc8sth3iSfOfGPOxGmBjEvASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495021; c=relaxed/simple;
	bh=8mnSFiy27QdOh3ieBINJ04d3omCzK2ZejjJJGCV7188=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOQqkdBXAzxyl7DPvfnvQa2maaTqhCABCcevYMCg9LAplMkBCvObRPWvdS57cvrR+I/cVhpht7qDu3jI1T6Ex5qguA2GJqZByEWqieu1wmlxsvTa0HxzyXluAmIjDmazGzgSUZnDtkDmhu36ecRU2WXEHF++uja//CG42guarRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5LQRVRt; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5LQRVRt"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295351ad2f5so943585ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765495019; x=1766099819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mnSFiy27QdOh3ieBINJ04d3omCzK2ZejjJJGCV7188=;
        b=j5LQRVRtClmG1PCTM6zrLtl6G3GCq3h2/rFbAR0n7OhsiotbJHQoWDUsjsPW1xmPw4
         95P0NvuYeQpNcB/3OhHGT6cB6XOCgq/BDhdffP0QEZeReSvmDcbCUf/cKGCp92qKDrLe
         oTVQlvs/7Vj+lCqI/MuPUTVl3oT4xJzfwwKOIgLwUfmP2KLErTWrf1EJ51H0qkTSYjHA
         /qrISLgbwQbO3hFxeNjF1qfoRwszt7Ug1tdQsNwlUqFSpAxjKqmOEfn7VGvTGBL8DUta
         trLXxIz/y7r0ZebN6cYXgMpW0B1Kki3aBi/gn5VxxcANR07Br4qD/J3fX5fw2wbphaMe
         KVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495019; x=1766099819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8mnSFiy27QdOh3ieBINJ04d3omCzK2ZejjJJGCV7188=;
        b=eXi9s+1lhocv8QtEQv7n8i27d0j9oy01wk0tLw15TwIPJC2oqqISuqOcPK/44fHDpm
         8IAWz6xDdbk0eQ6z9qZrIUx0mlg05nxvStSApqNyG9Zmp5dhdBEobu/gBFx2TIagHZA9
         o2hmv1ovo576eUXY0tsnYeoC3wvMWsL92qnvD2RTeMTnPrpAcmEKWLE/CnjcrYZqD/wh
         EMi5hkzhBUa4ZnE26SqNnF7blPY9fJmf7TasoPAp+HtHsyOExTfoolDyBe7Xwru7/Rpu
         4vb9272OWYUOfWw5BCa9yTRZ42usN7L3yt1Wu6gcKysT2p7ILRpti0Uf6KgtfjP8RSVA
         CXpw==
X-Forwarded-Encrypted: i=1; AJvYcCXyXMqXcOfPCZRhnuIkCXg2I/mg9iA+sSqSBbQPOGUIgbd9Vk+ekEyUjkCdA263S9rOQ1ilxb5ewpirxDOd@lists.linux.dev
X-Gm-Message-State: AOJu0YyGuSjVIBAgNsAc+DkqDz87DDdb/HcPPiNJgKFKwFjjncbcAZqi
	KBq+VtCNN1OMJSskkwbA8WN92DCxvK26gQYwYszEa5aqXdhXujNwkEYH0E2R39yXwdwxRz2aH0M
	uoPqQRKNCUOjTAyb1Rkobjty/6ptpUrg=
X-Gm-Gg: AY/fxX4MscLJX6fUdw1uQ3ckwZfuS5UYm5QHnN3scXgK3SMuELTZSJz3z3NLaxDOVhC
	J8bCPt/R87R4yXQx/z+YBCkYtSy8rKd0AW1m2HnFe2lRqaMvEilgD6JrG0fKbv1IURRfndhvWDv
	2ggTCVhzDq97sRCYD2Y500P1BEFAYo5qlSN8vVRuylO8SIrnG1yb0bCBWGx36KzzFydJOW1GZfC
	hPCNqb0mDsL822eXsvu0Zh5aaVIvhOh5HGcO7TNKQxR06zKUipg6MpRzTcg24J7kJe+xV3kj7h4
	cCjUFMM9syRlMFAPGlCLC5a8iHlhtxRYcEYcZTAALeMyxjXwFt1Lk8gj1mw2LIK2dajSMSKjZD4
	3auxhLD8z3RazkA==
X-Google-Smtp-Source: AGHT+IFYeKP8iC/T9YXgOHhW86RZtp3HRfERrabRnKlVZMi3RkcOIdKsTDRkSvGOoxrOvXAtmjzTG1RrZv7v4C0kB0E=
X-Received: by 2002:a05:693c:26c4:b0:2ab:ca55:b76a with SMTP id
 5a478bee46e88-2ac3013778dmr97330eec.5.1765495018562; Thu, 11 Dec 2025
 15:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512110753.8B3YlvtX-lkp@intel.com> <20251211213133.56265-1-boqun.feng@gmail.com>
In-Reply-To: <20251211213133.56265-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 12 Dec 2025 00:16:45 +0100
X-Gm-Features: AQt7F2rhAjOgEEsqv1auF6Ic-f3a--tEyGDZ73ZjFWa3CV0-UuFP-i3owl8hhmE
Message-ID: <CANiq72kHGjVmcje5fgHYqsZOdM7kN6HqnrvMdoLsbp7c_4AUhw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: atomic: Fix fmt warning
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, x86@kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 10:31=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> Commit 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> introduced an import ordering that rustfmt disagrees with. Hence fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/lkml/202512110753.8B3YlvtX-lkp@intel.com/
> Fixes: 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> Hi Ingo & Peter,
>
> Looks like I missed one rustfmt issue in the commit 14e9a18b07ec in
> tip/locking/core, here is the fix. Feel free to fold it if you want.
> Apologies for not catching this earlier.

Linus picked 309e49039f12 ("rust: sync: atomic: separate import
"blocks"") in mainline a few days ago (but the solution I did was to
add a newline to separate the import "blocks" with different
visibility instead).

Cheers,
Miguel
