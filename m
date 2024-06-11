Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB02817838A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 13:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112548; cv=none; b=NENyZsuWaPnU4OIRUkvQ4u/S57IAKDOVtMY6msupkI+z2+H1PXwf4JYNfjyIrqiN2pHnGHfNQh3+9WJxC56fhL75NJQdokyUPCzIPNwdtBDg8KtmMdq3rb2c+SOO9PFa8oupkXObvWGvenZQKTRjOhP6P0ZoiXowayIB6jdXN/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112548; c=relaxed/simple;
	bh=FHJHTwFSSQ1Uzk0cQSknAKLbZ/VGCx6cyQgAAHKhCFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ux3JW4Dt9FidAJO79tssw1YQknlP7jr9QTenF/hgd8f2QQjr4wnA7AoEcPeEhzxXJEcl7Fzozy22rEzbQ2xHKxN/P19nKgp3cMoASSNXbRNbCLn2IiLyQygLKAlh/Ldi/WjewckrlQ2TIePSbLXEmFhhoHaN78cNJmUWXdBr8Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lb7yoKTw; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lb7yoKTw"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-70421b87aa3so839117b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718112546; x=1718717346; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zam+ZOLhMJBu8iaJ0RiQaB2QzwFkxPXc6h4VHxbA8A=;
        b=lb7yoKTwq92HzkfuVRnCa8Cfb3dE+li6ApB+1eN2Qs6nGK127Hj5nl4dd9XMyly8Lv
         9G2e+WTeDT1WDc8UFolA9XoNTwc7IhZ0eFSaU6iACQE8YoOnslpQX4AZqvifQfQPOK53
         onpeG2m2d43Rzg1DFz0+t/KN6/hr/zIEdleV6CI6aDOChZ7qjRu2wgbIMwiBHyZUxOzq
         3DS8hxj/+1cCV4gr1hDDKWZHnf4VsES07YBkAy3790IniTE1bh3PF2PWMfS6ktS06WCi
         yzRHMDLmWujDkY/XourLsx7fpOg47UVJpuxzeJxqAasZ5uz2g4jPEJlSeqpATGpfhzjB
         riYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112546; x=1718717346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zam+ZOLhMJBu8iaJ0RiQaB2QzwFkxPXc6h4VHxbA8A=;
        b=cigPbC/cf2JWTjElyf3PIjf5IEvhpRFIETTEE1YAQOuhtSgkDFcGT3hOyHi1yiMt12
         gYqnFJUuTWJ0sj0p/7sCnM4Z61AQzwr8NPenQB4TBNqhYpoTgVBPxaB1CNPzv2lGL01V
         Qd3CnMd6FOb/5cUIunezRgdOmbymiz5jT3fA2Xjvp0MZag3wi28kTdRb2gd7Dh2zj3AY
         pGzpZnjDjwTxPQjnVwICdWilpsmJa8iv0qhKVwRKpk1MNOgC6JmKNZO0TJ6mM9uNIJhy
         jwlk3Z8BHknf8qAmnr4DkMBJEmbgKaJ/7QhPpKu5EaEIf3CfAFgMG7YyhMd7xFIbu6EJ
         j26w==
X-Forwarded-Encrypted: i=1; AJvYcCVrklnh8t+wXUjJFraZ+42on/kj/PbqNo4WMR39sDKxxXY0wOwfQ0hL10y7THcXwTV6KOuxTT5YhGpXxTP0AlbrEHIQ5rZT6J6aGxtSiw==
X-Gm-Message-State: AOJu0Yw6EVd6+ltmQR65oyOBqqVuIaqIA21GA+hJZ1QzvAbMi8Iav1po
	1D89wta+dB6iovEuhCcEcG6uSzadEcBOnt8M0cZf4bG46xSJZHo0DVTQgwxwfHMZyw/lj0nfO48
	P+w==
X-Google-Smtp-Source: AGHT+IHxtfcunzv7+UgJC5xHyV9xETAURb223RNAy+OgxmjeB0a212r0Mdim9/VBBHNlPVkRY3W9vCLs6Dg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6015:b0:704:184a:a679 with SMTP id
 d2e1a72fcca58-704184aaa9amr41209b3a.4.1718112545841; Tue, 11 Jun 2024
 06:29:05 -0700 (PDT)
Date: Tue, 11 Jun 2024 06:29:04 -0700
In-Reply-To: <202406111054.tfC7sg5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202406111054.tfC7sg5g-lkp@intel.com>
Message-ID: <ZmhRILF3iBDq2hs6@google.com>
Subject: Re: [kvm-x86:generic 7/9] include/linux/kvm_host.h:2106:5: warning:
 no previous prototype for 'kvm_init_irq_routing'
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Yi Wang <foxywang@tencent.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 11, 2024, kernel test robot wrote:
> tree:   https://github.com/kvm-x86/linux generic
> head:   96545c0ccf1cdcbeeaca77399af27da12da6c833
> commit: 2207798ccd0adc8995a71f93fd77c8ece3eb330a [7/9] KVM: Setup empty IRQ routing when creating a VM
> config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406111054.tfC7sg5g-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111054.tfC7sg5g-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406111054.tfC7sg5g-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from arch/powerpc/include/asm/kvm_ppc.h:19,
>                     from arch/powerpc/include/asm/dbell.h:17,
>                     from arch/powerpc/kernel/asm-offsets.c:36:
> >> include/linux/kvm_host.h:2106:5: warning: no previous prototype for 'kvm_init_irq_routing' [-Wmissing-prototypes]
>     2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
>          |     ^~~~~~~~~~~~~~~~~~~~
>    include/linux/kvm_host.h: In function 'kvm_init_irq_routing':
> >> include/linux/kvm_host.h:2106:44: warning: control reaches end of non-void function [-Wreturn-type]
>     2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
>          |                                            ^
> --
>    In file included from arch/powerpc/include/asm/kvm_ppc.h:19,
>                     from arch/powerpc/include/asm/dbell.h:17,
>                     from arch/powerpc/kernel/asm-offsets.c:36:
> >> include/linux/kvm_host.h:2106:5: warning: no previous prototype for 'kvm_init_irq_routing' [-Wmissing-prototypes]
>     2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
>          |     ^~~~~~~~~~~~~~~~~~~~
>    include/linux/kvm_host.h: In function 'kvm_init_irq_routing':
> >> include/linux/kvm_host.h:2106:44: warning: control reaches end of non-void function [-Wreturn-type]
>     2106 | int kvm_init_irq_routing(struct kvm *kvm) {}
>          |                                            ^
> 
> 
> vim +/kvm_init_irq_routing +2106 include/linux/kvm_host.h
> 
>   2104	
>   2105	static inline void kvm_free_irq_routing(struct kvm *kvm) {}
> > 2106	int kvm_init_irq_routing(struct kvm *kvm) {}
>   2107	

Our friendly test bot beat me to build testing.  Will squash this:

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 82726050fc76..eaa70e9b1218 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2103,7 +2103,11 @@ void kvm_free_irq_routing(struct kvm *kvm);
 #else
 
 static inline void kvm_free_irq_routing(struct kvm *kvm) {}
-int kvm_init_irq_routing(struct kvm *kvm) {}
+
+static inline int kvm_init_irq_routing(struct kvm *kvm)
+{
+       return 0;
+}
 
 #endif
