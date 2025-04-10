Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB0D26FA55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279078; cv=none; b=njsJH0toaUsCAtRgddp4EBnx2F53FfChZxYKrMYmjYdPVYgY0A9428jN9FSbyxi87Ak+9+A/LYLEtrAlGza+0RCWhGa5eetN+cSyWVN6TeLTHbqA6jCIPW2e9p0FJrG1EBfvEYMYrMXoWCiA86CDEGfuLM/4E3I7/p0305c9VxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279078; c=relaxed/simple;
	bh=CW5g3wYp9KL1gVQvH/LT0BdadUWQJrj72wibka1rya4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjeOZNI0CSKyZX0+U2hc4QbVuuL0RFnKFrNy1BU+d8FmDsYzZbE2dIDsNPqAMC/Q5gJmoH+u5nP7FnFXr15KZ1Jf1TorWUi9cgbXq5u2bjAOGeKpyA+x/Dur9KgI1/xZcfYFLcBpNu98YrQmncYVuMGRqHVt4qXGhtPLd66Y0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=do31m8n7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="do31m8n7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a823036so6327445e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744279075; x=1744883875; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8W+GulkDGBime4ZK9OwOUCjZYgRnq/dZvJvvvfuncM=;
        b=do31m8n7M2pMEvgX4PrUMY/0o9TijlZudRtRS9wFKAgt9NEj3D36a7GAHRrCMzYd4Q
         IBnOjw2FdIYOvqihLaHW5TcLSF1xWhCaR8pXpumgUR7+XPzih+LFt/9Wts7Kt9T5uNCG
         eSPzjQj5RhZUIWk3j7awfwP2nCtAAPM9FNqEpowyNemnfyHqbQlgJdinKxKjjYsG6KcR
         fYMEAbdtOkKblI6Wg1h5OqkZdiOtTI4l5yraMudNzF9iEmv7OzFWuUpWqpy9/rjPBNGD
         7SS8tSKFmdegq2g1EEKnkuZuXVF/Jthlp4U867kreGIHbWcl2xpP5awAzx4OZcOMsobs
         oTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279075; x=1744883875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8W+GulkDGBime4ZK9OwOUCjZYgRnq/dZvJvvvfuncM=;
        b=D1e3/+BGc7YL67m95lML0AclSXoWPxwhPlobtx2fMgxhUA22WoC1oy1HVN78CYLUxO
         Uxc+EfpKjsRP5azztTc/SwG+LANPbdBZKYWfzUD/nPgGWEH4BBRxw0NibDGVm4R/LD6x
         LzCaDJdknNqJYWQAibIAltnzvkZrzuhmkNy2uQa1xSkR2HeMwMSkzawkFekqx1GFK1C4
         IEyEbi5UYhCYKfTTueh9FifkABYlaFDHRc/cmwoX6MgQviwvqw+iN8tru8aaq6HVW/tc
         xADX6aowXRAYmaVuyr8x6Sl4WZ4aeSFrqQx0O7bm7sZQrkCKzNXNYvvzh/Eel4CeQQ8S
         UyyA==
X-Forwarded-Encrypted: i=1; AJvYcCVv8E80PZmV37AbP+TdT8QYR3TlGJEhM8m+U+pJl7pni+/G/27hsaYmT0r7ebBy3+bogksmom+vKbdJH0ua@lists.linux.dev
X-Gm-Message-State: AOJu0YyOu4NUNc+GsNWPK0cKrwLkhTn/HOPkeeVUTJlfovQATyUnUHLi
	oQ8pN/Eq+Eqc63+HLOWaRSI1fe1GzHwadq7FkLhHjts9oOaR68w6v6EhFZwybhEx26pT47mpamC
	A
X-Gm-Gg: ASbGncuT7hH9eoeulUdtcoCFU5FSi4FoVvpmKi3YPXuv2j0l6XWl3I3hPg0VDVwsjYX
	J/zvZ/0BZtFY6c129avpOroiyHEzegKhdM99ZqcCDP6obnlykAjdUPjWVeB6sDsCOsdylu1s3d4
	MmhQzzCWqrK2vq2veMmm9/kge3Xnc5dXAFjHX9pkABm3SKVih21x/Aha3YY0pTX93A2pDrns10/
	LEmyyLlmLH5ahlEN3+muB3EbNK5Pd60dEIGkw2MGk+R6Wj39CZQVLrmuPkc9UM/IxnXBrI+p6tl
	LqnDe8tsq309JWf0V89OpRFnG1DzGl1iUQtzb2qje1HrI92mIodxqfJ/
X-Google-Smtp-Source: AGHT+IEI7OSG+hIdjY4nTYGxTWexSVcR9vMqNh2S58M8qMW4Ld4ib5ru6erbmUkRfTs1cPbuiU/iwA==
X-Received: by 2002:a05:600c:1d94:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43f2d7b88edmr23069305e9.14.1744279074833;
        Thu, 10 Apr 2025 02:57:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2338d7d8sm47906135e9.4.2025.04.10.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:57:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:57:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Melissa Wen <mwen@igalia.com>
Subject: Re: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations()
 error: uninitialized symbol 'ret'.
Message-ID: <6ddfc908-22a0-4ed6-b5a4-6df9be85ff4e@stanley.mountain>
References: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
 <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
 <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>

On Thu, Apr 10, 2025 at 11:27:43AM +0200, Christian König wrote:
> Hi Maira,
> 
> Am 09.04.25 um 21:49 schrieb Maíra Canal:
> > + König
> >
> > Hi Dan,
> >
> > On 02/04/25 05:43, Dan Carpenter wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> >> head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
> >> commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
> >> date:   2 months ago
> >> config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
> >> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> | Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> >>
> >> smatch warnings:
> >> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
> >>
> >> vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c
> >>
> >> cdec4d3613230f Eric Anholt 2017-04-12  589  static int
> >> 04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> >> 04630796c437a9 Maíra Canal 2024-12-20  591               struct drm_exec *exec_ctx)
> >> cdec4d3613230f Eric Anholt 2017-04-12  592  {
> >> 04630796c437a9 Maíra Canal 2024-12-20  593      int ret;
> >> cdec4d3613230f Eric Anholt 2017-04-12  594
> >> cdec4d3613230f Eric Anholt 2017-04-12  595      /* Reserve space for our shared (read-only) fence references,
> >> cdec4d3613230f Eric Anholt 2017-04-12  596       * before we commit the CL to the hardware.
> >> cdec4d3613230f Eric Anholt 2017-04-12  597       */
> >> 04630796c437a9 Maíra Canal 2024-12-20  598      drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> >> 04630796c437a9 Maíra Canal 2024-12-20  599      drm_exec_until_all_locked(exec_ctx) {
> >> 04630796c437a9 Maíra Canal 2024-12-20  600          ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> >> 04630796c437a9 Maíra Canal 2024-12-20  601                           exec->bo_count, 1);
> >>
> >> This is a false positive in Smatch.  I can silence the warning on my
> >> end easily enough to say that we always enter the drm_exec_until_all_locked()
> >> loop.  But the question is why do we only test the last "ret" instead of
> >> testing all of them?
> >
> > AFAIU `drm_exec_until_all_locked` will loop until all GEM objects are
> > locked and no more contention exists. As we have a single operation
> > inside the loop, we don't need to check "ret" for every iteration.
> >
> > I believe Christian will possibly give you a more precise answer as he
> > designed the API.
> 
> Yeah that explanation is absolutely correct.
> 
> The drm_exec_until_all_locked() helper loops until all contention is resolved and all buffer locked.
> 
> You could avoid the snatch warning if you move the error handling into the loop, e.g. something like this here:
> 
> drm_exec_until_all_locked(exec_ctx) {
>     ret = drm_exec_prepare_array(exec_ctx, exec->bo, exec->bo_count, 1);
>     drm_exec_continue_on_contention(exec_ctx);
>     if (ret) {
>         drm_exec_fini(exec_ctx);
>         return ret;
>     }
> }
> 

Don't worry about silencing it.  I already silenced it in Smatch a couple
days ago.

regards,
dan carpenter

