Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D570D183066
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719164953; cv=none; b=TCHlMEAszKnuMwXpW3yZaxivjC5P/Zl6aY8b44n+w/6ctrJMFTvbOnxBDWeShkKwu/pvJuO+UUkuGCKqjxiP9rp67RzGmidRYMqNZ48REToGh2KvF4QzSshKxH8dpviTg0zbOm/93kb9JTjusv1hGqjjfwjk6G2AD8rxVai6dIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719164953; c=relaxed/simple;
	bh=wcdFcMoQThWwG9qZTr5TVP2xgijbHAoj07YzN+ZnusU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajKZw1fOhLb2gwpN0/F7tYMcRZfrYR2ueqa0uTwAgi3GYk9PkkkdbDVxsbsxFefZx2HsrWoIRcjWAqre78DccZeS6ILomvnkWux9gqfiTzeVgOeEqnitSjY42W+FjtoxKMqXFl9iq5TITcr7fEtl7vDILBm9T/JK8xzsuUriBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HZa4cIDN; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HZa4cIDN"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a724598cfe3so93529366b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719164950; x=1719769750; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5bBS4/y88g2wsr1Yt0/71zUw+hOiW/MiIB8thdqOhiY=;
        b=HZa4cIDNcx40FigDxGipbo/VABRPvbDfoPmXPk9piEPe98sVnk1wOrCEeA2ddFZ52a
         9RkBG5uAofpgVJzV2icOYu46CVHOK3bHak067eY0LhId8ron0cKr0brPcvZ3Qmi2/IgG
         sdmwKtDescrnDth2moZ47hlkPRXEgLb+SOLtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719164950; x=1719769750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bBS4/y88g2wsr1Yt0/71zUw+hOiW/MiIB8thdqOhiY=;
        b=q++1sO5rnrxbERGQf9ExhU1r9s6WT28Q9efxR7o8VXxZ7GputGKDyouolUhppKDlri
         VBkG6feN2+C0mjAD87Smx9boPSALZ/aJ2JvlfvJLAJRCvB4zAKv8u2gZZaUsFbBt519K
         z6SxEkjr8w63Wxn3T+znoVYuaNV6kxvhtfPg8MFdyHWCIf3K5oinQfQPyl6KgoGcvGhg
         spZelxZmUbdRgUYYkfGwhWFJdFVRRpmvkEoU1LZ/2ae53OqL9HSxb0wSW1ZFHqIK2pGI
         p/N3f3PV6wcFKsmeugYIS89tN+z7BZ7RnRF8BK2wSuiZQFzvQNeIJyE41urxnZEQMkMM
         Ehyg==
X-Forwarded-Encrypted: i=1; AJvYcCUfSqI6R3B5jZqp8A4Q7LWANzrr4atnbVVzZBlWgnOBluDLInry6W3135ANU2L21556ghCLNqPbVjALb7RwGcHeI7vVHDJ02vZPfOnSfg==
X-Gm-Message-State: AOJu0YxGWJgb9ZExvTUCn/a0SMkmGGw5tdiytHG25A7jPaGGcTt6kb0/
	55KxfptXXgUWTqZ+wmJ77sxQPKNgiINYGh5V59X5cx6Z/uCZZmpNy9DSZCWd8OgY5U/hLKSdKGZ
	GI9vg4A==
X-Google-Smtp-Source: AGHT+IGDqTJ73IBm42Kw9BCK7onHIT9kYYnMDkEE5/ksDCOiMM7MB4x18czon7ALGmPeYmqGt7FzTQ==
X-Received: by 2002:a17:907:c787:b0:a6f:b6c3:fb30 with SMTP id a640c23a62f3a-a7245b84f56mr253136066b.7.1719164950016;
        Sun, 23 Jun 2024 10:49:10 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72554a5d94sm19608466b.196.2024.06.23.10.49.09
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 10:49:09 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a724598cfe3so93527166b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 10:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpM4VWBbHjNPvH5tDaXMdD/aNZNRJq9M8CpWQldW69/VesLoBzRKahd4M0TeJ1k+DinWGMgWdbhy/12YRHPaTFirpJ2rzzAmerg+//6A==
X-Received: by 2002:a17:907:c289:b0:a72:4f24:1a28 with SMTP id
 a640c23a62f3a-a724f2425f0mr131294866b.27.1719164948938; Sun, 23 Jun 2024
 10:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com> <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
In-Reply-To: <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 13:48:52 -0400
X-Gmail-Original-Message-ID: <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
Message-ID: <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 13:43, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> I disagree with the above.

Your disagreement just doesn't matter.

We don't introduce regressions and then blame others.

There's a very clear rule in kernel development: things that break
other things ARE NOT FIXES.

EVER.

They get reverted, or the thing they broke gets fixed.

This is not debatable, or something you can "disagree"' with. This is
how we work, and if you disagree with that, you had better get out of
kernel development.

> As said in my previous message, if the compiler can't handle
> __try_cmpxchg implementation, the most straightforward and reliable
> solution is to implement atomic64_{and,or,xor} as outline functions,

You also seemed to say that nobody was doing it.

Which means "revert". Because that I can do trivially.

Now, from having looked a bit at this, I can point you to the
differences introduced by having to have the emulation fallback.

And I would personally be ok with leaving Pentium etc entirely behind,
and getting rid of said fallback, but that's an entirely separate
thing that will require much more discussion.

Some people still wanted to support old 486 clones not that long ago.

             Linus
