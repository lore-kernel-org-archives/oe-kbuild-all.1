Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC143B440F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510812; cv=pass; b=asEA5BZ6qpBDfDCeN4v83y+zmY9fwoZOlyHM+fT9v3yWgskTQ/KLEqO+ltv/0mepEb8nqN3OZZpa4Q+QJZRJgMjgqHS7574pZu1S39ctdVzs6swcu78171duJMQ17m8sblfHc4ZAm3E2M3qmTvBEHBoblnYGMSL7l5gp+Z31HGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510812; c=relaxed/simple;
	bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIrWtpEGavIIzjXQATyNjDUTcF8sXorLV/wusikWbDK8jvzb6wXkojaNwyGVozu4Kfe8fh+IQSJzjqxDjaSpc3zd/jgYYxvbASamNcdWOvYwYUpO5PzcxvXK5/GFcmiQ3OMhazUsQc3tieUMTpmQyITjoosbLlOfhKMOw0D4Rsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOigwtl/; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOigwtl/"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca6d9c91206so95314a12.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 08:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785510811; cv=none;
        d=google.com; s=arc-20260327;
        b=bYBlY/i6FdIF4W7/KvkthbjHdYgnPomrdnhiuycM6/neLenF6I2ErVmac9woti1Sjv
         UwZmWZbdtx3yBJ6WWhXEzG1e3EQnUErRpmX8SZns0rOXZZEuxOT4znpFxDyVLRKUAnSf
         JSQ+kU9S0y1PW1wpQgIPs2NUCDMsrO9FoN10XXmUfM4GUcc1wZnS5QH7M8BZ9qXdzd7+
         npZpl/zTEaIGBF0An2ETP8Mad1ezlJD88fRc39ARiPU0K4OaNBM82IbdYgMcaLs0T9v+
         PmD49eOFYHlwGcAlFTaeUlU5/Fq1MRgnpChK8iG9HJ9HhC8Ak+y6yroIM0hs0Iau4QhB
         Z6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
        fh=tjuzvSiazRd5usZTkJsKPN5psAtFcoK9s5d6ClxeC9o=;
        b=Qg7f2SBk3LLneN1HwTOQeLOlvgiX4FUr4DZA/Whwde4f8JacfLcTtbPhNL1idMOjdP
         fur7v3swAA9l8oFy7ukBYFJeIlYmBN4zZ3Pc/FgXlOzI/fShAZBX28Pc417W+ouwYjHa
         oaDaEsT0CNfZo8jGpa2V6sxsEuEz0uXUY/p2tNRH4K8Esae0hR+I9C2/IqS33nByj2S+
         Ix7LjcGgBD49AH4465Wc5uaXLUpG9SLvxHUNe7YLYP+2O1PTldG5mz7zJI/z392D5IpB
         huxIIHciPTw3AOik1CUWBYfaKxcMgH847iMD4ELNyU7/DRfHLKUqtjzTl453jKTEYOuc
         GmhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785510811; x=1786115611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
        b=HOigwtl/dbKiAm1KLeRpqGk5h/UFQwhPH3nVygmsvDdQ0+ZgHnq/KtBeLmkIvBNQwX
         +EYlP+fml2Z8axTkf/bVWX5P9m9mlsfRvMFymn0Jbx9R6Id2AeISM6+hJaIBQ9BscJNS
         P/iiiWi/UFCNJjJWSMd3+SL89Um+paejleooScNqhKlUHfBFYnDFvLBBO6cAeBUrMYEx
         DT70i02T3fh7ffdy9zGZA70RCKNkcmcm0dnzlBlpD0dwDZ6MEK1o1DKG7d8HPHsw5SLp
         UssiNiGvrWTw5kvFwJLFu6YVEsfAjS4K+guLjeNko0rjGXoUUDVgerGxm8xpIP6qEM70
         AqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510811; x=1786115611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j29T6C2HDgifm3l7fOE7DlV8uu3qURs8bKG7v3t1fYE=;
        b=q21RLFKsTUQlHk6RZnLG3KwLKKT7B6YuA6Jb8Xn0Xqyr+Ze+zsK1ZSzFejTRIe94AB
         c3q3oz8+4y+STmUVYSeHI/ufbVcwh8zrYsNhRK/w7xOCY77A+b5+L8Ts2LmVkT1HdSMH
         YqB9rwynLj1CAk9EXfZbO7UoFO9Y5Q1uyb/V4UVHrWC0Fs9aaKTedpdj8R/pkVP4Ue3q
         M+AHtg04+IjiLaPJyQMSNn8mpnsRrCPwwpNZ36J0ADiC4Jp6LSQ5hrCrWX3VID1j0yLl
         VnFp/vY0rbGI7p0ypqashXaEeO7pNptml8pvwJK/PMqlXh3A13a5b9yr81KL7LL30yD7
         xzlw==
X-Forwarded-Encrypted: i=1; AHgh+RoNbl4X+UzwI400lEHP7DYmF0KJ5nZTs8U2C3VpYnIrN8KSlfeMyfEuG48BgLQhTtggfYe4eIbH9w/6Ii+W@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0cZTm1S0gvuJStkzG/q+5NlWGScKv+FePKnz7Q8SKlxmMd1aJ
	cHGTUv2TAetAx9sVYKCbxm5w1Q+hDzVweis8g3D82kLAcRNB0COU/piyIkLmQ92XdGsi3pvs8yd
	63cG+29LayRlFDJNQmoZ8VnKr6u6xCks=
X-Gm-Gg: AR+sD10lZVyEYCgQot8nrFDPWg2HDrCdpfSbeykfYT3MBrM4sGY610eCBuf/unRKOT0
	VUzZroZuzc8ZULNOFGeANZTPWYngNntI7QwCeo2I9P2x2Sy2xUhF4uOcWj8d+YLqSwsfTtW6WM3
	m+sw6PpowmuGVvBiReaq234570rMRFOWTvxVp0yDfSCe9U6Y0I8GScCq3lG7eCJkXOZdF+aHdh7
	/VtLXFKgdOu1+0TBX2nRAyb7dcpBx8iAXqHJwGF0XbJSoKBEsZH8HNolXYFhnKaq/iAlj4/dgk4
	1sEgb+V/FhTGa0B72iIunsbSuQW687DoEXN4GRtAl/s9YWQI4NGymYhmDEroeGTgj6Y+T49jm66
	G2+MBn7e4mV9anqUft1Ja2czHyPrHQbU+gthNmsVUpGCzaW7SnrjYN23wJGusUyGTizpYKSg=
X-Received: by 2002:a17:902:f78b:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d05206277emr6050695ad.0.1785510810738; Fri, 31 Jul 2026
 08:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607311850.6p0ZUVq4-lkp@intel.com> <amy2RIReGPFzDSVW@lore-desk>
In-Reply-To: <amy2RIReGPFzDSVW@lore-desk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 17:13:18 +0200
X-Gm-Features: AUfX_mzV5YdpsTyhkA4IWD2DZsnjJYS5s09tasm0ljwol0yZLuOuBYodZ2UDeME
Message-ID: <CANiq72nFoPshLi_8OAYxpda-rJnRCh=UpB2CovMZXj+vo3BDeA@mail.gmail.com>
Subject: Re: [linux-next:master 10570/10862] drivers/net/ethernet/airoha/airoha_eth.c:3470:18:
 warning: division by zero is undefined
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Paolo Abeni <pabeni@redhat.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 5:03=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> Is it a false-positive? I can't see how sizeof((arr)[0]) can be 0 here.

`CONFIG_SMP` is not set, so the spinlock is empty, no?

Cheers,
Miguel
