Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C89200BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 22:01:57 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-568a8704f6dso33020727b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685484116; x=1688076116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+70iR5+ost5c3nu5SGwNZ7ykHicGblcBa8JIvdtRIY=;
        b=VfFGknckRTqc22nrW6VvlOQfbD2l5hVMnw493TP+Ncf6mKjnv5cszKN8BbsRYxczGQ
         sV1B9VbTof7zdRQlDavEQlhPxDQOIah0FU9tlEKTC5ghnda5eAzsnrMh1SQVnKJrd3oG
         eH6VZfhEQGO77rL+m+dTgp9eke0uNJIc4JqrVka8Gg46MJ9UHS9Q34CQl64L4TF8Wfv/
         iAZ8kXVC52og2f+dqYAcnIXDk3cAaE+5GCxFEuVs6YtjQ0SEqMLNXAdBvbZjXlvQBcPO
         RpDtv/LhCsxRP3OFCxyCwY6kf7ONn5JyY+++MhcaMJ41paGDvbMwMW4iDdgOqTqSRU+L
         ktMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685484116; x=1688076116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+70iR5+ost5c3nu5SGwNZ7ykHicGblcBa8JIvdtRIY=;
        b=MZix/RuZO3Ftp81DH9fwSw8FuLZS2daLSOuByWabgB8GkKtGozCvG5xco5+pzIxIkN
         ONMLks7PNihSGw2CF5Lj/3WdONp6lCebrB3of7m73QYn3KZ4PYMsH9JTtfx5ZwJFIYiZ
         bJ45jt167eZb6OJ6UJIOifhXQj/DRB+M1en8m1tZcNH/rJRxevftkAf9LQqOVLJ562MG
         AcChNoPxThAQM4bx9Z/TGV6s2fkeoINdf2iNyHxIEs1zU5yHI7pG0J0UBIafIL5ierxC
         Tt1LVCCnZEi4hNZ1fG0mtWBH7hp84J1hnq0/DXAP4QMpKgA76v8HbVIzCKwyT5P4AuZ1
         KYbw==
X-Gm-Message-State: AC+VfDyr+dCgah3TJeG3zxMilC3UxE3tGgGpalkP7+Fubxg0FJtmUIis
	E3/wNgnnhvDCrDni3zEGBt+WoEUkZCI=
X-Google-Smtp-Source: ACHHUZ7x0Afrzk/CJpq5MxeMu3EOjZiV8ssfl1UB5mOcaeNDY4scT+VjXgSsBByYST/RaocUtRya8FQJvS0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a888:0:b0:55a:5aa0:ffe9 with SMTP id
 f130-20020a81a888000000b0055a5aa0ffe9mr2066566ywh.7.1685484116745; Tue, 30
 May 2023 15:01:56 -0700 (PDT)
Date: Tue, 30 May 2023 15:01:55 -0700
In-Reply-To: <202305302015.D8PglEU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202305302015.D8PglEU7-lkp@intel.com>
Message-ID: <ZHZyUxsezAz083lO@google.com>
Subject: Re: [kvm-x86:selftests 1/3] make[1]: *** No rule to make target
 'kselftest/kvm/x86_64/cpuid_test.c', needed by 'kselftest/kvm/x86_64/cpuid_test.o'.
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <lkp@intel.com>
Cc: Yu Zhang <yu.c.zhang@linux.intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, May 30, 2023, kernel test robot wrote:
> Hi Yu,
> 
> First bad commit (maybe != root cause):

Confirmed that reverting 954c9c3f96698f3af0c22f93a68e3905bc185458 makes the problem
go away.

> tree:   https://github.com/kvm-x86/linux selftests

In case it wasn't obvious, I applied and pushed this to kvm-x86/selftests but
hadn't yet merged it to kvm-x86/next.

> head:   a985a858acff64afaa5cf60e058357034cb14476
> commit: 954c9c3f96698f3af0c22f93a68e3905bc185458 [1/3] KVM: selftests: Add new CFLAGS to generate dependency files
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce:
>         # https://github.com/kvm-x86/linux/commit/954c9c3f96698f3af0c22f93a68e3905bc185458
>         git remote add kvm-x86 https://github.com/kvm-x86/linux
>         git fetch --no-tags kvm-x86 selftests
>         git checkout 954c9c3f96698f3af0c22f93a68e3905bc185458
>         make O=/tmp/kselftest headers
>         make O=/tmp/kselftest -C tools/testing/selftests
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305302015.D8PglEU7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    Makefile:89: *** Cannot find a vmlinux for VMLINUX_BTF at any of "vmlinux vmlinux ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
> >> make[1]: *** No rule to make target 'kselftest/kvm/x86_64/cpuid_test.c', needed by 'kselftest/kvm/x86_64/cpuid_test.o'.

Yu, 

Can you take a look and send v3?  I unfortunately don't have bandwidth to dig
into this.  I'll drop commit 954c9c3f96698f3af0c22f93a68e3905bc185458.
