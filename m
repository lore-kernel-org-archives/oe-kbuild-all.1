Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057801C5D53
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598634; cv=none; b=rj+EA155dkrXYDyz9YoaT82W+Vj+9mUfu5w+zwaVARnfC41LgxGORsB5MB2sYEFeZByxAnK/Bg46iPbPTd5nfdJjj8k/StDG+BFngpyw6SI0l86eKR9mqygN8GmDSUlIB3Fmem73CuwqDNE6lll6MF/0GMSAaZUYU2/ehPJAdGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598634; c=relaxed/simple;
	bh=NEZwdAcp8NlpW00clPwspaKYfG6ub3nrSf1XaFem7RY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LT+gTGlcdFCOS60SDfBVhQMPvKRcHsN/kk7Tw/ZqqtTlQDFVenMNVcStOSIf/kPGFonupceO5N3nwKzoeLUv90zL84p33mb8Uk+3BvCFJYVor+T+x+V/u3IJxGCUli4O/OP1JmqxUBsNgfUrjv01n8pdHhIT6/8xfReBaq66cTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=28/26jju; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="28/26jju"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4394c747c72so15882785e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741598631; x=1742203431; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Ey6YaeoGfhw7Uky6jLzAk41/zVhd3SqiNOIt/MFXw=;
        b=28/26jju53dx/mMf2DyCUTXyrOdH8Sadh3tCG87gXbDY7JQzUxt4AvuBid9bOPF3Qv
         3SAeL7PxGIvPW5cNtb7b6Y0wjw4vIaz5/1ILPjM0UCbZCnVmnyTPDS/UQV0sm9Zw12JF
         lIBzSJ50Etv1+Krg8u4rIXOlTpPVdAojmwUhuz/combfqOakm8xfKewKZcLjGnuyhHBe
         FuH4W5bj9Lp16C/QSNEDAUq93aDmaRgGJB+7/i1LJ50iVoo4+33pqwm2kcMT7OeP6hSu
         CtYqH74pnD8CcRNDk/L20afP/olJiqFrayu/pcKZCP7hYxFSO3iGdXKYbwkoYK8Hw8hF
         awaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598631; x=1742203431;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Ey6YaeoGfhw7Uky6jLzAk41/zVhd3SqiNOIt/MFXw=;
        b=nowyqa7hjiU34ZwydTJrKoWy3KjTkL/MtxLGhMc+lanJ0mYyf7ls6MyEtHAuK49m4U
         u6EeLsAq0oYaMRPGZLXCxZhI/nRW2EuNCOLYpTVmxW2jgI5fXVpPjBbjbp6ZGCpy2OKR
         IIDFsjb3T0AvjEluNFdqNm2UwPi0stAgL11uDjHSbKFM2TxP4KZp2X2Blodk2/OoHm5P
         mbbqozn8i68krwLp4ZPGWtpskHcvkkiDGV8PhMv+9LTP/WCcsRLCrla5nnn9Lj5bXuRb
         RKP4Urk3zMSkTwz3UYIGDrD3wAoX9iFBNTXLs8y+pAV/juUZT+g/JW5dHbJDFJzA5I0a
         6oIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwglB033Q6mdncZqUE20Dc/sTrFaPWgW9HxSfYoNcUVu6KeCEGwpfJOmN5lYUBZIR4dFeMY4G5GAZ99+NQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzlygwTYRMUpyk00hQo0I+7l4kCzngTS9UBggRQ1Yc71HRujHaP
	EIzC2MUzOZ/fn0309wtBo0QowbkoU6UCHeIsO3aAkXDm+TPtT0uAURIWj0uYIZth3/mxMGvdJ7n
	Y+QuWaWFz3tD9xA==
X-Google-Smtp-Source: AGHT+IFEp2UnHtcUmo45Bf247g24s/1cJE8+nXgglrMw+cHeJ5tpiviDxAGlDax67viBnDjPJP3vk0eAlr8/sB8=
X-Received: from wmbfm24.prod.google.com ([2002:a05:600c:c18:b0:43c:fae1:812a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ce9f7da7emr48713545e9.13.1741598631433;
 Mon, 10 Mar 2025 02:23:51 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:23:49 +0000
In-Reply-To: <202503091916.QousmtcY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250304-vma-v15-5-5c641b31980a@google.com> <202503091916.QousmtcY-lkp@intel.com>
Message-ID: <Z86vpQBMYuonWsM_@google.com>
Subject: Re: [PATCH v15 5/9] mm: rust: add mmput_async support
From: Alice Ryhl <aliceryhl@google.com>
To: kernel test robot <lkp@intel.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 09, 2025 at 07:37:54PM +0800, kernel test robot wrote:
> >> error[E0425]: cannot find function `mmput_async` in crate `bindings`
>    --> rust/kernel/mm.rs:143:28
>        |
>    143 |         unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
>        |                            ^^^^^^^^^^^ not found in `bindings`

It looks like the mmput_async function doesn't exist at all when
CONFIG_MMU is disabled?

I guess I can just make the MmWithUserAsync type not exist at all when
CONFIG_MMU is disabled to mirror that, but it seems a bit weird.

Alice
