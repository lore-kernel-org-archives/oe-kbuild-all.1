Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56FE2F2A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673624201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I700DdA5+87CqalrCgVe0wgjpImXv87ud6g5vJ4qa4U=;
	b=fK781gknjMuN3ARir6oGVWUAcw2kO1ioruy9y3dzYAESKOKWzdxTgwipaBhNzTwiLj+kQR
	O18xsh0KbwR452TFVa3coDfg9g4/MlCiXZPPscHH2h9pLgAGsD/ZIlUAe+yzuLQo3/nQ4Y
	BvVpQEW6Smn+qoK1BkIsL/chtJR31r4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-EXmurzFkN9-Q7fv5U8OjOg-1; Fri, 13 Jan 2023 10:36:40 -0500
X-MC-Unique: EXmurzFkN9-Q7fv5U8OjOg-1
Received: by mail-vs1-f71.google.com with SMTP id u62-20020a676041000000b003c36eda854fso5314174vsb.22
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 07:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I700DdA5+87CqalrCgVe0wgjpImXv87ud6g5vJ4qa4U=;
        b=nVKTop7W7E4bSE+K50xcu7CqL5+yevLtII40ragGWMmHyxc6U8S/A6yg5gldfBOJ/5
         BHeDKzzqjCQPVKX1Ti32aO/GVavEdzRoB5lDfYgCyUlmoqh280XlSEhPCPnmO37hcyR8
         H9NxpDlEQQoSxxssni5aArTqw569FIRQM2tSkiyGZWqiMrUHktEwy0ZvoDGgW8ZyQdwe
         WcmJGdEyJVIQUTyNbr6f73N2QclJTSMe6ClQeK4BAwJ8XqiNQux48OiQGdWn9BoIIgGZ
         zeKp6ZW7N6MDiSelesn85Ua9wXzxg04QnnXiWTapLBYfme8Ww+MGmvfw0iVE0kIKQrnK
         Tlhw==
X-Gm-Message-State: AFqh2krs2AGsdb0JmO+J3/zQRSp8hlp0wF9SyoXXveNzXFUVX8L2SaN3
	FHhE3dmgJ1MkZTClpoIIaO14IsYki6OX7OX5YalGaNYK7hdHPBJ8A7GTpzUMSmqJZcOr0kqE0f1
	QlBaUbTLF8irGrmyFzb2kBhoSmeQ4iyM9p7sTdnOqKA==
X-Received: by 2002:a05:6122:e20:b0:3dd:f386:1bca with SMTP id bk32-20020a0561220e2000b003ddf3861bcamr108729vkb.33.1673624199262;
        Fri, 13 Jan 2023 07:36:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsTcquavVHh2LGJon70r35hTGFJQHVvioXxV5viax0L+CXfJlSCxa4WETUFcgzBaSXMtuGTn7XNGrboTMumTbM=
X-Received: by 2002:a05:6122:e20:b0:3dd:f386:1bca with SMTP id
 bk32-20020a0561220e2000b003ddf3861bcamr108726vkb.33.1673624199039; Fri, 13
 Jan 2023 07:36:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301062107.EPkAEoe2-lkp@intel.com>
In-Reply-To: <202301062107.EPkAEoe2-lkp@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Jan 2023 16:36:27 +0100
Message-ID: <CABgObfZQC3qaiKqLifcfiPoRPrqti3A16G-hyvmFW2F3TvFNnA@mail.gmail.com>
Subject: Re: [kvm:queue 121/153] arch/arm64/kvm/arm.c:2211: warning: expecting
 prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead
To: kernel test robot <lkp@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	kvm@vger.kernel.org, Robert Hu <robert.hu@intel.com>, 
	Farrah Chen <farrah.chen@intel.com>, Danmei Wei <danmei.wei@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 2:52 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> head:   91dc252b0dbb6879e4067f614df1e397fec532a1
> commit: db139c0c865d775b19709cc4671e2e611815e575 [121/153] KVM: arm64: Do arm/arch initialization without bouncing through kvm_init()
> config: arm64-randconfig-r022-20230106
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=db139c0c865d775b19709cc4671e2e611815e575
>         git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
>         git fetch --no-tags kvm queue
>         git checkout db139c0c865d775b19709cc4671e2e611815e575
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/ drivers/gpu/drm/mxsfb/ drivers/gpu/drm/udl/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    arch/arm64/kvm/arm.c:133: warning: Function parameter or member 'type' not described in 'kvm_arch_init_vm'
>    arch/arm64/kvm/arm.c:1933: warning: expecting prototype for Inits Hyp(). Prototype was for init_hyp_mode() instead
> >> arch/arm64/kvm/arm.c:2211: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead

Ok, this is just a "/**" comment where one ought to have just "/*" instead.

Paolo

