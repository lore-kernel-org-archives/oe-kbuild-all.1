Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6922157B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746871911; cv=none; b=KBr2HPIho9yJ+Aqy9jh46T/gfbDC/nIkJ2c7EU2WKBMpEpkSQSKAqj3j8N0s8VZkf5Pu7M01a3v9lD05Nkzd1q706WkyjZAwElMdWy5Q26+NfPXmYbb01QvifODx4FyOduRo+mkj/DWrsrYoMger4fSaqn1VrwWxoodMe2vjsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746871911; c=relaxed/simple;
	bh=TAdkEWmft0UsuHt29v3Eue/35LhyOeiZPHuU7JfGkcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCR3/ovuRMAcg6X4WfkBHJHOZEW0gNs8SQswN9nKIQGk/SWwS0RMCaOO/CnYaCYZdATeHEKz5523tl0ZxejzSdmlmklZgu2Ze1gAjE8hI6Igw1bRMJBWgL69UAie+nniT3N8WEovQvCfF1c/z0y5Z5tuI5HGoZ8Haev1vzDNwbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RO/4TSfF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RO/4TSfF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so828951f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746871907; x=1747476707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEGLI17Sg6m1LZBmMFTStRe876DURecVpE92sDlyUxQ=;
        b=RO/4TSfFdKZZ057GnrHqO0FvhZjhy288FThmd27fQHc6U6Hbc4dfL8ffb+i+Anchfp
         HGff2YXSELvWe0ZQAYJSuf0FIFICT7GwK+sS5M19ijbB0/6pwcj05qSI3rTcArOKVs0A
         jSHrUL1fsDX1oqIvl2qIf9a6TpJmzxqJCYwoPRpJwjxpWRV/R/pg2AwE0OTB0yabjlSH
         sLULbvMIV1o8m1VYmYzeXkG16FDj0dmH4GO0ngfAHoOsBDpsMY8FfAGQNZ646Q55JMO+
         vDv+AcwpBr1tyjMIUQBqTcqKXXfQ99ecifLywTjoBuDCrKkY5zF6CT1Xn2QyqgcMSNdd
         uzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746871907; x=1747476707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEGLI17Sg6m1LZBmMFTStRe876DURecVpE92sDlyUxQ=;
        b=RbdqEeaFGIoJ7lxzX3IMF9C9LoHGw9oLePqf17B9fdr7wdPs4OHrLQb5OlpiCoCket
         YFz8u0ryJmlMk+tXQvapOJ4oUmmoSV896zZDJrVAsF18GOBU2JpCbr1oXDw9QRunHwLa
         md6FIgnjvdwVUAS54It65I8M5KeafucdmtIJYCJQaeUHXhaxurGc2XbAwc/1zlEd1tR/
         PPbaGtyen1/KuDiU0hSsEcTPB3KrXXHWa+mzLE3RRUwybEM1ZWWvoBjsA6RUYXW/qkKu
         124s00j8SIvqXy24d/oHxJ2XKHPxBp1GQW6Qec2ILacaraBSLDYHohUzVzkyc8we5xxH
         O6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAnHwOf5WgGMBy5UiY68IOungugp4H74hFRm7DwNJKj9Ffs2tQRJyNgGKC+zZ2Dx+3ndzfCkTaRyoaOcCJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzPhUCBGQPzbVdILkJ2SzDCvZL6wiWpvo1CDimR/CrfBuqXw8e5
	EOrKK50+ML32w/wEpM36tGGAk5OC5eW0mxN6aKdV1aO9mdpQSUapvw0jnXm+dkk=
X-Gm-Gg: ASbGncufUNaloANycQAYIFMJSCQdNWIJJTXN/kd+BSvszfBkIq2QV+J+mBN1vkH2tfs
	JzUQTpspHS9F9Q1kMiwPQV9Yrz/FDXJTXJGQgt5m5JpIgZTbebhS5E0YR5Ldwl+31j6FiAu8Sfh
	r5HyQg/sboAQFfMmrJ8hcfUq7ftOcGRfFKemz6MV3CjMbO61q/RvvKSL4JwofoROimPLkNouXaV
	mcuYFXsNm8XItrQF/LZfQGRm8nhIpkGuMKXJYv5HZmlMVe8ox1qdOkse7TFJuMfL53jxgJ9Eix4
	syuceb4hRGsf7fLGbg/1QbzhpsK/HOPLnOUTReT9SCt9Db0o3JgwFLUu
X-Google-Smtp-Source: AGHT+IFPRV3WrM4qUPjKyQq2cTWDQTQifuNlkOsms5GePA9Os7cAR7/IKQemogvl9WbUSLD3uLc2Xg==
X-Received: by 2002:a05:6000:2506:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-3a1f64386eemr5180967f8f.16.1746871907101;
        Sat, 10 May 2025 03:11:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d780ffb7sm31422365e9.1.2025.05.10.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:11:46 -0700 (PDT)
Date: Sat, 10 May 2025 13:11:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:x86/boot 10/10]
 arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we
 previously assumed 'boot_ghcb' could be null (see line 101)
Message-ID: <aB8mXZ_TxDuLa7Jr@stanley.mountain>
References: <202505100719.9pE7wDfB-lkp@intel.com>
 <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>

On Sat, May 10, 2025 at 09:57:23AM +0200, Ard Biesheuvel wrote:
> Hi Dan,
> 
> On Sat, 10 May 2025 at 09:43, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi Ard,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
> > head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
> > commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
> > config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/
> >
> > smatch warnings:
> > arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)
> >
> > vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c
> >
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   98   struct es_em_ctxt ctxt;
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   99   enum es_result result;
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  100
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101   if (!boot_ghcb && !early_setup_ghcb())
> >                                                     ^^^^^^^^^^
> > Check for NULL.  Should the && be ||?
> >
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  102           sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  103
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104   vc_ghcb_invalidate(boot_ghcb);
> >                                                                    ^^^^^^^^^
> > Unchecked dereference.
> >
> 
> On success, early_setup_ghcb() will assign boot_ghcb, and so it is
> only called if it was unset.
> 
> The logic is a bit clunky here: for clarity, it could be rewritten as
> 
> if (!boot_ghcb) {
>   early_setup_ghcb();
>   if (!boot_ghcb)
>     sev_es_terminate(...);
> }

Ah.  Thanks.  I didn't even think that early_setup_ghcb() might
set boot_ghcb().

regards,
dan carpenter
