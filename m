Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7132D168A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714206094; cv=none; b=bje9TwDFTh/IgbbNMAky3JoO2O5JNDFvfDVM5nBjgbdSO4Zq7bq/QdN2aCST2BHmOiKHsbTtD0FKDxgvd0mahWdoqsjXEN0UhuRj+raMR/a/UK+qHM8nExLIYq0XEwxTQH7JjPOkRM1MlxERKK6ruaDNNfrisAShCCR+BiIg6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714206094; c=relaxed/simple;
	bh=Ej9iEcTeQmONNGUTtMUCi2YDLUx9RZ7O8vx1TcL+y1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aL3KC/lJFwPLK9lUnb38HJT+gX289Pjf1bcDMkQ0rSnOviBHwdnZYMAOkb3Sdcsw70GQEejoHXfqW6vae/kPgSRlmvJB6JahsKUEm2DiEn78E1TzP6WQsgNeufkmScuCv7t8sgk/FZW4bhaVOre2pFDoZDB2pJ82UfzubqqSEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HlCxjDsX; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HlCxjDsX"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-de596c078c2so2576486276.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714206091; x=1714810891; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Loyri7BNKemKJvKnQBmqOrR6kXCmKWbyQbDcLqDVreY=;
        b=HlCxjDsXjn7kKMCWhJOBwV9dpGd32NcV3c758KJ/8fIAyvop7AeVFizH+trsY+9hLq
         G6ZwZBnB7U1YW65lgESaf4ay2U5xd3+Hvo3FVuT7nXNgcGOVEAjzXAwusE6rJdH6ItCK
         lT2qzVgxpKZUiWVk7hr+k0BG/Y2zMDXckzfriBsMR4mpMKmOXJAMnwMIO82H3Z9COJsT
         K1iGnSwyLbrfz2QqAqY+/zcL2AHb7IJ0Obib4Ldell5DuwJa7KO6brnpMA8edXwPn5nY
         jnMf74JyZfZEMrAeIR2+YCAfeNsywKBazWmDPXDlEFbKK1JiT18kbRDIlMV1fyO8qfZ3
         5LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714206091; x=1714810891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Loyri7BNKemKJvKnQBmqOrR6kXCmKWbyQbDcLqDVreY=;
        b=REucx546SZMU3wq5vngJCthVUOqwmy1+s7qOmsWy30NrPZQCXgXcXXH9KvAmNuPeun
         3bDNz1wH5meUEao9zViEVqaQORZUKpbWVoNszQFUma5EX8rolahkIhzL0eFj83qoLsJz
         BGQrN5lkMHHNRhqDNAv0P1BDL5AWXinIFibdcKN3cwFe2jaQN6M5d5RYdGC494jrOqH+
         lfCPHqZdX5bfR0Tk/UXPPuS9M/HeegOwOzUDtYjNy1xjj7e9XzkhTKTohX0V2L7zmyVC
         A+SJFtStUbnTeKVYl2HVyLIwoQ+mYOUDNdb7CDhvVAT8llhY1ntIW5Rmf7bq4VhUpY0C
         RA8w==
X-Gm-Message-State: AOJu0YxqoAVmbH1VoYvFWBb7dbdMb2/pYGK6S2+6mqnzyVDR+F1yP9I0
	Rm6IPm8n4ufKgn1JAlEkENUAWAjyT06tHJoM8K+8hIrNwgKP/hUoe/Lup9vRuYN/YbiAXansFVW
	MIqHrYk8EGp8i4ir373PVY3a3JlxutDSBptTN5g==
X-Google-Smtp-Source: AGHT+IEn3Ad/ZJHcs2toHD7qGUMCVU/CiYInlTR5yJQDnIsDt7VZa07LmAzWNkSAfs0Qmk/q6FvzgnJYlcv5baycPvY=
X-Received: by 2002:a25:aa11:0:b0:de5:526d:c9c9 with SMTP id
 s17-20020a25aa11000000b00de5526dc9c9mr4792443ybi.61.1714206091431; Sat, 27
 Apr 2024 01:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404270534.8VgyE2XE-lkp@intel.com> <20240427004819.GA24436@rigel>
In-Reply-To: <20240427004819.GA24436@rigel>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Sat, 27 Apr 2024 10:21:20 +0200
Message-ID: <CACMJSetLpWn5H+Dk9kip5oVu5gG8fKB=PPHDRz901-JeUV1LcQ@mail.gmail.com>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 ip_md_tunnel_xmit+0x9e (section: .text) -> .LBB102 (section: .init.text)
To: Kent Gibson <warthog618@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Apr 2024 at 02:48, Kent Gibson <warthog618@gmail.com> wrote:
>
> On Sat, Apr 27, 2024 at 05:29:42AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3022bf37da50ce0ee3ba443ec5f86fa8c28aacd0
> > commit: 83092341e15d0dfee1caa8dc502f66c815ccd78a gpio: cdev: fix missed label sanitizing in debounce_setup()
> > date:   3 weeks ago
> > config: riscv-randconfig-r021-20230409 (https://download.01.org/0day-ci/archive/20240427/202404270534.8VgyE2XE-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404270534.8VgyE2XE-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404270534.8VgyE2XE-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
>
> Bart,
>
> does this make any sense to you, cos I'm not seeing any connection
> between that commit and these warnings?
>
> Cheers,
> Kent.
>

I think this is a false positive.

Bart
