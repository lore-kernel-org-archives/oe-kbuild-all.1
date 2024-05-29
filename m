Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88F158DDE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993158; cv=none; b=mjg0M2dx5qKUq4olVEhMSuYpQU+imkjQ/VJLoDgmYveBdLdPw0GTrqrPERCWjiJj6Vdnej8mscj+hFIk0+vSSYYQMfsJZ678a1LQamNxbT1fjB6rTM00WZAkYGs0jehLg74MiTm9smXpWaJE87vrPm6WTfmaYd4lAW1KbykMCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993158; c=relaxed/simple;
	bh=TTnJdiN0dwICsVBBJaHkeqayhfOm8yBlF5WnhM/KfCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3Zz+ivjMlDmOp2+bvO+4JzGjM9OzQ2lnL7gff478OaiaVcQGBYtNeWuKz/SBMbb+ETjI07cUpREY4qgjrvryts01wtJACHqMoKaqRtEebGvBVCdKPTdZlcu+AFhWzc9kvWjyZfDW5RD9jta7PNqzDxA0C1G+Tl31+YdE6+mDFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yueu/jVJ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yueu/jVJ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a632ba6c9dbso275353966b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993155; x=1717597955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8pfVjY3N0YvfyGWCKtQaCGQHSMzwUk6OlNcqAVvSgk=;
        b=Yueu/jVJds3NmXrxCktzx5UajTGWF3K3f1uupiUPNzmijIReyBwBLgOKu5Cgp6rCti
         nD/hiGBONt1pFCXK5l5uUYmPZLZOHqefzBl/9UvIXtksq+yHkhWhRKk+MT15j3/kdDNv
         MkuXW34QUCW6U34p0TSymXKpElGJBDCPHjrnF/RC4U0zo5etA2A/pcvobE/FTZJyFiVV
         O6x3AyhUOV+4VsJuOtEwym2mElsqAUpLyI1ND3E6NzkTiVsEQwBK0nO8wHvo8Z5bIw7C
         pEuYlj54ia74dxxICCmQbGlNn2PuRJRiJFNlem9ZCEspblDK1PVjHmRQ6sJX3EBQrk7S
         sdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993155; x=1717597955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8pfVjY3N0YvfyGWCKtQaCGQHSMzwUk6OlNcqAVvSgk=;
        b=hIm6uzdUsaHvR/iANtYb6Z8S6YnRqVcM6O6yIP9GgZCXsxvHTDq1WVUyIVEmoYV34p
         Dx+77xlZboGTiOmawnPq6LWccW+29uwLzOhAp7ATBKOdi9qAiY4TA1bYeTqOIVXANE9U
         FERWVdJOEJRkYiLciK05vD8bYjdZnOsiW9Vbhn0oenpLdthAVtbTGJXHvFpOruqa/HjR
         RaxN50qlxzvqjld+zBYKCwnNXP4M4C2qC54SpZBuzM93r8O0SJcImejBQ5NwcauPvwuv
         qWeLGtJwdA4umPux91uoJqbvm7Zp2sPEv7FE94+b0gnkKvUBSXHOMj7S/BE8T8UbZ9sv
         J8PA==
X-Forwarded-Encrypted: i=1; AJvYcCXucYax8ddQltSa+qDIVtkaRL7joi4BAsp5XU8zYVf0TyOvkn/83Jf6YvDPFmi/Agfj+AVVbT+MG2tI64gEG9WvskExl7W1eX5PHqtckA==
X-Gm-Message-State: AOJu0Yw0smB997YayMhx3H++uLcx7VwG6t9BawyivwGQGVB50ZkkAJEf
	uhFJGv9x7Ec9mhN6cWGk6yG21w4w11svaUCyVPrC/mi8BmKoaEOpdWTzuZkXWOc=
X-Google-Smtp-Source: AGHT+IEUwk0uKpLzXpRtjkdBL2ciZJRWEWE/oGee9dpShKyJmD7Xq6zpbrYB2/9lN0ss8bGEsHD1fA==
X-Received: by 2002:a17:906:6bd4:b0:a63:3586:a4ca with SMTP id a640c23a62f3a-a633586a5b0mr412085066b.11.1716993154764;
        Wed, 29 May 2024 07:32:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93a812sm726509066b.50.2024.05.29.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:32:34 -0700 (PDT)
Date: Wed, 29 May 2024 17:32:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: oe-kbuild@lists.linux.dev, bpf <bpf@vger.kernel.org>,
	kbuild test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Eddy Z <eddyz87@gmail.com>, Kernel Team <kernel-team@fb.com>
Subject: Re: [PATCH v3 bpf-next 1/2] bpf: Relax precision marking in open
 coded iters and may_goto loop.
Message-ID: <6ae809b7-a25e-493b-9488-0bf6e7afbfd0@moroto.mountain>
References: <20240525031156.13545-1-alexei.starovoitov@gmail.com>
 <91453e3f-66b0-4927-a756-bd18f9e6bf05@moroto.mountain>
 <CAADnVQLWbPd2skY1Lzs8oJ=9Ag9e2qD9Khhb4ycQRimZqdeBfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQLWbPd2skY1Lzs8oJ=9Ag9e2qD9Khhb4ycQRimZqdeBfA@mail.gmail.com>

On Mon, May 27, 2024 at 03:44:44PM -0700, Alexei Starovoitov wrote:
> > 484611357c19f9 Josef Bacik        2016-09-28  15313     if (BPF_SRC(insn->code) == BPF_X) {
> > 5f99f312bd3bed Andrii Nakryiko    2023-11-11  15314             err = reg_set_min_max(env,
> > 689049426b9d3b Alexei Starovoitov 2024-05-24 @15315                                   other_dst_reg, other_src_reg,
> >                                                                                       ^^^^^^^^^^^^^
> >
> > 4621202adc5bc0 Andrii Nakryiko    2023-11-01  15316                                   dst_reg, src_reg, opcode, is_jmp32);
> > 4621202adc5bc0 Andrii Nakryiko    2023-11-01  15317     } else /* BPF_SRC(insn->code) == BPF_K */ {
> > 5f99f312bd3bed Andrii Nakryiko    2023-11-11  15318             err = reg_set_min_max(env,
> > 689049426b9d3b Alexei Starovoitov 2024-05-24  15319                                   other_dst_reg,
> >                                                                                       ^^^^^^^^^^^^^
> > Passed to reg_set_min_max() without being initialized.
> 
> No. It's initialized when passed. It's a false positive.
> Try to make smatch smarter?

Ah yes.  I didn't read it carefully enough.

The kbuild bot doesn't use cross function analysis.  So it didn't know
that pred can only be -1, 0, or 1.  If you have cross function analysis
this should work.  Unfortunately cross function analysis is too slow to
scale enough for the zero day bot.

regards,
dan carpenter


