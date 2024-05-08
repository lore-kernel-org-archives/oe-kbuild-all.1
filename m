Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2571DDB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715187218; cv=none; b=W7pvWm+REe3bAFXKJcJHHkeStcCwkwhsiyB7p9eEZ0hTowu4y5ytvr8d/O0Iv63oyAUFv628kSU9P0uG+Ef44NhVyqxAnM6pPRbGcqJvImkZFoJBaUjSxV+pPf/ZKuqC2eyRg2Qp1rILBbpOuAqn/CNxvIt+UCPnXH8Lco8Df/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715187218; c=relaxed/simple;
	bh=ZRyAR2mBMNqdi9nPsWt11Yl2kx65ROj3Il3Aorbo+gE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOslPL/Wb5sdO13aSenQpv4Et0n5E7ti94k0Gb5fA9sDuSY74BfvuRPYVy4dCDEhzG069Asl0w9fDJzrfQsYsRan7GH01sf1wtNvwgtliEo/qrK2+LT5ysjLhbqi2ulPix03q3Mma8Qj3IySO8+ZdcGejxTJzJ5m5C20dcVmxHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YGgTNpVG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YGgTNpVG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ed96772f92so33920275ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 May 2024 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715187215; x=1715792015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pkrtW/maB8r6WHs69e6l7rrcyayXYpss1wCPpNutgY=;
        b=YGgTNpVGwj+OJxqy+ZBjRrdvhDdvBGA93WOVgvUnaCO/rokJtEAwgDoxAKco78HXtZ
         75ootcNG57scno2oaviKlrR3+cg5eATuf77jthze39YZAFjnr/cvO9c3ZZWdwffVn5le
         rrZjBF2eZeNRPL4wj9njg+OU+tmcu4pypMqME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715187215; x=1715792015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pkrtW/maB8r6WHs69e6l7rrcyayXYpss1wCPpNutgY=;
        b=XYuQo2ZaKPPfzAfRxVgoQ4untoskhAmCbEL9lzV2E8oCyAogNxt4Xx2VvG9JFeu/b5
         4435gIeVfBKrWB4tBpTxkxaUoP/5dQGnXI8jiAstaxyFMAjZPMgoXfyGMa6iNdG9aTq5
         kZoQuR/zZzjYMCUqBBzon/eHHTPifC+00OFbTK110wq9JV7Rr+Si3XtZGnSOktXJEwZm
         sdtmn2o3a9Y3XGMLE9J22+qlt1wWjKMAekGLFgtInEOlJqP5HmM74AhYvKnzyxIZdpnN
         q9EWkxYogvrkHsa3s0QggExKzwIAHtLtMUkKAklaNeKJ1tBsbT31kjRMKKz2B2ZzfMjH
         acGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRzQuDYA3J8w1ljgkjfrAc5o0Ogl3gsAKceUZHZi89vUl7h7EdjcWgh/YREswBCDiqGyHpht/QEeIaucsvDCHyGRGehHOz1sJyuspCPw==
X-Gm-Message-State: AOJu0Yxlgz2Hov3mDRPAxXLC6hhMdwADe48xmyL2iGx7xtAZxazewBO0
	URfPSYgztRMCpumrJgUJDHDsLEKoyXpaug7PcivcSRqR/QVztcpY7Dr+XqcvEA==
X-Google-Smtp-Source: AGHT+IHvGJnFyMfNwSbDGLiCuhHhmZ9YT2/hUUVyZWRhVPeHnis9Jk0r16sKMqRVQN2ZqvFdS2lcBQ==
X-Received: by 2002:a17:902:f712:b0:1eb:51a4:3685 with SMTP id d9443c01a7336-1eeb05a1792mr41909655ad.52.1715187215161;
        Wed, 08 May 2024 09:53:35 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n8-20020a170903110800b001e22860c32asm12065479plh.143.2024.05.08.09.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:53:34 -0700 (PDT)
Date: Wed, 8 May 2024 09:53:34 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Allen Pais <apais@linux.microsoft.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vijay Nag <nagvijay@microsoft.com>
Subject: Re: [linux-next:master 11772/12060] fs/coredump.c:67:27: warning:
 unused variable 'core_file_note_size_min'
Message-ID: <202405080953.5E9B78A9CA@keescook>
References: <202405081838.tuETPvPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405081838.tuETPvPf-lkp@intel.com>

On Wed, May 08, 2024 at 06:30:25PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e7b4ef8fffaca247809337bb78daceb406659f2d
> commit: 13513eafc3ea08cdb70aebe56a7e43083302a809 [11772/12060] fs/coredump: Enable dynamic configuration of max file note size
> config: i386-buildonly-randconfig-005-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081838.tuETPvPf-lkp@intel.com/config)
> compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081838.tuETPvPf-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405081838.tuETPvPf-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/coredump.c:67:27: warning: unused variable 'core_file_note_size_min' [-Wunused-const-variable]
>       67 | static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~
>    fs/coredump.c:68:27: warning: unused variable 'core_file_note_size_max' [-Wunused-const-variable]
>       68 | static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~
>    2 warnings generated.

Thanks. I folded in a fix to move these under CONFIG_SYSCTL.

-Kees

-- 
Kees Cook
