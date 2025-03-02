Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA711CA9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740918908; cv=none; b=R5XmmMYfLKwgpkaT2gdydLddCF6mRTNSuND9ItvKcEm05rsRtN95Mj693oyG5khmTXe39Y9yzVyPxJvlyhDeNxh4m/zn94IMXAzbFzcu669jPQU5XCWIW8S0d+cgu49ML+i8hypwO7u6WbE0/0egjCdzXrRDTDdgAiVPRucCcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740918908; c=relaxed/simple;
	bh=WVV53O4G4AQkDwByqkbjtuuQX8Evj7GgwGkRnE+c62k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YiPlzvm7U/HLEIP3SjnCeIwYtJDNQyUtPQktog9xkiaUhX7SbwJuwf4HvT631/6reXzelwOZvqnBFinIVvRME/1cpmgP1Pp2xlf9NAMOt9odxlFhev1o2BnQ7H5r1rmxoQgo0pK7kaFL8nksq0wJ4rBeWJixsXcmzk9ZkoWTRUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=On8zcWcJ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="On8zcWcJ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4dc3d22b8so4312175a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Mar 2025 04:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740918905; x=1741523705; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TSlBNjxFdfPRWaRfE5Fsi1hiMnyGQ/3j+AOhQpdfvzA=;
        b=On8zcWcJPa5VN/KwPysSs3z+OfGtbJ/kXFrVHxH0M4c8UGhmTGdGjfOo91xEo9QUuE
         gUiXhzW6PMgr/UoVtA7MzFiIsd0aCzJfoquUPCL6dpLjltw1LW2JfCe2wAb9SZC6Byf6
         al/OCwkMZCGzhmd9LjiNySTo8zslv7pfz0/4QtP+ZmVflcIEegVCKPzMWyhVfASJAXU1
         yF/uMKTNhljJUStAq0XbTQ9WcjBuFGmfWGpLKtkTz+kcgcaTnubZMBo+Q96ieLaQCikn
         0Wm8/+jPOsA7/DAYrB8nLLHpoaNAFpWPb9Z8dBH2VTdeydop2+W/mkL2INSVpfw5D+mu
         mNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740918905; x=1741523705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSlBNjxFdfPRWaRfE5Fsi1hiMnyGQ/3j+AOhQpdfvzA=;
        b=msCfM81S8am6itMhIqrrLEMP39T1e+Roi5X5VlbSR5HyotjDu+pzFq08uc3Mazp+8S
         Hbcu8MzVSPN/vDJZh9yclEAl3j7LfoNfd0TLK3lZEiL5j+guvO7O32qMULtizO5RoMTC
         DwSf83YD/Zh3AirAdFdNnFSzL2OSYJZjx8W387+4lCEBUFgWtHzatWWZZymQ6p359yIA
         ciEZvJGpo0QMrg4QbbNA+q/Nb3wtA8aG0/e1Vr+JblbEY3XF8lZ7K8IPvWT5pf1Uq/ID
         XQXteMHC4lGlMmfo5bMJ4DjdpvhPkllKhEDpttZH4hITPP8TKS6iVvWFldy08x8uvHyE
         JYZg==
X-Forwarded-Encrypted: i=1; AJvYcCUakia+Dl5Q95OonT1MDpEwXdSFc/4D1odmeK2igFdQBQ+MmNBdny3lbGJ1baiFxEeGH4iEFPF5yT3u61v8@lists.linux.dev
X-Gm-Message-State: AOJu0YyoeUvmOm2Omwcp92ktrr6lX40FQ+GMvHa8yTx6kenH+BW4x73W
	M/e8V5kIrzUT05s3up42wJeE2dr9QbuxfIKkMyWeq2c8S3ABQVmug9pQIqJSLzE=
X-Gm-Gg: ASbGncuYAS7LnjEWtYpW8peMZGTPCYm6T4KJr++W6tZYiYeB7kX5MSQIOiqNWdo0zDw
	vJSVVse3VUHYkboeAm/Uk2sixKIU2QU3Xc/x0x54Z6pjHFqBewsADH0e+aq9HHa6bg/mQfpDF/4
	fFxEpidVyk1A3SaMbD8dhpF/htV12OOjNvO/sQQnxT9uwyXVWlu5M6Gsueo4GeS1its8uUzM+Ov
	zY/FaLYKJt++bEheUzsnV+f5ZKwLAVkVHEvKWK4vceysOD7DosQT1/VUWi9LoCIEehenBKVzNFu
	AMq/1Szo3nI7+bTfAVXu2fw7HKhxauoXzJzXrhFC/Jn567KTMg==
X-Google-Smtp-Source: AGHT+IFiul2Tnx/EbL5rX0pJA7tJd3ph0juB1ESj98roRTzavKY7yv/JOP1AJN9p5S1c8eGoz6o87g==
X-Received: by 2002:a17:907:6e87:b0:abf:56ba:d225 with SMTP id a640c23a62f3a-abf56bad60dmr613425066b.14.1740918905310;
        Sun, 02 Mar 2025 04:35:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf6f85ea15sm97345166b.111.2025.03.02.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 04:35:04 -0800 (PST)
Date: Sun, 2 Mar 2025 15:35:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [linux-next:master 2357/7423] drivers/bluetooth/hci_vhci.o:
 warning: objtool: .text: unexpected end of section
Message-ID: <dc1b62ed-8a86-4424-8a1d-bc20866fb4d9@stanley.mountain>
References: <202503011220.Y2e5vz4w-lkp@intel.com>
 <5jkf4f2bqmomecoxzzdyhdo2qg7dso2jihzwcox6zufnurrwtm@o5gqbsgmpldy>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5jkf4f2bqmomecoxzzdyhdo2qg7dso2jihzwcox6zufnurrwtm@o5gqbsgmpldy>

On Sat, Mar 01, 2025 at 11:15:46AM -0500, Ethan Carter Edwards wrote:
> On 25/03/01 12:30PM, kernel test robot wrote:
> > Hi Ethan,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> 
> Thanks for the email, kernel test bot. I'm not sure my patch would be
> the cause of this error, especially since my patch did not touch
> bluetooth at all. Only the ham radio driver. 
> 
> I did find an email [0] from a year ago with the exact same error in
> the same file.
> 
> Dan, what your thoughts?
> 

Is this a Clang bug?

I can't imagine what's going on here.  I didn't try the reproducer, but I
I downloaded the .config and did a clang19 build and it worked for me.  I
wouldn't worry about it.

regards,
dan carpenter

