Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095B43715B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 20:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYESbTys"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d9cb79eb417so116487276.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Nov 2023 12:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699474798; x=1700079598; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MAkWUu4DkxSH5sUyb3Xf/vPz8zbhDyNKMdscALbnD8=;
        b=oYESbTys4cEvgIIXKZQWLiys0QWEFrDGA2tNQXJfPqX1iPLfyxFjw2AxKINlHFgOHk
         lmImNpdLv0KMdqgFWFiHV/aQGsTYDqE1P02W3b9XeZdbK0dNkbcJgaaH3UZkPNeOCCN4
         eTwpVUrKqFbNU801+ReRmPqS4niC0K9GN0PrtUdYpS+Mc180IqK1RAZPuClFY5PPpYmP
         BG0k7q0laaSebgamhWwREKA8JknKZrSC99MCHMmNJaKm+zl9iKHfSsWtaZ3y/NnFmhnS
         fsnkZUv2RNCWKL8jaTBKhdT+ld9StCRtG7RB75m7t6E8jyXy2rxf0Nw4ApgH4Bx+1Vfr
         Ni8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699474798; x=1700079598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MAkWUu4DkxSH5sUyb3Xf/vPz8zbhDyNKMdscALbnD8=;
        b=tqq4WB+AfYVhhncwGQYVUVNMj5Ubak3neWme4lBMbuP+mE3ekPSq98oHjKDJuizkuh
         oImNerQaKfFy4NaVvEKF+J9OPoPAxko67sm18WZV0vZD8GUveBWW0Z70rSqGjmvyDMzA
         ZXetQ94hOEHHN0BeVKJNn9dgwA5/LMpcFCmkZZijpZ3Zwuc4MG6uQzqPoPQovIMgSjv9
         T7J8j73jPBgfF3g0BBeJSnAh8qLcTWoBmxcuEQ+SfmiVsALmZ5lq6UPRl1UjZtFPINcl
         kw/VpHCAPZxfbtYOoC4fORHUnRq0uubw41aAw2ovaU9VruBaqiPc5ErjkjSWQQ0TOhGG
         +uEA==
X-Gm-Message-State: AOJu0YydAg6egDnFDcnROB07MEYlz/LqF6097NU7fwcS/hS4YdfdHVC2
	X39eCo4inO/DbKqGW71+Ne/+lvGXApA=
X-Google-Smtp-Source: AGHT+IFNi4wgSYIGZFNuhbyheKWePNoC3fS8qVwIG8FGIrV7Od6wpxbQ/4tz+xriKX2AsSmGDSLi9zJ5OnY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:102:b0:da3:723b:b2a4 with SMTP id
 o2-20020a056902010200b00da3723bb2a4mr57302ybh.7.1699474797990; Wed, 08 Nov
 2023 12:19:57 -0800 (PST)
Date: Wed, 8 Nov 2023 12:19:56 -0800
In-Reply-To: <202311090100.Zt0adRi9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202311090100.Zt0adRi9-lkp@intel.com>
Message-ID: <ZUvtbInra7-Nypgq@google.com>
Subject: Re: [kvm:guestmemfd 59/59] arch/s390/kvm/../../../virt/kvm/kvm_main.c:5517:14:
 error: 'KVM_TRACE_ENABLE' undeclared; did you mean 'KVM_PV_ENABLE'?
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, 
	Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>, 
	Danmei Wei <danmei.wei@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 09, 2023, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git guestmemfd
> head:   cd689ddd5c93ea177b28029d57c13e18b160875b
> commit: cd689ddd5c93ea177b28029d57c13e18b160875b [59/59] KVM: remove deprecated UAPIs

Paolo, I assume you force pushed to guestmemfd at some point at that this is no
longer an issue?  I can't find the above object, and given the shortlog I'm guessing
it was a WIP thing unrelated to guest_memfd.

> config: s390-defconfig (https://download.01.org/0day-ci/archive/20231109/202311090100.Zt0adRi9-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090100.Zt0adRi9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311090100.Zt0adRi9-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/s390/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_dev_ioctl':
> >> arch/s390/kvm/../../../virt/kvm/kvm_main.c:5517:14: error: 'KVM_TRACE_ENABLE' undeclared (first use in this function); did you mean 'KVM_PV_ENABLE'?
>     5517 |         case KVM_TRACE_ENABLE:
>          |              ^~~~~~~~~~~~~~~~
>          |              KVM_PV_ENABLE
>    arch/s390/kvm/../../../virt/kvm/kvm_main.c:5517:14: note: each undeclared identifier is reported only once for each function it appears in
> >> arch/s390/kvm/../../../virt/kvm/kvm_main.c:5518:14: error: 'KVM_TRACE_PAUSE' undeclared (first use in this function)
>     5518 |         case KVM_TRACE_PAUSE:
>          |              ^~~~~~~~~~~~~~~
> >> arch/s390/kvm/../../../virt/kvm/kvm_main.c:5519:14: error: 'KVM_TRACE_DISABLE' undeclared (first use in this function); did you mean 'KVM_PV_DISABLE'?
>     5519 |         case KVM_TRACE_DISABLE:
>          |              ^~~~~~~~~~~~~~~~~
>          |              KVM_PV_DISABLE
> 
> 
> vim +5517 arch/s390/kvm/../../../virt/kvm/kvm_main.c
