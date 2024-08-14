Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940D1B9B51
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723654389; cv=none; b=SA4nllQqvDYNs46/aE84BgZAB1CFbh2NKZxQEHc7D5KIAr95Pfd/2AJDrfqf17S3OSliXaa+vqPenA6RtEY4ymTFwfXUlo5jw7YC8R2sY9FAoBEr35rvfKv0oss7oT9AxJN5xL78wfjw5i4BsGd1mRRV3skityy0BGmTxX4Jies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723654389; c=relaxed/simple;
	bh=GT7CKvMczimC87FBJLISQL8kxlblQiRP+geGM33K0m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pup9NBQOnZWTjSkeq4ynMwBBX+CHQTUKWSNntdPd+tJivlhgRggJyUEE7QCJS2IlIiifFk9AXW3F0CVuw6VxxeSGsAhm5/LGLU5jYyPFOIrRSTnhMNZlZtcphv2+TTKrhdoqgfyEUUqjO/5d7u8xCkdFUcdRtS8m09lyG6m1URI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQhN3rA5; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQhN3rA5"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-710ffaf921fso13511b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723654387; x=1724259187; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BwwO5wVW1prWGaQkBuXOVaSfD3RuMaDWY0MKew4Ns6E=;
        b=iQhN3rA5p2JagzKc6+Kf9TbP5DKEKmqUSRKFva8qjySpm6IsCFBS4okWQZc1ax7hOJ
         R6ObqK2NP81Maz2e4JYas+OT8UrgkPUV+7ShkXO3/hoPXa6M0w90OCZCGQ735YLAVEjI
         PYaZxnYTqmbXqVZKOx2cFbR7wak3702KPKrB3jLvZ1Ux+ePtPiumf5LhqizxW3SMFSYZ
         quP82XzVUgLSTrUCnVPPWdc4OmNiAUJCeQmieJ9+zN6lnLLgXJTM36NqO6qVi61TCOq8
         rD5N6wYYdPyH9Hu2IO5NR8dAlK7pXkWE/JSJEFv90w+TjkajZly9QdsjGr5edupC499j
         iEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723654387; x=1724259187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwwO5wVW1prWGaQkBuXOVaSfD3RuMaDWY0MKew4Ns6E=;
        b=RC4OZ/IN3UCmuLKDu8bgwtZmKZkd8uduFtFcX9jPEVsHB63tplZQ31HKqKg7qlYeGH
         FzVi5MYK6ZpF0/tNlfMkRkRSWLdI7qtxgvr3n1vZuy9dnmHndL2mqf62Qu3TCKW9XOMf
         vOAw8vMmhstL+r9iXltNW6fdhBTbfksEJU+cSmw8uyk2iTJiZqxlLg7lfn6nDKMu0EPO
         y/ca5gkW2xbX2SiAZlVZX7wclvd3Hrvsx5sz1KWdwpfwbYAtRjUp41E6X+MZ7CUzwUyD
         QWE19dmdIIjHn8gQyq8DTyusxyky5DSy7eojauQW308zHNt9cFPeHoOPxJD/E3zl4azM
         izDg==
X-Forwarded-Encrypted: i=1; AJvYcCX50upuiH7kWBG7yOuTY8nFVrjvYsjaX1wf2/vPXi+hObHyLUa8QWbPidEZV2UiQLL+lcDmpZfSJQbHpYNjxp/8NhRrjQyuPCj96HewEA==
X-Gm-Message-State: AOJu0YyytllDqYSOikcBSmfT0F0HCJQyNnt8yHGcNW6TnTlOW4sVlDkM
	WXx0hl19mo7TvTIyJ4KCwQgIINIHkc+h4U8Nqc8w6VM0EQgAPRI3CbFkjf36
X-Google-Smtp-Source: AGHT+IHmxEpbEQ/93LkX5r5SnT/1IryLya5f4uLO9hw8U1CmUX5OKAYC+a6oGI0yGdIREiHgnre9Pw==
X-Received: by 2002:aa7:888b:0:b0:704:151d:dcce with SMTP id d2e1a72fcca58-71276ef3201mr335463b3a.5.1723654387308;
        Wed, 14 Aug 2024 09:53:07 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e58a0b52sm7548899b3a.55.2024.08.14.09.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 09:53:06 -0700 (PDT)
Date: Wed, 14 Aug 2024 09:53:04 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Brian Norris <briannorris@chromium.org>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 bitmap_gather+0x68 (section: .text) -> sg_mask (section: .init.rodata)
Message-ID: <Zrzg8Mc9OcFx699j@yury-ThinkPad>
References: <202406200829.IytwLyQJ-lkp@intel.com>
 <ZrzcAnHNXDF2Ck6K@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrzcAnHNXDF2Ck6K@smile.fi.intel.com>

On Wed, Aug 14, 2024 at 07:32:02PM +0300, Andy Shevchenko wrote:
> +Cc: Clang and bitmap people.
> 
> On Thu, Jun 20, 2024 at 08:54:29AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   e5b3efbe1ab1793bb49ae07d56d0973267e65112
> > commit: de5f84338970815b9fdd3497a975fb572d11e0b5 lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers
> > date:   3 months ago
> > config: um-randconfig-r123-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200829.IytwLyQJ-lkp@intel.com/config)
> > compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200829.IytwLyQJ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406200829.IytwLyQJ-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> > >> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_gather+0x68 (section: .text) -> sg_mask (section: .init.rodata)
> > WARNING: modpost: vmlinux: section mismatch in reference: bitmap_gather+0x10b (section: .text) -> sg_mask (section: .init.rodata)
> > >> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_scatter+0x68 (section: .text) -> sg_mask (section: .init.rodata)
> > WARNING: modpost: vmlinux: section mismatch in reference: bitmap_scatter+0x119 (section: .text) -> sg_mask (section: .init.rodata)
> 
> I have no other idea that this is a (yet another) clang compiler bug related to
> the constant data.

Hi Andy!

+ Brian Norris <briannorris@chromium.org>

I've been reported with a very similar warning from Clang 18, and the
fix is already in bitmap-for-next:

https://lore.kernel.org/lkml/Zq4uvqU3yg7bJ1Lk@yury-ThinkPad/T/#ma7a4c476f97fec16e228018b36137fdc0b2ffa4a

Compilers may not understand that small_const_nbits() is a
compile-time only condition.  This is especially true if
an instrumentation like GCOV is enabled.

Check this comment from Nathan for more details:

https://lore.kernel.org/lkml/ZoxCMp_ZQ-Su-r0D@google.com/T/#ma36706e8f5f06451dd0f490fc3b3ccbac15067f4

Thanks,
Yury
