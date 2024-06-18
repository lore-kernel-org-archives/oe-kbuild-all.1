Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA0153BF8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 23:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718752792; cv=none; b=PtFogYvFEXtRGeyZDg/QzAtHuuABcsAkcPNBFORHwVDRsOXBeXhsI8iRv79E6Kkxkt/kV2bfXNeE+4W1Okml93Xj7+lmkzy50KPnkmBFk8LmotyRHLZoED10WUAbZJSs33Q3MaKwYJXDfE5AOF7RpiGgh+YpQSh94EQrd4ZvXmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718752792; c=relaxed/simple;
	bh=jRbM95jfpOwuaJSZ6zapVf12ZwahESC/BSNU+/AJPPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D9CdyQzSq22h/dK+p5ioI9YS+F3uxds8E/fwj7VYBPw7ei4akaX8meuFkuKzder2kNVRZ67Ghgv/wvNLkrg/ol6IdPYM2k8ekvoKlkBunhoVz9ICTQjf2IKX+WT45eaDYo3PdajjtXGLtsv8csESOayio3O1+FE+OK635Kz46sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pp9MrAEJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pp9MrAEJ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1f6810e43e0so2384635ad.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 16:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718752790; x=1719357590; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/817AErV5RHGHALrV4PiucygGj2MnKUpiGCv3RHz83w=;
        b=Pp9MrAEJVa9qaxmIeydiEmjWetR8ziSJYyE6UEYBkBSahA9WKo+u4CnoGxT3eJ8R7x
         3Kk1m0voYMLmWGm/1aWRQ49Lpuk4OzwM5I9gaHW0L445NGsSjz0vCrgpRHarf09IrCZ9
         ZuuNeeBiauWnxvPAiCLYbg4bNJ6Weriwwdw1VPp/TENKnJDk+6aQRh0tFG/b/T+GfQNg
         esIDOFRzyJv38SJ0Ql2RVBayWhqzzhXUtWQJrcvkIR7pDmeOhQiDzWHCM75ARHpivHAZ
         zOnySUn8OcxDllzkYLz1XnPEas0/E/zqk9f2SozEo7G5rBAkc8OmZX3CX/BhkYzAQ1pD
         JbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718752790; x=1719357590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/817AErV5RHGHALrV4PiucygGj2MnKUpiGCv3RHz83w=;
        b=hrpQ9nd+rC8LNe+SWbJdLV3y7K7fTTneGg+lu3PcZ5rAYCEeMzVD8blYtcvYFR0Tqn
         qugnWuKGuaBFLp+iOnN07tyjey3RBdLH5vH7MdPbCeU21KiGZalsFVlRIwyS5zYkvSPF
         FeUYRRD0oJtf4ItMungaCnZwIdAwix6qYMgF5pioWSvv7+ZIex/NMg2z/kUQYxebjWef
         t01KWWI7aO2KreorGGW0Umil3wWxCMjd2eBZuUsNgAyRI4oGzS2wk+vqwphRWd2yoyk7
         i4vYvOmaEJxo+A9ucnzN1PLcOzY3OBraPoOo1UG9xb+wkr6nxGBtyJlVIctjp/qxJ3mF
         K5zg==
X-Forwarded-Encrypted: i=1; AJvYcCXZCfGpWP6N/KcVWRfr5mumxVgu7Xv2r6KJZNsrSNjMrV2vgDcwX5JbFu28zVRUmVksxtQKxUaIjqMeTLRQgdi48Las06NCvH9x2VkGBg==
X-Gm-Message-State: AOJu0Yx7N47JR/MFJVv//z04UV3isIWXMgtDuz4zlTn86nG3GNVaS+ZO
	V0CUNooCfK5sFyVzBg2dVqEXQ+C3w/xReQSgjdsaVUCbhycDgKjXkPL10+bxkE1wr5xG/FLFKqY
	SNA==
X-Google-Smtp-Source: AGHT+IGzClFmSTJcFUIBNsjpYLZdAvEQWkl7PL3o8ZDCHfzvI0LMduG3qLVX4qiXtcMULKDUIkK2TvTPAlo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d50e:b0:1f8:66fb:1683 with SMTP id
 d9443c01a7336-1f9a993310fmr858855ad.3.1718752790360; Tue, 18 Jun 2024
 16:19:50 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:19:48 -0700
In-Reply-To: <20240618200539.GHZnHok3nr60R4BXSK@fat_crate.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202406141648.jO9qNGLa-lkp@intel.com> <20240614152228.GAZmxgNPmozj7UzRdV@fat_crate.local>
 <20240618104234.GF31592@noisy.programming.kicks-ass.net> <20240618104700.GT12673@noisy.programming.kicks-ass.net>
 <20240618200539.GHZnHok3nr60R4BXSK@fat_crate.local>
Message-ID: <ZnIWFHYipU2DsLK6@google.com>
Subject: Re: [PATCH] x86/alternatives, kvm: Fix a couple of CALLs without a
 frame pointer
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 18, 2024, Borislav Petkov wrote:
> Ok, I was able to scratch up this from the whole shebang:
> 
> ---
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Tue, 18 Jun 2024 21:57:27 +0200
> 
> objtool complains:
> 
>   arch/x86/kvm/kvm.o: warning: objtool: .altinstr_replacement+0xc5: call without frame pointer save/setup
>   vmlinux.o: warning: objtool: .altinstr_replacement+0x2eb: call without frame pointer save/setup
> 
> Make sure rSP is an output operand to the respective asm() statements.
> 
> The test_cc() hunk courtesy of peterz. Also from him add some helpful
> debugging info to the documentation.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406141648.jO9qNGLa-lkp@intel.com/
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---

Feel free to take this through tip, I'll be flabbergasted if someone sends a patch
that modifies test_cc().

Acked-by: Sean Christopherson <seanjc@google.com>
