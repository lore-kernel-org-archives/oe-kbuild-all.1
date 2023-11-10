Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9371BDCA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q8BhZNU4"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1cc252cbde2so20903325ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 06:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699627339; x=1700232139; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAE/2qCVfcZ3otx9bQAYIo/PNAUnkqGy0i3eyU52UyE=;
        b=q8BhZNU4pjW4gD4kSbCB/pUrFodoQgll0RAp1s+ucZd12DRm5dly6x80dGF6vx/nnT
         uh/M3mkwFNT4LYIYxpyJzLU5Gf4zVnjOEl3gBmz2nAxPtZ9gaU2Ax2WvTq2+Xq+xM76G
         Y/Uuvr9o7MJHngabsL1ceRg58RrIcLggt1is1+mC/MYO28zgZ4op3epF2Fgj38AEmMis
         7/vG5wYUF/UyyaIMqkQVtlKyo2eJbqRNBwIbTJkYw9sHf41BpVrbYw0JpHrY5n5iVykp
         CzGj/Bsw457z7WRRtjjwxDkN3SUBbF0Nqo5/ykOb2pmBkaI2CrsqTz0SGSvE0dS0KbeY
         /6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699627339; x=1700232139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAE/2qCVfcZ3otx9bQAYIo/PNAUnkqGy0i3eyU52UyE=;
        b=KPdZVq39wllWPylSp/Dz+g+wU5FkKqitkF303h41HfVQ9N46FiUPkBFeHDXJF6sv3j
         mT5b0jsUbCCjx7+b4aBWMjxRJfAT7LvPY7y6h1GRyDpNqtb1EQ7Dg9oWaG3iQ+m4PCLq
         o25vTtKiDr2abZ5yB+ZfYaMliZ2EqpfU7C/znt5YMV/LsEMKqHhyVABItqxDaQWx9d9J
         cQmcRcVPa+quU9vuErQb57hqubwdquN4/amGeUBtoqjP1zhO3vXrXWsEDDslf3mtj4vS
         FLGeJaHzgoSlA3XkL1N5QIi9EfvjEKvUkEjb5lL8cIh2ttGWbFbtSNcY9EzjCIZYmB5m
         qvOQ==
X-Gm-Message-State: AOJu0YxcsCj/sAWBGyQq95x6wDoRdxmMkwuAiOkQP6dnSwgD53blRV9l
	HR1hkM7RqTk08pJpfAQ1ABYYkTwtiCQ=
X-Google-Smtp-Source: AGHT+IHUyUglQQ5Iq6YcS3ieW5J3j76629QvUPSMq2rltNnXjeTxzedB/8Bki3safek88Mw4ogVSOLZO7Bk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:efc1:b0:1cc:2bd6:b54a with SMTP id
 ja1-20020a170902efc100b001cc2bd6b54amr1259976plb.10.1699627338829; Fri, 10
 Nov 2023 06:42:18 -0800 (PST)
Date: Fri, 10 Nov 2023 06:42:17 -0800
In-Reply-To: <202311100209.zIaZqZhg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <70c2a2277f57b804c715c5b4b4aa0b3561ed6a4f.1699383993.git.isaku.yamahata@intel.com>
 <202311100209.zIaZqZhg-lkp@intel.com>
Message-ID: <ZU5BSSg_AbJnec7j@google.com>
Subject: Re: [PATCH 2/2] KVM: X86: Add a capability to configure bus frequency
 for APIC timer
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <yujie.liu@intel.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	isaku.yamahata@gmail.com, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 10, 2023, kernel test robot wrote:
> Hi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on kvm/queue]
> [also build test ERROR on linus/master next-20231109]
> [cannot apply to mst-vhost/linux-next kvm/linux-next v6.6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/isaku-yamahata-intel-com/KVM-x86-Make-the-hardcoded-APIC-bus-frequency-vm-variable/20231108-032736
> base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
> patch link:    https://lore.kernel.org/r/70c2a2277f57b804c715c5b4b4aa0b3561ed6a4f.1699383993.git.isaku.yamahata%40intel.com
> patch subject: [PATCH 2/2] KVM: X86: Add a capability to configure bus frequency for APIC timer
> config: i386-buildonly-randconfig-002-20231109 (https://download.01.org/0day-ci/archive/20231110/202311100209.zIaZqZhg-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100209.zIaZqZhg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Closes: https://lore.kernel.org/r/202311100209.zIaZqZhg-lkp@intel.com/
> 
> All errors (this is a 32-bit build, new ones prefixed by >>):
> 
>    ld: arch/x86/kvm/x86.o: in function `kvm_vm_ioctl_enable_cap':
> >> x86.c:(.text+0x1265b): undefined reference to `__udivdi3'

Heh, this inscrutable error is due to 64-bit division on 32-bit kernels.

	u64 bus_frequency = cap->args[0];
	u64 bus_cycle_ns;

	if (!bus_frequency)
		return -EINVAL;

	bus_cycle_ns = 1000000000UL / bus_frequency;  <========

I don't see any reason to allow 64-bit values, e.g. Intel's CPUID 0x15 only
supports a 32-bit frequency in Hz.  I.e. just truncate it to a u32.
