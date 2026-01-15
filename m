Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B2299AAB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768518254; cv=none; b=kcj4xnVYAVZbQNM6bdNI1z3dffP9JYTZc2Qli8HEhmlgkXpfH1f/yR5rGFTgGyWg8bQrtH7v9Ujfu5YgKm/0NlrqnN0CTLY/pOWAhfjPO6d0wCgJz3BbrK/kN5eew1yc3G3yjeUpviaoByeXrcYKuL/MLdeJhGiV2FyzMSCIXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768518254; c=relaxed/simple;
	bh=UKeLioYzPnHlRtnVkz73uBvJRRuLfWkSqJS2LiyPy80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEFtmHl58GW41d5laEEIxVYxXNOTfRAf/ylpZEi7Nmvx+8ecrOWbd9W0PjOLaeDBRFO7SdbAgEN/qGWdUxLcVNILYjqxUewbTiFDDpBKdsX1lFs2yr4SJBPo6OFXHqfPtU7QWv6qQYgf/iEETKtd1cB49cs/afgykKISsYJ8i3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gN/qWQHP; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gN/qWQHP"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b9230f564so1963899a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 15:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1768518251; x=1769123051; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YCM4bPzGgqlPRnwheHJYnfrDP545iFoeNWZUdd6VUGM=;
        b=gN/qWQHPWn23ZoTveImOTi9q1qRgIjrYs38krU/RpxHTwu0LY9BthD/AHI6f/9U/hs
         pVUknSdE2bACJqTctm5TxHrUXNSPsWSgvBK0ht7dgC1qh66msyiN2VzR3jbchiT0iARJ
         Q599HaK1zeqi+teRHL2Xa9UYMNMXUZ4fEIYAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518251; x=1769123051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCM4bPzGgqlPRnwheHJYnfrDP545iFoeNWZUdd6VUGM=;
        b=S9IY4B4WS6twg6EHm0wZOlgk2KOnt6NiZv9V/sKUyb2ddEY4riqOwh6jo7V/e/RqRr
         jRl7K/zNJFl6qEdBRYYFGdLTuYilDrBpXxNGBEk9FWb7Dxov1M2Pvxl+0AePw83niioU
         MMrM2Vmuu90P58cTTjFVj1B/KbynoH+vPMG2mYDQ1RsTAEOlUdNOy/g9sJJ2XLQxyA13
         nwOYxFxf9Nn+axMdj9oeIVHybREsDXcNLGbsFocGulrOcFReZZzTb5YWjxe5pvRO3keB
         yrzjnecHgDsO4xPuSOGDeoXzkK3pb20ZSM/p2vsgXAqrIl+ZHYo0ox5rCHoq19p4VE5M
         7ONw==
X-Forwarded-Encrypted: i=1; AJvYcCX6FtQymI2y7RhUVXM0dqTWfX1BkVa9LBVp0z4ZOShosMGTIc3V2o64bqclQ837Mk7tAudiSrnUWz917wB0@lists.linux.dev
X-Gm-Message-State: AOJu0YzDvy4FeF8+VKsbf3tpbCZZ5hx0iPuzIFF9aNHRJosVP2FwPCWs
	FbPQugjxCUEWASzWJCG4yrV2aQPrtM5RbIZaKjauqplBY0BVKefGrdDG9w+eDNglTKKDfQ9s6zi
	nv9gkrzA=
X-Gm-Gg: AY/fxX5EHPT4GSIRbqT5ylgBZ3ZVJ3m8K2MFt4yjpcITMM0AhjhywD4VbCv3gvhzKDY
	NbOs9HDMJ5xUxm131Ezt6jCxoXZQjYxQXy01Nehdfq7crs5Z9e3WLqmCIHezpAPbLlfG4PrcKoa
	b/yu+hoF09ajq4hH5EIoJh1SkxFDRWEfITBLD1fJBfAr7x4C6zBPs7pzMFkxiNnbHIRM51vynQq
	QSNqEZ7gtnfJ9DTMl22s9UgfSEAsrY0Uc70uhxuco7z/w5+F9Slvr4nj2xpEra3fam0h0VG50CS
	nUSZWlbfiSsbQlIzLiiKkTZYAdL7idpVAzXDSzbFUikXxdMlh9TM37Ryv4wlp1xDiBWfI9nTBDJ
	dWyxvO9/Jb/n98FFbWj0ibKNJN8K9ZF1fS3R7lsn7zJm9ufn/S4jBvzOGbzP+7y5HBs9cWPZ8wP
	x4JlGWcEi+BevApwdPKl5cwQZc8aC1Z+G1D/xDAAFeASt0hLesnXaQRzXnVTiF
X-Received: by 2002:a17:907:a0c:b0:b87:39d:2b9d with SMTP id a640c23a62f3a-b87930246dbmr100593666b.58.1768518250648;
        Thu, 15 Jan 2026 15:04:10 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87952919d4sm59399966b.30.2026.01.15.15.04.09
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 15:04:10 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b876c0d5318so216938966b.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 15:04:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf7YFiQqNiPd9EZlFOmTKBSRVPcfBLC8T2iLfogywuLZkSJWvplyX7avRcWmah9aXQU6jL4G9dbGDUwcA4@lists.linux.dev
X-Received: by 2002:a17:907:3cc6:b0:b7a:1bde:1222 with SMTP id
 a640c23a62f3a-b879302925fmr112454066b.63.1768518249777; Thu, 15 Jan 2026
 15:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601150001.sKSN644a-lkp@intel.com> <87v7h23cb0.ffs@tglx>
 <20260115211120.GD831050@noisy.programming.kicks-ass.net> <CAHk-=wg9pxiKm3kcZ0XQrFvz6fFek_A1WGqRh9yeghx3pE2d3w@mail.gmail.com>
 <20260115213054.GF831050@noisy.programming.kicks-ass.net>
In-Reply-To: <20260115213054.GF831050@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 15 Jan 2026 15:03:52 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgXxY4NTZW8rcrXqx3h=j+t2445VWccbpywXYdoL_V0qA@mail.gmail.com>
X-Gm-Features: AZwV_Qgb2cPmulKcG-0SmsL8XUnWkV4E_WXCc_ECD2IgNdR3k5Eh2cWxxhGFxQ8
Message-ID: <CAHk-=wgXxY4NTZW8rcrXqx3h=j+t2445VWccbpywXYdoL_V0qA@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, kernel test robot <lkp@intel.com>, Ian Rogers <irogers@google.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org, 
	sparse@chrisli.org, linux-sparse@vger.kernel.org, 
	Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 at 13:31, Peter Zijlstra <peterz@infradead.org> wrote:
>
> GCC-14 :-/ The GCC-8.4 one was the function return value trick.

Right you are. And yeah, us moving on to gcc-14 as a minimum version
is not imminent.

Still, while we can't force it, lots of distros are on gcc-15, so
while we'd have the _Generic() macro as a fallback for older versions,
at least most developers would hopefully get the nice clean modern
__typeof_unqual__ thing...

           Linus
