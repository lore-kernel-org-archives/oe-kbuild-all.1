Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7E63D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719157360; cv=none; b=bzt5sOP3oF7iornke8XM04aXugKxCiLYEqagHtPP3EscrDnBqe0mZ23fg7tv25GVVcI4R0m83S+oKrjBAdBsBY7fUIDZUtyvAnLSp/nFbCwer3Skn/0BCfd4D8q4JJMEJHNJct8rq6kbucSMik89dNgkniWXEZSqs2IN9oSVdFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719157360; c=relaxed/simple;
	bh=iFXcoknjEWe4avEoLfa0XtaegaueFZ48+goiOQFuMR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGjgKVQTqwXm0wmb0eLMReUIcM9FWpKvtYvYuFSqC+lu8KEyH0QGE40nyro1x7LfPQRQL8La3p7MFJHhExpAaUJSUola+aelv10hyAGZZc1INRz9686AneffK26kINsjPzMntar+yvnocFNYAzImKQRnLgQPXOXtolWhrFs+kOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q8Xidkl7; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q8Xidkl7"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d20d89748so3305239a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719157357; x=1719762157; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bwkVEJXxyiArkV9Jcvb+VVmKUfhm5RmA00AhRtW/JHw=;
        b=Q8Xidkl7nAAZILiJ48Q5f7GGuV/32pj4x5Q3u7M35R5wIR9g9PLG/gi1dzmAuRx3gk
         VVVZwxDYQ2DHJCFgQ19MdDdhdCjfEnQFmQ7u0dpazS3ZrlNTMqEGdu30yjpu0SCCQZ4Q
         WGq+JBV5l8BH25zKvE9E7GQpKfaxcR3rAYaNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719157357; x=1719762157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwkVEJXxyiArkV9Jcvb+VVmKUfhm5RmA00AhRtW/JHw=;
        b=ZwrBZrdBR6qrdf94OzbRi9wwdNRlu9SASb8LUYSv6Ln9Sh766NJ2DvzsKSGCgn72hE
         ZktNkpIFGhkswa8GDeS0DOMDGoQX8D2Eqt4a3o19AUA3J8kNN1QlHTB8iuFtafBuKRyX
         GRwzzwJkyGYglpiTGc9R7UReucE05Ld4+IwhDXljaaw8xOg3s2BQPM0yTtJBqyeLBOgI
         UeJho3JObjsaRsZ1EbWAOlq8pQ7UCCQjIyHRrxFV7UqG4N5gJrDbIU6borSVYqa8M1O+
         4KsUpx3vFww70l4myRf49DDPZ+k06t/AeFAZdK5OfYcYa4thqi6UZzLe4h2RREtjMRqZ
         LvMw==
X-Forwarded-Encrypted: i=1; AJvYcCUZvW1z/CHP2OEk+QQ75HcPsxIEfK/EBJ4oTYzfAn4qDR9PGUvwy2nEWV55lCm5JCdrK0HoHTW9YRri+C4nvbVF9dipkbJU5QlftlTMAw==
X-Gm-Message-State: AOJu0Yx+JltISvv3Qgn+uNwbqXVWMS4Rzmpr8aMXv/fj0PvXM8wMi7yq
	fugYopmPnHUacydkLSeRxmSpyZ7KRx5orKev5RGvV7BATrP6zKAexT2ZzewWavlATeuM3Ho/B17
	XbawAjg==
X-Google-Smtp-Source: AGHT+IG9foZiu4oTIV0pCwqQYNMdxrytFY+geOfIxlyZJ8OTfVVZmGeVJd9NS6fZ9YIghqKjavZxyA==
X-Received: by 2002:a17:907:a64a:b0:a72:5049:87e0 with SMTP id a640c23a62f3a-a72504989demr67395866b.15.1719157357009;
        Sun, 23 Jun 2024 08:42:37 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428b57sm314382666b.28.2024.06.23.08.42.35
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 08:42:35 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f21ff4e6dso456162466b.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 08:42:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEtjtgxl3HamFj1wuFSfv3NpLJoRK3mUYGyXBNqMQ5JjnFVYCwwBDhUZ+mjqhgpE7BzX8VLxmQ+0bbDfeus7csq/piQbORKDxx1cAJfA==
X-Received: by 2002:a17:907:a4cc:b0:a6f:e8b4:9e59 with SMTP id
 a640c23a62f3a-a7242c9c1e4mr147616666b.24.1719157355462; Sun, 23 Jun 2024
 08:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
In-Reply-To: <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 11:42:18 -0400
X-Gmail-Original-Message-ID: <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
Message-ID: <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 06:14, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> The referred patch actually mitigates the issue, as explained in
> details here [1].

Clearly not.

It might help things in theory, but in practice it clearly just makes
things worse, and causes problems for clang.

And the thing about practice is that it always trumps theory.

> So, without some interest from x86 maintainers, the issue will remain
> unfixed. If they want x86_32 arch to die then inline locking
> primitives involving cmpxchg8b are one of the nails in its coffin.

What? No.

That commit will get reverted. It caused problems, and now you are
blaming others.

You can't just go "I caused issues, but the x86 maintainers aren't
interested in this area, so it's their fault".

And no, "improved code generation with one compiler version" does not
then mean "other compilers don't matter".

Now, I do suspect that the issue is some very random thing that could
be fixed by massaging the inline asm a bit.

For example, why does that 32-bit __arch_try_cmpxchg64() do this:

        if (unlikely(!ret))                                             \
                *(_oldp) = o.full;                                      \

when I think it would be simpler and more straightforward to just do
that *(_oldp) = o.full unconditionally? The "dereference" is purely
syntactic, the intent is that the compiler will just use a register
for this all (well, two registers on 32-bit), and making it
conditional makes things worse, because now that "oldp" register
cannot be the same as "o" itself.

I didn't look very closely into this, but maybe that would just fix
code generation. And maybe it wouldn't. If there's no other fix
somebody comes up with, we just have to revert.

                 Linus
