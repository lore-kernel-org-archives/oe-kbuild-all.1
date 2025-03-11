Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931F8263F2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 20:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726212; cv=none; b=QcEvGcYRUxzXkhCz/tQLSt72xhjkFbygJ5BtPM7OUp5yG+h//1RrvKrZG4X5DoitIML3by2jQ9SPJxjJJmN2J3vrJxeCFGNsbrbCYsDM+qb8kxDxLTYBsJi6nSzYa7wRgYHqopCezL1+YivOElS9eu1F/rhYz2I9ZZntRJScWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726212; c=relaxed/simple;
	bh=JWdKg5zoGBpY28zuxaqBxi6+dP6Re/Qr912PEvIfcXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecMbuQ5qk8vOl0MwyYCzDNnRzBkeIJAwPm6ErG6QLPvzEyryFZ5OrdAN1b1sTxfpA9VeH79Q2EEfVQpHoQMr/ZgpiiEdPWZRSu1nB6u3Dw3Rsoy40XCM06Uv0vOvIvbpjc60NUjed9LvZmkYzakd+cTLkoCfKm/kIYdxe2+XfXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhUH56D8; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhUH56D8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-216513f8104so10611405ad.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Mar 2025 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741726210; x=1742331010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWdKg5zoGBpY28zuxaqBxi6+dP6Re/Qr912PEvIfcXY=;
        b=FhUH56D8LIdmf9vB46geg2DvD+jPOaOtItr+kO/Gt5GHtx1s39fBKnpHfUAK3DPLZI
         Sv3B5W2bXyqbZDYYKHjtUU9cpPdf4p6o7qcB9R28U3TwATnFTZvrWbv/YR/YWVUhyABV
         b6PJZm2ZS5kRPbFIm1Pv5XrrOzb6R43aMNCErXxIfBCNYlAL/YqGlwu1JRpC421V6Mr9
         rmelkY95sCGnfTTISryd/4E4npbGdVPYkKjwTBBtXJDepJVmPvVUDOnwxnanmbqhQaXO
         PzFbIiiIJkmr04AplaM/Qw4SHxQbGH9eCadb5JkvO+ysJ5KBi63cOb3txQCJR42Y9BLg
         ABgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741726210; x=1742331010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWdKg5zoGBpY28zuxaqBxi6+dP6Re/Qr912PEvIfcXY=;
        b=FIwS4dkyxElpSWib9RVepgdqWbQ1ThlrKGfXwPsJPfAaAhskQPuSlLcJd44t/np0rr
         dqY/Kk7FEFTkdf0mONjyGOH6ZJ2R7XCNhhR9kdncFnTZL79TJgQb/+5tmjuVXdqrKmPU
         sfzdbxR3colSuc3YQpwBjbeE/IKZ1cKqIE1nppeMmfaMWuUPHavWqDKm4H6F2ULQYQct
         A2UkiBgkIs6LXgmnx77DhM+G0EneqtuRZy66p5FjczHNQBg6+jkvjqLiEPATHWySxRzZ
         cCYgCyxnZLRwTL8UZZYjUSrnfSqGk187Q/17ehRZ59l0wQCaFMrL0FMvF+3Xc2VrlxN0
         1TJA==
X-Forwarded-Encrypted: i=1; AJvYcCWNWtsXbNelUY3F+OnYFg5G4sj9VFj8B6dx/R5HGEFcuj2vakirzW8Ce5jlRQkpeSttybSeTwvFk0Jk6Eys@lists.linux.dev
X-Gm-Message-State: AOJu0YwsE3GjuNVk/MqgYQBccg8Wtl8dRcLG014JIlyeR3Jy/VNijNUz
	pwPkG2vFJ+xRFuPzZWXhG2KVVDcxGeaAC4MTNGwPfjVVYFUbnuBd9mbcwJkXoU2FN2oiFynjpRk
	OFsRScHI11fePpyIRVcqszH7olRw=
X-Gm-Gg: ASbGncv/YBip89t87lwVPgFn76XE8Y9Fio5YmW0n8y88cU9Td5BjxFtsca4wj84MxjF
	5CgucxDOsPDn8WfeUHwgeGwR9fSEgr/d0PbmfEiHLHOAtJM8U7n6kgsvgmlHQZfBwucyfCU48Cb
	/5NgZGyIL0V/POmP7bw4ndSUn5DA==
X-Google-Smtp-Source: AGHT+IF6Iu5cJXNrmMcH037VEuQgEw5FQiSeS4rw7qJG+vfgUlX6Z+xe0TEh54YrTrzNEmVy1nOOetWOtZm26Z9qTGA=
X-Received: by 2002:a17:902:c952:b0:223:659d:ac66 with SMTP id
 d9443c01a7336-22593302b09mr26173505ad.12.1741726209805; Tue, 11 Mar 2025
 13:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307-ptr-as-ptr-v1-1-582d06514c98@gmail.com>
 <202503120332.YTCpFEvv-lkp@intel.com> <CAJ-ks9mkbs9KG5D5yETvOJfeqyzTts1gVZyNAogbxjXbwOreZg@mail.gmail.com>
In-Reply-To: <CAJ-ks9mkbs9KG5D5yETvOJfeqyzTts1gVZyNAogbxjXbwOreZg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Mar 2025 21:49:56 +0100
X-Gm-Features: AQ5f1JpxGxSGer3XisukrOBay0DQPLazUdlb5Q5D9ZecG6Ve_YwoPvaVLT-TLE8
Message-ID: <CANiq72n2cYvAWkz+QwG9++NknaN-A2g=N4AeatADwRZ1pWtk0A@mail.gmail.com>
Subject: Re: [PATCH] rust: enable `clippy::ptr_as_ptr` lint
To: Tamir Duberstein <tamird@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 9:44=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> By the way, it would be great if the email also included the rustc versio=
n used.

Yeah, I think I may have mentioned it at some point... For the moment,
one can look for it manually in the linked config (i.e.
`CONFIG_RUSTC_VERSION_TEXT`).

Cheers,
Miguel
