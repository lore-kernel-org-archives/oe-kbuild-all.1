Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4391A748C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Dec 2022 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670951212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOYSn0ABw/PTlascbUku2DcG8a5ddyAdOvMJyDDxsb0=;
	b=hPmqaojq/OWYHcI4GQr4LNMuIk+uCWgsm8Ezk5c8mvSpTLvZVr8ypdxD6Myy/S14epFnqi
	yZRxq7J2uGhoiLUi0Mo/zWBVPN+pqgu899/YUVcaZ239ginW+Mp+Cb7rkzVVqPk8PX6I4M
	BSn4IKpjo4rSzdIZ4QAHIZOSWmqpk3A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-a_8sV8hJM2ulQaccsyIrdw-1; Tue, 13 Dec 2022 12:06:51 -0500
X-MC-Unique: a_8sV8hJM2ulQaccsyIrdw-1
Received: by mail-ej1-f72.google.com with SMTP id sb19-20020a1709076d9300b007c17017bb51so4336973ejc.21
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Dec 2022 09:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOYSn0ABw/PTlascbUku2DcG8a5ddyAdOvMJyDDxsb0=;
        b=md8jAPwvfuvTCofOsXnY7MIktSa+B5CThaBA/OVG33sS/ARF6qRF+KRaF/xnutYT9i
         jvv519NjM3s/n1o6jE5KT/eqjDXnSUr/Y1GsA9spLEYORLVNVEiZ/PTudazB06BbGAr7
         DGS8aCa/k160IIMOEQSI78MK/V/EXUBzYEvGwpJZ2GjW9/lmbktDKzt4hdHfNrrlDRNS
         uW6t7pbVXIqqx+ioH1nauKT96vEy0TKN9AhEybP5A0iF5WNTU0jTIhyeOHC+c7p0fRlp
         SFfDRT0SJ2Drp1c6J1EyPlCGuZyu4cSDbcn0vkKvj6n6cQopdabEE7MU6u3c4FhY6hzF
         v4IA==
X-Gm-Message-State: ANoB5pmFB5qM5X7JUCkapYb3HsC3C5VfAHxQFjSov0BPZRKV7YJCYAcu
	yf1+upet5v+7GOJ6vpzwtIcUtr3PYjK6TKBlQWJoiHmhs/ZbEziFx+twrWKv8mFeU2J1QdCgcxb
	jRegVEuwYCaAK3cmj6Ven6xnfvg==
X-Received: by 2002:a17:906:8805:b0:7c1:3125:955f with SMTP id zh5-20020a170906880500b007c13125955fmr15800645ejb.65.1670951210025;
        Tue, 13 Dec 2022 09:06:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5dlhfqvH6MBKRYHOqv9AiDTlEqEMKNVVthP0BR1nci7rLMKfiH59/D15hJSmQ0o+mXEC48MA==
X-Received: by 2002:a17:906:8805:b0:7c1:3125:955f with SMTP id zh5-20020a170906880500b007c13125955fmr15800632ejb.65.1670951209855;
        Tue, 13 Dec 2022 09:06:49 -0800 (PST)
Received: from ovpn-194-169.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id g1-20020aa7c841000000b004704658abebsm609741edt.54.2022.12.13.09.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 09:06:49 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kvm@vger.kernel.org, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 2855/9999]
 arch/x86/kvm/hyperv.c:2185:5: warning: stack frame size (1036) exceeds
 limit (1024) in 'kvm_hv_hypercall'
In-Reply-To: <202212122016.eqBzscLJ-lkp@intel.com>
References: <202212122016.eqBzscLJ-lkp@intel.com>
Date: Tue, 13 Dec 2022 18:06:48 +0100
Message-ID: <87zgbr9qs7.fsf@ovpn-194-169.brq.redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> Hi Vitaly,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> head:   2b8b2c150867edf2f7c351b27e2ce18865b0a25a
> commit: cb188e07105f2216f5efbefac95df4b6ce266906 [2855/9999] KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
> config: i386-buildonly-randconfig-r003-20221212
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=cb188e07105f2216f5efbefac95df4b6ce266906
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.15.y
>         git checkout cb188e07105f2216f5efbefac95df4b6ce266906
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> arch/x86/kvm/hyperv.c:2185:5: warning: stack frame size (1036) exceeds limit (1024) in 'kvm_hv_hypercall' [-Wframe-larger-than]
>    int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>        ^
>    1 warning generated.
>

There's a 'fix' for this in kvm/next:

commit 7d5e88d301f84a7b64602dbe3640f288223095ea
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Nov 1 15:53:56 2022 +0100

    KVM: x86: hyper-v: Use preallocated buffer in 'struct kvm_vcpu_hv' instead of on-stack 'sparse_banks'

but I'm unsure whether it's worth cherry-picking into stable@, I doubt
this is a real world issue (i386, clang, Windows guests,...).

-- 
Vitaly

