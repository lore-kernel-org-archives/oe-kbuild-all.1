Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B738DFB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 03:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714965734; cv=none; b=PoAUthJck+jUI32DvTg+vQB7G6OpOek3n8Lrwg7wA3BsyEwpH7UJNVVMq0bURzPRbge2fbiUcQK6eVjeF7YFem2Ar05l2b7w4jOijNYfiXFHvIjWXAv00aKMWnOpjywI7ANKpNmG3dKiDzAP8EwcHyA+ElaCLFYkAg+mODLCm0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714965734; c=relaxed/simple;
	bh=jDX8ASW2qvZ6KlbWPKGaSk28mv6B6mlsXMCBys2++Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2SyBnzjZh4rvUaun71ulzknu/nGSbpmTcYSd6AX79rRMLVr0P2hFyjVAZNoYz1ag2ueBg0rFeXXO6sz0nOUEiRzbaTJDxMWyU1PzdORz67F8lpLax01Nnd2UnaSIeMg871UeTzkaXGsDom3ZAGxwps6zVQPavn1l1H3OUk39mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZBg2BBSY; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZBg2BBSY"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2b432be5e80so964800a91.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 05 May 2024 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714965733; x=1715570533; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLj2W08/AlPxLeXkCP61XrllXdJOfYp00hdT7d+0hkI=;
        b=ZBg2BBSYAeIGErdt9d8D59Xcayc7GQ/zlkV15XWxZTV/nvrrobuQBEeVnj0DJ9YtQ5
         IkjLKy7+3Q7+sv16QwDB9LqBSpuWk0buffuSVB58rGOFnrP9R3JNsp5NQrgEM0CSlDCd
         QgRJFHcMx0Z1H9Exa+Z2mv1g39mnIM3EddXVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714965733; x=1715570533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLj2W08/AlPxLeXkCP61XrllXdJOfYp00hdT7d+0hkI=;
        b=C+EzrONaocznMIHXW4/FqSxreHqbCqJ4ZjcRdHj2Op9ROTqGdEl6Sr0RT6ez5z82SL
         YX1eGRPITryiraRfwJjNq0V7Fok45FZVJxhKECN34IsjZTy2rCUM4UKkfSZECZi8RZ2d
         RJ/TjMafI1DWcRhXhZ5XEKTE35P+Z1b5wP1D63O+xetfzMThB6dL25/PaJxwfHhPnp3w
         ll27qtOnJ4PGnPM6Lwa/jp+9HymT5ZsJzAjBbBw7tKNkifE3Z6euCfDnDeJunXelwIBs
         toGX6bzRGRpuh/5Q945MfzH8ekTkAO+VfbfSbpan+QrNcE/zSO+6gir9QWxqlt6dCWhh
         XKQg==
X-Forwarded-Encrypted: i=1; AJvYcCUOmzN2lbEjClmxoN9/K3Fj6U8DtiK6t1uApwdy6PTw4OqeBomsNqCeQSsOXXTSJv2JlnUsyAA0zd5WKDGpOINZtGtecP9TA/iypwmOCA==
X-Gm-Message-State: AOJu0Yy/eyiL7k8s5kuwzV7RCss8yugr3/kL+QU/GCe0CFj5CC/G4wpa
	gSpoUm+g3RU1iY2FuLMc2cNA7uqSshGv6eFW3ljjC6kOTlNj8djaqIKsgWdHZQ==
X-Google-Smtp-Source: AGHT+IHdGPyGQrnvWR5Admmi4idMQxhyP5nB96L+iNkf96/MgdQqtZ5qsVJTxOQ1cKRQu2U3zrqpXw==
X-Received: by 2002:a17:903:8d0:b0:1eb:7ba:a4c3 with SMTP id lk16-20020a17090308d000b001eb07baa4c3mr16253443plb.48.1714965732789;
        Sun, 05 May 2024 20:22:12 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8263:3b89:bcee:2ed4])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902d4c700b001e249903b0fsm7134459plg.256.2024.05.05.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 20:22:12 -0700 (PDT)
Date: Mon, 6 May 2024 12:22:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Minchan Kim <minchan@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240506032207.GD8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
 <20240505051305.GB8623@google.com>
 <20240505064832.GC8623@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505064832.GC8623@google.com>

On (24/05/05 15:48), Sergey Senozhatsky wrote:
> On (24/05/05 14:13), Sergey Senozhatsky wrote:
> > On (24/05/05 13:39), Sergey Senozhatsky wrote:
> > [..]
> > > > I guess just pick one if none were selected.
> > 
> > How do I pick one if none were selected? Does Kconfig support
> > something like that?
> 
> This triggers Kconfig error:
> 
> config ZRAM_EMPTY_BACKENDS_FIXUP
>        bool
>        depends on ZRAM && !ZRAM_BACKEND_LZO && !ZRAM_BACKEND_LZ4 && \
>                !ZRAM_BACKEND_LZ4HC && !ZRAM_BACKEND_ZSTD && \
>                !ZRAM_BACKEND_DEFLATE
>        select ZRAM_BACKEND_LZO
> 
> 
> drivers/block/zram/Kconfig:17:error: recursive dependency detected!
> drivers/block/zram/Kconfig:17:  symbol ZRAM_BACKEND_LZO is selected by ZRAM_EMPTY_BACKENDS_FIXUP
> drivers/block/zram/Kconfig:52:  symbol ZRAM_EMPTY_BACKENDS_FIXUP depends on ZRAM_BACKEND_LZO
> 
> 
> I'm a little surprised by this - EMPTY_BACKENDS_FIXUP does not depend
> on ZRAM_BACKEND_LZO, it depends on NOT ZRAM_BACKEND_LZO.
> 
> Let me Cc linux-kbuild. Kbuild folks, how do I workaround this?

Is this how one does it?

config ZRAM_BACKEND_LZO
       bool "lzo and lzo-rle compression support"
       depends on ZRAM
       default y if !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
               !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
       default n
       select LZO_COMPRESS
       select LZO_DECOMPRESS


User still can select N and then we'll have empty backends, but
at least default is Y if none of the algorithms were selected.
Is it good enough?
