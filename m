Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF731FDE09
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741965793; cv=none; b=NG5hyAhOic7HXEpaPBXU2WsDB7jssYzTBQzGXiA4Ox1Fs4biAaoqM+QWlC+U7o+bhjFnNjHAjzKISkyH641R/BMKkKYBIuFtGGbNrezGYI3JHeb/NW/D+1PPCs6C4FShmrBSm9Zsk47ek3BJR6f95NdKVkbSYMiuX6xXLxQ8X/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741965793; c=relaxed/simple;
	bh=onGdMGQ9h5riy+xCuuIEp+wSTHDIPrfRuS2Z7rje+4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNKrizyjjPgz6E5RIcqMIoUorT/3FLt6gk6oLpFySgfnUFSedPS+j/3bc6uNTyBG7Wpb0zFHhZOaj7xPAJwyySFAPPcrbn0kjAvl3mPdeWY/U0beUU1VzUkJZHuwW70/5RhW1bNMZMFh8uAB1ittztT78uTZDzCoeALOp8t1OsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+6N7F5G; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+6N7F5G"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so477401a91.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741965791; x=1742570591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onGdMGQ9h5riy+xCuuIEp+wSTHDIPrfRuS2Z7rje+4s=;
        b=j+6N7F5GvpN4Mp53Eow5+i0hvMFuT74HU5LZHIUdF+PJp4hxzyRpjO4CQs5t/MBNT0
         aDZgAUpmxGYbuXGNoi4L0n5vk7BIZDxC9sxkBXpcUE7KKAM3Z8hTlSn2OnpUAerlo/8m
         G2Rmez+YxEziaJJrdewvgw7supNS1U/8DSfDJ9tF6SQSBinnMHp7A4Bi55B0SoEC6JXA
         7XxzUqeBRFqweuwsQ8Jk2d8ctdQa0wvLd/NtLtHr1sanWWcM/t/0aRZyAFJE4AMHTKJg
         dYV5TWqlmCOqhUjPlo+OorFIisChO1ps6Vh3uClcB5eTdyTT5s6+YzWGC1xw8+IDefwQ
         d0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741965791; x=1742570591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onGdMGQ9h5riy+xCuuIEp+wSTHDIPrfRuS2Z7rje+4s=;
        b=D4wFpGWPE6pCvYv6d/tyTGC3bWfJ4+GhQA/Ufo3PFGrsdEaUJKnIUYQottZtCFOrKf
         F9tMZeEXnKffzy2N/SbMQCYkqsT/O77R07Mbq2axl1bjoPtGGrNYbQKilksGrR7pBD7Q
         iq8c5vQdwhaz9p4oHoWz8Jl4xNcmN0DyJn27DC7cCUY18j0ROTPD8yBFS3ZqIpU8O10g
         P6aGLIdTwphQsmIqtGIOEoBP/VSiiq2C9M7jlO75uI/1DtLbvWdQ3BJae6+kHc63Nde7
         gSBLVvhxCbiT4Oi+HDeX3MYJtw8dk0+imS1ia9/d07IImUHpgkQGrlcqJd0GxTsGjfNl
         GNVw==
X-Forwarded-Encrypted: i=1; AJvYcCXjyE01lhESbKRmWvAmgVEXBtzjN3k14pmy1lW8FaTF7sTwlGFgOnItNo/JdCRIf2Dlx6mUpj3K2dr6I5C5@lists.linux.dev
X-Gm-Message-State: AOJu0YxjSkw0/uruf/x1kRsP0W2jO8vWxy6XqXOp8RyemdH6zbvpGsEU
	y1gDuqf2s5s/tU/OjQu8CChU/iGTp53QWhKy/1ABJQNXsDV/b9s0i1BLayDUpNLSE4OGsnHBKVB
	mf8ri/chq4nfvgViYGxvvqHqZ/FE=
X-Gm-Gg: ASbGncsSs0scGFsisQ/X8lPs/9MFBs8Rbol/P8Wvjg0PuoOm+E4mhs1qJtXyXS4r1HC
	XECfJXH6jAL/YDCHdQrAzxilBVqKblQ85XAXy3oOunoTfpMmGfdkE75Im1ZLBCVXv/yrGAxSpqM
	OYvBLCrhE1cst2juPuWv6kq9XobQ==
X-Google-Smtp-Source: AGHT+IGXZ+sIMicF7ioYPohSk+0+pI5Y4ZkfdkmKCGHLNPxqRGWFte3NiYQ4N/30XfwYHbA7fFBeZ/NTmqaBLnciMp8=
X-Received: by 2002:a17:90b:38ce:b0:2ff:6666:529d with SMTP id
 98e67ed59e1d1-30151d6e1demr1481405a91.6.1741965791659; Fri, 14 Mar 2025
 08:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307-ptr-as-ptr-v1-1-582d06514c98@gmail.com>
 <202503120332.YTCpFEvv-lkp@intel.com> <CAJ-ks9mkbs9KG5D5yETvOJfeqyzTts1gVZyNAogbxjXbwOreZg@mail.gmail.com>
 <CANiq72n2cYvAWkz+QwG9++NknaN-A2g=N4AeatADwRZ1pWtk0A@mail.gmail.com> <Z9Ipko8DBD2cz1nF@rli9-mobl>
In-Reply-To: <Z9Ipko8DBD2cz1nF@rli9-mobl>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Mar 2025 16:22:59 +0100
X-Gm-Features: AQ5f1JqAXlG0OSn1ajgmyqsScjagQVuSo381KPk2FBlBxX6zol4hwhDWmTs8x3M
Message-ID: <CANiq72k8kXeK6C=yh9-LNXbeF=pQitd-7sVP7AsGLBHATfEF7Q@mail.gmail.com>
Subject: Re: [PATCH] rust: enable `clippy::ptr_as_ptr` lint
To: Philip Li <philip.li@intel.com>
Cc: Tamir Duberstein <tamird@gmail.com>, kernel test robot <lkp@intel.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
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

On Thu, Mar 13, 2025 at 1:41=E2=80=AFAM Philip Li <philip.li@intel.com> wro=
te:
>
> Sorry about this, I will implement this to make it clear asap.

The bot is great -- thanks for all the resources you have put so far into i=
t :)

Cheers,
Miguel
