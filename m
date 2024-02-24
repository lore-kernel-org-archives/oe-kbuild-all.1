Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327218021
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708790312; cv=none; b=I1MaxcyJaJ51UxhneZEeXxGEBF0aC6SKLnZyTOW44NODZ0f/MCSQm9fsvnzeFwYnXT2dp/GLhewB6cU8P7FNC2emTunco5DzddgOeebXWTeB586sJSWppk8HEBGZb3/SlwR9NzjJMPkwA+e1BwNXt11TlRErTkLiyVZzgq983VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708790312; c=relaxed/simple;
	bh=tn+wyxk5uwK/kJdVwaOVs+ptdO3qG5gdxMcayA3xpDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIHIu7w1nmYx1j14uB93NkOCFd8vZDxdRJdA8DR0N+UZLFgld1WtOdRadijUzkDmttT0yqRJaRiSoR2N/k8l6QjILurksTbZxvbiUKyarUks86PKu7cvR3DVTiH6slfEVTng8xS1LSp5avQXieoUxLtdyJPMY9G9kjfnpA+qH+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bCkWw1Fu; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCkWw1Fu"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so1519281276.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 07:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708790310; x=1709395110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q3LLVi7UXjfRcoBjabv86oQvRhY41hxKfXIsF7KHc4=;
        b=bCkWw1FuqcKMYA5JwS+SPVdBiMJWfr7x1QjwbUjXLWV9TH+VrNl33g3JavRl98tPBC
         C1uPY5+I7ZqRqo4z/6+/tUpIO4FpFkb1H/6Niac+K1ZJ3ITTKIEqHmojEtnwopuA61Tz
         sF/v0cUrMJ4TTqAoEANT016oVevdFRdntV7gKZtOoGSpjZSEIHg1zK18n9tLvQR7XBx0
         l4Fr95AQTQJ9AiNLvoWaKN2EzESpkZaERNSS/OlAiRjoTqOPjMpBmUQdDhHtOaXizOdc
         GFo6R/rZfCJsTSLo1F6Lq/iZvE87YfBbOcPUgsNTBo8kYHgV+Sbzxkr6fyGqn+ezKh81
         CHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708790310; x=1709395110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Q3LLVi7UXjfRcoBjabv86oQvRhY41hxKfXIsF7KHc4=;
        b=nEOyy7+83J8xmS0DGkD3FnY4bZ91gL6lFS0qHYNR+LQtiiekM8m5/aaDdHdiLxgmRW
         jQY0D+cT+D8LkxaRqNox3MyBYBTm3QgtBvYs7XGl80+1UMB8oI1RdOhVMz4q/2UDoUxA
         BezxowDbo1xPChX89scX71gHeqBhZdmrteNbmGjzIAzLiYLQNdzyUxV0P9voiM9OxILE
         5SUrDmR/EIDBG4+i0oi1KB1Fozxnl47vwMAEop9AtqvymXsnIIjjPeZ4NtEbq3nCjHsK
         F0Ry2gEJEv/2BY6EXym1B20UOUoYoH7unXDibUOMgXL7e3MnxPf0R0idmSv61LMnvaeC
         7Qtg==
X-Forwarded-Encrypted: i=1; AJvYcCVbMNJDlIaAbGgti4fx5mrHvuJJgmunA4/njf8N7PymQS3Ko8ygkpbRI41qY8HdAj64NDAU0reNeXlQbH6no4w4SIuZFmGCYZv40sU/Aw==
X-Gm-Message-State: AOJu0Yx90HTcA3yHNp6aehOhaIA4m6ousMDvzCnYIRiwFEd7fFZTpOu3
	1GwxsNrOk6y3uaoJBreVub/sUi88kjCWEjPizsepdwnKTfflbr0tZpALHcCkVhot3J0kiAdJ1y1
	2K9MVQ0whyhmGc7tx+zxPV8h72j58DXll1321Fg==
X-Google-Smtp-Source: AGHT+IFRW5fr+zTGpjnXwH+OyFOdktrbTb8M/GNEkdNtTl0r8IvGddJJSAXDmCIqx3AtLqd/ELkwAoJcF5n8CUl6gQ0=
X-Received: by 2002:a25:844b:0:b0:dc7:347e:c6f4 with SMTP id
 r11-20020a25844b000000b00dc7347ec6f4mr2136513ybm.32.1708790310121; Sat, 24
 Feb 2024 07:58:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402232058.4eDf4GRs-lkp@intel.com>
In-Reply-To: <202402232058.4eDf4GRs-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 24 Feb 2024 16:58:18 +0100
Message-ID: <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
To: kernel test robot <lkp@intel.com>
Cc: "andy.shevchenko" <andy.shevchenko@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
> commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mmio: Supp=
ort 64-bit BE access
> config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240223=
/202402232058.4eDf4GRs-lkp@intel.com/config)

UM Linux now again.

gpio-mmio depends on HAS_IOMEM
and UM Linux has set HAS_IOMEM, but
also claims to support 64bit without providing the necessary 64bit
io-accessors.

Maybe UM Linux need to be fixed?

Yours,
Linus Walleij
