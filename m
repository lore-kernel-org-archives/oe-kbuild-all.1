Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB082040AB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353391; cv=none; b=gNqxczll7IQHL4O6x/KpOxIkZuleLQCUQ/0IeaoAmnY1n9C3zKUKLI4X5H6sRRWmIx8zAn0Cj7b/R8TPDCok6KresFTxAxfcpWaeAlxS1rwBdoX3s/jjn5K7ysHzIrTrZCiMsb2wrcvzUbWOmVPGR/PolFs+oG4jwM9L3LSs1CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353391; c=relaxed/simple;
	bh=MEZMPp0/6x2Hj8xdnea+WEkAGujy3+yoVNtutOdRFkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THdqvMy1q4mr0FvpAsHTg3A3AySUwNwJ3XNyF5icMcbZyvCtIubGwStpsjoInJHrNnMKR/pmDWj1c/kjAEoKhMtF/gr6hRPGbExGLCWLQY2rXqMTHcHw7735JXmGHK4xj0A8W6ZY/NBJUcEB5uDn+9jsNwBhRn3z8FY55pDj+Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYk996h2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYk996h2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso23192585e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760353388; x=1760958188; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R36zhEWTXjAMC9qqqcZ2hDhZQoe9rT+tHqvTTsomPIU=;
        b=LYk996h2NofL+nbYgF3JZPHsgceENqyq72hl05MHsx22xv6O6dwnOELpjkbW/1wY32
         PlKuqoScZFa7yJ679ezzinrUos88a1RsuOfSaKudwCK64NxNVBj18mAkZdr2cDfbs9Fg
         vs4KYvIlflhrxtjCKNoGHM40D2BNHzJCHqOEV/5FMJvb/IUzbs6kX/wNm95p2CFl4lav
         M4c6EzY0evuaK/edZB6szSerBvYK8JCxOpXX3UZiH/n+fGSEQ9cioyTzOAXjXo3bNsDp
         0/4nvcPOixnttPRZrq+lUBb4xvHIQpLcHNQlENFBZPaZd2vTo+SnShvMM773wSR155uS
         wcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353388; x=1760958188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R36zhEWTXjAMC9qqqcZ2hDhZQoe9rT+tHqvTTsomPIU=;
        b=lCdeDE8rjOWWej6OQ4En6BJET06MhEvE73OUN93A8CmWdCx+BRoSnK04Rbf3OHTlLC
         X7dvsVif9FHGVACf7tddFzQPJWMkltvlj5cQqC0f2x6KyIu8aHrLfvqlEdxtLp6uvq6a
         xyky3R+oNPsWNfmbmdQm+6fGGfuXSdnNi0XygzjV6AmOc0GKEsoNJut3IfVYalLjjVpg
         Akc8VmG1uud289cl89kNJB913mXY8tWL4z0ob8O2m6S3hP7P9Sy6lH7VI4nhD/IU17RR
         BGuG/xsqiTg82m3p7b72F7GWLjAdxI4STSXyHsoHsz8ulyOvHrby0AaDoT8oxg98JIp2
         lT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwA8d6tqZVCOAfA87DVtEfZ9Y79rsCiLgkQWnXveE4xZJga43Ww67YHlnZWjO+aRx5+I/uvE0gvw5fsSat@lists.linux.dev
X-Gm-Message-State: AOJu0YyNMAHolAvBgMT+gxPfuiSJT+PZKouPWTc5utZNHP2zDzbkxqR+
	nqEVxhn80wEPN2qLvOoN/mCko9aeJmJgb2ImJjNg75bzW+m29We1dqDi
X-Gm-Gg: ASbGnctpAENyLMOKijzRE4eHLqNYddmSWgzsbufiPQxTxyBkLznLcIFa5N+QMB27kZp
	zk9CemLEOlKQn2xzWuS1baAyt9aX/+7/wLQ7+PcBBQWp/EbEhGbLrXhuPjIe0D1tlyTSNt6+nB9
	IPSg5Qy1l3Z2PaYcLHJw1Vcvmx9DujF8ZL0Y0w7hhH5rNQl7KEvJmtgMXHBcAzMYF1rcn9No2nR
	SlLospn+9LPqfu0rA8v0PHC91xm4Sxm+9tsMDXRsTR5slTqSpYcc535ggf6aRn/N/6KMxGQaAOM
	njcvF9eCUj4YRRCviZSme8KC4lomIig0kxCbgnHghUHgP5bo41wwbzw5A91mmYcL4hrfZ+KOogY
	ODvzf296PGWNx7ss/QiAL3FH1XWJmu0yhZH598OuKcRqnNJ5Ka7hElUsqNx9LBORB
X-Google-Smtp-Source: AGHT+IHJe9CvuwCz6Q5PoEQTTbl6WyMaH7Au5Vw7APlwtIacyj2OmqpNIAkZPtVvi18U13DZly66uA==
X-Received: by 2002:a05:600c:3e1a:b0:46e:1d8d:cfa2 with SMTP id 5b1f17b1804b1-46fa9af9842mr127699785e9.20.1760353387911;
        Mon, 13 Oct 2025 04:03:07 -0700 (PDT)
Received: from gmail.com ([51.154.249.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab4f3b07sm127656955e9.2.2025.10.13.04.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:03:07 -0700 (PDT)
Date: Mon, 13 Oct 2025 11:03:06 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Bjorn Helgaas <helgaas@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
Message-ID: <aOzcasDutRtw6JP9@gmail.com>
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com>
 <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com>
 <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>

On Mon, Oct 13, 2025 at 11:41:43AM +0200, Bartosz Golaszewski wrote:
> On Sat, Oct 11, 2025 at 1:32 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> >
> > Hello Michael,
> >
> > Ah yes, this macro somehow got overlooked by me. I will send a v2.
> > Thanks for the review!
> >
> > Regards,
> > Vaibhav
> 
> While at it: the subject should be: "gpio: bt8xx: ..."
> 
> Bart

Done in v4.

Vaibhav
