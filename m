Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626BF63407
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 06:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709274796; cv=none; b=rVhXkI/R2vCLAlLTIHp4FJUlFmnAn8L0FMO3cUrEyY7vVER0NWkfId6uX2gQaC6CtukSvsDAMgx2LviHXmsPD3SNUF7+6tVbCVTbe0y8gqgGnnnU/9BmoLp5c7lCg3TgZa0Qu62dT3oxD9aDX/sI9OQpVACJ21Em97xWPiVqwIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709274796; c=relaxed/simple;
	bh=1A49pWCrKxjDV0YLcbE2h1uhtFbcqlO7mDjyc4a8aDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyr71FXH51Jh6LFrOdQql6uR9vQ3Cb4SRz4M40hlICdKGEaUfG6IvJgYCCEB5jnCObLFYyK0feCdii+XpbmkpSWoe82/fz9u4GBpFPVit1U9x6BPpkFp02OrD+PLC9a2jD0J2DbygVTbJJBKHbxyv9Qcgr0ux7VXEZ8UHUPROPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jKCYSsP3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jKCYSsP3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d94b222a3aso18973695ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 22:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709274795; x=1709879595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQwQz/QJ5mWY5tSctsi2zwWFgf7B4XFbDdy0fTpAkBg=;
        b=jKCYSsP3ap8d49nbHTMJRQ5r4LDBU1T36JYBGTcOV4QLu/DQozOyQndhR8chciVQsQ
         Ag8H2Bcz6OolkClrhnsYYcXXCmAz3kjpNWKb7zmQ6wJr2fvFiKfAT08CJjfmHkQe0HL0
         ZXuqXkMWzI3w7rkmvD1RJJAIZhGx9NZZD1Rgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709274795; x=1709879595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQwQz/QJ5mWY5tSctsi2zwWFgf7B4XFbDdy0fTpAkBg=;
        b=PYGBVH5NlPfUsI+ItrRlFNnwC3wlfsMWOUZpvNH+WT5GqiGjEaTxxnDx0bkaJXs1Tf
         +HyRRKuGLuhbEs4WJ50AtAC4FL3++pICvBnWNYHdzM7GuWeA9vBNZCv4OwUV+W5JgqGh
         p8YGeoA+qltlJqnHmB/t/JTzsbPJyo2EQ7cxnVGeAxktJxhwXV/8GpUmJ4l6T1WrdpJJ
         pZ7LLU4NuxIzYAkq6FZgSDCuXqitHCxK0Dr9tZYu38pSOF4vWsbI06HmjCZZ+CEueLVY
         P36iqIHv9tvgs7pQlOnbykDs6Bhvx+m11+8iB03t6wtlx73j34QDU/ihzGPWXw9hxgNX
         mLWA==
X-Forwarded-Encrypted: i=1; AJvYcCXiKwChm0cG5zmpSevQGFVQLh6izpaxuE6eDhenQKs+IlgElTaCN6sCjUTB7qEO1UT22N32c8mP5mhloZasYbqReLhSmrhhGANXPHLL5Q==
X-Gm-Message-State: AOJu0Yw8qVvCeaFMFqWeC7U56UcXO2tNx6fBSwiO2ZF6ZZKAUuXfYfwk
	PV0n4wbR7PloLu3NvrdWSt1vXuRtUOpNwBAh61r8pt3hUPrOA0ShN/Mf5Cq7jQ==
X-Google-Smtp-Source: AGHT+IGtxhru9efUicC8Zpnox8H1x+W+BNgnhPRPfG5fxB3Z5iWoADp4ruD8eC+7D+TUCAYpeIHX5A==
X-Received: by 2002:a17:902:c412:b0:1dc:3c3f:c64b with SMTP id k18-20020a170902c41200b001dc3c3fc64bmr1019191plk.24.1709274794801;
        Thu, 29 Feb 2024 22:33:14 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902e74100b001d9ef7f4bfdsm2586276plf.164.2024.02.29.22.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 22:33:14 -0800 (PST)
Date: Thu, 29 Feb 2024 22:33:13 -0800
From: Kees Cook <keescook@chromium.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] objtool: Fix UNWIND_HINT_{SAVE,RESTORE} across basic
 blocks
Message-ID: <202402292232.2D9E913F@keescook>
References: <202402240702.zJFNmahW-lkp@intel.com>
 <202402231632.D90831AE51@keescook>
 <20240227073527.avcm5naavbv3cj5s@treble>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227073527.avcm5naavbv3cj5s@treble>

On Mon, Feb 26, 2024 at 11:35:27PM -0800, Josh Poimboeuf wrote:
> On Fri, Feb 23, 2024 at 04:45:22PM -0800, Kees Cook wrote:
> > Josh, Peter, can you give a clue about what's happened here? For
> > added context, the referenced commit is changing a noreturn function
> > prototype[1], which I know gets some special objtool handling, but it's
> > converting a pointer arg to a u8... I can't imagine what has gone weird
> > here. :P
> 
> I think this convinced GCC to reshuffle some basic blocks, which
> uncovered an objtool bug.  Or, objtool just wasn't smart enough, as the
> warning says ;-)
> 
> This should fix it, absent any more warnings.  Kees, feel free to take
> it in your branch if that helps.

Thanks very much! I'll carry it in my tree.

-Kees

-- 
Kees Cook
