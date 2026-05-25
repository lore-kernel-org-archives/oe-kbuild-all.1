Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11643A873D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 06:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690921; cv=none; b=kTAM/ZI+Xs7J/JyhKTtFWe8toTuhrBrkspz9QWJ4Ctwbsjx2AgA3I7BLX/vR8xHHKTDQLnZrLfAg424fSt9CVz/Wjwo8eteoYYHnBIvcnf6rYm3Jk4q7YJRUbIs1OkZ1DINnXX+VBuvx+z8Hed+GqZMiKaw8JXPdJy3W6lGbEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690921; c=relaxed/simple;
	bh=pgQNVMwHgd/79KTFGqpCTZV0hVZ1wRZLsMAShdulXsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOsZDpq96EAi1fvFUbmeWY3o6JPWr9zN9uImBRq61JY09g9ywAxrwReIj0DT2Xn503iObQVjbAV1PholautCyCYTy6ja/u9otscE7NuG2BDPAtIioXvvLkhdZ6vmARDkiTpZoce1JAcc0JKMeAOStRH2xK43ArF4v4GioIwJaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnx1YR7X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnx1YR7X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49050bfe053so18827695e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 23:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779690915; x=1780295715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDjCROWH9nSvrhq6KIZXc73qPDIQ1q/sUsS874OlOkQ=;
        b=rnx1YR7X13yu6i6uhsyz2dALIbGUncu/iR7LJf7uKp6aLoC0qp/zdA4wyC4F/dHAO5
         vYKYghQiz5giAKvTdhe3Qq2pzqBqdIoJmalAEvuq5bWqacZRO3RUzZuWTLUhYJIiewJw
         HJRrXGoAEexIeU20A1lg3OargXfJYSjpO9MKU6d0RmrFBhl2B8ly4WmazON/JP6vNJAC
         BWcQZvtF03zEBfx57sexkmzyvnDSaaFOvFRFdREhJX+5WtN2pW1zzgJc6IaKFjG5sD+4
         r/4GG7IzuE3Ku9ufah8/MlLEsD3WdHz4ITZ5ldso2elafUWO76gEyeePa+aeDefjmmyE
         2QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690915; x=1780295715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDjCROWH9nSvrhq6KIZXc73qPDIQ1q/sUsS874OlOkQ=;
        b=pw57jQQNINzJ9tqt4v+fZVo2puKKga9EWkVb2uQWZfCjkq2381+JXqRBCz/zUFibDA
         q4vWc2Ajx0PMgZSthJZtbSyoe4yHsxRN3RQy3SxeLzJ5AxQn/cB/aQlBFKs4KSPcDdYi
         5pfQXkZgDBYOZURal9Nxz6ZUdMtJDo0AnosOtMwqrW4kgMvbIYmGQTHBny/u0Y2tsvdF
         yrn7YYO1wN1OI+kSurgy1+xM7fXAa9AavfdtohvPUGdHIar/aQC8zXQ2c57NLNl6aGFF
         GXr8DL2R60LgjcCoXZ+MR5yHypiTXC2nzxyGF0HNfXJtbW2/1btYpANg4lculXo8rey+
         QgDg==
X-Forwarded-Encrypted: i=1; AFNElJ+3UNNNvs4KKd+M3ICj0YqPYsdraNwfzSdc9oYI7TUMpBNhdo1nxFBsJqxr9NEOGNp2JZ/6uRtRJKYPSla+@lists.linux.dev
X-Gm-Message-State: AOJu0YwayjYAuVEerj+/67ouX9U5RQbKYjfk9IToO6oz4lEVKuZhEhqK
	5j8643KHmsBxLJMtCc49UA+8wERlolnwJXb7aNv5EMLEsi+5xCCZW50s
X-Gm-Gg: Acq92OGGQk8jWrsMWLFivHz5yQPMvIkp02Z76jCMPLin5wmE5k7LNVCSjYBPZUPi6Zc
	cyMFBdX1Av5aadnLsXlM7y0KMd3SjrmyvxCJ/c34CTupTVROxgFi1qv4LiWqeGbrMc8pmWtNwVq
	f+GxbCTadBk8AwRpNnn95NvVi6TewV8kRo5mZLDeUWtOdzh91FmkYXkIBzJNdZoQ+ug/3RNyTJR
	y0zHbZjlZFIjNrZESlRNAI5IRG3EuCjeFw/TeUjhDBedx6PUu6Qx1AHw76EffdFQJzJ0V+U9FzM
	GOwIaisbmHm58hYLkjFZ0sFiLzqrZ0wtb04eVD/ErovoKgVjKoPbAQTptBkCxxalEAgyKdccXF9
	qBVmYD0O5v2hyjNF0FWMKMe28vpYsBW/gJhbFd3SulMqJwq1a6I6ce7OZDc5a6jgkEr3U+KDCwv
	J0UDotAqOcOp+D6HX4nI3HkIw=
X-Received: by 2002:a05:600c:4fd4:b0:490:623b:b107 with SMTP id 5b1f17b1804b1-490623bb259mr57788875e9.12.1779690915274;
        Sun, 24 May 2026 23:35:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm66053585e9.10.2026.05.24.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:35:14 -0700 (PDT)
Date: Mon, 25 May 2026 09:35:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: oe-kbuild@lists.linux.dev, Saravana Kannan <saravanak@google.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [driver-core:driver-core-testing 12/18] drivers/base/core.c:286
 fw_devlink_refresh_fwnode() error: we previously assumed 'dev' could be null
 (see line 270)
Message-ID: <ahPtn3jZF2JmukXB@stanley.mountain>
References: <202605230211.567ddMEp-lkp@intel.com>
 <20260523130142.5efe048d@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523130142.5efe048d@bootlin.com>

On Sat, May 23, 2026 at 01:01:42PM +0200, Herve Codina wrote:
 > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> 
> I don't understand why smatch reported a problem.
> Do I miss something?

Thanks for looking at this.  Your analysis is correct.  The problem
is that the zero day bot doesn't do cross function analysis so it can't
parse this code correctly.  (Cross function analysis can't scale well
enough to enable it).

regards,
dan carpenter
