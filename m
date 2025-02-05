Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666DB2144A8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793515; cv=none; b=ZR1SGqc9876Gz2mOuSWb71Bz7CGQUAs1FUGrc4r2U8V6SS7+qr1rlsbX2jb4y2QUvFex0UhvzqYlzTMcBSXjRK1oo/NgnmNmnqQ8Xi6LV9x9OOclxWBt2D9jvbIotDfckf1deIpxekRWApBJJWTvKEn7ONJX+D6lyO8G8eYB3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793515; c=relaxed/simple;
	bh=3RYl/gs2fpKSYlwyr/Pv5fOuVWQBmmZvDBdK5KijD2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pptncP1h3F4aBw89za2KZyVCVMNxNQR6vvuf4kp6eydcNeuV0rVXanQz/zmUhz8AwAYii1KSdTf8eslSgzUbQUvr/jVyYCtwl/375Z2cLPwQb6c0bLBsGP3zX/EfK2+gwZ6/h4EYfdyon7Yr4lOiMV54I+tR9SQhdqd+cb3Q/Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4dhlKrR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4dhlKrR"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f1e9c6682so4856275ad.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 14:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738793513; x=1739398313; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/5StieEPzoyEbQCxqYfL9eEdHe/Vt3KlunzFN9iVI0=;
        b=y4dhlKrRnMrnafJ3sAnc8TmT5zsiil3nCitRhPkpp2tNhIS+Yrd/E824b7tUGHNQN4
         u9d03a2gigWBzvnmHadeUZOYtRylu/U5e7vN4eHwpv4ucG9iSld4dV7Uijon+N/82+i/
         s6Wxna30kBuRsdfUG2F4fkvaam1n+T+cCL8LB/rEWnPs/Gf0Pyi5D4ih7rV4cy7GvzIj
         aRYB3UayyoVmiHYjqI6FPttdWJXBDnbGcZd9ZJHHc7XfmAnzn5anhiL5y9WTJXsWbQhi
         zdjmq+3gOKwVVoFWX9Y2vdQb8+It+Q8AIxu29ecHB7/1p+9KbxT33AYhYChh3bchpeSV
         P5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738793513; x=1739398313;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/5StieEPzoyEbQCxqYfL9eEdHe/Vt3KlunzFN9iVI0=;
        b=i3Z7DuaM5k2nRsN12cLTK/3uMd1uscrAhH0JN33jFuwEwu819vP4xj9KOvl4WW0L9V
         rKrNr5Az5iV2UJBiPOmj9lnuY/VXvbWi79mp1Yu2aubM+9ldOHtm/jmHhtKL5+tFFRvV
         5LRm6lFobH9YlJTbatGCFPXm8GuvbCbqPHSPLqIGdOjtPFCN1yJ/5juwqTu3br8rzEKe
         IrMkhBk2hNFsaiKbf44aji0CraYCCJwMONGI5GkoD2stI4wPS4RQzns2GK61U5Xjcxhe
         3xEs1xlHJeRTPH8LzGT4uQNHjiSiNlJgJVAucG9bXsr9L/DYzgdGsXfAN1t+977XKMja
         CM9w==
X-Forwarded-Encrypted: i=1; AJvYcCUR1RgHIRZ/pryKKhPB36bAb8Vlzm9KyweL2DeR1p+ZamtMz5jdoccoO4ai6P+dpEEUz56M1F3WMz4aeJLd@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+LIPM32BPlVplV/Nf2Lv7PnizqIHHAnCbC4vddf0e1FgjUG9C
	JJc/dDPVzK6JkiH8yLg6UcTabpYg5kAETHzwzPImtPYyGGyPceXyBP3QN7NcOjCSDAUf/vqJInv
	qag==
X-Google-Smtp-Source: AGHT+IEkK+hxVVhcoJF36P73i4M6ntSbjHdlgQ6LGlhDknUXVc9jDIL3pI5C6R6xZVZZi/f+RcvffIElRhY=
X-Received: from pgcu73.prod.google.com ([2002:a63:794c:0:b0:7fd:50c9:74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce03:b0:216:36ff:ba33
 with SMTP id d9443c01a7336-21f17e6d0e4mr66832315ad.26.1738793512642; Wed, 05
 Feb 2025 14:11:52 -0800 (PST)
Date: Wed, 5 Feb 2025 14:11:51 -0800
In-Reply-To: <f9d42d5a-a625-4eba-9ee4-c2c42d179df7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-16-seanjc@google.com> <f9d42d5a-a625-4eba-9ee4-c2c42d179df7@stanley.mountain>
Message-ID: <Z6PiJ3HPf86O0mkr@google.com>
Subject: Re: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when core
 crystal freq comes from CPUID
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 04, 2025, Dan Carpenter wrote:
> Hi Sean,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/x86-tsc-Add-a-standalone-helpers-for-getting-TSC-info-from-CPUID-0x15/20250201-102521
> base:   ebbb8be421eefbe2d47b99c2e1a6dd840d7930f9
> patch link:    https://lore.kernel.org/r/20250201021718.699411-16-seanjc%40google.com
> patch subject: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when core crystal freq comes from CPUID
> config: i386-randconfig-141-20250204 (https://download.01.org/0day-ci/archive/20250204/202502041246.3weiY0qo-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502041246.3weiY0qo-lkp@intel.com/
> 
> smatch warnings:
> arch/x86/kernel/kvmclock.c:117 kvm_get_tsc_khz() error: uninitialized symbol 'crystal_khz'.
> 
> vim +/crystal_khz +117 arch/x86/kernel/kvmclock.c
> 
> aea5814308ed7c Sean Christopherson 2025-01-31  105  static unsigned long kvm_get_tsc_khz(void)
> aea5814308ed7c Sean Christopherson 2025-01-31  106  {
> aea5814308ed7c Sean Christopherson 2025-01-31  107  	unsigned int __tsc_khz, crystal_khz;
> aea5814308ed7c Sean Christopherson 2025-01-31  108  
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  109  	/*
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  110  	 * Prefer CPUID over kvmclock when possible, as CPUID also includes the
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  111  	 * core crystal frequency, i.e. the APIC timer frequency.  When the core
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  112  	 * crystal frequency is enumerated in CPUID.0x15, KVM's ABI is that the
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  113  	 * (virtual) APIC BUS runs at the same frequency.
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  114  	 */
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  115  	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz)) {
> 
> The cpuid_get_tsc_freq() function has a bug so it doesn't actually
> initialize crystal_khz.  It actually uses the uninitialized value, inside
> the function but Smatch doesn't catch that.

Argh.  I caught this in testing and fixed it locally, but clobbered my branch
and accidentally reverted to the broken code when posting.  The bug is way back
in patch 1, I'll point it out there.

Thanks!

> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  116  #ifdef CONFIG_X86_LOCAL_APIC
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31 @117  		lapic_timer_period = crystal_khz * 1000 / HZ;
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  118  #endif
> aea5814308ed7c Sean Christopherson 2025-01-31  119  		return __tsc_khz;
> 32cd84ebbd5dbd Sean Christopherson 2025-01-31  120  	}
> aea5814308ed7c Sean Christopherson 2025-01-31  121  
> aea5814308ed7c Sean Christopherson 2025-01-31  122  	return pvclock_tsc_khz(this_cpu_pvti());
> aea5814308ed7c Sean Christopherson 2025-01-31  123  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
