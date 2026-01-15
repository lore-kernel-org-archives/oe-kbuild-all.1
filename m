Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BF51FBC8E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511975; cv=none; b=QI29AvPk1SM5nU0+j/0rGhwi6dMF3W2OpHi+GNuyhvmdnL6Xjt1Ddx4K3itZqVMBK+jLkPqqcjPwScCroLPHLQ0SCQAmKvvQYRX3CMbI0K7eIJKYil1/EXWNo0sr0z3ux8kWfb4BojK0o2BEVOKJAWMbGKsFFr2T/JaW3GRzn5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511975; c=relaxed/simple;
	bh=H/W4U1c/44LXtxXQyd70ZxvTcYwMHtxm94LiqQ/7oxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qtd5m4xg+uF2sEnrZuGTNCBhIVkE7LryHtVL3ffebzj4+hI8OKWPxjKjIZIl7gNHkT6RBwwyUsfoqsskDAYeoVn0b1fQUGGD6Oo2Skt3WLDdaxZSpKyOwBxppplFpVLmKIuFtiQf+q+cYHPbUKvJjZenetsjnn5JLOPusMSZt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QCvz3q94; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QCvz3q94"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so2084502a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1768511972; x=1769116772; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fZ+5+6W01DGjb02Z4c3S18rYFePAMoKLqDIVY0iRQwQ=;
        b=QCvz3q94UyWp7PZHXI6EBhWMI6nGo2YDLnGPdkayvsvwjtd5pm//67x6yUlazg6lgt
         hT2wW4x5h6vmFg+bwxmrowWeGFduTuvrG2nyPChNgKNp4dMnpejpcaHI3udCPpPbAIz/
         5Z2/UiW0Mk+bFr5JIEuuScT2QYhm/NKJXWY20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511972; x=1769116772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZ+5+6W01DGjb02Z4c3S18rYFePAMoKLqDIVY0iRQwQ=;
        b=vQbZ5qCsD1+ufI7hUgE9kB0gau+SZ+wCtr5s3j82A/ocurNoqi8zaABPNKaJDcEAxA
         I8c3X7f9KUcItmlWl2zkXjmxJ+WSUD0q2xb10SJYeh1SGMbtr0xnmiFOpOiVGXX2720b
         MjSNxjO3vubZUDbq34X47tImDz9xDykURDn99CFknujbGLoS6lReMS6iaZ9NjZbjy865
         0CALX8plqHkkvJiTdZq/F9OV/Kod8iv7/JHOSMz1K4MnFJbGWw0fTMcaPHHJmAKc7vJ3
         CTsNv49h0CWCQ/VCjQevxqgj+3IZnpf87kZ0qyfMHorby9KJ5Dm2c/oAicbHpFi3WecQ
         kvVw==
X-Forwarded-Encrypted: i=1; AJvYcCX8pJUUdP3aen8IyNb4T5+CF6/1OSqSj5FSxWSiwyIzk5WKtVCtGO8GGhI8hi4Z/wJBCAzg4oSCicxKZQGf@lists.linux.dev
X-Gm-Message-State: AOJu0YzCBQpWTdUGjjVFKdTiyqYtHQsI9VEUqGr2vwnc28PtHFGUqXP2
	CPlRyQI4ZMMTGRYR9fHjPAWraq79eytkbakERW1tNTfdqO/24Bthi/xVSJr8raHtyx5zg5nGKq9
	IwHLOaVM=
X-Gm-Gg: AY/fxX7AQ08lyAg2VZPFqKou9uPn1amg+yqsr2rUhYlav3GB9jO4cZT8rLjQ+g5pwK9
	lRIqhTV+oV6PZA7hi1+3aHtd+ToZRD7/WJTC8xxibDALU2V2VLQJ7Bnse6/E8bIMvfQ3tMN/Ae2
	yLslK9zthNwfprQXO85lqyVLcagVEYeeh5CWAix7/t1oaxAeCTXqE73AjmQvUjLcgkNyOOdGV/t
	ky55ZT3QIBGnOKXXQSLOx0WU/MLRaMkD4Wmhrh7jRFKOWrk7ij4d3VfxjCgqYZtV1a6WhHTQhq2
	MEVocY1XcTNVFmOM9gBqAIfPG0A9/GMXnUPxc6ViuHboovYQruJ2vPY2rp+v8tmuHgmctAYWNTo
	aI0B38dxGFNTjVdBCKZ97jptMi5tkbUlqcr7omUQEzlWHltVQjAtnedvjYGT/Wg0JL45Gl6ny+m
	lSoaYImlDxiLEdihD/A9aryhOXB5jzx+pDQ6IlaMNwXrRDNqlJNsX/XJALOcx7
X-Received: by 2002:a05:6402:3490:b0:641:8a92:9338 with SMTP id 4fb4d7f45d1cf-654bb32c6e7mr341092a12.22.1768511971642;
        Thu, 15 Jan 2026 13:19:31 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc5e1sm554396a12.19.2026.01.15.13.19.31
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 13:19:31 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so2161268a12.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 13:19:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkHXPvtNs1rooalXwSXnS/GcZIyfgnnzz/kJ00ryXONBmFQmn60maWn+lI4zkEE6UxGTyLseNaHXkNX+cg@lists.linux.dev
X-Received: by 2002:a05:6402:5114:b0:64d:ab6b:17e0 with SMTP id
 4fb4d7f45d1cf-654bb429f1fmr314654a12.27.1768511970977; Thu, 15 Jan 2026
 13:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601150001.sKSN644a-lkp@intel.com> <87v7h23cb0.ffs@tglx> <20260115211120.GD831050@noisy.programming.kicks-ass.net>
In-Reply-To: <20260115211120.GD831050@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 15 Jan 2026 13:19:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg9pxiKm3kcZ0XQrFvz6fFek_A1WGqRh9yeghx3pE2d3w@mail.gmail.com>
X-Gm-Features: AZwV_QjxtpJnXoF4FXC-ZSzBPhKE8ZAnFi5EkPj7JRE0S180uTi4FtBplN8OFEA
Message-ID: <CAHk-=wg9pxiKm3kcZ0XQrFvz6fFek_A1WGqRh9yeghx3pE2d3w@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, kernel test robot <lkp@intel.com>, Ian Rogers <irogers@google.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	sparse@chrisli.org, linux-sparse@vger.kernel.org, 
	Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 at 13:13, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Something like so perhaps, which then mandates the very latest Sparse.

Ack. We want that compiler_tpes.h change for the real compilers that
support __typeof_unqual__ anyway.

Eventually we can just force that everywhere, but as Al pointed out in
another thread, we're not quite there yet (ie we'd need clang-19.0.1
and gcc-8.4 to be able to just switch entirely over to
__typeof_unqual__).

For sparse users, I think we should have the policy that we just don't
support older versions at all, since it just gets too painful.

                 Linus
