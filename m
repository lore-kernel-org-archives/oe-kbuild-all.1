Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC421C299
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DJ1qTyTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701362933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wI81TszQ+HavXeXDYPqPnC9zC5eJQkah0vJVVXbWL9Q=;
	b=DJ1qTyTgkeR7n+pNt4DWNYhOSDkdGcMph4+kLGAz3OgW86Gm37jnQ7stvMzRvFA+TlkoH1
	7h09/X/letzl8KeGJBkvy11RkVzLkKHeLfNF7etZHLrJAFjFR4bn+u4J3e/FB2spkSuQy+
	YDva5y4axMRgl3ldXShve6MhPvrB4Wc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-kWH4YPPQNxymXrUZIOYojw-1; Thu, 30 Nov 2023 11:48:52 -0500
X-MC-Unique: kWH4YPPQNxymXrUZIOYojw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50bc7296f75so1393130e87.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 08:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701362930; x=1701967730;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wI81TszQ+HavXeXDYPqPnC9zC5eJQkah0vJVVXbWL9Q=;
        b=hutvX1aXxSM6g6EOFCLAHOjazYzDh8SgUEqfdb7+inMz/kt7VMLavgFji15J/7/qh4
         7qcREg5xSgvgQBcgWgfJVXopOPK3+BF1gdAVnUvjkusFeVwnSnz/F3I+cu0w04cRGZha
         r1wTv/viRcgZrAltqgO8RVNBYswvtUd55jT4PIr0Ue3MLBvSzG/+mriBjVc2x8zvmeZR
         rtavwiGJoUjEvNo1booDNBwUnkUBqE28IZuMDoe2UjhPQcHntB5s5u2G7GlwhHacScan
         4UAw70xHSj7iidMWBwULy5PiDHyCbHODIX1zLtE75vZCQBgWb2egZ4oJbohcthJSGKs5
         FvfA==
X-Gm-Message-State: AOJu0YzMRNpsKneGkv5FRiLvk1RITIOf9OFdr1vbINWNKtn0E0fwizv0
	9R+VcFrMLHG/ZjAs8cCvDtDIoEWcUZugmI0XwiEiTrSmfwo8hKtyC2n1+FtDr7zidcCVFceed7O
	+iX26dSOVY7fup/7vPPnW148kISYVF+fFhA==
X-Received: by 2002:a19:5511:0:b0:50b:ce10:f27b with SMTP id n17-20020a195511000000b0050bce10f27bmr9836lfe.22.1701362930404;
        Thu, 30 Nov 2023 08:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt5VLzdRHMWwfoz78n79Jjv1J/ksnTUOcY2uHEfV5/oooNR24dio4f81xNIhQQUnzfLiBQEg==
X-Received: by 2002:a2e:9784:0:b0:2c9:c192:43a9 with SMTP id y4-20020a2e9784000000b002c9c19243a9mr3511lji.28.1701362235390;
        Thu, 30 Nov 2023 08:37:15 -0800 (PST)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b0040b4c26d2dasm2536292wmq.32.2023.11.30.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 08:37:14 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Paolo
 Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>,
 kvm@vger.kernel.org
Subject: Re: arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates
 bits from constant value (1b009b becomes 9b)
In-Reply-To: <202311302231.sinLrAig-lkp@intel.com>
References: <202311302231.sinLrAig-lkp@intel.com>
Date: Thu, 30 Nov 2023 17:37:13 +0100
Message-ID: <87v89jmc3q.fsf@redhat.com>
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

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
> commit: a789aeba419647c44d7e7320de20fea037c211d0 KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"
> date:   1 year ago
> config: x86_64-randconfig-123-20231130 (https://download.01.org/0day-ci/archive/20231130/202311302231.sinLrAig-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302231.sinLrAig-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311302231.sinLrAig-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    arch/x86/kvm/vmx/hyperv.h:79:30: sparse: sparse: cast truncates bits from constant value (a000a becomes a)

This is what ROL16() macro does but the thing is: we actually want to
truncate bits by doing an explicit (u16) cast. We can probably replace
this with '& 0xffff':

#define ROL16(val, n) ((((u16)(val) << (n)) | ((u16)(val) >> (16 - (n)))) & 0xffff)

but honestly I don't see much point...

-- 
Vitaly

