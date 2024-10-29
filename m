Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EED51854
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730189235; cv=none; b=Hu7mXVwz1FEgNTgkHY+nBT3glvlxc4I4gRBMOnb5feFrENHQmp16UOjTXl+b9DB1MgZyZcD8APfJM6kZyC5IcqQDiXkY9XU9GDlkNzKtzm+R3Tiw7NSbjQliIaBbQ0G3DnfDnSiRYnI8RietG/1tFPY1Fet7fRVMIglJNn3kl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730189235; c=relaxed/simple;
	bh=tXuUWJqSpVglQII4ixnCWmF/nh5P59YMWadDSqaw5mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdJnD1YBThqZQBDqf1sL5JT3uH1YMFfZIUXogvIG/nJQewppEB6Xq6/A2PMEi+ypgZoAm8lt5+e4y2PiYKUdljZQXpe93it9RVfNkNlZ9vD1pfrYSbOrcU9ST1qrg3AeW/bGLI2X/u56mpZILeeRXraSBmP9UQMmGqrE2jxRTeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YXd1TltC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXd1TltC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso6999150a12.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189232; x=1730794032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+T+utu6wQonBd+x7P2V+J6y0wVjSr8LnD1mI33sJ9Uw=;
        b=YXd1TltClAGr0NpzsXqm3ydgHq0lZqBJzA3KfR//9Qc98nctQXKYXW+M8ydkcspB2f
         TyH+ttASwNFLMd5M72tzsaqR23U/0ETWIqcHYBcbMsRpBN3YAOIwWCMCI9uB7ppRXl+m
         rwgc7HxZUhyIc3MoZk0i9LwjS1zQsVUzAZNIrAOhbN1pj0MffT4g27RAHxjUPjHmr1hJ
         kelug3FiJ6cfHp6gDVk7jBzPKHyIpufN4N1Yyx5qMmip8SLktquN5RRACmnPMVSyOiRE
         /CK5jDkKG7AKQcjdE1lY/lf+jx3L5xq9ZPQpI4ptPTw5LHtAV3K2zHuavG4DpeQKL4r6
         yzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189232; x=1730794032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T+utu6wQonBd+x7P2V+J6y0wVjSr8LnD1mI33sJ9Uw=;
        b=uspimsw9mt1CB1mYySDnuWHkxTVigsyMrtcNFdhm43Zz0u8vWX/gN5mkCHzvshy5U2
         zVzQF756JU9Md7fUNEwl/icCZ2l0hc1N21zmakewIfPSGFxQRI9JNQkxAHHcBQQLu+hE
         Eo0UVQt9pdTxSCgC52i0fWKdnKqNZLlfDFRRy7fcZ49mI+VafqXKKAUEfCqbojT7xnJT
         GPb4KsnqiOT6fCtiEwbppBG8e0eUJlN/NkOIOtHeBwyO5ZbloMVYVkTBuE/9uGnTee+R
         mK+4aleBkQpcjHmqwxEXCozYL+eADFXIPmWoFClInUn7vwflVxtY3AciHkFv9BWtoktC
         1nqw==
X-Forwarded-Encrypted: i=1; AJvYcCXmsvOKu9qzXlG6GFysarpUfoNFfpXUm50OBj8SM+4qSqcIm4BCy1hzTenKIo1C4T/rqZ15CW/9KBiv15QP@lists.linux.dev
X-Gm-Message-State: AOJu0YwkdMaLkFyrDaQdChu2e1wEvPqwvxlMFmqx/QDKT+wFUaYZhMSj
	fiJuzmhx0aY2Nyvux9OwqX+8pFijUyouZdiGzBS9Pzi7eVy4xljBo7t3j9FKrhI=
X-Google-Smtp-Source: AGHT+IFlS/2bOJzmSSwcAfE5aV0lP34QNs4GrtfDDXnqpV/04HeTDMnTLLbECdisvIqSJHMH/jyIpg==
X-Received: by 2002:a05:6402:249d:b0:5cb:6718:7326 with SMTP id 4fb4d7f45d1cf-5cbbf8caef6mr8643251a12.21.1730189231684;
        Tue, 29 Oct 2024 01:07:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb629c4c0sm3726166a12.24.2024.10.29.01.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:07:10 -0700 (PDT)
Date: Tue, 29 Oct 2024 11:07:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: Matthew Sakai <msakai@redhat.com>, oe-kbuild@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
Message-ID: <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
 <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
 <ZyBQa45RTWXiXJke@rli9-mobl>
 <ZyCLo51ZyjxX7eQK@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyCLo51ZyjxX7eQK@rli9-mobl>

On Tue, Oct 29, 2024 at 03:15:47PM +0800, Philip Li wrote:
> On Tue, Oct 29, 2024 at 11:03:07AM +0800, Philip Li wrote:
> > On Mon, Oct 28, 2024 at 07:00:40PM -0400, Matthew Sakai wrote:
> > > This should be addressed upstream by commit
> > > 872564c501b72ae0c84af51084753e8652e4a84b ("dm vdo data-vio: silence sparse
> > > warnings about locking context imbalances")
> > > 
> > > That commit is from February. Would it be possible for these checks to use a
> > > more up-to-date version of the code before warning us about things that have
> > > already been addressed?
> > 
> > Sorry about this Matt, the bot side will check why this happens and fix
> > the issue asap to avoid meaningless report.
> 
> Hi Matt and Dan, would you mind do a further check of this, per the re-test,
> smatch warns as below on v6.12-rc3
> 
> 	drivers/md/dm-vdo/data-vio.c:982 vdo_launch_bio() warn: inconsistent returns '&pool->lock'.
> 	  Locked on  : 972,977
> 	  Unlocked on: 982
> 
> The corresponding code of drivers/md/dm-vdo/data-vio.c is below
> 

Ah.  Right.

The cross function DB doesn't scale well enough for the zero day bot to use so
it didn't detect the fix.  If we had the cross function DB then that silences
the warning.

1) I re-wrote the locking check so it detected this bug where before it didn't.
2) The kbuild bot was using the new check on old code because Matthew Sakai
   did a branch based on 8 month old code.
3) The kbuild bot detected the bug, but unfortunately the cross function DB
   doesn't scale well enough for the kbuild bot to use so it didn't detect the
   fix.
4) I reviewed the code based on the information in the email and determined that
   it was buggy.

All those steps had to happen for the warning  to be sent out.  In a normal
situation, I would have sent the warning out at the time when the code was
written and you wouldn't be getting warning emails eight months later.  The
kbuild-bot generally avoids sending duplicate warnings.

Sometimes the kbuild bot does send duplicate warnings, but I normally delete
those.  Perhaps some people might argue that if you do a branch from 8 month old
code, maybe you would want the warnings, but I think you should look at the
Fixes tags instead.  Not everyone gets the Fixes tags right, of course...  But
I trust kernel developers to Fix their bugs and generally they do so duplicates
are normally false positives which have been deliberately ignored.

regards,
dan carpenter

