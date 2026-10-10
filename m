Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA45C39099B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602795; cv=pass; b=eMbsi7diJmop0B71TQswHwN/OFIMRkuTwY+/kWjl6ouYKXRXiIIN+b/NYVVYH9hcW8iut5EnQ7klsC1OQ8fjwPr01xWNsYKB5xiryJsaV0bJQo6KqFQter4pghk2jjkkV+SWGtN6IqkyqoN5bj7Tx7KEX2pnI7JwCN8MLXMwGdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602795; c=relaxed/simple;
	bh=gzk/Vqa98lLR1g14dUkoIDBfibZcPrZRHRXSu0c7M0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N61rFLFACwIhcyaMNQ/KuCjiN9xGOtAwDjwmjKA68hub9VpmdQ0x9qrrCYC3NesorCGoXKWBpyBhg3t3QB+RmJ8MRv9FVqqAnTmCcz24v7L1JTw691PFVuZ+nJTtEHWhWydM7hhWyJSv0SABiEFmsKRQejvp36pIxc/6/y1ItB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXu5LEEB; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXu5LEEB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6e954afbdso1320475ad.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 09 Oct 2026 20:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602794; cv=none;
        d=google.com; s=arc-20260327;
        b=OiSCPZ4Zr4SEH8qQoajwWDneMtoqE4o17ZeCsX+MYgZTr7nvFS90TynpAHi0UP9pcY
         /APgzmM7AkiClM/JCjy+q9U1HF9Kz5wuUSlnUOFHyhryVVoEGna/M+IbCssXydbjsEBp
         EtCm5oe6x6vLaALT/An9b5rXlfKSlviVkGonoMtDU7AVNsFCZHZ+09y/LCyuSUV7GEUo
         ySmALnGCV1LfhkKizX8v1nIRngPNSDrfRXTfOxzD3esiWCM/BZvMGr46gO6N8hmwZZHT
         hMTTlY7/k42eC6uSZ1qFfznhdobr5buGv4XFUgXmjyd3mqKHjHkLZjCj4zIveWdhgTRd
         zvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        fh=W97PUhSgM2TEuP/nD55A8gAzrwslP/fxK6NujrpHLGk=;
        b=kd4yRrUaF2mYpfU+sP/8b7yH1u32J0L+LAoDVGKmfkX3NCfcBb5sp7pA1D6HjtBuQE
         SX/ZTB91zVGQMl1Kb/5VNBslcTILKRl5l9QYNtY7DcUEWhunkrxUrGkEkxRKRmuekbdY
         JoB9QfgwXjLpm9MwshSA9XboCcUigYHeBy99GsOqkNoyJQFcYkU40VGKdDLHG9j7PG1w
         poivRU8GpqO2vDSwBYCv7V8oMhdG9Owuno0mOD3fUAUEiMwRXq/wIdE8DAyVzN4OaDTp
         J91bAg9PPIMQZy5W2tKWHPx34P6EiUSzeMK+820EwcLdSW5oSqOustY6XefM/fjRIbVQ
         7BJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791602794; x=1792207594; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=IXu5LEEBvC6xzi/uLSve60ASUnWiG12aFOEPCiam40DR1wK7U3/mh6UKnoIUIF7LuW
         D6BWeFjIjyJVj6bVE4TARHtHl+8ISyq6DQBMMAd658eZd/BfLg2baOVnze7p88zJ4Fwj
         Vk49lwUGAhY+tq+i4j4F/f2IQEa9pkw9Ih7S/Dt2szEj4DZ949IaHO3DFX9gp2g8M6GZ
         HQEJ25FDQ+wyx3xjS3R0K/NRHZpQCOhhphdPsa5KNVugsHlpZdZ32zwjE1j6EtydzQlj
         cUXq3AM/L88jcY3EarGNq0bgTmJHq4tbpilN7vFOcRTJlavF0KOhsqzxdo+wB86jjGe/
         mnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602794; x=1792207594;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EKsZM7l4NZN5ZmLtu2TLLZnTaprdtKnTu1bdqdwiqrE=;
        b=zWtIaDIh+BmKoplLCkhriDdVqBA3LJfeTvSDSXoNVJJUyAqRtjl6Hu06jhvv+6XMu/
         k23CxAzvqN7LhlQYjMn5EWXqaz2BlmQs3gJ/Jyhm/XEb7MpKnvuIAxzbRV4eRfqwWsnV
         fy1Gh0h3s79lcUxBuWnB7IBvQsKgqedUmpIaYNxretP8YxPh+NYkf7CWEaWN7LxQiOxN
         hzC3vGBJasjCAfrv4GzbSyMBAgrKlIW45Z6Ru5VKTeZPok+g2lW5RLCLONQd0AmbojSl
         50Xs3W6O2nFMdaTc2yit/MM8ZzdM/CXNdVKps9PsMFHWN3Z8S7Svc+gjOds/64Yha9nW
         yCCw==
X-Forwarded-Encrypted: i=1; AKwUvByeQlsH6QIj8iRcQW8S4rDMtq5aiaPvRV7PO/DmhUmB1Q8jIuJYgeg09nCva/zyBUCxSDl8oKehkH1EXT7K@lists.linux.dev
X-Gm-Message-State: AFq9FYLLVJdN043ARRLzh7Lok7zbEUcVnXMkAzC5dFHWBfiyOsfCndig
	e2VUOGCBDnXwHjywANpktZgVYZsJKqzYsqZ5udQ1LnxoYFQSIkeAHpdXFga51+sRiCX9gtJF9HM
	t+Vi8LeCSRTaZOTfjdQBjexCU437o+qmjPTgb
X-Gm-Gg: AYBFou0ibSSGRWMjzYxH/04Xjh2q8irQ5yh562SLQoHHpLCZN/0mh1hni9FRISUHwMz
	OY6jq2hRxpCHYY9yxkp/sJrqdVQuMe9ZCIjJWHysuR1kW5CpHHO1h/sTHCRk1L9LVxsIV0nvz17
	mKrIZX77Uq9TB2P8V1HJgFr34of/fCG+xjLQTM0aYNAbfNSse+D6nAYBHs9NJVLgswlLMKXuzn9
	WL/Z9aF6k30mnmOpg6QP2GnqqoqLgNwXUOEIeCKM8VZl7R3jr2UtQguPBAunIFkhiLxEW2APsk9
	KTc8wa04WFDpxB3WZyQEliLJwZHLiSalgS2XZfKnHZMxD1SKXwyrC4zg3aj16eeEhfoz5UGQ4ds
	yD/aAH2Wnvjn4Xja5gT03YTux41UAETynxKYMTYVt7t3NQiN/eD97VJDPbTI8dac7h1eOXghxda
	P+nXuMztR6fzkvsgrQllTcXIY7ZA==
X-Received: by 2002:a17:902:e74f:b0:2e5:78b1:33fc with SMTP id
 d9443c01a7336-2e842e061e4mr35918455ad.53.1791602794135; Fri, 09 Oct 2026
 20:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009112634.33436-1-phucduc.bui@gmail.com> <202610100943.RQhhOoh8-lkp@intel.com>
In-Reply-To: <202610100943.RQhhOoh8-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 10 Oct 2026 10:26:23 +0700
X-Gm-Features: AclHuK-rwA97Wy1N3y57S1OeNaWlVpoAN-_YWwiNqheegjzdeSENPlryISm6gn0
Message-ID: <CAABR9nEkjf8_dar1q4tYMgBTa0p7WzR9Qx1N4Nr_ECuNZ=hxEw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Propagate reset GPIO errors
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linusw@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Darian Biastoch <d.biastoch@gmail.com>, Andreas Kaessens <akaessens@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610100943.RQhhOoh8-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/pinctrl/pinctrl-mcp23s08.c:617:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>      617 |                 return dev_err_probe(dev, ret, "failed to get reset GPIO\n");
>          |                                           ^~~
>    drivers/pinctrl/pinctrl-mcp23s08.c:592:17: note: initialize the variable 'ret' to silence this warning
>      592 |         int status, ret;
>          |                        ^
>          |                         = 0
>    1 warning generated.
>

Thanks for the report.

I also received a similar warning from the sashiko-reviews earlier.
I'll return PTR_ERR(mcp->reset_gpio) in v2.
