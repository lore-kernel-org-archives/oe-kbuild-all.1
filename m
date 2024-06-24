Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B9142635
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237597; cv=none; b=dXB18TTixzY1x5C3rW3WoY7N8qM61Q5Sh1thDwbDLb4aNHvv0++Dp4n6tEO2xq4S30dwa2NTeNFizr1r9aoxgSY48GlkSlkptoaC6oudlwlQa/lS9pyNZwlKo8N4OTZQWZJrfXxMEhY95qDLAVcTZ2fHBI1JsAVKZZHyH7AOOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237597; c=relaxed/simple;
	bh=1RmILU7sEfgOL5C8noYL1Mesy9QeXfx6SH6gs1dytiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIGNfpoKE4eDGDPqdsxtLINdH6zG2ICrSkRqEeX56qwDmL4byO0zR8IbYfnEXK7KrwRt4XejmmnNBcfDfKzrmlPhjShrhLlQK+Qrm4lz/AtuAKTmgrvKw4itVu6VHQFBncQHE4m0wNH1TxAzy/BAOd6ubCjjoOuXBX6oalwyz2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TDG6o7co; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TDG6o7co"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so71390111fa.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 06:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719237593; x=1719842393; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FRxJqV/9V3WmotPQQur7o3YnAN57z0pSUs0Lyii+xZw=;
        b=TDG6o7cowC2F4oe2buSeq+ckW1nexyhXHqywz6aUekEVOzhJWiz7I3TWziaWDRhaJK
         fGzyAbl75CHMTz385LLLtmfaTqSZwNlGPlmdgkC6zJ7Gy+ZdC/sgIED0tXxgi1mBwyod
         jtVXbcvAHdHPd8rkb+0cR4IoOWOYze44bttGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237593; x=1719842393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRxJqV/9V3WmotPQQur7o3YnAN57z0pSUs0Lyii+xZw=;
        b=FKxSOpLt1JxKrKP7WueMN1tIxYmTo9W+0D60hZylrH+CVeD4hv28j9INe5IGC9Fvdb
         vsNpcWVp6TjvT6r7qrLHdFTWb8gKNu3HdGn65TaXAV1u7z+PTUq5iSuU13ni2BmFZAdj
         hVmeHNYCPFl+aDEkt6IubE0/SlWsnFvlinHrlrN0wlMiOo1F+cLS0hC3etfeDG8bvPoR
         ltBqHwlWdEC+wG1IXf0PInSo7hLmERz1VKaqgngfNPWnIXJwAbjiCRIDWZfwtCZlXAj7
         YVr45BGl0ziNHysPvkrUJDYE4XiAl14oXN5K6Uf33RXxKjTmJPqzTrexDKm+rROqZsGr
         Df9w==
X-Forwarded-Encrypted: i=1; AJvYcCUwqC3URcILW6kPDC51BVhTjgIg0sZKQWG9DqS5FPrhqHLIk2RAmwU2iwN6osw+EfVHOUq8bzjjx7JKFT9J6UURPR0UCDHVXJtl4tB2DQ==
X-Gm-Message-State: AOJu0Yy+GgiwamYOzzgn2cyHndQWh4xdFcUT1D0MXd3j3b2CjHdvKI9b
	UwZ9h0hdh5ivEVO9MfS5EVRB2wx9H33pGK7XLaJ+0YTj1MdIIsHkwSp6nES+UnW8Pj3PAwfUbwb
	hingHUA==
X-Google-Smtp-Source: AGHT+IGf3tB59RJOKYK4h0wst3KTWvTANTUitGGvVupE8DU8LUJcCQYF2LDgRU0CK35yqQNpye0wUQ==
X-Received: by 2002:a2e:8746:0:b0:2ec:5685:f061 with SMTP id 38308e7fff4ca-2ec5b2d6313mr36947021fa.21.1719237593514;
        Mon, 24 Jun 2024 06:59:53 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec538ab50bsm7646101fa.113.2024.06.24.06.59.52
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:59:52 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so59857431fa.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 06:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeH5Lo9XnS9V9hjSi+r1BO3XkXqL943/Jvw6xXeEqDssaanXtswSlFNXkfBz0ytm2oG4gQyUsEVp24FqfptBE+nYI9nLiHI/YdxVIQKg==
X-Received: by 2002:ac2:592e:0:b0:52c:d5ac:d42 with SMTP id
 2adb3069b0e04-52ce182bcadmr3212857e87.9.1719237592124; Mon, 24 Jun 2024
 06:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406230912.F6XFIyA6-lkp@intel.com> <CAFULd4YVOwxQ4JDaOdscX_vtJsqJBJ5zhd0RtXXutW=Eqh29Qw@mail.gmail.com>
 <CAHk-=wg1h4w_m=Op1U4JsyDjsvqG0Kw1EOVMQ+=5GX_XytdorQ@mail.gmail.com>
 <CAFULd4YR-VkAOKiS5yxSUYi0YMzY1p=pkYe4dOkgFs+A=9AFFA@mail.gmail.com>
 <CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com>
 <CAHk-=whPqqZVSeJiQsMvsAxtAmtR9iAuB4gg_1sUK2D-uBPpLw@mail.gmail.com> <CAFULd4YAeF7=q7DYUh016kabxS8b32qRbFqDBJQrvLq6RjwEVg@mail.gmail.com>
In-Reply-To: <CAFULd4YAeF7=q7DYUh016kabxS8b32qRbFqDBJQrvLq6RjwEVg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Jun 2024 09:59:35 -0400
X-Gmail-Original-Message-ID: <CAHk-=wiHo2YeA=TOUf8vxFLOc0+BoH8USaiT25fnX2ynXbrZkg@mail.gmail.com>
Message-ID: <CAHk-=wiHo2YeA=TOUf8vxFLOc0+BoH8USaiT25fnX2ynXbrZkg@mail.gmail.com>
Subject: Re: arch/x86/include/asm/cmpxchg_32.h:149:9: error: inline assembly
 requires more registers than available
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 03:36, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> A real fix, not only a workaround, is to rewrite asm arguments to
> something like (untested, but "should work"TM):

Sadly, I already tried that, and it didn't help.

             Linus
