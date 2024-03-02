Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B341EB3F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709419776; cv=none; b=JZB64jP8MwQi7bAE2wGBtn7nS3N9okm7ZsMCRf1mqze7upgjgktdPRkR+3cmDBtSZKi7QDsuB2IeNrTmQydNWCBOr99ukT/7bgN/TIyh5mlwzVOJTQnp8pLBq+zPATKi/IQq3EZR8F7IyQTO+9lYzT9BA5JoGvS1h3Xeh8sKGPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709419776; c=relaxed/simple;
	bh=yvElCY4n79Px/TYdKRnwrreP/LvNLE515QJnoH8nICI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKFS4mtxPu134sAVRpt5HGgN0nTGZso5DuilXl9pAjLXuFeflwVH+4hPk3i7DJuRQQHnuHp+8jEXJfGKg4ATrwPjhBu1iFtjJsNzUMJGOS5mcyR6b6eYOhjYqhD2OXahLxk8BIoVKj8cTKTlZNWwH3XH7YrxHfc883fbgX5NfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H6K14DBK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H6K14DBK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3122b70439so533932566b.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Mar 2024 14:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1709419772; x=1710024572; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0O313/N/H96x2BCcFEncXqBwotYwnAA6fTUaOEPtLE=;
        b=H6K14DBKlUQ/QbXIxS0exRWaDggtVHKuKmgAfwIUyHSyqHJ/joYs1UulrkAhmT1kI+
         +BGnWlGx8aycNp2XnjBx6OFgULUtwAbYNE8bg+++V5TpDVWr/aU2ab+Alie+9w8DxLOx
         m2IHgy1I6Y5ufBlDBFUF+sS13A0ANyzt9QGog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709419772; x=1710024572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0O313/N/H96x2BCcFEncXqBwotYwnAA6fTUaOEPtLE=;
        b=Sl8s6t2BS4W4gTk4f6UHbhy+ilOWSoK59CRiJkwyhsmk2a52SZq/HAeCVUR5pXx8AC
         1Jde1zPqbSlOfm2aauxboO2RJ8OtWbn/dnwOAwFrG7Z8psjrhvHX4B74iVE5IzTV+z7W
         P8SWvjH/rjSXeFMq0U5P8oy0K9+A0vYFaHkqieYVtau4USum6lNlElyJHxQyZ+MhA9/w
         /LqgKoscXSa2hSVqrJ8jTehz5Dnq2j/JxQUCraA6JjUDV3s3TCOwOnwsXm+kaNvOBV89
         ZIKvPx1MTv5IOraf6ZALtUBPBDq9LqzrtgzrO/hK3s45u8KGK3EqV7yEw0B4DqXm4Xo5
         zVww==
X-Forwarded-Encrypted: i=1; AJvYcCVGEPTbVRb7NRN6oaDh08fepIvWWb1J+nNbehqhtQLyp/SvLUS8KEXlt2fQ0ETZhzdEwSXJZUbUs9TQK8Dar9akGqeC0/595rP91MTI+Q==
X-Gm-Message-State: AOJu0YyaDAgpiXPSJHNaJ90Gm6Y5rMRdq+uax8ttK3BPpD0RheCKrSBI
	EDsWplcPhxixpbj6mQEpkhX4at2a9mMj4zeiriOvVycHNxztrkY2XF9OGVLTH7ZYu46eQ7aPBa/
	nEs1MfA==
X-Google-Smtp-Source: AGHT+IE/1nBltO7/UC1UyB7P6mUrksUdcZakuiSRutSXTdWGko5fNW2uma5+c2M+hiAeU+wCkd/cag==
X-Received: by 2002:a17:906:3416:b0:a45:1951:acb9 with SMTP id c22-20020a170906341600b00a451951acb9mr52198ejb.13.1709419772365;
        Sat, 02 Mar 2024 14:49:32 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a23-20020a170906671700b00a45128cec31sm141021ejp.25.2024.03.02.14.49.31
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 14:49:31 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so557658466b.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 02 Mar 2024 14:49:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwz0U0tSI6fCiNvMSjKA2lnKsCTn0EZ0UZldEVgC1Cp5BNFyrVJwbd5lYc6kkH7HycVUJyaVBjaCOoiS6RA4U7vnVm7dteCSfn4lNReQ==
X-Received: by 2002:a17:906:3416:b0:a45:1951:acb9 with SMTP id
 c22-20020a170906341600b00a451951acb9mr52187ejb.13.1709419771531; Sat, 02 Mar
 2024 14:49:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403020457.RCJoQ3ts-lkp@intel.com> <87edctwr6y.ffs@tglx>
 <87a5nhwpus.ffs@tglx> <87y1b0vp8m.ffs@tglx> <87sf18vdsq.ffs@tglx> <87le70uwf0.ffs@tglx>
In-Reply-To: <87le70uwf0.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 2 Mar 2024 14:49:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWhfdc4Sw2VBq_2nL2NDxmZS32xG4P7mBVwABGqUoJnw@mail.gmail.com>
Message-ID: <CAHk-=wiWhfdc4Sw2VBq_2nL2NDxmZS32xG4P7mBVwABGqUoJnw@mail.gmail.com>
Subject: Re: arch/x86/include/asm/processor.h:698:16: sparse: sparse:
 incorrect type in initializer (different address spaces)
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>, x86@kernel.org, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Mar 2024 at 14:00, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> I had commented out both. But the real reason is the EXPORT_SYMBOL,
> which obviously wants to be EXPORT_PER_CPU_SYMBOL_GPL...

Side note: while it's nice to hear that sparse kind of got this right,
I wonder what gcc does when we start using the named address spaces
for percpu variables.

We actively make EXPORT_PER_CPU_SYMBOL_XYZ be a no-op for sparse
exactly because sparse ended up warning about the regular
EXPORT_SYMBOL, and we didn't have any "real" per-cpu export model.

So EXPORT_PER_CPU_SYMBOL_GPL() is kind of an artificial "shut up
sparse". But with __seg_gs/fs support for native percpu symbols with
gcc, I wonder if we'll hit the same thing. Or is there something that
makes gcc not warn about the named address spaces?

Because in many ways the gcc named address spaces _should_ be pretty
much equivalent to the sparse ones.

            Linus
