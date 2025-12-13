Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17B8632
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 01:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765587716; cv=none; b=IwqdH9ZRwnkDJBW8ZC2HHG5x+gIofEbzO1NlusKnObP5tsQobAAsWzRKfmO5UFkghbXcIuTYPqrMUECXqtSArUttkyFWEo1Dxi3Hqrae1yrz3NgCSffpl25N2sMQ6yiI613Zl4fazSvP2MKvNK7H1mZmxU24hswofhS5xS7g4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765587716; c=relaxed/simple;
	bh=DDL1jfLW1hz4WUdMItB00xanr/nrgbg93FGLz6fdESY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u2SlPtT1IYxY8rhntqoZQocMj9MK49E1dEbB+ufIUgHkGw/qQg1/UuT3gC4ttU2565BO4vc5eOPzdFvtwgqFK+Y0AJrdSK6Unj5DiAGqbdlIFpM3TC7Buzh+sPlk1BMZ87cmTc3aHGaum2zBDD4ZR3y0Cy7YgH8VuTzZpGFnaOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IgUTx4zB; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IgUTx4zB"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7ba92341f38so1934433b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765587714; x=1766192514; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qGmPxhRCLwLeoN0Jn2kJkVyLdCbAIGmH6gcp9ivIgYE=;
        b=IgUTx4zBjgYoJjfNdJCoT2ZLT5L6GhzwdM5glsLVuQWjteXgb2X+6exW6/vxLQjtw+
         /TblhObPZvogc89UpF376FC4Svv1RDToU1hoHtUb+cwkvAVZZWz/h60KaskDwQkIJZ6g
         zpwyNHPxZsnZVJhtkVNmL3DMON4+Cvv5a1cy/niuvj66lngRtMn8z2Z8BvViiSCBt7O3
         u3ZlguYJC0RhtSuI2CsAD9vNgouw7biwvCVWUBODe5j9AybNTf1IqiWKxSmXDHxLRx6a
         zCq4QCZfVHD/1Hp7LPr2pjpJo5ZHBx9S6JdMY2/qg/2jUj+h0VpBPncMpBRUsS7lXo2L
         dW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765587714; x=1766192514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGmPxhRCLwLeoN0Jn2kJkVyLdCbAIGmH6gcp9ivIgYE=;
        b=Ufaai85rLKYuF0gMuHqGqtue/NS8SX0YGp6YNViyizR0ScvWExZpWtE4VEWLTc++P6
         nh2opMs8lNq2svL6Ac9zdv7e769nwIA2Xy3ZIQxeWd/NEKdsHEXmMrlfaL7ai+0LptuL
         PHb9IHIjm3r+WaXct6QCpmLcq4a3JPHXMj309AkLJp7wVvssq2JvWhhf7gfZQKk0NimX
         pIX47l1xkRr/HkEC9X2ejiHBz18NAjAGqlY5gdZl+znE81syS6y6wefeXB6XrOJRU2pn
         icHmagOa4LTlTUpAHUyfaUrjpBVGZdBy9tX63Au+KvoJtPO9hMc6AMQbrgV2Rry7NXsh
         lE+w==
X-Forwarded-Encrypted: i=1; AJvYcCVK3NjdbrKHfOX9R1wQGbp/QqQ1EF7uOtEpVdp2SSNhWVE51S5rRztrcsJu3aq95FdWL2Y3UYva/NTqr5CS@lists.linux.dev
X-Gm-Message-State: AOJu0YyXhklok5gTApZD4LhIBGc5ytPsgph+MspTc/uUFfjRSZmVjRre
	N2oGUyCG4KAR04iMRAUbZhP2YKYM6JvSBhhY21j+qIS7MKGPTk3AsI7HtSAjEAeXrg2WqLD1YVJ
	xtgUtew==
X-Google-Smtp-Source: AGHT+IFTcExGSp78Md5O2JVDKo++NOAxmErlpynuBmA+4Cwked1rlT56jHlkz3eG6VCW8GjJtn72VI/oKOI=
X-Received: from pgtv2.prod.google.com ([2002:a63:b642:0:b0:bac:ef38:605c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7490:b0:35d:d477:a7db
 with SMTP id adf61e73a8af0-369afbff895mr3381877637.56.1765587713879; Fri, 12
 Dec 2025 17:01:53 -0800 (PST)
Date: Fri, 12 Dec 2025 17:01:52 -0800
In-Reply-To: <202512130717.aHH8rXSC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251212135051.2155280-1-xiaoyao.li@intel.com> <202512130717.aHH8rXSC-lkp@intel.com>
Message-ID: <aTy7AG2y1OwIXfqs@google.com>
Subject: Re: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf
 while the MMU is direct
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	oe-kbuild-all@lists.linux.dev, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, farrah.chen@intel.com
Content-Type: text/plain; charset="us-ascii"

On Sat, Dec 13, 2025, kernel test robot wrote:
> Hi Xiaoyao,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyao-Li/KVM-x86-Don-t-read-guest-CR3-when-doing-async-pf-while-the-MMU-is-direct/20251212-220612
> base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> patch link:    https://lore.kernel.org/r/20251212135051.2155280-1-xiaoyao.li%40intel.com
> patch subject: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf while the MMU is direct
> config: i386-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130717.aHH8rXSC-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130717.aHH8rXSC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512130717.aHH8rXSC-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/kvm_host.h:43,
>                     from arch/x86/kvm/irq.h:15,
>                     from arch/x86/kvm/mmu/mmu.c:19:
>    arch/x86/kvm/mmu/mmu.c: In function 'kvm_arch_setup_async_pf':
> >> include/linux/kvm_types.h:54:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
>       54 | #define INVALID_GPA     (~(gpa_t)0)
>          |                         ^
>    arch/x86/kvm/mmu/mmu.c:4525:28: note: in expansion of macro 'INVALID_GPA'
>     4525 |                 arch.cr3 = INVALID_GPA;
>          |                            ^~~~~~~~~~~

Well that's just annoying.  Can we kill 32-bit yet?  Anyways, just ignore this
(unless it causes my KVM_WERROR=1 builds to fail, in which case I'll just add an
explicit cast, but I think we can just ignore it).
