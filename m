Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11BF310784
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098550; cv=none; b=qwhzKBkyAqRV5XizDRMHrbK0v8UabCU81G0c7q7FFk8rtvOrDcS5c4rdIz1IejZ+N1bkYHtVlXN7vG4jLR7AG0veOD+0lWyMhV0754RWphlS7mOMFQQXOlN8XxykQSr6zm1mb713avOLWIZrl6vGx1z0zYE+c32I0w1nwiYetNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098550; c=relaxed/simple;
	bh=IFX/sd70GB/OyEU++22WH2LmwkHyzc5ytEPoWJ/ZF3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UmtHlaQD1FC/6uNLkDz/DsJCzbpaVLEz82qHeVdAY+T7E+QpmUOMQ8VYxa0jas2NsAFlnKJhTg8sQopJ6R6kYJdbutUZgvrsLH9xuwTA4JAAk+/0X9LZ2vi2He7t0lv0LES30ATi/iCxJJuEr2n5BQw3YkEn15F6LCh5dbMoVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F6WP+wOc; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F6WP+wOc"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so2631545a12.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 09:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776098548; x=1776703348; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=591w7KaD0ZXd0J+hjRAXxTj9gsC6Fb4Gv7lYMSBAQwA=;
        b=F6WP+wOcaK8Kab1EW+ZCoPdstrzWWr0wGQ08DwdfuAGJQ2YUieHK0hzS3JUGlUkBp8
         rFIl4QXzpGslpKg4Zo3XGyQ6ZMI44+7oLRpwfXRY/F0ZgfCqswKWxdSO4vBSTNA+qKNL
         vrDhda8/yFu14djeoLwGGEnmtCBRgqaxYrehRYdIEjyAgDL8sTsKw9V2AmMOkLigU+hr
         VdKObo0cFnZyK47PiXxlG9zfSo96cZdfk7Vj3ulJZCCel8Fsz6eggat7Xoq6o50Vdry6
         Hxj9X52lfLcSN87pS5PTLP9GrxitABkvTGBSf5l0mVWVB7TTVwK2fI0EhjctLldX6eqm
         OMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776098548; x=1776703348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=591w7KaD0ZXd0J+hjRAXxTj9gsC6Fb4Gv7lYMSBAQwA=;
        b=LCU3J7Dh8tAfJu2Kre7ct6+QUSE2ChIH8J7LsgwPxEC+XyGIquqC4Q6LhI4iO/KzjV
         YtV02oF5ee+p4uF4wG1f3YJ6G+Q5j1wxyjwC0bSPvdsJ0BpfF8KtbOllqbhgNYvgezge
         d5o9xU7logGeJC+BqbHQdlM5dTNLlYDwfC86VnxIzzERgh8f3HRown6YOzV/qitEpWLr
         wEOrFagenS4vmlEve4iFFsmO5RopYE6TJUb7530jvTFdOL5cBTobsqSENQuKp+MXD8mG
         wIoUdpDTNwjBlIN4SNNpO9QeDGGNmmcDA14FBv0tIcS3WqZKEWV4hC2cgo2TRHnLGrw+
         gORg==
X-Gm-Message-State: AOJu0Yx3EYlM2pn/qRXKa7OeGY/mPt2wh7S9LeQSE4Z9Q//qL/h/9C1u
	0xxDXQFJ1UTfcgfcvDtX0nAypQuTPyq/d1C5BeEBlGVq2arp+Xtm8AC8uEaoot3fDLFyBxcWKkF
	1G0qjnw==
X-Received: from pfbkh38.prod.google.com ([2002:a05:6a00:9466:b0:82a:5ddb:b051])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:916a:b0:82c:e83d:a9a3
 with SMTP id d2e1a72fcca58-82f0c18a855mr11872515b3a.22.1776098548074; Mon, 13
 Apr 2026 09:42:28 -0700 (PDT)
Date: Mon, 13 Apr 2026 09:42:26 -0700
In-Reply-To: <202604131813.Sp3bcsFp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202604131813.Sp3bcsFp-lkp@intel.com>
Message-ID: <ad0c8lNL5ZoSRZI6@google.com>
Subject: Re: [kvm:queue 12/12] arch/x86/kvm/svm/avic.c:240:39: error: passing
 argument 1 of 'is_sev_es_guest' from incompatible pointer type
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	Farrah Chen <farrah.chen@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 13, 2026, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   8f65c76d62f1f07d68b8a14829a59049311547b1
> commit: 8f65c76d62f1f07d68b8a14829a59049311547b1 [12/12] Merge tag 'kvm-x86-svm-7.1' of https://github.com/kvm-x86/linux into HEAD
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260413/202604131813.Sp3bcsFp-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604131813.Sp3bcsFp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604131813.Sp3bcsFp-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/x86/kvm/svm/avic.c: In function 'avic_deactivate_vmcb':
> >> arch/x86/kvm/svm/avic.c:240:39: error: passing argument 1 of 'is_sev_es_guest' from incompatible pointer type [-Wincompatible-pointer-types]
>      240 |         if (!is_sev_es_guest(svm->vcpu.kvm))
>          |                              ~~~~~~~~~^~~~
>          |                                       |
>          |                                       struct kvm *
>    In file included from arch/x86/kvm/svm/avic.c:31:
>    arch/x86/kvm/svm/svm.h:415:62: note: expected 'struct kvm_vcpu *' but argument is of type 'struct kvm *'
>      415 | static __always_inline bool is_sev_es_guest(struct kvm_vcpu *vcpu)
>          |                                             ~~~~~~~~~~~~~~~~~^~~~
> 
> 
> vim +/is_sev_es_guest +240 arch/x86/kvm/svm/avic.c
> 
>    232	
>    233	static void avic_deactivate_vmcb(struct vcpu_svm *svm)
>    234	{
>    235		struct vmcb *vmcb = svm->vmcb01.ptr;
>    236	
>    237		vmcb->control.int_ctl &= ~(AVIC_ENABLE_MASK | X2APIC_MODE_MASK);
>    238		vmcb->control.avic_physical_id &= ~AVIC_PHYSICAL_MAX_INDEX_MASK;
>    239	
>  > 240		if (!is_sev_es_guest(svm->vcpu.kvm))
>    241			svm_set_intercept(svm, INTERCEPT_CR8_WRITE);

Ha!  Not my fault :-)

The resolution should have been:

diff --cc arch/x86/kvm/svm/avic.c
index 2885c5993ebc,7056c4891f93..adf211860949
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@@ -226,9 -237,6 +237,9 @@@ static void avic_deactivate_vmcb(struc
        vmcb->control.int_ctl &= ~(AVIC_ENABLE_MASK | X2APIC_MODE_MASK);
        vmcb->control.avic_physical_id &= ~AVIC_PHYSICAL_MAX_INDEX_MASK;

-       if (!sev_es_guest(svm->vcpu.kvm))
++      if (!is_sev_es_guest(&svm->vcpu))
 +              svm_set_intercept(svm, INTERCEPT_CR8_WRITE);
 +
        /*
         * If running nested and the guest uses its own MSR bitmap, there
         * is no need to update L0's msr bitmap

>    242	
>    243		/*
>    244		 * If running nested and the guest uses its own MSR bitmap, there
>    245		 * is no need to update L0's msr bitmap
>    246		 */
>    247		if (is_guest_mode(&svm->vcpu) &&
>    248		    vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_MSR_PROT))
>    249			return;
>    250	
>    251		/* Enabling MSR intercept for x2APIC registers */
>    252		avic_set_x2apic_msr_interception(svm, true);
>    253	}
>    254	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
