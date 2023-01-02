Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB17C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jan 2023 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672650184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wb1+xDzO2OJICTmTcLvXLbzqWQzlOKX7kH0t48LZ9nw=;
	b=Da+gVFgARCqhxfn8/i8dycZGrLTHLedJ8glh2xHu+WM0JZOIn1acjXacBWe1J9TW1drZEf
	1+N36TVtMiwKruRbmFtGyi8GvxKa37VrYdSgbTLJiXGo1svlXGRXSYQ7ff57gKZMoCDfug
	DDOolpZxu/MM0RDMjV70WpiIITUsqJs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-99-qQWX7gVmOYaLnd1QHpp1ug-1; Mon, 02 Jan 2023 04:03:03 -0500
X-MC-Unique: qQWX7gVmOYaLnd1QHpp1ug-1
Received: by mail-ej1-f71.google.com with SMTP id qk40-20020a1709077fa800b007eeb94ecdb5so17126954ejc.12
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Jan 2023 01:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wb1+xDzO2OJICTmTcLvXLbzqWQzlOKX7kH0t48LZ9nw=;
        b=ub//LkjlRj/kg8tEh0vt/vG0U6H09o5x/APM5+xyfZn9qAvYNLq1XcchgUbKVUKs0Z
         drCvpt9Tw7c9sCUGyN1jVW//bBpkBsKtu9BKgrTrCLJzk5frxzVQu6Jt/KpU2Wsvps/X
         D56K/aFvLrlgAjSAgCH3QF0EXma24oOQ18O6i2VUI6fBpcxwe66upjVDWeqoa4S65u2z
         GPqHGGs7Gt9uGlqOiwyVwusDxSrKrvYD7NmPTi94y6bPL6llyH1PYTtVcTCRppGSoxlW
         dAbl7BToearykUoYGX01atyw0PHWWmEQfX91NV7buclXmC51jjuWHRh6SfnAB5uc6fpg
         S/2Q==
X-Gm-Message-State: AFqh2kod3pxpdOc2Ua0Z++fKrngTQUTQDILH6uIIPtftz5vAKTK5CXzZ
	+RhxouZJ13dVGMvCocCAu9DZJQRgLpUtI+SKeYuvGYcX5tr9g34iNVego214vOgsCdSV6rg9/w4
	Fw6nCeKq2KGDHT1TZWMfRx1Fk1w==
X-Received: by 2002:a17:907:6d12:b0:7c1:79f5:9545 with SMTP id sa18-20020a1709076d1200b007c179f59545mr48631500ejc.42.1672650182515;
        Mon, 02 Jan 2023 01:03:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDLPZVroDKNX4cBj7VAjVWNTi2t2B19QGOtb/AWnwmaUyDBdy1Fi3DVGVoJhGS5zpV9MOYgA==
X-Received: by 2002:a17:907:6d12:b0:7c1:79f5:9545 with SMTP id sa18-20020a1709076d1200b007c179f59545mr48631487ejc.42.1672650182353;
        Mon, 02 Jan 2023 01:03:02 -0800 (PST)
Received: from ovpn-193-222.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id jg34-20020a170907972200b0084cb8589523sm2360718ejc.139.2023.01.02.01.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:03:01 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org, Robert Hu
 <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>, Danmei Wei
 <danmei.wei@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Sean
 Christopherson <seanjc@google.com>
Subject: Re: [kvm:queue 65/153] arch/x86/kvm/cpuid.c:704:9: error: implicit
 declaration of function 'kvm_cpu_cap_init_scattered'; did you mean
 'kvm_cpu_cap_init_kvm_defined'?
In-Reply-To: <202212272221.bsAakB8X-lkp@intel.com>
References: <202212272221.bsAakB8X-lkp@intel.com>
Date: Mon, 02 Jan 2023 10:03:00 +0100
Message-ID: <87k025gvgb.fsf@ovpn-193-222.brq.redhat.com>
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
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   d3f8290e4d039d9970dabd34bd9e6b0a97c35ecc
> commit: 42b76c1ae40b89716c7a804cb575a4b52eb4e12f [65/153] KVM: x86: Add a KVM-only leaf for CPUID_8000_0007_EDX
> config: x86_64-rhel-8.3-func
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=42b76c1ae40b89716c7a804cb575a4b52eb4e12f
>         git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
>         git fetch --no-tags kvm queue
>         git checkout 42b76c1ae40b89716c7a804cb575a4b52eb4e12f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    arch/x86/kvm/cpuid.c: In function 'kvm_set_cpu_caps':
>>> arch/x86/kvm/cpuid.c:704:9: error: implicit declaration of function 'kvm_cpu_cap_init_scattered'; did you mean 'kvm_cpu_cap_init_kvm_defined'? [-Werror=implicit-function-declaration]
>      704 |         kvm_cpu_cap_init_scattered(CPUID_8000_0007_EDX,
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>          |         kvm_cpu_cap_init_kvm_defined
>    cc1: some warnings being treated as errors

This seems to be fixed in the current kvm/queue;
'kvm_cpu_cap_init_scattered()' is now called
'kvm_cpu_cap_init_kvm_defined()'.

-- 
Vitaly

