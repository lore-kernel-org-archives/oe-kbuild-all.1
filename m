Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A601C3C1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180651; cv=none; b=tI3QckNmjK1cwGjt7+GAy/mrx274pMVrncZVSK1hfLNxdipk8avMxLMvpY195Nk8cTsg3kkiOWQvfs0h+xHi+uMNcIVKcSiN6OqVUl9aYxptLFOWjBsVGihPsCUETj+WyghKiMR0soyu0nhirJg2mdaDklZrftaEPwkJ/yOblqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180651; c=relaxed/simple;
	bh=9Qv6bc3iaVsGDQ4BZM9WU9AXuhPY0vqdFdQoqjeN/Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGLZYtQk9cK+e3BDnj2dlfh1Qh6u3sCb0kE9JD1HxL7zaNjKREDoAsci2PVZCruGPOJrBL/Zq7IN2QqAu5FW4TPlc/AQJ3o3B2kP+AkPQnRqL3qZQblXVmhD96Muw6M2XNl+WqCy0zQTWwfIUYdfFoBxvgcyl0Djy665aOwR6Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TfMwc3vK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TfMwc3vK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7ca64da5dso77154266b.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 01:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739180647; x=1739785447; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sx0DR0yeLfWSTZQtAIVc9iV0+XVhDpRSY8kJ+UcbHEg=;
        b=TfMwc3vK3Hcj/0hOtdiw7hB8Vv0de8466YcJAvLD6T/KLdLg6JFUa7EoDoAeT0Bi+W
         lpLWJlzUPXv1CBiutolR7a2Vn62/j0eYM/uZYCDNXRC2n1cs5R49Ef9EV8/sRPQkj3vT
         bYW36yuwc0L0HEQg3f6hp9QSig0g9JwbfFADzhgzCxYo4cSDR1dadBfZlrz3AnnuvviN
         +JnerpLA7CBTl0fJdKAvCJTRYPgDHvnLyzPcMFiO+9G14/tzuyQuUf/kMoFoCE1mkCNr
         EDczFC/3h+X1LPFy26Q0Grsm5sgEov5SpmGW9DfbLwrJSeFktdhfpSG2If82iU3P23P3
         eDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180647; x=1739785447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx0DR0yeLfWSTZQtAIVc9iV0+XVhDpRSY8kJ+UcbHEg=;
        b=VIIa+UhpbacC7qZ2PelEmcC787iEO67sJoUEEVli5j+pgBa729saZ7oG03rTW7PaFF
         om9ryD37a/H5K3rdM9iaj+uQBGN8uGsHgFJ5ouxUqdi3+IgEuycVeZJc6qTw/GqxHzXY
         0HCwjf74glRoni9ppw4YOQXQBF1P6pvB6NTyFI4AvnUdgxYGAFHSL8Ur9RgdVAcJ3BNi
         JWL4Dc6nIvV9+zwbBGn/Wm81UOUEpbJoLreWc2k8hI8QFKTrDk1AqZWWZ82FDgI36hWe
         4pfV5I2JpTL72g4s+JvlEq2kn1O6uVVpocUGj9LJSknKkzKSlABk9co15B1ls24YXnSp
         /HWg==
X-Forwarded-Encrypted: i=1; AJvYcCVsFmBUvunXqu6vN8Z5VT7COyMGft+ZGHrpWiOMO1AuVHo2RYVopaMuy308tXREsgBgXFBZr69Y3p9SnZRx@lists.linux.dev
X-Gm-Message-State: AOJu0YwADL4WNRJwsnwNLdhunc1AoMv+mWIB6P1kbUkNHU/QpIHeV8fD
	mhsg2TQfUYTP1JYJYPNSy6yMROz01xbEEeKS+BqEWAyj4XGX3OP4i/fWVKvmwQ==
X-Gm-Gg: ASbGncuiao2iJ8s/oFn32+Dek1oK9PuD02GIrEXuCDHTk3Pd+VwxdGaCHij6uvo7+1a
	E+65VaWBe8ZYujofP/0MpkjsSw9XyMKB38MD7yBs5lfPAo7bqHBn1kvcsXlc19mf41dxAGmoD5a
	A29bCHxCcIsuTES8tncr6quW0Kh9Zm909fo/h+uKC2nk4olWJrZmv+zgTLV/QcmtIzsBh/3CGf+
	hit/94fR11WVnUuk9l9EnPIkIYv3qjrUK3dVKc/QnuZlGKnqPeqgIFBJGFxPC8zOydqvCBDtBVi
	qCE1cSLWvJ4576bqU1y8Q8CuDAdQWbNz+AwimdC8rZLODRbXu+XS
X-Google-Smtp-Source: AGHT+IGq4+VDwLnmzyRrx/5Pn45AUXiFF/r1y3uPPxUK12orNdApKFEVnjBeRhkqscbld2aCnNFHCQ==
X-Received: by 2002:a17:906:4fd6:b0:ab6:d4ce:568c with SMTP id a640c23a62f3a-ab789b48b85mr1438191766b.13.1739180647430;
        Mon, 10 Feb 2025 01:44:07 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7be7ac8a9sm206859666b.39.2025.02.10.01.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:44:06 -0800 (PST)
Date: Mon, 10 Feb 2025 09:44:02 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [kvmarm:fixes 18/18]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <Z6nKYtyJO2bNycJw@google.com>
References: <202502100911.8c9DbtKD-lkp@intel.com>
 <868qqetasm.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qqetasm.wl-maz@kernel.org>

On Monday 10 Feb 2025 at 09:21:29 (+0000), Marc Zyngier wrote:
> On Mon, 10 Feb 2025 01:39:04 +0000,
> kernel test robot <lkp@intel.com> wrote:
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git fixes
> > head:   eabc7aaef7a553b64bf6e631ce04526af6c8d104
> > commit: eabc7aaef7a553b64bf6e631ce04526af6c8d104 [18/18] KVM: arm64: Simplify np-guest hypercalls
> > config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/config)
> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100911.8c9DbtKD-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502100911.8c9DbtKD-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> arch/arm64/kvm/hyp/nvhe/mem_protect.c:1086:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
> >     1086 |         return ret;
> >          |                ^~~
> >    arch/arm64/kvm/hyp/nvhe/mem_protect.c:1076:9: note: initialize the variable 'ret' to silence this warning
> >     1076 |         int ret;
> >          |                ^
> >          |                 = 0
> >    1 warning generated.
> 
> Nice catch. I wish the compiler would warn for these by default...

So do I...

> Quentin, are you happy with the following patch that I can stash on
> top of the current set of fixes?

Absolutely, thanks for the patch and sorry the mess!

    Reviewed-by: Quentin Perret <qperret@google.com>

> From 5da62486aeda7d7d11107db8ed4e6421e3a2a364 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Mon, 10 Feb 2025 09:17:58 +0000
> Subject: [PATCH] KVM: arm64: Fix __pkvm_host_mkyoung_guest() return value
> 
> Don't use an uninitialised stack variable, and just return 0
> on the non-error path.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502100911.8c9DbtKD-lkp@intel.com/
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 4c2f6a6a2efe1..19c3c631708ce 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1073,7 +1073,6 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>  {
>  	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>  	u64 ipa = hyp_pfn_to_phys(gfn);
> -	int ret;
>  
>  	if (pkvm_hyp_vm_is_protected(vm))
>  		return -EPERM;
> @@ -1083,5 +1082,5 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>  	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
>  	guest_unlock_component(vm);
>  
> -	return ret;
> +	return 0;
>  }
> -- 
> 2.39.2
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.
