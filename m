Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056318E361
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741617917; cv=none; b=MmF26zFRNXJxGzSKympSgIKZ0GbHoK+EGBezusxLLMbsMAQ5iadRPINxiyAWjPB9z8sNhoHssI7GvVTUcclcCYyex448iTEwqk/5yFHBDKjuCdzG/Kzo7mm/QWwalexifD/VFV4tT/pUA/tLxerPKUTCJoCSojHi815gfL82BDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741617917; c=relaxed/simple;
	bh=gW8z6VuVGnqPIy1b10ZKo6rOVlMZz58aYMYu5AfNd/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3AoDKo3DLkyVwWE03EQbQuPOqOThqydD0zC7uFH9LMv6bxeJPp/iDZlriTYot9pvbxmUD7yVOMCviPHZyo2+4kkyjiTYGguoxNUTA4X6by4+/me3YPODFinAiwL2madimm2gWpO5SbegiHYvz7uHM5PoOjBlxHp/mlbXdeWt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNrwNHf2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNrwNHf2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso1228421a91.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617915; x=1742222715; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gW8z6VuVGnqPIy1b10ZKo6rOVlMZz58aYMYu5AfNd/A=;
        b=eNrwNHf2jupb/5TPE4tiFGRkj1q5zTRiRvWiozvjAAynZkB4qy25PXZt2TrmtV2H8+
         CXmBf34eS6ng93eyWzD6TkQ00zJ8YQv5Fhq/K9vNOkK4AzN0ApwwteAiHhotPl1ijYoJ
         dPrC3ii3HhvlRFE/XJVGO525C3QmRPB3I+RyvzeBu4c5craRRcBQPrsHUEdMFG88nY2R
         XwhxP8jGtAhaZ9UQ7Y3w44a1GzfYOX7mjkQopIcYhfMrq/N3e5IaGN3Wv755WyisXAZd
         VwjGb2i/djvGeQCqfYu1gy1nJ+wiMcI8qPftaXOtz3aKMfuVYDwsUeV8KZzO9MCQMsLF
         5B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617915; x=1742222715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gW8z6VuVGnqPIy1b10ZKo6rOVlMZz58aYMYu5AfNd/A=;
        b=nDeKfeD6eTJheYe724XeZXFXB04pL9KbYHiQ7b4ZXLpX6j3EXMv+Fb8uYg+rAXrDEo
         yUyBtDbVoIzJAG5q1BoSeCuDIVYoSE28M/mX1UU4Cf7MSQdA+TFhvbNDoXIwV57Ji2Ah
         KxFWPYgHr9g5meRhwBWYAxMXLmLGcWmbp1SXzrVQbb3HhWLp8MJUqH6AK5j5RYFTs5ww
         E2V3ufJWCVahhYPA+euh6Fqrhasq8kchcwzTUg7ISYShpBvvTGRnNStSl8LmlWIeww71
         2p0ugz2dkRfAmKmCVp+ANsGRzN4oNubL4LxcEueBRleMYKO2UM6s2DmPPjJpT/PG1VH+
         XA+g==
X-Forwarded-Encrypted: i=1; AJvYcCUSWNfW31PqeE1ydMETeghfwKWnHS3wdGK0GzbyW4/2byCRN+HU2qESlHmHSCGpx3S+8OrwrQmztrLWYO3F@lists.linux.dev
X-Gm-Message-State: AOJu0YxvAny+gI7av9Cp29Ujc33ZIobvWboIFO3d1PvuZlzJaJlEDy4O
	+agwGK4nR8RRxak/LrMerz0xu3LGgxjCa3AgJVbGf7StfxWPlm+2mtvlb2ErDkxEAF48SVo8hDM
	B6TG4eKn9O5cv6s9RcTtZ5MAA0iQ=
X-Gm-Gg: ASbGncsASK2lGlO4ZMC4MCZjbAKZ4arrTOFbWuOSFsOrf0LEdeA882D3WJQ7gjmQ/Zf
	IwHdjnwKjxiyVzWRM3REb5/v3cnZ41b5irDVfjntHWe+y8uWuRHbPqUhk/m5B/sMgT1RHdUiZNc
	69i69j8nVZWOh2WearnwS4NzHHAr5Fv7qlD94z
X-Google-Smtp-Source: AGHT+IGFBrCXa0nfH6q3KU/d6EVjPEAYQctUGGrFOQVO/LubB0zYyYAGq4Qv4EuO5b6mIZ2fYbTZgO5CinWJRcgvDxE=
X-Received: by 2002:a17:90b:388b:b0:2fa:6055:17e7 with SMTP id
 98e67ed59e1d1-300ff94ba4fmr18872a91.8.1741617914779; Mon, 10 Mar 2025
 07:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304-vma-v15-5-5c641b31980a@google.com> <202503091916.QousmtcY-lkp@intel.com>
 <Z86vpQBMYuonWsM_@google.com> <f8da228a-fbc9-413c-8fbe-cfbf074a3053@lucifer.local>
In-Reply-To: <f8da228a-fbc9-413c-8fbe-cfbf074a3053@lucifer.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Mar 2025 15:45:01 +0100
X-Gm-Features: AQ5f1Jo-KFcVKueX0g67j4CnRVm7aFG8zzgraUS9Fb3LDQnYzo1Ea90XXPPdoKc
Message-ID: <CANiq72kAY8hfN_RW-=h-gmFQbq=0DDSQ=ZQr+M3KhJgnsW6n5Q@mail.gmail.com>
Subject: Re: [PATCH v15 5/9] mm: rust: add mmput_async support
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Alice Ryhl <aliceryhl@google.com>, kernel test robot <lkp@intel.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 3:20=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Yeah, !CONFIG_MMU is a constant source of headaches and pain :/ is there =
a
> way to just require CONFIG_MMU for the rust bits? As far as I'm concerned
> !CONFIG_MMU is a relic... (not everybody agrees of course :>)

I guess you could simply limit `CONFIG_RUST` to it, but yeah, I guess
it depends on how many people you estimate would like to mix both, and
the bandwidth/patience available to support it.

Cheers,
Miguel
